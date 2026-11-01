/*
 * Copyright (C) 2026 Saiesh Nitin Shirodkar
 * SPDX-License-Identifier: GPL-3.0-or-later
 *
 * Adapted from saieshshirodkar/saiesh-morphe-patches at
 * bc8d7d9fb066f6eb5e1095c148b44df9899d381d (Projectivy 4.71).
 * Modified for 4.73 (98): renamed native wrapper and the app's premium-state flow.
 * The upstream project-name endorsement restriction is retained in NOTICE.
 */
package patches.projectivy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.shared.uniqueMatch

private const val APPLICATION = "Lcom/spocky/projengmenu/PTApplication;"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks premium features by bypassing the native check and keeping the app's premium feature gates unlocked.",
) {
    dependsOn(patches.shared.originalInput(projectivy))
    compatibleWith(projectivy)

    execute {
        // The upstream e()Z wrapper is f()Z in 4.73. Pin its native call too.
        Fingerprint(definingClass = APPLICATION, name = "f", returnType = "Z",
            parameters = emptyList(), accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
        ).uniqueMatch().method.apply {
            check(instructions.any { it.getReference<MethodReference>()?.toString() == "$APPLICATION->vs(Z)Z" }) {
                "Projectivy native check changed"
            }
            returnEarly(true)
        }

        // True means locked. Keep the original StateFlow and its read-only view.
        Fingerprint(definingClass = APPLICATION, name = "<init>", returnType = "V",
            parameters = emptyList(),
        ).uniqueMatch().method.apply {
            val initial = instructions.withIndex().single { (_, instruction) ->
                instruction.getReference<FieldReference>()?.toString() == "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
            }.index
            val register = getInstruction<OneRegisterInstruction>(initial).registerA
            replaceInstruction(initial, "sget-object v$register, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
        }

        // Billing callbacks update this same flow. Preserve the native setter,
        // but prevent an unpaid/expired response from locking local features again.
        Fingerprint(definingClass = APPLICATION, name = "d", returnType = "V",
            parameters = listOf("Z"),
        ).uniqueMatch().method.apply {
            check(instructions.count { it.getReference<FieldReference>()?.toString() == "$APPLICATION->x:Llf4;" } == 1) {
                "Projectivy premium state setter changed"
            }
            addInstructions(0, "const/4 p1, 0x0")
        }
    }
}
