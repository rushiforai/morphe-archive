/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.parameterRegisterNumber
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireLocals
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.one
import app.morphe.patches.pinterest.ui.parameters
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Keep Home feed"
internal const val HOME_FEED_FRAGMENT = "Lcom/pinterest/feature/home/mainfeed/HomeFeedFragment;"
private const val HOME_FEED = "$EXTENSION_PACKAGE/ads/HomeFeed;"

/** How long Home waits, in milliseconds, before coming back to it refreshes the feed. */
internal const val HOME_AWAY_MS = 300_000L

/**
 * Holds the Home feed refreshes Pinterest starts on its own. Every Home refresh runs through one
 * static method on the Home presenter, the Kotlin default-argument bridge `(presenter, HashMap,
 * mask)`. Its 0x2 bit drops the map. Two kinds of call refresh without anyone asking:
 *
 * - The Home fragment's return check, `(J)V`, which hands the time away to the presenter's `(J, Z)V`,
 *   and that refreshes when it's more than [HOME_AWAY_MS] (14.44.0 inlines that check into the
 *   fragment). The hook reads that time away in the fragment and returns early, so the check never starts.
 * - The sticky refresh event, which the presenter's subscriber and its replay hand over with the
 *   0x2 bit clear and the event's map. Pinterest posts it with no map when Home is picked from the
 *   bottom bar after five minutes, on Back out of search results and for its server-side
 *   auto-refresh test. A map there is a notification's pin to put on top, so that refresh stays.
 *
 * Pull-to-refresh, the new pins prompt (0x2 set), the empty feed's Refresh and every other caller
 * pass mask 2 or 3 and keep refreshing.
 */
@Suppress("unused")
val keepHomeFeedPatch = bytecodePatch(
    name = PATCH,
    description = "Keeps your Home feed where you left it when you come back to Pinterest or to the Home tab, " +
        "instead of loading new pins on its own. Pull down to refresh whenever you want new pins. A second switch " +
        "lets Back leave Pinterest from a scrolled-down Home without jumping to the top first. Both start off. " +
        "Turn them on in HushPinterest settings > Feed.",
) {
    category("Feed")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("keepHomeFeed")
        requireStatusMethod("homeFeed")
        requireStatusMethod("homeBack")
        val resume = homeResumeCheck()
        val refresh = homeRefresh(resume)
        requireMaskShape(refresh)
        resume.requireLocals("$PATCH: return check", 1)
        refresh.requireLocals("$PATCH: refresh", 1)
        // Found and checked before any change, so a build without it still gets the two holds.
        val back = try {
            homeBack()
        } catch (missing: PatchException) {
            patchLog.warning("${missing.message}. Back on Home keeps jumping to the top first.")
            null
        }

        // The time away is a long, so the hook reads its register pair.
        val away = resume.parameterRegister(0)
        val awayHigh = "p" + (away.removePrefix("p").toInt() + 1)
        resume.addInstructionsWithLabels(0, """
            invoke-static/range { $away .. $awayHigh }, $HOME_FEED->holdResumeRefresh(J)Z
            move-result v0
            if-eqz v0, :hush_keep_resume
            return-void
        """, ExternalLabel("hush_keep_resume", resume.getInstruction(0)))

        val map = refresh.parameterRegister(1)
        val mask = refresh.parameterRegister(2)
        refresh.addInstructionsWithLabels(0, """
            invoke-static/range { $map .. $mask }, $HOME_FEED->holdHomeRefresh(Ljava/util/Map;I)Z
            move-result v0
            if-eqz v0, :hush_keep_refresh
            return-void
        """, ExternalLabel("hush_keep_refresh", refresh.getInstruction(0)))

        if (back != null) {
            val answer = "v${back.answer}"
            back.method.addInstructionsWithLabels(back.branch.fallThrough, """
                invoke-static {}, $HOME_FEED->leave()Z
                move-result $answer
                if-nez $answer, :hush_home_back
            """, ExternalLabel("hush_home_back", back.method.getInstruction(back.branch.leave)))
            enableCapability("homeBack")
        }

        enableCapability("homeFeed")
        enableStatus("keepHomeFeed")
    }
}

/** Home's Back handler, where its jump to the top starts, and the local the hook's answer borrows. */
private class HomeBack(val method: MutableMethod, val branch: HomeBackBranch, val answer: Int)

/**
 * Home's Back handler, the fragment's `()Z` that reads the scroll offset and, past Pinterest's
 * mark, scrolls to the top and refreshes through the presenter instead of letting Back go on.
 */
private fun BytecodePatchContext.homeBack(): HomeBack {
    val method = mutableClassDefBy(HOME_FEED_FRAGMENT).methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" && method.parameters().isEmpty() &&
            method.instructions().any {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "computeVerticalScrollOffset"
            } &&
            homeRefreshCalls(method).isNotEmpty()
    }.one("$PATCH: Home's Back handler")
    val branch = homeBackBranch(method)
    val answer = method.freeLocalsAt("$PATCH: Home's Back handler", branch.fallThrough, 1,
        targets = listOf(branch.leave), highest = 255).single()
    return HomeBack(method, branch, answer)
}

/** The instruction after Home's Back branch, where the jump to the top starts, and the branch's target, where Back goes on. */
internal class HomeBackBranch(val fallThrough: Int, val leave: Int)

/**
 * Where Home's Back handler [method] picks between letting Back go on and the jump to the top: the
 * one `if-le` after the scroll offset read. Its target has to run straight to a return of the
 * false the handler loaded before the branch, Pinterest's answer for a feed near the top, and the
 * presenter's refresh has to come after its fall-through. Nothing may jump to the fall-through, so
 * code put in front of it runs on that path alone.
 */
internal fun homeBackBranch(method: Method): HomeBackBranch {
    val what = "$PATCH: Home's Back handler ${method.definingClass}->${method.name}"
    val body = method.instructions()
    val offset = body.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "computeVerticalScrollOffset"
    }
    val branches = (offset + 1 until body.size).filter { body[it].opcode == Opcode.IF_LE }
    val branch = branches.singleOrNull()
        ?: throw PatchException("$what has ${branches.size} if-le after its scroll offset, not one")
    val flow = ControlFlow.of(method)
    val fallThrough = branch + 1
    val leave = flow.normal[branch].single { it != fallThrough }
    if (body.drop(fallThrough).none { homeRefreshCall(it) != null }) {
        throw PatchException("$what refreshes nothing after its branch")
    }
    // The branch itself falls through to it. Anything else reaching it is a jump there.
    val jumpedTo = body.indices.any { at ->
        (at != branch && fallThrough in flow.normal[at]) || fallThrough in flow.exceptional[at]
    }
    if (jumpedTo) throw PatchException("$what has a jump to the instruction after its branch")
    val returned = (leave until body.size).firstOrNull { body[it].opcode == Opcode.RETURN }
        ?: throw PatchException("$what returns nothing after its branch's target")
    val register = (body[returned] as OneRegisterInstruction).registerA
    val straight = (leave until returned).all { at ->
        flow.normal[at] == listOf(at + 1) && !body[at].writes(register)
    }
    val loaded = (branch - 1 downTo 0).map { body[it] }.firstOrNull { it.writes(register) }
    if (!straight || loaded == null || loaded.opcode != Opcode.CONST_4 || (loaded as NarrowLiteralInstruction).narrowLiteral != 0) {
        throw PatchException("$what no longer answers false straight from its branch's target")
    }
    return HomeBackBranch(fallThrough, leave)
}

private fun Instruction.writes(register: Int): Boolean {
    val a = (this as? OneRegisterInstruction)?.registerA ?: return false
    return (opcode.setsRegister() && a == register) || (opcode.setsWideRegister() && a + 1 == register)
}

/**
 * The Home fragment's `(J)V` return check: the scroll offset and the call handing the time away to
 * the presenter, or from 14.44.0 the presenter's check inlined into it.
 */
private fun BytecodePatchContext.homeResumeCheck(): MutableMethod =
    mutableClassDefBy(HOME_FEED_FRAGMENT).methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.parameters() == listOf("J") &&
            method.instructions().any {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "computeVerticalScrollOffset"
            } &&
            (homeAwayCalls(method).isNotEmpty() || isHomeAwayCheck(method))
    }.one("$PATCH: Home return check")

/** The `(J, Z)V` instance calls in [method]: the presenter's check of the time away. */
internal fun homeAwayCalls(method: Method): List<MethodReference> = method.instructions()
    .filter { it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
    .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
    .filter { call -> call.returnType == "V" && call.parameters() == listOf("J", "Z") }
    .distinctBy { it.toString() }

/** Whether [method] is the presenter's check: the five-minute literal and a refresh call. */
internal fun isHomeAwayCheck(method: Method) =
    method.instructions().any { (it as? WideLiteralInstruction)?.wideLiteral == HOME_AWAY_MS } && homeRefreshCalls(method).isNotEmpty()

/** The static `(presenter, HashMap, int)V` calls in [method]. */
internal fun homeRefreshCalls(method: Method): List<MethodReference> =
    method.instructions().mapNotNull(::homeRefreshCall).distinctBy { it.toString() }

/** What [instruction] calls when it's a static `(presenter, HashMap, int)V` call, else null. */
private fun homeRefreshCall(instruction: Instruction): MethodReference? {
    if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return null
    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    return call.takeIf {
        it.returnType == "V" && it.parameters().size == 3 && it.parameters()[0] == it.definingClass &&
            it.parameters()[1] == "Ljava/util/HashMap;" && it.parameters()[2] == "I"
    }
}

private fun BytecodePatchContext.homeRefresh(resume: Method): MutableMethod {
    val check = if (isHomeAwayCheck(resume)) resume else {
        val away = homeAwayCalls(resume).one("$PATCH: presenter check the return check calls")
        mutableClassDefBy(away.definingClass).methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.name == away.name && it.returnType == away.returnType &&
                it.parameters() == away.parameters() && isHomeAwayCheck(it)
        }.one("$PATCH: presenter check of the time away")
    }
    val call = homeRefreshCalls(check).one("$PATCH: refresh the presenter check calls")
    return mutableClassDefBy(call.definingClass).methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.name == call.name && it.returnType == call.returnType &&
            it.parameters() == call.parameters()
    }.one("$PATCH: Home refresh")
}

/**
 * Throws unless the refresh's 0x2 mask bit is the one that drops the map: an `and-int` of the mask
 * with 2, its `if-eqz`, and the map register overwritten on the bit-set side. The hold reads the
 * mask that way, so a Pinterest that swapped the bits would hold the new pins prompt instead.
 */
internal fun requireMaskShape(refresh: Method) {
    val body = refresh.instructions()
    val map = refresh.parameterRegisterNumber(1)
    val mask = refresh.parameterRegisterNumber(2)
    val dropsMap = body.indices.any { at ->
        val masked = body[at]
        if ((masked.opcode != Opcode.AND_INT_LIT8 && masked.opcode != Opcode.AND_INT_LIT16) ||
            (masked as TwoRegisterInstruction).registerB != mask || (masked as NarrowLiteralInstruction).narrowLiteral != 2
        ) return@any false
        val bit = (masked as TwoRegisterInstruction).registerA
        (at + 1..minOf(at + 3, body.size - 2)).any { branch ->
            body[branch].opcode == Opcode.IF_EQZ && (body[branch] as OneRegisterInstruction).registerA == bit &&
                body[branch + 1].opcode == Opcode.MOVE_OBJECT && (body[branch + 1] as OneRegisterInstruction).registerA == map
        }
    }
    if (!dropsMap) throw PatchException("$PATCH: ${refresh.definingClass}->${refresh.name} no longer drops its map on mask bit 0x2")
}
