package app.severit.patches.strava.theme

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.stringOption
import app.severit.patches.strava.shared.Constants.COMPATIBILITY_STRAVA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31i
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction51l
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import java.util.logging.Logger

private val logger = Logger.getLogger("CustomAccentColorPatch")

/**
 * `<color name="…">#AARRGGBB</color>` or `#RRGGBB`, as written in decoded values files.
 */
private val COLOR_RESOURCE = Regex(
    """(<color\s+name="([^"]+)"\s*>)\s*#([0-9a-fA-F]{8}|[0-9a-fA-F]{6})\s*(</color>)""",
)

/**
 * Any hex color literal in a drawable, such as `android:fillColor="#fffc5200"`.
 */
private val HEX_LITERAL = Regex("""#([0-9a-fA-F]{8}|[0-9a-fA-F]{6})\b""")

/**
 * Color resources that encode meaning rather than branding (heart rate zones, power charts).
 * These keep their original colors so charts stay readable.
 */
private val SEMANTIC_COLOR_NAME = Regex("""(^|_)(zone|power)(_|$)""")

/**
 * Logos of other brands that happen to share Strava's orange hue (Zwift is `#F26722`).
 */
private val THIRD_PARTY_DRAWABLE = Regex("""zwift""")

@Suppress("unused")
val customAccentColorPatch = patch(
    name = "Custom accent color",
    description = "Replaces Strava's orange brand color and its lighter and darker shades " +
        "with a color of your choice, in both light and dark theme.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    val accentColor by stringOption(
        key = "accentColor",
        default = "#2F7CF6",
        // Strava orange as an accent would change nothing.
        values = COLOR_PRESETS - STRAVA_ORANGE_PRESET,
        title = "Accent color",
        description = "Hex color (#RRGGBB) that replaces Strava's orange. Lighter and darker " +
            "shades are generated from it.",
        required = true,
    ) { AccentPalette.parseRgb(it) != null }

    val recolorDrawables by booleanOption(
        key = "recolorDrawables",
        default = true,
        title = "Recolor icons and badges",
        description = "Also recolor orange in vector icons, badges and map pins, " +
            "including the Strava logo shown inside the app.",
    )

    execute {
        val accentRgb = AccentPalette.parseRgb(accentColor)
            ?: throw PatchException("Invalid accent color: $accentColor (expected #RRGGBB)")
        val palette = AccentPalette(accentRgb)

        // region Color resources (light and night values).

        var resourceCount = 0
        decode("res/values*/colors.xml").forEach { path ->
            val file = resourceFile(path)
            val original = file.readText()
            val patched = COLOR_RESOURCE.replace(original) { match ->
                val (open, name, hex, close) = match.destructured
                if (SEMANTIC_COLOR_NAME.containsMatchIn(name)) return@replace match.value
                val replacement = replaceHex(hex, palette) ?: return@replace match.value
                resourceCount++
                "$open#$replacement$close"
            }
            if (patched != original) file.writeText(patched)
        }
        logger.info("Recolored $resourceCount color resources")

        // endregion

        // region Vector drawables.

        if (recolorDrawables == true) {
            var drawableCount = 0
            decode("res/drawable*/*.xml").forEach { path ->
                if (THIRD_PARTY_DRAWABLE.containsMatchIn(path.substringAfterLast('/'))) return@forEach
                val file = resourceFile(path)
                val original = file.readText()
                if (!original.contains('#')) return@forEach
                val patched = HEX_LITERAL.replace(original) { match ->
                    // Match by hue too: illustrations such as the streak flame use
                    // gradients of off-scale oranges.
                    val replacement = replaceHex(match.groupValues[1], palette, byHue = true)
                        ?: return@replace match.value
                    "#$replacement"
                }
                if (patched != original) {
                    file.writeText(patched)
                    drawableCount++
                }
            }
            logger.info("Recolored $drawableCount drawables")
        }

        // endregion

        // region Compose color literals.

        // Compose themes hard-code colors as Color(0xFFFC5200) => `const-wide vX, 0xfffc5200L`,
        // and translucent ones as Color(0x66FC5200) => `const vX, 0x66fc5200`.
        val classesToPatch = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            val hasOrangeLiteral = classDef.methods.any { method ->
                method.implementation?.instructions?.any { replacementFor(it, palette) != null } == true
            }
            if (hasOrangeLiteral) classesToPatch += classDef
        }

        var literalCount = 0
        classesToPatch.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val replacement = replacementFor(instruction, palette) ?: return@forEachIndexed
                    method.replaceInstruction(index, replacement)
                    literalCount++
                }
            }
        }
        logger.info("Recolored $literalCount color literals in ${classesToPatch.size} classes")

        if (resourceCount == 0 && literalCount == 0) {
            throw PatchException("No orange colors found. This Strava version may use a different palette.")
        }

        // endregion
    }
}

/**
 * Hex digits (`AARRGGBB` or `RRGGBB`, without `#`) with the RGB swapped for the accent palette,
 * keeping alpha and format, or null if the color is not part of the orange scale.
 */
private fun replaceHex(hex: String, palette: AccentPalette, byHue: Boolean = false): String? {
    val value = hex.toLong(16).toInt()
    return if (hex.length == 8) {
        (if (byHue) palette.replaceArgbByHue(value) else palette.replaceArgb(value))?.let { "%08x".format(it) }
    } else {
        (if (byHue) palette.replaceRgbByHue(value) else palette.replaceRgb(value))?.let { "%06x".format(it) }
    }
}

/**
 * New instruction for a color literal of the orange scale, or null if [instruction] is not one.
 */
private fun replacementFor(instruction: Instruction, palette: AccentPalette): BuilderInstruction? = when (instruction.opcode) {
    // A 32-bit ARGB color stored in a long: Compose Color(Long).
    Opcode.CONST_WIDE, Opcode.CONST_WIDE_32 -> {
        val value = (instruction as WideLiteralInstruction).wideLiteral
        if (value ushr 32 != 0L) {
            null
        } else {
            palette.replaceLiteral(value.toInt())?.let { argb ->
                BuilderInstruction51l(
                    Opcode.CONST_WIDE,
                    (instruction as OneRegisterInstruction).registerA,
                    argb.toLong() and 0xFFFFFFFFL,
                )
            }
        }
    }

    // A 32-bit ARGB color stored in an int: Color(Int) and Android color ints.
    Opcode.CONST -> {
        val value = (instruction as NarrowLiteralInstruction).narrowLiteral
        palette.replaceLiteral(value)?.let { argb ->
            BuilderInstruction31i(Opcode.CONST, (instruction as OneRegisterInstruction).registerA, argb)
        }
    }

    else -> null
}
