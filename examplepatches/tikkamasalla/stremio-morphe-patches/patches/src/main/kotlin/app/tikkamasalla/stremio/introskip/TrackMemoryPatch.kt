package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val TRACKMEM = "Lapp/tikkamasalla/stremio/introskip/TrackMemory;"
private const val TRACK_SETTINGS = "Lapp/tikkamasalla/stremio/introskip/IntroSkipSettings;"

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

/** Remembers audio and subtitle choices per show and applies them. Default ON. */
val trackMemoryPatch = bytecodePatch(
    name = "Remember tracks per show",
    description = "Remembers the last audio and subtitle choice for each series and applies it to other episodes.",
    default = true,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        try {
            TrackSelectFingerprint.method.addInstructions(
                0,
                "invoke-static {p0, p1}, $TRACKMEM->remember(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        } catch (_: Exception) {
            // Choices are not remembered on this build.
        }
        try {
            TracksChangedFingerprint.method.addInstructions(
                0,
                "invoke-static {p0, p1}, $TRACKMEM->apply(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        } catch (_: Exception) {
            // Stremio defaults keep working on this build.
        }
        try {
            TrackPrefsFingerprint.method.apply {
                val returns = implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
                returns.reversed().forEach { index ->
                    addInstructions(
                        index,
                        "invoke-static {p0}, $TRACK_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V",
                    )
                }
            }
        } catch (_: Exception) {
            // Settings screen moved; memory still works with its default.
        }
    }
}
