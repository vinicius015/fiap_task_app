import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/repository/task_group_repository.dart';

class TaskGroupProvider extends ChangeNotifier {
  final taskGroupRepo = TaskGroupRepository();

  bool _isLoading = false;
  List<TaskGroup> _taskGroups = [];

  bool get isLoading => _isLoading;
  List<TaskGroup> get taskGroups => _taskGroups;

  Future<void> listTaskGroups() async {
    _isLoading = true;
    notifyListeners();
    
    _taskGroups = await taskGroupRepo.listTaskGroups();
    
    _isLoading = false;
    notifyListeners();
  }
}