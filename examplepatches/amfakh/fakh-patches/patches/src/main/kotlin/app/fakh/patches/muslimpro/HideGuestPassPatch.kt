/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.muslimpro

import app.fakh.patches.muslimpro.shared.Constants.COMPATIBILITY_MUSLIMPRO
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** The gift icon in the Today header; Compose's trace string names the composable. */
private object ReferralIconFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("com.bitsmedia.android.today.presentation.ui.preimium.ReferralIcon (ReferralIcon.kt:30)"),
)

/** The invite section of the profile screen. */
private object ProfileReferralFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("com.bitsmedia.android.profile.viewholder.ProfileHeaderReferralSection (ProfileReferralViewHolder.kt:71)"),
)

/** The bind method of the profile's option list holder (R8-renamed): it fills each row on every bind, "Undang teman" included. */
private object ProfileOptionsFingerprint : Fingerprint(
    definingClass = "LgetCurrencyPound;",
    returnType = "V",
    name = "IqraCourseModuleResponse",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == "optionReferral" } == true
    },
)

@Suppress("unused")
val hideGuestPassPatch = patch(
    name = "Hide Guest Pass",
    description = "Removes the gift icon in the header and the invite section and row in the profile.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MUSLIMPRO)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        ReferralIconFingerprint.method.addInstructions(0, "return-void")
        ProfileReferralFingerprint.method.addInstructions(0, "return-void")

        // The row's binding is passed to setViewModel on every bind; hide its root right after.
        val options = ProfileOptionsFingerprint.method
        val instructions = options.implementation!!.instructions.toList()
        val row = instructions.indexOfFirst {
            it.opcode == Opcode.IGET_OBJECT && ((it as ReferenceInstruction).reference as FieldReference).name == "optionReferral"
        }
        val set = (row + 1 until instructions.size).firstOrNull {
            ((instructions[it] as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setViewModel"
        } ?: throw PatchException("setViewModel after optionReferral not found")
        val binding = (instructions[set] as FiveRegisterInstruction).registerC
        options.addInstructions(
            set + 1,
            """
                invoke-virtual { v$binding }, Landroidx/databinding/ViewDataBinding;->getRoot()Landroid/view/View;
                move-result-object v$binding
                invoke-static { v$binding }, Lapp/fakh/extension/muslimpro/Rows;->hide(Landroid/view/View;)V
            """,
        )
    }
}
