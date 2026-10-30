package io.github.jordanwoodson.patches.kick.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KICK = Compatibility(
        name = "Kick",
        packageName = "com.kick.mobile",
        // APKMirror ships it as a bundle. Manager only links to APKMirror/Uptodown when this matches.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x53FC18,
        // Original signing cert (apksigner "certificate SHA-256 digest"). bin/apk-add pins it.
        signatures = setOf("b12320227268c9c37e190b493120a7f6ce83c0e9a761f9213df677b58d095b73"),
        targets = listOf(
            // Latest stable on APKMirror on 2026-10-29. Update to the version you develop against.
            AppTarget(version = "40.33.0"),
        ),
    )

    /** The one Kick version the patches target, for messages. The version is written only in [COMPATIBILITY_KICK]. */
    val KICK_VERSION: String get() = "${COMPATIBILITY_KICK.targets.single().version}"
}
