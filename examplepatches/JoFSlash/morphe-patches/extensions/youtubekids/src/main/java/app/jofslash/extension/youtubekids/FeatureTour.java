package app.jofslash.extension.youtubekids;

import android.graphics.Rect;
import android.view.View;

/**
 * Used by the Skip parent feature tour patch. The tour is a page of the setup flow with a Done
 * button; press it as soon as the page is the one on screen.
 */
@SuppressWarnings("unused")
public final class FeatureTour {
    private static final long INTERVAL_MS = 150;

    private FeatureTour() {
    }

    /** Called when a tour page's view is made, with its Done button. */
    public static void skip(View doneButton) {
        try {
            if (doneButton == null) return;
            doneButton.postDelayed(new Runnable() {
                private boolean pressed;

                @Override
                public void run() {
                    try {
                        if (pressed) return;
                        // The setup pages sit side by side; the next one is made before it is
                        // shown, and the signed-out tour first waits for the content level to be
                        // saved behind a spinner. Press Done only when the page is fully on screen.
                        if (doneButton.isAttachedToWindow() && doneButton.isShown() && isFullyVisible(doneButton)) {
                            pressed = true;
                            doneButton.performClick();
                            return;
                        }
                        if (doneButton.isAttachedToWindow() || !doneButton.isLaidOut()) {
                            doneButton.postDelayed(this, INTERVAL_MS);
                        }
                    } catch (Throwable ignored) {
                        // Leave the tour as it is.
                    }
                }
            }, INTERVAL_MS);
        } catch (Throwable ignored) {
            // Leave the tour as it is.
        }
    }

    private static boolean isFullyVisible(View view) {
        Rect rect = new Rect();
        if (!view.getGlobalVisibleRect(rect)) return false;
        return rect.width() == view.getWidth() && rect.height() == view.getHeight() && view.getWidth() > 0;
    }
}
