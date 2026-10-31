package app.tikkamasalla.stremio.progress

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
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
        try {
            BingePrefsFingerprint.method.apply {
                val returns = implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
                returns.reversed().forEach { index ->
                    addInstructions(
                        index,
                        "invoke-static {p0}, $INTRO_SETTINGS->add(Landroidx/preference/PreferenceFragmentCompat;)V",
                    )
                }
            }
        } catch (_: Exception) {
            // Settings screen moved; binge still works with its default.
        }
    }
}
