package app.zdrgon.patches.callrecorder.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CALL_RECORDER = Compatibility(
        name = "Call Recorder",
        packageName = "org.skvalex.cr",
        appIconColor = 0x689F38,
        targets = listOf(
            AppTarget(version = "3.6.9", isExperimental = true)
        )
    )
}
