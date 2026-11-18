package app.afterglow.extension.playback;

import android.app.Activity;

/** Native watch actions, injected on the activity's lock-mode coordinator. */
public interface OverlayActionController {
    Activity afterglow_overlayActivity();
    String afterglow_overlayVideoId();
    boolean afterglow_isMuted();
    void afterglow_setMuted(boolean muted);
    /** Native enum number: 0 unknown, 1 unlocked, 2..5 locked or suspended. */
    int afterglow_lockState();
    void afterglow_setLocked(boolean locked);
}
