/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.transitions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.patches.facebook.misc.extension.liveAcrossInjection
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.util.MethodUtil

/*
 * Tab strips inside a screen. Their pages sit in an androidx ViewPager, and a tap on a tab asks the
 * pager for its page with setCurrentItem, which slides when it's asked to (or, with no flag, once
 * the pager has been laid out). The pager itself isn't hooked: stories, photo viewers and carousels
 * move it too, and some of them wait for the settle a slide reports. Only two callers that a tap
 * on a tab goes through ask the extension:
 *
 * - Facebook's shared strip, TabbedViewPagerIndicator. The listener it puts on each tab calls
 *   setCurrentItem(position, true) (581 `LX/kCA;->onClick`); the patch hands that true to the
 *   extension first.
 * - The composer's Feelings and Activities picker, whose setTab calls setCurrentItem(position).
 *   With the switch on it calls setCurrentItem(position, false) instead.
 *
 * Both setCurrentItem methods keep Redex names (581 `A0L(I)V` and `A0Q(IZ)V`). The strip's
 * listener names the two-argument one, and the picker borrows it from there.
 */

internal const val VIEW_PAGER = "Landroidx/viewpager/widget/ViewPager;"
internal const val PAGE_SLIDES = "$SCREEN_TRANSITIONS->pageSlides(Z)Z"
private const val CLICK_LISTENER = "Landroid/view/View\$OnClickListener;"

private fun Instruction.called() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** A call on the pager taking a page and nothing else, or a page and a flag. */
private fun Instruction.asksThePager(parameters: List<String>): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val call = called() ?: return false
    return call.definingClass == VIEW_PAGER && call.returnType == "V" &&
        call.parameterTypes.map(CharSequence::toString) == parameters
}

private val PAGE_AND_FLAG = listOf("I", "Z")
private val PAGE_ONLY = listOf("I")

/** Whether some other instruction than the one before [index] can go on to it. */
private fun Method.jumpedTo(index: Int): Boolean =
    ControlFlow.of(this).normal.withIndex().any { (from, next) -> from != index - 1 && index in next }

/** The strip: the one object field of its onPageSelected runnable, which holds a ViewPager. */
internal fun BytecodePatchContext.pagerTabStrip(): ClassDef {
    val runnable = classDefBy(PagerTabsSelectedFingerprint.method.definingClass)
    val types = runnable.instanceFields.map { it.type }.filter { it.startsWith("L") }.distinct()
    val strip = types.singleOrNull()?.let(::classDefByOrNull)
        ?: throw PatchException("$PATCH: ${runnable.type} holds ${types.size} objects, expected the tab strip")
    if (strip.fields.none { it.type == VIEW_PAGER }) {
        throw PatchException("$PATCH: ${strip.type} holds no ViewPager, so it isn't the tab strip")
    }
    return strip
}

/**
 * The listener [strip] puts on each tab: a class one of the strip's methods makes, a click listener
 * whose onClick asks the pager for a page with a flag.
 */
internal fun BytecodePatchContext.pagerTabClick(strip: ClassDef): MutableMethod {
    val made = strip.methods.flatMap { method ->
        method.implementation?.instructions?.toList().orEmpty()
            .filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
    }.distinct()
    val clicks = made.mapNotNull(::classDefByOrNull)
        .filter { CLICK_LISTENER in it.interfaces }
        .mapNotNull { listener ->
            listener.methods.singleOrNull { method ->
                method.name == "onClick" && method.implementation?.instructions?.toList().orEmpty().any { it.asksThePager(PAGE_AND_FLAG) }
            }
        }
    val click = clicks.singleOrNull()
        ?: throw PatchException("$PATCH: ${strip.type} makes ${clicks.size} tab listeners that ask its pager for a page, expected one")
    return mutableClassDefBy(click.definingClass).methods.single { MethodUtil.methodSignaturesMatch(it, click) }
}

/**
 * Hands the flag the tab listener gives setCurrentItem to the extension first. Returns the pager's
 * setCurrentItem(page, flag), which the picker borrows.
 */
internal fun MutableMethod.quietPagerTabTap(): MethodReference {
    val where = "$definingClass->$name"
    val code = implementation!!.instructions.toList()
    val calls = code.indices.filter { code[it].asksThePager(PAGE_AND_FLAG) }
    val at = calls.singleOrNull() ?: throw PatchException("$PATCH: $where asks its pager ${calls.size} times, expected once")
    if (jumpedTo(at)) throw PatchException("$PATCH: $where can jump straight to its pager call")
    val call = code[at] as FiveRegisterInstruction
    val flag = call.registerE
    // The answer goes in the flag's own register, so nothing after the call may read the flag.
    if (flag in liveAcrossInjection(at + 1)) throw PatchException("$PATCH: $where reads v$flag again after its pager call")
    addInstructions(
        at,
        """
            invoke-static { v$flag }, $PAGE_SLIDES
            move-result v$flag
        """,
    )
    return code[at].called()!!
}

/**
 * Has the picker's setTab call [setPageAndFlag] with no slide in place of setCurrentItem(page),
 * while the extension says the page doesn't slide. Facebook's own call is left for when it does.
 */
internal fun MutableMethod.quietPickerTab(setPageAndFlag: MethodReference) {
    val where = "$definingClass->$name"
    val code = implementation!!.instructions.toList()
    val calls = code.indices.filter { code[it].asksThePager(PAGE_ONLY) }
    val at = calls.singleOrNull() ?: throw PatchException("$PATCH: $where asks its pager ${calls.size} times, expected once")
    if (at + 1 > code.lastIndex) throw PatchException("$PATCH: $where ends on its pager call")
    if (jumpedTo(at)) throw PatchException("$PATCH: $where can jump straight to its pager call")
    val call = code[at] as FiveRegisterInstruction
    val pager = call.registerC
    val page = call.registerD
    // One local for the answer and the flag, free on both ways on: Facebook's call and after it.
    val flag = freeLocalsAt(PATCH, at, 1).single()
    addInstructionsWithLabels(
        at,
        """
            const/4 v$flag, 0x1
            invoke-static { v$flag }, $PAGE_SLIDES
            move-result v$flag
            if-nez v$flag, :slide
            invoke-virtual { v$pager, v$page, v$flag }, $setPageAndFlag
            goto :shown
        """,
        ExternalLabel("slide", getInstruction(at)),
        ExternalLabel("shown", getInstruction(at + 1)),
    )
}
