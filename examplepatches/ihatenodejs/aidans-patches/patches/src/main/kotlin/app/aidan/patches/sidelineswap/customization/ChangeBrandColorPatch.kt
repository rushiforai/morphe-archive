package app.aidan.patches.sidelineswap.customization

import app.aidan.patches.shared.compositeFeaturePatch
import app.aidan.patches.sidelineswap.shared.COMPATIBILITY_SIDELINESWAP
import app.aidan.patches.sidelineswap.shared.requireSidelineSwapCompose
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction51l
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private val HEX_COLOR_REGEX = Regex("^#(?:[0-9a-fA-F]{3,4}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")

private const val DEFAULT_PRIMARY_COLOR = "#1E88E5"
private const val DEFAULT_PRIMARY_DARK_COLOR = "#1565C0"

/**
 * 2.3.2 exposes its accent palette as Kotlin constants: `Lho7;->a` is the Material primary
 * (and the source of every direct brand-accent usage), `Lho7;->b` is the secondary accent,
 * normally copied from the green tonal ramp.
 */
private const val COMPOSE_BRAND_CLASS = "Lho7;"
private const val COMPOSE_ACCENT_FIELD = "b"
private const val COMPOSE_SHIPPED_PRIMARY = 0xff253c32L

val changeBrandColorPatch = compositeFeaturePatch(
    name = "Change Brand Color",
    description = "Customizes the primary brand accent color across SidelineSwap buttons, navigation highlights, badges, and accents.",
    default = false
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_SIDELINESWAP)

    val primaryColor = registerOption(
        stringOption(
            key = "primaryColor",
            default = DEFAULT_PRIMARY_COLOR,
            title = "Primary Brand Color",
            description = "Hex color string (e.g. #1E88E5 for Material Blue, #9C27B0 for Purple, #FF5722 for Orange, #000000 for Monochrome)."
        )
    )

    val primaryDarkColor = registerOption(
        stringOption(
            key = "primaryDarkColor",
            default = DEFAULT_PRIMARY_DARK_COLOR,
            title = "Primary Dark Color",
            description = "Hex color string for the secondary accent and dark accents (defaults to #1565C0)."
        )
    )

    resources {
        val primary = primaryColor.value ?: DEFAULT_PRIMARY_COLOR
        validateHexColor("primaryColor", primary)
        validateHexColor("primaryDarkColor", primaryDarkColor.value ?: DEFAULT_PRIMARY_DARK_COLOR)

        packageMetadata.requireSidelineSwapCompose()
        patchLauncherBackground(primary)
    }

    bytecode {
        val primary = parseArgbColor("primaryColor", primaryColor.value ?: DEFAULT_PRIMARY_COLOR)
        val accent = parseArgbColor("primaryDarkColor", primaryDarkColor.value ?: DEFAULT_PRIMARY_DARK_COLOR)

        packageMetadata.requireSidelineSwapCompose()
        patchPalette(primary, accent)
    }
}

/** Keeps the adaptive launcher icon background in sync with the chosen brand color. */
private fun app.morphe.patcher.patch.ResourcePatchContext.patchLauncherBackground(primary: String) {
    val path = "res/values/colors.xml"
    document(path).use { doc ->
        val colorNodes = doc.getElementsByTagName("color")
        var match: Element? = null
        for (i in 0 until colorNodes.length) {
            val element = colorNodes.item(i) as? Element ?: continue
            if (element.getAttribute("name") == "ic_launcher_background") {
                if (match != null) {
                    throw PatchException("[$path] Duplicate color declaration for 'ic_launcher_background'")
                }
                match = element
            }
        }
        val element = match
            ?: throw PatchException("[$path] Required color 'ic_launcher_background' not found")
        val current = element.textContent.trim()
        if (!current.equals("#02c874", ignoreCase = true)) {
            throw PatchException("[$path] Color 'ic_launcher_background' expected '#02c874', found '$current'")
        }
        element.textContent = primary
    }
}

/**
 * Rewrites the Compose brand palette. The shipped primary literal must still be present so
 * a re-themed build fails loudly instead of silently keeping the old accent.
 */
private fun BytecodePatchContext.patchPalette(primary: Long, accent: Long) {
    val classDef = mutableClassDefByOrNull(COMPOSE_BRAND_CLASS)
        ?: throw PatchException("Required policy failed: missing $COMPOSE_BRAND_CLASS")

    replacePrimaryLiteral(classDef, COMPOSE_SHIPPED_PRIMARY, primary)
    setStaticColor(classDef, COMPOSE_ACCENT_FIELD, accent)
}

private fun BytecodePatchContext.replacePrimaryLiteral(classDef: ClassDef, from: Long, to: Long) {
    val mutableClass = mutableClassDefBy(classDef)
    var matches = 0

    for (method in mutableClass.methods) {
        val impl = method.implementation ?: continue
        val indices = impl.instructions.mapIndexedNotNull { index, instruction ->
            instruction.takeIf {
                it.opcode == Opcode.CONST_WIDE && (it as Instruction51l).wideLiteral == from
            }?.let { index }
        }
        for (index in indices) {
            val register = (impl.instructions.elementAt(index) as Instruction51l).registerA
            method.replaceInstruction(index, "const-wide v$register, 0x${to.toHex()}L")
        }
        matches += indices.size
    }

    if (matches != 1) {
        throw PatchException(
            "Required policy failed: expected 1 brand literal 0x${from.toHex()} in $COMPOSE_BRAND_CLASS, matched $matches"
        )
    }
}

/**
 * Replaces the value stored into [fieldName] with an opaque [argb] color, keeping the
 * existing store instruction so the static initializer order is unchanged.
 */
private fun BytecodePatchContext.setStaticColor(classDef: ClassDef, fieldName: String, argb: Long) {
    val mutableClass = mutableClassDefBy(classDef)
    val clinit = mutableClass.methods.firstOrNull { it.name == "<clinit>" && it.implementation != null }
        ?: throw PatchException("Required policy failed: missing <clinit> in $COMPOSE_BRAND_CLASS")

    val impl = clinit.implementation!!
    val index = impl.instructions.indexOfFirst { instruction ->
        if (instruction.opcode != Opcode.SPUT_WIDE) return@indexOfFirst false
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        field != null && field.definingClass == COMPOSE_BRAND_CLASS && field.name == fieldName
    }
    if (index < 0) {
        throw PatchException("Required policy failed: missing $COMPOSE_BRAND_CLASS;->$fieldName")
    }

    val register = (impl.instructions.elementAt(index) as Instruction21c).registerA
    val value = (argb and 0xffffffffL) shl 32
    clinit.addInstructions(index, "const-wide v$register, 0x${value.toHex()}L")
}

/**
 * Validates that [value] is a valid hex color string format accepted by Android XML resources
 * (#RGB, #ARGB, #RRGGBB, or #AARRGGBB).
 *
 * @throws PatchException if the value is not a valid hex color.
 */
private fun validateHexColor(optionName: String, value: String) {
    if (!HEX_COLOR_REGEX.matches(value)) {
        throw PatchException("Invalid $optionName: '$value'. Expected a valid hex color (e.g. #RRGGBB, #AARRGGBB, #RGB, or #ARGB).")
    }
}

/** Parses a validated hex color into an opaque or explicitly-alpha ARGB value. */
private fun parseArgbColor(optionName: String, value: String): Long {
    validateHexColor(optionName, value)
    val digits = value.removePrefix("#")
    val expanded = when (digits.length) {
        3 -> "FF" + digits.map { "$it$it" }.joinToString("")
        4 -> digits.map { "$it$it" }.joinToString("")
        6 -> "FF$digits"
        else -> digits
    }
    return expanded.toLong(16) and 0xffffffffL
}

private fun Long.toHex(): String = java.lang.Long.toHexString(this)
