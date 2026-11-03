package app.tikkamasalla.stremio.subs

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tikkamasalla.stremio.introskip.hookReturnVoidWithThis
import app.tikkamasalla.stremio.introskip.Constants
import app.tikkamasalla.stremio.introskip.PlayerViewSetPlayerFingerprint
import app.tikkamasalla.stremio.introskip.PreferencesFragmentOnCreatePreferencesFingerprint
import app.tikkamasalla.stremio.introskip.StartStreamPlaybackFingerprint
import app.tikkamasalla.stremio.introskip.playerAssignedIndex
import app.tikkamasalla.stremio.introskip.resolvePlayerInterface
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
        val startStream = try {
            StartStreamPlaybackFingerprint.method
        } catch (_: Exception) {
            // Entry point not in this build (Compose builds); the PlayerView hook still ranks tracks.
            null
        }
        // Matched: a moved hook point must fail the patch visibly, so nothing below is caught.
        startStream?.addInstructions(
            playerAssignedIndex(startStream),
            """
                iget-object v0, p0, Lcom/stremio/tv/views/player/PlayerFragment;->player:Lcom/stremio/common/players/StremioPlayer;
                invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
                move-result-object v1
                invoke-static {v1, v0}, $EXTENSION_CLASS->onPlayerSet(Landroid/view/View;Landroidx/media3/common/Player;)V
            """.trimIndent(),
        )

        // Cue cleaner: every subtitle shown passes through setCues. Same p1 register in, move-result back,
        // no new registers. Media3 named (1.6.12, 1.10.x): the typed cleaner. Renamed (1.12.0, 2.5.0): SdhPort
        // finds the cue fields by type, so no Media3 name is needed.
        try {
            val cleaner = if (classDefByOrNull("Landroidx/media3/common/text/Cue;") != null) {
                "$EXTENSION_CLASS->cleanCues(Ljava/util/List;)Ljava/util/List;"
            } else {
                "$SDH_PORT->cleanCues(Ljava/util/List;)Ljava/util/List;"
            }
            SubtitleViewSetCuesFingerprint.method.addInstructions(
                0,
                """
                    invoke-static {p1}, $cleaner
                    move-result-object p1
                """.trimIndent(),
            )
        } catch (_: Exception) {
            // Cues stay vanilla on this build; ranking still avoids SDH tracks.
        }

        // Compose builds (1.10.x+; the resolver finds the MPV engine there, never in 1.6.12): rank the app's own
        // default subtitle choice for every engine, watch setTrack, and switch mpv's SDH filter on.
        try {
            val iface = resolvePlayerInterface()
            val model = iface?.let { resolveTrackModel(it) }
            if (iface != null && model != null) hookTrackSelection(iface, model)
        } catch (_: Exception) {
            java.util.logging.Logger.getLogger("SdhAvoidPatch").warning("Track hooks not found: SDH track ranking is off on this build")
        }
        try {
            MpvLibInitFingerprint.method.addInstructions(
                0,
                "invoke-static/range {p0 .. p0}, $SDH_PORT->onMpvInit(Ljava/lang/Object;)V",
            )
        } catch (_: Exception) {
            // No mpv engine in this build (1.6.12).
        }

        // Settings rows in Stremio Settings > Playback (fail soft).
        try {
            hookReturnVoidWithThis(PreferencesFragmentOnCreatePreferencesFingerprint.method, "$EXTENSION_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V")
        } catch (_: Exception) {
            // Settings screen moved in this build; avoidance stays on with defaults.
        }
    }
}
