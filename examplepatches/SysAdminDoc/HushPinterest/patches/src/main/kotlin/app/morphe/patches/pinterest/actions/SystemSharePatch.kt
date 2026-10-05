/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireLocals
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val PATCH = "System share sheet"
private const val SYSTEM_SHARE = "$EXTENSION_PACKAGE/actions/SystemShare;"

@Suppress("unused")
val systemSharePatch = bytecodePatch(
    name = PATCH,
    description = "Uses Android's share sheet when sharing a pin link. Screenshot and download actions keep their usual behavior. " +
        "Turn it off in HushPinterest settings at any time.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("systemShare")
        requireStatusMethod("pinShare")
        // Native shares from the menu and closeup converge here. The source enum distinguishes
        // screenshots/downloads, and the extension separately refuses boards, people and invites.
        val method = Fingerprint(
            returnType = "V",
            custom = { candidate, _ ->
                candidate.parameterTypes.size == 5 && candidate.parameterTypes[1].toString() == "I" &&
                    candidate.parameterTypes[3].toString() == "Z" && candidate.fields().map { it.name }.toSet().containsAll(
                        setOf("APP_LIST_AND_CONTACT_SUGGESTIONS_FOR_UPSELL", "SCREENSHOT", "DOWNLOAD"),
                    )
            },
        ).methodOrNull ?: throw PatchException("$PATCH: no native pin share chooser with screenshot/download source guards")
        method.requireLocals(PATCH, 2)
        val model = method.parameterRegister(0)
        val source = method.parameterRegister(2)
        val sourceType = method.parameterTypes[2].toString()
        method.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, $model
                move-object/from16 v1, $source
                invoke-static { v0, v1 }, $EXTENSION_PACKAGE/actions/SystemShare;->open(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :hush_original_share
                return-void
            """,
            ExternalLabel("hush_original_share", method.getInstruction(0)),
        )
        val fragment = Fingerprint(
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
            strings = listOf("context"),
            custom = { candidate, _ ->
                val body = candidate.implementation?.instructions ?: return@Fingerprint false
                candidate.definingClass != method.definingClass &&
                    body.any { instruction ->
                        instruction.opcode == Opcode.CHECK_CAST &&
                            (instruction as? ReferenceInstruction)?.reference?.toString() ==
                            "Lcom/pinterest/sendshare/model/SendableObject;"
                    } &&
                    body.any { instruction ->
                        instruction.opcode == Opcode.CHECK_CAST &&
                            (instruction as? ReferenceInstruction)?.reference?.toString() == sourceType
                    } &&
                    body.any { (it as? ReferenceInstruction)?.reference?.toString()?.endsWith("->onCreate(Landroid/os/Bundle;)V") == true }
            },
        ).methodOrNull ?: throw PatchException("$PATCH: no native closeup share sheet fragment")
        fragment.requireLocals(PATCH, 1)
        val instructions = fragment.implementation!!.instructions
        val superCall = instructions.indexOfLast {
            (it as? ReferenceInstruction)?.reference?.toString()?.endsWith("->onCreate(Landroid/os/Bundle;)V") == true
        }
        val sendableValue = instructions.withIndex().take(superCall).lastOrNull { (_, instruction) ->
            instruction.opcode == Opcode.CHECK_CAST &&
                (instruction as? ReferenceInstruction)?.reference?.toString() == "Lcom/pinterest/sendshare/model/SendableObject;"
        }?.let { (_, instruction) -> (instruction as OneRegisterInstruction).registerA }
            ?: throw PatchException("$PATCH: closeup share sheet sendable register changed")
        val sourceValue = instructions.withIndex().take(superCall).lastOrNull { (_, instruction) ->
            instruction.opcode == Opcode.CHECK_CAST &&
                (instruction as? ReferenceInstruction)?.reference?.toString() == sourceType
        }?.let { (_, instruction) -> (instruction as OneRegisterInstruction).registerA }
            ?: throw PatchException("$PATCH: closeup share sheet source register changed")
        if (superCall < 0) throw PatchException("$PATCH: closeup share sheet onCreate order changed")
        fragment.addInstructionsWithLabels(
            superCall + 1,
            """
                invoke-static { v$sendableValue, v$sourceValue }, $SYSTEM_SHARE->openSendable(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :hush_original_closeup_share
                invoke-virtual { p0 }, Lxu1/f;->z6()V
                return-void
            """,
            ExternalLabel("hush_original_closeup_share", fragment.getInstruction(superCall + 1)),
        )
        enableCapability("pinShare")
        enableStatus("systemShare")
    }
}
