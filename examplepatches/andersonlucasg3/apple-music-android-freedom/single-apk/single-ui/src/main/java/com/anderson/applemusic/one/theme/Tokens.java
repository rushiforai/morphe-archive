package com.anderson.applemusic.one.theme;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.util.DisplayMetrics;

/**
 * Design tokens of the single-APK UI, mirroring the Compose companions
 * ({@code tv-app/TvTheme.kt} and {@code car-app/Theme.kt}): black canvas, dark
 * surfaces, grey secondary type, a single red accent, 14-16 dp radii and the
 * Inter type scale.
 *
 * <p>There are no resources in this module, so the tokens are Java constants
 * scaled by the current display density. {@link #init(Context)} runs once from
 * {@code OneActivity.onCreate}.
 */
public final class Tokens {

    // Colour: Apple Music dark identity. PlayerColor is the near-black canvas the
    // companions use for the full-screen player; Background is pure black elsewhere.
    public static final int BG = 0xFF000000;
    public static final int BG_PLAYER = 0xFF0A0A0B;
    public static final int SURFACE = 0xFF1C1C1E;
    public static final int SURFACE_HOVER = 0xFF2C2C2E;
    public static final int SURFACE_ACTIVE = 0xFF313134;
    public static final int TRACK = 0xFF3A3A3C;
    public static final int TEXT = 0xFFFFFFFF;
    public static final int TEXT_DIM = 0xFF8E8E93;
    public static final int ACCENT = 0xFFFA243C;
    public static final int ACCENT_DIM = 0x33FA243C;
    public static final int SCRIM = 0xB3000000;

    // Radii: cards 16, controls 14, sheets 20, small covers 8.
    public static final float RADIUS_CARD = 16f;
    public static final float RADIUS_CONTROL = 14f;
    public static final float RADIUS_SHEET = 20f;
    public static final float RADIUS_COVER = 8f;
    public static final float RADIUS_PILL = 200f;

    // Type scale in sp: display 34-36, section 24-26, card 15-16, caption 12-13.
    // Weights are limited to Inter 400 / 500 / 600 / 700.
    public static final float DISPLAY = 34f;
    public static final float SECTION = 24f;
    public static final float CARD = 15f;
    public static final float CAPTION = 12f;
    public static final float BODY = 15f;

    // Focus feedback: 1.05 scale over 160 ms, no continuous animation.
    public static final long FOCUS_MS = 160L;
    public static final float FOCUS_SCALE = 1.05f;

    private static float density = 2f;
    private static float widthDp = 360f;
    private static boolean touch = true;

    private Tokens() {
    }

    public static void init(Context context) {
        Resources resources = context.getResources();
        DisplayMetrics metrics = resources.getDisplayMetrics();
        if (metrics.density > 0f) density = metrics.density;
        if (metrics.widthPixels > 0) widthDp = metrics.widthPixels / density;
        PackageManager packageManager = context.getPackageManager();
        boolean television = packageManager.hasSystemFeature(PackageManager.FEATURE_LEANBACK)
                || packageManager.hasSystemFeature("android.hardware.type.television")
                || (resources.getConfiguration().uiMode & Configuration.UI_MODE_TYPE_MASK)
                == Configuration.UI_MODE_TYPE_TELEVISION;
        // TV emulators advertise a touchscreen; the D-pad path must win on television.
        touch = packageManager.hasSystemFeature(PackageManager.FEATURE_TOUCHSCREEN) && !television;
    }

    public static int dp(float value) {
        return Math.round(value * density);
    }

    public static int screenWidth() {
        return Math.round(widthDp * density);
    }

    public static float screenWidthDp() {
        return widthDp;
    }

    /** True on phones/head units: no D-pad hover, only press feedback. */
    public static boolean touch() {
        return touch;
    }

    /** True on a TV-sized window: one-row top bar and side-by-side player. */
    public static boolean wide() {
        return widthDp >= 720f;
    }
}
