/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/soundcloud/offlinesync/EnableOfflineSyncPatch.kt
 */
package app.morphe.patches.soundcloud.offlinesync

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.soundcloud.shared.FeatureConstructorFingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val enableOfflineSync = bytecodePatch(
    name = "Enable offline sync",
) {
    compatibleWith(AppCompatibilities.SOUNDCLOUD)

    execute {
        // Enable offline_sync feature flag.
        FeatureConstructorFingerprint.method.apply {
            val afterCheckNotNullIndex = 2

            addInstructionsWithLabels(
                afterCheckNotNullIndex,
                """
                    const-string v0, "offline_sync"
                    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :skip
                    const/4 p2, 0x1
                """.trimIndent(),
                ExternalLabel("skip", getInstruction(afterCheckNotNullIndex)),
            )
        }

        // Patch URL builder to use HTTPS_STREAM endpoint instead of offline sync endpoint.
        DownloadOperationsURLBuilderFingerprint.method.apply {
            val getEndpointsEnumFieldIndex = 1
            val getEndpointsEnumFieldInstruction = getInstruction<OneRegisterInstruction>(getEndpointsEnumFieldIndex)

            val targetRegister = getEndpointsEnumFieldInstruction.registerA
            val endpointsType = getEndpointsEnumFieldInstruction.getReference<FieldReference>()!!.type

            replaceInstruction(
                getEndpointsEnumFieldIndex,
                "sget-object v$targetRegister, $endpointsType->HTTPS_STREAM:$endpointsType",
            )
        }

        // Mock missing headers to prevent crashes.
        DownloadOperationsHeaderVerificationFingerprint.method.apply {
            // The first three null checks need to be patched.
            instructions.asSequence().filter {
                it.opcode == Opcode.IF_EQZ
            }.take(3).toList().map { it.location.index }.asReversed().forEach { nullCheckIndex ->
                val headerStringRegister = getInstruction<OneRegisterInstruction>(nullCheckIndex).registerA

                addInstruction(nullCheckIndex, "const-string v$headerStringRegister, \"\"")
            }
        }
    }
}

