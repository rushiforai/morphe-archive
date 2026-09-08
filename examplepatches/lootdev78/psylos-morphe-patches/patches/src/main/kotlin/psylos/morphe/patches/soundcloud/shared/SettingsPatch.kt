/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */

package psylos.morphe.patches.soundcloud.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import hoodles.morphe.patches.soundcloud.shared.soundcloudExtensionPatch

internal const val PRIVATE_EXTENSION = "Lpsylos/morphe/extension/soundcloud/"

/** Adds one SoundCloud settings row shared by the two private patches. */
internal val soundcloudPrivateSettingsPatch = bytecodePatch {
    dependsOn(soundcloudExtensionPatch)

    execute {
        SettingsScreenFingerprint.method.apply {
            val columnScopeIndex = indexOfFirstInstructionOrThrow {
                if (opcode != Opcode.SGET_OBJECT) return@indexOfFirstInstructionOrThrow false
                val field = (this as? ReferenceInstruction)?.reference as? FieldReference
                field?.definingClass ==
                    "Landroidx/compose/foundation/layout/ColumnScopeInstance;" &&
                    field.name == "INSTANCE"
            }

            val updaterIndex = (columnScopeIndex - 1 downTo 0).firstOrNull { index ->
                val reference =
                    (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroidx/compose/runtime/Updater;" &&
                    reference.name == "d"
            } ?: throw PatchException("Could not resolve the SoundCloud settings Composer register")

            val composerRegister =
                getInstruction<FiveRegisterInstruction>(updaterIndex).registerC

            addInstruction(
                columnScopeIndex + 1,
                "invoke-static {v$composerRegister}, " +
                    "${PRIVATE_EXTENSION}PsylosSettingsCompose;->" +
                    "render(Landroidx/compose/runtime/Composer;)V",
            )
        }
    }
}
