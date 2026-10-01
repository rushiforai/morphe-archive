package app.riky.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Chefkoch: https://apkpure.net/chefkoch/de.pixelhouse
    val COMPATIBILITY_CHEFKOCH = Compatibility(
        name = "Chefkoch",
        packageName = "de.pixelhouse",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xE30613,
        targets = listOf(
            AppTarget(version = "8.4.0"),
        )
    )
}
