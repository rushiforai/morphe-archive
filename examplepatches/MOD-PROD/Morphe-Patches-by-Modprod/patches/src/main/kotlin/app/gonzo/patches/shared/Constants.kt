package app.gonzo.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    const val TIZENTUBE_PACKAGE = "io.gh.reisxd.tizentube.cobalt"

    /**
     * TizenTube Cobalt: a standalone Cobalt (Chrobalt) build that runs the TizenTube
     * userscript on Android TV. It is NOT a modified copy of YouTube for Android TV.
     *
     * Every patch in this bundle is pinned to 2.0.3 only. Shipped as a single APK
     * (cobalt-arm.apk / cobalt-arm64.apk on the GitHub releases), not a split bundle.
     */
    val COMPATIBILITY_TIZENTUBE = Compatibility(
        name = "TizenTube", // Name shown by the Android launcher.
        packageName = TIZENTUBE_PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0000, // YouTube red, used for the app card in Morphe Manager.
        targets = listOf(
            AppTarget(version = "2.0.3"),
        ),
    )

}
