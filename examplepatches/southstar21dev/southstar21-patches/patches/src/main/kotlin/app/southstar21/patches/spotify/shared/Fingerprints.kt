package app.southstar21.patches.spotify.shared

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * SpotifyMainActivity.onWindowFocusChanged is a real override that keeps its name. It runs
 * once the main layout is up, and again after the activity is recreated, so patches that need
 * the main activity's views can hook it.
 */
internal object SpotifyMainActivityWindowFocusFingerprint : Fingerprint(
    definingClass = "Lcom/spotify/music/SpotifyMainActivity;",
    name = "onWindowFocusChanged",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
)
