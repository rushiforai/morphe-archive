package app.archivetune.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * IMPORTANT: Do not change the package name or version code of the patched app.
     * ArchiveTune's "gatekeeper" sends both to its server before allowing network access.
     */
    val COMPATIBILITY_ARCHIVETUNE = Compatibility(
        name = "ArchiveTune",
        packageName = "moe.rukamori.archivetune",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6750A4,
        targets = listOf(
            // Version the fingerprints were written against (from source, not from the APK).
            // Newer versions: add them above this line (newest first) once confirmed working.
            // ArchiveTune builds with -dontobfuscate, so anchors are likely stable across versions.
            AppTarget(version = "15.1.0"),
        ),
    )
}
