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

/** The liquid tab bar of Backdrop, driving Apple's tab bar. */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 35, qualifiers = "w411dp-h891dp-night-xxhdpi")
public class LiquidTabBarPreviewTest extends PreviewScene {

    /**
     * Tapping a tab of the liquid tab bar moves the drop and navigates with Apple's tab bar; a tab
     * Apple selects by itself moves the drop.
     */
    @Test
    public void liquidTabBarDrivesAppleTabBar() throws Exception {
        buildScene(content());
        render("liquid-tab-bar");
        assertEquals(R.id.action_listen_now_deprecated, tabBar.getSelectedItemId());

        tap(tabCenter(3)); // Library
        advance(600);
        assertEquals("a tap on Library selects Library in Apple's tab bar",
                R.id.action_library_deprecated, tabBar.getSelectedItemId());
        render("liquid-tab-bar-library");

        tabBar.setSelectedItemId(R.id.action_multiply_radio_deprecated);
        tabBar.invalidate();
        advance(600);
        render("liquid-tab-bar-radio");
        assertEquals("the bar does not fight Apple's own selection",
                R.id.action_multiply_radio_deprecated, tabBar.getSelectedItemId());
    }
}
