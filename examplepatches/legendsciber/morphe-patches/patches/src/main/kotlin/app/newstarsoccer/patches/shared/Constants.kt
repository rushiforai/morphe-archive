package app.newstarsoccer.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_NEWSTARSOCCER = Compatibility(
        name = "New Star Soccer",
        packageName = "com.newstargames.newstarsoccer",
        appIconColor = 0xEC2C24,
        targets = listOf(
            AppTarget(version = "4.34")
        )
    )
}
