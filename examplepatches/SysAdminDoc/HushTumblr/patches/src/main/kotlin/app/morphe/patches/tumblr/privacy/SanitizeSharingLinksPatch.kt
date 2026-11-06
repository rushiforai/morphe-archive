/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.appClassesWithString
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.sameAs
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.freeLocalsAt
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PATCH = "Sanitize sharing links"
internal const val SHARE_TAG_HOOK = "$EXTENSION_PACKAGE/privacy/ShareLinks;->dropShareTag()Z"

// The query parameter Tumblr appends to every link it hands the share sheet or the clipboard.
internal const val SHARE_TAG_NAME = "source"
internal const val SHARE_TAG_VALUE = "share"

private const val URI = "Landroid/net/Uri;"
private const val URI_BUILDER = "Landroid/net/Uri\$Builder;"
private const val MALFORMED_URL = "Ljava/net/MalformedURLException;"

/**
 * Where the hook goes in the link builder [method]: in front of instruction [at], the `source` name
 * the tag starts with. [untagged] is the first step of the method's MalformedURLException handler,
 * which reads the link again and goes on with it as the server gave it. [scratch] is a local
 * nothing reads after [at] or from [untagged].
 */
internal class ShareLinkSite(val method: MutableMethod, val at: Int, val untagged: Int, val scratch: Int)

@Suppress("unused")
val sanitizeSharingLinksPatch = bytecodePatch(
    name = PATCH,
    description = "Links you share or copy from Tumblr leave out the ?source=share tag Tumblr adds to them, and" +
        " still open the same post or blog. On by default. Turn it off in Tumblr settings > HushTumblr > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("sanitizeSharingLinks")
        requireStatusMethod("shareLinkTag")
        requireExtensionHook(PATCH, SHARE_TAG_HOOK)
        val site = resolveShareLink(PATCH)
        site.method.addInstructionsWithLabels(
            site.at,
            """
                invoke-static { }, $SHARE_TAG_HOOK
                move-result v${site.scratch}
                if-nez v${site.scratch}, :hush_untagged
            """,
            ExternalLabel("hush_untagged", site.method.getInstruction(site.untagged)),
        )
        enableCapability("shareLinkTag")
        enableStatus("sanitizeSharingLinks")
    }
}

/**
 * Finds the one method that tags a shared link and checks its shape, refusing with a reason before
 * any edit. Tumblr 47.0 reads the link from its share model, parses it, appends `source=share` and
 * hands the string on, all in one try block. When the URL is malformed, its handler reads the link
 * again with the same call and hands that on untouched: the place a yes from the hook goes.
 */
internal fun BytecodePatchContext.resolveShareLink(patch: String): ShareLinkSite {
    val method = appClassesWithString(SHARE_TAG_NAME)
        .flatMap { it.methods }
        .filter { candidate ->
            candidate.isStatic() && candidate.returnType == "V" && candidate.parameterTypes.size == 2 &&
                candidate.strings().containsAll(listOf(SHARE_TAG_NAME, SHARE_TAG_VALUE)) &&
                candidate.instructionList().any { it.callsAppend() }
        }
        .only(patch, "the shared link builder")
    val body = method.instructionList()
    // The first parameter's register: the share model the link is read from.
    val owner = method.implementation!!.registerCount -
        method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }

    val name = body.indices.filter { body[it].stringRef() == SHARE_TAG_NAME }.only(patch, "the share tag's name")
    val value = name + 1
    val append = name + 2
    val nameRegister = (body[name] as OneRegisterInstruction).registerA
    val valueRegister = (body.getOrNull(value) as? OneRegisterInstruction)?.registerA
    val call = body.getOrNull(append) as? FiveRegisterInstruction
    requireShape(
        patch,
        body.getOrNull(value)?.stringRef() == SHARE_TAG_VALUE && body[append].callsAppend() && call != null &&
            call.registerCount == 3 && call.registerD == nameRegister && call.registerE == valueRegister,
        "the shared link builder no longer appends source=share in one call",
    )

    // The link read that feeds the parse, so the handler can be checked to read the same one.
    val parse = (0 until append).filter { body[it].methodRef()?.let { ref ->
        ref.definingClass == URI && ref.name == "parse" } == true }.only(patch, "the shared link's parse")
    val read = parse - 2
    val linkRead = body.getOrNull(read)?.methodRef()
    requireShape(
        patch,
        read >= 0 && body[read].opcode == Opcode.INVOKE_VIRTUAL && linkRead != null &&
            linkRead.parameterTypes.isEmpty() && linkRead.returnType == "Ljava/lang/String;" &&
            (body[read] as FiveRegisterInstruction).registerC == owner &&
            body[read + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            (body[read + 1] as OneRegisterInstruction).registerA == (body[parse] as? FiveRegisterInstruction)?.registerC,
        "the shared link builder no longer parses the link it reads from its first parameter",
    )

    val tries = method.implementation!!.tryBlocks
    val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val guarded = tries.filter { block ->
        addresses[append] in block.startCodeAddress until block.startCodeAddress + block.codeUnitCount
    }
    requireShape(
        patch,
        tries.size == 1 && guarded.size == 1 && guarded[0].exceptionHandlers.size == 1 &&
            guarded[0].exceptionHandlers[0].exceptionType == MALFORMED_URL &&
            addresses[read] in guarded[0].startCodeAddress until guarded[0].startCodeAddress + guarded[0].codeUnitCount,
        "the shared link builder no longer reads and tags the link inside one MalformedURLException guard",
    )
    val untagged = addresses.indexOf(guarded[0].exceptionHandlers[0].handlerCodeAddress)
    val handlerRead = body.getOrNull(untagged)?.methodRef()
    requireShape(
        patch,
        untagged > append && body[untagged].opcode == Opcode.INVOKE_VIRTUAL && handlerRead != null &&
            handlerRead.sameAs(linkRead!!) && (body[untagged] as FiveRegisterInstruction).registerC == owner &&
            body.getOrNull(untagged + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT,
        "the shared link builder's MalformedURLException handler no longer reads the link again",
    )

    // Both paths hand the link on from the same register at the same step.
    val link = (body[untagged + 1] as OneRegisterInstruction).registerA
    val tagged = untagged - 2
    val join = untagged + 2
    requireShape(
        patch,
        tagged > append && body[tagged].opcode == Opcode.MOVE_RESULT_OBJECT &&
            (body[tagged] as OneRegisterInstruction).registerA == link &&
            body[untagged - 1].opcode == Opcode.GOTO && method.jumpTarget(untagged - 1) == join &&
            (append + 1 until tagged).none { body[it] is OffsetInstruction || body[it].endsFlow() },
        "the shared link builder's tagged and untagged links no longer meet at one step",
    )

    val scratch = method.freeLocalsAt(patch, name, 1, targets = listOf(untagged), highest = 255).single()
    return ShareLinkSite(mutableOf(method), name, untagged, scratch)
}

private fun Instruction.callsAppend(): Boolean = opcode == Opcode.INVOKE_VIRTUAL && methodRef()?.let {
    it.definingClass == URI_BUILDER && it.name == "appendQueryParameter"
} == true

private fun Instruction.endsFlow(): Boolean =
    opcode == Opcode.RETURN_VOID || opcode == Opcode.RETURN || opcode == Opcode.RETURN_WIDE ||
        opcode == Opcode.RETURN_OBJECT || opcode == Opcode.THROW

/** The index of the instruction the branch at [index] jumps to. */
private fun Method.jumpTarget(index: Int): Int {
    val body = instructionList()
    val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    return addresses.indexOf(addresses[index] + (body[index] as OffsetInstruction).codeOffset)
}
