/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.directMessage.makeEphemeralPermanent

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.entity.messageInfoEntity.messageInfoEntity
import app.crimera.patches.instagram.misc.directMessage.saveAllMessages.saveAllMessagesPatch
import app.crimera.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.crimera.patches.instagram.utils.enableSettings
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal object EphemeralMediaJsonParserFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    returnType = "Ljava/lang/Object;",
    strings = listOf("url_expire_at_secs", "view_mode", "seen_count", "tap_models"),
)

@Suppress("unused")
val makeEphemeralPermanentPatch =
    bytecodePatch(
        name = "Make ephemeral media permanent",
        description = "Changes unexpired view once, view twice media to permanent view.",
        default = true,
    ) {
        dependsOn(instagramExtensionPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(messageInfoEntity, saveAllMessagesPatch)
        execute {
            EphemeralMediaJsonParserFingerprint.method.apply {
                val code = instructions.toList()

                // The field a key's value is stored in: the first store of the expected type after
                // the key. piko took the last store before "view_mode" as the expiry, which on 448
                // is the tap models list, so the hook read a Long field that does not exist and
                // threw NoSuchFieldError for every view-once message.
                fun fieldAfter(
                    key: String,
                    type: String,
                ): FieldReference {
                    val keyIndex = code.indexOfFirst { it.getReference<StringReference>()?.string == key }
                    if (keyIndex < 0) throw PatchException("The ephemeral media parser has no \"$key\" key")
                    return code.drop(keyIndex + 1).firstNotNullOfOrNull { instruction ->
                        instruction.takeIf { it.opcode == Opcode.IPUT_OBJECT }
                            ?.getReference<FieldReference>()
                            ?.takeIf { it.type == type }
                    } ?: throw PatchException("No $type is stored after \"$key\"")
                }

                val expireAtField = fieldAfter("url_expire_at_secs", "Ljava/lang/Long;")
                val viewModeField = fieldAfter("view_mode", "Ljava/lang/String;")

                // The parser returns the object it filled when it reaches the end of the JSON
                // object. That is the if-eq branching straight to the final return, and the hook
                // goes in front of it, in the path where the parse has finished.
                val finalReturn = code.last { it.opcode == Opcode.RETURN_OBJECT }
                val objectRegister = finalReturn.registersUsed[0]
                val endCheck =
                    code.firstOrNull { instruction ->
                        instruction.opcode == Opcode.IF_EQ && branchTarget(code, instruction) == finalReturn
                    } ?: throw PatchException("The ephemeral media parser has no end-of-object check")
                val (tokenRegister, endTokenRegister) = endCheck.registersUsed

                // Past the if-ne the hook only returns, so every register but the object's is
                // spare there, token registers included. iget-object and the non-range invoke
                // take four-bit registers.
                if (objectRegister > 15) throw PatchException("The parsed object is not in a four-bit register")
                val (expireAt, viewMode) =
                    (0 until minOf(16, implementation!!.registerCount)).filter { it != objectRegister }.take(2)
                        .takeIf { it.size == 2 } ?: throw PatchException("The ephemeral media parser has too few registers")

                addInstructionsWithLabels(
                    endCheck.location.index,
                    """
                    if-ne v$tokenRegister, v$endTokenRegister, :parsing
                    iget-object v$expireAt, v$objectRegister, $expireAtField
                    iget-object v$viewMode, v$objectRegister, $viewModeField
                    invoke-static { v$expireAt, v$viewMode }, $PATCHES_DESCRIPTOR/dm/EphemeralMediaPatch;->makeEphemeralMediaPermanent(Ljava/lang/Long;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$viewMode
                    iput-object v$viewMode, v$objectRegister, $viewModeField
                    return-object v$objectRegister
                    """,
                    ExternalLabel("parsing", getInstruction(endCheck.location.index)),
                )
            }
            enableSettings("unlimitedReplaysOnEphemeralMedia")
        }
    }

/** The instruction a branch jumps to. */
private fun branchTarget(
    instructions: List<Instruction>,
    branch: Instruction,
): Instruction? {
    var address = 0
    val addresses = instructions.map { instruction -> address.also { address += instruction.codeUnits } }
    val target = addresses[instructions.indexOf(branch)] + (branch as OffsetInstruction).codeOffset
    return instructions.getOrNull(addresses.indexOf(target))
}
