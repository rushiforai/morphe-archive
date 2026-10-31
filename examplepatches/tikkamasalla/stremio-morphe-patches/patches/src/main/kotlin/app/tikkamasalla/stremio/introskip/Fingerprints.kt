package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.Fingerprint

/** Finds Media3 PlayerView.setPlayer(Player) without relying on obfuscated app code. */
object PlayerViewSetPlayerFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/ui/PlayerView;",
    name = "setPlayer",
    parameters = listOf("Landroidx/media3/common/Player;"),
)

/**
 * Hooks Media3 ExoPlayerImpl.setVideoSurfaceView(SurfaceView), which is always
 * called when com.stremio.tv attaches ExoPlayer directly to its video surface.
 */
object ExoPlayerSetVideoSurfaceViewFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/exoplayer/ExoPlayerImpl;",
    name = "setVideoSurfaceView",
    parameters = listOf("Landroid/view/SurfaceView;"),
)

/**
 * Hooks the TV playback entry point, which runs for every stream regardless of
 * engine (ExoPlayer or LibVLC): right after startStreamPlayback assigns the
 * StremioPlayer, the fragment root view and the player are passed to the bridge.
 */
object StartStreamPlaybackFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/player/PlayerFragment;",
    name = "startStreamPlayback",
    parameters = listOf("Lcom/stremio/core/types/resource/Stream;", "J"),
)

/**
 * Builds every settings row (root screen and each sub-screen): the single place
 * where Stremio inflates res/xml/preferences.xml. An AndroidX override, so the
 * signature is stable across Stremio builds.
 */
object PreferencesFragmentOnCreatePreferencesFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/settings/PreferencesFragment;",
    name = "onCreatePreferences",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
)

/**
 * Index right after startStreamPlayback stores the StremioPlayer in PlayerFragment.player.
 * Found by instruction, not by a fixed number, so other patches that insert code at the
 * start of the method (for example the binge hook) cannot move a hook into dead code.
 */
fun playerAssignedIndex(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod): Int {
    val instructions = method.implementation!!.instructions
    for ((index, instruction) in instructions.withIndex()) {
        if (instruction.opcode != com.android.tools.smali.dexlib2.Opcode.IPUT_OBJECT) continue
        val reference = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
            ?.reference ?: continue
        val text = com.android.tools.smali.dexlib2.util.ReferenceUtil.getReferenceString(reference)
        if (text == "Lcom/stremio/tv/views/player/PlayerFragment;->player:Lcom/stremio/common/players/StremioPlayer;") {
            return index + 1
        }
    }
    return 5
}
