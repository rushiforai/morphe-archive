/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-18.
 */

package app.morphe.extension.music.patches.general;

import static android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND;
import static android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.Dialog;
import android.content.pm.PackageInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.ColorDrawable;
import android.os.Looper;
import android.view.View;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class OverlayFilterPatchTest {
    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = app.getPackageName();
        packageInfo.versionName = "9.45.51";
        packageInfo.applicationInfo = app.getApplicationInfo();
        shadowOf(app.getPackageManager()).installPackage(packageInfo);
        Utils.setContext(app);
        Settings.HIDE_OVERLAY_FILTER.resetToDefault();
        Settings.HIDE_PLAYER_OVERLAY_FILTER.resetToDefault();
        Settings.HIDE_DOUBLE_TAP_OVERLAY_FILTER.resetToDefault();
    }

    @Test
    public void onlyMenuToggleChangesDimAndRestoresTheOriginalWindowBit() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            var window = controller.get().getWindow();
            window.addFlags(FLAG_DIM_BEHIND | FLAG_KEEP_SCREEN_ON);
            int stockFlags = window.getAttributes().flags;
            OverlayFilterPatch.updateWindowDim(window);
            assertEquals(stockFlags, window.getAttributes().flags);
            assertEquals(0x99000000, menuScrimPixel());

            Settings.HIDE_PLAYER_OVERLAY_FILTER.save(true);
            Settings.HIDE_DOUBLE_TAP_OVERLAY_FILTER.save(true);
            OverlayFilterPatch.updateWindowDim(window);
            assertEquals(stockFlags, window.getAttributes().flags);
            assertEquals(0x99000000, menuScrimPixel());

            Settings.HIDE_OVERLAY_FILTER.save(true);
            OverlayFilterPatch.updateWindowDim(window);
            OverlayFilterPatch.updateWindowDim(window);
            assertEquals(stockFlags & ~FLAG_DIM_BEHIND, window.getAttributes().flags);
            assertEquals(Color.TRANSPARENT, menuScrimPixel());

            Settings.HIDE_OVERLAY_FILTER.save(false);
            OverlayFilterPatch.updateWindowDim(window);
            assertEquals(stockFlags, window.getAttributes().flags);
            assertEquals(0x99000000, menuScrimPixel());

            window.clearFlags(FLAG_DIM_BEHIND);
            Settings.HIDE_OVERLAY_FILTER.save(true);
            OverlayFilterPatch.updateWindowDim(window);
            Settings.HIDE_OVERLAY_FILTER.save(false);
            OverlayFilterPatch.updateWindowDim(window);
            assertEquals(stockFlags & ~FLAG_DIM_BEHIND, window.getAttributes().flags);
        }
    }

    @Test
    public void reopeningPlayerDialogRestoresItsOriginalDimAmountAndKeepsTheOtherWindowFlags() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            var dialog = new Dialog(controller.get());
            var window = dialog.getWindow();
            window.addFlags(FLAG_DIM_BEHIND | FLAG_KEEP_SCREEN_ON);
            window.setDimAmount(0.375f);

            try {
                dialog.show();
                int stockFlags = window.getAttributes().flags;
                Settings.HIDE_OVERLAY_FILTER.save(true);
                OverlayFilterPatch.updateDialogDim(dialog);
                assertEquals(stockFlags & ~FLAG_DIM_BEHIND, window.getAttributes().flags);
                assertEquals(0.375f, window.getAttributes().dimAmount, 0);
                dialog.hide();

                Settings.HIDE_OVERLAY_FILTER.save(false);
                dialog.show();
                OverlayFilterPatch.updateDialogDim(dialog);
                assertEquals(stockFlags, window.getAttributes().flags);
                assertEquals(0.375f, window.getAttributes().dimAmount, 0);
                assertEquals(window, dialog.getWindow());
            } finally {
                dialog.dismiss();
            }
        }
    }

    @Test
    public void playerToggleRestoresTheExactBackgroundOnTheSameAttachedView() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            var activity = controller.get();
            View scrim = new View(activity);
            DrawablePair backgrounds = new DrawablePair(new ColorDrawable(0x80000000), new ColorDrawable(Color.RED));
            scrim.setBackground(backgrounds.stock());
            activity.setContentView(scrim);
            OverlayFilterPatch.trackPlayerScrim(scrim);
            assertSame(backgrounds.stock(), scrim.getBackground());

            Settings.HIDE_OVERLAY_FILTER.save(true);
            Settings.HIDE_DOUBLE_TAP_OVERLAY_FILTER.save(true);
            shadowOf(Looper.getMainLooper()).idle();
            assertSame(backgrounds.stock(), scrim.getBackground());

            Settings.HIDE_PLAYER_OVERLAY_FILTER.save(true);
            shadowOf(Looper.getMainLooper()).idle();
            assertNull(scrim.getBackground());
            assertEquals(View.VISIBLE, scrim.getVisibility());

            Settings.HIDE_PLAYER_OVERLAY_FILTER.save(false);
            shadowOf(Looper.getMainLooper()).idle();
            assertSame(backgrounds.stock(), scrim.getBackground());

            activity.setContentView(new View(activity));
            Settings.HIDE_PLAYER_OVERLAY_FILTER.save(true);
            shadowOf(Looper.getMainLooper()).idle();
            assertSame(backgrounds.stock(), scrim.getBackground());

            scrim.setBackground(backgrounds.changed());
            activity.setContentView(scrim);
            assertNull(scrim.getBackground());
            Settings.HIDE_PLAYER_OVERLAY_FILTER.save(false);
            shadowOf(Looper.getMainLooper()).idle();
            assertSame(backgrounds.changed(), scrim.getBackground());
        }
    }

    private static int menuScrimPixel() {
        Bitmap target = Bitmap.createBitmap(8, 8, Bitmap.Config.ARGB_8888);
        Paint paint = new Paint();
        paint.setColor(0x99000000);
        OverlayFilterPatch.drawMenuScrim(new Canvas(target), paint);
        assertEquals(0x99000000, paint.getColor());
        return target.getPixel(4, 4);
    }

    private record DrawablePair(ColorDrawable stock, ColorDrawable changed) {}
}
