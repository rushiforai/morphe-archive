package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val TRACKMEM = "Lapp/tikkamasalla/stremio/introskip/TrackMemory;"
private const val TRACK_SETTINGS = "Lapp/tikkamasalla/stremio/introskip/IntroSkipSettings;"
private const val TRACKMEM_PORT = "Lapp/tikkamasalla/stremio/introskip/TrackMemory\$Port;"

private object TrackSelectFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/player/dialog/TrackSelectionDialog;",
    name = "onSelectTrack",
    parameters = listOf("Lcom/stremio/tv/views/player/dialog/TrackSelectionDialog\$TrackInfo;"),
)

private object TracksChangedFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/players/PlayerEventListener;",
    name = "onTracksChanged",
    parameters = listOf("Landroidx/media3/common/Tracks;"),
)

private object TrackPrefsFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/settings/PreferencesFragment;",
    name = "onCreatePreferences",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
)

/** Compose builds (TV 1.10.x / 1.12.x, phone 2.x): every UI -> core action, StreamStateChanged carries manual track picks. */
private object TrackDispatchFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/core/Core;",
    name = "dispatch",
    returnType = "V",
    parameters = listOf("Lcom/stremio/core/runtime/msg/Action;", "Lcom/stremio/core/Field;"),
)

/** Compose builds: the core Player model decoder (named in every build); its streamState drives the stock track choice. */
private object TrackPlayerModelFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/core/models/PlayerKt;",
    name = "decodeWithImpl",
    returnType = "Lcom/stremio/core/models/Player;",
)

/** Remembers audio and subtitle choices per show and applies them. Default ON. */
val trackMemoryPatch = bytecodePatch(
    name = "Remember tracks per show",
    description = "Remembers the last audio and subtitle choice for each series and applies it to other episodes.",
    default = true,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        var legacy = false
        try {
            TrackSelectFingerprint.method.addInstructions(
                0,
                "invoke-static {p0, p1}, $TRACKMEM->remember(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
            legacy = true
        } catch (_: Exception) {
            // Choices are not remembered on this build.
        }
        try {
            // After Stremio's own onTracksChanged (it applies the core's stream-state tracks), on every return path.
            val hooked = hookEveryReturn(TracksChangedFingerprint.method, Opcode.RETURN_VOID) {
                "invoke-static {p0, p1}, $TRACKMEM->apply(Ljava/lang/Object;Ljava/lang/Object;)V"
            }
            if (hooked == 0) throw IllegalStateException("onTracksChanged has no return-void")
            legacy = true
        } catch (_: Exception) {
            // Stremio defaults keep working on this build.
        }
        // 1.6.12 flow: right after startStreamPlayback stores the player (media not prepared yet) the remembered languages become
        // the preferred languages, so the first track selection already picks them and nothing switches after playback starts.
        val startStream = try {
            StartStreamPlaybackFingerprint.method
        } catch (_: Exception) {
            null // Compose builds have no startStreamPlayback.
        }
        // Matched: a moved hook point must fail the patch visibly, so nothing below is caught.
        startStream?.addInstructions(
            playerAssignedIndex(startStream),
            """
                iget-object v0, p0, Lcom/stremio/tv/views/player/PlayerFragment;->player:Lcom/stremio/common/players/StremioPlayer;
                invoke-static {p0, v0}, $TRACKMEM->preSelect(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )
        if (!legacy) {
            // Compose builds (no TrackSelectionDialog / PlayerEventListener): 1.6.12 never gets these hooks.
            try {
                TrackDispatchFingerprint.method.addInstructions(
                    0,
                    "invoke-static {p1, p2}, $TRACKMEM_PORT->onDispatch(Ljava/lang/Object;Ljava/lang/Object;)V",
                )
            } catch (_: Exception) {
                java.util.logging.Logger.getLogger("TrackMemoryPatch").warning("Core.dispatch not found: track picks are not remembered")
            }
            try {
                hookReturnObject(
                    TrackPlayerModelFingerprint.method,
                    "$TRACKMEM_PORT->onPlayerModel(Ljava/lang/Object;)V",
                    replace = false,
                )
            } catch (_: Exception) {
                java.util.logging.Logger.getLogger("TrackMemoryPatch").warning("Player model decoder not found: remembered tracks are not applied")
            }
        }
        try {
            hookReturnVoidWithThis(TrackPrefsFingerprint.method, "$TRACK_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V")
        } catch (_: Exception) {
            // Settings screen moved; memory still works with its default.
        }
    }
}
