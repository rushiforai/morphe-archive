package app.spicetify.patches.spotify.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.spicetify.patches.spotify.settings.NativeSettingsAbi
import app.spicetify.patches.spotify.settings.themeSettingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import java.util.Properties

internal const val COLOR = "Lp/iae1;->g(J)J"
private const val MAP = "Lapp/spicetify/extension/spotify/theme/EncorePalette;->map(J)J"

// Stock Encore background and accent constants that the in-app theme replaces.
internal val paletteColors = listOf(
    0xFF121212L, 0xFF1F1F1FL, 0xFF2A2A2AL, 0xFF191919L, 0xFF282828L,
    0xFF1ED760L, 0xFF3BE477L, 0xFF1ABC54L,
)

private val themeResourcesPatch = resourcePatch {
    execute { document("res/values/colors.xml").use(::requireThemeColorResources) }
}

@Suppress("unused")
val themePatch = bytecodePatch(
    name = "Theme colors",
    description = "Choose a theme, such as OLED, or your own colors in Spicetify settings. Restart Spotify after changing it. " +
        "Some screens and hardcoded colors keep Spotify's colors.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(themeSettingsPatch, themeResourcesPatch)

    execute {
        val snapshot = Properties().apply {
            NativeSettingsAbi::class.java.getResourceAsStream("/theme/palette-9.1.80.2221.properties")!!.use(::load)
        }
        for (type in snapshot.stringPropertyNames()) {
            val definition = classDefByOrNull(type) ?: throw PatchException("Spotify palette ABI changed: missing $type")
            if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
                throw PatchException("Spotify palette ABI changed: $type. Use the verified Spotify 9.1.80.2221 APK.")
            }
        }

        // Each pinned class is one of Encore's palette variants; hook every stock theme constant it loads.
        snapshot.stringPropertyNames().sorted().forEach(::hookPalette)
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.hookPalette(type: String) {
    val initializer = mutableClassDefBy(type).methods.single { it.name == "<clinit>" }
    val instructions = initializer.implementation!!.instructions.toList()
    val sites = instructions.indices.filter {
        instructions[it].opcode == Opcode.CONST_WIDE && (instructions[it] as WideLiteralInstruction).wideLiteral in paletteColors
    }
    if (sites.isEmpty()) throw PatchException("Encore palette $type has no theme colors.")
    val colors = sites.map { (instructions[it] as WideLiteralInstruction).wideLiteral }
    if (colors.size != colors.toSet().size) throw PatchException("Encore palette $type repeats a theme color constant.")
    sites.forEach { index ->
        if (!feedsColor(instructions, index)) throw PatchException("Encore palette $type constant no longer feeds Color().")
    }
    sites.sortedDescending().forEach { index ->
        val register = initializer.getInstruction<OneRegisterInstruction>(index).registerA
        initializer.addInstructions(index + 1, """
            invoke-static/range {v$register .. v${register + 1}}, $MAP
            move-result-wide v$register
        """.trimIndent())
    }
}

/**
 * True when the wide constant loaded at [index] is only ever read by Color() calls, directly or through
 * move-wide copies that satisfy the same rule, until its register is rewritten, and reaches Color() at least once.
 * Branches in that span are refused, because the value could then reach a different use on another path.
 */
internal fun feedsColor(instructions: List<Instruction>, index: Int): Boolean = colorReads(instructions, index) == true

/** Null when the value in the register loaded at [index] may reach a non-Color use; otherwise whether it reaches Color(). */
private fun colorReads(instructions: List<Instruction>, index: Int): Boolean? {
    val register = (instructions[index] as OneRegisterInstruction).registerA
    val pair = register..(register + 1)
    // A wide operand or write at x covers x and x + 1; a narrow one covers x only.
    val covers = { operand: Int, wide: Boolean -> if (wide) operand in (register - 1)..(register + 1) else operand in pair }
    var sawColor = false
    for (position in index + 1 until instructions.size) {
        val next = instructions[position]
        val name = next.opcode.toString()
        if (name.startsWith("IF_") || name.startsWith("GOTO") || name.endsWith("_SWITCH")) return null
        val writes = next.opcode.setsRegister() && next is OneRegisterInstruction
        when (next) {
            is FiveRegisterInstruction, is RegisterRangeInstruction -> {
                // Invoke argument lists name each half of a wide register, so only the pair itself counts.
                val arguments = if (next is FiveRegisterInstruction) {
                    listOf(next.registerC, next.registerD, next.registerE, next.registerF, next.registerG).take(next.registerCount)
                } else {
                    val range = next as RegisterRangeInstruction
                    (range.startRegister until range.startRegister + range.registerCount).toList()
                }
                if (arguments.any { it in pair }) {
                    if ((next as? ReferenceInstruction)?.reference?.toString() != COLOR || arguments.firstOrNull() != register) return null
                    sawColor = true
                }
            }
            else -> {
                val wide = "WIDE" in name
                val operands = buildList {
                    if (next is OneRegisterInstruction && !writes) add(next.registerA)
                    if (next is TwoRegisterInstruction) add(next.registerB)
                    if (next is ThreeRegisterInstruction) add(next.registerC)
                }
                if (operands.any { covers(it, wide) }) {
                    val copy = name.startsWith("MOVE_WIDE") && (next as TwoRegisterInstruction).registerB == register
                    if (!copy) return null
                    if (colorReads(instructions, position) ?: return null) sawColor = true
                }
            }
        }
        if (writes && covers((next as OneRegisterInstruction).registerA, next.opcode.setsWideRegister())) return sawColor
        if (name.startsWith("RETURN") || name == "THROW") return sawColor
    }
    return sawColor
}
