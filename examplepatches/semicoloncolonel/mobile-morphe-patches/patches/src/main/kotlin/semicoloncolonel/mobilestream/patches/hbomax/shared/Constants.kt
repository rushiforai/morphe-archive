package semicoloncolonel.mobilestream.patches.hbomax.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

private const val PHONE_VERSION = "22.0.0.321"
private const val TV_VERSION = "22.0.0.36"

// The phone build needs Android 12L. Morphe Manager leaves out versions the
// device cannot install, so declaring it makes Manager suggest the Android TV
// build on Android TV devices that run Android 11 or earlier, such as the
// NVIDIA Shield, instead of the newer-numbered phone build.
private const val PHONE_MIN_SDK = 32

object Constants {
    // The phone and Android TV builds share the package name but not the version.
    val COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.hbomax",
        description = "The HBO Max app, for phones (version $PHONE_VERSION) and Android TV (version $TV_VERSION).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(
            AppTarget(version = PHONE_VERSION, versionCode = 1800026515, minSdk = PHONE_MIN_SDK, description = "Phone build"),
            AppTarget(version = TV_VERSION, versionCode = 1842000036, minSdk = 29, description = "Android TV build"),
        )
    )

    // For patches that only apply to the phone build, such as the sign-in
    // screen, which the Android TV build does not have.
    val PHONE_COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.hbomax",
        description = "The HBO Max phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(AppTarget(version = PHONE_VERSION, versionCode = 1800026515, minSdk = PHONE_MIN_SDK, description = "Phone build"))
    )

    // The package name the Play Store installs. Google Play delivers both the
    // phone build and the Android TV build under it (checked 2026-11-08).
    val STREAM_COMPATIBILITY = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.stream",
        description = "The HBO Max app as the Play Store installs it, for phones (version $PHONE_VERSION) and Android TV (version $TV_VERSION).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002BE7,
        targets = listOf(
            AppTarget(version = PHONE_VERSION, versionCode = 1800026515, minSdk = PHONE_MIN_SDK, description = "Phone build"),
            AppTarget(version = TV_VERSION, versionCode = 1842000036, minSdk = 29, description = "Android TV build"),
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
        targets = listOf(AppTarget(version = PHONE_VERSION, versionCode = 1800026515, minSdk = PHONE_MIN_SDK, description = "Phone build"))
    )
}
