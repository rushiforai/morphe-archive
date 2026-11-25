package app.tiktoklitepatches.extension;

import static app.tiktoklitepatches.extension.ModStrings.Text.*;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.net.Uri;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.PixelCopy;
import android.view.Gravity;
import android.view.WindowInsetsController;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import java.util.function.Consumer;

public final class SettingsPageEntry {
    private static final String TAG = "lite_mod_settings_entry";

    private SettingsPageEntry() {}

    public static void attach(Activity activity) {
        if (!isSettingsPage(activity)) return;
        FrameLayout content = activity.findViewById(android.R.id.content);
        if (content == null || content.getChildCount() != 1) return;
        LinearLayout existing = content.findViewWithTag(TAG);
        if (existing != null) {
            refreshTheme(activity, existing);
            return;
        }

        View original = content.getChildAt(0);
        content.removeView(original);
        LinearLayout container = new LinearLayout(activity);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setTag(TAG);
        container.addView(original, new LinearLayout.LayoutParams(-1, 0, 1));
        ModStrings strings = ModStrings.forContext(activity);
        Button button = new Button(activity);
        button.setText(strings.get(SETTINGS));
        button.setAllCaps(true);
        button.setStateListAnimator(null);
        button.setElevation(0);
        button.setTextSize(16);
        button.setTypeface(null, Typeface.BOLD);
        button.setGravity(Gravity.CENTER);
        button.setMinHeight(dp(activity, 48));
        button.setPaddingRelative(dp(activity, 16), dp(activity, 8), dp(activity, 16), dp(activity, 8));

        FrameLayout footer = new FrameLayout(activity);
        footer.setVisibility(View.GONE);
        footer.setPadding(dp(activity, 20), dp(activity, 8), dp(activity, 20), dp(activity, 10));
        footer.setOnApplyWindowInsetsListener((view, insets) -> {
            int bottom = Build.VERSION.SDK_INT >= 30
                    ? insets.getInsets(android.view.WindowInsets.Type.navigationBars()).bottom
                    : insets.getSystemWindowInsetBottom();
            view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(),
                    Math.max(dp(activity, 10), bottom));
            return insets;
        });
        footer.addView(button, new FrameLayout.LayoutParams(-1, -2));
        container.addView(footer, new LinearLayout.LayoutParams(-1, -2));
        content.addView(container, new FrameLayout.LayoutParams(-1, -1));
        original.postDelayed(() -> {
            if (original.isAttachedToWindow()) {
                readTheme(activity, original, light -> {
                    applyTheme(activity, footer, button, light);
                    footer.setVisibility(View.VISIBLE);
                    footer.requestApplyInsets();
                    NativeAboutSection.hideWhenReady(original);
                });
            }
        }, 500);
        container.getViewTreeObserver().addOnWindowFocusChangeListener(focused -> {
            if (focused) refreshTheme(activity, container);
        });
    }

    private static void refreshTheme(Activity activity, LinearLayout container) {
        View original = container.getChildAt(0);
        FrameLayout footer = (FrameLayout) container.getChildAt(1);
        Button button = (Button) footer.getChildAt(0);
        original.postDelayed(() -> {
            if (original.isAttachedToWindow() && activity.hasWindowFocus()) {
                readTheme(activity, original, light -> applyTheme(activity, footer, button, light));
            }
        }, 250);
    }

    private static void applyTheme(Activity activity, FrameLayout footer, Button button, boolean light) {
        styleEntry(activity, footer, button, light);
        button.setOnClickListener(view -> ModSettingsActivity.open(activity, light));
    }

    private static void styleEntry(Activity activity, FrameLayout footer, Button button, boolean light) {
        footer.setBackgroundColor(light ? 0xFFF5F5F6 : 0xFF101012);
        GradientDrawable card = new GradientDrawable();
        card.setColor(ModSettingsActivity.cardColor(light));
        card.setCornerRadius(dp(activity, 18));
        card.setStroke(dp(activity, 1), ModSettingsActivity.borderColor(light));
        button.setBackgroundTintList(null);
        int ripple = (ModSettings.accentColor() & 0xFFFFFF) | 0x26000000;
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(ripple), card, null));
        button.setTextColor(ModSettingsActivity.accentText(light));
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private static void readTheme(Activity activity, View original, Consumer<Boolean> apply) {
        if (Build.VERSION.SDK_INT >= 26 && original.getHeight() > 0 && original.getWidth() > 0) {
            int[] location = new int[2];
            original.getLocationInWindow(location);
            int x = location[0];
            int y = location[1] + original.getHeight() / 2;
            Bitmap sample = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
            try {
                PixelCopy.request(activity.getWindow(), new Rect(x, y, x + 1, y + 1), sample, result -> {
                    boolean light = result == PixelCopy.SUCCESS
                            ? Color.luminance(sample.getPixel(0, 0)) > 0.5f
                            : usesLightTheme(activity);
                    sample.recycle();
                    if (!activity.isFinishing() && !activity.isDestroyed()) apply.accept(light);
                }, new Handler(Looper.getMainLooper()));
                return;
            } catch (IllegalArgumentException ignored) {
                sample.recycle();
            }
        }
        apply.accept(usesLightTheme(activity));
    }

    private static boolean usesLightTheme(Activity activity) {
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            WindowInsetsController controller = activity.getWindow().getInsetsController();
            if (controller != null) {
                return (controller.getSystemBarsAppearance()
                        & WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS) != 0;
            }
        }
        return (activity.getWindow().getDecorView().getSystemUiVisibility()
                & View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR) != 0;
    }

    private static boolean isSettingsPage(Activity activity) {
        try {
            Object spark = activity.getClass().getMethod("LIILLL").invoke(activity);
            if (spark == null) return false;
            String schema;
            try {
                schema = (String) spark.getClass().getMethod("LIIIL").invoke(spark);
            } catch (NoSuchMethodException ignored) {
                // 47.8.2 exposes the Spark schema with its query parameters through LJIII.
                schema = (String) spark.getClass().getMethod("LJIII").invoke(spark);
            }
            if (schema == null || schema.isEmpty()) return false;
            Uri uri = Uri.parse(schema);
            if ("settings".equals(uri.getQueryParameter("roma_page_key"))) return true;
            String source = uri.getQueryParameter("surl");
            if (source != null) {
                String path = Uri.parse(source).getPath();
                if (path != null && path.endsWith("/pages/settings/template.js")) return true;
            }
            ClassLoader loader = activity.getClassLoader();
            Class<?> page = Class.forName("X.P3f", false, loader);
            Object settings = page.getField("SETTINGS").get(null);
            return Boolean.TRUE.equals(Class.forName("X.P3h", false, loader)
                    .getMethod("LBL", page, String.class).invoke(null, settings, schema));
        } catch (ReflectiveOperationException | IllegalArgumentException ignored) {
            return false;
        }
    }
}
