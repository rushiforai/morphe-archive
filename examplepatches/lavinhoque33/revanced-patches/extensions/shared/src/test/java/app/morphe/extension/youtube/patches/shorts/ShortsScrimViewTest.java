/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-19.
 */

package app.morphe.extension.youtube.patches.shorts;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.pm.PackageInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class ShortsScrimViewTest {
    private static final int STOCK_DIM = 0x99000000;

    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = app.getPackageName();
        packageInfo.versionName = "20.05.46";
        packageInfo.applicationInfo = app.getApplicationInfo();
        shadowOf(app.getPackageManager()).installPackage(packageInfo);
        Utils.setContext(app);
        Settings.HIDE_SHORTS_DIMMING.resetToDefault();
    }

    @Test
    public void settingHidesAndRestoresTheSameScrimButNotAnOrdinaryVideoOverlay() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            var activity = controller.get();
            var root = new FrameLayout(activity);
            var scrim = new ShortsScrimView(activity, Robolectric.buildAttributeSet().build());
            var ordinaryOverlay = new View(activity);
            var stockDrawable = new ColorDrawable(STOCK_DIM);
            scrim.setBackground(stockDrawable);
            ordinaryOverlay.setBackgroundColor(STOCK_DIM);
            root.addView(scrim, 8, 8);
            root.addView(ordinaryOverlay, 8, 8);
            activity.setContentView(root);

            assertEquals(STOCK_DIM, pixel(scrim));
            assertEquals(STOCK_DIM, pixel(ordinaryOverlay));

            setFromPreference(true);
            assertEquals(Color.TRANSPARENT, pixel(scrim));
            assertEquals(STOCK_DIM, pixel(ordinaryOverlay));
            assertSame(stockDrawable, scrim.getBackground());
            assertEquals(View.VISIBLE, scrim.getVisibility());
            assertEquals(8, scrim.getWidth());
            assertEquals(8, scrim.getHeight());

            setFromPreference(false);
            assertEquals(STOCK_DIM, pixel(scrim));
            assertEquals(STOCK_DIM, pixel(ordinaryOverlay));
            assertSame(stockDrawable, scrim.getBackground());
        }
    }

    @Test
    public void programmaticScrimReadsCurrentSettingWhenItReattaches() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            var activity = controller.get();
            var root = new FrameLayout(activity);
            activity.setContentView(root);
            var scrim = new ShortsScrimView(activity);
            scrim.setBackgroundColor(STOCK_DIM);

            setFromPreference(true);
            root.addView(scrim, 8, 8);
            assertEquals(Color.TRANSPARENT, pixel(scrim));

            root.removeView(scrim);
            scrim.setBackgroundColor(Color.RED);
            setFromPreference(false);
            root.addView(scrim, 8, 8);
            assertEquals(Color.RED, pixel(scrim));
        }
    }

    private static void setFromPreference(boolean hide) {
        Setting.preferences.preferences.edit().putBoolean(Settings.HIDE_SHORTS_DIMMING.key, hide).apply();
        shadowOf(Looper.getMainLooper()).idle();
    }

    private static int pixel(View view) {
        view.layout(0, 0, 8, 8);
        Bitmap bitmap = Bitmap.createBitmap(8, 8, Bitmap.Config.ARGB_8888);
        view.draw(new Canvas(bitmap));
        return bitmap.getPixel(4, 4);
    }
}
