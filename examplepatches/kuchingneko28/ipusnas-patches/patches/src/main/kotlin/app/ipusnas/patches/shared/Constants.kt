package app.ipusnas.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * iPusnas is a split-APK app distributed through the Play Store and
     * mirrored on apkmirror.com / uptodown.com. Patch the base APK and
     * install it together with the architecture/language split APKs.
     */
    val COMPATIBILITY_IPUSNAS = Compatibility(
        name = "iPusnas", // App name as it appears in the Android launcher.
        packageName = "mam.reader.ipusnas",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1D6BA8, // Icon color in Morphe Manager.
        targets = listOf(
            AppTarget(version = "2.1.4")
        )
    )
}
