/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-21.
 * Written by lavinhoque33, 2026-11-18.
 */

package app.morphe.extension.youtube.patches.general;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;
import static app.morphe.extension.youtube.settings.Settings.SnackBarBorderPreset.CHIP;
import static app.morphe.extension.youtube.settings.Settings.SnackBarBorderPreset.CUSTOM;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.PorterDuff;
import android.graphics.drawable.GradientDrawable;
import android.view.ContextThemeWrapper;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.utils.ThemeUtils;

@RunWith(RobolectricTestRunner.class)
// Export uses the process-wide settings registry. Give this YouTube suite its own app class loader.
@Config(manifest = Config.NONE, sdk = 28,
        instrumentedPackages = "app.morphe.extension.youtube.patches.general.SnackBarDrawableTest")
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
        Settings.SNACK_BAR_BORDER_PRESET.resetToDefault();
        Settings.SNACK_BAR_STROKE_COLOR.resetToDefault();
        Settings.SNACK_BAR_STROKE_WIDTH.resetToDefault();
        Settings.SNACK_BAR_PLAYLIST_RADIUS.resetToDefault();
        Settings.SNACK_BAR_PLAYLIST_BORDER.resetToDefault();
        Settings.INVERT_SNACK_BAR_THEME.resetToDefault();
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
    public void chipUsesEachResolvedThemeAndReappliesWhenTheThemeIsInverted() {
        exposeThemeTestAttribute();
        Resources.Theme darkTheme = theme(android.R.style.Theme_Material);
        Resources.Theme lightTheme = theme(android.R.style.Theme_Material_Light);
        int darkChip = themeColor(darkTheme);
        int lightChip = themeColor(lightTheme);
        assertNotEquals(darkChip, lightChip);

        SnackBarDrawable inDarkTheme = shape(new SnackBarDrawable(), 8, 0xFFF1F1F1);
        SnackBarDrawable inLightTheme = shape(new SnackBarDrawable(), 8, 0xFF0F0F0F);
        inDarkTheme.captureBase(resources, darkTheme);
        inLightTheme.captureBase(resources, lightTheme);

        Settings.SNACK_BAR_LIGHT_FILL.save("#F5D7A3");
        Settings.SNACK_BAR_DARK_FILL.save("#32195A");
        Settings.SNACK_BAR_STROKE_WIDTH.save(4f);
        Settings.SNACK_BAR_BORDER_PRESET.save(CHIP);
        assertEquals(darkChip, draw(inDarkTheme).getPixel(32, 1));
        assertEquals(lightChip, draw(inLightTheme).getPixel(32, 1));
        assertEquals(0xFFF5D7A3, draw(inDarkTheme).getPixel(32, 32));
        assertEquals(0xFF32195A, draw(inLightTheme).getPixel(32, 32));

        // Inversion supplies the opposite theme to the drawable, not a transformed color.
        inDarkTheme.applyTheme(lightTheme);
        inLightTheme.applyTheme(darkTheme);
        assertEquals(lightChip, draw(inDarkTheme).getPixel(32, 1));
        assertEquals(darkChip, draw(inLightTheme).getPixel(32, 1));
    }

    @Test
    public void chipAndCustomRoundTripSeparatelyAndZeroWidthHidesEither() {
        exposeThemeTestAttribute();
        Resources.Theme theme = theme(android.R.style.Theme_Material);
        SnackBarDrawable drawable = shape(new SnackBarDrawable(), 8, 0xFFF1F1F1);
        drawable.captureBase(resources, theme);
        Settings.SNACK_BAR_LIGHT_FILL.save("#00000000");
        Settings.SNACK_BAR_STROKE_COLOR.save("#8000FF00");
        Settings.SNACK_BAR_STROKE_WIDTH.save(4f);

        assertEquals(CUSTOM, Settings.SNACK_BAR_BORDER_PRESET.get());
        assertEquals(0x8000FF00, draw(drawable).getPixel(32, 1));

        Settings.SNACK_BAR_BORDER_PRESET.save(CHIP);
        assertFalse(Settings.SNACK_BAR_STROKE_COLOR.isAvailable());
        assertEquals(themeColor(theme), draw(drawable).getPixel(32, 1));
        Context app = RuntimeEnvironment.getApplication();
        String exported = Setting.exportToJson(app);

        Settings.SNACK_BAR_BORDER_PRESET.resetToDefault();
        assertTrue(Settings.SNACK_BAR_STROKE_COLOR.isAvailable());
        assertEquals(0x8000FF00, draw(drawable).getPixel(32, 1));
        Settings.SNACK_BAR_STROKE_COLOR.resetToDefault();

        assertFalse(Setting.importFromJSON(app, exported));
        assertEquals(CHIP, Settings.SNACK_BAR_BORDER_PRESET.get());
        assertEquals("#8000FF00", Settings.SNACK_BAR_STROKE_COLOR.get());
        assertEquals(themeColor(theme), draw(drawable).getPixel(32, 1));

        Settings.SNACK_BAR_STROKE_WIDTH.resetToDefault();
        assertEquals(Color.TRANSPARENT, draw(drawable).getPixel(32, 1));
        Settings.SNACK_BAR_BORDER_PRESET.resetToDefault();
        assertEquals(Color.TRANSPARENT, draw(drawable).getPixel(32, 1));
    }

    @Test
    public void playlistBorderAndRadiusAreIndependentAndRestoreStockPixels() {
        SnackBarDrawable playlist = shape(new SnackBarDrawable.Playlist(), 16, Color.RED);
        SnackBarDrawable picker = shape(new SnackBarDrawable.RadiusOnly(), 8, Color.BLUE);
        Bitmap stock = draw(playlist);
        float stockOutlineRadius = outlineRadius(playlist);
        Settings.SNACK_BAR_CORNER_RADIUS.save(24.5f);
        Settings.SNACK_BAR_DARK_FILL.save("#00FF00");
        Settings.SNACK_BAR_STROKE_COLOR.save("#00FF00");
        Settings.SNACK_BAR_STROKE_WIDTH.save(4f);
        assertEquals(Color.RED, draw(playlist).getPixel(32, 1));
        assertEquals(16f * density, playlist.getCornerRadius(), 0f);
        assertEquals(Color.BLUE, draw(picker).getPixel(32, 1));
        assertEquals(24.5f * density, picker.getCornerRadius(), 0f);

        Settings.SNACK_BAR_PLAYLIST_RADIUS.save(true);
        assertEquals(Color.RED, draw(playlist).getPixel(32, 1));
        assertEquals(24.5f * density, playlist.getCornerRadius(), 0f);

        Settings.SNACK_BAR_PLAYLIST_BORDER.save(true);
        assertEquals(Color.GREEN, draw(playlist).getPixel(32, 1));
        assertEquals(24.5f * density, playlist.getCornerRadius(), 0f);
        assertEquals(Color.BLUE, draw(picker).getPixel(32, 1));

        Settings.SNACK_BAR_PLAYLIST_RADIUS.save(false);
        Bitmap borderOnly = draw(playlist);
        int strokeWidth = Math.round(4f * density);
        assertEquals(Color.GREEN, borderOnly.getPixel(32, strokeWidth - 1));
        assertEquals(Color.RED, borderOnly.getPixel(32, strokeWidth));
        assertEquals(Color.RED, borderOnly.getPixel(32, 32));
        assertEquals(stockOutlineRadius, outlineRadius(playlist), 0f);

        Settings.SNACK_BAR_STROKE_COLOR.save("#8000FF00");
        assertEquals(composite(0x8000FF00, Color.RED), draw(playlist).getPixel(32, 1));

        Settings.SNACK_BAR_STROKE_WIDTH.resetToDefault();
        assertTrue(stock.sameAs(draw(playlist)));
        Settings.SNACK_BAR_STROKE_WIDTH.save(4f);
        Settings.SNACK_BAR_STROKE_COLOR.save("#0000FF00");
        assertTrue(stock.sameAs(draw(playlist)));
        Settings.SNACK_BAR_STROKE_COLOR.save("#00FF00");
        Settings.SNACK_BAR_PLAYLIST_BORDER.save(false);
        assertTrue(stock.sameAs(draw(playlist)));
    }

    @Test
    public void playlistChipFollowsItsOwnThemeAndPreservesTheStatefulFill() {
        exposeThemeTestAttribute();
        Resources.Theme darkTheme = theme(android.R.style.Theme_Material);
        Resources.Theme lightTheme = theme(android.R.style.Theme_Material_Light);
        SnackBarDrawable playlist = shape(new SnackBarDrawable.Playlist(), 8, Color.RED);
        int[] focused = { android.R.attr.state_focused };
        playlist.setColor(new ColorStateList(new int[][]{ focused, {} }, new int[]{ Color.BLUE, Color.RED }));
        playlist.captureBase(resources, darkTheme);

        Settings.SNACK_BAR_PLAYLIST_BORDER.save(true);
        Settings.SNACK_BAR_BORDER_PRESET.save(CHIP);
        Settings.SNACK_BAR_STROKE_WIDTH.save(4f);
        Bitmap dark = draw(playlist);
        assertEquals(composite(themeColor(darkTheme), Color.RED), dark.getPixel(32, 1));
        assertEquals(Color.RED, dark.getPixel(32, 32));

        playlist.applyTheme(lightTheme);
        playlist.setState(focused);
        Bitmap focusedLight = draw(playlist);
        assertEquals(composite(themeColor(lightTheme), Color.BLUE), focusedLight.getPixel(32, 1));
        assertEquals(Color.BLUE, focusedLight.getPixel(32, 32));
    }

    @Test
    public void playlistChipMatchesSnackBarInLightAndDarkWithoutInversion() {
        assertPlaylistChipMatrix(false);
    }

    @Test
    @Config(instrumentedPackages = "snackbar.fixture.inverted")
    public void invertedChipContrastsWithNativePlaylistFillInLightAndDark() {
        // Invert snack bar theme is restart-bound. Give its enabled value a separate sandbox.
        assertPlaylistChipMatrix(true);
    }

    private void assertPlaylistChipMatrix(boolean invert) {
        exposeThemeTestAttribute();
        Settings.INVERT_SNACK_BAR_THEME.save(invert);
        Settings.SNACK_BAR_BORDER_PRESET.save(CHIP);
        Settings.SNACK_BAR_STROKE_WIDTH.save(1f);
        Settings.SNACK_BAR_CORNER_RADIUS.save(15f);
        Settings.SNACK_BAR_PLAYLIST_RADIUS.save(true);

        for (boolean dark : new boolean[]{ true, false }) {
            ThemeUtils.updateLightDarkModeStatus(dark ? 2 : 1);
            int style = dark ? android.R.style.Theme_Material : android.R.style.Theme_Material_Light;
            int effectiveStyle = dark != invert ? android.R.style.Theme_Material : android.R.style.Theme_Material_Light;
            int expectedChip = themeColor(theme(effectiveStyle));
            Context appearance = new ContextThemeWrapper(RuntimeEnvironment.getApplication(), style);
            Context effective = SnackBarPatch.invertSnackBarTheme(appearance);
            assertEquals(invert, effective != appearance);
            int snackbarFill = dark != invert ? 0xFFF1F1F1 : 0xFF0F0F0F;
            SnackBarDrawable snackbar = shape(new SnackBarDrawable(), 8, snackbarFill);
            snackbar.captureBase(resources, effective.getTheme());
            // GradientDrawable antialiases a 1 dp stroke against the canvas at the outer edge.
            GradientDrawable reference = new GradientDrawable();
            reference.setColor(snackbarFill);
            reference.setCornerRadius(15f * density);
            reference.setStroke(snackbar.strokeWidthPx(), expectedChip);
            reference.setBounds(snackbar.getBounds());
            assertEquals(draw(reference).getPixel(32, 0), draw(snackbar).getPixel(32, 0));

            assertPlaylistChipPixels(new SnackBarDrawable.Playlist(), 8, appearance.getTheme(), dark, expectedChip);
            assertPlaylistChipPixels(new SnackBarDrawable.RoundedPlaylist(), 32, appearance.getTheme(), dark,
                    expectedChip);
        }
    }

    private void assertPlaylistChipPixels(SnackBarDrawable.Playlist playlist, int stockRadius,
                                          Resources.Theme nativeTheme, boolean dark, int expectedChip) {
        int nativeFill = dark ? 0xFF0F0F0F : 0xFFFFFFFF;
        shape(playlist, stockRadius, nativeFill);
        // Give the rounded pill a straight top segment; a square would sample the antialiased arc.
        playlist.setBounds(0, 0, 64, 48);
        playlist.captureBase(resources, nativeTheme);
        // YouTube's playlist binder can replace the visible fill with a nearly opaque palette color.
        playlist.setColorFilter(dark ? 0xF21B0C0C : 0xF2F4F0ED, PorterDuff.Mode.SRC_IN);
        Settings.SNACK_BAR_PLAYLIST_BORDER.save(false);
        Bitmap stock = draw(playlist, nativeFill);
        int surface = stock.getPixel(32, 32);
        assertNotEquals(nativeFill, surface);

        Settings.SNACK_BAR_PLAYLIST_BORDER.save(true);
        Bitmap outlined = draw(playlist, nativeFill);
        int lastStrokePixel = playlist.strokeWidthPx() - 1;
        assertEquals(composite(expectedChip, stock.getPixel(32, lastStrokePixel)),
                outlined.getPixel(32, lastStrokePixel));
        assertEquals(stock.getPixel(32, lastStrokePixel + 1), outlined.getPixel(32, lastStrokePixel + 1));
        assertEquals(surface, outlined.getPixel(32, 32));
        assertEquals(nativeFill, playlist.getColor().getDefaultColor());
        assertEquals((stockRadius == 8 ? 15f : stockRadius) * density, playlist.getCornerRadius(), 0f);
    }

    @Test
    public void roundedPlaylistGetsBorderWithoutChangingItsPillRadius() {
        SnackBarDrawable pill = shape(new SnackBarDrawable.RoundedPlaylist(), 32, Color.RED);
        Bitmap stock = draw(pill);
        float stockOutlineRadius = outlineRadius(pill);
        Settings.SNACK_BAR_CORNER_RADIUS.save(0f);
        Settings.SNACK_BAR_PLAYLIST_RADIUS.save(true);
        Settings.SNACK_BAR_STROKE_COLOR.save("#00FF00");
        Settings.SNACK_BAR_STROKE_WIDTH.save(4f);
        assertTrue(stock.sameAs(draw(pill)));

        Settings.SNACK_BAR_PLAYLIST_BORDER.save(true);
        Bitmap outlined = draw(pill);
        assertEquals(Color.GREEN, outlined.getPixel(32, 1));
        assertEquals(Color.RED, outlined.getPixel(32, 32));
        assertEquals(Color.TRANSPARENT, outlined.getPixel(0, 0));
        assertEquals(stockOutlineRadius, outlineRadius(pill), 0f);
    }

    private static int composite(int foreground, int background) {
        Bitmap target = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(target);
        canvas.drawColor(background);
        canvas.drawColor(foreground);
        return target.getPixel(0, 0);
    }

    private static float outlineRadius(SnackBarDrawable drawable) {
        Outline outline = new Outline();
        drawable.getOutline(outline);
        return outline.getRadius();
    }

    private static final int TEST_CHIP_ATTRIBUTE = android.R.attr.colorBackground;

    @SuppressWarnings("deprecation")
    private void exposeThemeTestAttribute() {
        // The Chip background is dark in the dark app theme and light in the light app theme.
        Resources indexed = new Resources(resources.getAssets(), resources.getDisplayMetrics(),
                resources.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String defType, String defPackage) {
                if ("ytChipBackground".equals(name) && "attr".equals(defType)) return TEST_CHIP_ATTRIBUTE;
                if ("style".equals(defType)) {
                    if ("Base.Theme.YouTube.Dark".equals(name)) return android.R.style.Theme_Material;
                    if ("Base.Theme.YouTube.Light".equals(name)) return android.R.style.Theme_Material_Light;
                }

                return super.getIdentifier(name, defType, defPackage);
            }
        };
        Utils.setContext(new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override
            public Resources getResources() {
                return indexed;
            }
        });
    }

    private Resources.Theme theme(int style) {
        Resources.Theme theme = resources.newTheme();
        theme.applyStyle(style, true);
        return theme;
    }

    private static int themeColor(Resources.Theme theme) {
        TypedArray values = theme.obtainStyledAttributes(new int[]{ TEST_CHIP_ATTRIBUTE });
        try {
            return values.getColor(0, Color.TRANSPARENT);
        } finally {
            values.recycle();
        }
    }

    private SnackBarDrawable shape(SnackBarDrawable drawable, int radiusDp, int color) {
        drawable.setColor(color);
        drawable.setCornerRadius(radiusDp * density);
        drawable.setBounds(0, 0, 64, 64);
        drawable.captureBase(resources, null);
        return drawable;
    }

    private static Bitmap draw(GradientDrawable drawable) {
        return draw(drawable, Color.TRANSPARENT);
    }

    private static Bitmap draw(GradientDrawable drawable, int background) {
        Bitmap target = Bitmap.createBitmap(64, 64, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(target);
        canvas.drawColor(background);
        drawable.draw(canvas);
        return target;
    }
}
