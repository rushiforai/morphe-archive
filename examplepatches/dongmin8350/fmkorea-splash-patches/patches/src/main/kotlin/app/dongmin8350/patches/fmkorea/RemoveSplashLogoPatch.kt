package app.dongmin8350.patches.fmkorea

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.listDecodableFiles
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import java.util.Base64

internal val FMKOREA_COMPATIBILITY = Compatibility(
    name = "FMKorea",
    packageName = "com.fmkorea.m.fmk",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x3F6FD8,
    targets = listOf(
        AppTarget(version = "17.4"),
        AppTarget(version = null)
    )
)

private const val TRANSPARENT_PNG_BASE64 =
    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR4nGNgYGBgAAAABQABpfZFQAAAAABJRU5ErkJggg=="

@Suppress("unused")
val removeFmkoreaSplashLogoPatch = patch(
    name = "Remove FMKorea splash logo",
    description = "Removes the large FM logo shown while FMKorea is starting.",
    default = false
) {
    compatibleWith(FMKOREA_COMPATIBILITY)

    execute {
        // Morphe Patcher 2.x decodes resources only on demand, so walking res/
        // no longer discovers APK entries that have not been staged yet.
        // Query the APK resource table directly instead.
        val splashPaths = listDecodableFiles("res/**/splash.png")
            .filter { path -> path.startsWith("res/drawable") }

        if (splashPaths.isEmpty()) {
            throw PatchException(
                "No drawable splash.png resource was found. " +
                    "FMKorea may have changed its splash-screen resources."
            )
        }

        val transparentPng = Base64.getDecoder().decode(TRANSPARENT_PNG_BASE64)
        splashPaths.forEach { path ->
            resourceFile(path).writeBytes(transparentPng)
        }
    }
}
