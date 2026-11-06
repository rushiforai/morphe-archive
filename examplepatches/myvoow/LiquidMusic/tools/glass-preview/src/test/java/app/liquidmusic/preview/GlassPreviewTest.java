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

/**
 * Apple's blur and the glass on the mini player, checked the way the glass failed on a phone in
 * 1.0.1.
 */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 35, qualifiers = "w411dp-h891dp-night-xxhdpi")
public class GlassPreviewTest extends PreviewScene {

    @Test
    public void appleOriginal() throws Exception {
        BlurView.patched = false;
        buildScene(content());
        render("apple-original");
    }

    @Test
    public void liquidGlass() throws Exception {
        buildScene(content());
        render("liquid-glass");
        assertTrue("the mini player draws the glass", miniPlayerGlass.drewGlass);
        assertTrue("the liquid tab bar replaces the glass of the tab bar", tabBarGlass.drewGlass);
        assertTrue("Apple's tab bar no longer draws", tabBar.getClipBounds() != null && tabBar.getClipBounds().isEmpty());
        assertTrue("the liquid tab bar is on screen", findComposeView(activity.getWindow().getDecorView()) != null);

        // Apple sets its material again whenever the colors of the player change.
        LayerDrawable layers = (LayerDrawable) miniPlayer.getBackground();
        layers.setDrawableByLayerId(R.id.material_layer, activity.getDrawable(R.drawable.layer_apple_material));
        layers.findDrawableByLayerId(R.id.artwork_color_scheme_layer).mutate().setAlpha(255);
        miniPlayer.invalidate();
        render("liquid-glass-after-color-change");
        layers = (LayerDrawable) miniPlayer.getBackground();
        assertEquals("material layer faded to 40%", 102, layers.findDrawableByLayerId(R.id.material_layer).getAlpha());
        assertEquals("artwork layer faded to 40%", 102, layers.findDrawableByLayerId(R.id.artwork_color_scheme_layer).getAlpha());
    }

    /**
     * The glass must hide what is right behind it. A thin white line sits behind the left end of
     * the mini player, inside the band the lens bends: the lens shows content from further inside
     * there, so the line disappears. In 1.0.1 the glass was transparent and the line showed.
     */
    @Test
    public void glassIsOpaque() throws Exception {
        FrameLayout behind = new FrameLayout(activity);
        buildScene(behind);
        int[] location = new int[2];
        int[] origin = new int[2];
        miniPlayer.getLocationInWindow(location);
        behind.getLocationInWindow(origin);
        View line = new View(activity);
        line.setBackgroundColor(Color.WHITE);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(dp(2), dp(24));
        params.leftMargin = location[0] - origin[0] + dp(4);
        params.topMargin = location[1] - origin[1] + miniPlayer.getHeight() / 2 - dp(12);
        behind.addView(line, params);

        Bitmap glass = render("opacity-probe");
        int seen = luminance(glass.getPixel(location[0] + dp(5), location[1] + miniPlayer.getHeight() / 2));
        System.out.println("Luminance where the line is, behind the glass: " + seen);
        assertTrue("the line behind the glass shows through (luminance " + seen + ")", seen < 60);
    }
}
