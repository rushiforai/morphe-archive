package app.morphe.patches.kicktv.stoponminimize

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/stoponminimize/"

/**
 * MainActivity.onPause(). KICK pauses the player here conditionally
 * (`((om2) player).O(false)` only when `y()` reports playing). When the app is
 * minimized on Android TV the audio can nonetheless keep playing, so the patch
 * forces `setPlayWhenReady(false)` unconditionally when the tweak is enabled.
 */
private object MainActivityOnPauseFingerprint : Fingerprint(
    definingClass = "Lcom/kick/tv/MainActivity;",
    name = "onPause",
    parameters = emptyList(),
    returnType = "V",
)

/**
 * STOP ON MINIMIZE tweak. Stops playback (audio/video) when KICK is minimized
 * or exited so nothing keeps playing in the background. Open a stream again to
 * resume. The toggle lives in the SEYTTINGS menu provided by the base patch
 * this patch depends on.
 */
@Suppress("unused")
val stopOnMinimizePatch = patch(
    name = "STOP ON MINIMIZE",
    description = "Stops playback (audio/video) when the app is minimized or " +
        "exited, so nothing keeps playing in the background. Open a stream " +
        "again to resume playback. Toggle it in SEYTTINGS. Requires the " +
        "SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickStopOnMinimize.mpe")

    execute {
        MainActivityOnPauseFingerprint.apply {
            method.addInstructions(
                0,
                """
                    invoke-static {}, ${EXTENSION_CLASS}StopOnMinimizePrefs;->isStopOnMinimizeEnabled()Z
                    move-result v0
                    if-eqz v0, :morphe_stop_continue
                    invoke-virtual {p0}, Lcom/kick/tv/MainActivity;->m()Lh75;
                    move-result-object v1
                    invoke-virtual {v1}, Lh75;->e()Landroidx/media3/exoplayer/ExoPlayer;
                    move-result-object v2
                    if-eqz v2, :morphe_stop_continue
                    check-cast v2, Ldefpackage/om2;
                    const/4 v3, 0x0
                    invoke-virtual {v2, v3}, Ldefpackage/om2;->O(Z)V
                    :morphe_stop_continue
                """.trimIndent(),
            )
        }
    }
}
