/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.tumblr.lookup.appClassesWithString
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.freeLocalsAt
import app.morphe.patches.tumblr.misc.extension.patchLog
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val EXPLORE_HEADER_HOOK = "$EXTENSION_PACKAGE/timeline/ExploreHeader;->hideSponsored(Ljava/lang/Object;)Z"
internal const val RADAR_HEADER_RESPONSE = "Lcom/tumblr/rumblr/response/RadarHeaderResponse;"

// The two lines Explore's header presenter logs when the header fails to load. Its method that
// takes the fetched header holds both, which finds it without an obfuscated name.
internal const val EXPLORE_HEADER_TAG = "ExploreHeaderPresenter"
internal const val EXPLORE_HEADER_FAILED = "Failed to retrieve header"

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

/**
 * Where the hook goes in the presenter's [method]: in front of instruction [at], the call that turns
 * the header in [response] into what the header view draws. [done] is where the method ends, the
 * same place its failed-load path ends, and [scratch] a local nothing reads after [at].
 */
internal class ExploreHeaderSite(val method: MutableMethod, val at: Int, val response: Int, val scratch: Int, val done: Int)

/**
 * Lets Hide ads keep Explore from drawing a header a sponsor paid for. Tumblr 47.0's presenter casts
 * the fetched result to [RADAR_HEADER_RESPONSE] and hands it to one static call that builds the
 * header's model, after which the presenter draws the image, counts the impression and wires the
 * sponsor's takeover ad to the tap. The hook asks the extension about the response before that call
 * and, on yes, jumps to the method's end, where Tumblr's own path lands when the header fails to
 * load: the header stays empty and no impression is counted.
 *
 * A soft site: when the presenter no longer has this shape the patch logs why and answers false,
 * so Hide ads goes on without it.
 */
internal fun BytecodePatchContext.hideSponsoredExploreHeader(patch: String): Boolean {
    requireExtensionHook(patch, EXPLORE_HEADER_HOOK)
    val site = try {
        resolveExploreHeader(patch)
    } catch (refused: PatchException) {
        patchLog.warning("${refused.message}, so Explore's sponsored header stays")
        return false
    }
    site.method.addInstructionsWithLabels(
        site.at,
        """
            invoke-static { v${site.response} }, $EXPLORE_HEADER_HOOK
            move-result v${site.scratch}
            if-nez v${site.scratch}, :hush_skip_header
        """,
        ExternalLabel("hush_skip_header", site.method.getInstruction(site.done)),
    )
    return true
}

/** Finds the presenter's method and checks its shape, refusing with a reason before any edit. */
internal fun BytecodePatchContext.resolveExploreHeader(patch: String): ExploreHeaderSite {
    val method = appClassesWithString(EXPLORE_HEADER_FAILED)
        .flatMap { it.methods }
        .filter { candidate ->
            candidate.strings().containsAll(listOf(EXPLORE_HEADER_TAG, EXPLORE_HEADER_FAILED)) &&
                candidate.instructionList().any { it.castsTo(RADAR_HEADER_RESPONSE) }
        }
        .only(patch, "Explore's header method")
    val body = method.instructionList()

    val cast = body.indices.filter { body[it].castsTo(RADAR_HEADER_RESPONSE) }
        .only(patch, "the radar header cast in Explore's header method")
    val response = (body[cast] as OneRegisterInstruction).registerA
    val at = cast + 1
    val build = body.getOrNull(at)
    val built = build?.methodRef()
    requireShape(
        patch,
        build?.opcode == Opcode.INVOKE_STATIC && built != null &&
            built.parameterTypes.map(CharSequence::toString) == listOf(RADAR_HEADER_RESPONSE) &&
            (build as FiveRegisterInstruction).registerCount == 1 && build.registerC == response,
        "Explore's header method no longer hands the radar header straight to one static call",
    )
    requireShape(patch, response < 16, "Explore's header method keeps the radar header in v$response, past v15")

    val exit = (at + 1 until body.size).firstOrNull { body[it] is OffsetInstruction || body[it].endsFlow() }
    requireShape(
        patch,
        exit != null && body[exit].opcode in GOTOS,
        "Explore's header method no longer jumps to its end after drawing the header",
    )
    val done = method.jumpTarget(exit!!)
    requireShape(
        patch,
        done in (exit + 1) until body.size - 1 && body[done].opcode == Opcode.SGET_OBJECT &&
            body[done + 1].opcode == Opcode.RETURN_OBJECT &&
            (body[done] as OneRegisterInstruction).registerA == (body[done + 1] as OneRegisterInstruction).registerA,
        "Explore's header method no longer ends by returning a constant where its jump lands",
    )

    val failed = body.indices.filter { body[it].stringRef() == EXPLORE_HEADER_FAILED }
        .only(patch, "the failed-load line in Explore's header method")
    requireShape(
        patch,
        failed in (exit + 1) until done &&
            (failed + 1 until done).none { body[it] is OffsetInstruction || body[it].endsFlow() },
        "Explore's failed-load path no longer ends where the drawn header does",
    )

    val scratch = method.freeLocalsAt(patch, at, 1, targets = listOf(done), highest = 255, reads = listOf(response)).single()
    return ExploreHeaderSite(mutableOf(method), at, response, scratch, done)
}

private fun Instruction.castsTo(type: String): Boolean =
    opcode == Opcode.CHECK_CAST && ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type == type

private fun Instruction.endsFlow(): Boolean =
    opcode == Opcode.RETURN_VOID || opcode == Opcode.RETURN || opcode == Opcode.RETURN_WIDE ||
        opcode == Opcode.RETURN_OBJECT || opcode == Opcode.THROW

/** The index of the instruction the branch at [index] jumps to. */
private fun Method.jumpTarget(index: Int): Int {
    val body = instructionList()
    val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    return addresses.indexOf(addresses[index] + (body[index] as OffsetInstruction).codeOffset)
}
