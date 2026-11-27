package arpit.morphe.patches.targapp.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TARGAPP = Compatibility(
        name = "Targapp",
        packageName = "org.jbarrel.targapp",
        // APKPure distributes Targapp as an APKS split container
        // (base + config.arm64_v8a + en/it + xxhdpi); the base APK alone is not installable.
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x0D1B2A,
        targets = listOf(
            AppTarget(
                // Manifest versionName of the APKS bundle (versionCode 80).
                version = "4.10.0"
            )
        )
    )
}
