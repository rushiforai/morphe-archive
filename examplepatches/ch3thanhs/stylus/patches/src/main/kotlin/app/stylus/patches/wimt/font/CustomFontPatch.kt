package app.stylus.patches.wimt.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.stylus.patches.wimt.shared.Constants.COMPATIBILITY_WIMT
import com.android.tools.smali.dexlib2.Opcode
import java.io.File

private const val CUSTOM_FONT_RESOURCE_NAME = "custom_ui_font"
private const val GM3_FONT_FEATURE_SETTINGS_RESOURCE = "gm3_font_feature_settings"

private val allowedFontExtensions = setOf("ttf", "otf")

private val fontResourcePrefixes = listOf(
    "gm3_",
    "nunitosans",
    "googlesans",
    "google_sans",
    "roboto",
)

private val nunitoFamilyEntries = listOf(
    300 to "normal",
    400 to "normal",
    500 to "normal",
    600 to "normal",
    700 to "normal",
    400 to "italic",
    600 to "italic",
)

private val styleRegex = Regex(
    """<style\s+[^>]*>.*?</style>""",
    setOf(RegexOption.DOT_MATCHES_ALL, RegexOption.IGNORE_CASE),
)

private val fontFeaturePartRegex = Regex(
    """^['"]?([A-Za-z0-9]{4})['"]?(?:\s+([01]))?$""",
)

private fun buildSingleFontXml(
    fontResourceName: String,
    fontWeight: Int,
    fontStyle: String,
): String = buildString {
    appendLine("<?xml version=\"1.0\" encoding=\"utf-8\"?>")
    appendLine("<font-family xmlns:android=\"http://schemas.android.com/apk/res/android\">")
    appendLine("    <font")
    appendLine("        android:font=\"@font/$fontResourceName\"")
    appendLine("        android:fontStyle=\"$fontStyle\"")
    appendLine("        android:fontWeight=\"$fontWeight\" />")
    append("</font-family>")
}

private fun buildFontFamilyXml(
    fontResourceName: String,
    entries: List<Pair<Int, String>>,
): String = buildString {
    appendLine("<?xml version=\"1.0\" encoding=\"utf-8\"?>")
    appendLine("<font-family xmlns:android=\"http://schemas.android.com/apk/res/android\">")
    entries.forEach { (fontWeight, fontStyle) ->
        appendLine(
            "    <font android:font=\"@font/$fontResourceName\" " +
                "android:fontStyle=\"$fontStyle\" android:fontWeight=\"$fontWeight\" />",
        )
    }
    append("</font-family>")
}

private fun isTargetFontResource(file: File): Boolean {
    val extension = file.extension.lowercase()
    if (extension !in allowedFontExtensions && extension != "xml") {
        return false
    }

    val name = file.nameWithoutExtension.lowercase()

    // Keep monospace resources untouched, matching the behavior of the
    // existing GitHub custom font patch.
    if (name.contains("code") || name.contains("mono")) {
        return false
    }

    return fontResourcePrefixes.any { name.startsWith(it) }
}

private fun fontWeightFromName(name: String): Int {
    val lowerCaseName = name.lowercase()

    // Material 3 variable font resources encode their weight in the resource
    // name rather than in a font file. Labels use 500, emphasized labels use
    // 600, and the remaining emphasized roles use 500.
    if (lowerCaseName.startsWith("gm3_variable_")) {
        return when {
            lowerCaseName.contains("label") && lowerCaseName.contains("emphasized") -> 600
            lowerCaseName.contains("emphasized") || lowerCaseName.contains("label") -> 500
            else -> 400
        }
    }

    return when {
        lowerCaseName.contains("extrabold") -> 800
        lowerCaseName.contains("semibold") -> 600
        lowerCaseName.contains("bold") -> 700
        lowerCaseName.contains("medium") -> 500
        lowerCaseName.contains("light") -> 300
        lowerCaseName.contains("thin") -> 200
        else -> 400
    }
}

private fun fontStyleFromName(name: String): String =
    if (name.contains("italic", ignoreCase = true)) "italic" else "normal"

/**
 * Accepts Android's native CSS-like OpenType feature syntax and a full CSS
 * declaration for convenience. Android has no CSS engine, so the result is
 * always the string understood by Paint.setFontFeatureSettings / TextView.
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

private fun escapeXmlText(value: String): String =
    value.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")

private fun addFontFeatureToStyles(content: String, featureSettings: String): String =
    styleRegex.replace(content) { match ->
        val style = match.value
        if (!style.contains("android:fontFamily") ||
            style.contains("android:fontFeatureSettings")
        ) {
            style
        } else {
            // Style items keep literal quotes in their compiled value, unlike
            // string resources where aapt2 strips the outer quotes. Keep the
            // native feature syntax unquoted, otherwise Android receives a
            // value such as \"'ss01' 1\" and ignores it.
            style.replace(
                "</style>",
                "    <item name=\"android:fontFeatureSettings\">$featureSettings</item>\n" +
                    "    </style>",
            )
        }
    }

private fun updateFontFeatureResources(resDir: File, featureSettings: String) {
    val valuesDirs = resDir.listFiles()
        ?.filter { it.isDirectory && (it.name == "values" || it.name.startsWith("values-")) }
        ?.sortedBy { it.name }
        ?: emptyList()

    val escapedSettings = escapeXmlText(featureSettings)
    var updated = false

    valuesDirs.forEach { valuesDir ->
        val stringsFile = valuesDir.resolve("strings.xml")
        if (stringsFile.isFile) {
            val content = stringsFile.readText()
            val stringPattern = Regex(
                """<string\s+name="$GM3_FONT_FEATURE_SETTINGS_RESOURCE"\s*>.*?</string>""",
                RegexOption.DOT_MATCHES_ALL,
            )
            if (stringPattern.containsMatchIn(content)) {
                val replacement =
                    """<string name="$GM3_FONT_FEATURE_SETTINGS_RESOURCE">"$escapedSettings"</string>"""
                val updatedContent = content.replace(stringPattern, replacement)
                if (updatedContent != content) {
                    stringsFile.writeText(updatedContent)
                    updated = true
                }
            }
        }

        val stylesFile = valuesDir.resolve("styles.xml")
        if (stylesFile.isFile) {
            val content = stylesFile.readText()
            val updatedContent = addFontFeatureToStyles(content, escapedSettings)
            if (updatedContent != content) {
                stylesFile.writeText(updatedContent)
                updated = true
            }
        }
    }

    if (!updated) {
        throw PatchException("Could not find a place to apply font feature settings in res/values*.")
    }
}

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
 * handles the font files, View styles, and Material 3 feature string.
 */
private val customFontResourcesWimtPatch = resourcePatch(
    name = "Custom font resources",
    description = "Internal font resource replacement.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WIMT)

    execute {
        val path = customFontFileOption.value?.trim()
            ?: throw PatchException("No custom font was provided.")

        val fontFile = File(path)
        if (!fontFile.exists()) {
            throw PatchException("Custom font file not found: ${fontFile.absolutePath}")
        }

        if (!fontFile.isFile) {
            throw PatchException("Custom font path must be a file, not a folder: ${fontFile.absolutePath}")
        }

        val fontExtension = fontFile.extension.lowercase()
        if (fontExtension !in allowedFontExtensions) {
            throw PatchException(
                "Unsupported font format '${fontFile.extension}'. " +
                    "Use one of: ${allowedFontExtensions.joinToString(", ") { ".${it}" }}."
            )
        }

        val resDir = get("res")

        // Morphe Patcher 2.0.0 and newer decode resources on request instead of
        // up front, so a directory only holds what has been decoded so far.
        // Decode the font directories before listing them.
        decode("res/font*")

        val fontResDirs = resDir.listFiles()
            ?.filter { it.isDirectory && (it.name == "font" || it.name.startsWith("font-")) }
            ?.sortedBy { it.name }
            ?: emptyList()

        if (fontResDirs.isEmpty()) {
            throw PatchException("No font resource directories were found in res.")
        }

        val baseFontResDir = fontResDirs.firstOrNull { it.name == "font" }
            ?: throw PatchException("The base res/font directory was not found.")

        // Remove a previously copied custom font with a different extension so
        // the target does not end up with two resources sharing the same name.
        fontResDirs.forEach { fontResDir ->
            listOf("ttf", "otf").forEach { extension ->
                fontResDir.resolve("$CUSTOM_FONT_RESOURCE_NAME.$extension").delete()
            }
        }

        fontFile.copyTo(
            baseFontResDir.resolve("$CUSTOM_FONT_RESOURCE_NAME.$fontExtension"),
            overwrite = true,
        )

        val targets = fontResDirs
            .flatMap { fontResDir ->
                fontResDir.listFiles()
                    ?.filter { it.isFile && isTargetFontResource(it) }
                    ?: emptyList()
            }
            .sortedWith(compareBy({ it.parentFile.name }, { it.nameWithoutExtension }))

        if (targets.isEmpty()) {
            throw PatchException("No compatible font resources were found in the res/font* directories.")
        }

        targets.forEach { target ->
            val resourceName = target.nameWithoutExtension

            if (target.extension.lowercase() in allowedFontExtensions) {
                // Mark the old font for removal from the rebuilt APK. Deleting the
                // staged file alone leaves the original entry in the output.
                delete("res/${target.parentFile.name}/${target.name}")
            }

            val xmlFile = target.parentFile.resolve("$resourceName.xml")
            val xmlContent = if (resourceName.equals("NunitoSans", ignoreCase = true)) {
                buildFontFamilyXml(CUSTOM_FONT_RESOURCE_NAME, nunitoFamilyEntries)
            } else {
                buildSingleFontXml(
                    CUSTOM_FONT_RESOURCE_NAME,
                    fontWeightFromName(resourceName),
                    fontStyleFromName(resourceName),
                )
            }

            xmlFile.writeText(xmlContent)
        }

        val featureSettings = normalizeFontFeatureSettings(fontFeatureSettingsOption.value)
        if (featureSettings != null) {
            // The values files are decoded on request too, so decode them before
            // walking res/values* for the Material 3 feature string and styles.
            decode("res/values*/strings.xml", "res/values*/styles.xml")
            updateFontFeatureResources(resDir, featureSettings)
        }
    }
}

@Suppress("unused")
val customFontWimtPatch = bytecodePatch(
    name = "Custom font",
    description = "Replaces the bundled Google Sans, Nunito Sans, and Roboto UI fonts with " +
        "your own font.",
    default = false,
) {
    category("Font")

    compatibleWith(COMPATIBILITY_WIMT)

    customFontFileOption()
    fontFeatureSettingsOption()
    dependsOn(customFontResourcesWimtPatch)

    execute {
        val featureSettings =
            normalizeFontFeatureSettings(fontFeatureSettingsOption.value) ?: return@execute

        val method = ComposeParagraphConstructorFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException("Compose text constructor has no implementation.")
        val returnIndex = implementation.instructions
            .indexOfLast { it.opcode == Opcode.RETURN_VOID }

        if (returnIndex < 0) {
            throw PatchException("Could not find the Compose text constructor return.")
        }

        // This constructor creates the single TextPaint used by Compose text.
        // Re-apply the setting here so it wins over the base SpanStyle, which
        // may carry its own fontFeatureSettings value.
        method.addInstructions(
            returnIndex,
            """
                iget-object v1, v0, Ldhn;->c:Ldnv;
                const-string v2, "$featureSettings"
                invoke-virtual {v1, v2}, Ldnv;->setFontFeatureSettings(Ljava/lang/String;)V
            """.trimIndent(),
        )
    }
}
