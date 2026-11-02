package app.stylus.patches.bitwarden.font

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.stylus.patches.bitwarden.shared.Constants.COMPATIBILITY_BITWARDEN
import java.io.File

private const val MONOSPACE_FONT_RESOURCE_NAME = "roboto_regular_mono"

private val allowedMonospaceFontExtensions = setOf("ttf", "otf")

private val customMonospaceFontFileOption = stringOption(
    key = "customMonospaceFontFile",
    default = null,
    title = "Custom monospace font",
    description = "The file path to your monospace font. Tap the file picker and select it. " +
        "The font must be in TTF or OTF format.",
    required = true,
)

@Suppress("unused")
val customMonospaceFontBitwardenPatch = resourcePatch(
    name = "Custom monospace font",
    description = "Replaces the bundled Roboto Mono font with your own monospace font.",
    default = false,
) {
    category("Font")

    compatibleWith(COMPATIBILITY_BITWARDEN)

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

        // Morphe Patcher 2.0.0 and newer decode resources on request instead of
        // up front, so decode the font directory before replacing the font.
        decode("res/font*")

        val fontResDir = get("res").resolve("font")
        val fontExtension = fontFile.extension.lowercase()

        // Keep the resource name so the app's Compose typography keeps
        // resolving it as the monospace font. Only remove a bundled file with
        // a different extension; replacing the same file in place avoids
        // deleting and re-adding the same entry.
        listOf("ttf", "otf")
            .filter { it != fontExtension }
            .forEach { extension ->
                val bundledFontFile = fontResDir.resolve("$MONOSPACE_FONT_RESOURCE_NAME.$extension")
                if (bundledFontFile.exists()) {
                    // Mark the bundled font for removal from the rebuilt APK.
                    delete("res/font/${bundledFontFile.name}")
                }
            }

        fontFile.copyTo(
            fontResDir.resolve("$MONOSPACE_FONT_RESOURCE_NAME.$fontExtension"),
            overwrite = true,
        )
    }
}
