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
    dependsOn(oneAheadManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val hookName = if (debugOption.value == true) "onPlayerSetDebug" else "onPlayerSet"

        // Version-independent hooks (TV 1.6.12 .. 1.12.0, phone 2.x): see PortFingerprints.kt.
        // Core.dispatch carries stream start (ActionLoad.Player), TimeChanged, Seek, Paused, Unload.
        CoreDispatchFingerprint.method.addInstructions(
            0,
            "invoke-static {p1, p2}, $PORT_HOOKS->onCoreDispatch(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        // The app's own player interface (Exo, LibVLC, MPV, YouTube): resolved at patch time
        // from the MPV engine. Absent in 1.6.12, where the legacy hooks below do the job.
        val portIface = resolvePlayerInterface()
        portIface?.let { iface ->
            if (hookPlayerConstructors(iface) > 0) generatePlayerStubs(iface)
        }
        // Compose TV host (1.10.x / 1.12.x only: the resolver finds the MPV engine there, never in 1.6.12,
        // so the 1.6.12 dex keeps exactly its legacy hooks). Each hook is optional and fails soft.
        if (portIface != null) {
            val wrapHook = if (debugOption.value == true) "wrapPlayerScreenDebug" else "wrapPlayerScreen"
            try {
                hookReturnObject(
                    PlayerScreenViewFingerprint.method,
                    "$PORT_HOOKS->$wrapHook(Landroid/view/View;)Landroid/view/View;",
                    replace = true,
                )
            } catch (_: Exception) {
                java.util.logging.Logger.getLogger("IntroSkipPatch").warning("PlayerFragment view factory not found: the Compose skip host is off")
            }
            try {
                hookReturnObject(
                    PlayerModelFingerprint.method,
                    "$PORT_HOOKS->onPlayerState(Ljava/lang/Object;)V",
                    replace = false,
                )
            } catch (_: Exception) {
                java.util.logging.Logger.getLogger("IntroSkipPatch").warning("Player model decoder not found: meta type and title come from the video id only")
            }
            // TV: com.stremio.tv.MainActivity. Phone 2.x: com.stremio.android.MainActivity, which has no player
            // Fragment, so PhoneOverlay keeps the skip anchor in the Activity content (see PhoneOverlay.java).
            var activityHooked = false
            try {
                MainActivityOnCreateFingerprint.method.addInstructions(
                    0,
                    "invoke-static {p0}, $PORT_HOOKS->onMainActivity(Ljava/lang/Object;)V",
                )
                activityHooked = true
            } catch (_: Exception) {
                // Not a TV build.
            }
            if (!activityHooked) {
                val phoneHook = if (debugOption.value == true) "onPhoneActivityDebug" else "onPhoneActivity"
                try {
                    PhoneMainActivityOnCreateFingerprint.method.addInstructions(
                        0,
                        "invoke-static {p0}, $PORT_HOOKS->$phoneHook(Ljava/lang/Object;)V",
                    )
                } catch (_: Exception) {
                    java.util.logging.Logger.getLogger("IntroSkipPatch").warning("MainActivity.onCreate not found: activity capture and the phone skip host are off")
                }
            }
        }

        // Legacy Media3 hooks: real androidx names exist only up to 1.10.x (R8 renames Media3
        // in 1.12.0 and phone 2.5.0), so each one is optional.
        try {
            PlayerViewSetPlayerFingerprint.method.addInstructions(
                0,
                """
                    invoke-static {p0, p1}, $EXTENSION_CLASS->$hookName(Landroid/view/View;Landroidx/media3/common/Player;)V
                """.trimIndent(),
            )
        } catch (_: Exception) {
            // Media3 PlayerView renamed in this build.
        }

        // Direct surface setup hook (Stremio 1.6.12 TV flow):
        // p0 = ExoPlayerImpl (implements Player), p1 = SurfaceView.
        // Resolves p1.getParent() (the container ViewGroup) and passes (v0, p0) to IntroSkipBridge.
        try { ExoPlayerSetVideoSurfaceViewFingerprint.method.addInstructionsWithLabels(
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
        ) } catch (_: Exception) {
            // Media3 ExoPlayerImpl renamed in this build.
        }

        // TV playback entry point hook (Stremio 1.6.12 flow, engine-agnostic):
        // Runs right after startStreamPlayback assigns this.player (index 5).
        // v0 = StremioPlayer (implements media3 Player), v1 = fragment root view.
        // Present in 1.6.12 only (PlayerFragment became a Compose shell in 1.10.x).
        val startStream = try {
            StartStreamPlaybackFingerprint.method
        } catch (_: Exception) {
            // Legacy fragment entry point gone (Compose builds); Core.dispatch + player interface hooks cover it.
            null
        }
        // Matched: a moved hook point must fail the patch visibly, so nothing below is caught.
        startStream?.addInstructions(
            playerAssignedIndex(startStream),
            """
                iget-object v0, p0, Lcom/stremio/tv/views/player/PlayerFragment;->player:Lcom/stremio/common/players/StremioPlayer;
                invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
                move-result-object v1
                invoke-static {v1, v0}, $EXTENSION_CLASS->$hookName(Landroid/view/View;Landroidx/media3/common/Player;)V
            """.trimIndent(),
        )

        // Settings rows in Stremio Settings > Playback (fail soft).
        try {
            hookReturnVoidWithThis(PreferencesFragmentOnCreatePreferencesFingerprint.method, "$EXTENSION_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V")
        } catch (_: Exception) {
            // Settings screen moved in this build; the skip keeps working with defaults.
        }
    }
}
