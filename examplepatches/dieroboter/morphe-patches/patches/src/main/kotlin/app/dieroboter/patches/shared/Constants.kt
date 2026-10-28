package app.dieroboter.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Shared compatibility declarations, one per app.
 * Add a new entry here when patches for another app are added to this bundle.
 */
object Constants {
    val COMPATIBILITY_WIFI_FTP_SERVER = Compatibility(
        name = "WiFi FTP Server",
        packageName = "com.medhaapps.wififtpserver",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1C9CEC,
        targets = listOf(
            AppTarget(
                version = "2.4.0"
            )
        )
    )

    val COMPATIBILITY_VIDEO_TO_GIF = Compatibility(
        name = "GIF Maker",
        packageName = "com.bk.videotogif",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "2.0.8"
            )
        )
    )

    val COMPATIBILITY_GEOMETRY_DASH_MELTDOWN = Compatibility(
        name = "Geometry Dash Meltdown",
        packageName = "com.robtopx.geometrydashmeltdown",
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(
                version = "2.2.148"
            )
        )
    )

    val COMPATIBILITY_GEOMETRY_DASH_SUBZERO = Compatibility(
        name = "Geometry Dash SubZero",
        packageName = "com.robtopx.geometrydashsubzero",
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(
                version = "2.2.148"
            )
        )
    )

    val COMPATIBILITY_GEOMETRY_DASH_WORLD = Compatibility(
        name = "Geometry Dash World",
        packageName = "com.robtopx.geometrydashworld",
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(
                version = "2.2.148"
            )
        )
    )

    val COMPATIBILITY_FLAPPY_BIRD = Compatibility(
        name = "Flappy Bird",
        packageName = "com.dotgears.flappybird",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "1.3"
            )
        )
    )

    val COMPATIBILITY_KLONDIKE = Compatibility(
        name = "Solitaire",
        packageName = "com.smilerlee.klondike",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "5.9"
            )
        )
    )

    val COMPATIBILITY_FILE_MANAGER = Compatibility(
        name = "File Manager",
        packageName = "com.alphainventor.filemanager",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "3.8.3"
            )
        )
    )

    val COMPATIBILITY_MEDIAINFO = Compatibility(
        name = "MediaInfo",
        packageName = "net.mediaarea.mediainfo",
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(
                version = "26.10"
            )
        )
    )
}
