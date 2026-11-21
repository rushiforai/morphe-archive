/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.shorts;

import static org.junit.Assert.assertEquals;

import android.app.Activity;
import android.view.View;
import android.view.WindowManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
@SuppressWarnings("deprecation")
public class ShortsPresentationTest {
    private static final float EXACT = 0f;

    @Test
    public void legacyOpacityTracksRebindAndRestoresLatestNativeAlpha() {
        var view = new View(RuntimeEnvironment.getApplication());
        view.setAlpha(0.8f);
        var opacity = new ShortsPresentation.ControlOpacity(view);

        opacity.apply(0.5f);
        opacity.apply(0.5f);
        assertEquals(0.4f, view.getAlpha(), EXACT);

        view.setAlpha(0.6f);
        opacity.apply(0.5f);
        assertEquals(0.3f, view.getAlpha(), EXACT);
        opacity.restore();
        assertEquals(0.6f, view.getAlpha(), EXACT);

        opacity.apply(0f);
        view.setAlpha(0.2f);
        opacity.restore();
        assertEquals(0.2f, view.getAlpha(), EXACT);
    }

    @Test
    @Config(sdk = 34)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void modernOpacityComposesWithNativeAlphaWithoutReplacingIt() {
        var view = new View(RuntimeEnvironment.getApplication());
        view.setAlpha(0.8f);
        view.setTransitionAlpha(0.6f);
        var opacity = new ShortsPresentation.ControlOpacity(view);

        opacity.apply(0.5f);
        assertEquals(0.3f, view.getTransitionAlpha(), EXACT);
        view.setAlpha(0.2f);
        opacity.restore();
        assertEquals(0.6f, view.getTransitionAlpha(), EXACT);
        assertEquals(0.2f, view.getAlpha(), EXACT);
    }

    @Test
    public void legacyStatusBarRestoresOnlyBitsAddedForThisReel() {
        try (var activity = Robolectric.buildActivity(Activity.class).setup().visible()) {
            var window = activity.get().getWindow();
            var decor = window.getDecorView();
            int original = View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
            decor.setSystemUiVisibility(original);
            var statusBar = new ShortsStatusBar(window);

            statusBar.enter();
            statusBar.enter();
            assertEquals(original | View.SYSTEM_UI_FLAG_FULLSCREEN, decor.getSystemUiVisibility());

            decor.setSystemUiVisibility(decor.getSystemUiVisibility() | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
            statusBar.exit();
            assertEquals(original | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR, decor.getSystemUiVisibility());
        }
    }

    @Test
    public void legacyStatusBarLeavesPreviouslyHiddenBarsAloneInBothWindows() {
        try (var original = Robolectric.buildActivity(Activity.class).setup().visible();
             var replacement = Robolectric.buildActivity(Activity.class).setup().visible()) {
            var originalWindow = original.get().getWindow();
            var replacementWindow = replacement.get().getWindow();
            originalWindow.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN);
            replacementWindow.addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
            int replacementFlags = replacementWindow.getDecorView().getSystemUiVisibility();
            var originalBar = new ShortsStatusBar(originalWindow);
            var replacementBar = new ShortsStatusBar(replacementWindow);

            originalBar.enter();
            replacementBar.enter();
            assertEquals(replacementFlags, replacementWindow.getDecorView().getSystemUiVisibility());
            originalBar.exit();
            assertEquals(View.SYSTEM_UI_FLAG_FULLSCREEN, originalWindow.getDecorView().getSystemUiVisibility());

            replacementBar.exit();
            assertEquals(replacementFlags, replacementWindow.getDecorView().getSystemUiVisibility());
        }
    }
}
