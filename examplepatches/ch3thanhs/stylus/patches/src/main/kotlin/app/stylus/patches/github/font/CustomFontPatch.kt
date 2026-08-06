package app.stylus.patches.github.font

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.stylus.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import java.io.File

private val allowedFontExtensions = setOf("ttf", "otf")

private data class UiFontTarget(
    val resourceName: String,
    val fontWeight: Int,
    val fontStyle: String,
)

private data class FontFamilyResource(
    val resourceName: String,
    val entries: List<UiFontTarget>,
)

private val FONT_FAMILIES = listOf(
    FontFamilyResource(
        resourceName = "inter",
        entries = listOf(
            UiFontTarget("inter_regular", 400, "normal"),
            UiFontTarget("inter_italic", 400, "italic"),
            UiFontTarget("inter_bold", 700, "normal"),
            UiFontTarget("inter_medium", 500, "normal"),
            UiFontTarget("inter_medium_italic", 500, "italic"),
            UiFontTarget("inter_semibold", 600, "normal"),
            UiFontTarget("inter_semibold_italic", 600, "italic"),
        ),
    ),
    FontFamilyResource(
        resourceName = "monasans",
        entries = listOf(
            UiFontTarget("monasans_regular", 400, "normal"),
            UiFontTarget("monasans_semibold", 600, "normal"),
        ),
    ),
)

private fun buildSingleFontXml(fontResourceName: String, fontWeight: Int, fontStyle: String): String = """
<?xml version="1.0" encoding="utf-8"?>
<font-family xmlns:android="http://schemas.android.com/apk/res/android">
    <font
        android:font="@font/$fontResourceName"
        android:fontStyle="$fontStyle"
        android:fontWeight="$fontWeight" />
</font-family>
""".trimIndent()

private fun buildFontFamilyXml(fontResourceName: String, entries: List<UiFontTarget>): String {
    val xmlContent = entries.joinToString(separator = "\n") { target ->
        "    <font android:font=\"@font/$fontResourceName\" android:fontStyle=\"${target.fontStyle}\" android:fontWeight=\"${target.fontWeight}\" />"
    }

    return (
        """<?xml version="1.0" encoding="utf-8"?>
<font-family xmlns:android="http://schemas.android.com/apk/res/android">
$xmlContent
</font-family>
"""
            .trimIndent()
        )
}

private val customFontFileOption = stringOption(
    key = "customFontFile",
    default = null,
    title = "Custom font",
    description = "The file path to your font file. Tap the file picker and select it. " +
        "The font file must be in TTF or OTF format. " +
        "A variable font is recommended so heading and body text keep their different weights.",
    required = true,
)

@Suppress("unused")
val customFontGithubPatch = resourcePatch(
    name = "Custom font (GitHub)",
    description = "Replaces GitHub's bundled Inter and Mona Sans UI fonts with a custom font file.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GITHUB)

    customFontFileOption()

    val customFontPath by customFontFileOption

    execute {
        val path = customFontPath?.trim()
            ?: throw PatchException("No custom font was provided.")

        val fontFile = File(path)
        if (!fontFile.exists())
            throw PatchException("Custom font file not found: ${fontFile.absolutePath}")

        if (!fontFile.isFile)
            throw PatchException("Custom font path must be a file, not a folder: ${fontFile.absolutePath}")

        if (fontFile.extension.lowercase() !in allowedFontExtensions)
            throw PatchException(
                "Unsupported font format '${fontFile.extension}'. " +
                    "Use one of: ${allowedFontExtensions.joinToString(", ") { ".${it}" }}."
            )

        val fontResDir = get("res").resolve("font")
        val fontResourceName = "custom_ui_font"
        val fontAssetFile = fontResDir.resolve("$fontResourceName.${fontFile.extension.lowercase()}")
        fontFile.copyTo(fontAssetFile, overwrite = true)

        FONT_FAMILIES.flatMap { it.entries }.forEach { target ->
            val xmlFile = fontResDir.resolve("${target.resourceName}.xml")
            val legacyFontFiles = listOf(
                fontResDir.resolve("${target.resourceName}.otf"),
                fontResDir.resolve("${target.resourceName}.ttf"),
            )

            legacyFontFiles.forEach { legacyFile ->
                if (legacyFile.exists()) {
                    legacyFile.delete()
                }
            }

            xmlFile.writeText(buildSingleFontXml(fontResourceName, target.fontWeight, target.fontStyle))
        }

        FONT_FAMILIES.forEach { family ->
            val xmlFile = fontResDir.resolve("${family.resourceName}.xml")
            xmlFile.writeText(buildFontFamilyXml(fontResourceName, family.entries))
        }

        val webviewResDir = get("assets").resolve("webview")
        val fontCssFile = webviewResDir.resolve("font.css")
        fontCssFile.writeText(
            """@font-face {
    font-family: inter;
    src: url("/android_res/font/$fontResourceName.${fontFile.extension.lowercase()}")
}

.markdown-body {
    font-family: inter;
}
""".trimIndent() + "\n"
        )
    }
}