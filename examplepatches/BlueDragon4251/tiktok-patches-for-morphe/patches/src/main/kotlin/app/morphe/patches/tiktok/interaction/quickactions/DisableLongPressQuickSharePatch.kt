/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.tiktok.interaction.quickactions

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FEATURE_CONTROLS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/featurecontrols/FeatureControls;"

@Suppress("unused")
val disableLongPressQuickSharePatch = bytecodePatch(
    name = "Disable long-press quick share",
    description = "Keeps long-pressing Share from opening TikTok's quick-share interaction.",
    default = true,
) {
    dependsOn(sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4643())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, " +
                "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableDisableLongPressQuickShare()V",
        )

        // TikTok 46.7.3 moved the experiment from the old LX/0BJV scalar gate into
        // an Object provider. Override the raw int before TikTok boxes it with
        // Integer.valueOf(), preserving the provider's return contract.
        val providerMethod = LongPressQuickShareProviderFingerprint.methodOrNull
        if (providerMethod != null) {
            providerMethod.apply {
                val boxIndex = indexOfFirstInstructionOrThrow {
                    (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) &&
                        getReference<MethodReference>()?.let { reference ->
                            reference.definingClass == "Ljava/lang/Integer;" &&
                                reference.name == "valueOf" &&
                                reference.parameterTypes == listOf("I") &&
                                reference.returnType == "Ljava/lang/Integer;"
                        } == true
                }
                val valueResultIndex = indexOfFirstInstructionReversedOrThrow(boxIndex - 1) {
                    opcode == Opcode.MOVE_RESULT
                }
                val valueRegister =
                    getInstruction<OneRegisterInstruction>(valueResultIndex).registerA

                addInstructions(
                    valueResultIndex + 1,
                    """
                        invoke-static {v$valueRegister}, $FEATURE_CONTROLS_DESCRIPTOR->overrideLongPressQuickShare(I)I
                        move-result v$valueRegister
                    """,
                )
            }
        } else {
            // Retain the legacy layouts as a fallback for structurally compatible builds.
            val legacyMethod = LongPressQuickShareGateLegacyFingerprint.methodOrNull
            val gateMethod = legacyMethod ?: LongPressQuickShareGateBooleanFingerprint.method

            gateMethod.apply {
                val returnIndex = indexOfFirstInstructionOrThrow {
                    opcode == Opcode.RETURN
                }
                val resultRegister =
                    (implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA
                val descriptor = if (legacyMethod != null) {
                    "overrideLongPressQuickShare(I)I"
                } else {
                    "overrideLongPressQuickShare(Z)Z"
                }
                addInstructions(
                    returnIndex,
                    """
                        invoke-static {v$resultRegister}, $FEATURE_CONTROLS_DESCRIPTOR->$descriptor
                        move-result v$resultRegister
                    """,
                )
            }
        }
    }
}
