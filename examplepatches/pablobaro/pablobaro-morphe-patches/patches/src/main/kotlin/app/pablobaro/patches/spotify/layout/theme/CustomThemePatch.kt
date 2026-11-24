package app.pablobaro.patches.spotify.layout.theme

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.asSequence
import app.pablobaro.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.w3c.dom.Element

private const val AMOLED_BLACK = "#FF000000"
private const val STOCK_BACKGROUND = "#FF121212"
private const val STOCK_ACCENT = "#FF1ED760"
private const val STOCK_ACCENT_PRESSED = "#FF1ABC54"

/** The color as an int, if the instruction loads one: `const` for views, `const-wide` for Compose. */
private fun Instruction.colorLiteral(): Int? = when (opcode) {
    Opcode.CONST -> (this as NarrowLiteralInstruction).narrowLiteral
    Opcode.CONST_WIDE -> (this as WideLiteralInstruction).wideLiteral
        .takeIf { it in 0L..0xFFFFFFFFL }?.toInt()

    else -> null
}

private fun ThemeColors.requireAllMatched(matched: Set<Int>, location: String) {
    val missing = missingGroups(matched)
    if (missing.isNotEmpty()) throw PatchException("Theme colors not found in the $location: ${missing.joinToString()}")
}

private fun Method.loadsColor(colors: ThemeColors) =
    implementation?.instructions?.any { instruction ->
        instruction.colorLiteral()?.let(colors::replaceOpaque) != null
    } == true

@Suppress("unused")
val customThemePatch = bytecodePatch(
    name = "Custom theme",
    description = "Applies a custom theme. Defaults to an AMOLED theme with a pure black background.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    val backgroundColorOption by stringOption(
        key = "backgroundColor",
        default = AMOLED_BLACK,
        values = mapOf("AMOLED black" to AMOLED_BLACK, "Stock" to STOCK_BACKGROUND),
        title = "Background color",
        description = "The main background color, as #RRGGBB or #AARRGGBB.",
        required = true,
    ) { isValidColor(it) }

    val backgroundColorSecondaryOption by stringOption(
        key = "backgroundColorSecondary",
        default = STOCK_BACKGROUND,
        values = mapOf("Dark gray" to STOCK_BACKGROUND, "Stock" to "#FF1F1F1F"),
        title = "Secondary background color",
        description = "The color of cards, sheets and other elevated surfaces, as #RRGGBB or #AARRGGBB.",
        required = true,
    ) { isValidColor(it) }

    val accentColorOption by stringOption(
        key = "accentColor",
        default = STOCK_ACCENT,
        values = mapOf("Stock" to STOCK_ACCENT),
        title = "Accent color",
        description = "The accent color of buttons and highlights, as #RRGGBB or #AARRGGBB.",
        required = true,
    ) { isValidColor(it) }

    val accentColorPressedOption by stringOption(
        key = "accentColorPressed",
        default = STOCK_ACCENT_PRESSED,
        values = mapOf("Stock" to STOCK_ACCENT_PRESSED),
        title = "Pressed accent color",
        description = "The accent color of pressed buttons, as #RRGGBB or #AARRGGBB.",
        required = true,
    ) { isValidColor(it) }

    val darkPlayerOption by booleanOption(
        key = "darkPlayer",
        default = true,
        title = "Dark player",
        description = "Uses the background color in the full screen player and the secondary background color " +
            "in the mini player, instead of the color of the cover art.",
        required = true,
    )

    // Not cached, so that a later run of the same patch instance uses its own options.
    fun themeColors() = ThemeColors(
        background = parseColor(backgroundColorOption!!),
        backgroundSecondary = parseColor(backgroundColorSecondaryOption!!),
        accent = parseColor(accentColorOption!!),
        accentPressed = parseColor(accentColorPressedOption!!),
    )

    // Views read the colors from the resources.
    dependsOn(
        resourcePatch {
            execute {
                val colors = themeColors()
                document("res/values/colors.xml").use { document ->
                    val matched = mutableSetOf<Int>()
                    document.getElementsByTagName("color").asSequence().forEach { node ->
                        val color = node as Element
                        colors.replaceResourceValue(color.textContent)?.let {
                            matched += parseColor(color.textContent.trim())
                            color.textContent = it
                        }
                    }
                    colors.requireAllMatched(matched, "resources")
                }

                if (darkPlayerOption!!) {
                    document(MINI_PLAYER_BACKGROUND).use { document ->
                        if (!document.replaceSolidColor(parseColor(backgroundColorSecondaryOption!!))) {
                            throw PatchException("Could not find the mini player background color")
                        }
                    }
                }
            }
        },
    )

    // The Compose UI (Encore) and some views hardcode the colors in code.
    execute {
        val colors = themeColors()
        val matched = mutableSetOf<Int>()

        val themedClasses = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.methods.any { it.loadsColor(colors) }) themedClasses += classDef
        }

        themedClasses.forEach { classDef ->
            mutableClassDefBy(classDef).methods.filter { it.loadsColor(colors) }.forEach { method ->
                method.implementation!!.instructions.withIndex().toList().forEach { (index, instruction) ->
                    val color = instruction.colorLiteral() ?: return@forEach
                    val replacement = colors.replaceOpaque(color) ?: return@forEach
                    matched += color
                    val register = (instruction as OneRegisterInstruction).registerA
                    val smali = when (instruction.opcode) {
                        Opcode.CONST -> "const v$register, $replacement"
                        else -> "const-wide v$register, ${replacement.toLong() and 0xFFFFFFFFL}L"
                    }
                    method.replaceInstruction(index, smali)
                }
            }
        }

        colors.requireAllMatched(matched, "code")

        // After the replacement above, so that it does not touch the inserted color.
        if (darkPlayerOption!!) {
            useDarkPlayer(
                background = parseColor(backgroundColorOption!!),
                miniPlayerBackground = parseColor(backgroundColorSecondaryOption!!),
            )
        }
    }
}
