/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.preview;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import eightbitlab.com.blurview.BlurTarget;
import eightbitlab.com.blurview.BlurView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.io.File;
import java.io.FileOutputStream;

/** The Liquid Glass settings, opened with a long press on the liquid tab bar. */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 35, qualifiers = "w411dp-h891dp-night-xxhdpi")
public class SettingsSheetPreviewTest extends PreviewScene {

    /**
     * A long press on the liquid tab bar opens the settings sheet; its changes apply at once, and
     * turning the liquid tab bar off gives the tab bar back to Apple.
     */
    @Test
    public void settingsSheet() throws Exception {
        buildScene(content());
        render("before-settings");
        float[] point = tabCenter(2);
        View decor = activity.getWindow().getDecorView();
        long time = android.os.SystemClock.uptimeMillis();
        android.view.MotionEvent down = android.view.MotionEvent.obtain(time, time, android.view.MotionEvent.ACTION_DOWN, point[0], point[1], 0);
        decor.dispatchTouchEvent(down);
        advance(800);
        android.view.MotionEvent up = android.view.MotionEvent.obtain(time, time + 800, android.view.MotionEvent.ACTION_UP, point[0], point[1], 0);
        decor.dispatchTouchEvent(up);
        assertEquals("a long press does not select the tab under the finger",
                R.id.action_listen_now_deprecated, tabBar.getSelectedItemId());
        render("settings-sheet");
        assertTrue("the settings sheet is open", countComposeViews(decor) == 2);

        // Live change: Apple's tint back to 100% restores its alpha on the mini player.
        app.liquidmusic.extension.LiquidSettings.INSTANCE.set("tintOpacity", 100);
        render("settings-tint-100");
        LayerDrawable layers = (LayerDrawable) miniPlayer.getBackground();
        assertEquals("Apple's tint restored", 255, layers.findDrawableByLayerId(R.id.material_layer).getAlpha());

        // Back closes the sheet.
        decor.dispatchKeyEvent(new android.view.KeyEvent(android.view.KeyEvent.ACTION_DOWN, android.view.KeyEvent.KEYCODE_BACK));
        decor.dispatchKeyEvent(new android.view.KeyEvent(android.view.KeyEvent.ACTION_UP, android.view.KeyEvent.KEYCODE_BACK));
        advance(100);
        assertEquals("Back closes the sheet", 1, countComposeViews(decor));

        // Turning the liquid tab bar off gives the bar back to Apple.
        app.liquidmusic.extension.LiquidSettings.INSTANCE.set("liquidTabBar", false);
        tabBar.invalidate();
        render("liquid-tab-bar-off");
        assertEquals("the liquid tab bar is gone", 0, countComposeViews(decor));
        assertTrue("Apple's tab bar draws again", tabBar.getClipBounds() == null);
    }
}
