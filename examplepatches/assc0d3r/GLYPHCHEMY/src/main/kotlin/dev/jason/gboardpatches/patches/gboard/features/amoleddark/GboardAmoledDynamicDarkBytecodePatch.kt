package dev.jason.gboardpatches.patches.gboard.features.amoleddark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

/**
 * Gboard paints its Material-coloured keyboard from the palette built by `Lrgr;`, the only class
 * that produces the `color_gm3_*` token map (and whose `b()` names the variant `gm3-dark-…` or
 * `gm3-light-…` from `Lrgr;->a:Z`). The style sheets under `assets/theme` resolve every panel and
 * chrome colour from that palette:
 *
 * - `default_keyboard_background_primary_color`, `_secondary_` and `_header_`, plus
 *   `.keyboard-title-frame.v2` and `.keyboard-header-area.panel.v2`, map to
 *   `color_gm3_surface_container`.
 * - `.keyboard-body-area.for-non-prime-body`, `.keyboard-title-frame` and
 *   `.keyboard-header-area.for-expression-nav` map to `color_gm3_surface_container_low`.
 * - `.keyboard-header-area.panel` maps to `color_gm3_surface_container_lowest`.
 * - `style_sheet_dynamic_color_dark.binarypb` maps `.keyboard-title-frame` to
 *   `color_gm3_surface_dim`.
 *
 * Google fills those entries from the wallpaper neutral ramp (`system_surface_container_dark` and
 * friends on Android 14+, the neutral palette on Android 12-13), which is a grey rather than
 * black. Overriding exactly those four entries of the dark palette turns the whole keyboard chrome
 * black, while the light palette, the accent colours and the elevated surfaces (bright, high,
 * highest: chips, pressed keys, dialogs) keep Google's values.
 */
internal val gboardAmoledDynamicDarkBytecodePatch = bytecodePatch(
    description = "Force pure black panel surfaces into the Material dark palette.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val isLight = GboardVersionBindings.dynamicDarkPaletteIsLightField
        val targets = listOf(
            GboardVersionBindings.dynamicDarkPaletteSurfaceDimField,
            GboardVersionBindings.dynamicDarkPaletteSurfaceContainerField,
            GboardVersionBindings.dynamicDarkPaletteSurfaceContainerLowField,
            GboardVersionBindings.dynamicDarkPaletteSurfaceContainerLowestField,
        )
        check(isLight.type == "Z") { "Unexpected ${isLight.reference} type ${isLight.type}" }
        isLight.resolve(this)
        targets.forEach { target ->
            check(target.type == "I") { "Unexpected ${target.reference} type ${target.type}" }
            target.resolve(this)
        }

        GboardVersionBindings.dynamicDarkPaletteConstructor.resolve(this).applyAmoledDarkPalette(
            isLightField = isLight.reference,
            surfaceFields = targets.map { it.reference },
        )
    }
}

/** `#FF000000`, the AMOLED black Google's `system_surface_container_dark` tints towards grey. */
internal const val AMOLED_DARK_BACKGROUND = "0xff000000"

/** [AMOLED_DARK_BACKGROUND] as the signed 32-bit literal smali and the dex store. */
internal const val AMOLED_DARK_COLOR = -0x1000000

/**
 * Rewrites the dark palette of the constructor that builds `Lrgr;` so [surfaceFields] become pure
 * black. The light palette is untouched: `Lrgr;->a:Z` is Gboard's own is-light flag, which the
 * palette writes from its constructor argument before the appended guard runs.
 */
internal fun MutableMethod.applyAmoledDarkPalette(
    isLightField: String,
    surfaceFields: List<String>,
) {
    require(surfaceFields.isNotEmpty()) { "No palette fields to override in $definingClass->$name" }
    val implementation = implementation ?: error("No instructions in $definingClass->$name")
    val instructions = implementation.instructions.toList()
    fun writes(field: String) = instructions.count { instruction ->
        instruction.opcode == Opcode.IPUT &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == field
    }
    val alreadyPatched = instructions.any { instruction ->
        instruction.opcode == Opcode.CONST_HIGH16 &&
            (instruction as NarrowLiteralInstruction).narrowLiteral == AMOLED_DARK_COLOR
    }
    if (alreadyPatched) return
    surfaceFields.forEach { field ->
        check(writes(field) >= 1) {
            "Could not find the stock $field write in $definingClass->$name"
        }
    }
    val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
    check(returns.size == 1) {
        "Expected one RETURN_VOID in $definingClass->$name, found ${returns.size}"
    }
    // Parameters are the trailing registers; the constructor's own locals are never live at the
    // single return, so the highest one can carry the guard's scratch value.
    val parameterRegisters = 1 + parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val scratch = implementation.registerCount - parameterRegisters - 1
    check(scratch >= 0) { "No local register available in $definingClass->$name" }
    val returnIndex = returns.single()
    // The branch target must be the stock RETURN_VOID, so it is supplied as an external label:
    // labels defined inside an addInstructions snippet are compiled against their own method and
    // do not survive the move into this implementation.
    addInstructionsWithLabels(
        returnIndex,
        buildString {
            appendLine("iget-boolean v$scratch, p0, $isLightField")
            appendLine("if-nez v$scratch, :amoled_dark_surface_done")
            appendLine("const/high16 v$scratch, $AMOLED_DARK_BACKGROUND")
            surfaceFields.forEach { appendLine("iput v$scratch, p0, $it") }
        },
        ExternalLabel("amoled_dark_surface_done", getInstruction(returnIndex)),
    )
}
