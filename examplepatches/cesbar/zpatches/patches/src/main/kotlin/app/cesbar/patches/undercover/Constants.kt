package app.cesbar.patches.undercover

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Undercover",
        packageName = "com.yanstarstudio.joss.undercover",
        appIconColor = 0xB2FF4B,
        targets = listOf(AppTarget("5.0.1"))
    )
}