package io.github.bakwudo.uyu.patches.twitch.appearance

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.EXTENSION_PACKAGE
import io.github.bakwudo.uyu.patches.util.addInstructionsAtControlFlowLabel

private const val SUPPORT_CLASS = "$EXTENSION_PACKAGE/appearance/PlayerOverlaySupport;"

internal val playerOverlayUiPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(settingsPatch)

    execute {
        PlayerOverlayConstructorFingerprint.method.apply {
            val returnIndices = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
            if (returnIndices.size != 1) {
                throw PatchException("Player overlay constructor must have exactly one return.")
            }

            addInstructionsAtControlFlowLabel(
                returnIndices.single(),
                """
                    iget-object v0, p0, Lout;->j:Landroidx/compose/ui/platform/ComposeView;
                    iget-object v1, p0, Lout;->k:Landroid/widget/ImageView;
                    iget-object v2, p0, Lout;->q:Landroidx/mediarouter/app/MediaRouteButton;
                    invoke-static {v0, v1, v2}, $SUPPORT_CLASS->bind(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
                """,
            )
        }
    }
}
