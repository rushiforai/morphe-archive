/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.transitions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Where Facebook decides that a tab or the Menu slides in. Both places already have a way through
 * without the slide, which Facebook takes on its own for some taps, so the patch only steers into it.
 *
 * A tab: the pager controller reads the style the tab comes in with, an Integer, and compares its
 * intValue() with the one that slides:
 *
 *     invoke-virtual {v9}, Ljava/lang/Number;->intValue()I
 *     move-result v0
 *     const/4 v12, 0x0
 *     if-eq v0, v13, :slide      # equal: jump the pager, then slide the two pages past each other
 *     ...                        # else: jump the pager, run what follows the switch, return
 *
 * The Menu: SlidingPanelScrollView.snapToPanel(panel, reason, animate) hands `animate` on to the
 * method that scrolls, which calls scrollTo when it's false and smoothScrollTo when it's true. The
 * settle after a swipe calls that method directly, so it keeps its glide.
 */

internal const val PATCH = "Turn off screen transitions"

internal const val SCREEN_TRANSITIONS = "$EXTENSION_PACKAGE/misc/ScreenTransitions;"
internal const val TAB_STYLE = "$SCREEN_TRANSITIONS->tabStyle(II)I"
internal const val PANEL_SLIDES = "$SCREEN_TRANSITIONS->panelSlides(Z)Z"

private const val INT_VALUE = "intValue()I"

private fun readsAnInt(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return false
    val call = (instruction as ReferenceInstruction).reference as? MethodReference ?: return false
    return "${call.name}()${call.returnType}" == INT_VALUE && call.parameterTypes.isEmpty() &&
        (call.definingClass == "Ljava/lang/Number;" || call.definingClass == "Ljava/lang/Integer;")
}

/**
 * Has the pager controller ask the extension about the style a tab comes in with, right after it
 * reads it and before it compares it with the style that slides. Returns the two registers, the
 * style's and the sliding style's.
 */
internal fun MutableMethod.quietTabSwitch(): Pair<Int, Int> {
    val where = "$definingClass->$name"
    val code = implementation?.instructions?.toList() ?: throw PatchException("$PATCH: $where has no body")
    val reads = code.indices.filter { readsAnInt(code[it]) }
    if (reads.size != 1) throw PatchException("$PATCH: $where reads ${reads.size} styles, expected 1")
    val result = reads.single() + 1
    if (code[result].opcode != Opcode.MOVE_RESULT) throw PatchException("$PATCH: $where doesn't keep the style it reads")
    val style = (code[result] as OneRegisterInstruction).registerA
    // The comparison follows within a constant or two, and nothing in between may set either side of it.
    val test = (result + 1..minOf(result + 3, code.lastIndex)).firstOrNull { code[it].opcode == Opcode.IF_EQ }
        ?: throw PatchException("$PATCH: $where doesn't compare the style it reads")
    val compared = code[test] as TwoRegisterInstruction
    val slide = when (style) {
        compared.registerA -> compared.registerB
        compared.registerB -> compared.registerA
        else -> throw PatchException("$PATCH: $where compares something other than the style it reads")
    }
    val between = code.subList(result + 1, test)
    if (between.any { (it as? OneRegisterInstruction)?.registerA.let { set -> set == style || set == slide } }) {
        throw PatchException("$PATCH: $where sets a side of the comparison after reading the style")
    }
    // An invoke names its registers in four bits.
    if (style > 15 || slide > 15) throw PatchException("$PATCH: $where keeps the style in v$style and v$slide, past v15")
    addInstructions(
        result + 1,
        """
            invoke-static { v$style, v$slide }, $TAB_STYLE
            move-result v$style
        """,
    )
    return style to slide
}

/** Has snapToPanel ask the extension whether the panel slides in, before anything reads `animate`. */
internal fun MutableMethod.quietPanelSnap() {
    addInstructions(
        0,
        """
            invoke-static { p3 }, $PANEL_SLIDES
            move-result p3
        """,
    )
}
