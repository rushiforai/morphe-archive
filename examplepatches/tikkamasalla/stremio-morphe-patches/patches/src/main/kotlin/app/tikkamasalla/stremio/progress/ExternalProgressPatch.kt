package app.tikkamasalla.stremio.progress

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.tikkamasalla.stremio.introskip.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION = "Lapp/tikkamasalla/stremio/progress/ExternalProgress;"
private const val RESULT = "Lcom/stremio/common/players/ExternalPlayerContract\$ExternalPlayerResult;"

/** Keeps watch progress when an external player (Vimu, MX Player, VLC, mpv) is used. */
val externalPlayerProgressPatch = bytecodePatch(
    name = "External player progress",
    description = "Saves watch progress in Stremio when playing in an external player, and starts the player at the saved position.",
    default = true,
) {
    dependsOn(keepAliveManifestPatch)
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Snapshot media identity and the selected subtitle when the user picks the player.
        OpenInExternalPlayerFingerprint.method.apply {
            addInstructions(0, "invoke-static {p0}, $EXTENSION->captureExternal(Ljava/lang/Object;)V")
        }

        // Launch: add the start position under the keys each player reads.
        CreateIntentFingerprint.method.apply {
            addInstructions(0, "invoke-static {p1}, $EXTENSION->remember(Landroid/content/Context;)V")
            val returns = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }
            // The register that actually holds the returned Intent at each return.
            returns.reversed().forEach { (index, register) ->
                addInstructions(index, "invoke-static {v$register}, $EXTENSION->decorate(Landroid/content/Intent;)V")
            }
        }

        // Result: read position and duration from any known key, fall back to Stremio's own parser.
        ParseResultFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {p1, p2}, $EXTENSION->parse(ILandroid/content/Intent;)Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :extprogress_original
                check-cast v0, $RESULT
                return-object v0
                :extprogress_original
                nop
            """.trimIndent(),
        )

        // Completed result: save the full position and mark watched before the next episode opens.
        try {
            ExternalPlayerResultFingerprint.method.addInstructions(
                0,
                "invoke-static {p0, p1}, $EXTENSION->onExternalResult(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        } catch (_: Exception) {
            // Stock handling stays.
        }

        // Fail soft: this one only logs what reaches the core.
        try {
            PlayerTimeChangedFingerprint.method.addInstructions(
                0,
                "invoke-static {p1, p2, p3, p4}, $EXTENSION->logTime(JJ)V",
            )
        } catch (_: Exception) {
        }
    }
}
