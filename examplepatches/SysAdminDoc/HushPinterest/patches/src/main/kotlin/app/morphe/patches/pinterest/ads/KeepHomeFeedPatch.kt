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
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.parameterRegisterNumber
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireLocals
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.one
import app.morphe.patches.pinterest.ui.parameters
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
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
 *   and that refreshes when it's more than [HOME_AWAY_MS]. The hook reads that time away in the
 *   fragment and returns early, so the presenter's check never starts.
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
        "instead of loading new pins on its own. Pull down to refresh whenever you want new pins. Starts off. " +
        "Turn it on in HushPinterest settings > Feed.",
) {
    category("Feed")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("keepHomeFeed")
        requireStatusMethod("homeFeed")
        val resume = homeResumeCheck()
        val refresh = homeRefresh(resume)
        requireMaskShape(refresh)
        resume.requireLocals("$PATCH: return check", 1)
        refresh.requireLocals("$PATCH: refresh", 1)

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

        enableCapability("homeFeed")
        enableStatus("keepHomeFeed")
    }
}

/** The Home fragment's `(J)V` return check: the scroll offset and the call handing the time away to the presenter. */
private fun BytecodePatchContext.homeResumeCheck(): MutableMethod =
    mutableClassDefBy(HOME_FEED_FRAGMENT).methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.parameters() == listOf("J") &&
            method.instructions().any {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "computeVerticalScrollOffset"
            } &&
            homeAwayCalls(method).isNotEmpty()
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
internal fun homeRefreshCalls(method: Method): List<MethodReference> = method.instructions()
    .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
    .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
    .filter { call ->
        call.returnType == "V" && call.parameters().size == 3 && call.parameters()[0] == call.definingClass &&
            call.parameters()[1] == "Ljava/util/HashMap;" && call.parameters()[2] == "I"
    }
    .distinctBy { it.toString() }

private fun BytecodePatchContext.homeRefresh(resume: Method): MutableMethod {
    val away = homeAwayCalls(resume).one("$PATCH: presenter check the return check calls")
    val check = mutableClassDefBy(away.definingClass).methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.name == away.name && it.returnType == away.returnType &&
            it.parameters() == away.parameters() && isHomeAwayCheck(it)
    }.one("$PATCH: presenter check of the time away")
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
