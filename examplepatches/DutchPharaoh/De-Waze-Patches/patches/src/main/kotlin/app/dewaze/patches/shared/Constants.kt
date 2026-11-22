package app.dewaze.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * The extension uses obfuscated Waze names that were checked against 5.27.4.900 only.
     * Re-check them (see the "Obfuscated names" regions in the extension) before adding another version.
     */
    val COMPATIBILITY_WAZE = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x33CCFF,
        targets = listOf(
            AppTarget(version = "5.27.4.900"),
        ),
    )
}
