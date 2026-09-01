package io.github.liongalahad.nuviotv.patches.shared.updates

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY

private val patchedAppUpdateResourcesPatch = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use(PatchedAppUpdateManifest::removeInstallPermission)
    }
}

/**
 * Mandatory infrastructure dependency for every public Nuvio patch.
 *
 * Patched APKs cannot safely install an official in-app update over their different signature and
 * modified package. Keep the update implementation unreachable without changing Nuvio's shared
 * full-build feature-policy flag, which also controls unrelated features.
 */
internal val patchedAppUpdatesPatch = bytecodePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(patchedAppUpdateResourcesPatch)

    execute {
        listOf(
            UpdateViewModelConstructorFingerprint,
            CheckForUpdatesFingerprint,
            AboutUpdateControlsFingerprint
        ).forEach { it.matchAll(1..1) }

        // Covers the automatic constructor check and the About page's forced manual check.
        CheckForUpdatesFingerprint.method.addInstructions(0, "return-void")

        AboutUpdateControlsFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val updateTitleIndex = instructions.indexOfFirst { instruction ->
                (instruction as? WideLiteralInstruction)?.wideLiteral == 0x7f110027L
            }
            val privacyTitleIndex = instructions.indexOfFirst { instruction ->
                (instruction as? WideLiteralInstruction)?.wideLiteral == 0x7f110020L
            }
            check(updateTitleIndex >= 0 && privacyTitleIndex > updateTitleIndex) {
                "About update controls are not followed by the Privacy row"
            }

            // Start before the Compose group that owns the two update rows so no opened group is
            // left unbalanced. The update resource literals remain as unreachable code for a
            // minimal, verifier-safe edit.
            val updateGroupStart = (updateTitleIndex - 1 downTo maxOf(0, updateTitleIndex - 160))
                .firstOrNull { index -> instructions[index].opcode == Opcode.SGET_BOOLEAN }
                ?: error("About update Compose group start was not found")
            check(updateGroupStart < updateTitleIndex) {
                "About update Compose group start is not before its title"
            }

            val privacyInstruction = instructions[privacyTitleIndex]
            addInstructionsWithLabels(
                updateGroupStart,
                "goto/32 :morphe_patched_app_updates_disabled",
                ExternalLabel("morphe_patched_app_updates_disabled", privacyInstruction)
            )
        }
    }
}
