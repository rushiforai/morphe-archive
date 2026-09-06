package app.xperia.patches.sony

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

private const val DEVICE = "Tested on Xperia 1 V (XQ-DQ54), LineageOS 23.2 / Android 16."

/** Sony "Camera" — the unified app shipped since the Xperia 1 VI; the same package keeps updating with newer models. */
val SONY_CAMERA = Compatibility(
    packageName = "jp.co.sony.mc.cameraapp",
    name = "Sony Camera",
    description = "Xperia 1 VI/VII camera app. Download the arm64-v8a nodpi APK from APKMirror: " +
            "https://www.apkmirror.com/apk/sony-mobile-communications/sony-camera-3/",
    apkFileType = ApkFileType.APK,
    targets = listOf(
        AppTarget(
            version = "1.0.2.A.0.8",
            minSdk = 35,
            description = "$DEVICE Newest on APKMirror (March 2026). " +
                    "https://www.apkmirror.com/apk/sony-mobile-communications/sony-camera-3/sony-camera-1-0-2-a-0-8-release/",
        ),
        AppTarget(
            version = "1.0.2.A.0.6",
            minSdk = 35,
            isExperimental = true,
            description = "Same 1.0.2 line, untested. " +
                    "https://www.apkmirror.com/apk/sony-mobile-communications/sony-camera-3/sony-camera-1-0-2-a-0-6-release/",
        ),
        AppTarget(
            version = null,
            isExperimental = true,
            description = "Any other version: untested; the patched methods are unobfuscated so newer builds should match.",
        ),
    ),
)

/** Sony "Photography Pro" — the Xperia 1 V's own camera app; 1.7.2.A.0.9 is the final release. */
val PHOTO_PRO = Compatibility(
    packageName = "com.sonymobile.photopro",
    name = "Photography Pro",
    description = "Sony Photo Pro (Xperia 1 II – 1 V). Download the arm64-v8a nodpi APK from APKMirror: " +
            "https://www.apkmirror.com/apk/sony-mobile-communications/sony-photography-pro/",
    apkFileType = ApkFileType.APK,
    targets = listOf(
        AppTarget(
            version = "1.7.2.A.0.9",
            minSdk = 34,
            description = "$DEVICE Final Photo Pro release (June 2025). " +
                    "https://www.apkmirror.com/apk/sony-mobile-communications/sony-photography-pro/sony-photography-pro-1-7-2-a-0-9-release/",
        ),
        AppTarget(
            version = null,
            isExperimental = true,
            description = "Older versions: the storage fix was verified down to 1.6.A.0.27 with the smali build.",
        ),
    ),
)
