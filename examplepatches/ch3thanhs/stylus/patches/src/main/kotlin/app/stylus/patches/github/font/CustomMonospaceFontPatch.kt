package app.stylus.patches.github.font

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.stylus.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import java.io.File

private val allowedMonospaceFontExtensions = setOf("ttf", "otf")

private val customMonospaceFontFileOption = stringOption(
    key = "customMonospaceFontFile",
    default = null,
    title = "Custom monospace font",
    description = "The file path to your monospace font file. Tap the file picker and select it. " +
        "The font file must be in TTF or OTF format.",
    required = true,
)

@Suppress("unused")
val customMonospaceFontGithubPatch = resourcePatch(
    name = "Custom monospace font (GitHub)",
    description = "Replaces GitHub's bundled Roboto Mono code font with a custom monospace font file.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GITHUB)

    customMonospaceFontFileOption()

    val customMonospaceFontPath by customMonospaceFontFileOption

    execute {
        val path = customMonospaceFontPath?.trim()
            ?: throw PatchException("No custom monospace font was provided.")

        val fontFile = File(path)
        if (!fontFile.exists())
            throw PatchException("Custom monospace font file not found: ${fontFile.absolutePath}")

        if (!fontFile.isFile)
            throw PatchException("Custom monospace font path must be a file, not a folder: ${fontFile.absolutePath}")

        if (fontFile.extension.lowercase() !in allowedMonospaceFontExtensions)
            throw PatchException(
                "Unsupported monospace font format '${fontFile.extension}'. " +
                    "Use one of: ${allowedMonospaceFontExtensions.joinToString(", ") { ".${it}" }}."
            )

        val fontResDir = get("res").resolve("font")
        val fontExtension = fontFile.extension.lowercase()

        listOf("ttf", "otf").forEach { extension ->
            fontResDir.resolve("roboto_mono_regular.$extension").delete()
        }
        fontFile.copyTo(
            fontResDir.resolve("roboto_mono_regular.$fontExtension"),
            overwrite = true,
        )

        val webviewResDir = get("assets").resolve("webview")
        listOf("colors_light.css", "colors_dark.css").forEach { fileName ->
            val cssFile = webviewResDir.resolve(fileName)
            val originalCss = cssFile.readText()
            val patchedCss = originalCss.replace(
                "--code-font: ui-monospace, Menlo, monospace;",
                "--code-font: custom-monospace;",
            )

            if (patchedCss == originalCss) {
                throw PatchException("Could not find the WebView code font declaration in $fileName.")
            }

            cssFile.writeText(
                """@font-face {
    font-family: custom-monospace;
    src: url("/android_res/font/roboto_mono_regular.$fontExtension");
}

$patchedCss"""
            )
        }
    }
}