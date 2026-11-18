/* Copyright 2026 Morphe. GPLv3; see NOTICE and docs/morphe-compatibility.md.
 * Afterglow adapts only Cast suppression from HidePlayerOverlayButtonsPatch v2.0.0.
 * https://github.com/MorpheApp/morphe-patches/tree/6cb8e6b6ee425eda8a854e026507286359f38a32
 */
package app.afterglow.patches.compat.morphe

import app.afterglow.patches.compat.morphe.util.insertLiteralOverride
import app.afterglow.patches.compat.morphe.util.addInstructionsAtControlFlowLabel
import app.afterglow.patches.compat.morphe.youtube.layout.buttons.overlay.CastButtonActionFeatureFlagFingerprint
import app.afterglow.patches.compat.morphe.youtube.layout.buttons.overlay.CastButtonPlayerFeatureFlagFingerprint
import app.afterglow.patches.compat.morphe.youtube.layout.buttons.overlay.OverlayCastButtonVisibilityFingerprint
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val CAST = "Lapp/morphe/extension/youtube/patches/HidePlayerOverlayButtonsPatch;"

internal val compatibilityCastButtonsPatch = bytecodePatch {
    dependsOn(compatibilityExtensionPatch)
    execute {
        // Upstream also hides this control when the package is renamed for GmsCore.
        val layout = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V", filters = listOf(literal(159962),
                resourceLiteral(ResourceType.ID, "player_control_previous_button_touch_area"),
                resourceLiteral(ResourceType.ID, "player_control_next_button_touch_area"),
                methodCall(parameters = listOf("Landroid/view/View;", "I"))))
        val insertion = layout.instructionMatches.last()
        val view = (insertion.instruction as FiveRegisterInstruction).registerC
        layout.method.addInstructions(insertion.index,
            "invoke-static { v$view }, $CAST->hideCastButton(Landroid/view/View;)V")
        // Resolve once: strict validation must not re-match after the first edit.
        val visibility = OverlayCastButtonVisibilityFingerprint.match()
        listOf(visibility.instructionMatches[3], visibility.instructionMatches[1]).forEach {
            val register = it.getInstruction<FiveRegisterInstruction>().registerD
            visibility.method.addInstructionsAtControlFlowLabel(it.index, """
                invoke-static { v$register }, $CAST->hideCastButton(I)I
                move-result v$register
            """)
        }
        listOf(CastButtonPlayerFeatureFlagFingerprint, CastButtonActionFeatureFlagFingerprint).forEach { fingerprint ->
            fingerprint.matchAll().forEach {
                it.method.insertLiteralOverride(it.instructionMatches.first().index, "$CAST->hideCastButton(Z)Z")
            }
        }
    }
}
