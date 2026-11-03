package app.tikkamasalla.stremio.progress

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.tikkamasalla.stremio.introskip.hookReturnVoidWithThis
import app.tikkamasalla.stremio.introskip.Constants
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION = "Lapp/tikkamasalla/stremio/progress/ExternalProgress;"
private const val INTRO_SETTINGS = "Lapp/tikkamasalla/stremio/introskip/IntroSkipSettings;"

private object BingePlaybackFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/player/PlayerFragment;",
    name = "startStreamPlayback",
    parameters = listOf("Lcom/stremio/core/types/resource/Stream;", "J"),
)

private object EndNavigationFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/player/PlayerFragment\$playerEventListener\$1;",
    name = "invoke",
    returnType = "V",
    parameters = listOf(),
)

/** Stub in the extension: true on builds without the PlayerFragment hooks (Compose), see ExternalProgress.composeBinge. */
private object BingeComposeStub : Fingerprint(
    definingClass = EXTENSION,
    name = "composeBinge",
    parameters = emptyList(),
)

private object BingePrefsFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/settings/PreferencesFragment;",
    name = "onCreatePreferences",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
)

/** Plays the next episode in the same external player when one finishes. Default ON. */
val bingeExternalPatch = bytecodePatch(
    name = "Binge with external players",
    description = "Auto-plays the next episode in the same external player when an episode finishes in Vimu, MX Player, VLC or mpv.",
    default = true,
) {
    dependsOn(externalPlayerProgressPatch)
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // PlayerFragment hooks exist on 1.6.12 only. Compose builds (1.10.x, 1.12.x, phone 2.x) play through a
        // Compose screen: there the stock "play next" runs after a completed result and the relaunch is decided
        // in ExternalProgress.decorate (composeBinge), so the fragment hooks are dropped.
        if (BingePlaybackFingerprint.originalMethodOrNull != null) {
            try {
                BingePlaybackFingerprint.method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0, p1}, $EXTENSION->maybeBinge(Ljava/lang/Object;Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :binge_pass
                        return-void
                        :binge_pass
                        nop
                    """.trimIndent(),
                )
            } catch (_: Exception) {
                // Internal playback keeps working; binge stays off on this build.
            }
            try {
                // The internal player's end-of-playback callback: only a real end opens the next episode.
                EndNavigationFingerprint.method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0}, $EXTENSION->allowAutoNext(Ljava/lang/Object;)Z
                        move-result v0
                        if-nez v0, :binge_allow
                        return-void
                        :binge_allow
                        nop
                    """.trimIndent(),
                )
            } catch (_: Exception) {
                // Stock behaviour stays.
            }
        } else {
            try {
                BingeComposeStub.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            } catch (e: Exception) {
                java.util.logging.Logger.getLogger("BingePatch").warning("composeBinge stub not found: binge relaunch is off on this build: ${e.message}")
            }
        }
        try {
            hookReturnVoidWithThis(BingePrefsFingerprint.method, "$INTRO_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V")
        } catch (_: Exception) {
            // Settings screen moved; binge still works with its default.
        }
    }
}
