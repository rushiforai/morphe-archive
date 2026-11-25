package com.akshaykadam.pixelboard.extension.settings;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.preference.PreferenceManager;
import android.util.TypedValue;
import android.view.Display;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.PathInterpolator;
import android.widget.CompoundButton;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.Switch;
import android.widget.TextView;

import com.akshaykadam.pixelboard.extension.keyboard.GboardKeyboardLiquidGlassRuntime;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;

public final class GboardM3Helper {

    public static final String PREF_APPEARANCE = "gboard_pro_appearance_prefs";
    public static final String KEY_UI_THEME = "selected_gboard_ui_theme";
    public static final String KEY_UI_STYLE_MODE = "ui_style_mode_v220_b3";
    public static final String UI_STYLE_LIQUID_GLASS = "liquid_glass";
    public static final String UI_STYLE_CLASSIC = "classic";
    private static final String PREF_BOARD_UI = "gboard_pro_board_ui_prefs";
    private static final String KEY_AMOLED_BLACK = "amoled_black_enabled";
    private static final String KEY_PRIVACY_DEFAULTS_MIGRATED = "privacy_defaults_off_v215";

    private static final Map<Activity, String> sAppliedThemes = new WeakHashMap<Activity, String>();
    private static final Map<View, String> sStyledViews = new WeakHashMap<View, String>();
    private static final Map<View, Boolean> sHookedLayouts = new WeakHashMap<View, Boolean>();
    private static final Map<View, Boolean> sAnimatedAddLangLists = new WeakHashMap<View, Boolean>();
    private static volatile boolean sPrivacyDefaultsChecked = false;
    private static volatile String sCachedUiStyleMode = null;
    private static volatile Boolean sCachedAmoled = null;
    private static volatile String sCachedThemeKey = null;
    private static volatile Palette sCachedPalette = null;
    private static volatile String sCachedPaletteKey = null;

    public static void invalidateCaches() {
        sCachedUiStyleMode = null;
        sCachedAmoled = null;
        sCachedThemeKey = null;
        sCachedPalette = null;
        sCachedPaletteKey = null;
    }

    public static final class Palette {
        public final int windowBackground;
        public final int surface;
        public final int surfaceAlt;
        public final int surfaceStroke;
        public final int textPrimary;
        public final int textSecondary;
        public final int accent;
        public final int accentContainer;
        public final int onAccentContainer;
        public final int ripple;
        public final boolean isNight;
        public final boolean isAmoled;

        public Palette(int windowBackground, int surface, int surfaceAlt, int surfaceStroke,
                       int textPrimary, int textSecondary, int accent, int accentContainer,
                       int onAccentContainer, int ripple, boolean isNight) {
            this(windowBackground, surface, surfaceAlt, surfaceStroke,
                    textPrimary, textSecondary, accent, accentContainer,
                    onAccentContainer, ripple, isNight, false);
        }

        public Palette(int windowBackground, int surface, int surfaceAlt, int surfaceStroke,
                       int textPrimary, int textSecondary, int accent, int accentContainer,
                       int onAccentContainer, int ripple, boolean isNight, boolean isAmoled) {
            this.windowBackground = windowBackground;
            this.surface = surface;
            this.surfaceAlt = surfaceAlt;
            this.surfaceStroke = surfaceStroke;
            this.textPrimary = textPrimary;
            this.textSecondary = textSecondary;
            this.accent = accent;
            this.accentContainer = accentContainer;
            this.onAccentContainer = onAccentContainer;
            this.ripple = ripple;
            this.isNight = isNight;
            this.isAmoled = isAmoled;
        }

        public static Palette forContext(Context context) {
            boolean liquidGlass = context != null && isLiquidGlassUiEnabled(context);
            boolean amoled = context != null && isAmoledBlackEnabled(context);
            boolean night = false;
            int uiMode = 0;
            if (context != null) {
                Configuration config = context.getResources().getConfiguration();
                uiMode = config.uiMode;
                night = (uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            }
            String selectedTheme = getSelectedThemeKey(context);
            String cacheKey = liquidGlass + "|" + amoled + "|" + night + "|" + uiMode + "|" + selectedTheme;
            Palette cachedPalette = sCachedPalette;
            if (cachedPalette != null && cacheKey.equals(sCachedPaletteKey)) {
                return cachedPalette;
            }
            Palette resolved = computePalette(context, liquidGlass, amoled, night, selectedTheme);
            sCachedPalette = resolved;
            sCachedPaletteKey = cacheKey;
            return resolved;
        }

        private static Palette computePalette(Context context, boolean liquidGlass, boolean amoled,
                                              boolean night, String selectedTheme) {
            if (amoled) {
                if (!liquidGlass) {
                    int accent = 0xFFA8C7FA;
                    int accentContainer = 0xFF0842A0;
                    int onAccentContainer = 0xFFD3E3FD;
                    if (Build.VERSION.SDK_INT >= 31 && context != null) {
                        try {
                            accent = context.getColor(android.R.color.system_accent1_200);
                            accentContainer = context.getColor(android.R.color.system_accent1_800);
                            onAccentContainer = context.getColor(android.R.color.system_neutral1_50);
                        } catch (Throwable ignored) {
                        }
                    }
                    return new Palette(
                            0xFF000000,
                            0xFF141518,
                            0xFF1F2126,
                            0x24FFFFFF,
                            0xFFE6E1E5,
                            0xFFCAC4D0,
                            accent,
                            accentContainer,
                            onAccentContainer,
                            blendAlpha(accent, 0.20f),
                            true,
                            true
                    );
                }
                return new Palette(
                        0xFF000000, // #000000 pure black windowBackground
                        0xFF0A0C12, // surface
                        0xFF10131C, // surfaceAlt
                        0x40A8C7FA, // surfaceStroke (luminous glass rim on black)
                        0xFFF5F7FF, // textPrimary
                        0xFFB0B8D0, // textSecondary
                        0xFFA8C7FA, // accent
                        0xFF142238, // accentContainer
                        0xFFD8E8FF, // onAccentContainer
                        0x33A8C7FA, // ripple
                        true,
                        true
                );
            }

            if ("blush_lilac".equals(selectedTheme)) {
                int stroke = liquidGlass ? (night ? 0x44D0BCFF : 0x33542983) : (night ? 0x1FFFFFFF : 0x14000000);
                if (night) {
                    return new Palette(
                            0xFF181122, 0xFF241C2E, 0xFF322840, stroke,
                            0xFFF5EEFF, 0xFFCCC2DC, 0xFFD0BCFF, 0xFF4F378B,
                            0xFFEADDFF, 0x33D0BCFF, true
                    );
                } else {
                    return new Palette(
                            0xFFF7EFFA, 0xFFFFFFFF, 0xFFEBD7FA, stroke,
                            0xFF24152F, 0xFF5F4B6E, 0xFF542983, 0xFFEBD7FA,
                            0xFF24152F, 0x26542983, false
                    );
                }
            } else if ("cotton_candy".equals(selectedTheme)) {
                int stroke = liquidGlass ? (night ? 0x44FF80AB : 0x33B80058) : (night ? 0x1FFFFFFF : 0x14000000);
                if (night) {
                    return new Palette(
                            0xFF1F1117, 0xFF2E1922, 0xFF402330, stroke,
                            0xFFFCE4EC, 0xFFF8BBD0, 0xFFFF80AB, 0xFF880E4F,
                            0xFFFCE4EC, 0x33FF80AB, true
                    );
                } else {
                    return new Palette(
                            0xFFFDE7E9, 0xFFFFFFFF, 0xFFF6B0CA, stroke,
                            0xFF2D121B, 0xFF6D4352, 0xFFB80058, 0xFFF6B0CA,
                            0xFF2D121B, 0x26B80058, false
                    );
                }
            } else if ("sunset_peach".equals(selectedTheme) || "rainbow".equals(selectedTheme)) {
                int stroke = liquidGlass ? (night ? 0x44FF8A65 : 0x33D35A2D) : (night ? 0x1FFFFFFF : 0x14000000);
                if (night) {
                    return new Palette(
                            0xFF1C1310, 0xFF281C17, 0xFF372720, stroke,
                            0xFFFBE9E7, 0xFFFFCCBC, 0xFFFF7043, 0xFF5D2416,
                            0xFFFFDBCF, 0x33FF7043, true
                    );
                } else {
                    return new Palette(
                            0xFFFDE8E7, 0xFFFFFFFF, 0xFFFD987C, stroke,
                            0xFF2D1610, 0xFF6E443A, 0xFFD35A2D, 0xFFFD987C,
                            0xFF2D1610, 0x26D35A2D, false
                    );
                }
            } else if ("fresh_mint".equals(selectedTheme) || "botanical".equals(selectedTheme)) {
                int stroke = liquidGlass ? (night ? 0x4480CBC4 : 0x33046665) : (night ? 0x1FFFFFFF : 0x14000000);
                if (night) {
                    return new Palette(
                            0xFF0E1815, 0xFF162520, 0xFF20342E, stroke,
                            0xFFE0F2F1, 0xFFB2DFDB, 0xFF4DB6AC, 0xFF0E3E37,
                            0xFFB2DFDB, 0x334DB6AC, true
                    );
                } else {
                    return new Palette(
                            0xFFEFF5F5, 0xFFFFFFFF, 0xFFD4FAEF, stroke,
                            0xFF0E1F1E, 0xFF3F5C5A, 0xFF046665, 0xFFD4FAEF,
                            0xFF0E1F1E, 0x26046665, false
                    );
                }
            } else if ("ocean".equals(selectedTheme)) {
                int stroke = liquidGlass ? (night ? 0x449FA8DA : 0x263949AB) : (night ? 0x1FFFFFFF : 0x14000000);
                if (night) {
                    return new Palette(
                            0xFF101322, 0xFF191D32, 0xFF232845, stroke,
                            0xFFE8EAF6, 0xFFC5CAE9, 0xFF7986CB, 0xFF1E265C,
                            0xFFE8EAF6, 0x337986CB, true
                    );
                } else {
                    return new Palette(
                            0xFFF6F8FE, 0xFFEEF2FC, 0xFFE0E7FA, stroke,
                            0xFF12182E, 0xFF3F4A6A, 0xFF3949AB, 0xFFD1C4E9,
                            0xFF101642, 0x263949AB, false
                    );
                }
            }

            // Default: Auto-adapt to phone system dynamic colors (Material You / Monet on Android 12+)
            if (Build.VERSION.SDK_INT >= 31 && context != null) {
                try {
                    int acc600 = context.getColor(android.R.color.system_accent1_600);
                    int acc200 = context.getColor(android.R.color.system_accent1_200);
                    int acc100 = context.getColor(android.R.color.system_accent1_100);
                    int acc800 = context.getColor(android.R.color.system_accent1_800);
                    int neu10 = context.getColor(android.R.color.system_neutral1_10);
                    int neu50 = context.getColor(android.R.color.system_neutral1_50);
                    int neu100 = context.getColor(android.R.color.system_neutral1_100);
                    int neu800 = context.getColor(android.R.color.system_neutral1_800);
                    int neu900 = context.getColor(android.R.color.system_neutral1_900);
                    if (!liquidGlass) {
                        if (night) {
                            int winBg = blendColor(0xFF121316, neu900, 0.55f);
                            int surf = blendColor(0xFF1E2025, neu800, 0.55f);
                            int surfAlt = blendColor(0xFF282B32, neu800, 0.35f);
                            int txtPri = blendColor(0xFFE5E4E9, neu50, 0.55f);
                            int txtSec = blendColor(0xFFC4C6D0, neu100, 0.35f);
                            return new Palette(
                                    winBg, surf, surfAlt, 0x1FFFFFFF,
                                    txtPri, txtSec, acc200, acc800,
                                    neu50, blendAlpha(acc200, 0.18f), true
                            );
                        } else {
                            int winBg = blendColor(0xFFF3F5F9, neu10, 0.55f);
                            int surf = 0xFFFFFFFF;
                            int surfAlt = blendColor(neu100, neu50, 0.45f);
                            int txtPri = blendColor(0xFF1B1C1F, neu900, 0.60f);
                            int txtSec = blendColor(0xFF5E626C, neu800, 0.40f);
                            return new Palette(
                                    winBg, surf, surfAlt, 0x14000000,
                                    txtPri, txtSec, acc600, acc100,
                                    neu900, blendAlpha(acc600, 0.14f), false
                            );
                        }
                    }
                    if (night) {
                        int winBg = blendColor(0xFF121318, neu900, 0.50f);
                        int surf = blendColor(0xFF1A1D2A, neu800, 0.50f);
                        int surfAlt = blendColor(0xFF232738, acc800, 0.36f);
                        int txtPri = blendColor(0xFFF5F7FF, neu50, 0.40f);
                        int txtSec = blendColor(0xFFB0B8D0, acc100, 0.32f);
                        return new Palette(
                                winBg, surf, surfAlt, blendAlpha(acc200, 0.28f),
                                txtPri, txtSec, acc200, acc800,
                                neu50, blendAlpha(acc200, 0.22f), true
                        );
                    } else {
                        int winBg = blendColor(0xFFEFEFF6, neu50, 0.45f);
                        int surf = blendColor(0xFFF7F8FD, neu10, 0.45f);
                        int surfAlt = blendColor(0xFFE8EBF8, acc100, 0.42f);
                        int txtPri = blendColor(0xFF0E1224, neu900, 0.45f);
                        int txtSec = blendColor(0xFF525A70, neu800, 0.25f);
                        return new Palette(
                                winBg, surf, surfAlt, 0xCCFFFFFF,
                                txtPri, txtSec, acc600, blendColor(0xFFE3E7FC, acc100, 0.55f),
                                neu900, blendAlpha(acc600, 0.16f), false
                        );
                    }
                } catch (Throwable ignored) {
                }
            }

            if (!liquidGlass) {
                if (night) {
                    return new Palette(
                            0xFF141519, 0xFF1E2026, 0xFF282B33, 0x1FFFFFFF,
                            0xFFE4E2E6, 0xFFC5C6D0, 0xFFA8C7FA, 0xFF0842A0,
                            0xFFD3E3FD, 0x22A8C7FA, true
                    );
                } else {
                    return new Palette(
                            0xFFF3F5F9, 0xFFFFFFFF, 0xFFE9EDF6, 0x14000000,
                            0xFF1B1C1F, 0xFF5E626C, 0xFF1A73E8, 0xFFD3E3FD,
                            0xFF041E49, 0x1A1A73E8, false
                    );
                }
            }

            if (night) {
                return new Palette(
                        0xFF121318, // windowBackground
                        0xFF1A1D2A, // surface
                        0xFF232738, // surfaceAlt
                        0x38A8C7FA, // surfaceStroke
                        0xFFF5F7FF, // textPrimary
                        0xFFB0B8D0, // textSecondary
                        0xFFA8C7FA, // accent
                        0xFF1B2B4B, // accentContainer
                        0xFFD8E8FF, // onAccentContainer
                        0x33A8C7FA, // ripple
                        true
                );
            } else {
                // Default 3D Pearlescent Liquid Glass Light Palette
                return new Palette(
                        0xFFEFEFF6, // windowBackground (#EFEFF6 soft pearl lavender-white)
                        0xFFF7F8FD, // surface (#F7F8FD frosted glass surface)
                        0xFFE8EBF8, // surfaceAlt (#E8EBF8 inner liquid glass tint)
                        0xCCFFFFFF, // surfaceStroke (specular white rim)
                        0xFF0E1224, // textPrimary (deep ink navy)
                        0xFF525A70, // textSecondary (cool slate)
                        0xFF283CF5, // accent (vibrant royal liquid blue)
                        0xFFE3E7FC, // accentContainer
                        0xFF16227A, // onAccentContainer
                        0x22283CF5, // ripple
                        false
                );
            }
        }
    }

    public static boolean isAmoledBlackEnabled(Context context) {
        if (context == null) return false;
        Boolean cached = sCachedAmoled;
        if (cached != null) return cached.booleanValue();
        boolean result = false;
        try {
            SharedPreferences boardPrefs = context.getSharedPreferences(PREF_BOARD_UI, Context.MODE_PRIVATE);
            if (boardPrefs != null && boardPrefs.getBoolean(KEY_AMOLED_BLACK, false)) {
                result = true;
            }
        } catch (Throwable ignored) {
        }
        if (!result) {
            try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                    Context dps = context.createDeviceProtectedStorageContext();
                    if (dps != null) {
                        SharedPreferences dpsBoard = dps.getSharedPreferences(PREF_BOARD_UI, Context.MODE_PRIVATE);
                        if (dpsBoard != null && dpsBoard.getBoolean(KEY_AMOLED_BLACK, false)) {
                            result = true;
                        } else {
                            SharedPreferences dpsDef = PreferenceManager.getDefaultSharedPreferences(dps);
                            if (dpsDef != null && dpsDef.getBoolean(KEY_AMOLED_BLACK, false)) {
                                result = true;
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        if (!result) {
            try {
                SharedPreferences defPrefs = PreferenceManager.getDefaultSharedPreferences(context);
                if (defPrefs != null && defPrefs.getBoolean(KEY_AMOLED_BLACK, false)) {
                    result = true;
                }
            } catch (Throwable ignored) {
            }
        }
        sCachedAmoled = Boolean.valueOf(result);
        return result;
    }

    public static String getSelectedThemeKey(Context context) {
        if (context == null) return "default";
        String cached = sCachedThemeKey;
        if (cached != null) return cached;
        String result = "default";
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREF_APPEARANCE, Context.MODE_PRIVATE);
            String val = prefs.getString(KEY_UI_THEME, "default");
            if (val != null && !"default".equals(val)) {
                result = val;
            } else {
                String defVal = PreferenceManager.getDefaultSharedPreferences(context).getString(KEY_UI_THEME, "default");
                if (defVal != null) result = defVal;
            }
        } catch (Throwable ignored) {
        }
        sCachedThemeKey = result;
        return result;
    }

    public static boolean isLiquidGlassUiEnabled(Context context) {
        if (context == null) return false;
        String cached = sCachedUiStyleMode;
        if (cached != null) {
            return UI_STYLE_LIQUID_GLASS.equals(cached);
        }
        String resolved = null;
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREF_APPEARANCE, Context.MODE_PRIVATE);
            if (prefs != null && prefs.contains(KEY_UI_STYLE_MODE)) {
                resolved = prefs.getString(KEY_UI_STYLE_MODE, UI_STYLE_CLASSIC);
            }
        } catch (Throwable ignored) {
        }
        if (resolved == null) {
            try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                    Context dps = context.createDeviceProtectedStorageContext();
                    if (dps != null) {
                        SharedPreferences dpsPrefs = dps.getSharedPreferences(PREF_APPEARANCE, Context.MODE_PRIVATE);
                        if (dpsPrefs != null && dpsPrefs.contains(KEY_UI_STYLE_MODE)) {
                            resolved = dpsPrefs.getString(KEY_UI_STYLE_MODE, UI_STYLE_CLASSIC);
                        } else {
                            SharedPreferences dpsDef = PreferenceManager.getDefaultSharedPreferences(dps);
                            if (dpsDef != null && dpsDef.contains(KEY_UI_STYLE_MODE)) {
                                resolved = dpsDef.getString(KEY_UI_STYLE_MODE, UI_STYLE_CLASSIC);
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        if (resolved == null) {
            try {
                SharedPreferences defPrefs = PreferenceManager.getDefaultSharedPreferences(context);
                if (defPrefs != null && defPrefs.contains(KEY_UI_STYLE_MODE)) {
                    resolved = defPrefs.getString(KEY_UI_STYLE_MODE, UI_STYLE_CLASSIC);
                }
            } catch (Throwable ignored) {
            }
        }
        if (resolved == null) {
            resolved = UI_STYLE_CLASSIC;
        }
        sCachedUiStyleMode = resolved;
        return UI_STYLE_LIQUID_GLASS.equals(resolved);
    }

    public static void setLiquidGlassUiEnabled(Context context, boolean enabled) {
        if (context == null) return;
        String modeValue = enabled ? UI_STYLE_LIQUID_GLASS : UI_STYLE_CLASSIC;
        sCachedUiStyleMode = modeValue;
        sCachedPalette = null;
        sCachedPaletteKey = null;
        try {
            context.getSharedPreferences(PREF_APPEARANCE, Context.MODE_PRIVATE)
                    .edit().putString(KEY_UI_STYLE_MODE, modeValue).commit();
        } catch (Throwable ignored) {
        }
        try {
            PreferenceManager.getDefaultSharedPreferences(context)
                    .edit().putString(KEY_UI_STYLE_MODE, modeValue).commit();
        } catch (Throwable ignored) {
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && !context.isDeviceProtectedStorage()) {
                Context dps = context.createDeviceProtectedStorageContext();
                if (dps != null) {
                    dps.getSharedPreferences(PREF_APPEARANCE, Context.MODE_PRIVATE)
                            .edit().putString(KEY_UI_STYLE_MODE, modeValue).commit();
                    PreferenceManager.getDefaultSharedPreferences(dps)
                            .edit().putString(KEY_UI_STYLE_MODE, modeValue).commit();
                }
            }
        } catch (Throwable ignored) {
        }
        sStyledViews.clear();
        sAppliedThemes.clear();
        try {
            GboardKeyboardLiquidGlassRuntime.onUiStyleModeChanged();
        } catch (Throwable ignored) {
        }
    }

    public static void ensurePrivacyDefaultsOff(Context context) {
        if (context == null || sPrivacyDefaultsChecked) return;
        sPrivacyDefaultsChecked = true;
        try {
            applyPrivacyDefaultsToContext(context);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && !context.isDeviceProtectedStorage()) {
                Context dps = context.createDeviceProtectedStorageContext();
                if (dps != null) {
                    applyPrivacyDefaultsToContext(dps);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void applyPrivacyDefaultsToContext(Context ctx) {
        try {
            SharedPreferences metaPrefs = ctx.getSharedPreferences(PREF_APPEARANCE, Context.MODE_PRIVATE);
            if (metaPrefs.getBoolean(KEY_PRIVACY_DEFAULTS_MIGRATED, false)) {
                return;
            }
            SharedPreferences defPrefs = PreferenceManager.getDefaultSharedPreferences(ctx);
            SharedPreferences.Editor ed = defPrefs.edit();
            ed.putBoolean("enable_user_metrics", false);
            ed.putBoolean("pref_key_use_personalized_dicts", false);
            ed.putBoolean("user_enable_federated_training", false);
            ed.apply();
            metaPrefs.edit().putBoolean(KEY_PRIVACY_DEFAULTS_MIGRATED, true).apply();
        } catch (Throwable ignored) {
        }
    }

    public static int resolveActivityTheme(Activity activity) {
        if (activity != null && isAmoledBlackEnabled(activity)) {
            return android.R.style.Theme_DeviceDefault_NoActionBar;
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            return android.R.style.Theme_DeviceDefault_DayNight;
        }
        boolean nightMode = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return nightMode
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar;
    }

    public static int dp(Context context, int dpValue) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dpValue,
                context.getResources().getDisplayMetrics()
        ));
    }

    public static float dpF(Context context, float dpValue) {
        return TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dpValue,
                context.getResources().getDisplayMetrics()
        );
    }

    public static int blendAlpha(int color, float alpha) {
        int a = Math.round(Color.alpha(color) * alpha);
        return Color.argb(a, Color.red(color), Color.green(color), Color.blue(color));
    }

    public static int blendColor(int c1, int c2, float ratio) {
        float t = Math.max(0f, Math.min(1f, ratio));
        float inv = 1f - t;
        int a = Math.round(Color.alpha(c1) * inv + Color.alpha(c2) * t);
        int r = Math.round(Color.red(c1) * inv + Color.red(c2) * t);
        int g = Math.round(Color.green(c1) * inv + Color.green(c2) * t);
        int b = Math.round(Color.blue(c1) * inv + Color.blue(c2) * t);
        return Color.argb(a, r, g, b);
    }

    public static void enforceHighRefreshRate(Window window) {
        if (window == null) return;
        try {
            WindowManager.LayoutParams lp = window.getAttributes();
            float highestRate = 60.0f;
            int bestModeId = 0;

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                Display display = null;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    try {
                        display = window.getContext().getDisplay();
                    } catch (Throwable ignored) {
                    }
                }
                if (display == null) {
                    WindowManager wm = (WindowManager) window.getContext().getSystemService(Context.WINDOW_SERVICE);
                    if (wm != null) {
                        display = wm.getDefaultDisplay();
                    }
                }
                if (display != null) {
                    Display.Mode currentMode = null;
                    try {
                        currentMode = display.getMode();
                    } catch (Throwable ignored) {
                    }
                    int curW = currentMode != null ? currentMode.getPhysicalWidth() : 0;
                    int curH = currentMode != null ? currentMode.getPhysicalHeight() : 0;

                    Display.Mode[] modes = display.getSupportedModes();
                    if (modes != null) {
                        for (Display.Mode mode : modes) {
                            if (curW > 0 && curH > 0 && (mode.getPhysicalWidth() != curW || mode.getPhysicalHeight() != curH)) {
                                continue;
                            }
                            float rate = mode.getRefreshRate();
                            if (rate > highestRate) {
                                highestRate = rate;
                                bestModeId = mode.getModeId();
                            }
                        }
                        if (highestRate <= 60.0f) {
                            for (Display.Mode mode : modes) {
                                float rate = mode.getRefreshRate();
                                if (rate > highestRate) {
                                    highestRate = rate;
                                    bestModeId = mode.getModeId();
                                }
                            }
                        }
                    }
                }
            }

            if (highestRate >= 90.0f) {
                lp.preferredRefreshRate = highestRate;
                if (bestModeId != 0 && Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    lp.preferredDisplayModeId = bestModeId;
                }
            } else {
                highestRate = 144.0f;
                lp.preferredRefreshRate = 144.0f;
            }

            if (Build.VERSION.SDK_INT >= 31) {
                try {
                    window.getClass().getMethod("setFrameRateSelectionPriority", int.class).invoke(window, 100);
                } catch (Throwable ignored) {
                }
            }

            window.setAttributes(lp);

            if (Build.VERSION.SDK_INT >= 30) {
                try {
                    View decor = window.getDecorView();
                    if (decor != null) {
                        try {
                            decor.getClass().getMethod("setFrameRate", float.class, int.class).invoke(decor, highestRate, 0);
                        } catch (Throwable ignored) {
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void enforceHighRefreshRateIme(android.inputmethodservice.InputMethodService service) {
        if (service == null) return;
        try {
            android.app.Dialog dialog = service.getWindow();
            if (dialog != null) {
                Window window = dialog.getWindow();
                if (window != null) {
                    enforceHighRefreshRate(window);
                    window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                    View decor = window.getDecorView();
                    if (decor != null) {
                        decor.setBackgroundColor(Color.TRANSPARENT);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void applyKeyboardStyling(android.inputmethodservice.InputMethodService service, Window window) {
    }

    public static Drawable createThemeSwatchDrawable(Context context, String themeKey, int sizePx) {
        GradientDrawable gradient = new GradientDrawable();
        gradient.setShape(GradientDrawable.RECTANGLE);
        gradient.setCornerRadius(sizePx / 4.0f);
        gradient.setOrientation(GradientDrawable.Orientation.TL_BR);

        if ("rainbow".equals(themeKey)) {
            gradient.setColors(new int[]{0xFFFF5722, 0xFFFFB74D, 0xFFBA68C8});
        } else if ("botanical".equals(themeKey)) {
            gradient.setColors(new int[]{0xFF00796B, 0xFF43A047, 0xFFC0CA33});
        } else if ("ocean".equals(themeKey)) {
            gradient.setColors(new int[]{0xFF1A237E, 0xFF1E88E5, 0xFF9575CD});
        } else {
            gradient.setColors(new int[]{0xFF006492, 0xFF00897B, 0xFF4DD0E1});
        }

        int strokeColor = 0x33000000;
        gradient.setStroke(dp(context, 2), strokeColor);
        return gradient;
    }

    // =========================================================================
    // Custom 3D Liquid Glass Canvas Drawables
    // =========================================================================

    public static Drawable createLiquidGlassOrbDrawable(Context context, Palette palette) {
        return new LiquidGlassOrbDrawable(context, palette);
    }

    public static Drawable createLiquidGlassOrbWithRipple(Context context, Palette palette) {
        Drawable orb = new LiquidGlassOrbDrawable(context, palette);
        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.OVAL);
        mask.setColor(Color.WHITE);
        return new RippleDrawable(ColorStateList.valueOf(palette.ripple), orb, mask);
    }

    public static Drawable createLiquidGlassCardDrawable(Context context, Palette palette, int cornerRadiusDp, boolean isHero) {
        return new LiquidGlassCardDrawable(context, palette, cornerRadiusDp, isHero);
    }

    public static Drawable createLiquidGlassClickableCardDrawable(Context context, Palette palette, int cornerRadiusDp) {
        return createLiquidGlassClickableCardDrawable(context, palette, cornerRadiusDp, "");
    }

    private static Drawable createLiquidGlassClickableCardDrawable(Context context, Palette palette, int cornerRadiusDp, String stateTag) {
        Drawable card = new LiquidGlassCardDrawable(context, palette, cornerRadiusDp, false);
        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(dpF(context, cornerRadiusDp));
        mask.setColor(Color.WHITE);
        return new LiquidGlassCardRipple(ColorStateList.valueOf(palette.ripple), card, mask, stateTag);
    }

    private static final class LiquidGlassCardRipple extends RippleDrawable {
        final String stateTag;
        LiquidGlassCardRipple(ColorStateList color, Drawable content, Drawable mask, String stateTag) {
            super(color, content, mask);
            this.stateTag = stateTag;
        }
    }

    public static Drawable createLiquidGlassPillButtonDrawable(Context context, Palette palette) {
        Drawable pill = new LiquidGlassPillDrawable(context, palette);
        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(dpF(context, 999f));
        mask.setColor(Color.WHITE);
        return new RippleDrawable(ColorStateList.valueOf(palette.ripple), pill, mask);
    }

    public static Drawable createLiquidGlassSwitchTrackDrawable(Context context, Palette palette) {
        return new LiquidGlassSwitchTrackDrawable(context, palette);
    }

    public static Drawable createLiquidGlassSwitchThumbDrawable(Context context, Palette palette, boolean showCheckmark) {
        return new LiquidGlassSwitchThumbDrawable(context, palette, showCheckmark);
    }

    private static final class LiquidGlassOrbDrawable extends Drawable {
        private final Context context;
        private final Palette palette;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint glossPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path clipPath = new Path();

        LiquidGlassOrbDrawable(Context context, Palette palette) {
            this.context = context;
            this.palette = palette;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = context.getResources().getDisplayMetrics().density;
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float inset = 2.0f * d;
            float radius = (Math.min(b.width(), b.height()) / 2f) - inset;
            if (radius <= 2f) return;

            // 1. Single whisper-soft ambient drop shadow (matches IMG_20261124_011136 (1).png & liquidGL)
            if (!palette.isAmoled) {
                int baseShadow = palette.isNight ? 0x42000000 : 0x0E18223C;
                for (int i = 2; i >= 1; i--) {
                    float frac = (float) i / 2f;
                    int a = Math.round(Color.alpha(baseShadow) * (i == 2 ? 0.45f : 0.75f));
                    shadowPaint.setColor(Color.argb(a, Color.red(baseShadow), Color.green(baseShadow), Color.blue(baseShadow)));
                    canvas.drawCircle(cx, cy + (1.0f * d * frac), radius + (0.7f * d * frac), shadowPaint);
                }
            }

            // 2. Smooth single convex water droplet lens body (zero inner stepped rings)
            int[] bodyColors;
            if (palette.isAmoled) {
                bodyColors = new int[]{0xFF273046, 0xFF06080E, 0xFF1B2336};
            } else if (palette.isNight) {
                int topC = blendColor(0xFF394466, palette.surfaceAlt, 0.35f);
                int midC = blendColor(0xFF111522, palette.surface, 0.35f);
                int botC = blendColor(0xFF2D3754, palette.accentContainer, 0.38f);
                bodyColors = new int[]{topC, midC, botC};
            } else {
                int topC = blendColor(0xFFFFFFFF, palette.surface, 0.25f);
                int midC = blendColor(0xFFE5E8F6, palette.accentContainer, 0.22f);
                int botC = blendColor(0xFFF7F8FE, palette.surface, 0.30f);
                bodyColors = new int[]{topC, midC, botC};
            }
            fillPaint.setShader(new LinearGradient(
                    cx - radius * 0.72f, cy - radius * 0.85f,
                    cx + radius * 0.78f, cy + radius * 0.88f,
                    bodyColors, new float[]{0f, 0.50f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawCircle(cx, cy, radius, fillPaint);

            // 3. Water-drop curved top-left specular dome highlight + bottom-right internal caustic crescent
            canvas.save();
            clipPath.reset();
            clipPath.addCircle(cx, cy, radius, Path.Direction.CW);
            canvas.clipPath(clipPath);

            if (palette.isNight || palette.isAmoled) {
                int domeTop = palette.isAmoled ? 0x6AFFFFFF : 0x7CFFFFFF;
                int domeMid = palette.isAmoled ? 0x20FFFFFF : 0x28FFFFFF;
                glossPaint.setShader(new RadialGradient(
                        cx - radius * 0.35f, cy - radius * 0.37f, radius * 0.78f,
                        new int[]{domeTop, domeMid, 0x00FFFFFF},
                        new float[]{0f, 0.48f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawCircle(cx - radius * 0.24f, cy - radius * 0.28f, radius * 0.78f, glossPaint);

                // Crisp angled wet pinpoint reflection on dark water droplet curvature
                float glintX = cx - radius * 0.34f;
                float glintY = cy - radius * 0.36f;
                canvas.save();
                canvas.rotate(-36f, glintX, glintY);
                glossPaint.setShader(new RadialGradient(
                        glintX, glintY, radius * 0.32f,
                        new int[]{0xB8FFFFFF, 0x42FFFFFF, 0x00FFFFFF},
                        new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawOval(glintX - radius * 0.28f, glintY - radius * 0.14f,
                        glintX + radius * 0.28f, glintY + radius * 0.14f, glossPaint);
                canvas.restore();

                int causticColor = blendAlpha(blendColor(palette.accent, 0xFFFFFFFF, 0.50f),
                        palette.isAmoled ? 0.42f : 0.48f);
                glossPaint.setShader(new RadialGradient(
                        cx + radius * 0.24f, cy + radius * 0.54f, radius * 0.62f,
                        new int[]{causticColor, 0x24FFFFFF, 0x00FFFFFF},
                        new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawCircle(cx + radius * 0.20f, cy + radius * 0.52f, radius * 0.62f, glossPaint);
            } else {
                glossPaint.setShader(new RadialGradient(
                        cx - radius * 0.36f, cy - radius * 0.38f, radius * 0.82f,
                        new int[]{0xD8FFFFFF, 0x00FFFFFF},
                        new float[]{0f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawCircle(cx - radius * 0.26f, cy - radius * 0.30f, radius * 0.80f, glossPaint);

                glossPaint.setShader(new RadialGradient(
                        cx + radius * 0.24f, cy + radius * 0.54f, radius * 0.62f,
                        new int[]{0x85FFFFFF, 0x00FFFFFF},
                        new float[]{0f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawCircle(cx + radius * 0.20f, cy + radius * 0.52f, radius * 0.62f, glossPaint);
            }
            canvas.restore();

            // 4. Outer 3D Fresnel specular rim
            float strokeW = 1.25f * d;
            rimPaint.setStrokeWidth(strokeW);
            int[] rimColors = palette.isAmoled
                    ? new int[]{0xC2E8F0FF, 0x1EFFFFFF, blendAlpha(blendColor(palette.accent, 0xFFFFFFFF, 0.42f), 0.58f)}
                    : (palette.isNight
                    ? new int[]{0xD2FFFFFF, 0x26FFFFFF, blendAlpha(blendColor(palette.accent, 0xFFFFFFFF, 0.48f), 0.66f)}
                    : new int[]{0xFFFFFFFF, 0x358690B8, 0xF2FFFFFF});
            rimPaint.setShader(new LinearGradient(
                    cx - radius, cy - radius, cx + radius, cy + radius,
                    rimColors, new float[]{0f, 0.50f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawCircle(cx, cy, radius - strokeW * 0.5f, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassCardDrawable extends Drawable {
        private final Context context;
        private final Palette palette;
        private final float radiusDp;
        private final boolean isHero;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint wavePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final RectF shadowRect = new RectF();
        private final Path clipPath = new Path();
        private final Path wavePath = new Path();

        LiquidGlassCardDrawable(Context context, Palette palette, float radiusDp, boolean isHero) {
            this.context = context;
            this.palette = palette;
            this.radiusDp = radiusDp;
            this.isHero = isHero;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = context.getResources().getDisplayMetrics().density;
            float r = radiusDp * d;
            float pad = 2.0f * d;
            rect.set(b.left + pad, b.top + pad, b.right - pad, b.bottom - pad);
            if (rect.width() <= 4f || rect.height() <= 4f) return;

            // Soft feathered outer shadow (zero shadow on AMOLED)
            if (!palette.isAmoled) {
                int shadowColor = palette.isNight ? 0x26000000 : 0x0A182038;
                for (int i = 2; i >= 1; i--) {
                    float expand = i * 0.8f * d;
                    int a = Math.round(Color.alpha(shadowColor) * (i == 2 ? 0.45f : 0.75f));
                    shadowPaint.setColor(Color.argb(a, Color.red(shadowColor), Color.green(shadowColor), Color.blue(shadowColor)));
                    shadowRect.set(rect.left - expand * 0.35f, rect.top + (0.8f * d),
                            rect.right + expand * 0.35f, rect.bottom + (1.2f * d) + expand);
                    canvas.drawRoundRect(shadowRect, r + expand * 0.4f, r + expand * 0.4f, shadowPaint);
                }
            }

            if (isHero) {
                int[] heroColors;
                if (palette.isAmoled) {
                    heroColors = new int[]{0xFF0E111C, 0xFF040508, 0xFF101422};
                } else if (palette.isNight) {
                    heroColors = new int[]{
                            blendColor(0xFF21263B, palette.surfaceAlt, 0.45f),
                            blendColor(0xFF141828, palette.surface, 0.45f),
                            blendColor(0xFF1C2034, palette.accentContainer, 0.25f)
                    };
                } else {
                    heroColors = new int[]{
                            blendColor(0xFFF6F7FE, palette.surface, 0.45f),
                            blendColor(0xFFE3E6FC, palette.accentContainer, 0.40f),
                            blendColor(0xFFEDEFFD, palette.surfaceAlt, 0.40f)
                    };
                }
                fillPaint.setShader(new LinearGradient(
                        rect.left, rect.top, rect.right, rect.bottom,
                        heroColors, new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawRoundRect(rect, r, r, fillPaint);

                // Diagonal liquid glass sheen sweep matching About.png & Updates.png
                canvas.save();
                clipPath.reset();
                clipPath.addRoundRect(rect, r, r, Path.Direction.CW);
                canvas.clipPath(clipPath);

                wavePath.reset();
                float w = rect.width();
                float h = rect.height();
                wavePath.moveTo(rect.left, rect.top + h * 0.36f);
                wavePath.cubicTo(
                        rect.left + w * 0.32f, rect.top + h * 0.08f,
                        rect.left + w * 0.68f, rect.top + h * 0.62f,
                        rect.right, rect.top + h * 0.16f
                );
                wavePath.lineTo(rect.right, rect.bottom);
                wavePath.lineTo(rect.left, rect.bottom);
                wavePath.close();

                int waveTop = palette.isAmoled ? 0x16A8C7FA : (palette.isNight ? 0x1AFFFFFF : 0x58FFFFFF);
                int waveBot = 0x00FFFFFF;
                wavePaint.setShader(new LinearGradient(
                        rect.left, rect.top + h * 0.15f, rect.right, rect.bottom,
                        waveTop, waveBot, Shader.TileMode.CLAMP));
                canvas.drawPath(wavePath, wavePaint);
                canvas.restore();
            } else {
                int[] cardColors;
                if (palette.isAmoled) {
                    cardColors = new int[]{0xFF0C0E16, 0xFF07080D};
                } else if (palette.isNight) {
                    cardColors = new int[]{
                            blendColor(0xFF1E2231, palette.surface, 0.55f),
                            blendColor(0xFF181B27, palette.windowBackground, 0.30f)
                    };
                } else {
                    cardColors = new int[]{
                            blendColor(0xFFFAFBFE, palette.surface, 0.45f),
                            blendColor(0xFFF0F2FA, palette.surfaceAlt, 0.35f)
                    };
                }
                fillPaint.setShader(new LinearGradient(
                        rect.left, rect.top, rect.right, rect.bottom,
                        cardColors, null, Shader.TileMode.CLAMP));
                canvas.drawRoundRect(rect, r, r, fillPaint);
            }

            // 3D specular border rim
            float strokeW = 1.25f * d;
            rimPaint.setStrokeWidth(strokeW);
            int[] rimColors = palette.isAmoled
                    ? new int[]{0x55A8C7FA, 0x18FFFFFF, 0x35A8C7FA}
                    : (palette.isNight
                    ? new int[]{0x44FFFFFF, 0x14FFFFFF, 0x30A8C7FA}
                    : new int[]{0xF2FFFFFF, 0x36848FB8, 0xCCFFFFFF});
            rimPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.right, rect.bottom,
                    rimColors, new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
            shadowRect.set(rect.left + strokeW * 0.5f, rect.top + strokeW * 0.5f,
                    rect.right - strokeW * 0.5f, rect.bottom - strokeW * 0.5f);
            canvas.drawRoundRect(shadowRect, r, r, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassPillDrawable extends Drawable {
        private final Context context;
        private final Palette palette;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint glossPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final RectF innerRect = new RectF();

        LiquidGlassPillDrawable(Context context, Palette palette) {
            this.context = context;
            this.palette = palette;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = context.getResources().getDisplayMetrics().density;
            float pad = 2.0f * d;
            rect.set(b.left + pad, b.top + pad, b.right - pad, b.bottom - pad);
            if (rect.width() <= 4f || rect.height() <= 4f) return;
            float r = rect.height() / 2f;

            // Shadow (whisper-soft ambient glow, zero shadow on AMOLED)
            if (!palette.isAmoled) {
                int shadowColor = palette.isNight ? 0x28000000 : 0x0D1B2444;
                for (int i = 2; i >= 1; i--) {
                    float ex = i * 0.75f * d;
                    int a = Math.round(Color.alpha(shadowColor) * (i == 2 ? 0.45f : 0.75f));
                    shadowPaint.setColor(Color.argb(a, Color.red(shadowColor), Color.green(shadowColor), Color.blue(shadowColor)));
                    innerRect.set(rect.left - ex * 0.3f, rect.top + 0.9f * d,
                            rect.right + ex * 0.3f, rect.bottom + 1.4f * d + ex);
                    canvas.drawRoundRect(innerRect, r + ex * 0.4f, r + ex * 0.4f, shadowPaint);
                }
            }

            // Glossy capsule fill (tinted with dynamic system / theme palette)
            int[] bodyColors = palette.isAmoled
                    ? new int[]{0xFF151926, 0xFF0A0C12, 0xFF121622}
                    : (palette.isNight
                    ? new int[]{
                            blendColor(0xFF282D42, palette.surfaceAlt, 0.45f),
                            blendColor(0xFF1C2032, palette.surface, 0.45f),
                            blendColor(0xFF24293E, palette.accentContainer, 0.28f)
                    }
                    : new int[]{
                            blendColor(0xFFFAFBFD, palette.surface, 0.40f),
                            blendColor(0xFFE5E8FC, palette.accentContainer, 0.42f),
                            blendColor(0xFFF2F4FE, palette.surface, 0.40f)
                    });
            fillPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.left, rect.bottom,
                    bodyColors, new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(rect, r, r, fillPaint);

            // Top specular highlight band
            innerRect.set(rect.left + 4f * d, rect.top + 1.5f * d, rect.right - 4f * d, rect.top + rect.height() * 0.48f);
            int topHl = palette.isAmoled ? 0x20FFFFFF : (palette.isNight ? 0x28FFFFFF : 0x90FFFFFF);
            glossPaint.setShader(new LinearGradient(
                    innerRect.left, innerRect.top, innerRect.left, innerRect.bottom,
                    topHl, 0x00FFFFFF, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(innerRect, innerRect.height() / 2f, innerRect.height() / 2f, glossPaint);

            // Bright specular border
            float strokeW = 1.4f * d;
            rimPaint.setStrokeWidth(strokeW);
            int[] rimColors = palette.isAmoled
                    ? new int[]{0x66A8C7FA, 0x22FFFFFF, 0x44A8C7FA}
                    : (palette.isNight
                    ? new int[]{0x55FFFFFF, 0x1AFFFFFF, 0x44A8C7FA}
                    : new int[]{0xFAFFFFFF, 0x447B86B4, 0xE6FFFFFF});
            rimPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.right, rect.bottom,
                    rimColors, new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
            innerRect.set(rect.left + strokeW * 0.5f, rect.top + strokeW * 0.5f,
                    rect.right - strokeW * 0.5f, rect.bottom - strokeW * 0.5f);
            canvas.drawRoundRect(innerRect, r, r, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassSwitchTrackDrawable extends Drawable {
        private final Context context;
        private final Palette palette;
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private boolean isChecked = false;
        private boolean isEnabled = true;

        LiquidGlassSwitchTrackDrawable(Context context, Palette palette) {
            this.context = context;
            this.palette = palette;
            fillPaint.setStyle(Paint.Style.FILL);
            strokePaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean checked = false;
            boolean enabled = false;
            for (int s : state) {
                if (s == android.R.attr.state_checked) checked = true;
                if (s == android.R.attr.state_enabled) enabled = true;
            }
            if (isChecked != checked || isEnabled != enabled) {
                isChecked = checked;
                isEnabled = enabled;
                invalidateSelf();
                return true;
            }
            return false;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.width() <= 0 || bounds.height() <= 0) return;

            float d = context.getResources().getDisplayMetrics().density;
            float strokeW = 1.5f * d;
            rect.set(bounds.left + strokeW * 0.5f, bounds.top + strokeW * 0.5f,
                    bounds.right - strokeW * 0.5f, bounds.bottom - strokeW * 0.5f);
            float radius = rect.height() / 2f;

            if (isChecked) {
                int[] onColors;
                if (palette.isAmoled) {
                    onColors = new int[]{0xFF3E4C6E, 0xFF28334E};
                } else if (palette.isNight) {
                    onColors = new int[]{
                            blendColor(0xFF4D5878, palette.accent, 0.45f),
                            blendColor(0xFF38425E, palette.accentContainer, 0.45f)
                    };
                } else if ("default".equals(getSelectedThemeKey(context))) {
                    onColors = new int[]{
                            blendColor(0xFF5D657E, palette.accent, 0.52f),
                            blendColor(0xFF464D66, palette.accent, 0.62f)
                    };
                } else {
                    onColors = new int[]{palette.accent, blendAlpha(palette.accent, 0.85f)};
                }
                if (!isEnabled) {
                    onColors = new int[]{blendAlpha(onColors[0], 0.45f), blendAlpha(onColors[1], 0.45f)};
                }
                fillPaint.setShader(new LinearGradient(
                        rect.left, rect.top, rect.left, rect.bottom,
                        onColors[0], onColors[1], Shader.TileMode.CLAMP));
                canvas.drawRoundRect(rect, radius, radius, fillPaint);

                strokePaint.setStrokeWidth(strokeW);
                strokePaint.setShader(new LinearGradient(
                        rect.left, rect.top, rect.right, rect.bottom,
                        palette.isNight ? 0x66A8C7FA : 0xDDFFFFFF,
                        palette.isNight ? 0x33FFFFFF : 0x88CFD6EA,
                        Shader.TileMode.CLAMP));
                canvas.drawRoundRect(rect, radius, radius, strokePaint);
            } else {
                int[] offColors;
                if (palette.isAmoled) {
                    offColors = new int[]{0xFF151822, 0xFF0E1018};
                } else if (palette.isNight) {
                    offColors = new int[]{0xFF2A2E3E, 0xFF202432};
                } else {
                    offColors = new int[]{0xFFE1E4F0, 0xFFD2D7E8};
                }
                fillPaint.setShader(new LinearGradient(
                        rect.left, rect.top, rect.left, rect.bottom,
                        offColors[0], offColors[1], Shader.TileMode.CLAMP));
                canvas.drawRoundRect(rect, radius, radius, fillPaint);

                strokePaint.setStrokeWidth(strokeW);
                strokePaint.setShader(new LinearGradient(
                        rect.left, rect.top, rect.right, rect.bottom,
                        palette.isNight ? 0x44FFFFFF : 0xEEFFFFFF,
                        palette.isNight ? 0x22FFFFFF : 0x668E99BE,
                        Shader.TileMode.CLAMP));
                canvas.drawRoundRect(rect, radius, radius, strokePaint);
            }
        }

        @Override public int getIntrinsicWidth() { return dp(context, 54); }
        @Override public int getIntrinsicHeight() { return dp(context, 32); }
        @Override public void setAlpha(int alpha) { fillPaint.setAlpha(alpha); strokePaint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassSwitchThumbDrawable extends Drawable {
        private final Context context;
        private final Palette palette;
        private final boolean showCheckmark;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint thumbPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint checkPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path checkPath = new Path();
        private boolean isChecked = false;
        private boolean isEnabled = true;

        LiquidGlassSwitchThumbDrawable(Context context, Palette palette, boolean showCheckmark) {
            this.context = context;
            this.palette = palette;
            this.showCheckmark = showCheckmark;
            float d = context.getResources().getDisplayMetrics().density;
            thumbPaint.setStyle(Paint.Style.FILL);
            rimPaint.setStyle(Paint.Style.STROKE);
            rimPaint.setStrokeWidth(1.0f * d);
            checkPaint.setStyle(Paint.Style.STROKE);
            checkPaint.setStrokeCap(Paint.Cap.ROUND);
            checkPaint.setStrokeJoin(Paint.Join.ROUND);
            checkPaint.setStrokeWidth(2.1f * d);
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean checked = false;
            boolean enabled = false;
            for (int s : state) {
                if (s == android.R.attr.state_checked) checked = true;
                if (s == android.R.attr.state_enabled) enabled = true;
            }
            if (isChecked != checked || isEnabled != enabled) {
                isChecked = checked;
                isEnabled = enabled;
                invalidateSelf();
                return true;
            }
            return false;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float cx = bounds.exactCenterX();
            float cy = bounds.exactCenterY();
            float d = context.getResources().getDisplayMetrics().density;
            float r = isChecked ? (11.5f * d) : (10.5f * d);

            // Subtle thumb drop shadow
            shadowPaint.setColor(palette.isNight ? 0x44000000 : 0x161B2440);
            canvas.drawCircle(cx, cy + 1.2f * d, r + 0.6f * d, shadowPaint);

            if (isChecked) {
                int[] thumbColors = isEnabled
                        ? new int[]{0xFFFFFFFF, 0xFFF1F3FA}
                        : new int[]{0xAAFFFFFF, 0x99E0E4F0};
                thumbPaint.setShader(new LinearGradient(
                        cx, cy - r, cx, cy + r, thumbColors[0], thumbColors[1], Shader.TileMode.CLAMP));
                canvas.drawCircle(cx, cy, r, thumbPaint);

                rimPaint.setColor(0xFFFFFFFF);
                canvas.drawCircle(cx, cy, r - 0.5f * d, rimPaint);

                if (showCheckmark) {
                    int checkColor;
                    if (palette.isAmoled || palette.isNight) {
                        checkColor = blendColor(0xFF28334E, palette.accentContainer, 0.40f);
                    } else if ("default".equals(getSelectedThemeKey(context))) {
                        checkColor = blendColor(0xFF4D5467, palette.accent, 0.58f);
                    } else {
                        checkColor = palette.accent;
                    }
                    checkPaint.setColor(isEnabled ? checkColor : blendAlpha(checkColor, 0.5f));
                    checkPath.reset();
                    checkPath.moveTo(cx - (4.2f * d), cy - (0.1f * d));
                    checkPath.lineTo(cx - (1.2f * d), cy + (2.9f * d));
                    checkPath.lineTo(cx + (4.4f * d), cy - (3.0f * d));
                    canvas.drawPath(checkPath, checkPaint);
                }
            } else {
                int[] thumbColors = palette.isNight
                        ? new int[]{0xFFBFC6DC, 0xFF949DB8}
                        : new int[]{0xFFFFFFFF, 0xFFF0F2FA};
                thumbPaint.setShader(new LinearGradient(
                        cx, cy - r, cx, cy + r, thumbColors[0], thumbColors[1], Shader.TileMode.CLAMP));
                canvas.drawCircle(cx, cy, r, thumbPaint);

                rimPaint.setColor(palette.isNight ? 0x66FFFFFF : 0xFFFFFFFF);
                canvas.drawCircle(cx, cy, r - 0.5f * d, rimPaint);
            }
        }

        @Override public int getIntrinsicWidth() { return dp(context, 32); }
        @Override public int getIntrinsicHeight() { return dp(context, 32); }
        @Override public void setAlpha(int alpha) { thumbPaint.setAlpha(alpha); checkPaint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    // =========================================================================
    // Native SettingsActivity Theme, Liquid Glass Hierarchy Styling & Animations
    // =========================================================================

    public static void applyTheme(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        ensurePrivacyDefaultsOff(activity);

        final boolean amoled = isAmoledBlackEnabled(activity);
        final boolean liquidGlass = isLiquidGlassUiEnabled(activity);
        final String themeKey = getSelectedThemeKey(activity);
        final Palette palette = Palette.forContext(activity);
        final String stateKey = themeKey + "_" + amoled + "_" + palette.isNight + "_" + palette.accent + "_" + palette.windowBackground + "|" + liquidGlass;
        sAppliedThemes.put(activity, stateKey);

        try {
            final Window window = activity.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(palette.windowBackground));
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    try {
                        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS | WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
                        window.setStatusBarColor(Color.TRANSPARENT);
                        window.setNavigationBarColor(Color.TRANSPARENT);
                    } catch (Throwable ignored) {
                    }
                }
                if (Build.VERSION.SDK_INT >= 29) {
                    try {
                        window.setStatusBarContrastEnforced(false);
                        window.setNavigationBarContrastEnforced(false);
                    } catch (Throwable ignored) {
                    }
                }
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                    try {
                        WindowManager.LayoutParams lp = window.getAttributes();
                        lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
                        window.setAttributes(lp);
                    } catch (Throwable ignored) {
                    }
                }

                enforceHighRefreshRate(window);

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    try {
                        WindowInsetsController controller = window.getInsetsController();
                        if (controller != null) {
                            int appearance = !palette.isNight
                                    ? (WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS)
                                    : 0;
                            controller.setSystemBarsAppearance(
                                    appearance,
                                    WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS
                            );
                        }
                    } catch (Throwable ignored) {
                    }
                } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    try {
                        View decor = window.getDecorView();
                        if (decor != null) {
                            int flags = decor.getSystemUiVisibility()
                                    | View.SYSTEM_UI_FLAG_LAYOUT_STABLE;
                            if (!palette.isNight) {
                                flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                            } else {
                                flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                            }
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                                if (!palette.isNight) {
                                    flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                                } else {
                                    flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                                }
                            }
                            decor.setSystemUiVisibility(flags);
                        }
                    } catch (Throwable ignored) {
                    }
                }

                final View decor = window.getDecorView();
                if (decor != null) {
                    decor.setBackgroundColor(palette.windowBackground);
                    decor.post(new Runnable() {
                        @Override
                        public void run() {
                            styleViewHierarchy(decor, Palette.forContext(activity));
                        }
                    });
                    if (!Boolean.TRUE.equals(sHookedLayouts.get(decor))) {
                        sHookedLayouts.put(decor, Boolean.TRUE);
                        final boolean[] pendingRestyle = new boolean[1];
                        final Runnable coalescedRestyle = new Runnable() {
                            @Override
                            public void run() {
                                pendingRestyle[0] = false;
                                try {
                                    if (!activity.isFinishing() && !activity.isDestroyed()) {
                                        styleViewHierarchy(decor, Palette.forContext(activity));
                                    }
                                } catch (Throwable ignored) {
                                }
                            }
                        };
                        ViewTreeObserver vto = decor.getViewTreeObserver();
                        vto.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                            @Override
                            public void onGlobalLayout() {
                                if (!pendingRestyle[0]) {
                                    pendingRestyle[0] = true;
                                    decor.postOnAnimation(coalescedRestyle);
                                }
                            }
                        });
                        vto.addOnScrollChangedListener(new ViewTreeObserver.OnScrollChangedListener() {
                            @Override
                            public void onScrollChanged() {
                                if (!pendingRestyle[0]) {
                                    pendingRestyle[0] = true;
                                    decor.postOnAnimation(coalescedRestyle);
                                }
                            }
                        });
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onActivityResume(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        invalidateCaches();
        ensurePrivacyDefaultsOff(activity);

        Palette p = Palette.forContext(activity);
        boolean liquidGlass = isLiquidGlassUiEnabled(activity);
        String currentState = getSelectedThemeKey(activity) + "_" + isAmoledBlackEnabled(activity) + "_" + p.isNight + "_" + p.accent + "_" + p.windowBackground + "|" + liquidGlass;
        String lastApplied = sAppliedThemes.get(activity);

        if (lastApplied != null && !lastApplied.equals(currentState)) {
            boolean uiModeChanged = !lastApplied.endsWith("|" + liquidGlass);
            sAppliedThemes.put(activity, currentState);
            sStyledViews.clear();
            if (uiModeChanged) {
                activity.recreate();
                return;
            }
            applyTheme(activity);
            return;
        }

        sAppliedThemes.put(activity, currentState);
        applyTheme(activity);
    }

    public static void styleHeaderPreferenceView(View rowView) {
        if (rowView == null) return;
        try {
            Context ctx = rowView.getContext();
            Palette palette = Palette.forContext(ctx);
            stylePreferenceCardRow(rowView, ctx, palette);

            View iconView = rowView.findViewById(android.R.id.icon);
            if (iconView instanceof ImageView) {
                stylePreferenceIcon((ImageView) iconView, palette);
            }
            View titleView = rowView.findViewById(android.R.id.title);
            if (titleView instanceof TextView) {
                ((TextView) titleView).setTextColor(palette.textPrimary);
            }
            View summaryView = rowView.findViewById(android.R.id.summary);
            if (summaryView instanceof TextView) {
                ((TextView) summaryView).setTextColor(palette.textSecondary);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void stylePreferenceCardRow(final View rowView, final Context ctx, final Palette palette) {
        if (rowView == null) return;
        if (!isLiquidGlassUiEnabled(ctx)) {
            String classicTag = "pref_card_classic_" + palette.windowBackground;
            Drawable bg = rowView.getBackground();
            boolean hasClassicBg = (bg instanceof RippleDrawable) && !(bg instanceof LiquidGlassCardRipple)
                    && classicTag.equals(sStyledViews.get(rowView));
            if (!hasClassicBg) {
                sStyledViews.put(rowView, classicTag);
                if (rowView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams mlp) {
                    if (mlp.leftMargin != 0 || mlp.topMargin != 0 || mlp.bottomMargin != 0) {
                        mlp.leftMargin = 0;
                        mlp.rightMargin = 0;
                        mlp.setMarginStart(0);
                        mlp.setMarginEnd(0);
                        mlp.topMargin = 0;
                        mlp.bottomMargin = 0;
                        rowView.setLayoutParams(mlp);
                    }
                }
                rowView.setPaddingRelative(dp(ctx, 16), dp(ctx, 12), dp(ctx, 16), dp(ctx, 12));
                GradientDrawable mask = new GradientDrawable();
                mask.setColor(Color.WHITE);
                rowView.setBackground(new RippleDrawable(ColorStateList.valueOf(palette.ripple), null, mask));
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    rowView.setElevation(0f);
                }
            }
            return;
        }
        boolean liquidGlass = isLiquidGlassUiEnabled(ctx);
        String stateTag = "pref_card_v5_" + palette.windowBackground + "_" + palette.isAmoled + "_" + liquidGlass;
        boolean hasLayout = rowView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams;
        Drawable bg = rowView.getBackground();
        boolean hasCardBg = stateTag.equals(sStyledViews.get(rowView))
                && (!liquidGlass || ((bg instanceof LiquidGlassCardRipple) && stateTag.equals(((LiquidGlassCardRipple) bg).stateTag)));
        if (!hasCardBg || !hasLayout) {
            if (hasLayout) {
                sStyledViews.put(rowView, stateTag);
                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) rowView.getLayoutParams();
                int side = dp(ctx, 16);
                int vert = dp(ctx, liquidGlass ? 5 : 4);
                if (mlp.leftMargin != side || mlp.topMargin != vert) {
                    mlp.leftMargin = side;
                    mlp.rightMargin = side;
                    mlp.setMarginStart(side);
                    mlp.setMarginEnd(side);
                    mlp.topMargin = vert;
                    mlp.bottomMargin = vert;
                    rowView.setLayoutParams(mlp);
                }
            } else {
                rowView.post(() -> stylePreferenceCardRow(rowView, ctx, Palette.forContext(ctx)));
            }
            if (rowView instanceof ViewGroup) {
                ((ViewGroup) rowView).setClipChildren(false);
                ((ViewGroup) rowView).setClipToPadding(false);
            }
            rowView.setPaddingRelative(dp(ctx, 14), dp(ctx, 14), dp(ctx, 16), dp(ctx, 14));
            if (!hasCardBg) {
                rowView.setBackground(liquidGlass
                        ? createLiquidGlassClickableCardDrawable(ctx, palette, 20, stateTag)
                        : createClickableCardDrawable(palette.surface, palette.surfaceStroke, palette.ripple, dp(ctx, 16)));
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                rowView.setElevation(0f);
            }
        }
    }

    private static void stylePreferenceIcon(ImageView iv, Palette palette) {
        if (iv == null || iv.getDrawable() == null || iv.getVisibility() != View.VISIBLE) {
            return;
        }
        Context ctx = iv.getContext();
        if (!isLiquidGlassUiEnabled(ctx)) {
            int iconTint = palette.textSecondary;
            String classicTag = "pref_icon_classic_v2_" + palette.isNight + "_" + iconTint;
            if (!classicTag.equals(sStyledViews.get(iv))) {
                sStyledViews.put(iv, classicTag);
                ViewGroup.LayoutParams lp = iv.getLayoutParams();
                if (lp != null) {
                    int size24 = dp(ctx, 24);
                    if (lp.width != size24 || lp.height != size24) {
                        lp.width = size24;
                        lp.height = size24;
                        iv.setLayoutParams(lp);
                    }
                }
                iv.setPadding(0, 0, 0, 0);
                iv.setBackground(null);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    iv.setElevation(0f);
                }
                if (iv.getParent() instanceof ViewGroup frame && frame.getId() != android.R.id.list) {
                    frame.setMinimumWidth(dp(ctx, 48));
                    frame.setPaddingRelative(0, 0, dp(ctx, 16), 0);
                }
                iv.setImageTintList(ColorStateList.valueOf(iconTint));
                iv.setColorFilter(new PorterDuffColorFilter(iconTint, PorterDuff.Mode.SRC_IN));
            }
            return;
        }
        int iconTint = palette.isNight ? 0xFFF2F5FF : 0xFF1A2033;
        String tag = "pref_orb_v4_" + palette.isNight + "_" + palette.isAmoled + "_" + palette.accent;
        int targetPx = dp(ctx, 44);
        int padPx = dp(ctx, 10);
        if (!tag.equals(sStyledViews.get(iv))) {
            sStyledViews.put(iv, tag);
            ViewGroup.LayoutParams lp = iv.getLayoutParams();
            if (lp != null) {
                lp.width = targetPx;
                lp.height = targetPx;
                if (lp instanceof ViewGroup.MarginLayoutParams mlp) {
                    mlp.leftMargin = 0;
                    mlp.rightMargin = 0;
                    mlp.setMarginStart(0);
                    mlp.setMarginEnd(0);
                }
                iv.setLayoutParams(lp);
            }
            iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
            iv.setPadding(padPx, padPx, padPx, padPx);
            iv.setBackground(createLiquidGlassOrbDrawable(ctx, palette));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                iv.setElevation(0f);
            }
            if (iv.getParent() instanceof ViewGroup frame && frame.getId() != android.R.id.list) {
                frame.setClipChildren(false);
                frame.setClipToPadding(false);
                frame.setMinimumWidth(dp(ctx, 60));
                frame.setPaddingRelative(dp(ctx, 2), dp(ctx, 2), dp(ctx, 14), dp(ctx, 2));
                ViewGroup.LayoutParams flp = frame.getLayoutParams();
                if (flp != null && flp.width != ViewGroup.LayoutParams.WRAP_CONTENT) {
                    flp.width = ViewGroup.LayoutParams.WRAP_CONTENT;
                    frame.setLayoutParams(flp);
                }
            }
            iv.setImageTintList(ColorStateList.valueOf(iconTint));
            iv.setColorFilter(new PorterDuffColorFilter(iconTint, PorterDuff.Mode.SRC_IN));
        }
    }

    public static void styleViewHierarchy(View view, Palette palette) {
        if (view == null || palette == null) return;
        Context ctx = view.getContext();
        final boolean liquidGlass = isLiquidGlassUiEnabled(ctx);
        String hierarchyTag = palette.windowBackground + "_" + palette.accent + "_" + palette.isAmoled + "_" + liquidGlass;

        try {
            int vid = view.getId();
            String className = view.getClass().getName();

            // 1. Window / Container backgrounds
            if (vid == android.R.id.content
                    || vid == 0x7f0b01e1 || vid == 0x7f0b062a || vid == 0x7f0b0810
                    || vid == 0x7f0b0224 || vid == 0x7f0b01e0 || vid == 0x7f0b0225
                    || vid == 0x7f0b013d || vid == 0x7f0b0222
                    || className.contains("AppBarLayout")
                    || className.contains("RecyclerView")
                    || className.contains("ListView")) {
                view.setBackgroundColor(palette.windowBackground);
            }

            if (className.contains("CollapsingToolbarLayout")) {
                view.setBackgroundColor(palette.windowBackground);
                String ctlTag = "ctl_v2_" + hierarchyTag;
                if (!ctlTag.equals(sStyledViews.get(view))) {
                    sStyledViews.put(view, ctlTag);
                    try {
                        view.getClass().getMethod("setContentScrimColor", int.class).invoke(view, palette.windowBackground);
                    } catch (Throwable ignored) {}
                    try {
                        view.getClass().getMethod("setStatusBarScrimColor", int.class).invoke(view, palette.windowBackground);
                    } catch (Throwable ignored) {}
                    try {
                        view.getClass().getMethod("setExpandedTitleColor", int.class).invoke(view, palette.textPrimary);
                    } catch (Throwable ignored) {}
                    try {
                        view.getClass().getMethod("setCollapsedTitleTextColor", int.class).invoke(view, palette.textPrimary);
                    } catch (Throwable ignored) {}
                    // Material 3 / R8-shrunk CollapsingToolbarLayout helpers (fields a = title Lvhp, b = subtitle Lvhp)
                    ColorStateList titleCsl = ColorStateList.valueOf(palette.textPrimary);
                    ColorStateList subCsl = ColorStateList.valueOf(palette.textSecondary);
                    for (String helperField : new String[]{"a", "b"}) {
                        try {
                            java.lang.reflect.Field hf = view.getClass().getDeclaredField(helperField);
                            hf.setAccessible(true);
                            Object helper = hf.get(view);
                            if (helper != null) {
                                ColorStateList csl = "a".equals(helperField) ? titleCsl : subCsl;
                                try {
                                    helper.getClass().getMethod("m", ColorStateList.class).invoke(helper, csl);
                                } catch (Throwable ignored) {
                                }
                                try {
                                    helper.getClass().getMethod("r", ColorStateList.class).invoke(helper, csl);
                                } catch (Throwable ignored) {
                                }
                                try {
                                    helper.getClass().getMethod("w", ColorStateList.class).invoke(helper, csl);
                                } catch (Throwable ignored) {
                                }
                            }
                        } catch (Throwable ignored) {
                        }
                    }
                    for (String scrimField : new String[]{"d", "u"}) {
                        try {
                            java.lang.reflect.Field sf = view.getClass().getDeclaredField(scrimField);
                            sf.setAccessible(true);
                            sf.set(view, new ColorDrawable(palette.windowBackground));
                        } catch (Throwable ignored) {
                        }
                    }
                    view.invalidate();
                }
            }

            // 2. Toolbar & its navigation / menu action orb buttons + title TextView
            if (className.contains("Toolbar")) {
                view.setBackgroundColor(palette.windowBackground);
                try {
                    view.getClass().getMethod("setTitleTextColor", int.class).invoke(view, palette.textPrimary);
                } catch (Throwable ignored) {
                }
                if (view instanceof ViewGroup) {
                    ViewGroup toolbarVg = (ViewGroup) view;
                    for (int i = 0; i < toolbarVg.getChildCount(); i++) {
                        View child = toolbarVg.getChildAt(i);
                        if (child instanceof TextView tv && !(child.getClass().getName().contains("ActionMenu"))) {
                            tv.setTextColor(palette.textPrimary);
                        } else if (child instanceof ImageButton) {
                            if (liquidGlass) {
                                styleToolbarOrbButton(child, palette);
                            } else {
                                child.setBackground(null);
                            }
                            int navTint = palette.isNight ? 0xFFF2F5FF : 0xFF1A2033;
                            ((ImageButton) child).setImageTintList(ColorStateList.valueOf(navTint));
                            ((ImageButton) child).setColorFilter(new PorterDuffColorFilter(navTint, PorterDuff.Mode.SRC_IN));
                        } else if (child.getClass().getName().contains("ActionMenuView") && child instanceof ViewGroup) {
                            ViewGroup menuVg = (ViewGroup) child;
                            for (int m = 0; m < menuVg.getChildCount(); m++) {
                                View menuItem = menuVg.getChildAt(m);
                                if (menuItem instanceof TextView) {
                                    TextView tvMenu = (TextView) menuItem;
                                    Drawable[] cds = tvMenu.getCompoundDrawablesRelative();
                                    boolean hasIcon = false;
                                    for (Drawable d : cds) {
                                        if (d != null) {
                                            hasIcon = true;
                                            d.setTint(palette.isNight ? 0xFFF2F5FF : 0xFF1A2033);
                                        }
                                    }
                                    if (hasIcon && (tvMenu.getText() == null || tvMenu.getText().length() == 0)) {
                                        if (liquidGlass) {
                                            styleToolbarOrbButton(tvMenu, palette);
                                        } else {
                                            tvMenu.setBackground(null);
                                        }
                                    } else if (tvMenu.getText() != null && tvMenu.getText().length() > 0) {
                                        tvMenu.setTextColor(palette.accent);
                                    }
                                } else if (menuItem instanceof ImageView) {
                                    if (liquidGlass) {
                                        styleToolbarOrbButton(menuItem, palette);
                                    } else {
                                        menuItem.setBackground(null);
                                    }
                                    ((ImageView) menuItem).setColorFilter(new PorterDuffColorFilter(
                                            palette.isNight ? 0xFFF2F5FF : 0xFF1A2033, PorterDuff.Mode.SRC_IN));
                                }
                            }
                        }
                    }
                }
            }

            // 2b. Preference rows inside RecyclerView/ListView -> Frosted Liquid Glass Cards
            if (view instanceof ViewGroup && view.getParent() != null
                    && view.getParent().getClass().getName().contains("RecyclerView")
                    && view.isClickable()) {
                View titleV = view.findViewById(android.R.id.title);
                View iconFrameV = view.findViewById(android.R.id.icon_frame);
                View widgetFrameV = view.findViewById(android.R.id.widget_frame);
                View summaryV = view.findViewById(android.R.id.summary);
                int parentId = ((View) view.getParent()).getId();
                boolean isLanguageListRow = parentId == 0x7f0b0609;
                boolean hasRowContent = isLanguageListRow
                        || ((titleV != null && titleV.getVisibility() == View.VISIBLE)
                        && ((iconFrameV != null && iconFrameV.getVisibility() == View.VISIBLE)
                        || (widgetFrameV != null && widgetFrameV.getVisibility() == View.VISIBLE)
                        || (summaryV != null && summaryV.getVisibility() == View.VISIBLE)));
                if (hasRowContent) {
                    stylePreferenceCardRow(view, ctx, palette);
                }
            }

            // 2c. Languages section "+ Add keyboard" button (0x7f0b07da) -> 3D Liquid Glass Stadium Pill (or M3 flat pill in Classic)
            if (vid == 0x7f0b07da) {
                String tag = "lang_add_btn_v3_" + hierarchyTag;
                if (!tag.equals(sStyledViews.get(view))) {
                    sStyledViews.put(view, tag);
                    if (view.getParent() instanceof ViewGroup pvg) {
                        pvg.setClipChildren(false);
                        pvg.setClipToPadding(false);
                    }
                    view.setBackgroundTintList(null);
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        view.setStateListAnimator(null);
                        view.setElevation(0f);
                    }
                    Drawable pillBg;
                    int btnTint;
                    if (liquidGlass) {
                        pillBg = createLiquidGlassPillButtonDrawable(ctx, palette);
                        btnTint = palette.isNight ? palette.textPrimary : blendColor(0xFF1D2C5E, palette.accent, 0.35f);
                    } else {
                        GradientDrawable m3Pill = new GradientDrawable();
                        m3Pill.setShape(GradientDrawable.RECTANGLE);
                        m3Pill.setCornerRadius(dpF(ctx, 999f));
                        m3Pill.setColor(palette.accent);
                        GradientDrawable mask = new GradientDrawable();
                        mask.setShape(GradientDrawable.RECTANGLE);
                        mask.setCornerRadius(dpF(ctx, 999f));
                        mask.setColor(Color.WHITE);
                        pillBg = new RippleDrawable(ColorStateList.valueOf(palette.ripple), m3Pill, mask);
                        btnTint = palette.isNight ? palette.windowBackground : Color.WHITE;
                    }
                    if (view instanceof android.widget.Button btn) {
                        btn.setBackgroundDrawable(pillBg);
                    } else {
                        view.setBackground(pillBg);
                    }
                    view.setMinimumHeight(dp(ctx, 52));
                    view.setPadding(dp(ctx, 26), dp(ctx, 13), dp(ctx, 26), dp(ctx, 13));
                    if (view instanceof TextView tv) {
                        tv.setTextColor(btnTint);
                        tv.setAllCaps(false);
                        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                        Drawable[] cds = tv.getCompoundDrawablesRelative();
                        for (Drawable d : cds) {
                            if (d != null) {
                                d.setTint(btnTint);
                            }
                        }
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                            tv.setCompoundDrawableTintList(ColorStateList.valueOf(btnTint));
                        }
                    }
                    try {
                        ColorStateList iconCsl = ColorStateList.valueOf(btnTint);
                        view.getClass().getMethod("q", ColorStateList.class).invoke(view, iconCsl);
                    } catch (Throwable ignored) {
                    }
                    try {
                        view.getClass().getMethod("u", ColorStateList.class)
                                .invoke(view, ColorStateList.valueOf(palette.ripple));
                    } catch (Throwable ignored) {
                    }
                    view.invalidate();
                }
            }
            if (vid == 0x7f0b060a) {
                view.setVisibility(liquidGlass ? View.GONE : View.VISIBLE);
            }

            // 3. Preference list icons (@android:id/icon)
            if (view instanceof ImageView && vid == android.R.id.icon) {
                stylePreferenceIcon((ImageView) view, palette);
            }

            // 4. Theme Section "+" card (0x7f0b29ac) and Collapse button (0x7f0b29a1)
            if (vid == 0x7f0b29ac) {
                String tag = "theme_plus_v3_" + hierarchyTag;
                if (!tag.equals(sStyledViews.get(view))) {
                    sStyledViews.put(view, tag);
                    if (liquidGlass) {
                        view.setBackground(createLiquidGlassCardDrawable(ctx, palette, 20, true));
                    } else {
                        GradientDrawable flatCard = new GradientDrawable();
                        flatCard.setColor(palette.surfaceAlt);
                        flatCard.setCornerRadius(dpF(ctx, 18f));
                        view.setBackground(flatCard);
                    }
                    View p = view.getParent() instanceof View ? (View) view.getParent() : null;
                    ColorStateList clearCsl = ColorStateList.valueOf(Color.TRANSPARENT);
                    for (int depth = 0; depth < 3 && p != null; depth++) {
                        if (p.getClass().getName().contains("MaterialCardView")) {
                            try { p.getClass().getMethod("c", ColorStateList.class).invoke(p, clearCsl); } catch (Throwable ignored) {}
                            try { p.getClass().getMethod("f", ColorStateList.class).invoke(p, clearCsl); } catch (Throwable ignored) {}
                            try { p.getClass().getMethod("d", float.class).invoke(p, 0f); } catch (Throwable ignored) {}
                            try { p.getClass().getMethod("e", float.class).invoke(p, 0f); } catch (Throwable ignored) {}
                            try { p.getClass().getMethod("setCardBackgroundColor", int.class).invoke(p, Color.TRANSPARENT); } catch (Throwable ignored) {}
                            try { p.getClass().getMethod("setStrokeWidth", int.class).invoke(p, 0); } catch (Throwable ignored) {}
                            try { p.getClass().getMethod("setStrokeColor", int.class).invoke(p, Color.TRANSPARENT); } catch (Throwable ignored) {}
                            try { p.getClass().getMethod("setCardElevation", float.class).invoke(p, 0f); } catch (Throwable ignored) {}
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                                p.setForeground(null);
                            }
                            p.setBackground(null);
                            p.invalidate();
                        }
                        p = p.getParent() instanceof View ? (View) p.getParent() : null;
                    }
                    if (view instanceof ViewGroup) {
                        ViewGroup vg = (ViewGroup) view;
                        for (int i = 0; i < vg.getChildCount(); i++) {
                            View c = vg.getChildAt(i);
                            if (c instanceof ImageView) {
                                int plusTint = palette.isNight ? 0xFFE5EBFF : 0xFF4B546B;
                                ((ImageView) c).setImageTintList(ColorStateList.valueOf(plusTint));
                            }
                        }
                    }
                }
            }
            if (vid == 0x7f0b29a1) {
                String tag = "theme_collapse_v2_" + hierarchyTag;
                if (!tag.equals(sStyledViews.get(view))) {
                    sStyledViews.put(view, tag);
                    view.setBackgroundTintList(null);
                    if (liquidGlass) {
                        view.setBackground(createLiquidGlassOrbWithRipple(ctx, palette));
                    } else {
                        GradientDrawable flatPill = new GradientDrawable();
                        flatPill.setColor(palette.surfaceAlt);
                        flatPill.setCornerRadius(dpF(ctx, 999f));
                        view.setBackground(flatPill);
                    }
                    try {
                        view.getClass().getMethod("setIconTint", ColorStateList.class)
                                .invoke(view, ColorStateList.valueOf(palette.textPrimary));
                    } catch (Throwable ignored) {}
                }
            }
            if (vid == 0x7f0b29a2 && view instanceof TextView) {
                ((TextView) view).setTextColor(palette.isNight ? palette.textSecondary : 0xFF52586C);
            }
            if (vid == 0x7f0b299d && view instanceof TextView) {
                ((TextView) view).setTextColor(palette.textPrimary);
            }

            // 5. Preferences Section Pill Buttons ("Use device font size", "Use default" -> 0x7f0b29ff)
            if (vid == 0x7f0b29ff) {
                String tag = "pref_pill_v2_" + hierarchyTag;
                if (!tag.equals(sStyledViews.get(view))) {
                    sStyledViews.put(view, tag);
                    view.setBackgroundTintList(null);
                    if (liquidGlass) {
                        view.setBackground(createLiquidGlassPillButtonDrawable(ctx, palette));
                    } else {
                        GradientDrawable flatBtn = new GradientDrawable();
                        flatBtn.setColor(palette.surfaceAlt);
                        flatBtn.setCornerRadius(dpF(ctx, 999f));
                        flatBtn.setStroke(dp(ctx, 1), palette.surfaceStroke);
                        view.setBackground(flatBtn);
                    }
                    if (view instanceof TextView) {
                        TextView tv = (TextView) view;
                        tv.setTextColor(palette.isNight ? palette.textPrimary : 0xFF586076);
                        tv.setAllCaps(false);
                        tv.setPadding(dp(ctx, 16), dp(ctx, 10), dp(ctx, 16), dp(ctx, 10));
                    }
                }
            }

            // 6. Sliders (Font size, Emoji size)
            if (className.contains("com.google.android.material.slider.Slider")) {
                String tag = "slider_v3_" + hierarchyTag;
                if (!tag.equals(sStyledViews.get(view))) {
                    sStyledViews.put(view, tag);
                    int activeColor = palette.isNight ? palette.accent : 0xFF5A6175;
                    int inactiveColor = palette.isNight ? 0xFF252A3C : 0xFFE3E6F4;
                    int tickColor = palette.isNight ? blendAlpha(palette.accent, 0.45f) : 0xFF9EA5B8;
                    ColorStateList activeCsl = ColorStateList.valueOf(activeColor);
                    ColorStateList inactiveCsl = ColorStateList.valueOf(inactiveColor);
                    ColorStateList tickCsl = ColorStateList.valueOf(tickColor);
                    try {
                        view.getClass().getMethod("r", ColorStateList.class).invoke(view, activeCsl);
                    } catch (Throwable ignored) {}
                    try {
                        view.getClass().getMethod("o", ColorStateList.class).invoke(view, tickCsl);
                    } catch (Throwable ignored) {}
                    for (Class<?> c = view.getClass(); c != null && c != View.class; c = c.getSuperclass()) {
                        setPaintFieldColor(c, view, "u", inactiveColor);
                        setPaintFieldColor(c, view, "v", activeColor);
                        setPaintFieldColor(c, view, "x", activeColor);
                        setPaintFieldColor(c, view, "y", tickColor);
                        setPaintFieldColor(c, view, "z", tickColor);
                        setDeclaredField(c, view, "m", activeCsl);
                        setDeclaredField(c, view, "n", inactiveCsl);
                        setDeclaredField(c, view, "aP", tickCsl);
                        setDeclaredField(c, view, "aQ", tickCsl);
                        setDeclaredField(c, view, "bf", activeCsl);
                        setDeclaredField(c, view, "be", activeCsl);
                    }
                    try {
                        view.getClass().getMethod("setTrackActiveTintList", ColorStateList.class)
                                .invoke(view, activeCsl);
                        view.getClass().getMethod("setTrackInactiveTintList", ColorStateList.class)
                                .invoke(view, inactiveCsl);
                        view.getClass().getMethod("setThumbTintList", ColorStateList.class)
                                .invoke(view, activeCsl);
                        view.getClass().getMethod("setTickInactiveTintList", ColorStateList.class)
                                .invoke(view, tickCsl);
                        view.getClass().getMethod("setTickActiveTintList", ColorStateList.class)
                                .invoke(view, tickCsl);
                        view.getClass().getMethod("setHaloTintList", ColorStateList.class)
                                .invoke(view, ColorStateList.valueOf(blendAlpha(activeColor, 0.2f)));
                    } catch (Throwable ignored) {}
                    view.invalidate();
                }
            }

            // 7. Native Switch & SwitchCompat / MaterialSwitch
            if (liquidGlass && view instanceof Switch) {
                String tag = "switch_" + hierarchyTag;
                if (!tag.equals(sStyledViews.get(view))) {
                    sStyledViews.put(view, tag);
                    Switch sw = (Switch) view;
                    sw.setThumbTintList(null);
                    sw.setTrackTintList(null);
                    sw.setTrackDrawable(createLiquidGlassSwitchTrackDrawable(ctx, palette));
                    sw.setThumbDrawable(createLiquidGlassSwitchThumbDrawable(ctx, palette, true));
                }
            } else if (liquidGlass && (className.contains("SwitchCompat") || className.contains("MaterialSwitch"))) {
                String tag = "switchcompat_v3_" + hierarchyTag;
                if (!tag.equals(sStyledViews.get(view))) {
                    sStyledViews.put(view, tag);
                    Drawable track = createLiquidGlassSwitchTrackDrawable(ctx, palette);
                    Drawable thumb = createLiquidGlassSwitchThumbDrawable(ctx, palette, true);
                    track.setCallback(view);
                    thumb.setCallback(view);
                    try {
                        view.getClass().getMethod("setTrackTintList", ColorStateList.class).invoke(view, (Object) null);
                        view.getClass().getMethod("setThumbTintList", ColorStateList.class).invoke(view, (Object) null);
                        view.getClass().getMethod("setTrackDrawable", Drawable.class).invoke(view, track);
                        view.getClass().getMethod("setThumbDrawable", Drawable.class).invoke(view, thumb);
                    } catch (Throwable ignored) {
                    }
                    for (Class<?> c = view.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                        String cn = c.getName();
                        if (cn.endsWith("MaterialSwitch")) {
                            setDeclaredField(c, view, "n", thumb);
                            setDeclaredField(c, view, "o", null);
                            setDeclaredField(c, view, "q", track);
                            setDeclaredField(c, view, "r", null);
                            setDeclaredField(c, view, "s", null);
                            setDeclaredField(c, view, "t", null);
                            setDeclaredField(c, view, "v", null);
                            setDeclaredField(c, view, "w", null);
                        } else if (cn.endsWith("SwitchCompat")) {
                            setDeclaredField(c, view, "a", thumb);
                            setDeclaredField(c, view, "b", null);
                            setDeclaredField(c, view, "e", track);
                            setDeclaredField(c, view, "f", null);
                            setDeclaredField(c, view, "d", Boolean.FALSE);
                            setDeclaredField(c, view, "h", Boolean.FALSE);
                            setDeclaredField(c, view, "o", Boolean.FALSE);
                            setDeclaredField(c, view, "p", Boolean.FALSE);
                        }
                    }
                    view.refreshDrawableState();
                    view.requestLayout();
                    view.invalidate();
                }
            }

            // 8. Radio Buttons & Checkboxes
            if (view instanceof RadioButton) {
                RadioButton rb = (RadioButton) view;
                ColorStateList csl = new ColorStateList(
                        new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                        new int[]{palette.isNight ? palette.accent : 0xFF4D5467, palette.textSecondary}
                );
                rb.setButtonTintList(csl);
            }

            // 9. Preference TextViews (including category headers & Learn more links)
            if (view instanceof TextView) {
                TextView tv = (TextView) view;
                if (vid == android.R.id.title) {
                    boolean isCategoryHeader = view.getParent() != null
                            && view.getParent().getClass().getName().contains("RecyclerView")
                            || (view.getParent() instanceof ViewGroup pvg
                            && pvg.findViewById(android.R.id.summary) == null
                            && pvg.findViewById(android.R.id.icon_frame) == null
                            && pvg.findViewById(android.R.id.widget_frame) == null
                            && pvg.getParent() != null
                            && pvg.getParent().getClass().getName().contains("RecyclerView"));
                    tv.setTextColor(isCategoryHeader ? palette.accent : palette.textPrimary);
                } else if (vid == android.R.id.summary) {
                    tv.setTextColor(palette.textSecondary);
                    tv.setLinkTextColor(palette.accent);
                }
            }

            // Recurse
            if (view instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) view;
                for (int i = 0; i < vg.getChildCount(); i++) {
                    styleViewHierarchy(vg.getChildAt(i), palette);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void setPaintFieldColor(Class<?> cls, Object target, String fieldName, int color) {
        try {
            java.lang.reflect.Field f = cls.getDeclaredField(fieldName);
            f.setAccessible(true);
            Object p = f.get(target);
            if (p instanceof Paint paint) {
                paint.setColor(color);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void setDeclaredField(Class<?> cls, Object target, String fieldName, Object value) {
        try {
            java.lang.reflect.Field f = cls.getDeclaredField(fieldName);
            f.setAccessible(true);
            f.set(target, value);
        } catch (Throwable ignored) {
        }
    }

    private static void styleToolbarOrbButton(View btn, Palette palette) {
        Context ctx = btn.getContext();
        String tag = "tb_orb_v2_" + palette.isNight + "_" + palette.isAmoled + "_" + palette.accent;
        if (!tag.equals(sStyledViews.get(btn))) {
            sStyledViews.put(btn, tag);
            int size = dp(ctx, 42);
            int pad = dp(ctx, 9);
            ViewGroup.LayoutParams lp = btn.getLayoutParams();
            if (lp != null) {
                lp.width = size;
                lp.height = size;
                if (lp instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
                    mlp.topMargin = dp(ctx, 4);
                    mlp.bottomMargin = dp(ctx, 4);
                    mlp.setMarginStart(dp(ctx, 6));
                    mlp.setMarginEnd(dp(ctx, 6));
                }
                btn.setLayoutParams(lp);
            }
            btn.setPadding(pad, pad, pad, pad);
            if (btn instanceof ImageView) {
                ((ImageView) btn).setScaleType(ImageView.ScaleType.FIT_CENTER);
            }
            btn.setBackground(createLiquidGlassOrbWithRipple(ctx, palette));
        }
    }

    // =========================================================================
    // 60fps/120fps Hardware-Accelerated Transition Animations
    // =========================================================================

    public static void animateThemeSectionEnter(final View rootView) {
        if (rootView == null) return;
        try {
            final Context ctx = rootView.getContext();
            styleViewHierarchy(rootView, Palette.forContext(ctx));
            // Let FragmentManager's native m3_slide_* transition drive navigation cleanly without
            // stacking a second competing translationX slide on top.
            rootView.setTranslationX(0f);
            rootView.setAlpha(1f);
            rootView.post(new Runnable() {
                @Override
                public void run() {
                    try {
                        styleViewHierarchy(rootView, Palette.forContext(ctx));
                    } catch (Throwable ignored) {
                    }
                }
            });
        } catch (Throwable ignored) {
        }
    }

    public static void animateAddLanguageFragmentEnter(final View rootView) {
        if (rootView == null) return;
        try {
            final Context ctx = rootView.getContext();
            styleViewHierarchy(rootView, Palette.forContext(ctx));
            animateViewSlideFade(rootView, dpF(ctx, 44f), 250L);
        } catch (Throwable ignored) {
        }
    }

    public static void animateAddLanguageListLoaded(final View rootView) {
        if (rootView == null) return;
        try {
            final Context ctx = rootView.getContext();
            styleViewHierarchy(rootView, Palette.forContext(ctx));
            final View listContainer = findScrollableListChild(rootView);
            final View target = listContainer != null ? listContainer : rootView;
            if (Boolean.TRUE.equals(sAnimatedAddLangLists.get(target))) {
                return;
            }
            sAnimatedAddLangLists.put(target, Boolean.TRUE);
            target.animate().cancel();
            target.setTranslationY(dpF(ctx, 18f));
            target.setAlpha(0.0f);
            target.postOnAnimation(new Runnable() {
                @Override
                public void run() {
                    try {
                        target.animate()
                                .translationY(0f)
                                .alpha(1f)
                                .setDuration(240L)
                                .setInterpolator(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP
                                        ? new PathInterpolator(0.22f, 1f, 0.36f, 1f)
                                        : new DecelerateInterpolator())
                                .withLayer()
                                .start();
                    } catch (Throwable ignored) {
                        target.setTranslationY(0f);
                        target.setAlpha(1f);
                    }
                }
            });
        } catch (Throwable ignored) {
        }
    }

    private static View findScrollableListChild(View view) {
        if (view == null) return null;
        String name = view.getClass().getName();
        if (name.contains("RecyclerView") || name.contains("ListView")) {
            return view;
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                View found = findScrollableListChild(vg.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    public static void animateSubFragmentEnter(Activity activity, View pane) {
        try {
            boolean twoPaneVisible = pane != null && pane.getVisibility() == View.VISIBLE;
            View target = pane;
            if (!twoPaneVisible && activity != null) {
                View singlePane = activity.findViewById(0x7f0b01e0);
                if (singlePane != null && singlePane.getVisibility() == View.VISIBLE) {
                    target = singlePane;
                } else {
                    target = activity.findViewById(0x7f0b0224);
                }
                if (target == null) {
                    target = activity.findViewById(android.R.id.content);
                }
            }
            if (target == null) return;
            Context ctx = activity != null ? activity : target.getContext();
            styleViewHierarchy(target, Palette.forContext(ctx));
            // Single-pane fragment transactions already animate with m3_slide_*; only slide-fade the
            // two-pane detail container so standard preference sections never double-slide.
            if (twoPaneVisible) {
                animateViewSlideFade(target, dpF(ctx, 44f), 250L);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void animatePaneEnter(Activity activity, View pane) {
        if (pane == null) return;
        try {
            Context ctx = activity != null ? activity : pane.getContext();
            styleViewHierarchy(pane, Palette.forContext(ctx));
            animateViewSlideFade(pane, dpF(ctx, 56f), 260L);
        } catch (Throwable ignored) {
        }
    }

    public static void animatePaneReturn(Activity activity, View pane) {
        if (pane == null) return;
        try {
            Context ctx = activity != null ? activity : pane.getContext();
            styleViewHierarchy(pane, Palette.forContext(ctx));
            animateViewSlideFade(pane, -dpF(ctx, 42f), 240L);
        } catch (Throwable ignored) {
        }
    }

    private static void animateViewSlideFade(final View target, final float startTranslationX, final long durationMs) {
        if (target == null) return;
        try {
            target.animate().cancel();
            target.setTranslationX(startTranslationX);
            target.setAlpha(0f);
            target.postOnAnimation(new Runnable() {
                @Override
                public void run() {
                    try {
                        target.animate()
                                .translationX(0f)
                                .alpha(1f)
                                .setDuration(durationMs)
                                .setInterpolator(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP
                                        ? new PathInterpolator(0.22f, 1f, 0.36f, 1f)
                                        : new DecelerateInterpolator())
                                .withLayer()
                                .start();
                    } catch (Throwable ignored) {
                        target.setTranslationX(0f);
                        target.setAlpha(1f);
                    }
                }
            });
        } catch (Throwable ignored) {
        }
    }

    // =========================================================================
    // Standard Extension Activity Initialization & Toolbars
    // =========================================================================

    public static void initActivity(final Activity activity, Palette palette) {
        if (activity == null || palette == null) return;
        ensurePrivacyDefaultsOff(activity);

        try {
            if (activity.getActionBar() != null) {
                activity.getActionBar().hide();
            }
        } catch (Throwable ignored) {
        }

        try {
            final Window window = activity.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(palette.windowBackground));

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    try {
                        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS | WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
                        window.setStatusBarColor(Color.TRANSPARENT);
                        window.setNavigationBarColor(Color.TRANSPARENT);
                    } catch (Throwable ignored) {
                    }
                }

                if (Build.VERSION.SDK_INT >= 29) {
                    try {
                        window.setStatusBarContrastEnforced(false);
                        window.setNavigationBarContrastEnforced(false);
                    } catch (Throwable ignored) {
                    }
                }

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                    try {
                        WindowManager.LayoutParams lp = window.getAttributes();
                        lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
                        window.setAttributes(lp);
                    } catch (Throwable ignored) {
                    }
                }

                enforceHighRefreshRate(window);

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    try {
                        window.setDecorFitsSystemWindows(false);
                        WindowInsetsController controller = window.getInsetsController();
                        if (controller != null) {
                            int appearance = !palette.isNight
                                    ? (WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS)
                                    : 0;
                            controller.setSystemBarsAppearance(
                                    appearance,
                                    WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS
                            );
                        }
                    } catch (Throwable ignored) {
                    }
                } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    try {
                        View decor = window.getDecorView();
                        if (decor != null) {
                            int flags = decor.getSystemUiVisibility()
                                    | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                                    | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                                    | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
                            if (!palette.isNight) {
                                flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                            }
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && !palette.isNight) {
                                flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                            }
                            decor.setSystemUiVisibility(flags);
                        }
                    } catch (Throwable ignored) {
                    }
                }

                try {
                    final View contentView = activity.findViewById(android.R.id.content);
                    if (contentView != null) {
                        contentView.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
                            @Override
                            public android.view.WindowInsets onApplyWindowInsets(View v, android.view.WindowInsets insets) {
                                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                                    android.graphics.Insets bars = insets.getInsets(
                                            android.view.WindowInsets.Type.systemBars() | android.view.WindowInsets.Type.displayCutout()
                                    );
                                    v.setPadding(bars.left, bars.top, bars.right, bars.bottom);
                                } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT_WATCH) {
                                    v.setPadding(
                                            insets.getSystemWindowInsetLeft(),
                                            insets.getSystemWindowInsetTop(),
                                            insets.getSystemWindowInsetRight(),
                                            insets.getSystemWindowInsetBottom()
                                    );
                                }
                                return insets;
                            }
                        });
                        contentView.requestApplyInsets();
                    }
                } catch (Throwable ignored) {
                }
            }
        } catch (Throwable ignored) {
        }

        applyActivityEnterTransition(activity);
        registerPredictiveBackCallback(activity);
    }

    public static void setupSystemBars(Activity activity, Palette palette) {
        initActivity(activity, palette);
    }

    public static void registerPredictiveBackCallback(final Activity activity) {
        if (activity == null || Build.VERSION.SDK_INT < 33) return;
        try {
            Class<?> callbackClass = Class.forName("android.window.OnBackInvokedCallback");
            Class<?> dispatcherClass = Class.forName("android.window.OnBackInvokedDispatcher");

            Object callback = Proxy.newProxyInstance(
                    callbackClass.getClassLoader(),
                    new Class<?>[]{callbackClass},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) {
                            if (method.getDeclaringClass() == Object.class) {
                                if ("hashCode".equals(method.getName())) {
                                    return Integer.valueOf(System.identityHashCode(proxy));
                                }
                                if ("equals".equals(method.getName())) {
                                    Object other = args != null && args.length > 0 ? args[0] : null;
                                    return Boolean.valueOf(proxy == other);
                                }
                                if ("toString".equals(method.getName())) {
                                    return "GboardPredictiveBackCallbackProxy";
                                }
                            }
                            if ("onBackInvoked".equals(method.getName())) {
                                activity.finish();
                            }
                            return null;
                        }
                    }
            );

            Object dispatcher = activity.getClass().getMethod("getOnBackInvokedDispatcher").invoke(activity);
            if (dispatcher != null) {
                dispatcherClass.getMethod("registerOnBackInvokedCallback", int.class, callbackClass)
                        .invoke(dispatcher, 0, callback);
            }
        } catch (Throwable ignored) {
        }
    }

    public static Drawable createCardDrawable(int fillColor, int strokeColor, int cornerRadiusPx) {
        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setCornerRadius(cornerRadiusPx);
        shape.setColor(fillColor);
        if (strokeColor != Color.TRANSPARENT) {
            shape.setStroke(2, strokeColor);
        }
        return shape;
    }

    public static Drawable createClickableCardDrawable(int fillColor, int strokeColor, int rippleColor, int cornerRadiusPx) {
        Drawable content = createCardDrawable(fillColor, strokeColor, cornerRadiusPx);
        Drawable mask = createCardDrawable(Color.WHITE, Color.TRANSPARENT, cornerRadiusPx);
        return new RippleDrawable(ColorStateList.valueOf(rippleColor), content, mask);
    }

    public static View createToolbar(final Activity activity, String titleText, final Palette palette) {
        LinearLayout toolbar = new LinearLayout(activity);
        toolbar.setOrientation(LinearLayout.HORIZONTAL);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.setPadding(dp(activity, 12), dp(activity, 10), dp(activity, 16), dp(activity, 10));
        toolbar.setBackgroundColor(palette.windowBackground);

        ImageView backBtn = new ImageView(activity);
        backBtn.setPadding(dp(activity, 10), dp(activity, 10), dp(activity, 10), dp(activity, 10));
        backBtn.setImageDrawable(createBackArrowDrawable(activity, palette.textPrimary));
        if (isLiquidGlassUiEnabled(activity)) {
            backBtn.setBackground(createLiquidGlassOrbWithRipple(activity, palette));
        } else {
            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.OVAL);
            mask.setColor(Color.WHITE);
            backBtn.setBackground(new RippleDrawable(ColorStateList.valueOf(palette.ripple), null, mask));
        }
        backBtn.setClickable(true);
        backBtn.setFocusable(true);
        backBtn.setContentDescription("Back");
        backBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                activity.onBackPressed();
            }
        });

        int btnSize = dp(activity, 44);
        toolbar.addView(backBtn, new LinearLayout.LayoutParams(btnSize, btnSize));

        TextView title = new TextView(activity);
        title.setText(titleText);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        title.setTextColor(palette.textPrimary);
        title.setPadding(dp(activity, 14), 0, 0, 0);

        toolbar.addView(title, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        return toolbar;
    }

    public static Drawable createBackArrowDrawable(final Context context, final int color) {
        return new Drawable() {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            private final Path path = new Path();

            {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);
                paint.setStrokeWidth(dpF(context, 2.15f));
                paint.setColor(color);
            }

            @Override
            public void draw(Canvas canvas) {
                Rect b = getBounds();
                float size = dpF(context, 24f);
                float left = b.left + (b.width() - size) / 2f;
                float top = b.top + (b.height() - size) / 2f;
                float scale = size / 24f;
                path.reset();
                path.moveTo(left + (19f * scale), top + (12f * scale));
                path.lineTo(left + (7f * scale), top + (12f * scale));
                path.moveTo(left + (12.5f * scale), top + (6.5f * scale));
                path.lineTo(left + (7f * scale), top + (12f * scale));
                path.lineTo(left + (12.5f * scale), top + (17.5f * scale));
                canvas.drawPath(path, paint);
            }

            @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
            @Override public void setColorFilter(ColorFilter colorFilter) { paint.setColorFilter(colorFilter); }
            @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        };
    }

    public static void applyActivityEnterTransition(Context context) {
        if (context instanceof Activity) {
            applyActivityEnterTransition((Activity) context);
        }
    }

    public static void applyActivityExitTransition(Context context) {
        if (context instanceof Activity) {
            applyActivityExitTransition((Activity) context);
        }
    }

    public static void applyActivityEnterTransition(Activity activity) {
        if (activity == null) return;
        try {
            int enterAnim = 0;
            int exitAnim = 0;
            try {
                enterAnim = activity.getResources().getIdentifier("m3_act_slide_in_right", "anim", activity.getPackageName());
                exitAnim = activity.getResources().getIdentifier("m3_act_slide_out_left", "anim", activity.getPackageName());
                if (enterAnim == 0 || exitAnim == 0) {
                    enterAnim = activity.getResources().getIdentifier("m3_slide_in_right", "anim", activity.getPackageName());
                    exitAnim = activity.getResources().getIdentifier("m3_slide_out_left", "anim", activity.getPackageName());
                }
            } catch (Throwable ignored) {
            }
            if (enterAnim == 0 || exitAnim == 0) {
                enterAnim = android.R.anim.fade_in;
                exitAnim = android.R.anim.fade_out;
            }
            if (Build.VERSION.SDK_INT >= 34) {
                try {
                    activity.getClass().getMethod("overrideActivityTransition", int.class, int.class, int.class)
                            .invoke(activity, 0, enterAnim, exitAnim);
                    return;
                } catch (Throwable ignored) {
                }
            }
            activity.overridePendingTransition(enterAnim, exitAnim);
        } catch (Throwable ignored) {
        }
    }

    public static void applyActivityExitTransition(Activity activity) {
        if (activity == null) return;
        try {
            int enterAnim = 0;
            int exitAnim = 0;
            try {
                enterAnim = activity.getResources().getIdentifier("m3_act_slide_in_left", "anim", activity.getPackageName());
                exitAnim = activity.getResources().getIdentifier("m3_act_slide_out_right", "anim", activity.getPackageName());
                if (enterAnim == 0 || exitAnim == 0) {
                    enterAnim = activity.getResources().getIdentifier("m3_slide_in_left", "anim", activity.getPackageName());
                    exitAnim = activity.getResources().getIdentifier("m3_slide_out_right", "anim", activity.getPackageName());
                }
            } catch (Throwable ignored) {
            }
            if (enterAnim == 0 || exitAnim == 0) {
                enterAnim = android.R.anim.fade_in;
                exitAnim = android.R.anim.fade_out;
            }
            if (Build.VERSION.SDK_INT >= 34) {
                try {
                    activity.getClass().getMethod("overrideActivityTransition", int.class, int.class, int.class)
                            .invoke(activity, 1, enterAnim, exitAnim);
                    return;
                } catch (Throwable ignored) {
                }
            }
            activity.overridePendingTransition(enterAnim, exitAnim);
        } catch (Throwable ignored) {
        }
    }
}
