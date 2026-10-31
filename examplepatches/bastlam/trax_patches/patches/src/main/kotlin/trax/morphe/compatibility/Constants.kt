package trax.morphe.compatibility

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Compat {
    val DUOLINGO = Compatibility(
        name = "Duolingo",
        packageName = "com.duolingo",
        appIconColor = 0x58CC02,
        targets = listOf(AppTarget("6.102.3"))
    )
}
