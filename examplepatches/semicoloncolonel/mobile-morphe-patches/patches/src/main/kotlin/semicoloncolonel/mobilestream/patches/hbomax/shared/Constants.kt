package semicoloncolonel.mobilestream.patches.hbomax.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

private const val PHONE_VERSION = "22.0.0.321"

// On dev only until it is released on main.
private val NEXT_PHONE_TARGET = devTarget("22.1.0.340", versionCode = 1800027770, minSdk = PHONE_MIN_SDK, description = "Phone build")

// The phone build needs Android 12L. Morphe Manager leaves out versions the
// device cannot install.
private const val PHONE_MIN_SDK = 32

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.hbomax",
        description = "The HBO Max phone app (version $PHONE_VERSION).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(
            NEXT_PHONE_TARGET,
            AppTarget(version = PHONE_VERSION, versionCode = 1800026515, minSdk = PHONE_MIN_SDK, description = "Phone build"),
            AppTarget(version = "7.14.0.530", versionCode = 1800025444, description = "Phone build"),
        )
    )

    // For patches that apply to the current phone builds only, such as the
    // sign-in screen.
    val PHONE_COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.hbomax",
        description = "The HBO Max phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(NEXT_PHONE_TARGET, AppTarget(version = PHONE_VERSION, versionCode = 1800026515, minSdk = PHONE_MIN_SDK, description = "Phone build"), AppTarget(version = "7.14.0.530", versionCode = 1800025444, description = "Phone build"))
    )

    // The package name the Play Store installs (checked 2026-11-08).
    val STREAM_COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.stream",
        description = "The HBO Max phone app as the Play Store installs it (version $PHONE_VERSION).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(
            NEXT_PHONE_TARGET,
            AppTarget(version = PHONE_VERSION, versionCode = 1800026515, minSdk = PHONE_MIN_SDK, description = "Phone build"),
        )
    )

    // The phone build under the Play Store's package name, for patches that only
    // apply to the phone build.
    val STREAM_PHONE_COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.stream",
        description = "The HBO Max phone app as the Play Store installs it (version $PHONE_VERSION).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(NEXT_PHONE_TARGET, AppTarget(version = PHONE_VERSION, versionCode = 1800026515, minSdk = PHONE_MIN_SDK, description = "Phone build"))
    )
}
