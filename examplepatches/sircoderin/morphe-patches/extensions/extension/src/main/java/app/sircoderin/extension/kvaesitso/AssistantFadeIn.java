package app.sircoderin.extension.kvaesitso;

import android.app.Activity;
import android.view.View;
import android.view.animation.DecelerateInterpolator;

/**
 * Entrance animation for Kvaesitso's search overlay (assistant mode): the mirror of its swipe-to-close
 * "push" animation (which fades the content out while scaling it down). Fades the content in from 0 while
 * scaling up slightly, so opening feels as soft as closing.
 */
@SuppressWarnings("unused")
public final class AssistantFadeIn {
    private static final long DURATION_MS = 320;
    private static final float START_SCALE = 0.92f;

    private AssistantFadeIn() {}

    /** Called from SharedLauncherActivity.onAttachedToWindow (injected by the patch). */
    public static void animateIn(Activity activity) {
        if (!activity.getClass().getName().endsWith(".AssistantActivity")) return; // not the home-screen mode
        View content = activity.getWindow().getDecorView();
        content.setAlpha(0f);
        content.setScaleX(START_SCALE);
        content.setScaleY(START_SCALE);
        content.animate()
                .alpha(1f)
                .scaleX(1f)
                .scaleY(1f)
                .setDuration(DURATION_MS)
                .setInterpolator(new DecelerateInterpolator(1.5f))
                .start();
    }
}
