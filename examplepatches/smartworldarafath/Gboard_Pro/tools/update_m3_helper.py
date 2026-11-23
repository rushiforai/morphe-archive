code = '''package com.akshaykadam.pixelboard.extension.settings;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
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
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.Switch;
import android.widget.TextView;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;

public final class GboardM3Helper {

    public static final String PREF_APPEARANCE = "gboard_pro_appearance_prefs";
    public static final String KEY_UI_THEME = "selected_gboard_ui_theme";

    private static final Map<Activity, String> sAppliedThemes = new WeakHashMap<>();

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

            String selectedTheme = getSelectedThemeKey(context);

            if ("blush_lilac".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF181122, 0xFF241C2E, 0xFF322840, 0x44D0BCFF,
                            0xFFF5EEFF, 0xFFCCC2DC, 0xFFD0BCFF, 0xFF4F378B,
                            0xFFEADDFF, 0x33D0BCFF, true
                    );
                } else {
                    return new Palette(
                            0xFFF5EFF9, // Window Background (Exact sampled: #F5EFF9)
                            0xFFFFFFFF,
                            0xFFE4CEFF, // Card Container pill (Exact sampled: #E4CEFF)
                            0x33522781,
                            0xFF1F1A24, // Text Primary
                            0xFF5F4B6E, // Text Secondary
                            0xFF522781, // Accent / Switch / Radio / Header (Exact sampled: #522781)
                            0xFFE4CEFF, // Accent Container
                            0xFF1F1A24, // On Accent Container
                            0x26522781,
                            false
                    );
                }
            } else if ("cotton_candy".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF1F1117, 0xFF2E1922, 0xFF402330, 0x44FF80AB,
                            0xFFFCE4EC, 0xFFF8BBD0, 0xFFFF80AB, 0xFF880E4F,
                            0xFFFCE4EC, 0x33FF80AB, true
                    );
                } else {
                    return new Palette(
                            0xFFFFE7EB, // Window Background (Exact sampled: #FFE7EB)
                            0xFFFFFFFF,
                            0xFFFFAACD, // Card Container pill (Exact sampled: #FFAACD)
                            0x33B80056,
                            0xFF201A1B, // Text Primary
                            0xFF6D4352, // Text Secondary
                            0xFFB80056, // Accent / Switch / Radio / Header (Exact sampled: #B80056)
                            0xFFFFAACD, // Accent Container
                            0xFF201A1B, // On Accent Container
                            0x26B80056,
                            false
                    );
                }
            } else if ("sunset_peach".equals(selectedTheme) || "rainbow".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF1C1310, 0xFF281C17, 0xFF372720, 0x44FF8A65,
                            0xFFFBE9E7, 0xFFFFCCBC, 0xFFFF7043, 0xFF5D2416,
                            0xFFFFDBCF, 0x33FF7043, true
                    );
                } else {
                    return new Palette(
                            0xFFFEE9E6, // Window Background (Exact sampled: #FEE9E6)
                            0xFFFFFFFF,
                            0xFFFF936F, // Card Container pill (Exact sampled: #FF936F)
                            0x33D05A2C,
                            0xFF241A16, // Text Primary
                            0xFF6E443A, // Text Secondary
                            0xFFD05A2C, // Accent / Switch / Radio / Header (Exact sampled: #D05A2C)
                            0xFFFF936F, // Accent Container
                            0xFF241A16, // On Accent Container
                            0x26D05A2C,
                            false
                    );
                }
            } else if ("fresh_mint".equals(selectedTheme) || "botanical".equals(selectedTheme)) {
                if (night) {
                    return new Palette(
                            0xFF0E1815, 0xFF162520, 0xFF20342E, 0x4480CBC4,
                            0xFFE0F2F1, 0xFFB2DFDB, 0xFF4DB6AC, 0xFF0E3E37,
                            0xFFB2DFDB, 0x334DB6AC, true
                    );
                } else {
                    return new Palette(
                            0xFFEFF5F3, // Window Background (Exact sampled: #EFF5F3)
                            0xFFFFFFFF,
                            0xFFCEEED6, // Card Container pill (Exact sampled: #CEEED6)
                            0x33036564,
                            0xFF191C1B, // Text Primary
                            0xFF3F5C5A, // Text Secondary
                            0xFF036564, // Accent / Switch / Radio / Header (Exact sampled: #036564)
                            0xFFCEEED6, // Accent Container
                            0xFF191C1B, // On Accent Container
                            0x26036564,
                            false
                    );
                }
            }

            // Default Dynamic Monet Palette
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
                        0xFF121316, 0xFF1E1F24, 0xFF2A2B32, 0x33FFFFFF,
                        0xFFE3E2E6, 0xFFC4C6D0, 0xFFA8C7FA, 0xFF004A77,
                        0xFFC2E7FF, 0x33A8C7FA, true
                );
            } else {
                return new Palette(
                        0xFFEBF3FE, 0xFFF0F4F9, 0xFFBBDCFB, 0x1F000000,
                        0xFF1A1C1E, 0xFF44474E, 0xFF0854C4, 0xFFBBDCFB,
                        0xFF041E49, 0x260854C4, false
                );
            }
        }
    }

    public static String getSelectedThemeKey(Context context) {
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREF_APPEARANCE, Context.MODE_PRIVATE);
            return prefs.getString(KEY_UI_THEME, "blush_lilac");
        } catch (Throwable ignored) {
            return "blush_lilac";
        }
    }

    public static void applyTheme(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;

        final String themeKey = getSelectedThemeKey(activity);
        sAppliedThemes.put(activity, themeKey);

        final Palette palette = Palette.forContext(activity);

        // 1. Apply style overlay if custom theme
        if (!"default".equals(themeKey)) {
            String styleName = "GboardProTheme_BlushLilac";
            if ("cotton_candy".equals(themeKey)) {
                styleName = "GboardProTheme_CottonCandy";
            } else if ("sunset_peach".equals(themeKey) || "rainbow".equals(themeKey)) {
                styleName = "GboardProTheme_SunsetPeach";
            } else if ("fresh_mint".equals(themeKey) || "botanical".equals(themeKey)) {
                styleName = "GboardProTheme_FreshMint";
            }

            try {
                int resId = activity.getResources().getIdentifier(styleName, "style", activity.getPackageName());
                if (resId != 0) {
                    activity.getTheme().applyStyle(resId, true);
                }
            } catch (Throwable ignored) {
            }
        }

        // 2. Configure window and system bars
        try {
            Window window = activity.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(palette.windowBackground));
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    try {
                        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS | WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
                        window.setStatusBarColor(palette.windowBackground);
                        window.setNavigationBarColor(palette.windowBackground);
                    } catch (Throwable ignored) {
                    }
                }

                enforceHighRefreshRate(window);

                // Setup light system bar icons (dark icons against light background)
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
                            int flags = decor.getSystemUiVisibility();
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

                // 3. Attach View Hierarchy Stylist
                final View decor = window.getDecorView();
                if (decor != null) {
                    decor.setBackgroundColor(palette.windowBackground);
                    decor.post(new Runnable() {
                        @Override
                        public void run() {
                            styleViewHierarchy(decor, palette, themeKey);
                        }
                    });

                    decor.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                        @Override
                        public void onGlobalLayout() {
                            try {
                                styleViewHierarchy(decor, palette, themeKey);
                            } catch (Throwable ignored) {
                            }
                        }
                    });
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onActivityResume(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;

        String currentKey = getSelectedThemeKey(activity);
        String lastApplied = sAppliedThemes.get(activity);

        if (lastApplied != null && !lastApplied.equals(currentKey)) {
            sAppliedThemes.put(activity, currentKey);
            activity.recreate();
            return;
        }

        sAppliedThemes.put(activity, currentKey);
        applyTheme(activity);
    }

    public static void styleViewHierarchy(View view, Palette palette, String themeKey) {
        if (view == null || palette == null) return;

        try {
            // 1. Toolbars
            String className = view.getClass().getName();
            if (className.contains("Toolbar")) {
                view.setBackgroundColor(palette.windowBackground);
                try {
                    Method getNavIcon = view.getClass().getMethod("getNavigationIcon");
                    Drawable navIcon = (Drawable) getNavIcon.invoke(view);
                    if (navIcon != null) {
                        navIcon.setColorFilter(new PorterDuffColorFilter(palette.accent, PorterDuff.Mode.SRC_IN));
                    }
                } catch (Throwable ignored) {
                }
                try {
                    Method setTitleTextColor = view.getClass().getMethod("setTitleTextColor", int.class);
                    setTitleTextColor.invoke(view, palette.textPrimary);
                } catch (Throwable ignored) {
                }
            }

            // 2. Lists & Recyclers
            if (className.contains("RecyclerView") || className.contains("ListView")) {
                view.setBackgroundColor(palette.windowBackground);
            }

            // 3. Radio Buttons & Checkboxes
            if (view instanceof RadioButton) {
                RadioButton rb = (RadioButton) view;
                ColorStateList csl = new ColorStateList(
                        new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                        new int[]{palette.accent, palette.surfaceStroke}
                );
                rb.setButtonTintList(csl);
            } else if (view instanceof CompoundButton) {
                CompoundButton cb = (CompoundButton) view;
                ColorStateList csl = new ColorStateList(
                        new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                        new int[]{palette.accent, palette.surfaceStroke}
                );
                cb.setButtonTintList(csl);
            }

            // 4. Switches
            if (view instanceof Switch) {
                Switch sw = (Switch) view;
                ColorStateList trackCsl = new ColorStateList(
                        new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                        new int[]{palette.accent, palette.surfaceStroke}
                );
                ColorStateList thumbCsl = new ColorStateList(
                        new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                        new int[]{Color.WHITE, palette.textSecondary}
                );
                sw.setTrackTintList(trackCsl);
                sw.setThumbTintList(thumbCsl);
            } else if (className.contains("SwitchCompat")) {
                try {
                    ColorStateList trackCsl = new ColorStateList(
                            new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                            new int[]{palette.accent, palette.surfaceStroke}
                    );
                    ColorStateList thumbCsl = new ColorStateList(
                            new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                            new int[]{Color.WHITE, palette.textSecondary}
                    );
                    Method setTrack = view.getClass().getMethod("setTrackTintList", ColorStateList.class);
                    Method setThumb = view.getClass().getMethod("setThumbTintList", ColorStateList.class);
                    setTrack.invoke(view, trackCsl);
                    setThumb.invoke(view, thumbCsl);
                } catch (Throwable ignored) {
                }
            }

            // 5. Icons in Preference Items
            if (view instanceof ImageView) {
                ImageView iv = (ImageView) view;
                int id = iv.getId();
                // Check if it is preference icon
                if (id == android.R.id.icon) {
                    iv.setColorFilter(new PorterDuffColorFilter(palette.accent, PorterDuff.Mode.SRC_IN));
                }
            }

            // 6. ColoredBackgroundSwitchPreference container detection
            // Check if view contains switch and has minHeight ~60dp or background drawable
            if (view instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) view;
                boolean hasSwitch = false;
                for (int i = 0; i < vg.getChildCount(); i++) {
                    View child = vg.getChildAt(i);
                    if (child instanceof Switch || child.getClass().getName().contains("SwitchCompat")) {
                        hasSwitch = true;
                        break;
                    }
                }
                if (hasSwitch && view.getMinimumHeight() >= dp(view.getContext(), 50)) {
                    GradientDrawable gd = new GradientDrawable();
                    gd.setShape(GradientDrawable.RECTANGLE);
                    gd.setColor(palette.accentContainer);
                    gd.setCornerRadius(dp(view.getContext(), 24));
                    view.setBackground(gd);
                }
            }

            // 7. TextViews (Titles, Category Headers, Summaries)
            if (view instanceof TextView) {
                TextView tv = (TextView) view;
                int id = tv.getId();
                CharSequence text = tv.getText();
                if (text != null && text.length() > 0) {
                    // Check if parent is category container or has category style
                    ViewGroup.LayoutParams lp = tv.getLayoutParams();
                    View parent = (View) tv.getParent();
                    boolean isCategory = false;

                    if (parent instanceof ViewGroup) {
                        ViewGroup parentVg = (ViewGroup) parent;
                        if (parentVg.getParent() instanceof ViewGroup) {
                            ViewGroup grandParent = (ViewGroup) parentVg.getParent();
                            ViewGroup.LayoutParams gpLp = grandParent.getLayoutParams();
                            if (gpLp instanceof ViewGroup.MarginLayoutParams) {
                                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) gpLp;
                                if (mlp.topMargin >= dp(tv.getContext(), 12)) {
                                    isCategory = true;
                                }
                            }
                        }
                    }

                    if (isCategory) {
                        tv.setTextColor(palette.accent);
                        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
                    } else if (id == android.R.id.title) {
                        // If inside a ColoredBackgroundSwitchPreference, use onAccentContainer
                        View p = parent;
                        boolean insideCard = false;
                        while (p != null && !(p instanceof Activity)) {
                            if (p.getBackground() instanceof GradientDrawable) {
                                insideCard = true;
                                break;
                            }
                            if (p.getParent() instanceof View) {
                                p = (View) p.getParent();
                            } else {
                                break;
                            }
                        }
                        if (insideCard) {
                            tv.setTextColor(palette.onAccentContainer);
                        } else {
                            tv.setTextColor(palette.textPrimary);
                        }
                    } else if (id == android.R.id.summary) {
                        tv.setTextColor(palette.textSecondary);
                    }
                }
            }

            // Recurse children
            if (view instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) view;
                for (int i = 0; i < vg.getChildCount(); i++) {
                    styleViewHierarchy(vg.getChildAt(i), palette, themeKey);
                }
            }
        } catch (Throwable ignored) {
        }
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
            float highestRate = 144.0f;
            lp.preferredRefreshRate = highestRate;
            if (Build.VERSION.SDK_INT >= 31) {
                try {
                    window.getClass().getMethod("setFrameRateSelectionPriority", int.class).invoke(window, 100);
                } catch (Throwable ignored) {
                }
            }
            window.setAttributes(lp);
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
                    // Transparency safeguard: IME window must remain transparent
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
    }

    public static void initActivity(final Activity activity, Palette palette) {
        if (activity == null || palette == null) return;
        applyTheme(activity);
        applyActivityEnterTransition(activity);
        registerPredictiveBackCallback(activity);
    }

    public static void setupSystemBars(Activity activity, Palette palette) {
        applyTheme(activity);
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
        toolbar.addView(backBtn);

        TextView titleView = new TextView(activity);
        titleView.setText(titleText);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        titleView.setTextColor(palette.textPrimary);
        titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        titleView.setPadding(dp(activity, 12), 0, 0, 0);
        toolbar.addView(titleView);

        return toolbar;
    }

    public static Drawable createBackArrowDrawable(Context context, int color) {
        float density = context.getResources().getDisplayMetrics().density;
        int size = Math.round(24 * density);
        android.graphics.Bitmap bitmap = android.graphics.Bitmap.createBitmap(size, size, android.graphics.Bitmap.Config.ARGB_8888);
        android.graphics.Canvas canvas = new android.graphics.Canvas(bitmap);
        android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        paint.setColor(color);
        paint.setStyle(android.graphics.Paint.Style.STROKE);
        paint.setStrokeWidth(2.5f * density);
        paint.setStrokeCap(android.graphics.Paint.Cap.ROUND);
        paint.setStrokeJoin(android.graphics.Paint.Join.ROUND);

        float pad = 4 * density;
        android.graphics.Path path = new android.graphics.Path();
        path.moveTo(size - pad - 2 * density, size / 2.0f);
        path.lineTo(pad + 2 * density, size / 2.0f);
        path.moveTo(pad + 8 * density, pad + 2 * density);
        path.lineTo(pad + 2 * density, size / 2.0f);
        path.lineTo(pad + 8 * density, size - pad - 2 * density);
        canvas.drawPath(path, paint);

        return new android.graphics.drawable.BitmapDrawable(context.getResources(), bitmap);
    }

    public static void applyActivityEnterTransition(Activity activity) {
        if (activity == null) return;
        try {
            activity.overridePendingTransition(android.R.anim.slide_in_left, android.R.anim.fade_out);
        } catch (Throwable ignored) {
        }
    }

    public static void applyActivityExitTransition(Activity activity) {
        if (activity == null) return;
        try {
            activity.overridePendingTransition(android.R.anim.fade_in, android.R.anim.slide_out_right);
        } catch (Throwable ignored) {
        }
    }
}
'''

with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java', 'w', encoding='utf-8') as f:
    f.write(code)
print("Updated GboardM3Helper.java successfully!")
