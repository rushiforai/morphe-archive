package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_SETTINGS = "Lapp/tikkamasalla/stremio/introskip/IntroSkipSettings;";
private const val EXTENSION_CLASS = "Lapp/tikkamasalla/stremio/introskip/IntroSkipBridge;"
private const val MOD_VERSION = "1.0.0"
private const val REPOSITORY_URL = "https://github.com/tikkamasalla/stremio-morphe-patches"

/** Adds the Intro Skip overlay bridge whenever Stremio attaches a Media3 player. */
val introSkipPatch = bytecodePatch(
    name = "Intro Skip",
    description = "Adds intro and recap skip controls for TV shows, movies and anime in Stremio.\n\nIntro Skip v$MOD_VERSION\nRepository: $REPOSITORY_URL",
    default = true,
) {
    val debugOption = booleanOption(
        key = "debug",
        default = false,
        title = "Enable debug mode",
        description = "Opens the Intro Skip log when playback starts, to check the title, season, episode and API calls.",
    )

    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        val hookName = if (debugOption.value == true) "onPlayerSetDebug" else "onPlayerSet"
        PlayerViewSetPlayerFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $EXTENSION_CLASS->$hookName(Landroid/view/View;Landroidx/media3/common/Player;)V
            """.trimIndent(),
        )

        // Direct surface setup hook (Stremio 1.6.12 TV flow):
        // p0 = ExoPlayerImpl (implements Player), p1 = SurfaceView.
        // Resolves p1.getParent() (the container ViewGroup) and passes (v0, p0) to IntroSkipBridge.
        ExoPlayerSetVideoSurfaceViewFingerprint.method.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :introskip_skip
                invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
                move-result-object v0
                instance-of v1, v0, Landroid/view/View;
                if-eqz v1, :introskip_skip
                check-cast v0, Landroid/view/View;
                invoke-static {v0, p0}, $EXTENSION_CLASS->$hookName(Landroid/view/View;Landroidx/media3/common/Player;)V
                :introskip_skip
                nop
            """.trimIndent(),
        )

        // TV playback entry point hook (Stremio 1.6.12 flow, engine-agnostic):
        // Runs right after startStreamPlayback assigns this.player (index 5).
        // v0 = StremioPlayer (implements media3 Player), v1 = fragment root view.
        StartStreamPlaybackFingerprint.method.addInstructions(
            playerAssignedIndex(StartStreamPlaybackFingerprint.method),
            """
                iget-object v0, p0, Lcom/stremio/tv/views/player/PlayerFragment;->player:Lcom/stremio/common/players/StremioPlayer;
                invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
                move-result-object v1
                invoke-static {v1, v0}, $EXTENSION_CLASS->$hookName(Landroid/view/View;Landroidx/media3/common/Player;)V
            """.trimIndent(),
        )

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
            // Settings screen moved in this build; the skip keeps working with defaults.
        }
    }
}
