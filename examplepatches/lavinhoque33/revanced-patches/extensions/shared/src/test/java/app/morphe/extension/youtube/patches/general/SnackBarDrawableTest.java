/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-18.
 */

package app.morphe.extension.youtube.patches.general;

import static org.junit.Assert.assertEquals;

import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SnackBarDrawableTest {
    private Resources resources;
    private float density;

    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = app.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = app.getApplicationInfo();
        Shadows.shadowOf(app.getPackageManager()).installPackage(packageInfo);
        Utils.setContext(app);

        resources = app.getResources();
        density = resources.getDisplayMetrics().density;
        Settings.SNACK_BAR_CORNER_RADIUS.resetToDefault();
        Settings.SNACK_BAR_LIGHT_FILL.resetToDefault();
        Settings.SNACK_BAR_DARK_FILL.resetToDefault();
        Settings.SNACK_BAR_STROKE_COLOR.resetToDefault();
        Settings.SNACK_BAR_STROKE_WIDTH.resetToDefault();
        Settings.SNACK_BAR_PLAYLIST_RADIUS.resetToDefault();
    }

    @Test
    public void keepsResolvedDefaultsAndChangesEachColorWithoutLeaking() {
        SnackBarDrawable light = shape(new SnackBarDrawable(), 8, 0xFFF1F1F1);
        SnackBarDrawable dark = shape(new SnackBarDrawable(), 8, 0xFF0F0F0F);
        assertEquals(0xFFF1F1F1, draw(light).getPixel(32, 32));
        assertEquals(0xFF0F0F0F, draw(dark).getPixel(32, 32));

        Settings.SNACK_BAR_LIGHT_FILL.save("#801255AB");
        Settings.SNACK_BAR_DARK_FILL.save("#CD0051");
        draw(light);
        assertEquals(0x801255AB, light.getColor().getDefaultColor());
        assertEquals(0xFFCD0051, draw(dark).getPixel(32, 32));
        assertEquals(0x801255AB, light.getColor().getDefaultColor());

        Settings.SNACK_BAR_LIGHT_FILL.save("not a color");
        assertEquals(0xFFF1F1F1, draw(light).getPixel(32, 32));
        Settings.SNACK_BAR_DARK_FILL.resetToDefault();
        assertEquals(0xFF0F0F0F, draw(dark).getPixel(32, 32));
        assertEquals(0xFF121212, SnackBarDrawable.resolveFill(false, 0xFF121212));
    }

    @Test
    public void rendersDifferentRadiusAndStrokeAndRestoresNoStroke() {
        SnackBarDrawable shape = shape(new SnackBarDrawable(), 8, 0xFFF1F1F1);
        assertEquals(0xFFF1F1F1, draw(shape).getPixel(32, 1));
        Settings.SNACK_BAR_CORNER_RADIUS.save(0f);
        Settings.SNACK_BAR_STROKE_COLOR.save("#00FF00");
        Settings.SNACK_BAR_STROKE_WIDTH.save(4f);
        Bitmap outlined = draw(shape);
        assertEquals(0f, shape.getCornerRadius(), 0f);
        assertEquals(Color.GREEN, outlined.getPixel(32, 1));
        assertEquals(0xFFF1F1F1, outlined.getPixel(32, 32));

        Settings.SNACK_BAR_CORNER_RADIUS.save(Float.NaN);
        Settings.SNACK_BAR_STROKE_WIDTH.save(-1f);
        Bitmap restored = draw(shape);
        assertEquals(8f * density, shape.getCornerRadius(), 0f);
        assertEquals(0xFFF1F1F1, restored.getPixel(32, 1));
    }

    @Test
    public void playlistReusesOnlyRadiusAndRestoresItsOwnRadius() {
        SnackBarDrawable playlist = shape(new SnackBarDrawable.Playlist(), 16, Color.RED);
        SnackBarDrawable picker = shape(new SnackBarDrawable.RadiusOnly(), 8, Color.BLUE);
        Settings.SNACK_BAR_CORNER_RADIUS.save(24.5f);
        Settings.SNACK_BAR_DARK_FILL.save("#00FF00");
        Settings.SNACK_BAR_STROKE_WIDTH.save(4f);
        assertEquals(Color.RED, draw(playlist).getPixel(32, 1));
        assertEquals(16f * density, playlist.getCornerRadius(), 0f);
        assertEquals(Color.BLUE, draw(picker).getPixel(32, 1));
        assertEquals(24.5f * density, picker.getCornerRadius(), 0f);

        Settings.SNACK_BAR_PLAYLIST_RADIUS.save(true);
        assertEquals(Color.RED, draw(playlist).getPixel(32, 1));
        assertEquals(24.5f * density, playlist.getCornerRadius(), 0f);
        Settings.SNACK_BAR_PLAYLIST_RADIUS.save(false);
        draw(playlist);
        assertEquals(16f * density, playlist.getCornerRadius(), 0f);
    }

    private SnackBarDrawable shape(SnackBarDrawable drawable, int radiusDp, int color) {
        drawable.setColor(color);
        drawable.setCornerRadius(radiusDp * density);
        drawable.setBounds(0, 0, 64, 64);
        drawable.captureBase(resources, null);
        return drawable;
    }

    private static Bitmap draw(SnackBarDrawable drawable) {
        Bitmap target = Bitmap.createBitmap(64, 64, Bitmap.Config.ARGB_8888);
        drawable.draw(new Canvas(target));
        return target;
    }
}
