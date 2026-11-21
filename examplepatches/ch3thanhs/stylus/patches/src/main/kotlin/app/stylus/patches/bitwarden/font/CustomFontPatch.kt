package app.stylus.patches.bitwarden.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.deleteResource
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.stylus.patches.bitwarden.shared.Constants.COMPATIBILITY_BITWARDEN
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import java.io.File

private const val UI_FONT_RESOURCE_NAME = "inter_variable"

private val allowedFontExtensions = setOf("ttf", "otf")

private val fontFeaturePartRegex = Regex(
    """^['"]?([A-Za-z0-9]{4})['"]?(?:\s+([01]))?$""",
)

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

private val customFontFileOption = stringOption(
    key = "customFontFile",
    default = null,
    title = "Custom font",
    description = "The file path to your font. Tap the file picker and select it. " +
        "The font must be in TTF or OTF format. " +
        "Use a variable font with a weight axis to keep the different UI weights. " +
        "A static font uses its single weight throughout the UI.",
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
private val customFontResourcesBitwardenPatch = patch(
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

        decode("res/font*")

        val fontResDir = resourceFile("res").resolve("font")
        val bundledFont = fontResDir.resolve("$UI_FONT_RESOURCE_NAME.ttf")
        if (!bundledFont.isFile) {
            throw PatchException("Could not find Bitwarden's bundled Inter font.")
        }

        val fontExtension = fontFile.extension.lowercase()
        // Compose loads the same resource at each weight and applies its weight axis.
        fontFile.copyTo(
            fontResDir.resolve("$UI_FONT_RESOURCE_NAME.$fontExtension"),
            overwrite = true,
        )
        if (fontExtension != bundledFont.extension) {
            deleteResource("res/font/${bundledFont.name}")
        }
    }
}

@Suppress("unused")
val customFontBitwardenPatch = patch(
    name = "Custom font",
    description = "Replaces the bundled Inter UI font with your own font.",
    default = false,
) {
    category("Font")

    compatibleWith(COMPATIBILITY_BITWARDEN)

    customFontFileOption()
    fontFeatureSettingsOption()
    dependsOn(customFontResourcesBitwardenPatch, bitwardenFontExtensionPatch)

    execute {
        markCustomUiFontInstalled()

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
        //
        // The snippet is assembled inside a stand-in method that keeps this
        // method's register count but has no parameters of its own, so p0 there
        // is not this. Address this through its real register instead, and keep
        // the scratch values low because iget-object and the invoke register
        // list only encode the low registers.
        val thisRegister = implementation.registerCount - parameterRegisterCount(target.method)
        if (thisRegister < 0) {
            throw PatchException(
                "Could not locate the this register of the Compose paragraph constructor."
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
        // dropped without failing the patch, which leaves a partly written
        // method behind and the patched app crashes on start, so make sure the
        // whole snippet made it into the method.
        if (implementation.instructions.count() - instructionCountBefore != 4) {
            throw PatchException("The font feature settings injection did not assemble.")
        }
    }
}
