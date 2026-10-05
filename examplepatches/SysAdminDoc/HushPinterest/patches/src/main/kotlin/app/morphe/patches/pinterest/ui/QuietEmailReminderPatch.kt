/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.requireThisIntact
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode

/** Reuses the optional reminder's dismiss path after its superclass lifecycle call. */
@Suppress("unused")
val quietEmailReminderPatch = bytecodePatch(
    name = "Quiet email reminders",
    description = "Dismisses the optional confirm-your-email reminder. Account verification and sign-in checks still apply.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("quietEmailReminder")
        requireStatusMethod("emailReminder")
        val candidates = methodsWithString("confirmEmailButton").flatMap { method ->
            classDefBy(method.definingClass).fields.mapNotNull { field ->
                classDefByOrNull(field.type)?.takeIf { owner ->
                    owner.methods.any { it.name == "onViewCreated" &&
                        it.fields().any { resource -> resource.name == "email_verification_reminder_title" } }
                }?.type
            }
        }.distinct()
        val owner = mutableClassDefBy(candidates.one("Email reminder fragment"))
        val create = owner.methods.filter { it.name == "onCreate" && it.parameters() == listOf("Landroid/os/Bundle;") }
            .one("Email reminder onCreate")
        val dismiss = create.calls().filter { it.parameterTypes.isEmpty() && it.returnType == "V" }
            .groupBy { it.toString() }.filterValues { it.size >= 2 }.values.map { it.first() }
            .one("Email reminder's existing dismiss path")
        if (create.instructions().first().opcode != Opcode.INVOKE_SUPER &&
            create.instructions().first().opcode != Opcode.INVOKE_SUPER_RANGE) {
            throw PatchException("Email reminder onCreate no longer starts with its superclass call")
        }
        create.requireThisIntact("Email reminder dismissal", listOf(1))
        val register = create.freeLocalsAt("Email reminder dismissal", 1, 1, highest = 255).single()
        create.addInstructionsWithLabels(1, """
            invoke-static {}, $UI_HOOKS->quietEmailReminder()Z
            move-result v$register
            if-eqz v$register, :hush_keep_reminder
            invoke-virtual/range { p0 .. p0 }, $dismiss
            return-void
        """, ExternalLabel("hush_keep_reminder", create.getInstruction(1)))
        enableCapability("emailReminder")
        enableStatus("quietEmailReminder")
    }
}
