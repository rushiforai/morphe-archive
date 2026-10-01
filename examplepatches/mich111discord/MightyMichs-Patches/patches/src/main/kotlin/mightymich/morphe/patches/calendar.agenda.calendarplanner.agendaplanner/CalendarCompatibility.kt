package mightymich.morphe.patches.calendar.agenda.calendarplanner.agendaplanner

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object CalendarCompatibility {
    val CALENDAR = Compatibility(
        name = "Calendar",
        packageName = "calendar.agenda.calendarplanner.agendaplanner",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(version = "2.07.34.0918")
        )
    )
}
