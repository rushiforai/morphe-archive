package app.roboroads.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    private const val DISCOVERYPLUS_FIRETV_22_0_0_67_APK_URL =
        "https://www.apkmirror.com/apk/discovery-communications/" +
            "discovery-stream-tv-shows-originals-and-more-fire-tv/" +
            "discovery-stream-tv-shows-originals-and-more-fire-tv-android-tv-22-0-0-67-release/"

    val COMPATIBILITY_DISCOVERYPLUS_FIRETV = Compatibility(
        name = "Discovery Plus", // App name as it appears in the Android launcher.
        packageName = "com.discovery.discoveryplus.firetv",
        description = "Fire TV app. Download the APK from APKMirror: $DISCOVERYPLUS_FIRETV_22_0_0_67_APK_URL",
        apkFileType = ApkFileType.APK,
        formFactor = FormFactor.TV,
        targets = listOf(
            AppTarget(
                version = "22.0.0.67",
                versionCodes = mapOf(SupportedAbi.ARMEABI_V7A to 1722000067),
                description = "APKMirror: $DISCOVERYPLUS_FIRETV_22_0_0_67_APK_URL",
            )
        )
    )
}
