package mightymich.morphe.patches.todolist.scheduleplanner.dailyplanner.todo.reminders

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object ToDoListCompatibility {
    val TODO_LIST = Compatibility(
        name = "To-Do List",
        packageName = "todolist.scheduleplanner.dailyplanner.todo.reminders",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "1.02.94.0925")
        )
    )
}
