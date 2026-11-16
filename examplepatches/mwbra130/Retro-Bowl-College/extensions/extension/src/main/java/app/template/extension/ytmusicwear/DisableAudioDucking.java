package app.template.extension.ytmusicwear;

import android.media.AudioManager;

/**
 * YouTube Music (Wear OS) — disable audio ducking, extension side.
 *
 * Line-for-line port of the official Morphe extension logic
 * (app.morphe.extension.music.patches.DisableAudioDuckingPatch) with
 * the user setting hardwired ON: the Wear app has no Morphe settings
 * UI to hold the toggle, so the patch is always in effect.
 *
 * How it works (official comments): Android ducks the app itself,
 * unless the focus request declares the app pauses when ducked. So
 * the request hook forces that declaration on, and remembers whether
 * it had to (if the app already declared it, nothing changes). The
 * app is also told about duck events through its focus listener and
 * would lower the volume itself; the change hook swallows exactly
 * those duck events, and only when the request hook had to force the
 * declaration.
 */
public final class DisableAudioDucking {

    private DisableAudioDucking() {
    }

    private static volatile boolean duckingDisabled;

    public static boolean willPauseWhenDucked(boolean original) {
        duckingDisabled = !original;
        return true;
    }

    public static boolean ignoreAudioFocusChange(int focusChange) {
        return duckingDisabled
                && focusChange == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK;
    }
}
