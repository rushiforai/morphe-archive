package app.spotify.capture.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SPOTIFY = Compatibility(
        name = "Spotify",
        packageName = "com.spotify.music",
        description = "Allow internal audio capture for RootlessJamesDSP",
        apkFileType = ApkFileType.APK,
        // Spotify green (#1ED760); Morphe validates 0xRRGGBB (no alpha channel).
        appIconColor = 0x1ED760,
        targets = listOf(
            AppTarget(
                version = "9.1.88.2204",
                versionCode = 146_816_068,
                // Capture QA done 2026-10-09: patch applies but RLJDSP capture stays silent —
                // playback is AAudio-only (liborbit-jni-spotify.so sets capture policy natively).
                description = "Patch verified applying on Pixel 8a (Android 17); capture remains silent, see README",
            ),
            AppTarget(
                version = null,
                isExperimental = true,
                description = "Other Spotify versions may work if setAllowedCapturePolicy is still present",
            ),
        ),
    )
}
