package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_EXAMPLE = Compatibility(
        name = "XYZ app", // App name as it appears in the Android launcher.
        packageName = "com.example.app",
        apkFileType = ApkFileType.APK, // Preferred or recommended file type.
        appIconColor = 0xFF0045, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // "version = null" means the patch works with the latest app target
            // and is expected to work with all future app targets.
            //
            // It is highly recommended to always include the exact app version developed
            // your patches for or the last version you have confirmed as 100% working.
            //
            // It is highly preferred to use app versions that are
            // available on apkmirror.com or uptodown.com, as Morphe web-search will
            // redirect users to these sites. If an app version is not available
            // on ApkMirror or UpToDown, then the user will be sent to Google search.
            AppTarget(
                version = "2.0.0"
            ),
            AppTarget(
                version = "1.0.2"
            )
        )
    )

    val COMPATIBILITY_EXAMPLE_2 = Compatibility(
        name = "XYZ app",
        packageName = "com.example.app",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00FF45, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // 'any' version supported experimentally.
            AppTarget(
                version = null,
                isExperimental = true
            ),
            // App version confirmed 100% working.
            AppTarget(
                version = "1.0.2"
            )
        )
    )

    // Version code restriction.
    // Required for certain apps that can have multiple architecture releases with the same
    // version name (1.0.1) but different version codes (584009457).
    val COMPATIBILITY_EXAMPLE_3 = Compatibility(
        name = "XYZ app",
        packageName = "com.example.app",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00FF45,
        targets = listOf(
            AppTarget(
                version = "1.0.5",
                // Required version code. If the user tries to patch a different version code
                // then Manager will warn they have the wrong original apk/apkm.
                //
                // This declaration is only required when multiple architecture releases have the
                // same version code but only 1 specific version code works or has been well tested.
                // If there is only 1 release for each architecture file type, then it's best
                // not to declare this.

                versionCode = 584009457,
            )
        )
    )

    val STICKER_MAKER_COMPATIBILITY = Compatibility(
        name = "Sticker Maker",
        packageName = "com.marsvard.stickermakerforwhatsapp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50, // A nice green color
        targets = listOf(
            AppTarget(
                version = null,
            ),
            AppTarget(
                version = "1.0.10-5",
                versionCode = 1001005,

            )
        )
    )

    val MALAYALAM_KEYBOARD_COMPATIBILITY = Compatibility(
        name = "Manglish Keyboard",
        packageName = "com.clusterdev.malayalamkeyboard",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(
                version = null,
            ),
            AppTarget(
                version = "10.1.0",
            )
        )
    )

    val CANDYLINK_VPN_COMPATIBILITY = Compatibility(
        name = "CandyLink VPN",
        packageName = "com.candylink.openvpn",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(
                version = null,
            ),
            AppTarget(
                version = "4.0.2",
            )
        )
    )

    val MELON_VPN_COMPATIBILITY = Compatibility(
        name = "Melon VPN",
        packageName = "com.vpnbottle.melon.free.unblock.fast.vpn",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        targets = listOf(
            AppTarget(
                version = null,
            ),
            AppTarget(
                version = "8.0.527",
                versionCode = 80527
            )
        )
    )

    val APK_SIGNER_COMPATIBILITY = Compatibility(
        name = "apk-signer",
        packageName = "com.haibison.apksigner",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFFFFF,
        targets = listOf(
            AppTarget(
                version = null,
            ),
            AppTarget(
                version = "7.3.13",
                versionCode = 123
            )
        )
    )

    val FOOTEJ_COMPATIBILITY = Compatibility(
        name = "Footej Camera",
        packageName = "com.footej.camera",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x008D85,
        targets = listOf(
            AppTarget(
                version = "2.4.1 build 202",
                versionCode = 20202,
            )
        )
    )
    val MVIDEO_COMPATIBILITY = Compatibility(
        name = "Mvideo",
        packageName = "music.videomaker.slideshow",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x7DFD91,
        targets = listOf(
            AppTarget(
                version = "1.0.11515",
                versionCode = 11515,
            )
        )
    )

    val BEATLY_COMPATIBILITY = Compatibility(
        name = "Beat.ly",
        packageName = "vinkle.video.editor",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0B0217,
        targets = listOf(
            AppTarget(
                version = "2.46.10897",
                versionCode = 10897,
            )
        )
    )
    val REVERSO_COMPATIBILITY = Compatibility(
        name = "Reverso Context",
        packageName = "com.softissimo.reverso.context",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF8FBFF,
        targets = listOf(
            AppTarget(
                version = "16.1.0",
                versionCode = 12000096
            )
        )
    )

    val FFPMPEG_COMPATIBILITY = Compatibility(
        name = "FFmpeg Media Encoder",
        packageName = "com.silentlexx.ffmpeggui",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00C300,
        targets = listOf(
            AppTarget(
                version = "6.1.3_1",
                versionCode = 6131
            )
        )
    )

    val VIDMA_COMPATIBILITY = Compatibility(
        name = "Vidma",
        packageName = "vidma.video.editor.videomaker",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1C1C1C,
        targets = listOf(
            AppTarget(
                version = "2.11.5",
                versionCode = 20110501
            )
        )
    )

    val VIDEO_COMPATIBILITY = Compatibility(
        name = "Video to MP3",
        packageName = "mp3videoconverter.videotomp3.videotomp3converter",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xCE2492,
        targets = listOf(
            AppTarget(
                version = "2.2.7.1",
                versionCode = 227100
            )
        )
    )
}
