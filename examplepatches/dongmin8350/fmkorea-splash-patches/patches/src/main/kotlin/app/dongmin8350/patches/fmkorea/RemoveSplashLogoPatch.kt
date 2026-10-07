package app.dongmin8350.patches.fmkorea

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.util.Base64

private val FMKOREA_COMPATIBILITY = Compatibility(
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
val removeFmkoreaSplashLogoPatch = resourcePatch(
    name = "Remove FMKorea splash logo",
    description = "Removes the large FM logo shown while FMKorea is starting.",
    default = false
) {
    compatibleWith(FMKOREA_COMPATIBILITY)

    execute {
        val drawableDirectories = get("res", false)
            .listFiles { file ->
                file.isDirectory && file.name.startsWith("drawable")
            }
            .orEmpty()

        val splashFiles = drawableDirectories
            .map { directory -> directory.resolve("splash.png") }
            .filter { file -> file.exists() }

        if (splashFiles.isEmpty()) {
            throw PatchException(
                "No res/drawable*/splash.png resource was found. " +
                    "FMKorea may have changed its splash-screen resources."
            )
        }

        val transparentPng = Base64.getDecoder().decode(TRANSPARENT_PNG_BASE64)
        splashFiles.forEach { splashFile ->
            splashFile.writeBytes(transparentPng)
        }
    }
}
