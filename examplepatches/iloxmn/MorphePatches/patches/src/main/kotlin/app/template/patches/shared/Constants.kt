package app.template.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_DUOLINGO = Compatibility(
        name = "Duolingo",
        packageName = "com.duolingo",
        targets = listOf(
            AppTarget(
                version = "6.105"
            )
        )
    )
}
