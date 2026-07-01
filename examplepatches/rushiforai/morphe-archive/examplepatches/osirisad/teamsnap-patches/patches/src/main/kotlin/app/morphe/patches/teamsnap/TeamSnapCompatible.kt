package app.morphe.patches.teamsnap

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val TEAMSNAP_COMPATIBILITY = Compatibility(
    name = "TeamSnap",
    packageName = "com.teamsnap.teamsnap",
    targets = listOf(AppTarget(version = "7.63.0"))
)
