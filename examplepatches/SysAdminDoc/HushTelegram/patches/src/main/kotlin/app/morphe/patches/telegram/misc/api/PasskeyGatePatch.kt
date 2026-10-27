/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.api

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val SUPPORTS_PASSKEYS = "Lorg/telegram/messenger/BuildVars;->SUPPORTS_PASSKEYS:Z"
internal const val PASSKEYS_WORK = "$SIGN_IN_HELP->passkeysWork(I)Z"
internal const val SETUP_PASSKEY = "SETUP_PASSKEY"
private const val SET_CONTAINS = "Ljava/util/Set;->contains(Ljava/lang/Object;)Z"

/**
 * Where Telegram decides to offer a passkey in [method]: each read of BuildVars.SUPPORTS_PASSKEYS, and
 * the result of a `contains("SETUP_PASSKEY")` check on a set (the chat list's "set up a passkey"
 * banner). Each index is the instruction that puts the answer in a register.
 */
internal fun passkeyGates(method: Method): List<Int> {
    val body = method.controlBody()
    return body.indices.filter { index ->
        val instruction = body[index]
        if (instruction.opcode == Opcode.SGET_BOOLEAN) return@filter instruction.controlRef() == SUPPORTS_PASSKEYS
        if (instruction.opcode != Opcode.MOVE_RESULT || index < 2) return@filter false
        val call = body[index - 1]
        val key = body[index - 2]
        call.opcode == Opcode.INVOKE_INTERFACE && call.controlRef() == SET_CONTAINS && key.controlString() == SETUP_PASSKEY &&
            (call as FiveRegisterInstruction).registerD == (key as OneRegisterInstruction).registerA
    }
}

private fun Method.signature() = name + parameterTypes.joinToString("", "(", ")") + returnType

/** Whether anything but [previous] falling through, a branch or a handler included, reaches [next]. */
private fun ControlFlow.hasOtherEntry(next: Int, previous: Int): Boolean =
    normal.indices.any { it != previous && next in normal[it] } || exceptional.any { next in it }

/**
 * Hides passkeys where they can't work. Telegram gates passkey setup, its settings row and the
 * passkey step at sign-in on BuildVars.SUPPORTS_PASSKEYS, which upstream says to turn off on forks,
 * and shows a "set up a passkey" banner whenever the server suggests one. Each of those answers now
 * goes through SignInHelp.passkeysWork, which keeps it only when the install carries Telegram's own
 * package name and signature, the pair telegram.org lets use its passkeys. Part of HushTelegram
 * settings, which every feature family carries; Telegram's code and password sign-in routes, saved
 * sessions and 2FA are untouched, and a build that moves any of the checks patches on with a warning.
 */
internal val passkeyGatePatch = bytecodePatch {
    dependsOn(telegramExtensionPatch)

    execute {
        controlHook(SIGN_IN_HELP, "passkeysWork", listOf("I"), "Z")
        val hosts = mutableListOf<Pair<String, String>>()
        forEachClassMentioning(Mention.reference(SUPPORTS_PASSKEYS) or Mention.string(SETUP_PASSKEY)) { cls ->
            if (cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
            for (method in cls.methods) if (passkeyGates(method).isNotEmpty()) hosts += cls.type to method.signature()
        }
        var hooked = 0
        var skipped = 0
        var reads = 0
        var banners = 0
        for ((type, signature) in hosts) {
            val method = mutableClassDefBy(type).methods.single { it.signature() == signature }
            val flow = ControlFlow.of(method)
            // Last first, so the indexes still to come stay where they were.
            for (gate in passkeyGates(method).asReversed()) {
                if (method.getInstruction(gate).opcode == Opcode.SGET_BOOLEAN) reads++ else banners++
                if (flow.hasOtherEntry(gate + 1, gate)) {
                    skipped++
                    continue
                }
                val register = (method.getInstruction(gate) as OneRegisterInstruction).registerA
                method.addInstructions(
                    gate + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $PASSKEYS_WORK
                        move-result v$register
                    """,
                )
                hooked++
            }
        }
        if (hooked + skipped == 0) {
            patchLog.warning("Passkeys: Telegram's passkey checks weren't found, so a re-signed install still offers " +
                "passkeys that can't work.")
            return@execute
        }
        if (reads == 0) {
            patchLog.warning("Passkeys: Telegram's passkey switch wasn't read anywhere, so a re-signed install still " +
                "offers passkey setup and the passkey step at sign-in.")
        }
        if (banners == 0) {
            patchLog.warning("Passkeys: the chat list's check for the set up a passkey banner wasn't found, so the " +
                "banner can still show on a re-signed install.")
        }
        if (skipped > 0) {
            patchLog.warning("Passkeys: $skipped of ${hooked + skipped} passkey checks have another way in, so those " +
                "still offer passkeys on a re-signed install.")
        }
    }
}
