package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SPOTIFY = Compatibility(
        name = "Spotify",
        packageName = "com.spotify.music",
        // Must match the file type you download from APKMirror. Change to ApkFileType.APKM
        // if the Spotify release you use is only offered as a bundle.
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1ED760,
        targets = listOf(
            // TODO: once you have confirmed it works, add the exact version you patched, e.g.
            // AppTarget(version = "9.0.xx.xxx"),
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
