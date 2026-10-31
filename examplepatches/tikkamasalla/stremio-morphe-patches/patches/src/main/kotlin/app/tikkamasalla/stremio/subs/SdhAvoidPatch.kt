package app.tikkamasalla.stremio.subs

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tikkamasalla.stremio.introskip.Constants
import app.tikkamasalla.stremio.introskip.PlayerViewSetPlayerFingerprint
import app.tikkamasalla.stremio.introskip.PreferencesFragmentOnCreatePreferencesFingerprint
import app.tikkamasalla.stremio.introskip.StartStreamPlaybackFingerprint
import app.tikkamasalla.stremio.introskip.playerAssignedIndex
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS = "Lapp/tikkamasalla/stremio/subs/SdhAvoid;"
private const val EXTENSION_SETTINGS = "Lapp/tikkamasalla/stremio/subs/SdhSettings;"
private const val SDH_VERSION = "1.0.0"
private const val SDH_REPO = "https://github.com/tikkamasalla/stremio-morphe-patches"

/** Prefers full dialogue subtitles over SDH/CC tracks and cleans leftovers. Default ON. */
val avoidSdhPatch = bytecodePatch(
    name = "Avoid SDH subtitles",
    description = "Prefers full dialogue subtitles over SDH/CC tracks and strips sound notes when none remain.\n\nAvoid SDH v$SDH_VERSION\nRepository: $SDH_REPO",
    default = true,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Track ranking and content sampling on the same player the skip uses.
        try {
            PlayerViewSetPlayerFingerprint.method.addInstructions(
                0,
                "invoke-static {p0, p1}, $EXTENSION_CLASS->onPlayerSet(Landroid/view/View;Landroidx/media3/common/Player;)V",
            )
        } catch (_: Exception) {
            // PlayerView moved in this build; the TV entry point below still hooks.
        }

        // TV playback entry point (Stremio 1.6.12 flow, engine-agnostic):
        // runs right after startStreamPlayback assigns this.player (index 5).
        try {
            StartStreamPlaybackFingerprint.method.addInstructions(
                playerAssignedIndex(StartStreamPlaybackFingerprint.method),
                """
                    iget-object v0, p0, Lcom/stremio/tv/views/player/PlayerFragment;->player:Lcom/stremio/common/players/StremioPlayer;
                    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
                    move-result-object v1
                    invoke-static {v1, v0}, $EXTENSION_CLASS->onPlayerSet(Landroid/view/View;Landroidx/media3/common/Player;)V
                """.trimIndent(),
            )
        } catch (_: Exception) {
            // Entry point moved in this build; the PlayerView hook still ranks tracks.
        }

        // Cue cleaner: every subtitle shown passes through setCues.
        // Same p1 register in, move-result back, no new registers.
        try {
            SubtitleViewSetCuesFingerprint.method.addInstructions(
                0,
                """
                    invoke-static {p1}, $EXTENSION_CLASS->cleanCues(Ljava/util/List;)Ljava/util/List;
                    move-result-object p1
                """.trimIndent(),
            )
        } catch (_: Exception) {
            // Cues stay vanilla on this build; ranking still avoids SDH tracks.
        }

        // Settings rows in Stremio Settings > Playback (fail soft).
        try {
            PreferencesFragmentOnCreatePreferencesFingerprint.method.apply {
                val returns = implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
                returns.reversed().forEach { index ->
                    addInstructions(
                        index,
                        "invoke-static {p0}, $EXTENSION_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V",
                    )
                }
            }
        } catch (_: Exception) {
            // Settings screen moved in this build; avoidance stays on with defaults.
        }
    }
}
