package hoodles.morphe.patches.camscanner.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CamScanner",
        packageName = "com.intsig.camscanner",
        appIconColor = 0X19BCAA,
        targets = listOf(AppTarget("7.15.5.2604080000"))
    )
}