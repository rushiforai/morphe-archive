package app.morphe.patches.tiktok.interaction.cleardisplay

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.shared.OnRenderFirstFrameFingerprint
import com.android.tools.smali.dexlib2.Opcode

private const val CONTROLLER =
    "Lapp/morphe/extension/tiktok/cleardisplay/AutomaticClearDisplayController;"

@Suppress("unused")
val automaticClearDisplayPatch = bytecodePatch(
    name = "Automatic clear display",
    description = "Experimental recovery opt-in: automatically enters TikTok clear-display mode after a configurable delay for each newly played video.",
    default = false,
) {
    dependsOn(
        sharedExtensionPatch,
        rememberClearDisplayPatch,
    )

    compatibleWith(*AppCompatibilities.tiktok4673())

    execute {
        // Keep the settings surface aware that this optional patch is installed.
        SettingsStatusLoadFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableAutomaticClearDisplay()V
                invoke-static {}, $CONTROLLER->enablePatch()V
            """.trimIndent(),
        )

        // Retain first-frame activation as a secondary fallback, but it is no longer the primary
        // per-video trigger on 46.7.3.
        OnRenderFirstFrameFingerprint.method.addInstruction(
            0,
            "invoke-static {}, $CONTROLLER->enablePatch()V",
        )

        val eventClassName = OnClearDisplayEventFingerprint.method.parameters[0].type
            .removePrefix("L")
            .removeSuffix(";")
            .replace('/', '.')

        // Exact 46.7.3 discovery:
        // ClearModePanelComponent.vq(LX/06SG;Z)V contains TikTok's native "resetClearMode" path.
        // Its final RETURN_VOID is reached after the current feed cell has been reset. Hook only that
        // final return so ineligible-content early returns do not schedule an automatic request.
        // vq has 8 registers / 3 ins, therefore v0 is a verified local and no parameter register is
        // stolen. Only a String crosses the injected bytecode boundary; event/enum classes remain
        // reflection-only inside extension code for ART verifier safety.
        ClearModePanelResetFingerprint.method.apply {
            val finalReturnIndex = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .last()

            addInstructions(
                finalReturnIndex,
                """
                    const-string v0, "$eventClassName"
                    invoke-static {v0}, $CONTROLLER->onPanelReset(Ljava/lang/String;)V
                """.trimIndent(),
            )
        }
    }
}
