package dev.materialtidal.extension.tidal.theme;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.graphics.drawable.VectorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsetsController;
import android.view.animation.Animation;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toolbar;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * App-wide Material You (Monet) dynamic color & Material 3 Expressive tonal engine
 * for TIDAL (minSdk 32+).
 *
 * <p>Resolves the user's wallpaper-extracted {@code android.R.color.system_*} palette
 * from the active {@link Activity} or {@link Application} {@link Resources} first (falling
 * back to {@link Resources#getSystem()} when called before an {@code Activity} exists,
 * such as inside static {@code <clinit>} initializers).
 */
@SuppressWarnings("unused")
public final class MaterialYouColorEngine {

    // ---- System Monet Palette Indices ----
    private static final int IDX_ACCENT1_50 = 0;
    private static final int IDX_ACCENT1_100 = 1;
    private static final int IDX_ACCENT1_200 = 2;
    private static final int IDX_ACCENT1_300 = 3;
    private static final int IDX_ACCENT1_400 = 4;
    private static final int IDX_ACCENT1_500 = 5;
    private static final int IDX_ACCENT1_600 = 6;
    private static final int IDX_ACCENT1_700 = 7;
    private static final int IDX_ACCENT1_800 = 8;
    private static final int IDX_ACCENT1_900 = 9;

    private static final int IDX_ACCENT2_50 = 10;
    private static final int IDX_ACCENT2_100 = 11;
    private static final int IDX_ACCENT2_200 = 12;
    private static final int IDX_ACCENT2_300 = 13;
    private static final int IDX_ACCENT2_500 = 14;
    private static final int IDX_ACCENT2_600 = 15;
    private static final int IDX_ACCENT2_700 = 16;
    private static final int IDX_ACCENT2_800 = 17;
    private static final int IDX_ACCENT2_900 = 18;

    private static final int IDX_ACCENT3_100 = 19;
    private static final int IDX_ACCENT3_200 = 20;
    private static final int IDX_ACCENT3_300 = 21;
    private static final int IDX_ACCENT3_700 = 22;
    private static final int IDX_ACCENT3_800 = 23;

    private static final int IDX_NEUTRAL1_50 = 24;
    private static final int IDX_NEUTRAL1_100 = 25;
    private static final int IDX_NEUTRAL1_600 = 26;
    private static final int IDX_NEUTRAL1_700 = 27;
    private static final int IDX_NEUTRAL1_800 = 28;
    private static final int IDX_NEUTRAL1_900 = 29;

    private static final int IDX_NEUTRAL2_100 = 30;
    private static final int IDX_NEUTRAL2_200 = 31;
    private static final int IDX_NEUTRAL2_400 = 32;
    private static final int IDX_NEUTRAL2_500 = 33;
    private static final int IDX_NEUTRAL2_600 = 34;
    private static final int IDX_NEUTRAL2_700 = 35;
    private static final int IDX_NEUTRAL2_800 = 36;
    private static final int IDX_NEUTRAL2_900 = 37;

    private static final int IDX_ACCENT3_50 = 38;
    private static final int IDX_ACCENT3_600 = 39;
    private static final int IDX_ACCENT3_900 = 40;
    private static final int IDX_NEUTRAL1_0 = 41;
    private static final int IDX_NEUTRAL1_10 = 42;
    private static final int IDX_NEUTRAL1_200 = 43;
    private static final int IDX_NEUTRAL1_300 = 44;
    private static final int IDX_NEUTRAL2_50 = 45;
    private static final int IDX_NEUTRAL2_300 = 46;

    private static final int PALETTE_SIZE = 47;

    /** Tag marking views explicitly styled by MaterialTidal controllers (skip generic XML tinting). */
    public static final int TAG_EXPRESSIVE_STYLED = 0x7A4D5410;

    private static final int LIGHT_AMBER_ACCENT = 0xFF9A6700;
    private static final int LIGHT_AMBER_CONTAINER = 0xFFFFF0C7;
    private static final int LIGHT_ERROR = 0xFFBA1A1A;
    private static final int LIGHT_ERROR_DARK = 0xFF93000A;
    private static final int LIGHT_ERROR_CONTAINER = 0xFFFFDAD6;
    private static final int LIGHT_ON_ERROR_CONTAINER = 0xFF410002;
    private static final int LIGHT_SAFE_WHITE = 0xFFFEFFFE;

    private static final int[] SYSTEM_COLOR_IDS = new int[PALETTE_SIZE];
    private static final int[] FALLBACK_COLORS = new int[PALETTE_SIZE];

    private static final String LOG_TAG = "MaterialTidalTheme";
    private static final int SOURCE_NONE = 0;
    private static final int SOURCE_FALLBACK = 1;
    private static final int SOURCE_SYSTEM = 2;
    private static final int SOURCE_APP = 3;
    private static final int SOURCE_ACTIVITY = 4;

    private static final WeakHashMap<View, Long> TRACKED_DECORS = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> PENDING_RETINT = new WeakHashMap<>();
    private static final WeakHashMap<View, Long> FRAGMENT_COMPOSE_FIRST_SEEN_MS = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> COMPOSE_HOST_CLASSIFICATION = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> FRAGMENT_COMPOSE_PENDING_INVAL = new WeakHashMap<>();
    private static final WeakHashMap<View, Long> FRAGMENT_COMPOSE_LAST_CONTENT_INVAL_MS = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> FRAGMENT_COMPOSE_AUTO_CONTENT_TRIGGERED = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> KNOWN_FRAGMENT_COMPOSE_HOSTS = new WeakHashMap<>();
    private static final WeakHashMap<Drawable.ConstantState, Integer> VECTOR_CLASS_CACHE = new WeakHashMap<>();
    private static final int[] BG_DRAW_DIAG_SEEN = new int[8];
    private static volatile boolean lifecycleRegistered;
    private static volatile WeakReference<Activity> currentActivityRef;
    private static volatile WeakReference<View> activeFragmentComposeViewRef;
    private static volatile WeakReference<Object> activeWave2ColorsRef;
    private static volatile Context appContext;
    private static volatile int lastPaletteSource = SOURCE_NONE;
    private static volatile int lastLoggedSurfaceBase;
    private static volatile int lastLoggedSource = SOURCE_NONE;
    private static volatile boolean lastLoggedLightMode;
    private static volatile long lastRemapLogUptimeMs;
    private static volatile int bgDrawDiagBudget = 8;
    private static volatile int bgDrawDiagCount = 0;
    private static volatile int cachedContainerId;
    private static volatile int cachedFragmentContainerId;
    private static volatile int cachedAppScaffoldId;
    private static volatile String cachedIdsPackage;
    private static volatile Class<?> cachedIconTextBtnClass;
    private static volatile Method cachedGetUseLightThemeMethod;
    private static volatile boolean iconTextBtnReflectionResolved;

    static {
        SYSTEM_COLOR_IDS[IDX_ACCENT1_50] = android.R.color.system_accent1_50;
        SYSTEM_COLOR_IDS[IDX_ACCENT1_100] = android.R.color.system_accent1_100;
        SYSTEM_COLOR_IDS[IDX_ACCENT1_200] = android.R.color.system_accent1_200;
        SYSTEM_COLOR_IDS[IDX_ACCENT1_300] = android.R.color.system_accent1_300;
        SYSTEM_COLOR_IDS[IDX_ACCENT1_400] = android.R.color.system_accent1_400;
        SYSTEM_COLOR_IDS[IDX_ACCENT1_500] = android.R.color.system_accent1_500;
        SYSTEM_COLOR_IDS[IDX_ACCENT1_600] = android.R.color.system_accent1_600;
        SYSTEM_COLOR_IDS[IDX_ACCENT1_700] = android.R.color.system_accent1_700;
        SYSTEM_COLOR_IDS[IDX_ACCENT1_800] = android.R.color.system_accent1_800;
        SYSTEM_COLOR_IDS[IDX_ACCENT1_900] = android.R.color.system_accent1_900;

        SYSTEM_COLOR_IDS[IDX_ACCENT2_50] = android.R.color.system_accent2_50;
        SYSTEM_COLOR_IDS[IDX_ACCENT2_100] = android.R.color.system_accent2_100;
        SYSTEM_COLOR_IDS[IDX_ACCENT2_200] = android.R.color.system_accent2_200;
        SYSTEM_COLOR_IDS[IDX_ACCENT2_300] = android.R.color.system_accent2_300;
        SYSTEM_COLOR_IDS[IDX_ACCENT2_500] = android.R.color.system_accent2_500;
        SYSTEM_COLOR_IDS[IDX_ACCENT2_600] = android.R.color.system_accent2_600;
        SYSTEM_COLOR_IDS[IDX_ACCENT2_700] = android.R.color.system_accent2_700;
        SYSTEM_COLOR_IDS[IDX_ACCENT2_800] = android.R.color.system_accent2_800;
        SYSTEM_COLOR_IDS[IDX_ACCENT2_900] = android.R.color.system_accent2_900;

        SYSTEM_COLOR_IDS[IDX_ACCENT3_100] = android.R.color.system_accent3_100;
        SYSTEM_COLOR_IDS[IDX_ACCENT3_200] = android.R.color.system_accent3_200;
        SYSTEM_COLOR_IDS[IDX_ACCENT3_300] = android.R.color.system_accent3_300;
        SYSTEM_COLOR_IDS[IDX_ACCENT3_700] = android.R.color.system_accent3_700;
        SYSTEM_COLOR_IDS[IDX_ACCENT3_800] = android.R.color.system_accent3_800;

        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_50] = android.R.color.system_neutral1_50;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_100] = android.R.color.system_neutral1_100;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_600] = android.R.color.system_neutral1_600;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_700] = android.R.color.system_neutral1_700;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_800] = android.R.color.system_neutral1_800;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_900] = android.R.color.system_neutral1_900;

        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_100] = android.R.color.system_neutral2_100;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_200] = android.R.color.system_neutral2_200;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_400] = android.R.color.system_neutral2_400;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_500] = android.R.color.system_neutral2_500;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_600] = android.R.color.system_neutral2_600;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_700] = android.R.color.system_neutral2_700;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_800] = android.R.color.system_neutral2_800;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_900] = android.R.color.system_neutral2_900;

        SYSTEM_COLOR_IDS[IDX_ACCENT3_50] = android.R.color.system_accent3_50;
        SYSTEM_COLOR_IDS[IDX_ACCENT3_600] = android.R.color.system_accent3_600;
        SYSTEM_COLOR_IDS[IDX_ACCENT3_900] = android.R.color.system_accent3_900;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_0] = android.R.color.system_neutral1_0;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_10] = android.R.color.system_neutral1_10;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_200] = android.R.color.system_neutral1_200;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL1_300] = android.R.color.system_neutral1_300;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_50] = android.R.color.system_neutral2_50;
        SYSTEM_COLOR_IDS[IDX_NEUTRAL2_300] = android.R.color.system_neutral2_300;

        // Clean emerald-tonal fallbacks matching the Material 3 Expressive reference aesthetic
        FALLBACK_COLORS[IDX_ACCENT1_50] = 0xFFEAFBF0;
        FALLBACK_COLORS[IDX_ACCENT1_100] = 0xFFD4F8E3;
        FALLBACK_COLORS[IDX_ACCENT1_200] = 0xFF9BE6BC;
        FALLBACK_COLORS[IDX_ACCENT1_300] = 0xFF6DD49D;
        FALLBACK_COLORS[IDX_ACCENT1_400] = 0xFF3CB879;
        FALLBACK_COLORS[IDX_ACCENT1_500] = 0xFF1F9A5E;
        FALLBACK_COLORS[IDX_ACCENT1_600] = 0xFF0A8350;
        FALLBACK_COLORS[IDX_ACCENT1_700] = 0xFF006D43;
        FALLBACK_COLORS[IDX_ACCENT1_800] = 0xFF005130;
        FALLBACK_COLORS[IDX_ACCENT1_900] = 0xFF003820;

        FALLBACK_COLORS[IDX_ACCENT2_50] = 0xFFEDF7EF;
        FALLBACK_COLORS[IDX_ACCENT2_100] = 0xFFD7EBDD;
        FALLBACK_COLORS[IDX_ACCENT2_200] = 0xFFB5D1BE;
        FALLBACK_COLORS[IDX_ACCENT2_300] = 0xFF95B59F;
        FALLBACK_COLORS[IDX_ACCENT2_500] = 0xFF5A7364;
        FALLBACK_COLORS[IDX_ACCENT2_600] = 0xFF42594B;
        FALLBACK_COLORS[IDX_ACCENT2_700] = 0xFF304438;
        FALLBACK_COLORS[IDX_ACCENT2_800] = 0xFF1E2D24;
        FALLBACK_COLORS[IDX_ACCENT2_900] = 0xFF131D17;

        FALLBACK_COLORS[IDX_ACCENT3_100] = 0xFFCBEBF5;
        FALLBACK_COLORS[IDX_ACCENT3_200] = 0xFFA2CEDD;
        FALLBACK_COLORS[IDX_ACCENT3_300] = 0xFF83B1C1;
        FALLBACK_COLORS[IDX_ACCENT3_700] = 0xFF214E5C;
        FALLBACK_COLORS[IDX_ACCENT3_800] = 0xFF133844;

        FALLBACK_COLORS[IDX_NEUTRAL1_50] = 0xFFF5F7F5;
        FALLBACK_COLORS[IDX_NEUTRAL1_100] = 0xFFE8ECE9;
        FALLBACK_COLORS[IDX_NEUTRAL1_600] = 0xFF4F5552;
        FALLBACK_COLORS[IDX_NEUTRAL1_700] = 0xFF393E3B;
        FALLBACK_COLORS[IDX_NEUTRAL1_800] = 0xFF232825;
        FALLBACK_COLORS[IDX_NEUTRAL1_900] = 0xFF131614;

        FALLBACK_COLORS[IDX_NEUTRAL2_100] = 0xFFE2EAE4;
        FALLBACK_COLORS[IDX_NEUTRAL2_200] = 0xFFC5D0C8;
        FALLBACK_COLORS[IDX_NEUTRAL2_400] = 0xFF8C9790;
        FALLBACK_COLORS[IDX_NEUTRAL2_500] = 0xFF6F7A73;
        FALLBACK_COLORS[IDX_NEUTRAL2_600] = 0xFF56605A;
        FALLBACK_COLORS[IDX_NEUTRAL2_700] = 0xFF3D4741;
        FALLBACK_COLORS[IDX_NEUTRAL2_800] = 0xFF28302B;
        FALLBACK_COLORS[IDX_NEUTRAL2_900] = 0xFF171D19;

        FALLBACK_COLORS[IDX_ACCENT3_50] = 0xFFE5F6FB;
        FALLBACK_COLORS[IDX_ACCENT3_600] = 0xFF3E6375;
        FALLBACK_COLORS[IDX_ACCENT3_900] = 0xFF001E2C;
        FALLBACK_COLORS[IDX_NEUTRAL1_0] = 0xFFFFFFFF;
        FALLBACK_COLORS[IDX_NEUTRAL1_10] = 0xFFFAFDFB;
        FALLBACK_COLORS[IDX_NEUTRAL1_200] = 0xFFCBD4D0;
        FALLBACK_COLORS[IDX_NEUTRAL1_300] = 0xFFAFB8B4;
        FALLBACK_COLORS[IDX_NEUTRAL2_50] = 0xFFEFF4F2;
        FALLBACK_COLORS[IDX_NEUTRAL2_300] = 0xFFA8B4AF;
    }

    private static int luma(int argb) {
        return (Color.red(argb) * 30 + Color.green(argb) * 59 + Color.blue(argb) * 11) / 100;
    }

    /**
     * Resolves the effective Light/Dark theme state from configuration + current context.
     */
    public static boolean isLightMode() {
        if (!MaterialYouConfig.isSystemThemeModeEnabled()) {
            return false;
        }
        int mode = MaterialYouConfig.getThemeMode();
        if (mode == MaterialYouConfig.THEME_MODE_LIGHT) {
            return true;
        }
        if (mode == MaterialYouConfig.THEME_MODE_DARK) {
            return false;
        }
        Context ctx = resolvePreferredContext();
        return isContextSystemLight(ctx);
    }

    /**
     * Captures optional context and checks whether Light Mode is currently active.
     */
    public static boolean isLightMode(Context ctx) {
        if (ctx != null) {
            try {
                Context app = ctx.getApplicationContext();
                if (app != null && appContext == null) {
                    appContext = app;
                }
            } catch (Throwable ignored) {
            }
        }
        if (!MaterialYouConfig.isSystemThemeModeEnabled()) {
            return false;
        }
        int mode = MaterialYouConfig.getThemeMode();
        if (mode == MaterialYouConfig.THEME_MODE_LIGHT) {
            return true;
        }
        if (mode == MaterialYouConfig.THEME_MODE_DARK) {
            return false;
        }
        return isContextSystemLight(ctx != null ? ctx : resolvePreferredContext());
    }

    /**
     * Inverse helper for Square Market {@code Lsta;.a} / {@code Lsta;.b} hooks.
     */
    public static boolean isDarkMode(Context ctx) {
        return !isLightMode(ctx);
    }

    /**
     * Filters {@code DarkTheme_androidKt._isSystemInDarkTheme} according to the configured theme mode.
     */
    public static boolean resolveEffectiveDarkTheme(boolean systemIsDark) {
        if (!MaterialYouConfig.isSystemThemeModeEnabled()) {
            return systemIsDark;
        }
        int mode = MaterialYouConfig.getThemeMode();
        if (mode == MaterialYouConfig.THEME_MODE_LIGHT) {
            return false;
        }
        if (mode == MaterialYouConfig.THEME_MODE_DARK) {
            return true;
        }
        return systemIsDark;
    }

    /**
     * True only in Dark Mode when AMOLED pure black is enabled.
     */
    public static boolean isEffectiveAmoledBlack() {
        return !isLightMode() && MaterialYouConfig.isAmoledPureBlack();
    }

    private static Context resolvePreferredContext() {
        WeakReference<Activity> ref = currentActivityRef;
        Activity act = (ref != null) ? ref.get() : null;
        if (act != null && !act.isDestroyed()) {
            return act;
        }
        return appContext;
    }

    private static boolean isContextSystemLight(Context ctx) {
        try {
            Resources res = (ctx != null) ? ctx.getResources() : Resources.getSystem();
            if (res != null) {
                Configuration cfg = res.getConfiguration();
                if (cfg != null) {
                    return (cfg.uiMode & Configuration.UI_MODE_NIGHT_MASK) != Configuration.UI_MODE_NIGHT_YES;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Nudges a Light Monet surface/foreground slightly so it never collides with raw
     * {@code 0x000000}, {@code 0xFFFFFF}, or raw TIDAL dark-zinc literals used for remapping.
     */
    private static int sanitizeLightOutput(int argb, boolean isLightSurfaceOrWhite) {
        int rgb = argb & 0x00FFFFFF;
        if (isLightSurfaceOrWhite) {
            if (rgb == 0xFFFFFF) {
                return LIGHT_SAFE_WHITE;
            }
        } else {
            if (rgb == 0x000000) {
                return 0xFF161918;
            }
            if (rgb == 0x080808 || rgb == 0x0C0C0D || rgb == 0x101010 || rgb == 0x101012
                    || rgb == 0x121212 || rgb == 0x131314 || rgb == 0x141414 || rgb == 0x141416
                    || rgb == 0x17171A || rgb == 0x18181B || rgb == 0x1A1A1A || rgb == 0x1C1C1C
                    || rgb == 0x1D1D1F || rgb == 0x222226 || rgb == 0x232323 || rgb == 0x242429
                    || rgb == 0x252525 || rgb == 0x28282E || rgb == 0x2A2A2A || rgb == 0x2D2D2D
                    || rgb == 0x303036 || rgb == 0x333333 || rgb == 0x393940) {
                int b = argb & 0xFF;
                return (argb & 0xFFFFFF00) | ((b < 254) ? (b + 1) : (b - 1));
            }
        }
        return argb | 0xFF000000;
    }

    /**
     * Immutable snapshot of the current Monet palette + all derived expressive surface/accent RGBs
     * so color remapping is strictly idempotent in both Light and Dark Mode.
     */
    private static final class PaletteSnapshot {
        final int[] palette;
        final boolean isLightMode;
        final int surfaceBase;
        final int surfaceLow;
        final int surfaceContainer;
        final int surfaceContainerHigh;
        final int surfaceContainerHighest;

        final int primaryAccent;
        final int primaryContainer;
        final int onPrimary;
        final int onPrimaryContainer;
        final int secondaryContainer;
        final int onSecondaryContainer;
        final int tertiaryAccent;
        final int tertiaryContainer;
        final int onTertiary;
        final int onTertiaryContainer;
        final int onSurface;
        final int onSurfaceMid;
        final int onSurfaceVariant;
        final int outline;
        final int outlineVariant;
        final int error;
        final int errorContainer;
        final int onErrorContainer;

        final int darkAccentContainer;
        final int darkAccentDeepContainer;

        final int homeShortcutCardBg;
        final int homeVibeSelectedBg;
        final int homeVibeSelectedText;
        final int homeVibeUnselectedBg;
        final int homeVibeUnselectedText;
        final int homeTopBarBg;
        final int homeTopBarContent;

        final int navbarCapsule;
        final int navbarActivePill;
        final int navbarActiveContent;
        final int navbarInactiveContent;
        final int miniPlayerSurface;
        final int miniPlayerTitle;
        final int miniPlayerSubtitle;
        final int miniPlayerArtworkBg;

        final int[] outputRgbSet;
        final int[] lightOutputRgbSet;

        PaletteSnapshot(int[] palette, boolean lightMode) {
            this.palette = palette;
            this.isLightMode = lightMode;
            int monetStyle = MaterialYouConfig.getMonetPaletteStyle();
            boolean amoled = !lightMode && MaterialYouConfig.isAmoledPureBlack();
            int navStyle = MaterialYouConfig.getNavbarColorStyle();

            int n1_900Raw = palette[IDX_NEUTRAL1_900];
            int n1_800 = palette[IDX_NEUTRAL1_800];
            int n1_700 = palette[IDX_NEUTRAL1_700];
            int n1_300 = palette[IDX_NEUTRAL1_300];
            int n1_200 = palette[IDX_NEUTRAL1_200];
            int n1_100 = palette[IDX_NEUTRAL1_100];
            int n1_50 = palette[IDX_NEUTRAL1_50];
            int n1_10 = palette[IDX_NEUTRAL1_10];

            int n2_700 = palette[IDX_NEUTRAL2_700];
            int n2_600 = palette[IDX_NEUTRAL2_600];
            int n2_500 = palette[IDX_NEUTRAL2_500];
            int n2_400 = palette[IDX_NEUTRAL2_400];
            int n2_300 = palette[IDX_NEUTRAL2_300];
            int n2_200 = palette[IDX_NEUTRAL2_200];
            int n2_100 = palette[IDX_NEUTRAL2_100];
            int n2_50 = palette[IDX_NEUTRAL2_50];

            int a1_900 = palette[IDX_ACCENT1_900];
            int a1_800 = palette[IDX_ACCENT1_800];
            int a1_700 = palette[IDX_ACCENT1_700];
            int a1_600 = palette[IDX_ACCENT1_600];
            int a1_500 = palette[IDX_ACCENT1_500];
            int a1_400 = palette[IDX_ACCENT1_400];
            int a1_300 = palette[IDX_ACCENT1_300];
            int a1_200 = palette[IDX_ACCENT1_200];
            int a1_100 = palette[IDX_ACCENT1_100];
            int a1_50 = palette[IDX_ACCENT1_50];

            int a2_900Raw = palette[IDX_ACCENT2_900];
            int a2_800 = palette[IDX_ACCENT2_800];
            int a2_700 = palette[IDX_ACCENT2_700];
            int a2_600 = palette[IDX_ACCENT2_600];
            int a2_100 = palette[IDX_ACCENT2_100];
            int a2_50 = palette[IDX_ACCENT2_50];

            int a3_900 = palette[IDX_ACCENT3_900];
            int a3_800 = palette[IDX_ACCENT3_800];
            int a3_700 = palette[IDX_ACCENT3_700];
            int a3_600 = palette[IDX_ACCENT3_600];
            int a3_200 = palette[IDX_ACCENT3_200];
            int a3_100 = palette[IDX_ACCENT3_100];
            int a3_50 = palette[IDX_ACCENT3_50];

            if (lightMode) {
                float baseTint = monetStyle == MaterialYouConfig.MONET_STYLE_VIBRANT
                        ? 0.24f
                        : (monetStyle == MaterialYouConfig.MONET_STYLE_SUBTLE ? 0.06f : 0.14f);
                float lowTint = monetStyle == MaterialYouConfig.MONET_STYLE_VIBRANT
                        ? 0.26f
                        : (monetStyle == MaterialYouConfig.MONET_STYLE_SUBTLE ? 0.08f : 0.16f);
                float ctrTint = monetStyle == MaterialYouConfig.MONET_STYLE_VIBRANT
                        ? 0.36f
                        : (monetStyle == MaterialYouConfig.MONET_STYLE_SUBTLE ? 0.12f : 0.24f);
                float highTint = monetStyle == MaterialYouConfig.MONET_STYLE_VIBRANT
                        ? 0.42f
                        : (monetStyle == MaterialYouConfig.MONET_STYLE_SUBTLE ? 0.16f : 0.30f);
                float highestTint = monetStyle == MaterialYouConfig.MONET_STYLE_VIBRANT
                        ? 0.40f
                        : (monetStyle == MaterialYouConfig.MONET_STYLE_SUBTLE ? 0.16f : 0.28f);

                int safeN10 = luma(n1_10) < 238 ? 0xFFFAFDFB : n1_10;
                int safeN50 = luma(n1_50) < 228 ? 0xFFF1F5F3 : n1_50;
                int safeN100 = luma(n1_100) < 214 ? 0xFFE4ECE8 : n1_100;
                int safeN2_50 = luma(n2_50) < 226 ? blendRgb(safeN50, a2_50, 0.35f) : n2_50;

                int cBase = sanitizeLightOutput(blendRgb(safeN10, a1_50, baseTint), true);
                if (luma(cBase) < 242) {
                    cBase = sanitizeLightOutput(blendRgb(cBase, LIGHT_SAFE_WHITE, 0.45f), true);
                }
                int cLow = sanitizeLightOutput(blendRgb(safeN50, a1_50, lowTint), true);
                if (luma(cLow) > luma(cBase) - 4) {
                    cLow = sanitizeLightOutput(blendRgb(cBase, a2_100, 0.20f), true);
                }
                int cCtr = sanitizeLightOutput(blendRgb(safeN2_50, a2_100, ctrTint), true);
                if (luma(cCtr) > luma(cLow) - 4) {
                    cCtr = sanitizeLightOutput(blendRgb(cLow, a2_100, 0.25f), true);
                }
                int cHigh = sanitizeLightOutput(blendRgb(safeN100, a2_100, highTint), true);
                if (luma(cHigh) > luma(cCtr) - 4) {
                    cHigh = sanitizeLightOutput(blendRgb(cCtr, a2_100, 0.28f), true);
                }
                int cHighest = sanitizeLightOutput(blendRgb(safeN100, a1_100, highestTint), true);
                if (luma(cHighest) > luma(cHigh) - 3) {
                    cHighest = sanitizeLightOutput(blendRgb(cHigh, n2_200, 0.22f), true);
                }

                this.surfaceBase = cBase;
                this.surfaceLow = cLow;
                this.surfaceContainer = cCtr;
                this.surfaceContainerHigh = cHigh;
                this.surfaceContainerHighest = cHighest;

                int cPrimary = monetStyle == MaterialYouConfig.MONET_STYLE_VIBRANT
                        ? blendRgb(a1_600, a1_500, 0.25f)
                        : a1_600;
                if (luma(cPrimary) > 122) {
                    cPrimary = blendRgb(cPrimary, a1_700, 0.65f);
                }
                if (luma(cPrimary) > 125) {
                    cPrimary = blendRgb(cPrimary, a1_800, 0.50f);
                }
                this.primaryAccent = sanitizeLightOutput(cPrimary, false);
                this.onPrimary = LIGHT_SAFE_WHITE;

                int cPrimaryCtr = (luma(a1_100) < 185) ? blendRgb(a1_50, a1_100, 0.5f) : a1_100;
                int cOnPrimaryCtr = (luma(a1_900) < 16)
                        ? blendRgb(0xFF002019, a1_800, 0.35f)
                        : a1_900;
                this.primaryContainer = sanitizeLightOutput(cPrimaryCtr, true);
                this.onPrimaryContainer = sanitizeLightOutput(cOnPrimaryCtr, false);

                int cSecCtr = (luma(a2_100) < 185) ? blendRgb(a2_50, a2_100, 0.5f) : a2_100;
                int cOnSecCtr = (luma(a2_900Raw) < 16)
                        ? blendRgb(0xFF0E1D19, a2_800, 0.35f)
                        : a2_900Raw;
                this.secondaryContainer = sanitizeLightOutput(cSecCtr, true);
                this.onSecondaryContainer = sanitizeLightOutput(cOnSecCtr, false);

                int cTertiary = (luma(a3_600) > 122) ? a3_700 : a3_600;
                int cTertiaryCtr = (luma(a3_100) < 185) ? blendRgb(a3_50, a3_100, 0.5f) : a3_100;
                int cOnTertiaryCtr = (luma(a3_900) < 16) ? blendRgb(0xFF001E2C, a3_800, 0.35f) : a3_900;
                this.tertiaryAccent = sanitizeLightOutput(cTertiary, false);
                this.tertiaryContainer = sanitizeLightOutput(cTertiaryCtr, true);
                this.onTertiary = LIGHT_SAFE_WHITE;
                this.onTertiaryContainer = sanitizeLightOutput(cOnTertiaryCtr, false);

                int rawInk = (luma(n1_900Raw) < 18) ? blendRgb(0xFF161918, a2_900Raw, 0.25f) : n1_900Raw;
                if (luma(rawInk) > 42) {
                    rawInk = blendRgb(rawInk, 0xFF161918, 0.55f);
                }
                this.onSurface = sanitizeLightOutput(rawInk, false);
                int rawVariant = (luma(n2_700) < 48 || luma(n2_700) > 96)
                        ? blendRgb(0xFF404945, a2_700, 0.35f)
                        : n2_700;
                this.onSurfaceVariant = sanitizeLightOutput(rawVariant, false);
                this.onSurfaceMid = sanitizeLightOutput(blendRgb(this.onSurface, this.onSurfaceVariant, 0.42f), false);

                int rawOutline = (luma(n2_500) < 95 || luma(n2_500) > 145)
                        ? blendRgb(0xFF707975, a2_600, 0.25f)
                        : n2_500;
                this.outline = sanitizeLightOutput(rawOutline, false);
                this.outlineVariant = sanitizeLightOutput(blendRgb(n2_200, a2_100, 0.25f), true);

                this.error = LIGHT_ERROR;
                this.errorContainer = LIGHT_ERROR_CONTAINER;
                this.onErrorContainer = LIGHT_ON_ERROR_CONTAINER;

                this.darkAccentContainer = this.primaryContainer;
                this.darkAccentDeepContainer = this.secondaryContainer;

                if (navStyle == MaterialYouConfig.STYLE_PASTEL_SCREENSHOT) {
                    this.navbarCapsule = sanitizeLightOutput(blendRgb(this.primaryContainer, this.surfaceBase, 0.30f), true);
                    this.navbarActivePill = this.primaryAccent;
                    this.navbarActiveContent = this.onPrimary;
                    this.navbarInactiveContent = this.onPrimaryContainer;
                    this.miniPlayerSurface = sanitizeLightOutput(blendRgb(this.primaryContainer, LIGHT_SAFE_WHITE, 0.42f), true);
                    this.miniPlayerTitle = this.onPrimaryContainer;
                    this.miniPlayerSubtitle = this.primaryAccent;
                    this.miniPlayerArtworkBg = sanitizeLightOutput(blendRgb(this.primaryContainer, a1_200, 0.30f), true);

                    this.homeVibeSelectedBg = this.primaryAccent;
                    this.homeVibeSelectedText = this.onPrimary;
                    this.homeShortcutCardBg = this.surfaceContainer;
                } else if (navStyle == MaterialYouConfig.STYLE_HIGH_CONTRAST) {
                    this.navbarCapsule = sanitizeLightOutput(blendRgb(LIGHT_SAFE_WHITE, this.surfaceContainer, 0.42f), true);
                    this.navbarActivePill = this.primaryAccent;
                    this.navbarActiveContent = this.onPrimary;
                    this.navbarInactiveContent = this.onSurface;
                    this.miniPlayerSurface = sanitizeLightOutput(blendRgb(LIGHT_SAFE_WHITE, this.surfaceContainerHigh, 0.46f), true);
                    this.miniPlayerTitle = this.onSurface;
                    this.miniPlayerSubtitle = this.onSurfaceVariant;
                    this.miniPlayerArtworkBg = this.surfaceContainerHighest;

                    this.homeVibeSelectedBg = this.primaryAccent;
                    this.homeVibeSelectedText = this.onPrimary;
                    this.homeShortcutCardBg = this.surfaceContainerHigh;
                } else {
                    // Tonal Light Expressive (default in Light Mode)
                    this.navbarCapsule = sanitizeLightOutput(blendRgb(LIGHT_SAFE_WHITE, this.surfaceContainer, 0.46f), true);
                    this.navbarActivePill = sanitizeLightOutput(blendRgb(this.primaryContainer, a1_200, 0.26f), true);
                    this.navbarActiveContent = this.onPrimaryContainer;
                    this.navbarInactiveContent = this.onSurfaceVariant;
                    this.miniPlayerSurface = sanitizeLightOutput(blendRgb(LIGHT_SAFE_WHITE, this.surfaceContainerHigh, 0.44f), true);
                    this.miniPlayerTitle = this.onSurface;
                    this.miniPlayerSubtitle = this.onSurfaceVariant;
                    this.miniPlayerArtworkBg = this.surfaceContainerHighest;

                    this.homeVibeSelectedBg = this.primaryAccent;
                    this.homeVibeSelectedText = this.onPrimary;
                    this.homeShortcutCardBg = this.surfaceContainer;
                }

                this.homeVibeUnselectedBg = this.surfaceContainerHigh;
                this.homeVibeUnselectedText = this.onSurface;
                this.homeTopBarBg = this.surfaceBase;
                this.homeTopBarContent = this.onSurface;

                int[] lightTracked = new int[]{
                        this.surfaceBase,
                        this.surfaceLow,
                        this.surfaceContainer,
                        this.surfaceContainerHigh,
                        this.surfaceContainerHighest,
                        this.primaryAccent,
                        this.primaryContainer,
                        this.onPrimary,
                        this.onPrimaryContainer,
                        this.secondaryContainer,
                        this.onSecondaryContainer,
                        this.tertiaryAccent,
                        this.tertiaryContainer,
                        this.onTertiary,
                        this.onTertiaryContainer,
                        this.onSurface,
                        this.onSurfaceMid,
                        this.onSurfaceVariant,
                        this.outline,
                        this.outlineVariant,
                        this.error,
                        this.errorContainer,
                        this.onErrorContainer,
                        this.homeShortcutCardBg,
                        this.homeVibeSelectedBg,
                        this.homeVibeSelectedText,
                        this.homeVibeUnselectedBg,
                        this.homeVibeUnselectedText,
                        this.homeTopBarBg,
                        this.homeTopBarContent,
                        this.navbarCapsule,
                        this.navbarActivePill,
                        this.navbarActiveContent,
                        this.navbarInactiveContent,
                        this.miniPlayerSurface,
                        this.miniPlayerTitle,
                        this.miniPlayerSubtitle,
                        this.miniPlayerArtworkBg,
                        LIGHT_AMBER_ACCENT,
                        LIGHT_AMBER_CONTAINER,
                        LIGHT_ERROR_DARK
                };
                int[] lUnique = new int[lightTracked.length];
                int lCount = 0;
                for (int c : lightTracked) {
                    lCount = addUniqueRgb(lUnique, lCount, c & 0x00FFFFFF, false);
                }
                this.lightOutputRgbSet = new int[lCount];
                System.arraycopy(lUnique, 0, this.lightOutputRgbSet, 0, lCount);
                this.outputRgbSet = this.lightOutputRgbSet;
                return;
            }

            // ---- Dark Mode Monet Palette ----
            // OEM ROMs (e.g. ColorOS/OxygenOS 15) return pure/near black for *_900; lift safely when non-AMOLED.
            int n1_900 = (!amoled && luma(n1_900Raw) < 22)
                    ? blendRgb(0xFF0E1014, n1_800, 0.28f)
                    : n1_900Raw;
            int a2_900 = (!amoled && luma(a2_900Raw) < 24)
                    ? blendRgb(0xFF0F131D, a2_800, 0.34f)
                    : a2_900Raw;

            int computedBase;
            int computedLow;
            if (amoled) {
                computedBase = 0xFF000000;
                computedLow = blendRgb(0xFF0A0B0B, a2_900, 0.35f);
                this.surfaceContainer = blendRgb(n1_900, a2_900, 0.45f);
                this.surfaceContainerHigh = blendRgb(n1_800, a2_800, 0.45f);
                this.surfaceContainerHighest = blendRgb(n1_700, a2_700, 0.40f);
            } else if (monetStyle == MaterialYouConfig.MONET_STYLE_VIBRANT) {
                computedBase = blendRgb(blendRgb(n1_900, a2_900, 0.56f), a1_800, 0.22f);
                computedLow = blendRgb(blendRgb(n1_900, a2_800, 0.46f), a1_800, 0.18f);
                this.surfaceContainer = blendRgb(blendRgb(n1_900, a2_800, 0.58f), a1_800, 0.22f);
                this.surfaceContainerHigh = blendRgb(blendRgb(n1_800, a2_700, 0.52f), a1_800, 0.24f);
                this.surfaceContainerHighest = blendRgb(blendRgb(n1_700, a2_700, 0.48f), a1_700, 0.20f);
            } else if (monetStyle == MaterialYouConfig.MONET_STYLE_SUBTLE) {
                computedBase = blendRgb(n1_900, a2_900, 0.28f);
                computedLow = blendRgb(n1_900, a2_800, 0.22f);
                this.surfaceContainer = blendRgb(n1_900, a2_800, 0.34f);
                this.surfaceContainerHigh = blendRgb(n1_800, a2_700, 0.28f);
                this.surfaceContainerHighest = blendRgb(n1_700, a2_700, 0.24f);
            } else {
                // MONET_STYLE_EXPRESSIVE (default)
                computedBase = blendRgb(blendRgb(n1_900, a2_900, 0.50f), a1_800, 0.14f);
                computedLow = blendRgb(blendRgb(n1_900, a2_800, 0.38f), a1_800, 0.12f);
                this.surfaceContainer = blendRgb(blendRgb(n1_900, a2_800, 0.52f), a1_800, 0.16f);
                this.surfaceContainerHigh = blendRgb(blendRgb(n1_800, a2_700, 0.44f), a1_800, 0.16f);
                this.surfaceContainerHighest = blendRgb(blendRgb(n1_700, a2_700, 0.40f), a1_700, 0.14f);
            }

            int minBaseLuma = monetStyle == MaterialYouConfig.MONET_STYLE_SUBTLE ? 20 : 24;
            if (!amoled && luma(computedBase) < minBaseLuma) {
                // Ensure the base background never collapses into near-black on low-luminance wallpapers.
                int lifted = blendRgb(computedBase, a2_800, 0.42f);
                computedBase = luma(lifted) < minBaseLuma ? blendRgb(lifted, 0xFF19202F, 0.48f) : lifted;
            }
            if (!amoled && luma(computedLow) < luma(computedBase) + 4) {
                computedLow = blendRgb(computedBase, a2_800, 0.22f);
            }
            this.surfaceBase = computedBase;
            this.surfaceLow = computedLow;

            this.primaryAccent = monetStyle == MaterialYouConfig.MONET_STYLE_VIBRANT ? a1_300 : a1_200;
            this.primaryContainer = a1_700;
            this.onPrimary = a1_900;
            this.onPrimaryContainer = a1_100;
            this.secondaryContainer = a2_700;
            this.onSecondaryContainer = a2_100;
            this.tertiaryAccent = a3_200;
            this.tertiaryContainer = a3_700;
            this.onTertiary = blendRgb(a3_800, 0xFF000000, 0.45f);
            this.onTertiaryContainer = a3_100;
            this.onSurface = n1_50;
            this.onSurfaceVariant = n2_200;
            this.onSurfaceMid = blendRgb(n1_50, n2_200, 0.45f);
            this.outline = n2_400;
            this.outlineVariant = blendRgb(n2_600, a2_700, 0.35f);
            this.error = 0xFFFFB4AB;
            this.errorContainer = 0xFF93000A;
            this.onErrorContainer = 0xFFFFDAD6;

            this.darkAccentContainer = blendRgb(n1_800, a1_700, 0.55f);
            this.darkAccentDeepContainer = blendRgb(n1_900, a1_800, 0.45f);

            if (navStyle == MaterialYouConfig.STYLE_PASTEL_SCREENSHOT) {
                this.navbarCapsule = a1_100;
                this.navbarActivePill = a1_700;
                this.navbarActiveContent = 0xFFFFFFFF;
                this.navbarInactiveContent = a1_700;
                this.miniPlayerSurface = blendRgb(a1_100, n1_50, 0.35f);
                this.miniPlayerTitle = a1_900;
                this.miniPlayerSubtitle = a1_700;
                this.miniPlayerArtworkBg = a1_200;

                this.homeVibeSelectedBg = a1_700;
                this.homeVibeSelectedText = 0xFFFFFFFF;
                this.homeShortcutCardBg = blendRgb(this.surfaceContainerHigh, a1_800, 0.22f);
            } else if (navStyle == MaterialYouConfig.STYLE_HIGH_CONTRAST) {
                this.navbarCapsule = blendRgb(n1_900, a2_800, 0.45f);
                this.navbarActivePill = a1_300;
                this.navbarActiveContent = a1_900;
                this.navbarInactiveContent = n2_100;
                this.miniPlayerSurface = blendRgb(n1_800, a2_700, 0.45f);
                this.miniPlayerTitle = n1_50;
                this.miniPlayerSubtitle = n2_200;
                this.miniPlayerArtworkBg = blendRgb(n1_700, a1_800, 0.45f);

                this.homeVibeSelectedBg = a1_300;
                this.homeVibeSelectedText = a1_900;
                this.homeShortcutCardBg = blendRgb(this.surfaceContainerHigh, a1_800, 0.30f);
            } else {
                // Dark Tonal (default)
                this.navbarCapsule = blendRgb(n1_800, a2_800, 0.55f);
                this.navbarActivePill = a1_200;
                this.navbarActiveContent = a1_900;
                this.navbarInactiveContent = n2_100;
                this.miniPlayerSurface = blendRgb(n1_800, a2_700, 0.45f);
                this.miniPlayerTitle = n1_50;
                this.miniPlayerSubtitle = n2_200;
                this.miniPlayerArtworkBg = blendRgb(n1_700, a1_800, 0.45f);

                this.homeVibeSelectedBg = a1_200;
                this.homeVibeSelectedText = a1_900;
                this.homeShortcutCardBg = blendRgb(this.surfaceContainerHigh, a1_800, 0.28f);
            }

            this.homeVibeUnselectedBg = this.surfaceContainerHigh;
            this.homeVibeUnselectedText = n1_100;
            this.homeTopBarBg = this.surfaceBase;
            this.homeTopBarContent = n1_50;

            // Track ONLY derived/remapped output colors (never raw *_900 system black) so
            // remapArgb(0xFF000000) never short-circuits when !amoled.
            int[] trackedOutputs = new int[]{
                    this.surfaceBase,
                    this.surfaceLow,
                    this.surfaceContainer,
                    this.surfaceContainerHigh,
                    this.surfaceContainerHighest,
                    this.primaryAccent,
                    this.primaryContainer,
                    this.onPrimary,
                    this.onPrimaryContainer,
                    this.tertiaryAccent,
                    this.tertiaryContainer,
                    this.onSurface,
                    this.onSurfaceVariant,
                    this.outlineVariant,
                    this.darkAccentContainer,
                    this.darkAccentDeepContainer,
                    this.homeShortcutCardBg,
                    this.homeVibeSelectedBg,
                    this.homeVibeSelectedText,
                    this.homeVibeUnselectedBg,
                    this.homeVibeUnselectedText,
                    this.homeTopBarBg,
                    this.homeTopBarContent,
                    this.navbarCapsule,
                    this.navbarActivePill,
                    this.navbarActiveContent,
                    this.navbarInactiveContent,
                    this.miniPlayerSurface,
                    this.miniPlayerTitle,
                    this.miniPlayerSubtitle,
                    this.miniPlayerArtworkBg,
                    a1_50,
                    a1_100,
                    a1_200,
                    a1_300,
                    a1_400,
                    n1_50,
                    n1_100,
                    n2_200,
                    n2_400,
                    n2_600
            };

            int[] unique = new int[trackedOutputs.length];
            int count = 0;
            for (int c : trackedOutputs) {
                count = addUniqueRgb(unique, count, c & 0x00FFFFFF, amoled);
            }
            this.outputRgbSet = new int[count];
            System.arraycopy(unique, 0, this.outputRgbSet, 0, count);
            this.lightOutputRgbSet = new int[0];
        }

        private static int addUniqueRgb(int[] arr, int count, int rgb, boolean amoled) {
            if (rgb == 0xFFFFFF) {
                return count;
            }
            if (!amoled && rgb == 0x000000) {
                return count;
            }
            for (int i = 0; i < count; i++) {
                if (arr[i] == rgb) {
                    return count;
                }
            }
            arr[count] = rgb;
            return count + 1;
        }

        boolean isKnownOutputRgb(int rgb) {
            for (int candidate : outputRgbSet) {
                if (candidate == rgb) {
                    return true;
                }
            }
            return false;
        }

        boolean isLightMonetOutputRgb(int rgb) {
            for (int candidate : lightOutputRgbSet) {
                if (candidate == rgb) {
                    return true;
                }
            }
            return false;
        }
    }

    private static volatile PaletteSnapshot cachedSnapshot;
    private static volatile long lastPaletteFetchMs;

    private MaterialYouColorEngine() {
    }

    private static void captureContext(Activity activity) {
        if (activity == null) {
            return;
        }
        currentActivityRef = new WeakReference<>(activity);
        try {
            Context app = activity.getApplicationContext();
            if (app != null) {
                appContext = app;
            }
            ensureResourceIdsResolved(activity);
        } catch (Throwable ignored) {
        }
    }

    private static void ensureResourceIdsResolved(Context ctx) {
        if (ctx == null) {
            return;
        }
        try {
            Context app = ctx.getApplicationContext();
            if (app != null && appContext == null) {
                appContext = app;
            }
            String pkg = ctx.getPackageName();
            Resources res = ctx.getResources();
            if (res != null && pkg != null && (!pkg.equals(cachedIdsPackage) || cachedFragmentContainerId == 0)) {
                cachedContainerId = res.getIdentifier("container", "id", pkg);
                cachedFragmentContainerId = res.getIdentifier("fragmentContainer", "id", pkg);
                cachedAppScaffoldId = res.getIdentifier("appScaffold", "id", pkg);
                cachedIdsPackage = pkg;
            }
        } catch (Throwable ignored) {
        }
    }

    private static void invalidatePaletteCache() {
        cachedSnapshot = null;
        lastPaletteFetchMs = 0L;
    }

    private static PaletteSnapshot snapshot() {
        long now = System.currentTimeMillis();
        boolean light = isLightMode();
        PaletteSnapshot snap = cachedSnapshot;
        // Refresh periodically or immediately if effective Light/Dark mode changed.
        if (snap == null || snap.isLightMode != light || (now - lastPaletteFetchMs) > 4000L) {
            snap = new PaletteSnapshot(loadSystemPalette(), light);
            cachedSnapshot = snap;
            lastPaletteFetchMs = now;
            logPaletteIfChanged(snap, lastPaletteSource);
        }
        return snap;
    }

    private static int sys(int idx) {
        return snapshot().palette[idx];
    }

    private static int[] loadSystemPalette() {
        int[] out = new int[PALETTE_SIZE];
        Resources primaryRes = null;
        int primarySource = SOURCE_NONE;

        WeakReference<Activity> ref = currentActivityRef;
        Activity act = (ref != null) ? ref.get() : null;
        if (act != null && !act.isDestroyed()) {
            try {
                Resources actRes = act.getResources();
                if (actRes != null) {
                    primaryRes = actRes;
                    primarySource = SOURCE_ACTIVITY;
                }
            } catch (Throwable ignored) {
            }
        }

        if (primaryRes == null && appContext != null) {
            try {
                Resources appRes = appContext.getResources();
                if (appRes != null) {
                    primaryRes = appRes;
                    primarySource = SOURCE_APP;
                }
            } catch (Throwable ignored) {
            }
        }

        Resources sysRes = null;
        try {
            sysRes = Resources.getSystem();
        } catch (Throwable ignored) {
        }

        if (primaryRes == null && sysRes != null) {
            primaryRes = sysRes;
            primarySource = SOURCE_SYSTEM;
        }

        int primaryHits = 0;
        int systemHits = 0;
        for (int i = 0; i < PALETTE_SIZE; i++) {
            int resolved = FALLBACK_COLORS[i];
            boolean ok = false;
            if (Build.VERSION.SDK_INT >= 31) {
                if (primaryRes != null) {
                    try {
                        resolved = primaryRes.getColor(SYSTEM_COLOR_IDS[i], null);
                        primaryHits++;
                        ok = true;
                    } catch (Throwable ignored) {
                    }
                }
                if (!ok && sysRes != null && sysRes != primaryRes) {
                    try {
                        resolved = sysRes.getColor(SYSTEM_COLOR_IDS[i], null);
                        systemHits++;
                    } catch (Throwable ignored) {
                    }
                }
            }
            out[i] = resolved | 0xFF000000;
        }

        if (primaryHits > 0) {
            lastPaletteSource = primarySource;
        } else if (systemHits > 0) {
            lastPaletteSource = SOURCE_SYSTEM;
        } else {
            lastPaletteSource = SOURCE_FALLBACK;
        }
        return out;
    }

    private static String sourceName(int source) {
        switch (source) {
            case SOURCE_ACTIVITY:
                return "activity";
            case SOURCE_APP:
                return "app";
            case SOURCE_SYSTEM:
                return "system";
            case SOURCE_FALLBACK:
                return "fallback";
            default:
                return "none";
        }
    }

    private static String hex6(int argb) {
        return Integer.toHexString(0x01000000 | (argb & 0x00FFFFFF)).substring(1);
    }

    private static void logPaletteIfChanged(PaletteSnapshot snap, int source) {
        if (source == lastLoggedSource
                && snap.surfaceBase == lastLoggedSurfaceBase
                && snap.isLightMode == lastLoggedLightMode) {
            return;
        }
        lastLoggedSource = source;
        lastLoggedSurfaceBase = snap.surfaceBase;
        lastLoggedLightMode = snap.isLightMode;
        try {
            Log.d(LOG_TAG, "palette src=" + sourceName(source)
                    + " light=" + snap.isLightMode
                    + " n1_900=#" + hex6(snap.palette[IDX_NEUTRAL1_900])
                    + " a2_900=#" + hex6(snap.palette[IDX_ACCENT2_900])
                    + " a1_600=#" + hex6(snap.palette[IDX_ACCENT1_600])
                    + " -> base=#" + hex6(snap.surfaceBase)
                    + " ctr=#" + hex6(snap.surfaceContainer)
                    + " onSurf=#" + hex6(snap.onSurface)
                    + " pri=#" + hex6(snap.primaryAccent)
                    + " amoled=" + MaterialYouConfig.isAmoledPureBlack()
                    + " style=" + MaterialYouConfig.getMonetPaletteStyle());
        } catch (Throwable ignored) {
        }
    }

    public static int blendRgb(int c1, int c2, float ratio) {
        if (ratio <= 0f) return c1;
        if (ratio >= 1f) return c2;
        float inv = 1f - ratio;
        int a = Math.round(Color.alpha(c1) * inv + Color.alpha(c2) * ratio);
        int r = Math.round(Color.red(c1) * inv + Color.red(c2) * ratio);
        int g = Math.round(Color.green(c1) * inv + Color.green(c2) * ratio);
        int b = Math.round(Color.blue(c1) * inv + Color.blue(c2) * ratio);
        return Color.argb(
                Math.max(0, Math.min(255, a)),
                Math.max(0, Math.min(255, r)),
                Math.max(0, Math.min(255, g)),
                Math.max(0, Math.min(255, b))
        );
    }

    public static int withAlpha(int argb, int alpha) {
        return (argb & 0x00FFFFFF) | ((alpha & 0xFF) << 24);
    }

    // ---- Expressive Tonal Surface Hierarchy & Roles ----

    public static int getSurfaceBase() {
        return snapshot().surfaceBase;
    }

    public static int getSurfaceLow() {
        return snapshot().surfaceLow;
    }

    public static int getSurfaceContainer() {
        return snapshot().surfaceContainer;
    }

    public static int getSurfaceContainerHigh() {
        return snapshot().surfaceContainerHigh;
    }

    public static int getSurfaceContainerHighest() {
        return snapshot().surfaceContainerHighest;
    }

    public static int getPrimaryAccent() {
        return snapshot().primaryAccent;
    }

    public static int getPrimaryContainer() {
        return snapshot().primaryContainer;
    }

    public static int getOnPrimary() {
        return snapshot().onPrimary;
    }

    public static int getOnPrimaryContainer() {
        return snapshot().onPrimaryContainer;
    }

    public static int getSecondaryContainer() {
        return snapshot().secondaryContainer;
    }

    public static int getOnSecondaryContainer() {
        return snapshot().onSecondaryContainer;
    }

    public static int getTertiaryAccent() {
        return snapshot().tertiaryAccent;
    }

    public static int getTertiaryContainer() {
        return snapshot().tertiaryContainer;
    }

    public static int getOnTertiary() {
        return snapshot().onTertiary;
    }

    public static int getOnTertiaryContainer() {
        return snapshot().onTertiaryContainer;
    }

    public static int getOnSurface() {
        return snapshot().onSurface;
    }

    public static int getOnSurfaceMid() {
        return snapshot().onSurfaceMid;
    }

    public static int getOnSurfaceVariant() {
        return snapshot().onSurfaceVariant;
    }

    public static int getOutline() {
        return snapshot().outline;
    }

    public static int getOutlineVariant() {
        return snapshot().outlineVariant;
    }

    public static int getError() {
        return snapshot().error;
    }

    public static int getErrorContainer() {
        return snapshot().errorContainer;
    }

    public static int getOnErrorContainer() {
        return snapshot().onErrorContainer;
    }

    // ---- Material 3 Expressive Homepage Palette ----

    public static int getHomeShortcutCardBg() {
        return snapshot().homeShortcutCardBg;
    }

    public static int getHomeVibeSelectedBg() {
        return snapshot().homeVibeSelectedBg;
    }

    public static int getHomeVibeSelectedText() {
        return snapshot().homeVibeSelectedText;
    }

    public static int getHomeVibeUnselectedBg() {
        return snapshot().homeVibeUnselectedBg;
    }

    public static int getHomeVibeUnselectedText() {
        return snapshot().homeVibeUnselectedText;
    }

    public static int getHomeTopBarBg() {
        return snapshot().homeTopBarBg;
    }

    public static int getHomeTopBarContent() {
        return snapshot().homeTopBarContent;
    }

    /**
     * Context-aware remapper for Square Market {@code MarketColor} ({@code Lwha;.e()I} & {@code k()I}).
     * In Light Mode, remaps Square Market Light tokens ({@code Ls04$d} / {@code Llck;.a}) into the
     * Light Monet surface/ink hierarchy while keeping idempotency for already-mapped Monet colors.
     */
    public static int remapMarketColorArgb(int argb) {
        if (!MaterialYouConfig.isMaterialYouEnabled()) {
            return argb;
        }
        int alpha = argb & 0xFF000000;
        if (alpha == 0) {
            return argb;
        }
        PaletteSnapshot snap = snapshot();
        if (!snap.isLightMode) {
            return remapArgb(argb);
        }
        int rgb = argb & 0x00FFFFFF;
        if (snap.isLightMonetOutputRgb(rgb)) {
            return argb;
        }
        int mapped = -1;
        switch (rgb) {
            case 0xFFFFFF:
                mapped = snap.surfaceBase;
                break;
            case 0xF7F7F7:
            case 0xF5F5F5:
                mapped = snap.surfaceLow;
                break;
            case 0xF0F0F0:
                mapped = snap.surfaceContainer;
                break;
            case 0xE8E8E8:
                mapped = snap.surfaceContainerHigh;
                break;
            case 0xDADADA:
                mapped = snap.surfaceContainerHighest;
                break;
            case 0xCCCCCC:
                mapped = snap.outlineVariant;
                break;
            case 0x959595:
            case 0x787887:
            case 0x72727F:
                mapped = snap.outline;
                break;
            case 0x666666:
            case 0xAFAFB6:
            case 0x9A9AA1:
            case 0x9B9B9B:
                mapped = snap.onSurfaceVariant;
                break;
            case 0x333333:
                mapped = snap.onSurfaceMid;
                break;
            case 0x232323:
            case 0x101010:
            case 0x000000:
            case 0xE4E4E7:
                mapped = snap.onSurface;
                break;
            case 0x006AFF:
            case 0x0055CC:
            case 0x005FE5:
            case 0x005AD9:
            case 0x33FFEE:
            case 0x21FEEC:
            case 0x66FFF3:
            case 0x99FFF7:
            case 0x3D8F88:
            case 0x14998E:
                mapped = snap.primaryAccent;
                break;
            case 0xCCE1FF:
            case 0xE6F0FF:
            case 0xE6F2FF:
            case 0x244240:
            case 0x141F1E:
            case 0x07332F:
                mapped = snap.primaryContainer;
                break;
            case 0x1A1A1A:
            case 0x141414:
            case 0x1C1C1C:
            case 0x2D2D2D:
            case 0x080808:
                mapped = snap.onSurface;
                break;
            case 0xFFD432:
            case 0xFFBE7D:
            case 0xFFBF80:
                mapped = LIGHT_AMBER_ACCENT;
                break;
            default:
                break;
        }
        if (mapped == -1) {
            return argb;
        }
        return alpha | (mapped & 0x00FFFFFF);
    }

    /**
     * Remaps TIDAL Wave 2, Wave 1, Square Market, and Compose 32-bit ARGB colors
     * to Material You dynamic tokens. Strictly idempotent so double-interception
     * (e.g. {@code MarketColor.toArgb()} + {@code ColorKt.Color(int)}) is safe.
     */
    public static int remapArgb(int argb) {
        if (!MaterialYouConfig.isMaterialYouEnabled()) {
            return argb;
        }
        int alpha = argb & 0xFF000000;
        if (alpha == 0) {
            return argb;
        }
        int rgb = argb & 0x00FFFFFF;

        PaletteSnapshot snap = snapshot();
        if (snap.isLightMode) {
            if (snap.isLightMonetOutputRgb(rgb)) {
                return argb;
            }
            int mapped = remapUnambiguousDarkTokenForLight(snap, rgb);
            return (mapped == -1) ? argb : (alpha | (mapped & 0x00FFFFFF));
        }

        if (snap.isKnownOutputRgb(rgb)) {
            return argb;
        }

        int mapped = -1;
        switch (rgb) {
            // Wave 2 / Wave 1 primary cyan accents
            case 0x33FFEE:
            case 0x21FEEC:
                mapped = snap.primaryAccent;
                break;
            case 0x66FFF3:
            case 0xCCFFF2:
                mapped = snap.palette[IDX_ACCENT1_100];
                break;
            case 0x99FFF7:
            case 0xE5FFEE:
            case 0xE6FFF9:
                mapped = snap.palette[IDX_ACCENT1_50];
                break;
            case 0x16D8A7:
            case 0x12BF94:
            case 0x4CCCCD:
                mapped = snap.palette[IDX_ACCENT1_300];
                break;
            case 0x14998E:
            case 0x3D8F88:
            case 0x1E877E:
            case 0x10A680:
            case 0x19999A:
            case 0x0D8C6D:
            case 0x0C785D:
                mapped = snap.palette[IDX_ACCENT1_400];
                break;
            case 0x244240:
                mapped = snap.darkAccentContainer;
                break;
            case 0x141F1E:
            case 0x07332F:
                mapped = snap.darkAccentDeepContainer;
                break;

            // Base dark surfaces (Wave 2 + Square Market)
            case 0x000000:
                // Only remap opaque background black; preserve translucent shadow/scrim alphas.
                if (alpha == 0xFF000000 && !isEffectiveAmoledBlack()) {
                    mapped = snap.surfaceBase;
                }
                break;
            case 0x080808:
            case 0x0C0C0D:
            case 0x101010:
            case 0x101012:
            case 0x121212:
            case 0x131314:
            case 0x141414:
            case 0x141416:
                mapped = snap.surfaceLow;
                break;

            // Elevated card / sheet / shortcut containers (Wave 2 + Market)
            case 0x17171A:
            case 0x18181B:
            case 0x1A1A1A:
            case 0x1C1C1C:
            case 0x1D1D1F:
                mapped = snap.surfaceContainer;
                break;
            case 0x222226:
            case 0x232323:
            case 0x242429:
            case 0x252525:
            case 0x28282E:
            case 0x2A2A2A:
            case 0x2D2D2D:
                mapped = snap.surfaceContainerHigh;
                break;
            case 0x303036:
            case 0x333333:
            case 0x393940:
                mapped = snap.surfaceContainerHighest;
                break;
            case 0x505059:
            case 0x595959:
            case 0x636366:
            case 0x666666:
                mapped = snap.palette[IDX_NEUTRAL2_600];
                break;

            // Text / subtle gray tokens (Wave 2 + Market)
            case 0xF0F0F0:
            case 0xF7F7F7:
                mapped = snap.palette[IDX_NEUTRAL1_50];
                break;
            case 0xE4E4E7:
            case 0xE5E5EA:
            case 0xE8E8E8:
            case 0xDADADA:
                mapped = snap.palette[IDX_NEUTRAL1_100];
                break;
            case 0xCCCCCC:
            case 0xAFAFB6:
            case 0x9A9AA1:
            case 0x9B9B9B:
            case 0x959595:
                mapped = snap.palette[IDX_NEUTRAL2_200];
                break;
            case 0x787887:
            case 0x797982:
                mapped = snap.palette[IDX_NEUTRAL2_400];
                break;
            default:
                mapped = classifyUnmappedRgb(snap, rgb, alpha);
                break;
        }

        if (mapped == -1) {
            return argb;
        }
        return alpha | (mapped & 0x00FFFFFF);
    }

    /**
     * Remaps unambiguous TIDAL dark-theme hex constants to Light Monet without touching raw
     * {@code 0x000000} or {@code 0xFFFFFF} (whose roles depend on background vs foreground).
     */
    private static int remapUnambiguousDarkTokenForLight(PaletteSnapshot snap, int rgb) {
        switch (rgb) {
            case 0x33FFEE:
            case 0x21FEEC:
            case 0x66FFF3:
            case 0x99FFF7:
            case 0x16D8A7:
            case 0x12BF94:
            case 0x4CCCCD:
            case 0x14998E:
            case 0x3D8F88:
            case 0x1E877E:
            case 0x10A680:
            case 0x19999A:
            case 0x0D8C6D:
            case 0x0C785D:
                return snap.primaryAccent;
            case 0x244240:
            case 0x141F1E:
            case 0x07332F:
            case 0x0F2C2B:
                return snap.primaryContainer;
            case 0x0C0C0D:
            case 0x101012:
            case 0x121212:
            case 0x131314:
            case 0x141416:
            case 0x17171A:
            case 0x18181B:
            case 0x1D1D1F:
                return snap.surfaceLow;
            case 0x222226:
            case 0x242429:
            case 0x28282E:
                return snap.surfaceContainer;
            case 0x303036:
            case 0x393940:
                return snap.surfaceContainerHigh;
            case 0x505059:
            case 0x636366:
                return snap.surfaceContainerHighest;
            case 0xE4E4E7:
            case 0xFCFCFC:
            case 0xEAEAEE:
                return snap.onSurface;
            case 0xAFAFB6:
            case 0xCECED9:
            case 0xB2B2BF:
            case 0xB0B0B5:
            case 0x9898A6:
            case 0x9A9AA1:
            case 0x9B9B9B:
                return snap.onSurfaceVariant;
            case 0x787887:
            case 0x72727F:
            case 0x797982:
                return snap.outline;
            case 0xFFD432:
            case 0xFFBE7D:
            case 0xFFBF80:
            case 0xFFD233:
                return LIGHT_AMBER_ACCENT;
            case 0x332619:
            case 0x423324:
            case 0x1F1A14:
                return LIGHT_AMBER_CONTAINER;
            case 0xFF3269:
            case 0xFF3E33:
            case 0xF35E85:
            case 0xFF4141:
                return snap.error;
            case 0x42242C:
            case 0x1C0209:
            case 0x330C0A:
            case 0x1F1415:
                return snap.errorContainer;
            default:
                return -1;
        }
    }

    private static int classifyUnmappedRgb(PaletteSnapshot snap, int rgb, int alpha) {
        if (rgb == 0x000000 || rgb == 0xFFFFFF) {
            return -1;
        }
        int r = (rgb >> 16) & 0xFF;
        int g = (rgb >> 8) & 0xFF;
        int b = rgb & 0xFF;

        int maxC = Math.max(r, Math.max(g, b));
        int minC = Math.min(r, Math.min(g, b));
        int spread = maxC - minC;

        // Achromatic / subtle cool gray surfaces and typography tokens
        if (spread <= 14) {
            int luma = (r * 30 + g * 59 + b * 11) / 100;
            if (luma <= 10) {
                return (alpha == 0xFF000000 && !isEffectiveAmoledBlack())
                        ? snap.surfaceBase
                        : snap.surfaceLow;
            }
            if (luma <= 20) {
                return snap.surfaceLow;
            }
            if (luma <= 31) {
                return snap.surfaceContainer;
            }
            if (luma <= 46) {
                return snap.surfaceContainerHigh;
            }
            if (luma <= 66) {
                return snap.surfaceContainerHighest;
            }
            if (luma <= 110) {
                return snap.palette[IDX_NEUTRAL2_600];
            }
            if (luma <= 155) {
                return snap.palette[IDX_NEUTRAL2_400];
            }
            if (luma <= 205) {
                return snap.palette[IDX_NEUTRAL2_200];
            }
            if (luma <= 244) {
                return snap.palette[IDX_NEUTRAL1_100];
            }
            if (luma <= 253) {
                return snap.palette[IDX_NEUTRAL1_50];
            }
            return -1;
        }

        // TIDAL cyan / teal brand accents -> lightweight allocation-free HSV check
        if (maxC <= 0) {
            return -1;
        }
        float sat = (float) spread / (float) maxC;
        float val = maxC / 255f;

        float hue;
        if (maxC == r) {
            hue = 60f * (((g - b) / (float) spread) % 6f);
        } else if (maxC == g) {
            hue = 60f * (((b - r) / (float) spread) + 2f);
        } else {
            hue = 60f * (((r - g) / (float) spread) + 4f);
        }
        if (hue < 0f) {
            hue += 360f;
        }

        if (hue >= 155f && hue <= 198f && sat >= 0.30f) {
            if (val >= 0.90f) {
                return (sat < 0.45f) ? snap.palette[IDX_ACCENT1_100] : snap.primaryAccent;
            }
            if (val >= 0.65f) {
                return snap.palette[IDX_ACCENT1_300];
            }
            if (val >= 0.42f) {
                return snap.palette[IDX_ACCENT1_400];
            }
            if (val >= 0.24f) {
                return snap.darkAccentContainer;
            }
            return snap.darkAccentDeepContainer;
        }

        // Pale mint tints like 0xE6FFF9 / 0xCCFFF2 variations
        if (hue >= 150f && hue <= 198f && val >= 0.88f && (g - r) >= 16) {
            return snap.palette[IDX_ACCENT1_50];
        }

        return -1;
    }

    /**
     * Remaps 64-bit unsigned-int color literals passed to {@code ColorKt.Color(long)}.
     */
    public static long remapArgbLong(long colorLong) {
        if (!MaterialYouConfig.isMaterialYouEnabled()) {
            return colorLong;
        }
        long high = colorLong >>> 32;
        if (high == 0L || high == 0xFFFFFFFFL) {
            int remapped = remapArgb((int) colorLong);
            return remapped & 0xFFFFFFFFL;
        }
        return colorLong;
    }

    /**
     * Remaps a packed 64-bit Jetpack Compose {@code Color.value} at render time (e.g. inside
     * {@code BackgroundKt.background-bw27NRU}). Only sRGB colors (low 6-bit colorSpace ID == 0)
     * with non-zero alpha are remapped; {@code Color.Unspecified} (16L), transparent colors,
     * translucent scrims, and already-remapped Monet outputs pass through untouched.
     */
    public static long remapComposeColor(long composeColor) {
        if (!MaterialYouConfig.isMaterialYouEnabled()) {
            return composeColor;
        }
        // Compose encodes sRGB colors as ((long) argb) << 32 (low 6 bits == 0).
        // Color.Unspecified is 16L (low 6 bits != 0); non-sRGB spaces also have non-zero IDs.
        if ((composeColor & 0x3FL) != 0L) {
            return composeColor;
        }
        int argb = (int) (composeColor >>> 32);
        int alpha = argb & 0xFF000000;
        if (alpha == 0) {
            return composeColor;
        }
        PaletteSnapshot snap = snapshot();
        int rgb = argb & 0x00FFFFFF;
        if (snap.isLightMode) {
            if (snap.isLightMonetOutputRgb(rgb)) {
                return composeColor;
            }
            int mapped = -1;
            if ((rgb == 0x000000 || rgb == 0x080808) && alpha == 0xFF000000) {
                mapped = snap.surfaceBase;
            } else if ((rgb == 0xFFFFFF || rgb == 0xEBEBFF) && ((alpha >>> 24) >= 8 && (alpha >>> 24) <= 0x3A)) {
                return ((long) (alpha | (snap.onSurface & 0x00FFFFFF))) << 32;
            } else if ((rgb == 0x101010 || rgb == 0x141414 || rgb == 0x1A1A1A || rgb == 0x1C1C1C || rgb == 0x232323)
                    && alpha == 0xFF000000) {
                mapped = snap.surfaceLow;
            } else {
                mapped = remapUnambiguousDarkTokenForLight(snap, rgb);
            }
            if (mapped == -1) {
                return composeColor;
            }
            return ((long) (alpha | (mapped & 0x00FFFFFF))) << 32;
        }
        int remapped = remapArgb(argb);
        if (remapped == argb) {
            return composeColor;
        }
        return ((long) remapped) << 32;
    }

    /**
     * Render-time safeguard for Compose {@code AndroidTextPaint.setColor-8_81llA} and
     * {@code ColorFilter$Companion.tint-xETnrds} so leftover dark-mode light-gray, cyan, or
     * gold foregrounds remain high-contrast in Light Mode while preserving white-on-cover overlays
     * and already-mapped Monet colors.
     */
    public static long remapComposeForegroundColor(long composeColor) {
        if (!MaterialYouConfig.isMaterialYouEnabled() || !isLightMode()) {
            return composeColor;
        }
        if ((composeColor & 0x3FL) != 0L) {
            return composeColor;
        }
        int argb = (int) (composeColor >>> 32);
        int alpha = argb & 0xFF000000;
        if (alpha == 0) {
            return composeColor;
        }
        PaletteSnapshot snap = snapshot();
        int rgb = argb & 0x00FFFFFF;
        if (snap.isLightMonetOutputRgb(rgb)) {
            return composeColor;
        }
        int alphaByte = (alpha >>> 24) & 0xFF;
        int mapped = -1;
        switch (rgb) {
            case 0xE4E4E7:
            case 0xFCFCFC:
            case 0xEAEAEE:
                mapped = snap.onSurface;
                break;
            case 0xAFAFB6:
            case 0xCECED9:
            case 0xB2B2BF:
            case 0xB0B0B5:
            case 0x9898A6:
            case 0x9A9AA1:
            case 0x9B9B9B:
                mapped = snap.onSurfaceVariant;
                break;
            case 0x787887:
            case 0x72727F:
            case 0x797982:
                mapped = snap.outline;
                break;
            case 0x33FFEE:
            case 0x21FEEC:
            case 0x66FFF3:
            case 0x99FFF7:
            case 0x16D8A7:
            case 0x12BF94:
            case 0x4CCCCD:
            case 0x14998E:
            case 0x3D8F88:
            case 0x1E877E:
            case 0x10A680:
                mapped = snap.primaryAccent;
                break;
            case 0xFFD432:
            case 0xFFBE7D:
            case 0xFFBF80:
            case 0xFFD233:
                mapped = LIGHT_AMBER_ACCENT;
                break;
            case 0xFF3269:
            case 0xFF3E33:
            case 0xF35E85:
            case 0xFF4141:
                mapped = snap.error;
                break;
            case 0xFFFFFF:
            case 0xEBEBFF:
                if (alphaByte >= 0x48 && alphaByte <= 0xD8) {
                    mapped = snap.onSurface;
                }
                break;
            default:
                break;
        }
        if (mapped == -1) {
            return composeColor;
        }
        return ((long) (alpha | (mapped & 0x00FFFFFF))) << 32;
    }

    // ---- Wave 1 & Wave 2 Live Dynamic Token Synchronization ----

    private static final int WAVE1_ROLE_BASE_FILL = 0;
    private static final int WAVE1_ROLE_BASE_BRIGHT = 1;
    private static final int WAVE1_ROLE_BASE_BRIGHTER = 2;
    private static final int WAVE1_ROLE_BASE_BRIGHTEST = 3;
    private static final int WAVE1_ROLE_CONTRAST_FILL = 4;
    private static final int WAVE1_ROLE_CONTRAST_DARK = 5;
    private static final int WAVE1_ROLE_CONTRAST_DARKER = 6;
    private static final int WAVE1_ROLE_CONTRAST_DARKEST = 7;
    private static final int WAVE1_ROLE_ACCENT_FILL = 8;

    private static final class Wave2FieldBinding {
        final Field field;
        final String tokenName;
        long originalDarkValue;

        Wave2FieldBinding(Field field, String tokenName, long originalDarkValue) {
            this.field = field;
            this.tokenName = tokenName;
            this.originalDarkValue = originalDarkValue;
        }
    }

    private static volatile Class<?> cachedWave2Class;
    private static volatile List<Wave2FieldBinding> cachedWave2Bindings;
    private static volatile int lastWave2SyncHash;
    private static volatile Class<?> cachedWave2StaticClass;
    private static volatile List<Wave2FieldBinding> cachedWave2StaticBindings;
    private static volatile int lastWave2StaticSyncHash;

    /**
     * Convenience 1-arg entry point for TIDAL Wave 1 ({@code Laxj;}) getters.
     */
    public static long resolveWave1RoleColor(int role) {
        return resolveWave1RoleColor(role, 0xFF000000L << 32);
    }

    /**
     * Resolves a live Monet Compose {@code Color.value} for TIDAL Wave 1 ({@code Laxj;}) getters.
     */
    public static long resolveWave1RoleColor(int role, long fallbackComposeColor) {
        if (!MaterialYouConfig.isMaterialYouEnabled()) {
            return fallbackComposeColor;
        }
        PaletteSnapshot snap = snapshot();
        int argb;
        switch (role) {
            case WAVE1_ROLE_BASE_FILL:
                argb = snap.surfaceBase;
                break;
            case WAVE1_ROLE_BASE_BRIGHT:
                argb = snap.surfaceLow;
                break;
            case WAVE1_ROLE_BASE_BRIGHTER:
                argb = snap.surfaceContainer;
                break;
            case WAVE1_ROLE_BASE_BRIGHTEST:
                argb = snap.surfaceContainerHigh;
                break;
            case WAVE1_ROLE_CONTRAST_FILL:
                argb = snap.isLightMode ? snap.onSurface : 0xFFFFFFFF;
                break;
            case WAVE1_ROLE_CONTRAST_DARK:
                argb = snap.onSurface;
                break;
            case WAVE1_ROLE_CONTRAST_DARKER:
                argb = snap.onSurfaceVariant;
                break;
            case WAVE1_ROLE_CONTRAST_DARKEST:
                argb = snap.outline;
                break;
            case WAVE1_ROLE_ACCENT_FILL:
                argb = snap.primaryAccent;
                break;
            default:
                return fallbackComposeColor;
        }
        return ((long) argb) << 32;
    }

    /**
     * Updates TIDAL Wave 2 ({@code Lzwj;} {@code WaveColors}) instance fields live so switching
     * between System Light and Dark Mode or changing wallpaper colors updates every Wave 2 screen
     * immediately without stale {@code <clinit>} caches.
     */
    public static void syncWave2Colors(Object waveColorsInstance) {
        if (waveColorsInstance == null || !MaterialYouConfig.isMaterialYouEnabled()) {
            return;
        }
        activeWave2ColorsRef = new WeakReference<>(waveColorsInstance);
        try {
            PaletteSnapshot snap = snapshot();
            int syncKey = computePaletteSyncKey(snap);
            List<Wave2FieldBinding> bindings = ensureWave2Bindings(waveColorsInstance);
            if (bindings != null && (lastWave2SyncHash != syncKey || lastWave2SyncHash == 0)) {
                for (Wave2FieldBinding b : bindings) {
                    long nextVal = resolveWave2TokenCompose(snap, b.tokenName, b.originalDarkValue);
                    b.field.setLong(waveColorsInstance, nextVal);
                }
                lastWave2SyncHash = syncKey;
            }
        } catch (Throwable ignored) {
        }
        syncWave2StaticColors();
    }

    /**
     * Updates TIDAL's static {@code Lxwj;} Wave 2 color constants used by Settings and Wave 1.
     */
    public static void syncWave2StaticColors() {
        if (!MaterialYouConfig.isMaterialYouEnabled()) {
            return;
        }
        String clsName = MaterialYouConfig.getWave2StaticColorsClass();
        String fieldMap = MaterialYouConfig.getWave2StaticFieldMap();
        if (clsName == null || clsName.isEmpty() || fieldMap == null || fieldMap.isEmpty()) {
            return;
        }
        try {
            PaletteSnapshot snap = snapshot();
            int syncKey = computePaletteSyncKey(snap);
            if (lastWave2StaticSyncHash == syncKey && lastWave2StaticSyncHash != 0) {
                return;
            }
            if (cachedWave2StaticClass == null || cachedWave2StaticBindings == null) {
                Class<?> cls = Class.forName(clsName);
                Map<String, Field> byName = new HashMap<>();
                for (Field f : cls.getDeclaredFields()) {
                    if (f.getType() == long.class) {
                        f.setAccessible(true);
                        byName.put(f.getName(), f);
                    }
                }
                List<Wave2FieldBinding> bindings = new ArrayList<>();
                for (String entry : fieldMap.split(";")) {
                    int eq = entry.indexOf('=');
                    if (eq <= 0 || eq >= entry.length() - 1) {
                        continue;
                    }
                    String fieldName = entry.substring(0, eq);
                    String tokenName = entry.substring(eq + 1);
                    Field f = byName.get(fieldName);
                    if (f != null) {
                        bindings.add(new Wave2FieldBinding(f, tokenName, 0L));
                    }
                }
                cachedWave2StaticBindings = bindings;
                cachedWave2StaticClass = cls;
            }
            List<Wave2FieldBinding> bindings = cachedWave2StaticBindings;
            if (bindings == null) {
                return;
            }
            for (Wave2FieldBinding b : bindings) {
                int mappedArgb;
                String name = b.tokenName;
                if ("accentFill".equals(name)) {
                    mappedArgb = snap.primaryAccent;
                } else if ("baseFill".equals(name)) {
                    mappedArgb = snap.surfaceBase;
                } else if ("baseBright".equals(name)) {
                    mappedArgb = snap.surfaceLow;
                } else if ("baseBrighter".equals(name)) {
                    mappedArgb = snap.surfaceContainer;
                } else if ("baseBrightest".equals(name)) {
                    mappedArgb = snap.surfaceContainerHigh;
                } else if ("contrastFill".equals(name)) {
                    mappedArgb = snap.isLightMode ? snap.onSurface : 0xFFFFFFFF;
                } else if ("contrastDark".equals(name)) {
                    mappedArgb = snap.onSurface;
                } else if ("contrastDarker".equals(name)) {
                    mappedArgb = snap.onSurfaceVariant;
                } else if ("contrastDarkest".equals(name)) {
                    mappedArgb = snap.outline;
                } else if ("warningDark".equals(name)) {
                    mappedArgb = snap.isLightMode ? LIGHT_ERROR_DARK : 0xFF99334E;
                } else if ("warningFill".equals(name)) {
                    mappedArgb = snap.isLightMode ? snap.error : 0xFFFF3269;
                } else {
                    continue;
                }
                b.field.setLong(null, ((long) mappedArgb) << 32);
            }
            lastWave2StaticSyncHash = syncKey;
        } catch (Throwable ignored) {
        }
    }

    private static int computePaletteSyncKey(PaletteSnapshot snap) {
        int h = snap.isLightMode ? 0x13572468 : 0x24681357;
        h = 31 * h + snap.surfaceBase;
        h = 31 * h + snap.surfaceContainer;
        h = 31 * h + snap.primaryAccent;
        h = 31 * h + snap.onSurface;
        h = 31 * h + snap.outlineVariant;
        return h == 0 ? 1 : h;
    }

    private static List<Wave2FieldBinding> ensureWave2Bindings(Object instance) {
        Class<?> cls = instance.getClass();
        if (cachedWave2Class == cls && cachedWave2Bindings != null) {
            return cachedWave2Bindings;
        }
        String rawMap = MaterialYouConfig.getWave2FieldMap();
        if (rawMap == null || rawMap.isEmpty()) {
            return null;
        }
        Map<String, Field> byName = new HashMap<>();
        for (Field f : cls.getDeclaredFields()) {
            if (f.getType() == long.class) {
                f.setAccessible(true);
                byName.put(f.getName(), f);
            }
        }
        List<Wave2FieldBinding> result = new ArrayList<>();
        String[] entries = rawMap.split(";");
        for (String entry : entries) {
            int eq = entry.indexOf('=');
            if (eq <= 0 || eq >= entry.length() - 1) {
                continue;
            }
            String fieldName = entry.substring(0, eq);
            String tokenName = entry.substring(eq + 1);
            Field f = byName.get(fieldName);
            if (f != null) {
                try {
                    long origVal = f.getLong(instance);
                    result.add(new Wave2FieldBinding(f, tokenName, origVal));
                } catch (Throwable ignored) {
                }
            }
        }
        cachedWave2Bindings = result;
        cachedWave2Class = cls;
        return result;
    }

    private static long resolveWave2TokenCompose(PaletteSnapshot snap, String name, long originalDarkVal) {
        if ("materialDark".equals(name)) {
            int c = snap.isLightMode ? snap.surfaceContainerHigh : snap.surfaceContainer;
            return ((long) withAlpha(c, 0xCC)) << 32;
        }
        if ("materialLight".equals(name)) {
            int c = snap.isLightMode ? snap.surfaceContainerHigh : snap.surfaceContainerHighest;
            return ((long) withAlpha(c, snap.isLightMode ? 0xF2 : 0x33)) << 32;
        }
        if ("solidBaseFill".equals(name)) {
            return ((long) snap.surfaceBase) << 32;
        }
        if ("solidBaseBright".equals(name)) {
            return ((long) snap.surfaceLow) << 32;
        }
        if ("solidBaseBrighter".equals(name)) {
            return ((long) snap.surfaceContainer) << 32;
        }
        if ("solidBaseBrightest".equals(name)) {
            return ((long) snap.surfaceContainerHigh) << 32;
        }
        if ("solidContrastFill".equals(name)) {
            return ((long) (snap.isLightMode ? snap.onSurface : 0xFFFFFFFF)) << 32;
        }
        if ("solidContrastDark".equals(name)) {
            return ((long) snap.onSurface) << 32;
        }
        if ("solidContrastDarker".equals(name)) {
            return ((long) snap.onSurfaceVariant) << 32;
        }
        if ("solidContrastDarkest".equals(name)) {
            return ((long) snap.outline) << 32;
        }
        if ("solidAccentFill".equals(name) || "solidAccentDark".equals(name)) {
            return ((long) snap.primaryAccent) << 32;
        }
        if ("solidAccentBright".equals(name)) {
            int c = snap.isLightMode
                    ? blendRgb(snap.primaryAccent, snap.onPrimaryContainer, 0.25f)
                    : snap.palette[IDX_ACCENT1_100];
            return ((long) sanitizeLightOutputIfLight(snap, c, false)) << 32;
        }
        if ("solidAccentBrighter".equals(name)) {
            int c = snap.isLightMode
                    ? snap.onPrimaryContainer
                    : snap.palette[IDX_ACCENT1_50];
            return ((long) c) << 32;
        }
        if ("solidAccentDarker".equals(name)) {
            return ((long) (snap.isLightMode ? snap.primaryContainer : snap.darkAccentContainer)) << 32;
        }
        if ("solidAccentDarkest".equals(name)) {
            return ((long) (snap.isLightMode ? snap.primaryContainer : snap.darkAccentDeepContainer)) << 32;
        }
        if ("solidSpecialFill".equals(name)) {
            return ((long) (snap.isLightMode ? LIGHT_AMBER_ACCENT : 0xFFFFBF80)) << 32;
        }
        if ("solidSpecialBright".equals(name)) {
            return ((long) (snap.isLightMode ? LIGHT_AMBER_ACCENT : 0xFFFFD9B3)) << 32;
        }
        if ("solidSpecialBrighter".equals(name)) {
            return ((long) (snap.isLightMode ? LIGHT_AMBER_ACCENT : 0xFFFFF2E5)) << 32;
        }
        if ("solidSpecialDark".equals(name)) {
            return ((long) (snap.isLightMode ? LIGHT_AMBER_ACCENT : 0xFF996633)) << 32;
        }
        if ("solidSpecialDarker".equals(name)) {
            return ((long) (snap.isLightMode ? LIGHT_AMBER_CONTAINER : 0xFF423324)) << 32;
        }
        if ("solidSpecialDarkest".equals(name)) {
            return ((long) (snap.isLightMode ? LIGHT_AMBER_CONTAINER : 0xFF1F1A14)) << 32;
        }
        if ("solidWarningFill".equals(name)) {
            return ((long) (snap.isLightMode ? snap.error : 0xFFFF3269)) << 32;
        }
        if ("solidWarningBright".equals(name)) {
            return ((long) (snap.isLightMode ? snap.error : 0xFFF35E85)) << 32;
        }
        if ("solidWarningBrighter".equals(name)) {
            return ((long) (snap.isLightMode ? snap.error : 0xFFF68DA9)) << 32;
        }
        if ("solidWarningDark".equals(name)) {
            return ((long) (snap.isLightMode ? LIGHT_ERROR_DARK : 0xFF99334E)) << 32;
        }
        if ("solidWarningDarker".equals(name)) {
            return ((long) (snap.isLightMode ? snap.errorContainer : 0xFF42242C)) << 32;
        }
        if ("solidWarningDarkest".equals(name)) {
            return ((long) (snap.isLightMode ? snap.errorContainer : 0xFF1C0209)) << 32;
        }

        // Preserve original alpha for opacity tokens while swapping RGB cleanly
        int origArgb = (int) (originalDarkVal >>> 32);
        int origAlpha = (origArgb >>> 24) & 0xFF;
        if (name.startsWith("opacityAccentDark")) {
            int c = snap.isLightMode ? snap.primaryContainer : snap.darkAccentDeepContainer;
            return ((long) withAlpha(c, origAlpha)) << 32;
        }
        if (name.startsWith("opacityAccentFill")) {
            return ((long) withAlpha(snap.primaryAccent, origAlpha)) << 32;
        }
        if (name.startsWith("opacityBaseBrightest")) {
            return ((long) withAlpha(snap.surfaceContainerHigh, origAlpha)) << 32;
        }
        if (name.startsWith("opacityBaseBrighter")) {
            return ((long) withAlpha(snap.surfaceContainer, origAlpha)) << 32;
        }
        if (name.startsWith("opacityBaseBright")) {
            return ((long) withAlpha(snap.surfaceLow, origAlpha)) << 32;
        }
        if (name.startsWith("opacityBaseFill")) {
            return ((long) withAlpha(snap.surfaceBase, origAlpha)) << 32;
        }
        if (name.startsWith("opacityContrastFill")) {
            int c = snap.isLightMode ? snap.onSurface : 0xFFFFFFFF;
            return ((long) withAlpha(c, origAlpha)) << 32;
        }
        if (name.startsWith("opacitySpecialFill")) {
            int c = snap.isLightMode ? LIGHT_AMBER_ACCENT : 0xFFFFBF80;
            return ((long) withAlpha(c, origAlpha)) << 32;
        }
        return originalDarkVal;
    }

    private static int sanitizeLightOutputIfLight(PaletteSnapshot snap, int argb, boolean isLightSurface) {
        return snap.isLightMode ? sanitizeLightOutput(argb, isLightSurface) : argb;
    }

    /**
     * Returns {@link #getSurfaceBase()} encoded as a 64-bit Jetpack Compose sRGB {@code Color.value}.
     */
    public static long getSurfaceBaseCompose() {
        return ((long) getSurfaceBase()) << 32;
    }

    /**
     * Returns {@link #getOnSurface()} encoded as a 64-bit Jetpack Compose sRGB {@code Color.value}.
     */
    public static long getOnSurfaceCompose() {
        return ((long) getOnSurface()) << 32;
    }

    /**
     * Returns {@link #getSurfaceContainerHigh()} encoded as a 64-bit Jetpack Compose sRGB {@code Color.value}.
     */
    public static long getSurfaceContainerHighCompose() {
        return ((long) getSurfaceContainerHigh()) << 32;
    }

    /**
     * Replaces any surface stop color with live {@link #getSurfaceBaseCompose()} when Material You is active.
     */
    public static long resolveSurfaceBaseCompose(long original) {
        if (!MaterialYouConfig.isMaterialYouEnabled()) {
            return original;
        }
        return getSurfaceBaseCompose();
    }

    /**
     * Returns the 6-stop downward hero cover fade color for TIDAL's Compose Artist Page
     * ({@code ProfileHeaderView}) encoded as a 64-bit Jetpack Compose sRGB {@code Color.value}.
     */
    public static long getArtistHeroFadeStopCompose(int stopIndex) {
        int base = getSurfaceBase();
        int argb;
        switch (stopIndex) {
            case 0:
            case 1:
                argb = withAlpha(base, 0x00);
                break;
            case 2:
                argb = withAlpha(base, 0x1A);
                break;
            case 3:
                argb = withAlpha(base, 0x6E);
                break;
            case 4:
                argb = withAlpha(base, 0xD8);
                break;
            default:
                argb = withAlpha(base, 0xFF);
                break;
        }
        return ((long) argb) << 32;
    }

    /**
     * Returns the Monet container color for the primary circular Artist action button ({@code Play}).
     */
    public static long resolveArtistPrimaryActionBgCompose(long original) {
        if (!MaterialYouConfig.isMaterialYouEnabled() || !MaterialYouConfig.isExpressiveArtistsEnabled()) {
            return original;
        }
        return ((long) getPrimaryAccent()) << 32;
    }

    /**
     * Returns the Monet content/icon color for the primary circular Artist action button ({@code Play}).
     */
    public static long resolveArtistPrimaryActionFgCompose(long original) {
        if (!MaterialYouConfig.isMaterialYouEnabled() || !MaterialYouConfig.isExpressiveArtistsEnabled()) {
            return original;
        }
        return ((long) getOnPrimary()) << 32;
    }

    /**
     * Returns the Monet container color for secondary circular Artist action buttons ({@code Follow}, {@code Share}, {@code Edit}).
     */
    public static long resolveArtistSecondaryActionBgCompose(long original) {
        if (!MaterialYouConfig.isMaterialYouEnabled() || !MaterialYouConfig.isExpressiveArtistsEnabled()) {
            return original;
        }
        return ((long) withAlpha(getSurfaceContainerHigh(), 0xD4)) << 32;
    }

    /**
     * Returns the Monet content/icon color for secondary circular Artist action buttons.
     */
    public static long resolveArtistSecondaryActionFgCompose(long original) {
        if (!MaterialYouConfig.isMaterialYouEnabled() || !MaterialYouConfig.isExpressiveArtistsEnabled()) {
            return original;
        }
        return ((long) getOnSurface()) << 32;
    }

    /**
     * Returns the Monet active tab indicator ARGB color for Artist Page tabs ({@code All | Music | About}).
     */
    public static int getArtistTabIndicatorArgb() {
        return getPrimaryAccent();
    }

    /**
     * Safeguard for Material 3 {@code ScaffoldKt.Scaffold-TvnljyQ} container color:
     * lifts empty/unspecified, black/dark-zinc, and transparent scaffold defaults to live Monet {@code surfaceBase}
     * whenever AMOLED pure black is disabled.
     */
    public static long remapScaffoldContainerColor(long composeColor) {
        if (!MaterialYouConfig.isMaterialYouEnabled() || isEffectiveAmoledBlack()) {
            return composeColor;
        }
        if (composeColor == 0L || composeColor == 16L) {
            long target = getSurfaceBaseCompose();
            logRemapThrottled("scaffold-empty", composeColor, target);
            return target;
        }
        long remapped = remapComposeColor(composeColor);
        if (remapped != composeColor) {
            logRemapThrottled("scaffold-remap", composeColor, remapped);
            return remapped;
        }
        if ((composeColor & 0x3FL) == 0L && (((int) (composeColor >>> 32)) & 0xFF000000) == 0) {
            long target = getSurfaceBaseCompose();
            logRemapThrottled("scaffold-transparent", composeColor, target);
            return target;
        }
        return composeColor;
    }

    /**
     * Live draw-time interception for Compose {@code BackgroundNode.drawRect} / {@code drawOutline}
     * so nodes created before Activity theme attach still paint live Monet surfaces without waiting
     * for recomposition.
     */
    public static long remapBackgroundDrawColor(long composeColor) {
        long remapped = remapComposeColor(composeColor);
        trackFragmentComposeContentDraw(remapped);
        logBgDrawSampleIfBudget(composeColor, remapped);
        if (remapped != composeColor) {
            logRemapThrottled("bgnode-draw", composeColor, remapped);
        }
        return remapped;
    }

    private static void trackFragmentComposeContentDraw(long remapped) {
        if (!MaterialYouConfig.isMaterialYouEnabled() || isEffectiveAmoledBlack()) {
            return;
        }
        if ((remapped & 0x3FL) != 0L) {
            return;
        }
        int argb = (int) (remapped >>> 32);
        if ((argb & 0xFF000000) != 0xFF000000 || argb == getSurfaceBase()) {
            return;
        }
        WeakReference<View> activeRef = activeFragmentComposeViewRef;
        View activeView = (activeRef != null) ? activeRef.get() : null;
        if (activeView == null || !activeView.isAttachedToWindow()) {
            return;
        }
        Integer state;
        synchronized (COMPOSE_HOST_CLASSIFICATION) {
            state = COMPOSE_HOST_CLASSIFICATION.get(activeView);
        }
        if (state == null || state == 0) {
            return;
        }
        if (state == 2) {
            boolean alreadyTriggered;
            synchronized (FRAGMENT_COMPOSE_AUTO_CONTENT_TRIGGERED) {
                alreadyTriggered = (FRAGMENT_COMPOSE_AUTO_CONTENT_TRIGGERED.put(activeView, Boolean.TRUE) != null);
            }
            if (!alreadyTriggered) {
                scheduleFragmentComposeLayerInvalidate(activeView, "autoPostFadeContent");
            }
        }
    }

    private static void logBgDrawSampleIfBudget(long inCompose, long outCompose) {
        if (bgDrawDiagBudget <= 0 || (inCompose & 0x3FL) != 0L) {
            return;
        }
        int inArgb = (int) (inCompose >>> 32);
        if ((inArgb & 0xFF000000) == 0) {
            return;
        }
        try {
            synchronized (BG_DRAW_DIAG_SEEN) {
                if (bgDrawDiagBudget <= 0 || bgDrawDiagCount >= BG_DRAW_DIAG_SEEN.length) {
                    return;
                }
                for (int i = 0; i < bgDrawDiagCount; i++) {
                    if (BG_DRAW_DIAG_SEEN[i] == inArgb) {
                        return;
                    }
                }
                BG_DRAW_DIAG_SEEN[bgDrawDiagCount++] = inArgb;
                bgDrawDiagBudget--;
            }
            int outArgb = (int) (outCompose >>> 32);
            Log.d(LOG_TAG, "bgDraw sample in=0x" + Integer.toHexString(inArgb)
                    + " out=0x" + Integer.toHexString(outArgb));
        } catch (Throwable ignored) {
        }
    }

    private static void logRemapThrottled(String tag, long fromCompose, long toCompose) {
        long now = SystemClock.uptimeMillis();
        if ((now - lastRemapLogUptimeMs) < 5000L) {
            return;
        }
        lastRemapLogUptimeMs = now;
        try {
            int fromArgb = (int) (fromCompose >>> 32);
            int toArgb = (int) (toCompose >>> 32);
            Log.d(LOG_TAG, tag + " 0x" + Integer.toHexString(fromArgb)
                    + " -> 0x" + Integer.toHexString(toArgb)
                    + " (src=" + sourceName(lastPaletteSource) + ")");
        } catch (Throwable ignored) {
        }
    }

    // ---- Material 3 Expressive Shape / Border Radius Remapping ----

    public static int remapMarketBorderRadiusDp(int dp) {
        if (!MaterialYouConfig.isExpressiveShapesEnabled()) {
            return dp;
        }
        if (dp <= 0 || dp >= 99) {
            return dp;
        }
        if (dp <= 4) {
            return 12;
        }
        if (dp <= 8) {
            return 18;
        }
        if (dp <= 12) {
            return 22;
        }
        if (dp <= 16) {
            return 26;
        }
        if (dp <= 24) {
            return 28;
        }
        return dp;
    }

    public static float remapWaveCornerRadiusDp(float dp) {
        if (!MaterialYouConfig.isExpressiveShapesEnabled()) {
            return dp;
        }
        if (dp <= 0f || dp >= 99f) {
            return dp;
        }
        if (dp <= 4f) {
            return 8f;
        }
        if (dp <= 8f) {
            return 14f;
        }
        if (dp <= 12f) {
            return 18f;
        }
        if (dp <= 16f) {
            return 22f;
        }
        if (dp <= 20f) {
            return 26f;
        }
        if (dp <= 24f) {
            return 28f;
        }
        return dp;
    }

    // ---- Window & Legacy XML Surface Tinting ----

    private static void disableForceDark(View view) {
        if (view != null && Build.VERSION.SDK_INT >= 29) {
            try {
                view.setForceDarkAllowed(false);
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * Configures light/dark status & navigation bar icon appearance cleanly on API 30+ (with API 23-29 fallback).
     */
    public static void applySystemBarAppearance(Window window, boolean lightBoth) {
        applySystemBarAppearance(window, lightBoth, lightBoth);
    }

    /**
     * Configures independent light/dark icon appearance for status bar and navigation bar.
     */
    @SuppressWarnings("deprecation")
    public static void applySystemBarAppearance(Window window, boolean lightStatusBar, boolean lightNavBar) {
        if (window == null) {
            return;
        }
        try {
            if (Build.VERSION.SDK_INT >= 30) {
                WindowInsetsController wic = window.getInsetsController();
                if (wic != null) {
                    int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                            | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                    int value = (lightStatusBar ? WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS : 0)
                            | (lightNavBar ? WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS : 0);
                    wic.setSystemBarsAppearance(value, mask);
                }
            }
            View decor = window.getDecorView();
            if (decor != null && Build.VERSION.SDK_INT >= 23 && Build.VERSION.SDK_INT < 30) {
                int vis = decor.getSystemUiVisibility();
                if (lightStatusBar) {
                    vis |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                } else {
                    vis &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                }
                if (Build.VERSION.SDK_INT >= 26) {
                    if (lightNavBar) {
                        vis |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                    } else {
                        vis &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                    }
                }
                decor.setSystemUiVisibility(vis);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void applyWindowSurface(Window window, int bg) {
        window.setBackgroundDrawable(new ColorDrawable(bg));
        if (Build.VERSION.SDK_INT < 35) {
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
        }
        applySystemBarAppearance(window, isLightMode());
    }

    private static boolean hasDifferentSolidBg(View view, int bg) {
        Drawable existing = view.getBackground();
        return !(existing instanceof ColorDrawable) || ((ColorDrawable) existing).getColor() != bg;
    }

    private static void ensureViewSolidBg(View view, int bg) {
        if (view == null) {
            return;
        }
        disableForceDark(view);
        if (hasDifferentSolidBg(view, bg)) {
            view.setBackgroundColor(bg);
        }
    }

    private static void ensureContainerAndComposeRootBg(View container, int bg) {
        if (container == null) {
            return;
        }
        ensureViewSolidBg(container, bg);
        if (container instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) container;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                View child = vg.getChildAt(i);
                if (child == null) {
                    continue;
                }
                if (cachedFragmentContainerId != 0 && child.getId() == cachedFragmentContainerId) {
                    ensureContainerAndComposeRootBg(child, bg);
                } else if ("androidx.compose.ui.platform.ComposeView".equals(child.getClass().getName())) {
                    ensureViewSolidBg(child, bg);
                    if (child instanceof ViewGroup) {
                        ViewGroup cv = (ViewGroup) child;
                        int cvCount = cv.getChildCount();
                        for (int j = 0; j < cvCount; j++) {
                            View grandChild = cv.getChildAt(j);
                            if (grandChild != null
                                    && "androidx.compose.ui.platform.AndroidComposeView".equals(grandChild.getClass().getName())) {
                                ensureViewSolidBg(grandChild, bg);
                            }
                        }
                    }
                }
            }
        }
    }

    private static View tintContainerAndFragmentRoots(Activity activity, int bg) {
        View container = (cachedContainerId != 0) ? activity.findViewById(cachedContainerId) : null;
        if (container != null) {
            ensureContainerAndComposeRootBg(container, bg);
        }
        View fragContainer = (cachedFragmentContainerId != 0) ? activity.findViewById(cachedFragmentContainerId) : null;
        if (fragContainer != null) {
            ensureContainerAndComposeRootBg(fragContainer, bg);
        }
        return (fragContainer != null) ? fragContainer : container;
    }

    private static View findAndroidComposeChild(View root) {
        if (root == null) {
            return null;
        }
        if ("androidx.compose.ui.platform.AndroidComposeView".equals(root.getClass().getName())) {
            return root;
        }
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                View child = vg.getChildAt(i);
                if (child != null && "androidx.compose.ui.platform.AndroidComposeView".equals(child.getClass().getName())) {
                    return child;
                }
            }
        }
        return null;
    }

    private static boolean isViewAnimating(View view) {
        if (view == null) {
            return false;
        }
        Animation anim = view.getAnimation();
        return anim != null && !anim.hasEnded();
    }

    private static boolean hasActiveViewAnimation(View view) {
        if (view == null) {
            return false;
        }
        if (isViewAnimating(view)) {
            return true;
        }
        ViewParent parent = view.getParent();
        return (parent instanceof View) && isViewAnimating((View) parent);
    }

    /**
     * Pre-tints and registers a newly created Compose fragment root ({@code HomeScreenFragment} or
     * {@code MyCollectionScreenFragment}) in {@code onCreateView} so its {@code ComposeView} and
     * child {@code AndroidComposeView} never flash or settle with a black background or stale
     * hardware {@code RenderNode} layers.
     */
    public static void prepareFragmentComposeView(View view) {
        if (view == null || !MaterialYouConfig.isMaterialYouEnabled()) {
            return;
        }
        try {
            disableForceDark(view);
            synchronized (KNOWN_FRAGMENT_COMPOSE_HOSTS) {
                KNOWN_FRAGMENT_COMPOSE_HOSTS.put(view, Boolean.TRUE);
            }
            if (isEffectiveAmoledBlack()) {
                return;
            }
            ensureResourceIdsResolved(view.getContext());
            int bg = getSurfaceBase();
            ensureViewSolidBg(view, bg);

            if (view instanceof ViewGroup) {
                ((ViewGroup) view).setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
                    @Override
                    public void onChildViewAdded(View parent, View child) {
                        try {
                            if (child != null && "androidx.compose.ui.platform.AndroidComposeView".equals(child.getClass().getName())) {
                                synchronized (KNOWN_FRAGMENT_COMPOSE_HOSTS) {
                                    KNOWN_FRAGMENT_COMPOSE_HOSTS.put(child, Boolean.TRUE);
                                }
                                ensureViewSolidBg(child, getSurfaceBase());
                                activeFragmentComposeViewRef = new WeakReference<>(child);
                                synchronized (COMPOSE_HOST_CLASSIFICATION) {
                                    COMPOSE_HOST_CLASSIFICATION.put(child, 1);
                                }
                                synchronized (FRAGMENT_COMPOSE_FIRST_SEEN_MS) {
                                    FRAGMENT_COMPOSE_FIRST_SEEN_MS.remove(child);
                                }
                                synchronized (FRAGMENT_COMPOSE_AUTO_CONTENT_TRIGGERED) {
                                    FRAGMENT_COMPOSE_AUTO_CONTENT_TRIGGERED.remove(child);
                                }
                                if (child.isAttachedToWindow()) {
                                    scheduleFragmentComposeLayerInvalidate(child, "childAdded");
                                }
                            }
                        } catch (Throwable ignored) {
                        }
                    }

                    @Override
                    public void onChildViewRemoved(View parent, View child) {
                    }
                });
            }

            view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View v) {
                    try {
                        if (!MaterialYouConfig.isMaterialYouEnabled() || isEffectiveAmoledBlack()) {
                            return;
                        }
                        ensureResourceIdsResolved(v.getContext());
                        int liveBg = getSurfaceBase();
                        ensureViewSolidBg(v, liveBg);
                        ViewParent p = v.getParent();
                        if (p instanceof View) {
                            ensureViewSolidBg((View) p, liveBg);
                        }
                        View acv = findAndroidComposeChild(v);
                        if (acv != null) {
                            synchronized (KNOWN_FRAGMENT_COMPOSE_HOSTS) {
                                KNOWN_FRAGMENT_COMPOSE_HOSTS.put(acv, Boolean.TRUE);
                            }
                            ensureViewSolidBg(acv, liveBg);
                            activeFragmentComposeViewRef = new WeakReference<>(acv);
                            synchronized (COMPOSE_HOST_CLASSIFICATION) {
                                COMPOSE_HOST_CLASSIFICATION.put(acv, 1);
                            }
                            synchronized (FRAGMENT_COMPOSE_FIRST_SEEN_MS) {
                                FRAGMENT_COMPOSE_FIRST_SEEN_MS.remove(acv);
                            }
                            synchronized (FRAGMENT_COMPOSE_AUTO_CONTENT_TRIGGERED) {
                                FRAGMENT_COMPOSE_AUTO_CONTENT_TRIGGERED.remove(acv);
                            }
                            scheduleFragmentComposeLayerInvalidate(acv, "viewAttached");
                        }
                    } catch (Throwable ignored) {
                    }
                }

                @Override
                public void onViewDetachedFromWindow(View v) {
                }
            });
        } catch (Throwable ignored) {
        }
    }

    /**
     * Disables legacy View {@code AlphaAnimation} ({@code R.anim.fade_in} / {@code fade_out})
     * in {@code FragmentTransaction.setCustomAnimations} strictly for {@code HomeScreenFragment}
     * and {@code MyCollectionScreenFragment} transitions (both entering and back-stack popEnter)
     * so HWUI never blackens nested Compose {@code RenderNode} layers. Search and Explore keep their
     * default animations.
     */
    public static boolean shouldDisableFragmentFadeAnim(Activity activity, Object incomingFragment) {
        if (!MaterialYouConfig.isMaterialYouEnabled() || isEffectiveAmoledBlack()) {
            return false;
        }
        try {
            if (incomingFragment != null) {
                String cls = incomingFragment.getClass().getName();
                if ("com.aspiro.wamp.features.home.HomeScreenFragment".equals(cls)
                        || "com.aspiro.wamp.mycollectionscreen.presentation.MyCollectionScreenFragment".equals(cls)) {
                    return true;
                }
            }
            if (activity != null) {
                captureContext(activity);
                if (cachedFragmentContainerId != 0) {
                    View fragContainer = activity.findViewById(cachedFragmentContainerId);
                    if (fragContainer instanceof ViewGroup) {
                        ViewGroup vg = (ViewGroup) fragContainer;
                        int count = vg.getChildCount();
                        synchronized (KNOWN_FRAGMENT_COMPOSE_HOSTS) {
                            for (int i = 0; i < count; i++) {
                                if (Boolean.TRUE.equals(KNOWN_FRAGMENT_COMPOSE_HOSTS.get(vg.getChildAt(i)))) {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Refreshes Monet surface paint and hardware layers when {@code HomeScreenFragment} or
     * {@code MyCollectionScreenFragment} resumes or re-triggers a tab reload.
     */
    public static void onFragmentComposeResume(View fragmentRootView) {
        if (fragmentRootView == null
                || !MaterialYouConfig.isMaterialYouEnabled()
                || isEffectiveAmoledBlack()) {
            return;
        }
        try {
            ensureResourceIdsResolved(fragmentRootView.getContext());
            int bg = getSurfaceBase();
            ensureViewSolidBg(fragmentRootView, bg);
            ViewParent p = fragmentRootView.getParent();
            if (p instanceof View) {
                ensureViewSolidBg((View) p, bg);
            }
            View acv = findAndroidComposeChild(fragmentRootView);
            if (acv != null) {
                synchronized (KNOWN_FRAGMENT_COMPOSE_HOSTS) {
                    KNOWN_FRAGMENT_COMPOSE_HOSTS.put(acv, Boolean.TRUE);
                }
                ensureViewSolidBg(acv, bg);
                activeFragmentComposeViewRef = new WeakReference<>(acv);
                synchronized (FRAGMENT_COMPOSE_AUTO_CONTENT_TRIGGERED) {
                    FRAGMENT_COMPOSE_AUTO_CONTENT_TRIGGERED.remove(acv);
                }
                scheduleFragmentComposeLayerInvalidate(acv, "fragmentResume");
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Live {@code AndroidComposeView.dispatchDraw(Canvas)} hook entry.
     * For main tab fragment hosts (under {@code R.id.fragmentContainer}, never {@code R.id.appScaffold}),
     * ensures solid Monet background paint on the canvas before Compose draws, locks ForceDark off,
     * and returns {@code true} on first draw and once after {@code res/anim/fade_in} finishes so
     * Compose invalidates any stale/blackened hardware RenderNode layers.
     */
    public static boolean onComposeDispatchDraw(View composeView, Canvas canvas) {
        if (composeView == null || !MaterialYouConfig.isMaterialYouEnabled()) {
            return false;
        }
        try {
            PaletteSnapshot snap = snapshot();
            int syncKey = computePaletteSyncKey(snap);
            if (lastWave2SyncHash != syncKey || lastWave2StaticSyncHash != syncKey) {
                syncWave2IfActive();
            }
        } catch (Throwable ignored) {
        }
        if (isEffectiveAmoledBlack()) {
            return false;
        }
        if (ExpressiveBlurKit.CAPTURING_BACKDROP) {
            if (canvas != null) {
                canvas.drawColor(getSurfaceBase());
            }
            return false;
        }
        try {
            if (cachedFragmentContainerId == 0) {
                ensureResourceIdsResolved(composeView.getContext());
            }
            int state;
            synchronized (COMPOSE_HOST_CLASSIFICATION) {
                Integer cached = COMPOSE_HOST_CLASSIFICATION.get(composeView);
                if (cached != null) {
                    state = cached;
                } else {
                    state = classifyComposeHost(composeView);
                    if (state != 0 || (composeView.isAttachedToWindow() && cachedFragmentContainerId != 0)) {
                        COMPOSE_HOST_CLASSIFICATION.put(composeView, state);
                    }
                }
            }
            if (state == 0) {
                return false;
            }
            WeakReference<View> activeRef = activeFragmentComposeViewRef;
            View currentActive = (activeRef != null) ? activeRef.get() : null;
            if (currentActive == null
                    || !currentActive.isAttachedToWindow()
                    || (currentActive != composeView && composeView.isAttachedToWindow() && !hasActiveViewAnimation(composeView))) {
                activeFragmentComposeViewRef = new WeakReference<>(composeView);
            }
            int bg = getSurfaceBase();
            ensureViewSolidBg(composeView, bg);
            ViewParent parent = composeView.getParent();
            if (parent instanceof View) {
                ensureViewSolidBg((View) parent, bg);
            }
            if (canvas != null) {
                canvas.drawColor(bg);
            }
            boolean shouldInvalidate = (state == 1) && handleInitialFragmentComposeDraw(composeView, bg);
            boolean pendingContentInval;
            synchronized (FRAGMENT_COMPOSE_PENDING_INVAL) {
                pendingContentInval = Boolean.TRUE.equals(FRAGMENT_COMPOSE_PENDING_INVAL.remove(composeView));
            }
            if (pendingContentInval) {
                try {
                    Log.d(LOG_TAG, "fragCompose contentInvalidateLayers id=0x"
                            + Integer.toHexString(System.identityHashCode(composeView))
                            + " bg=#" + hex6(bg));
                } catch (Throwable ignored) {
                }
                shouldInvalidate = true;
            }
            return shouldInvalidate;
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Notifies the active tab fragment's {@code AndroidComposeView} that async page content (e.g.
     * Homepage's {@code LazyColumn} after leaving {@code HomeScreenLoading}) has mounted, so it
     * schedules a throttled next-frame hardware layer invalidation after layout settles.
     */
    public static void notifyFragmentContentMounted() {
        if (!MaterialYouConfig.isMaterialYouEnabled() || isEffectiveAmoledBlack()) {
            return;
        }
        try {
            WeakReference<View> activeRef = activeFragmentComposeViewRef;
            View composeView = (activeRef != null) ? activeRef.get() : null;
            if (composeView == null || !composeView.isAttachedToWindow()) {
                return;
            }
            long now = SystemClock.uptimeMillis();
            synchronized (FRAGMENT_COMPOSE_LAST_CONTENT_INVAL_MS) {
                Long lastMs = FRAGMENT_COMPOSE_LAST_CONTENT_INVAL_MS.get(composeView);
                if (lastMs != null && (now - lastMs) < 250L) {
                    return;
                }
                FRAGMENT_COMPOSE_LAST_CONTENT_INVAL_MS.put(composeView, now);
            }
            int bg = getSurfaceBase();
            ensureViewSolidBg(composeView, bg);
            ViewParent parent = composeView.getParent();
            if (parent instanceof View) {
                ensureViewSolidBg((View) parent, bg);
            }
            scheduleFragmentComposeLayerInvalidate(composeView, "contentMounted");
        } catch (Throwable ignored) {
        }
    }

    private static void resetLayerTypeAndInvalidate(View composeView) {
        if (composeView == null || !composeView.isAttachedToWindow()) {
            return;
        }
        if (composeView.getLayerType() != View.LAYER_TYPE_NONE) {
            composeView.setLayerType(View.LAYER_TYPE_NONE, null);
        }
        ViewParent p = composeView.getParent();
        if (p instanceof View) {
            View pv = (View) p;
            if (pv.getLayerType() != View.LAYER_TYPE_NONE) {
                pv.setLayerType(View.LAYER_TYPE_NONE, null);
            }
            pv.invalidate();
        }
        composeView.invalidate();
    }

    private static void scheduleFragmentComposeLayerInvalidate(final View composeView, final String reason) {
        if (composeView == null || !composeView.isAttachedToWindow()) {
            return;
        }
        try {
            Log.d(LOG_TAG, "fragCompose scheduleInval reason=" + reason
                    + " id=0x" + Integer.toHexString(System.identityHashCode(composeView)));
        } catch (Throwable ignored) {
        }
        final Runnable trigger = new Runnable() {
            @Override
            public void run() {
                try {
                    if (!composeView.isAttachedToWindow()) {
                        return;
                    }
                    synchronized (FRAGMENT_COMPOSE_PENDING_INVAL) {
                        FRAGMENT_COMPOSE_PENDING_INVAL.put(composeView, Boolean.TRUE);
                    }
                    resetLayerTypeAndInvalidate(composeView);
                } catch (Throwable ignored) {
                }
            }
        };
        composeView.post(trigger);
        composeView.postDelayed(trigger, 80L);
        composeView.postDelayed(trigger, 220L);
    }

    private static int classifyComposeHost(View composeView) {
        synchronized (KNOWN_FRAGMENT_COMPOSE_HOSTS) {
            if (Boolean.TRUE.equals(KNOWN_FRAGMENT_COMPOSE_HOSTS.get(composeView))) {
                return 1;
            }
            ViewParent directParent = composeView.getParent();
            if (directParent instanceof View
                    && Boolean.TRUE.equals(KNOWN_FRAGMENT_COMPOSE_HOSTS.get((View) directParent))) {
                KNOWN_FRAGMENT_COMPOSE_HOSTS.put(composeView, Boolean.TRUE);
                return 1;
            }
        }
        ViewParent parent = composeView.getParent();
        for (int hop = 0; hop < 5 && parent != null; hop++, parent = parent.getParent()) {
            if (parent instanceof View) {
                int pid = ((View) parent).getId();
                if (cachedAppScaffoldId != 0 && pid == cachedAppScaffoldId) {
                    return 0;
                }
                if (cachedFragmentContainerId != 0 && pid == cachedFragmentContainerId) {
                    return 1;
                }
            }
        }
        return 0;
    }

    private static boolean handleInitialFragmentComposeDraw(final View composeView, int bg) {
        long now = SystemClock.uptimeMillis();
        Long firstSeen;
        synchronized (FRAGMENT_COMPOSE_FIRST_SEEN_MS) {
            firstSeen = FRAGMENT_COMPOSE_FIRST_SEEN_MS.get(composeView);
            if (firstSeen == null) {
                FRAGMENT_COMPOSE_FIRST_SEEN_MS.put(composeView, now);
            }
        }
        if (firstSeen == null) {
            synchronized (BG_DRAW_DIAG_SEEN) {
                bgDrawDiagCount = 0;
                bgDrawDiagBudget = 8;
            }
            try {
                Log.d(LOG_TAG, "fragCompose attach id=0x"
                        + Integer.toHexString(System.identityHashCode(composeView))
                        + " bg=#" + hex6(bg));
            } catch (Throwable ignored) {
            }
            composeView.postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        resetLayerTypeAndInvalidate(composeView);
                    } catch (Throwable ignored) {
                    }
                }
            }, 280L);
            return true;
        }
        if (hasActiveViewAnimation(composeView)) {
            return true;
        }
        if ((now - firstSeen) >= 240L) {
            synchronized (COMPOSE_HOST_CLASSIFICATION) {
                COMPOSE_HOST_CLASSIFICATION.put(composeView, 2);
            }
            try {
                Log.d(LOG_TAG, "fragCompose postFade invalidateLayers id=0x"
                        + Integer.toHexString(System.identityHashCode(composeView))
                        + " bg=#" + hex6(bg));
            } catch (Throwable ignored) {
            }
            return true;
        }
        return false;
    }

    private static void invalidateSubtree(View view, int depth) {
        if (view == null || depth > 5) {
            return;
        }
        if (cachedAppScaffoldId != 0 && view.getId() == cachedAppScaffoldId) {
            return;
        }
        view.invalidate();
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                invalidateSubtree(vg.getChildAt(i), depth + 1);
            }
        }
    }

    private static boolean isDecorTracked(View decor) {
        synchronized (TRACKED_DECORS) {
            return TRACKED_DECORS.containsKey(decor);
        }
    }

    private static void syncWave2IfActive() {
        syncWave2StaticColors();
        WeakReference<Object> ref = activeWave2ColorsRef;
        Object waveColors = (ref != null) ? ref.get() : null;
        if (waveColors != null) {
            syncWave2Colors(waveColors);
        }
    }

    public static void initEarly(Activity activity) {
        if (activity == null || !MaterialYouConfig.isMaterialYouEnabled()) {
            return;
        }
        try {
            captureContext(activity);
            if (lastPaletteSource < SOURCE_ACTIVITY) {
                invalidatePaletteCache();
            }
            ensureLifecycleRegistered(activity);
            syncWave2IfActive();
            int bg = getSurfaceBase();
            Window window = activity.getWindow();
            if (window != null) {
                applyWindowSurface(window, bg);
                View decor = window.getDecorView();
                if (decor != null) {
                    disableForceDark(decor);
                    decor.setBackgroundColor(bg);
                }
            }
            try {
                Log.d(LOG_TAG, "initEarly " + activity.getClass().getSimpleName()
                        + " light=" + isLightMode() + " bg=#" + hex6(bg));
            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {
        }
    }

    public static void applyActivityTheme(Activity activity) {
        if (activity == null || !MaterialYouConfig.isMaterialYouEnabled()) {
            return;
        }
        try {
            captureContext(activity);
            PaletteSnapshot prev = cachedSnapshot;
            int prevBase = (prev != null) ? prev.surfaceBase : 0;
            if (lastPaletteSource < SOURCE_ACTIVITY) {
                invalidatePaletteCache();
            }
            ensureLifecycleRegistered(activity);
            syncWave2IfActive();
            Window window = activity.getWindow();
            if (window == null) {
                return;
            }
            int bg = getSurfaceBase();
            applyWindowSurface(window, bg);
            final View decor = window.getDecorView();
            if (decor != null) {
                boolean isInitialAttach = !isDecorTracked(decor);
                disableForceDark(decor);
                decor.setBackgroundColor(bg);
                View container = tintContainerAndFragmentRoots(activity, bg);
                adaptLegacyXmlViewTree(decor, 0, false);
                registerDecorLayoutTint(decor);
                if (prevBase != bg || isInitialAttach) {
                    decor.invalidate();
                    invalidateSubtree(container, 0);
                }
            }
            dev.materialtidal.extension.tidal.navbar.ExpressiveProgressiveBlurOverlayView
                    .attachToActivity(activity);
            dev.materialtidal.extension.tidal.navbar.ExpressiveProgressiveBlurOverlayView
                    .invalidateActive();
        } catch (Throwable ignored) {
        }
    }

    private static void ensureLifecycleRegistered(Activity activity) {
        if (lifecycleRegistered) {
            return;
        }
        Application app = activity.getApplication();
        if (app == null) {
            return;
        }
        synchronized (MaterialYouColorEngine.class) {
            if (lifecycleRegistered) {
                return;
            }
            lifecycleRegistered = true;
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityCreated(Activity act, Bundle savedInstanceState) {
                    applyActivityTheme(act);
                }

                @Override
                public void onActivityStarted(Activity act) {
                }

                @Override
                public void onActivityResumed(Activity act) {
                    applyActivityTheme(act);
                }

                @Override
                public void onActivityPaused(Activity act) {
                }

                @Override
                public void onActivityStopped(Activity act) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity act, Bundle outState) {
                }

                @Override
                public void onActivityDestroyed(Activity act) {
                }
            });
        }
    }

    private static void scheduleDecorAdapt(final View decor) {
        long now = SystemClock.uptimeMillis();
        boolean scheduleFollowUp = false;
        synchronized (TRACKED_DECORS) {
            Long last = TRACKED_DECORS.get(decor);
            if (last != null && (now - last) < 150L) {
                if (!Boolean.TRUE.equals(PENDING_RETINT.get(decor))) {
                    PENDING_RETINT.put(decor, Boolean.TRUE);
                    scheduleFollowUp = true;
                }
            } else {
                TRACKED_DECORS.put(decor, now);
            }
        }
        if (scheduleFollowUp) {
            decor.postDelayed(new Runnable() {
                @Override
                public void run() {
                    synchronized (TRACKED_DECORS) {
                        PENDING_RETINT.remove(decor);
                        if (!decor.isAttachedToWindow()) {
                            return;
                        }
                        TRACKED_DECORS.put(decor, SystemClock.uptimeMillis());
                    }
                    adaptLegacyXmlViewTree(decor, 0, false);
                }
            }, 160L);
            return;
        }
        adaptLegacyXmlViewTree(decor, 0, false);
    }

    private static void registerDecorLayoutTint(final View decor) {
        synchronized (TRACKED_DECORS) {
            if (TRACKED_DECORS.containsKey(decor)) {
                return;
            }
            TRACKED_DECORS.put(decor, 0L);
        }
        ViewTreeObserver vto = decor.getViewTreeObserver();
        if (vto == null || !vto.isAlive()) {
            return;
        }
        vto.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                scheduleDecorAdapt(decor);
            }
        });
        vto.addOnScrollChangedListener(new ViewTreeObserver.OnScrollChangedListener() {
            @Override
            public void onScrollChanged() {
                if (isLightMode()) {
                    scheduleDecorAdapt(decor);
                }
            }
        });
    }

    /**
     * Immediately adapts a dynamically inflated or RecyclerView-attached XML view subtree for Light Mode.
     */
    public static void adaptSubtreeForLightMode(View root) {
        if (root == null || !MaterialYouConfig.isMaterialYouEnabled() || !isLightMode()) {
            return;
        }
        adaptLegacyXmlViewTree(root, 0, false);
    }

    private static final int VEC_CLASS_OTHER = 0;
    private static final int VEC_CLASS_MONO_WHITE = 1;
    private static final int VEC_CLASS_MONO_LIGHT_GRAY = 2;
    private static final int VEC_CLASS_MONO_CYAN = 3;
    private static final int VEC_CLASS_MONO_GOLD = 4;

    private static final int TAG_ADAPTED_LIGHT_KEY = 0x7A4D5411;
    private static final int TAG_ADAPTED_ICON_BTN_KEY = 0x7A4D5412;

    private static void adaptLegacyXmlViewTree(View view, int depth, boolean insideDarkSurface) {
        if (view == null || depth > 16) {
            return;
        }
        try {
            disableForceDark(view);
            int viewId = view.getId();
            if (cachedAppScaffoldId != 0 && viewId == cachedAppScaffoldId) {
                return;
            }
            if ((cachedContainerId != 0 && viewId == cachedContainerId)
                    || (cachedFragmentContainerId != 0 && viewId == cachedFragmentContainerId)) {
                ensureContainerAndComposeRootBg(view, getSurfaceBase());
            }
            String clsName = view.getClass().getName();
            if (clsName.startsWith("dev.materialtidal.")
                    || "androidx.compose.ui.platform.AndroidComposeView".equals(clsName)) {
                return;
            }

            PaletteSnapshot snap = snapshot();
            boolean lightMode = snap.isLightMode;
            boolean explicitStyled = Boolean.TRUE.equals(view.getTag(TAG_EXPRESSIVE_STYLED));

            if (lightMode && !explicitStyled && clsName.endsWith(".IconAndTextButton")) {
                adaptIconAndTextButton(view, snap);
                return;
            }

            boolean childInsideDark = insideDarkSurface;
            int adaptedBg = adaptViewBackgroundForXml(view, snap, lightMode, explicitStyled);
            if (adaptedBg != 0) {
                int bgAlpha = (adaptedBg >>> 24) & 0xFF;
                int bgLuma = luma(adaptedBg);
                if (bgAlpha >= 0x40 && bgLuma < 115) {
                    childInsideDark = true;
                } else if (bgAlpha >= 0xB0 && bgLuma >= 150) {
                    childInsideDark = false;
                }
            }

            if (lightMode && !explicitStyled) {
                if (!childInsideDark) {
                    if (view instanceof CompoundButton) {
                        adaptCompoundButton((CompoundButton) view, snap);
                    }
                    if (view instanceof TextView) {
                        adaptTextView((TextView) view, snap);
                    }
                    if (view instanceof ImageView) {
                        adaptImageView((ImageView) view, snap);
                    }
                    if (view instanceof ProgressBar) {
                        adaptProgressBar((ProgressBar) view, snap);
                    }
                    if (isToolbarView(view)) {
                        adaptToolbar(view, snap);
                    }
                }
            }

            if (view instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) view;
                int count = vg.getChildCount();
                for (int i = 0; i < count; i++) {
                    adaptLegacyXmlViewTree(vg.getChildAt(i), depth + 1, childInsideDark);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void adaptIconAndTextButton(View button, PaletteSnapshot snap) {
        boolean isPrimary = resolveIconAndTextUseLightTheme(button);
        boolean enabled = button.isEnabled();
        int key = computePaletteSyncKey(snap) ^ (isPrimary ? 0x101 : 0x202) ^ (enabled ? 0x404 : 0x808);
        Object prevKey = button.getTag(TAG_ADAPTED_ICON_BTN_KEY);
        if (prevKey instanceof Integer && ((Integer) prevKey) == key) {
            return;
        }
        button.setTag(TAG_ADAPTED_ICON_BTN_KEY, key);

        float density = button.getResources().getDisplayMetrics().density;
        float radius = 24f * density;
        int bgColor = isPrimary
                ? snap.primaryAccent
                : blendRgb(snap.surfaceContainerHigh, snap.primaryAccent, 0.14f);
        int fgColor = isPrimary ? snap.onPrimary : snap.onSurface;
        int rippleColor = isPrimary
                ? withAlpha(snap.onPrimary, 0x26)
                : withAlpha(snap.primaryAccent, 0x2A);

        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setCornerRadius(radius);
        shape.setColor(bgColor);
        if (!isPrimary) {
            shape.setStroke(Math.max(1, Math.round(density)), withAlpha(snap.outlineVariant, 0x90));
        }

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(radius);
        mask.setColor(0xFFFFFFFF);

        button.setBackground(new RippleDrawable(ColorStateList.valueOf(rippleColor), shape, mask));
        button.setAlpha(enabled ? 1f : 0.42f);
        tintIconAndTextButtonChildren(button, fgColor);
    }

    private static void tintIconAndTextButtonChildren(View v, int fgColor) {
        if (v instanceof ImageView) {
            ((ImageView) v).setImageTintList(ColorStateList.valueOf(fgColor));
        } else if (v instanceof TextView) {
            ((TextView) v).setTextColor(fgColor);
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                tintIconAndTextButtonChildren(vg.getChildAt(i), fgColor);
            }
        }
    }

    private static boolean resolveIconAndTextUseLightTheme(View button) {
        try {
            Class<?> cls = button.getClass();
            if (!iconTextBtnReflectionResolved || cachedIconTextBtnClass != cls) {
                Method m = null;
                try {
                    m = cls.getMethod("getUseLightTheme");
                } catch (Throwable ignored) {
                }
                if (m == null) {
                    try {
                        m = cls.getMethod("isUseLightTheme");
                    } catch (Throwable ignored) {
                    }
                }
                cachedGetUseLightThemeMethod = m;
                cachedIconTextBtnClass = cls;
                iconTextBtnReflectionResolved = true;
            }
            if (cachedGetUseLightThemeMethod != null) {
                Object res = cachedGetUseLightThemeMethod.invoke(button);
                if (res instanceof Boolean) {
                    return (Boolean) res;
                }
            }
        } catch (Throwable ignored) {
        }
        return hasDarkTextChild(button);
    }

    private static boolean hasDarkTextChild(View v) {
        if (v instanceof TextView) {
            int c = ((TextView) v).getCurrentTextColor();
            return ((c >>> 24) & 0xFF) >= 0x80 && luma(c) < 110;
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (hasDarkTextChild(vg.getChildAt(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    private static int adaptViewBackgroundForXml(View view, PaletteSnapshot snap, boolean lightMode, boolean explicitStyled) {
        Drawable bg = view.getBackground();
        if (bg == null) {
            return 0;
        }
        if (bg instanceof ColorDrawable) {
            int current = ((ColorDrawable) bg).getColor();
            if (!explicitStyled) {
                int remapped = remapXmlBgArgb(current, snap, lightMode);
                if (remapped != current) {
                    view.setBackgroundColor(remapped);
                    return remapped;
                }
            }
            return current;
        }
        if (bg instanceof GradientDrawable) {
            return adaptGradientDrawableBg(view, (GradientDrawable) bg, snap, lightMode, explicitStyled);
        }
        if (lightMode && !explicitStyled && bg instanceof RippleDrawable) {
            RippleDrawable rd = (RippleDrawable) bg;
            int layerCount = rd.getNumberOfLayers();
            int firstAdapted = 0;
            for (int i = 0; i < layerCount; i++) {
                if (rd.getId(i) == android.R.id.mask) {
                    continue;
                }
                Drawable layer = rd.getDrawable(i);
                int layerColor = 0;
                if (layer instanceof ColorDrawable) {
                    int current = ((ColorDrawable) layer).getColor();
                    int remapped = remapXmlBgArgb(current, snap, true);
                    if (remapped != current) {
                        ((ColorDrawable) layer.mutate()).setColor(remapped);
                    }
                    layerColor = remapped;
                } else if (layer instanceof GradientDrawable && Build.VERSION.SDK_INT >= 24) {
                    layerColor = adaptGradientDrawableInPlace(view, (GradientDrawable) layer, snap, true);
                }
                if (firstAdapted == 0 && layerColor != 0) {
                    firstAdapted = layerColor;
                }
            }
            return firstAdapted;
        }
        return 0;
    }

    private static int adaptGradientDrawableBg(
            View view,
            GradientDrawable gd,
            PaletteSnapshot snap,
            boolean lightMode,
            boolean explicitStyled
    ) {
        if (Build.VERSION.SDK_INT < 24 || gd.getColors() != null) {
            return 0;
        }
        ColorStateList csl = gd.getColor();
        int current = 0;
        if (csl != null) {
            current = csl.isStateful()
                    ? csl.getColorForState(view.getDrawableState(), csl.getDefaultColor())
                    : csl.getDefaultColor();
        }
        if (!explicitStyled && current != 0) {
            int remapped = remapXmlBgArgb(current, snap, lightMode);
            if (remapped != current) {
                Drawable mutated = gd.mutate();
                if (mutated instanceof GradientDrawable) {
                    ((GradientDrawable) mutated).setColor(remapped);
                }
                if (mutated != bgSafe(view)) {
                    view.setBackground(mutated);
                }
                return remapped;
            }
        }
        return current;
    }

    private static Drawable bgSafe(View v) {
        return v.getBackground();
    }

    private static int adaptGradientDrawableInPlace(
            View view,
            GradientDrawable gd,
            PaletteSnapshot snap,
            boolean lightMode
    ) {
        if (Build.VERSION.SDK_INT < 24 || gd.getColors() != null) {
            return 0;
        }
        ColorStateList csl = gd.getColor();
        int current = 0;
        if (csl != null) {
            current = csl.isStateful()
                    ? csl.getColorForState(view.getDrawableState(), csl.getDefaultColor())
                    : csl.getDefaultColor();
        }
        if (current != 0) {
            int remapped = remapXmlBgArgb(current, snap, lightMode);
            if (remapped != current) {
                ((GradientDrawable) gd.mutate()).setColor(remapped);
                return remapped;
            }
        }
        return current;
    }

    private static int remapXmlBgArgb(int argb, PaletteSnapshot snap, boolean lightMode) {
        int alpha = argb & 0xFF000000;
        if (alpha == 0) {
            return argb;
        }
        if (!lightMode) {
            return ((argb & 0xFF000000) == 0xFF000000) ? remapArgb(argb) : argb;
        }
        int rgb = argb & 0x00FFFFFF;
        if (snap.isLightMonetOutputRgb(rgb)) {
            return argb;
        }
        int alphaByte = (alpha >>> 24) & 0xFF;
        if ((rgb == 0x000000 || rgb == 0x080808) && alphaByte == 0xFF) {
            return snap.surfaceBase;
        }
        if (rgb == 0x101010 || rgb == 0x141414 || rgb == 0x1A1A1A || rgb == 0x1C1C1C || rgb == 0x232323) {
            return (alphaByte == 0xFF) ? snap.surfaceLow : argb;
        }
        if ((rgb == 0xFFFFFF || rgb == 0xEBEBFF) && alphaByte >= 0x08 && alphaByte <= 0x40) {
            return withAlpha(snap.onSurface, Math.min(0x28, Math.max(0x16, alphaByte)));
        }
        int mapped = remapUnambiguousDarkTokenForLight(snap, rgb);
        return (mapped == -1) ? argb : (alpha | (mapped & 0x00FFFFFF));
    }

    private static void adaptTextView(TextView tv, PaletteSnapshot snap) {
        int cur = tv.getCurrentTextColor();
        int remapped = remapLightModeForegroundColor(cur, snap, true);
        if (remapped != cur) {
            tv.setTextColor(remapped);
        }
        int hint = tv.getCurrentHintTextColor();
        int remappedHint = remapLightModeForegroundColor(hint, snap, false);
        if (remappedHint != hint) {
            tv.setHintTextColor(remappedHint);
        }
        Drawable[] compounds = tv.getCompoundDrawablesRelative();
        boolean changedCompound = false;
        for (Drawable d : compounds) {
            if (d != null && tintMonochromeVectorDrawable(d, snap)) {
                changedCompound = true;
            }
        }
        if (changedCompound) {
            tv.invalidate();
        }
    }

    private static int remapLightModeForegroundColor(int argb, PaletteSnapshot snap, boolean isPrimaryRole) {
        int alpha = argb & 0xFF000000;
        if (alpha == 0) {
            return argb;
        }
        int rgb = argb & 0x00FFFFFF;
        if (snap.isLightMonetOutputRgb(rgb)) {
            return argb;
        }
        if (rgb == 0x33FFEE || rgb == 0x21FEEC || rgb == 0x66FFF3 || rgb == 0x99FFF7
                || rgb == 0x16D8A7 || rgb == 0x12BF94 || rgb == 0x14998E || rgb == 0x3D8F88) {
            return alpha | (snap.primaryAccent & 0x00FFFFFF);
        }
        if (rgb == 0xFFD432 || rgb == 0xFFBE7D || rgb == 0xFFBF80 || rgb == 0xFFD233) {
            return alpha | (LIGHT_AMBER_ACCENT & 0x00FFFFFF);
        }
        if (rgb == 0xFF3269 || rgb == 0xFF3E33 || rgb == 0xF35E85 || rgb == 0xFF4141) {
            return alpha | (snap.error & 0x00FFFFFF);
        }
        int r = (rgb >> 16) & 0xFF;
        int g = (rgb >> 8) & 0xFF;
        int b = rgb & 0xFF;
        int spread = Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b));
        int l = luma(argb);
        if (spread <= 24) {
            if (l >= 210) {
                return alpha | ((isPrimaryRole ? snap.onSurface : snap.onSurfaceVariant) & 0x00FFFFFF);
            }
            if (l >= 145) {
                return alpha | (snap.onSurfaceVariant & 0x00FFFFFF);
            }
            if (l >= 112) {
                return alpha | (snap.outline & 0x00FFFFFF);
            }
        }
        return argb;
    }

    private static void adaptImageView(ImageView iv, PaletteSnapshot snap) {
        ColorStateList tint = iv.getImageTintList();
        if (tint != null) {
            if (!tint.isStateful()) {
                int cur = tint.getDefaultColor();
                int remapped = remapLightModeForegroundColor(cur, snap, true);
                if (remapped != cur) {
                    iv.setImageTintList(ColorStateList.valueOf(remapped));
                }
                return;
            }
            int curDef = tint.getDefaultColor();
            int curLive = tint.getColorForState(iv.getDrawableState(), curDef);
            int curSel = tint.getColorForState(new int[]{android.R.attr.state_selected}, curDef);
            int curChk = tint.getColorForState(new int[]{android.R.attr.state_checked}, curDef);
            int newDef = remapLightModeForegroundColor(curDef, snap, true);
            int newLive = remapLightModeForegroundColor(curLive, snap, true);
            int newSel = remapLightModeForegroundColor(curSel, snap, true);
            int newChk = remapLightModeForegroundColor(curChk, snap, true);
            if (newLive != curLive || newDef != curDef || newSel != curSel || newChk != curChk) {
                int resolvedDef = (newDef != curDef) ? newDef : newLive;
                int[][] states = new int[][]{
                        new int[]{-android.R.attr.state_enabled},
                        new int[]{android.R.attr.state_selected},
                        new int[]{android.R.attr.state_checked},
                        new int[]{}
                };
                iv.setImageTintList(new ColorStateList(
                        states,
                        new int[]{withAlpha(snap.onSurface, 0x58), newSel, newChk, resolvedDef}));
            }
            return;
        }
        Drawable d = iv.getDrawable();
        if (d == null) {
            return;
        }
        int cls = classifyVectorDrawable(d);
        if (cls == VEC_CLASS_OTHER) {
            return;
        }
        int targetColor;
        switch (cls) {
            case VEC_CLASS_MONO_WHITE:
                targetColor = snap.onSurface;
                break;
            case VEC_CLASS_MONO_LIGHT_GRAY:
                targetColor = snap.onSurfaceVariant;
                break;
            case VEC_CLASS_MONO_CYAN:
                targetColor = snap.primaryAccent;
                break;
            case VEC_CLASS_MONO_GOLD:
                targetColor = LIGHT_AMBER_ACCENT;
                break;
            default:
                return;
        }
        int tagKey = targetColor;
        Object prevTag = iv.getTag(TAG_ADAPTED_LIGHT_KEY);
        if (prevTag instanceof Integer && ((Integer) prevTag) == tagKey) {
            return;
        }
        iv.setColorFilter(targetColor, PorterDuff.Mode.SRC_IN);
        iv.setTag(TAG_ADAPTED_LIGHT_KEY, tagKey);
    }

    private static boolean tintMonochromeVectorDrawable(Drawable d, PaletteSnapshot snap) {
        int cls = classifyVectorDrawable(d);
        if (cls == VEC_CLASS_OTHER) {
            return false;
        }
        int targetColor = (cls == VEC_CLASS_MONO_CYAN) ? snap.primaryAccent
                : (cls == VEC_CLASS_MONO_GOLD ? LIGHT_AMBER_ACCENT
                : (cls == VEC_CLASS_MONO_LIGHT_GRAY ? snap.onSurfaceVariant : snap.onSurface));
        d.mutate().setTint(targetColor);
        return true;
    }

    private static int classifyVectorDrawable(Drawable d) {
        Drawable current = d;
        if (current instanceof StateListDrawable) {
            current = current.getCurrent();
        }
        if (!(current instanceof VectorDrawable) && !(current instanceof AnimatedVectorDrawable)) {
            return VEC_CLASS_OTHER;
        }
        Drawable.ConstantState cs = current.getConstantState();
        if (cs != null) {
            synchronized (VECTOR_CLASS_CACHE) {
                Integer cached = VECTOR_CLASS_CACHE.get(cs);
                if (cached != null) {
                    return cached;
                }
            }
        }
        int result = inspectVectorMonochromeSample(current);
        if (cs != null) {
            synchronized (VECTOR_CLASS_CACHE) {
                VECTOR_CLASS_CACHE.put(cs, result);
            }
        }
        return result;
    }

    private static int inspectVectorMonochromeSample(Drawable d) {
        Bitmap bmp = null;
        try {
            Drawable copy = (d.getConstantState() != null) ? d.getConstantState().newDrawable().mutate() : null;
            if (copy == null) {
                return VEC_CLASS_OTHER;
            }
            final int sampleSize = 24;
            bmp = Bitmap.createBitmap(sampleSize, sampleSize, Bitmap.Config.ARGB_8888);
            Canvas c = new Canvas(bmp);
            copy.setBounds(0, 0, sampleSize, sampleSize);
            copy.draw(c);

            int opaqueCount = 0;
            int darkCount = 0;
            int whiteCount = 0;
            int lightGrayCount = 0;
            int cyanCount = 0;
            int goldCount = 0;
            for (int y = 0; y < sampleSize; y++) {
                for (int x = 0; x < sampleSize; x++) {
                    int px = bmp.getPixel(x, y);
                    int a = (px >>> 24) & 0xFF;
                    if (a < 40) {
                        continue;
                    }
                    opaqueCount++;
                    int r = (px >> 16) & 0xFF;
                    int g = (px >> 8) & 0xFF;
                    int b = px & 0xFF;
                    int maxC = Math.max(r, Math.max(g, b));
                    int minC = Math.min(r, Math.min(g, b));
                    int spread = maxC - minC;
                    int l = (r * 30 + g * 59 + b * 11) / 100;
                    if (l < 110) {
                        darkCount++;
                    } else if (spread <= 24 && l >= 210) {
                        whiteCount++;
                    } else if (spread <= 24 && l >= 145) {
                        lightGrayCount++;
                    } else if (g >= 180 && b >= 180 && r <= 120) {
                        cyanCount++;
                    } else if (r >= 220 && g >= 165 && b <= 120) {
                        goldCount++;
                    }
                }
            }
            if (opaqueCount == 0 || darkCount * 100 >= opaqueCount * 3) {
                return VEC_CLASS_OTHER;
            }
            if (whiteCount * 100 >= opaqueCount * 94) {
                return VEC_CLASS_MONO_WHITE;
            }
            if (lightGrayCount * 100 >= opaqueCount * 94) {
                return VEC_CLASS_MONO_LIGHT_GRAY;
            }
            if ((whiteCount + lightGrayCount) * 100 >= opaqueCount * 94) {
                return VEC_CLASS_MONO_LIGHT_GRAY;
            }
            if (cyanCount * 100 >= opaqueCount * 94) {
                return VEC_CLASS_MONO_CYAN;
            }
            if (goldCount * 100 >= opaqueCount * 94) {
                return VEC_CLASS_MONO_GOLD;
            }
            return VEC_CLASS_OTHER;
        } catch (Throwable ignored) {
            return VEC_CLASS_OTHER;
        } finally {
            if (bmp != null && !bmp.isRecycled()) {
                bmp.recycle();
            }
        }
    }

    private static boolean isToolbarView(View view) {
        if (view instanceof Toolbar) {
            return true;
        }
        String name = view.getClass().getName();
        return name.contains("Toolbar") && view instanceof ViewGroup;
    }

    private static void adaptToolbar(View toolbar, PaletteSnapshot snap) {
        try {
            int iconColor = snap.onSurface;
            Class<?> cls = toolbar.getClass();
            try {
                Method getNav = cls.getMethod("getNavigationIcon");
                Drawable nav = (Drawable) getNav.invoke(toolbar);
                if (nav != null) {
                    nav.mutate().setTint(iconColor);
                }
            } catch (Throwable ignored) {
            }
            try {
                Method getOverflow = cls.getMethod("getOverflowIcon");
                Drawable overflow = (Drawable) getOverflow.invoke(toolbar);
                if (overflow != null) {
                    overflow.mutate().setTint(iconColor);
                }
            } catch (Throwable ignored) {
            }
            try {
                Method getMenu = cls.getMethod("getMenu");
                Menu menu = (Menu) getMenu.invoke(toolbar);
                if (menu != null) {
                    for (int i = 0; i < menu.size(); i++) {
                        MenuItem item = menu.getItem(i);
                        Drawable icon = item.getIcon();
                        if (icon != null) {
                            icon.mutate().setTint(iconColor);
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
            try {
                Method setTitleColor = cls.getMethod("setTitleTextColor", int.class);
                setTitleColor.invoke(toolbar, snap.onSurface);
                Method setSubColor = cls.getMethod("setSubtitleTextColor", int.class);
                setSubColor.invoke(toolbar, snap.onSurfaceVariant);
            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {
        }
    }

    private static void adaptCompoundButton(CompoundButton cb, PaletteSnapshot snap) {
        Object prevTag = cb.getTag(TAG_ADAPTED_LIGHT_KEY);
        if (prevTag instanceof Integer && ((Integer) prevTag) == snap.primaryAccent) {
            return;
        }
        int[][] states = new int[][]{
                new int[]{android.R.attr.state_checked},
                new int[]{-android.R.attr.state_enabled},
                new int[]{}
        };
        if (cb instanceof CheckBox || cb instanceof RadioButton) {
            ColorStateList csl = new ColorStateList(
                    states,
                    new int[]{snap.primaryAccent, withAlpha(snap.onSurface, 0x60), snap.onSurfaceVariant});
            cb.setButtonTintList(csl);
            cb.setTag(TAG_ADAPTED_LIGHT_KEY, snap.primaryAccent);
            return;
        }
        if (cb instanceof Switch) {
            Switch sw = (Switch) cb;
            sw.setThumbTintList(new ColorStateList(
                    states,
                    new int[]{snap.onPrimary, withAlpha(snap.onSurface, 0x60), snap.outline}));
            sw.setTrackTintList(new ColorStateList(
                    states,
                    new int[]{snap.primaryAccent, withAlpha(snap.onSurface, 0x20), snap.surfaceContainerHighest}));
            cb.setTag(TAG_ADAPTED_LIGHT_KEY, snap.primaryAccent);
            return;
        }
        String name = cb.getClass().getName();
        if (name.contains("Switch")) {
            try {
                Method setThumb = cb.getClass().getMethod("setThumbTintList", ColorStateList.class);
                Method setTrack = cb.getClass().getMethod("setTrackTintList", ColorStateList.class);
                setThumb.invoke(cb, new ColorStateList(
                        states,
                        new int[]{snap.onPrimary, withAlpha(snap.onSurface, 0x60), snap.outline}));
                setTrack.invoke(cb, new ColorStateList(
                        states,
                        new int[]{snap.primaryAccent, withAlpha(snap.onSurface, 0x20), snap.surfaceContainerHighest}));
                cb.setTag(TAG_ADAPTED_LIGHT_KEY, snap.primaryAccent);
            } catch (Throwable ignored) {
            }
        }
    }

    private static void adaptProgressBar(ProgressBar pb, PaletteSnapshot snap) {
        Object prevTag = pb.getTag(TAG_ADAPTED_LIGHT_KEY);
        if (prevTag instanceof Integer && ((Integer) prevTag) == snap.primaryAccent) {
            return;
        }
        ColorStateList accentCsl = ColorStateList.valueOf(snap.primaryAccent);
        ColorStateList trackCsl = ColorStateList.valueOf(snap.surfaceContainerHighest);
        pb.setProgressTintList(accentCsl);
        pb.setIndeterminateTintList(accentCsl);
        pb.setProgressBackgroundTintList(trackCsl);
        if (pb instanceof SeekBar) {
            ((SeekBar) pb).setThumbTintList(accentCsl);
        }
        pb.setTag(TAG_ADAPTED_LIGHT_KEY, snap.primaryAccent);
    }

    // ---- Material 3 Expressive Navbar Palette ----

    public static int getNavbarCapsuleColor() {
        return snapshot().navbarCapsule;
    }

    public static int getNavbarCapsuleBorderColor() {
        PaletteSnapshot snap = snapshot();
        if (snap.isLightMode) {
            return withAlpha(snap.outlineVariant, 0xB0);
        }
        int style = MaterialYouConfig.getNavbarColorStyle();
        if (style == MaterialYouConfig.STYLE_PASTEL_SCREENSHOT) {
            return withAlpha(sys(IDX_ACCENT1_200), 0x80);
        }
        return withAlpha(sys(IDX_ACCENT2_600), 0x45);
    }

    public static int getNavbarActivePillColor() {
        return snapshot().navbarActivePill;
    }

    public static int getNavbarActiveContentColor() {
        return snapshot().navbarActiveContent;
    }

    public static int getNavbarInactiveContentColor() {
        return snapshot().navbarInactiveContent;
    }

    public static int getNavbarShadowColor() {
        if (isLightMode()) {
            return 0x22000000;
        }
        int style = MaterialYouConfig.getNavbarColorStyle();
        return style == MaterialYouConfig.STYLE_PASTEL_SCREENSHOT ? 0x2E000000 : 0x52000000;
    }

    // ---- Material 3 Expressive Floating Mini-Player Palette ----

    public static int getMiniPlayerSurfaceColor() {
        return snapshot().miniPlayerSurface;
    }

    public static int getMiniPlayerBorderColor() {
        PaletteSnapshot snap = snapshot();
        if (snap.isLightMode) {
            return withAlpha(snap.outlineVariant, 0xB8);
        }
        int style = MaterialYouConfig.getNavbarColorStyle();
        if (style == MaterialYouConfig.STYLE_PASTEL_SCREENSHOT) {
            return withAlpha(sys(IDX_ACCENT1_200), 0x90);
        }
        return withAlpha(sys(IDX_ACCENT2_600), 0x45);
    }

    public static int getMiniPlayerTitleColor() {
        return snapshot().miniPlayerTitle;
    }

    public static int getMiniPlayerSubtitleColor() {
        return snapshot().miniPlayerSubtitle;
    }

    public static int getMiniPlayerPlayBgColor() {
        return getNavbarActivePillColor();
    }

    public static int getMiniPlayerPlayIconColor() {
        return getNavbarActiveContentColor();
    }

    public static int getMiniPlayerArtworkFallbackBg() {
        return snapshot().miniPlayerArtworkBg;
    }
}
