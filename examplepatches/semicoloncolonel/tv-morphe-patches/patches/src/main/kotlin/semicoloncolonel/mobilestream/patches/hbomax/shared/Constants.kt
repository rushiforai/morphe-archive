package semicoloncolonel.mobilestream.patches.hbomax.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

private const val TV_VERSION = "22.0.0.36"

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.hbomax",
        description = "The HBO Max app (version $TV_VERSION).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(
            AppTarget(version = TV_VERSION, versionCode = 1842000036, minSdk = 29),
        ),
        formFactor = FormFactor.TV,
    )

    // The package name the Play Store installs. Google Play delivers both the
    // phone build and the Android TV build under it (checked 2026-11-08).
    val STREAM_COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.stream",
        description = "The HBO Max app as the Play Store installs it (version $TV_VERSION).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(
            AppTarget(version = TV_VERSION, versionCode = 1842000036, minSdk = 29),
        ),
        formFactor = FormFactor.TV,
    )
}
