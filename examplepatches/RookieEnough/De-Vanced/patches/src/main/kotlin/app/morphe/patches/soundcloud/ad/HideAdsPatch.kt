/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/soundcloud/ad/HideAdsPatch.kt
 */
package app.morphe.patches.soundcloud.ad

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.soundcloud.shared.FeatureConstructorFingerprint
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
) {
    compatibleWith(AppCompatibilities.SOUNDCLOUD)

    execute {
        // Enable a preset feature to disable audio ads by modifying the JSON server response.
        FeatureConstructorFingerprint.method.apply {
            val afterCheckNotNullIndex = 2
            addInstructionsWithLabels(
                afterCheckNotNullIndex,
                """
                    const-string v0, "no_audio_ads"
                    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :skip
                    const/4 p2, 0x1
                """.trimIndent(),
                ExternalLabel("skip", getInstruction(afterCheckNotNullIndex)),
            )
        }

        // Overwrite the JSON response from the server to a paid plan, which hides all ads in the app.
        UserConsumerPlanConstructorFingerprint.method.addInstructions(
            0,
            """
                const-string p1, "high_tier"
                new-instance p4, Ljava/util/ArrayList;
                invoke-direct { p4 }, Ljava/util/ArrayList;-><init>()V
                const-string p5, "go-plus"
                const-string p6, "SoundCloud Go+"
            """.trimIndent(),
        )

        // Prevent verification of an HTTP header containing the user's current plan.
        InterceptFingerprint.method.apply {
            val conditionIndex = InterceptFingerprint.instructionMatches.last().index + 1
            addInstruction(
                conditionIndex,
                "return-object p1",
            )
        }
    }
}

