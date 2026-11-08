package app.stylus.patches.github.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.deleteResource
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.stylus.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.io.File

private val allowedFontExtensions = setOf("ttf", "otf")

private val fontFeaturePartRegex = Regex(
    """^['"]?([A-Za-z0-9]{4})['"]?(?:\s+([01]))?$""",
)

private val styleRegex = Regex(
    """<style\s+[^>]*>.*?</style>""",
    setOf(RegexOption.DOT_MATCHES_ALL, RegexOption.IGNORE_CASE),
)

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

private fun buildSingleFontXml(
    fontResourceName: String,
    fontWeight: Int,
    fontStyle: String,
    axes: FontAxes?,
): String {
    val variationSettings = buildFontVariationSettings(fontWeight, fontStyle == "italic", axes)
    val variationAttribute = variationSettings
        ?.let { "\n        android:fontVariationSettings=\"$it\"" }
        .orEmpty()

    return """
<?xml version="1.0" encoding="utf-8"?>
<font-family xmlns:android="http://schemas.android.com/apk/res/android">
    <font
        android:font="@font/$fontResourceName"
        android:fontStyle="$fontStyle"
        android:fontWeight="$fontWeight"$variationAttribute />
</font-family>
""".trimIndent()
}

private fun buildFontFamilyXml(
    fontResourceName: String,
    entries: List<UiFontTarget>,
    axes: FontAxes?,
): String {
    val xmlContent = entries.joinToString(separator = "\n") { target ->
        val variationSettings = buildFontVariationSettings(
            target.fontWeight,
            target.fontStyle == "italic",
            axes,
        )
        val variationAttribute = variationSettings
            ?.let { " android:fontVariationSettings=\"$it\"" }
            .orEmpty()

        "    <font android:font=\"@font/$fontResourceName\" " +
            "android:fontStyle=\"${target.fontStyle}\" " +
            "android:fontWeight=\"${target.fontWeight}\"$variationAttribute />"
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

/**
 * OpenType variation axes exposed by the custom font. Android's
 * `android:fontWeight` only sets the font's reported style; it does not select
 * an instance of a variable font. The weight and italic axes must be pinned
 * with `android:fontVariationSettings` instead, or every XML resource loads the
 * font's default instance (usually Regular).
 */
private data class FontAxes(
    val hasWeight: Boolean,
    val hasItalic: Boolean,
)

private fun buildFontVariationSettings(
    fontWeight: Int,
    italic: Boolean,
    axes: FontAxes?,
): String? {
    if (axes == null) return null

    val settings = buildList {
        if (axes.hasWeight) add("'wght' $fontWeight")
        if (italic && axes.hasItalic) add("'ital' 1")
    }

    return settings.takeIf { it.isNotEmpty() }?.joinToString(", ")
}

private fun detectFontAxes(fontFile: File): FontAxes? {
    val bytes = fontFile.readBytes()
    if (bytes.size < 12) return null

    fun u16(offset: Int): Int =
        ((bytes[offset].toInt() and 0xFF) shl 8) or (bytes[offset + 1].toInt() and 0xFF)

    fun u32(offset: Int): Long =
        ((bytes[offset].toLong() and 0xFF) shl 24) or
            ((bytes[offset + 1].toLong() and 0xFF) shl 16) or
            ((bytes[offset + 2].toLong() and 0xFF) shl 8) or
            (bytes[offset + 3].toLong() and 0xFF)

    val tableCount = u16(4)
    var fvarOffset = -1
    for (index in 0 until tableCount) {
        val recordOffset = 12 + index * 16
        if (recordOffset + 16 > bytes.size) return null
        if (String(bytes, recordOffset, 4, Charsets.US_ASCII) == "fvar") {
            fvarOffset = u32(recordOffset + 8).toInt()
            break
        }
    }

    if (fvarOffset < 0 || fvarOffset + 12 > bytes.size) return null

    val axesArrayOffset = u16(fvarOffset + 4)
    val axisCount = u16(fvarOffset + 8)
    val axisSize = u16(fvarOffset + 10)
    if (axisSize < 20) return null

    var hasWeight = false
    var hasItalic = false
    for (index in 0 until axisCount) {
        val axisOffset = fvarOffset + axesArrayOffset + index * axisSize
        if (axisOffset + 4 > bytes.size) break
        when (String(bytes, axisOffset, 4, Charsets.US_ASCII)) {
            "wght" -> hasWeight = true
            "ital" -> hasItalic = true
        }
    }

    return if (hasWeight || hasItalic) FontAxes(hasWeight, hasItalic) else null
}

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

private fun updateFontFeatureStyles(resDir: File, featureSettings: String) {
    val valuesDirs = resDir.listFiles()
        ?.filter { it.isDirectory && (it.name == "values" || it.name.startsWith("values-")) }
        ?.sortedBy { it.name }
        ?: emptyList()

    var updated = false

    valuesDirs.forEach { valuesDir ->
        val stylesFile = valuesDir.resolve("styles.xml")
        if (!stylesFile.isFile) {
            return@forEach
        }

        val content = stylesFile.readText()
        val updatedContent = addFontFeatureToStyles(content, featureSettings)
        if (updatedContent != content) {
            stylesFile.writeText(updatedContent)
            updated = true
        }
    }

    if (!updated) {
        throw PatchException("Could not find a place to apply font feature settings in res/values*.")
    }
}

private fun escapeSmaliString(value: String): String =
    value.replace("\\", "\\\\").replace("\"", "\\\"")

/**
 * Number of parameter registers of [method], including the implicit this
 * register of a non-static method, with long and double parameters counting
 * twice.
 */
private fun parameterRegisterCount(method: MutableMethod): Int {
    val parameters = method.parameterTypes.sumOf { type -> if (type == "J" || type == "D") 2 else 1 }
    val thisRegisters = if ((method.accessFlags and AccessFlags.STATIC.value) != 0) 0 else 1
    return parameters + thisRegisters
}

/**
 * AndroidX's TypefaceCompat builds a typeface from the font XML through
 * `Typeface.CustomFallbackBuilder`. That builder applies the XML's variation
 * settings as the font instance to load, but the resulting Typeface keeps the
 * font's default instance instead (on Android 14 a `'wght' 500` entry renders
 * at the regular weight). Typeface.create with the typeface's own weight picks
 * the matching instance, so rebuild every font that ResourcesCompat returns.
 *
 * This is the single funnel used by Compose, whose font resolver loads
 * resources through ResourcesCompat.
 */
private fun applyResourcesCompatVariableFontFix() {
    // Patch the synchronous ResourcesCompat.getFont(Context, int) overload. It
    // returns through a single fall-through path, unlike the 7-argument
    // overload in the same class whose final return is also a goto target (a
    // block inserted before that return would be skipped by those gotos).
    val baseMethod = ResourcesCompatGetFontFingerprint.method
    val target = mutableClassDefBy(baseMethod.definingClass).methods.firstOrNull { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == "Landroid/graphics/Typeface;" &&
            method.parameterTypes.map { it.toString() } ==
            listOf("Landroid/content/Context;", "I")
    } ?: throw PatchException("Could not find ResourcesCompat.getFont.")
    val implementation = target.implementation
        ?: throw PatchException("ResourcesCompat.getFont has no implementation.")

    val returnIndex = implementation.instructions
        .indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    if (returnIndex < 0) {
        throw PatchException("Could not find the ResourcesCompat.getFont return.")
    }

    val returnRegister = (implementation.instructions[returnIndex] as? OneRegisterInstruction)
        ?.registerA
        ?: throw PatchException("Could not read the ResourcesCompat.getFont result register.")

    // Everything but the return value is dead here, so any other register can
    // be used as scratch. Keep them low because the invoke register list only
    // encodes the low registers.
    val scratchRegisters = (0 until implementation.registerCount)
        .filter { it != returnRegister && it < 16 }
        .take(3)
    if (scratchRegisters.size < 3) {
        throw PatchException("Could not find scratch registers for the font weight fix.")
    }
    val (typefaceRegister, weightRegister, italicRegister) = scratchRegisters

    val instructionCountBefore = implementation.instructions.count()

    // This must be addInstructionsWithLabels: a plain addInstructions copies
    // inline labels without re-targeting them, which produces a branch into the
    // middle of another instruction and fails dex verification at runtime.
    target.addInstructionsWithLabels(
        returnIndex,
        """
            if-eqz v$returnRegister, :done
            move-object v$typefaceRegister, v$returnRegister
            invoke-virtual {v$typefaceRegister}, Landroid/graphics/Typeface;->getWeight()I
            move-result v$weightRegister
            invoke-virtual {v$typefaceRegister}, Landroid/graphics/Typeface;->isItalic()Z
            move-result v$italicRegister
            invoke-static {v$typefaceRegister, v$weightRegister, v$italicRegister}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;
            move-result-object v$returnRegister
            :done
            nop
        """.trimIndent(),
    )

    if (implementation.instructions.count() - instructionCountBefore != 9) {
        throw PatchException("The variable font weight fix did not assemble.")
    }
}

private fun applyComposeFontFeatureSettings(featureSettings: String) {
    val target = resolveComposeParagraphPaintTarget()
    val implementation = target.method.implementation
        ?: throw PatchException("Compose paragraph constructor has no implementation.")

    val returnIndex = implementation.instructions
        .indexOfLast { it.opcode == Opcode.RETURN_VOID }

    if (returnIndex < 0) {
        throw PatchException("Could not find the Compose paragraph constructor return.")
    }

    // The constructor copies the base SpanStyle onto the single TextPaint used
    // by Compose text. Apply the setting at the end so it wins over that
    // SpanStyle, which may carry its own fontFeatureSettings value.
    //
    // The snippet is assembled inside a stand-in method that keeps this
    // method's register count but has no parameters of its own, so p0 there is
    // not this. Address this through its real register instead, and keep the
    // scratch values low because iget-object and the invoke register list only
    // encode the low registers.
    val thisRegister = implementation.registerCount - parameterRegisterCount(target.method)
    if (thisRegister < 0) {
        throw PatchException(
            "Could not locate the this register of the Compose paragraph constructor.",
        )
    }

    val instructionCountBefore = implementation.instructions.count()

    target.method.addInstructions(
        returnIndex,
        """
            move-object/from16 v0, v$thisRegister
            iget-object v0, v0, ${target.paintField.definingClass}->${target.paintField.name}:${target.paintField.type}
            const-string v1, "${escapeSmaliString(featureSettings)}"
            invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setFontFeatureSettings(Ljava/lang/String;)V
        """.trimIndent(),
    )

    // A snippet the assembler rejects is reported to standard output and
    // dropped without failing the patch, which leaves a partly written method
    // behind and the patched app crashes on start, so make sure the whole
    // snippet made it into the method.
    if (implementation.instructions.count() - instructionCountBefore != 4) {
        throw PatchException("The font feature settings injection did not assemble.")
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

@Suppress("unused")
val customFontGithubPatch = patch(
    name = "Custom font",
    description = "Replaces the bundled Inter and Mona Sans UI fonts with your own font.",
    default = false,
) {
    category("Font")

    compatibleWith(COMPATIBILITY_GITHUB)

    customFontFileOption()
    fontFeatureSettingsOption()

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

        val featureSettings = normalizeFontFeatureSettings(fontFeatureSettingsOption.value)

        // Morphe Patcher 2.0.0 and newer decode resources on request instead of
        // up front, so decode the font directory before looking for the fonts to
        // replace or remove.
        decode("res/font*")

        val fontResDir = resourceFile("res").resolve("font")
        val fontResourceName = "custom_ui_font"
        val fontAssetFile = fontResDir.resolve("$fontResourceName.${fontFile.extension.lowercase()}")
        fontFile.copyTo(fontAssetFile, overwrite = true)

        val fontAxes = detectFontAxes(fontFile)

        FONT_FAMILIES.flatMap { it.entries }.forEach { target ->
            val xmlFile = fontResDir.resolve("${target.resourceName}.xml")
            val legacyFontFiles = listOf(
                fontResDir.resolve("${target.resourceName}.otf"),
                fontResDir.resolve("${target.resourceName}.ttf"),
            )

            legacyFontFiles.forEach { legacyFile ->
                if (legacyFile.exists()) {
                    // Mark the legacy font for removal from the rebuilt APK.
                    deleteResource("res/font/${legacyFile.name}")
                }
            }

            xmlFile.writeText(buildSingleFontXml(fontResourceName, target.fontWeight, target.fontStyle, fontAxes))
        }

        FONT_FAMILIES.forEach { family ->
            val xmlFile = fontResDir.resolve("${family.resourceName}.xml")
            xmlFile.writeText(buildFontFamilyXml(fontResourceName, family.entries, fontAxes))
        }

        if (fontAxes != null) {
            // Android ignores variation settings on fonts built by
            // Typeface.CustomFallbackBuilder, which is how the app loads its
            // font resources, so pin the instance again after loading.
            applyResourcesCompatVariableFontFix()
        }

        val webviewResDir = resourceFile("assets").resolve("webview")
        // Assets are extracted on request too, so the directory may not be staged
        // yet and writing font.css would fail without it.
        webviewResDir.mkdirs()
        val fontCssFile = webviewResDir.resolve("font.css")
        val fontFeatureCss = featureSettings
            ?.let { "\n    font-feature-settings: $it;" }
            .orEmpty()
        fontCssFile.writeText(
            """@font-face {
    font-family: inter;
    src: url("/android_res/font/$fontResourceName.${fontFile.extension.lowercase()}")
}

.markdown-body {
    font-family: inter;$fontFeatureCss
}
""".trimIndent() + "\n"
        )

        if (featureSettings != null) {
            // View-based text (dialogs, action mode, widgets) reads text
            // appearances from res/values* rather than Compose typography.
            decode("res/values*/styles.xml")
            updateFontFeatureStyles(resourceFile("res"), featureSettings)

            // Compose text does not read the styles above; its single TextPaint
            // is created in the paragraph intrinsics constructor.
            applyComposeFontFeatureSettings(featureSettings)
        }
    }
}