package app.fluffy.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Scene pins the two versions the unlock was verified on. After an update,
    // confirm the three targets still exist (see docs/scene/README.md) and add
    // the new version string here.
    val COMPATIBILITY_SCENE = Compatibility(
        name = "Scene",
        packageName = "com.omarea.vtools",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00BCD4,
        targets = listOf(
            AppTarget(version = "N1 2026.10 Alpha13"),
            AppTarget(version = "N1 2026.11 PreRelease 1"),
            AppTarget(version = "N1 2026.11 PreRelease 2"),
        ),
    )


    val COMPATIBILITY_MDPROXY = Compatibility(
        name = "MD PROXY VPN",
        packageName = "com.vpnproxymd.mdproxyvpn",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00C853,
        targets = listOf(
            AppTarget(version = "v1.0.8.8"),
        ),
    )

    val COMPATIBILITY_WAYPOINT = Compatibility(
        name = "Waypoint",
        packageName = "com.greycastel.waypoint",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4C8BF5,
        targets = listOf(
            AppTarget(
                version = "1.10.1",
            ),
        ),
    )
}
