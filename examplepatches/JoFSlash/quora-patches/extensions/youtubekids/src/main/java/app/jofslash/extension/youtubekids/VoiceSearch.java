package app.jofslash.extension.youtubekids;

import android.view.View;
import android.view.ViewTreeObserver;

/**
 * Used by the Remove unneeded permissions patch. Without the microphone permission voice search
 * can't listen, and its button does nothing, so hide it.
 */
@SuppressWarnings("unused")
public final class VoiceSearch {
    private VoiceSearch() {
    }

    public static void hide(View button) {
        try {
            if (button == null) return;
            button.setVisibility(View.GONE);
            // The search screen shows its buttons again when its state changes.
            button.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    if (button.getVisibility() != View.GONE) button.setVisibility(View.GONE);
                }
            });
        } catch (Throwable ignored) {
            // Leave the button.
        }
    }
}
