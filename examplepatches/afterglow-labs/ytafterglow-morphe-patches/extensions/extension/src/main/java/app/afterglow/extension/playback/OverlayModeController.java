package app.afterglow.extension.playback;

import android.view.View;

/** Typed access to the native overlay's original state and guarded refresh command. */
public interface OverlayModeController {
    View afterglow_modeRoot();
    boolean afterglow_modeVisible();
    void afterglow_refreshMode(boolean restore);
}
