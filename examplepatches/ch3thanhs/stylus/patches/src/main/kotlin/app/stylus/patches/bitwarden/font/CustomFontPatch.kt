package app.stylus.patches.bitwarden.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.stylus.patches.bitwarden.shared.Constants.COMPATIBILITY_BITWARDEN
import com.android.tools.smali.dexlib2.Opcode
import java.io.File

private const val CUSTOM_FONT_RESOURCE_NAME = "custom_ui_font"

private val allowedFontExtensions = setOf("ttf", "otf")

/**
 * Bitwarden loads its DM Sans files directly from Compose, so the bundled font
 * files are replaced with font-family XML resources that point at the custom
 * font. Declaring the weight in the XML lets a variable font keep the different
 * heading and body weights.
 */
private data class UiFontTarget(
    val resourceName: String,
    val fontWeight: Int,
)

private val UI_FONT_TARGETS = listOf(
    UiFontTarget("dm_sans_regular", 400),
    UiFontTarget("dm_sans_medium", 500),
    UiFontTarget("dm_sans_semi_bold", 600),
    UiFontTarget("dm_sans_bold", 700),
)

private val fontFeaturePartRegex = Regex(
    """^['"]?([A-Za-z0-9]{4})['"]?(?:\s+([01]))?$""",
)

private fun buildFontFamilyXml(fontResourceName: String, fontWeight: Int): String = """
<?xml version="1.0" encoding="utf-8"?>
<font-family xmlns:android="http://schemas.android.com/apk/res/android">
    <font
        android:font="@font/$fontResourceName"
        android:fontStyle="normal"
        android:fontWeight="$fontWeight" />
</font-family>
""".trimIndent()

/**
 * Accepts Android's native CSS-like OpenType feature syntax and a full CSS
 * declaration for convenience. Android has no CSS engine, so the result is
 * always the string understood by Paint.setFontFeatureSettings.
 */
private fun normalizeFontFeatureSettings(raw: String?): String? {
    var value = raw?.trim().orEmpty()
    if (value.isEmpty()) {
        return null
    }

    if (value.startsWith("font-feature-settings", ignoreCase = true)) {
        val colonIndex = value.indexOf(':')
        if (colonIndex < 0) {
            throw PatchException(
                "Invalid font feature settings. Use a value such as 'ss01' 1 " +
                    "or font-feature-settings: \"ss01\" 1;.",
            )
        }
        value = value.substring(colonIndex + 1)
    }

    value = value.trim().removeSuffix(";").trim()
    val parts = value.split(',')
        .map { it.trim() }
        .filter { it.isNotEmpty() }

    if (parts.isEmpty()) {
        throw PatchException("Font feature settings cannot be empty.")
    }

    return parts.joinToString(", ") { part ->
        val match = fontFeaturePartRegex.matchEntire(part)
            ?: throw PatchException(
                "Invalid font feature '$part'. Use four-character OpenType tags " +
                    "such as 'ss01' 1, separated by commas.",
            )

        val tag = match.groupValues[1]
        val enabled = match.groupValues[2].ifEmpty { "1" }
        "'$tag' $enabled"
    }
}

private fun escapeSmaliString(value: String): String =
    value.replace("\\", "\\\\").replace("\"", "\\\"")

private val customFontFileOption = stringOption(
    key = "customFontFile",
    default = null,
    title = "Custom font",
    description = "The file path to your font. Tap the file picker and select it. " +
        "The font must be in TTF or OTF format. " +
        "A variable font is recommended so heading and body text keep their different weights.",
    required = true,
)

private val fontFeatureSettingsOption = stringOption(
    key = "fontFeatureSettings",
    default = null,
    title = "Font feature settings",
    description = "Optional OpenType features for the custom font. For example, enter " +
        "'ss01' 1 to use Inter's open-style digits. You can also paste a CSS declaration " +
        "such as font-feature-settings: \"ss01\" 1;. Android ignores features that the " +
        "selected font does not support.",
    required = false,
)

/**
 * Resource half of the custom font patch. The public patch is a bytecode patch
 * so it can also apply the feature settings to Compose text; this dependency
 * handles the font files.
 */
private val customFontResourcesBitwardenPatch = resourcePatch(
    name = "Custom font resources",
    description = "Internal font resource replacement.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BITWARDEN)

    execute {
        val path = customFontFileOption.value?.trim()
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

        // Morphe Patcher 2.0.0 and newer decode resources on request instead of
        // up front, so decode the font directory before looking for the fonts to
        // replace or remove.
        decode("res/font*")

        val fontResDir = get("res").resolve("font")
        val fontExtension = fontFile.extension.lowercase()

        // Remove a previously copied custom font with a different extension so
        // the target does not end up with two resources sharing the same name.
        listOf("ttf", "otf").forEach { extension ->
            fontResDir.resolve("$CUSTOM_FONT_RESOURCE_NAME.$extension").delete()
        }

        fontFile.copyTo(
            fontResDir.resolve("$CUSTOM_FONT_RESOURCE_NAME.$fontExtension"),
            overwrite = true,
        )

        UI_FONT_TARGETS.forEach { target ->
            listOf("ttf", "otf").forEach { extension ->
                val bundledFontFile = fontResDir.resolve("${target.resourceName}.$extension")
                if (bundledFontFile.exists()) {
                    // Mark the bundled font for removal from the rebuilt APK.
                    delete("res/font/${bundledFontFile.name}")
                }
            }

            // Compose resolves these resources by name, so keep the name and
            // replace the font file with a font-family XML that declares the
            // weight the UI expects.
            fontResDir
                .resolve("${target.resourceName}.xml")
                .writeText(buildFontFamilyXml(CUSTOM_FONT_RESOURCE_NAME, target.fontWeight))
        }
    }
}

@Suppress("unused")
val customFontBitwardenPatch = bytecodePatch(
    name = "Custom font",
    description = "Replaces the bundled DM Sans UI fonts with your own font.",
    default = false,
) {
    category("Font")

    compatibleWith(COMPATIBILITY_BITWARDEN)

    customFontFileOption()
    fontFeatureSettingsOption()
    dependsOn(customFontResourcesBitwardenPatch)

    execute {
        val featureSettings =
            normalizeFontFeatureSettings(fontFeatureSettingsOption.value) ?: return@execute

        val target = resolveComposeParagraphPaintTarget()
        val implementation = target.method.implementation
            ?: throw PatchException("Compose paragraph constructor has no implementation.")

        val returnIndex = implementation.instructions
            .indexOfLast { it.opcode == Opcode.RETURN_VOID }

        if (returnIndex < 0) {
            throw PatchException("Could not find the Compose paragraph constructor return.")
        }

        // The constructor copies the base SpanStyle onto the single TextPaint
        // used by Compose text. Apply the setting at the end so it wins over
        // that SpanStyle, which may carry its own fontFeatureSettings value.
        target.method.addInstructions(
            returnIndex,
            """
                iget-object p1, p0, ${target.paintField.definingClass}->${target.paintField.name}:${target.paintField.type}
                const-string p2, "${escapeSmaliString(featureSettings)}"
                invoke-virtual { p1, p2 }, Landroid/graphics/Paint;->setFontFeatureSettings(Ljava/lang/String;)V
            """.trimIndent(),
        )
    }
}
