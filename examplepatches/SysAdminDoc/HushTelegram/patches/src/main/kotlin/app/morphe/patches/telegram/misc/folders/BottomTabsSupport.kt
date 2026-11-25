/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val BOTTOM_TABS = "$EXTENSION_PACKAGE/misc/BottomFolderTabs;"
private const val OBJECT = "Ljava/lang/Object;"
private const val VIEW = "Landroid/view/View;"
internal const val BOTTOM_PLACE = "$BOTTOM_TABS->place($OBJECT${OBJECT}F)V"
internal const val BOTTOM_HEADER = "$BOTTOM_TABS->headerShare(${OBJECT}F)F"
internal const val BOTTOM_TOP = "$BOTTOM_TABS->topShare(${OBJECT}F)F"
internal const val BOTTOM_PADDING = "$BOTTOM_TABS->bottomPadding(${OBJECT}I)I"
internal const val BOTTOM_COMPOSE = "$BOTTOM_TABS->composeLift(${OBJECT}F)F"
internal const val BOTTOM_CAPTURE = "$BOTTOM_TABS->captureTop(${OBJECT}I)I"
internal const val STRIP_TRANSLATION = "$VIEW->setTranslationY(F)V"
private const val STRIP_ALPHA = "$VIEW->getAlpha()F"
private const val STRIP_SET_ALPHA = "$VIEW->setAlpha(F)V"
internal const val LIST_PADDING_BOTTOM = "$VIEW->getPaddingBottom()I"

/** The 43 dp the chat list moves what's under the strip by, as float bits. */
private const val STRIP_ROOM = 0x422c0000

/** The bar's 56 dp, which the blur capture measures up from the bar's bottom, as float bits. */
private const val BAR_ROOM = 0x42600000

/** One edit of [method] at [index]: [code] in front of it, or in its place with [replaces]. */
internal class BottomTabEdit(val method: MutableMethod, val index: Int, val code: String, val size: Int, val replaces: Boolean = false)

/** What the stubs read and call on the chat list ([list]). */
internal class BottomTabsRefs(val list: String, val strip: String, val nav: String, val barRoom: String, val place: String, val compose: String)

/** The hooks that move the folder tabs, found and checked before anything is edited, or [missing], why they can't go in. */
internal class BottomTabsPlan(val edits: List<BottomTabEdit>, val refs: BottomTabsRefs?, val missing: String?) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        for ((method, edits) in edits.groupBy { it.method }) {
            val target = into(method)
            val before = target.implementation!!.instructions.size
            // The later edit first, so the earlier index still holds.
            for (edit in edits.sortedByDescending { it.index }) {
                if (edit.replaces) target.replaceInstruction(edit.index, edit.code)
                else target.addInstructionsAtControlFlowLabel(edit.index, edit.code)
            }
            // smali drops an instruction it can't build and only logs it.
            tabsFit(target.implementation!!.instructions.size - before == edits.filterNot { it.replaces }.sumOf { it.size },
                "the moved folder tabs didn't compile whole")
        }
    }

    /** The same edits on copies, so a register or smali problem shows before the app is touched. */
    fun rehearse() = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
    } catch (failed: RuntimeException) {
        throw NoBottomTabs("the moved folder tabs don't compile (${failed.javaClass.simpleName}: ${failed.message})")
    }
}

/** The runtime the hooks call, the extension's own, so a change there refuses the patch. */
internal fun BytecodePatchContext.requireBottomTabsRuntime() {
    requireStatusMethod("bottomTabs")
    controlHook(BOTTOM_TABS, "place", listOf(OBJECT, OBJECT, "F"), "V")
    controlHook(BOTTOM_TABS, "headerShare", listOf(OBJECT, "F"), "F")
    controlHook(BOTTOM_TABS, "topShare", listOf(OBJECT, "F"), "F")
    controlHook(BOTTOM_TABS, "bottomPadding", listOf(OBJECT, "I"), "I")
    controlHook(BOTTOM_TABS, "composeLift", listOf(OBJECT, "F"), "F")
    controlHook(BOTTOM_TABS, "captureTop", listOf(OBJECT, "I"), "I")
    controlHook(BOTTOM_TABS, "tabStrip", listOf(OBJECT), OBJECT)
    controlHook(BOTTOM_TABS, "navHeightOf", listOf(OBJECT), "I")
    controlHook(BOTTOM_TABS, "barRoomOf", listOf(OBJECT), "I")
    controlHook(BOTTOM_TABS, "placeAgain", listOf(OBJECT), "V")
    controlHook(BOTTOM_TABS, "composeAgain", listOf(OBJECT), "V")
}

/** Why this build's folder tabs can't move. */
private class NoBottomTabs(why: String) : Exception(why)

private fun tabsFit(ok: Boolean, why: String) {
    if (!ok) throw NoBottomTabs(why)
}

private fun Instruction.tabsRaw() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.tabsCall() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.tabsTwo() = this as? TwoRegisterInstruction
private fun Instruction.highBits() = if (opcode == Opcode.CONST_HIGH16) (this as? NarrowLiteralInstruction)?.narrowLiteral else null
private fun Method.isStaticMethod() = AccessFlags.STATIC.isSet(accessFlags)
private fun Method.takes(vararg types: String) = parameterTypes.map(CharSequence::toString) == types.toList()

/**
 * Finds where the chat list answers for the folder tab strip. Telegram's strip sits under the header
 * and the rest of the screen is worked out around it, so these are the places the move has to reach:
 *  - the method that places everything under the header sets the strip's translation, and then
 *    reads the strip's fade to push the views below it down by 43 dp;
 *  - the list view's onMeasure reads the strip's visibility factor for its top padding, and asks
 *    the chat list for its bottom padding;
 *  - the method that places the compose button subtracts the extra lift from its offset;
 *  - the blur capture works out where the bar's top is.
 *
 * Plus Messenger has its own option for tabs at the bottom and places the strip around it, so it
 * gets "the chat list places its folder tabs its own way" and keeps its own.
 */
internal fun BytecodePatchContext.resolveBottomTabs(refs: LaunchRefs): BottomTabsPlan = try {
    bottomTabs(refs).also { it.rehearse() }
} catch (missing: NoBottomTabs) {
    BottomTabsPlan(emptyList(), null, missing.message)
} catch (failed: RuntimeException) {
    // Code this build reads in a way nothing here expected.
    BottomTabsPlan(emptyList(), null, "the folder tabs' place can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

/** Where [method] sets the strip's translation and reads its fade right after, if that's what it does. */
private class StripPlace(val method: MutableMethod, val read: Int, val set: Int, val fade: Int)

private fun stripPlaceIn(method: MutableMethod, strip: String): StripPlace? {
    val body = method.controlBody()
    for (read in 0 until body.size - 7) {
        val first = body[read].tabsTwo()
        val set = read + 3
        val fade = set + 3
        if (body[read].opcode != Opcode.IGET_OBJECT || body[read].tabsRaw() != strip || first == null) continue
        if (body[read + 1].opcode != Opcode.IF_EQZ || body[read + 1].namedRegisters() != listOf(first.registerA)) continue
        if (body[set].opcode != Opcode.INVOKE_VIRTUAL || body[set].controlRef() != STRIP_TRANSLATION) continue
        if (body[set].namedRegisters().first() != first.registerA) continue
        if (body[set + 1].opcode != Opcode.IGET_OBJECT || body[set + 1].tabsRaw() != strip) continue
        if (body[set + 2].controlRef() != STRIP_ALPHA || body[fade].opcode != Opcode.MOVE_RESULT) continue
        if (body[fade + 1].highBits() != STRIP_ROOM) continue
        return StripPlace(method, read, set, fade)
    }
    return null
}

private fun BytecodePatchContext.bottomTabs(refs: LaunchRefs): BottomTabsPlan {
    val list = refs.list
    val owner = tgMutableClassDefByOrNull(list)
    tabsFit(owner != null, "the chat list is missing")
    val methods = owner!!.methods.toList()
    val plain = methods.filter { !it.isStaticMethod() && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null }
    val edits = mutableListOf<BottomTabEdit>()
    fun low(vararg registers: Int) = tabsFit(registers.all { it <= 15 }, "the folder tabs' place keeps its registers out of reach")
    // A subclass's override would run without the hook, and these classes have none only while the method is final.
    fun mustBeFinal(method: Method, why: String) = tabsFit(AccessFlags.FINAL.isSet(method.accessFlags), why)

    // The strip's place, and what the views below it make of its fade.
    val site = plain.mapNotNull { stripPlaceIn(it, refs.strip) }.singleOrNull()
    tabsFit(site != null, "the chat list places its folder tabs its own way")
    val place = site!!.method
    mustBeFinal(place, "the chat list's folder tab placing can be overridden")
    val placeBody = place.controlBody()
    val self = placeBody[site.read].tabsTwo()!!.registerB
    val (strip, value) = placeBody[site.set].namedRegisters()
    val fade = placeBody[site.fade].namedRegisters().single()
    low(self, strip, value, fade)
    edits += BottomTabEdit(place, site.set, "invoke-static {v$self, v$strip, v$value}, $BOTTOM_PLACE", 1, replaces = true)
    edits += BottomTabEdit(place, site.fade + 1, "invoke-static {v$self, v$fade}, $BOTTOM_HEADER\nmove-result v$fade", 2)
    val placeRef = place.toString()

    // The strip's visibility factor, the first thing the method that fades the strip asks.
    val factors = plain.filter { method ->
        val body = method.controlBody()
        body.any { it.tabsRaw() == placeRef } && body.any { it.controlRef() == STRIP_SET_ALPHA } &&
            body.any { it.opcode == Opcode.IGET_OBJECT && it.tabsRaw() == refs.strip }
    }.mapNotNull { method ->
        method.controlBody().firstOrNull { instruction ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction.tabsCall()?.let {
                it.definingClass == list && it.returnType == "F" && it.parameterTypes.map(CharSequence::toString) == listOf("Z")
            } == true
        }
    }
    val factorRef = factors.map { it.tabsRaw() }.distinct().singleOrNull()
    tabsFit(factorRef != null, "the chat list fades its folder tabs another way")

    // The list view reads it for its top padding, and asks the chat list for its bottom padding.
    val measures = mutableListOf<MutableMethod>()
    forEachClassMentioning(Mention.reference(factors.first().controlRef()!!)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        tgMutableClassDefBy(cls.type).methods.filterTo(measures) { method ->
            method.origName == "onMeasure" && method.takes("I", "I") && method.controlBody().any { it.tabsRaw() == factorRef }
        }
    }
    val measure = measures.singleOrNull()
    tabsFit(measure != null, "the chat list's view isn't measured from the folder tabs")
    tabsFit(AccessFlags.FINAL.isSet(measure!!.accessFlags), "the chat list's view can be measured another way")
    val measured = measure.controlBody()
    val factorAt = measured.indexOfFirst { it.opcode == Opcode.INVOKE_VIRTUAL && it.tabsRaw() == factorRef }
    tabsFit(measured.getOrNull(factorAt + 1)?.opcode == Opcode.MOVE_RESULT, "the chat list's view drops the folder tabs' share")
    val listAt = measured[factorAt].namedRegisters().first()
    val share = measured[factorAt + 1].namedRegisters().single()
    low(listAt, share)
    edits += BottomTabEdit(measure, factorAt + 2, "invoke-static {v$listAt, v$share}, $BOTTOM_TOP\nmove-result v$share", 2)

    val asks = (factorAt until measured.size - 1).filter { at ->
        measured[at].opcode == Opcode.INVOKE_VIRTUAL && measured[at + 1].opcode == Opcode.MOVE_RESULT &&
            measured[at].tabsCall()?.let { it.definingClass == list && it.returnType == "I" && it.parameterTypes.isEmpty() } == true &&
            (at + 2..minOf(at + 6, measured.lastIndex)).any { measured[it].controlRef() == LIST_PADDING_BOTTOM }
    }
    tabsFit(asks.size == 1, "the chat list's view gets its bottom padding another way")
    val paddingRef = measured[asks.single()].tabsRaw()
    val padding = methods.singleOrNull { it.toString() == paddingRef && !it.isStaticMethod() }
    tabsFit(padding != null, "the chat list's bottom padding is missing")
    mustBeFinal(padding!!, "the chat list's bottom padding can be overridden")

    // Its last answer is the navigation bar's height plus the room kept for the bottom bar.
    val paddingBody = padding.controlBody()
    tabsFit(paddingBody.size >= 4, "the chat list's bottom padding changed")
    val (navRead, roomRead, sum, done) = paddingBody.takeLast(4)
    tabsFit(navRead.opcode == Opcode.IGET && roomRead.opcode == Opcode.IGET && sum.opcode == Opcode.ADD_INT_2ADDR && done.opcode == Opcode.RETURN,
        "the chat list's bottom padding changed")
    val listSelf = navRead.tabsTwo()!!.registerB
    val result = navRead.tabsTwo()!!.registerA
    tabsFit(roomRead.tabsTwo()!!.registerB == listSelf && sum.tabsTwo()!!.registerA == result &&
        sum.tabsTwo()!!.registerB == roomRead.tabsTwo()!!.registerA && done.namedRegisters() == listOf(result),
        "the chat list's bottom padding changed")
    low(listSelf, result)
    edits += BottomTabEdit(padding, paddingBody.lastIndex, "invoke-static {v$listSelf, v$result}, $BOTTOM_PADDING\nmove-result v$result", 2)
    val nav = navRead.tabsRaw()!!
    val barRoom = roomRead.tabsRaw()!!

    // The compose button: minus the navigation bar, minus its own offset, minus the extra lift.
    val composes = plain.filter { method ->
        val body = method.controlBody()
        body.size >= 7 && body[0].opcode == Opcode.IGET && body[0].tabsRaw() == nav && body[1].opcode == Opcode.NEG_INT &&
            body[2].opcode == Opcode.IGET && body[3].opcode == Opcode.SUB_INT_2ADDR && body[4].opcode == Opcode.INT_TO_FLOAT &&
            body[5].opcode == Opcode.IGET && body[5].controlField()?.type == "F" && body[6].opcode == Opcode.SUB_FLOAT_2ADDR &&
            body[6].tabsTwo()!!.registerB == body[5].tabsTwo()!!.registerA
    }
    val compose = composes.singleOrNull()
    tabsFit(compose != null, "the chat list places its compose button another way")
    mustBeFinal(compose!!, "the chat list's compose button placing can be overridden")
    val lift = compose.controlBody()[5].tabsTwo()!!
    low(lift.registerA, lift.registerB)
    edits += BottomTabEdit(compose, 6, "invoke-static {v${lift.registerB}, v${lift.registerA}}, $BOTTOM_COMPOSE\nmove-result v${lift.registerA}", 2)

    // The bar's blur: its top is the bar's bottom minus 56 dp.
    val captures = methods.filter { it.isStaticMethod() && it.returnType == "V" && it.takes(list, "I") }.flatMap { method ->
        val body = method.controlBody()
        body.indices.filter { at ->
            at >= 3 && body[at].opcode == Opcode.SUB_INT && body[at - 1].opcode == Opcode.MOVE_RESULT &&
                body[at - 2].opcode == Opcode.INVOKE_STATIC && body[at - 3].highBits() == BAR_ROOM &&
                (0 until at).any { body[it].opcode == Opcode.IGET && body[it].tabsRaw() == nav }
        }.map { method to it }
    }
    tabsFit(captures.size == 1, "the chat list's blur finds the bottom bar another way")
    val (capture, captureAt) = captures.single()
    val captureBody = capture.controlBody()
    val captureSelf = captureBody.subList(0, captureAt).last { it.opcode == Opcode.IGET && it.tabsRaw() == nav }.tabsTwo()!!.registerB
    tabsFit(captureSelf == capture.implementation!!.registerCount - 2, "the chat list's blur reads the bar from elsewhere")
    val top = captureBody[captureAt].namedRegisters().first()
    low(captureSelf, top)
    edits += BottomTabEdit(capture, captureAt + 1, "invoke-static {v$captureSelf, v$top}, $BOTTOM_CAPTURE\nmove-result v$top", 2)

    // The stubs read and call these from the extension.
    val composeRef = compose.toString()
    for (reference in listOf(refs.strip, nav, barRoom, placeRef, composeRef)) {
        try {
            requireReachable(reference, false)
        } catch (failed: PatchException) {
            throw NoBottomTabs("$reference isn't reachable from the extension")
        }
    }
    return BottomTabsPlan(edits, BottomTabsRefs(list, refs.strip, nav, barRoom, placeRef, composeRef), null)
}

/** Gives BottomFolderTabs' stubs this build's chat list. */
internal fun BytecodePatchContext.writeBottomTabsStubs(refs: BottomTabsRefs) {
    writeStub(BOTTOM_TABS, "tabStrip", 1, "check-cast p0, ${refs.list}\niget-object p0, p0, ${refs.strip}\nreturn-object p0")
    writeStub(BOTTOM_TABS, "navHeightOf", 1, "check-cast p0, ${refs.list}\niget p0, p0, ${refs.nav}\nreturn p0")
    writeStub(BOTTOM_TABS, "barRoomOf", 1, "check-cast p0, ${refs.list}\niget p0, p0, ${refs.barRoom}\nreturn p0")
    writeStub(BOTTOM_TABS, "placeAgain", 1, "check-cast p0, ${refs.list}\ninvoke-virtual {p0}, ${refs.place}\nreturn-void")
    writeStub(BOTTOM_TABS, "composeAgain", 1, "check-cast p0, ${refs.list}\ninvoke-virtual {p0}, ${refs.compose}\nreturn-void")
}
