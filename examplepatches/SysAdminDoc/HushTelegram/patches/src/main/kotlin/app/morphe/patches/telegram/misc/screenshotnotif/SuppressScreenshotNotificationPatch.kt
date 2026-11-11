/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.screenshotnotif

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.names.addInstructionsWithLabels
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.morphe.util.names.origString
import app.morphe.util.names.tgMutableClassDefBy

private const val PATCH = "Suppress screenshot notification"

private const val SCREENSHOT_NOTIFICATION = "$EXTENSION_PACKAGE/misc/ScreenshotNotification;"
private const val SCREENSHOT_SUPPRESS = "$SCREENSHOT_NOTIFICATION->suppress(I)Z"

private const val SCREENSHOT_REQUEST = "Lorg/telegram/tgnet/TLRPC\$TL_messages_sendScreenshotNotification;"
private const val SCREENSHOT_SECRET = "Lorg/telegram/tgnet/TLRPC\$TL_decryptedMessageActionScreenshotMessages;"

/**
 * Suppresses the notification Telegram sends to the other person when you take a screenshot.
 *
 * Telegram 13.2 inlined `sendScreenshotMessage` into `retrySendMessage`, so the two notification
 * sites (regular chat: [TL_messages_sendScreenshotNotification][SCREENSHOT_REQUEST], secret chat:
 * [TL_decryptedMessageActionScreenshotMessages][SCREENSHOT_SECRET]) now live in one large method.
 * Each site is preceded by a chain of guard checks (user not null, flags not zero, user not self)
 * that branch forward past the notification block on failure. The patch inserts a hook right before
 * each `new-instance` instruction, after the guards have passed, and jumps to the same skip target
 * the guards use. Off by default.
 */
@Suppress("unused")
val suppressScreenshotNotificationPatch = bytecodePatch(
    name = PATCH,
    description = "Stops Telegram from telling the other person you took a screenshot, in regular and " +
        "secret chats. Starts off. Turn it on in HushTelegram settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("suppressScreenshotNotification")
        controlHook(SCREENSHOT_NOTIFICATION, "suppress", listOf("I"), "Z")

        val candidates = classDefsMentioning(Mention.reference(SCREENSHOT_REQUEST)).flatMap { classDef ->
            classDef.methods.filter { method ->
                val body = method.implementation?.instructions?.toList() ?: return@filter false
                body.any { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.origString() == SCREENSHOT_REQUEST }
            }
        }

        val sourceMethod = candidates.singleOrNull()
        if (sourceMethod == null) {
            patchLog.warning("$PATCH: ${candidates.size} methods build the screenshot notification request. Skipped.")
            enableStatus("suppressScreenshotNotification")
            return@execute
        }

        val mutableClass = tgMutableClassDefBy(sourceMethod.definingClass)
        val mutableMethod = mutableClass.methods.single {
            it.name == sourceMethod.name && it.returnType == sourceMethod.returnType &&
                it.parameterTypes.map(CharSequence::toString) == sourceMethod.parameterTypes.map(CharSequence::toString)
        }

        val code = mutableMethod.implementation?.instructions?.toList()!!
        var hooked = 0

        for ((type, label) in listOf(SCREENSHOT_REQUEST to "regular", SCREENSHOT_SECRET to "secret")) {
            val niIndices = code.indices.filter {
                code[it].opcode == Opcode.NEW_INSTANCE &&
                    (code[it] as ReferenceInstruction).reference.origString() == type
            }
            if (niIndices.isEmpty()) {
                if (type == SCREENSHOT_SECRET) {
                    patchLog.warning("$PATCH: $label screenshot notification not found in this build. Continuing.")
                    continue
                }
                patchLog.warning("$PATCH: $label screenshot notification not found. The patch is incomplete.")
                continue
            }
            if (niIndices.size > 1) {
                patchLog.warning("$PATCH: $label screenshot notification appears ${niIndices.size} times. Skipped.")
                continue
            }
            val niIndex = niIndices.single()

            val skipTarget = findSkipTarget(code, niIndex)
            if (skipTarget == null) {
                patchLog.warning("$PATCH: no guard branch found before the $label screenshot notification. Skipped.")
                continue
            }

            val free = mutableMethod.freeLocalsAt(PATCH, niIndex, 1, highest = 255).single()
            mutableMethod.addInstructionsWithLabels(
                niIndex,
                """
                    const/4 v$free, 0x1
                    invoke-static {v$free}, $SCREENSHOT_SUPPRESS
                    move-result v$free
                    if-nez v$free, :hush_skip
                """,
                ExternalLabel("hush_skip", mutableMethod.getInstruction(skipTarget)),
            )
            hooked++
        }

        if (hooked == 0) {
            patchLog.warning("$PATCH: no screenshot notification sites could be hooked.")
        }
        enableStatus("suppressScreenshotNotification")
    }
}

/**
 * Walks backward from [niIndex] looking for a conditional branch that jumps forward past it.
 * The guards (user not null, flag not zero, user not self) all branch to the same skip target past
 * the notification block.
 */
private fun findSkipTarget(code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>, niIndex: Int): Int? {
    val addresses = IntArray(code.size)
    var addr = 0
    for (i in code.indices) {
        addresses[i] = addr
        addr += code[i].codeUnits
    }
    fun indexOfAddress(target: Int): Int? {
        val found = addresses.binarySearch(target)
        return if (found >= 0) found else null
    }

    for (i in (niIndex - 1 downTo maxOf(0, niIndex - 20))) {
        val inst = code[i]
        if (inst !is OffsetInstruction) continue
        if (inst.opcode != Opcode.IF_EQZ && inst.opcode != Opcode.IF_NEZ &&
            inst.opcode != Opcode.IF_EQ && inst.opcode != Opcode.IF_NE
        ) continue
        val targetAddr = addresses[i] + inst.codeOffset
        val target = indexOfAddress(targetAddr) ?: continue
        if (target > niIndex) return target
    }
    return null
}
