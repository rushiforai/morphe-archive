package com.akshaykadam.pixelboard.extension.settings;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.Display;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public final class GboardM3Helper {

    public static final String PREF_APPEARANCE = "gboard_pro_appearance_prefs";
    public static final String KEY_UI_THEME = "selected_gboard_ui_theme";

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

        public Palette(int windowBackground, int surface, int surfaceAlt, int surfaceStroke,
                       int textPrimary, int textSecondary, int accent, int accentContainer,
                       int onAccentContainer, int ripple, boolean isNight) {
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
        }

        public static Palette forContext(Context context) {
            Configuration config = context.getResources().getConfiguration();
            boolean night = (config.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;

            String selectedTheme = "default";
            try {
                SharedPreferences prefs = context.getSharedPreferences(PREF_APPEARANCE, Context.MODE_PRIVATE);
                selectedTheme = prefs.getString(KEY_UI_THEME, "default");
            } catch (Throwable ignored) {
            }

                        // Material 3 Expressive Multi-Color Theme Overrides
            if ("blush_lilac".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF181122, // windowBackground
                            0xFF241C2E, // surface
                            0xFF322840, // surfaceAlt
                            0x44D0BCFF, // surfaceStroke
                            0xFFF5EEFF, // textPrimary
                            0xFFCCC2DC, // textSecondary
                            0xFFD0BCFF, // accent
                            0xFF4F378B, // accentContainer
                            0xFFEADDFF, // onAccentContainer
                            0x33D0BCFF, // ripple
                            true
                    );
                } else {
                    return new Palette(
                            0xFFF7EFFA, // windowBackground (Screenshot matched)
                            0xFFFFFFFF, // surface
                            0xFFEBD7FA, // surfaceAlt (Pill container)
                            0x33542983, // surfaceStroke
                            0xFF24152F, // textPrimary
                            0xFF5F4B6E, // textSecondary
                            0xFF542983, // accent (Royal violet switch/radio)
                            0xFFEBD7FA, // accentContainer
                            0xFF24152F, // onAccentContainer
                            0x26542983, // ripple
                            false
                    );
                }
            } else if ("cotton_candy".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF1F1117,
                            0xFF2E1922,
                            0xFF402330,
                            0x44FF80AB,
                            0xFFFCE4EC,
                            0xFFF8BBD0,
                            0xFFFF80AB,
                            0xFF880E4F,
                            0xFFFCE4EC,
                            0x33FF80AB,
                            true
                    );
                } else {
                    return new Palette(
                            0xFFFDE7E9, // windowBackground (Screenshot matched)
                            0xFFFFFFFF, // surface
                            0xFFF6B0CA, // surfaceAlt (Pill container)
                            0x33B80058, // surfaceStroke
                            0xFF2D121B, // textPrimary
                            0xFF6D4352, // textSecondary
                            0xFFB80058, // accent (Vivid raspberry magenta switch/radio)
                            0xFFF6B0CA, // accentContainer
                            0xFF2D121B, // onAccentContainer
                            0x26B80058, // ripple
                            false
                    );
                }
            } else if ("sunset_peach".equals(selectedTheme) || "rainbow".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF1C1310,
                            0xFF281C17,
                            0xFF372720,
                            0x44FF8A65,
                            0xFFFBE9E7,
                            0xFFFFCCBC,
                            0xFFFF7043,
                            0xFF5D2416,
                            0xFFFFDBCF,
                            0x33FF7043,
                            true
                    );
                } else {
                    return new Palette(
                            0xFFFDE8E7, // windowBackground (Screenshot matched)
                            0xFFFFFFFF, // surface
                            0xFFFD987C, // surfaceAlt (Pill container)
                            0x33D35A2D, // surfaceStroke
                            0xFF2D1610, // textPrimary
                            0xFF6E443A, // textSecondary
                            0xFFD35A2D, // accent (Burnt orange terracotta switch/radio)
                            0xFFFD987C, // accentContainer
                            0xFF2D1610, // onAccentContainer
                            0x26D35A2D, // ripple
                            false
                    );
                }
            } else if ("fresh_mint".equals(selectedTheme) || "botanical".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF0E1815,
                            0xFF162520,
                            0xFF20342E,
                            0x4480CBC4,
                            0xFFE0F2F1,
                            0xFFB2DFDB,
                            0xFF4DB6AC,
                            0xFF0E3E37,
                            0xFFB2DFDB,
                            0x334DB6AC,
                            true
                    );
                } else {
                    return new Palette(
                            0xFFEFF5F5, // windowBackground (Screenshot matched)
                            0xFFFFFFFF, // surface
                            0xFFD4FAEF, // surfaceAlt (Pill container)
                            0x33046665, // surfaceStroke
                            0xFF0E1F1E, // textPrimary
                            0xFF3F5C5A, // textSecondary
                            0xFF046665, // accent (Pine teal switch/radio)
                            0xFFD4FAEF, // accentContainer
                            0xFF0E1F1E, // onAccentContainer
                            0x26046665, // ripple
                            false
                    );
                }
            } else if ("ocean".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF101322,
                            0xFF191D32,
                            0xFF232845,
                            0x449FA8DA,
                            0xFFE8EAF6,
                            0xFFC5CAE9,
                            0xFF7986CB,
                            0xFF1E265C,
                            0xFFE8EAF6,
                            0x337986CB,
                            true
                    );
                } else {
                    return new Palette(
                            0xFFF6F8FE,
                            0xFFEEF2FC,
                            0xFFE0E7FA,
                            0x263949AB,
                            0xFF12182E,
                            0xFF3F4A6A,
                            0xFF3949AB,
                            0xFFD1C4E9,
                            0xFF101642,
                            0x263949AB,
                            false
                    );
                }
            }

            // Default Dynamic Palette (Monet on Android 12+)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                try {
                    int bg = context.getColor(night ? android.R.color.system_neutral1_900 : android.R.color.system_neutral1_50);
                    int surf = context.getColor(night ? android.R.color.system_neutral1_800 : android.R.color.system_neutral1_10);
                    int surfAlt = context.getColor(night ? android.R.color.system_neutral1_700 : android.R.color.system_neutral1_100);
                    int stroke = blendAlpha(context.getColor(night ? android.R.color.system_neutral2_700 : android.R.color.system_neutral2_200), 0.5f);
                    int textP = context.getColor(night ? android.R.color.system_neutral1_100 : android.R.color.system_neutral1_900);
                    int textS = context.getColor(night ? android.R.color.system_neutral2_200 : android.R.color.system_neutral2_700);
                    int acc = context.getColor(night ? android.R.color.system_accent1_200 : android.R.color.system_accent1_600);
                    int accCont = context.getColor(night ? android.R.color.system_accent1_700 : android.R.color.system_accent1_100);
                    int onAccCont = context.getColor(night ? android.R.color.system_accent1_100 : android.R.color.system_accent1_900);
                    int rip = blendAlpha(acc, night ? 0.20f : 0.12f);
                    return new Palette(bg, surf, surfAlt, stroke, textP, textS, acc, accCont, onAccCont, rip, night);
                } catch (Throwable ignored) {
                }
            }

            if (night) {
                return new Palette(
                        0xFF121316, // windowBackground
                        0xFF1E1F24, // surface
                        0xFF2A2B32, // surfaceAlt
                        0x33FFFFFF, // surfaceStroke
                        0xFFE3E2E6, // textPrimary
                        0xFFC4C6D0, // textSecondary
                        0xFFA8C7FA, // accent
                        0xFF004A77, // accentContainer
                        0xFFC2E7FF, // onAccentContainer
                        0x33A8C7FA, // ripple
                        true
                );
            } else {
                return new Palette(
                        0xFFFDFCFF, // windowBackground
                        0xFFF0F4F9, // surface
                        0xFFE3E8EF, // surfaceAlt
                        0x1F000000, // surfaceStroke
                        0xFF1A1C1E, // textPrimary
                        0xFF44474E, // textSecondary
                        0xFF0B57D0, // accent
                        0xFFD3E3FD, // accentContainer
                        0xFF041E49, // onAccentContainer
                        0x260B57D0, // ripple
                        false
                );
            }
        }
    }

    public static int resolveActivityTheme(Activity activity) {
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

    public static int blendAlpha(int color, float alpha) {
        int a = Math.round(Color.alpha(color) * alpha);
        return Color.argb(a, Color.red(color), Color.green(color), Color.blue(color));
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
                        // First pass: look for highest refresh rate matching current screen resolution
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
                        // Second pass fallback if no match found
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

            // Enforce max refresh rate (144Hz for tablets like Redmi Pad 7 Pro, 120Hz, 90Hz)
            if (highestRate >= 90.0f) {
                lp.preferredRefreshRate = highestRate;
                if (bestModeId != 0 && Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    lp.preferredDisplayModeId = bestModeId;
                }
            } else {
                // Default high refresh rate request to 144Hz
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
                    // Crucial fix for photo_1_2026-10-29_12-48-19.jpg:
                    // The InputMethodService Window and DecorView cover the ENTIRE screen.
                    // The window MUST ALWAYS have a transparent background so it never blocks
                    // or blacks out the user's application above the keyboard.
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
        // Intentionally NO-OP for Window / DecorView background!
        // The IME Window and DecorView span the ENTIRE display. Painting them opaque
        // occludes the host application (WhatsApp, Telegram, browser, etc.).
        // The IME Window must strictly remain transparent.
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

    public static void initActivity(final Activity activity, Palette palette) {
        if (activity == null || palette == null) return;

        // Hide action bar safely
        try {
            if (activity.getActionBar() != null) {
                activity.getActionBar().hide();
            }
        } catch (Throwable ignored) {
        }

        // Configure window, system bars, edge-to-edge and refresh rate safely
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

                // Android 10+ (API 29+): disable contrast enforcement so bars remain completely transparent
                if (Build.VERSION.SDK_INT >= 29) {
                    try {
                        window.setStatusBarContrastEnforced(false);
                        window.setNavigationBarContrastEnforced(false);
                    } catch (Throwable ignored) {
                    }
                }

                // Android 9+ (API 28+): extend layout into display cutout (notch / punch hole)
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                    try {
                        WindowManager.LayoutParams lp = window.getAttributes();
                        lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
                        window.setAttributes(lp);
                    } catch (Throwable ignored) {
                    }
                }

                enforceHighRefreshRate(window);

                // Android 11+ (API 30+): full edge-to-edge drawing
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

                // Inset padding listener on the content root to prevent system bar overlap
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

        // Apply smooth transition animations
        applyActivityEnterTransition(activity);

        // Register Android 13+ Predictive Back callback
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
            shape.setStroke(1, strokeColor);
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
        toolbar.setPadding(dp(activity, 8), dp(activity, 12), dp(activity, 16), dp(activity, 12));
        toolbar.setBackgroundColor(palette.windowBackground);

        ImageView backBtn = new ImageView(activity);
        backBtn.setPadding(dp(activity, 12), dp(activity, 12), dp(activity, 12), dp(activity, 12));
        backBtn.setImageDrawable(createBackArrowDrawable(activity, palette.textPrimary));
        backBtn.setBackground(createClickableCardDrawable(
                Color.TRANSPARENT, Color.TRANSPARENT, palette.ripple, dp(activity, 24)));
        backBtn.setClickable(true);
        backBtn.setFocusable(true);
        backBtn.setContentDescription("Back");
        backBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                activity.onBackPressed();
            }
        });

        int btnSize = dp(activity, 48);
        toolbar.addView(backBtn, new LinearLayout.LayoutParams(btnSize, btnSize));

        TextView title = new TextView(activity);
        title.setText(titleText);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(palette.textPrimary);
        title.setPadding(dp(activity, 12), 0, 0, 0);

        toolbar.addView(title, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        return toolbar;
    }

    private static Drawable createBackArrowDrawable(Context context, int color) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.OVAL);
        d.setColor(color);
        return d;
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
                enterAnim = activity.getResources().getIdentifier("m3_slide_in_right", "anim", activity.getPackageName());
                exitAnim = activity.getResources().getIdentifier("m3_slide_out_left", "anim", activity.getPackageName());
            } catch (Throwable ignored) {
            }
            if (enterAnim != 0 && exitAnim != 0) {
                activity.overridePendingTransition(enterAnim, exitAnim);
            } else {
                activity.overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void applyActivityExitTransition(Activity activity) {
        if (activity == null) return;
        try {
            int enterAnim = 0;
            int exitAnim = 0;
            try {
                enterAnim = activity.getResources().getIdentifier("m3_slide_in_left", "anim", activity.getPackageName());
                exitAnim = activity.getResources().getIdentifier("m3_slide_out_right", "anim", activity.getPackageName());
            } catch (Throwable ignored) {
            }
            if (enterAnim != 0 && exitAnim != 0) {
                activity.overridePendingTransition(enterAnim, exitAnim);
            } else {
                activity.overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
            }
        } catch (Throwable ignored) {
        }
    }
}
