/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.tiktok.interaction.quickactions

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val FEATURE_CONTROLS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/featurecontrols/FeatureControls;"

@Suppress("unused")
val hideQuickCommentReactionsPatch = bytecodePatch(
    name = "Hide quick comment reactions",
    description = "Hides TikTok's exposed quick emoji row in supported comment inputs.",
    default = true,
) {
    dependsOn(sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4643())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, " +
                "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableHideCommentQuickReactions()V",
        )

        val legacyMethod = QuickCommentReactionGateLegacyFingerprint.methodOrNull
        val gateMethod = legacyMethod ?: QuickCommentReactionGateBooleanFingerprint.method

        gateMethod.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                val resultRegister =
                    (implementation!!.instructions[returnIndex] as OneRegisterInstruction).registerA
                val instruction = if (legacyMethod != null) {
                    "invoke-static {v$resultRegister, p0}, $FEATURE_CONTROLS_DESCRIPTOR->overrideHideQuickCommentEmoji(ZI)Z\n" +
                        "move-result v$resultRegister"
                } else {
                    "invoke-static {v$resultRegister}, $FEATURE_CONTROLS_DESCRIPTOR->overrideHideQuickCommentEmoji(Z)Z\n" +
                        "move-result v$resultRegister"
                }
                addInstructions(returnIndex, instruction)
            }
        }
    }
}
