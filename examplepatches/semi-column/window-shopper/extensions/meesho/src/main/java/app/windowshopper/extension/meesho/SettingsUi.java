package app.windowshopper.extension.meesho;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.content.ComponentName;
import android.content.ActivityNotFoundException;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.Toolbar;

public final class SettingsUi {
    static final int ACCENT = Color.rgb(159, 37, 112);
    private static final int INK = 0xFF1A1C1E;
    private static final int MUTED = 0xFF43474E;
    private static final int BACKGROUND = 0xFFFDFCFF;
    private static final int PRIMARY = 0xFF005FAC;
    private static final String[] CATEGORIES = {"Ads", "Ratings", "Layout"};

    private SettingsUi() {}

    static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    static Drawable background(int color, int radius, Activity activity) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(dp(activity, radius));
        return shape;
    }

    static Drawable buttonBackground(Activity activity, boolean filled) {
        return new RippleDrawable(ColorStateList.valueOf(
            filled ? 0x33FFFFFF : 0x189F2570),
            background(filled ? ACCENT : Color.WHITE, 28, activity), null);
    }

    public static void show(Activity activity) {
        Dialog dialog = new Dialog(activity, android.R.style.Theme_Material_Light_NoActionBar);
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(BACKGROUND);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });

        Toolbar toolbar = new Toolbar(activity);
        toolbar.setTitle("Morphe");
        toolbar.setTitleTextColor(INK);
        toolbar.setNavigationIcon(new BackIcon(activity));
        toolbar.setNavigationContentDescription("Back");
        toolbar.setNavigationOnClickListener(view -> dialog.dismiss());
        root.addView(toolbar, new LinearLayout.LayoutParams(-1, dp(activity, 56)));

        ScrollView scroll = new ScrollView(activity);
        LinearLayout preferences = new LinearLayout(activity);
        preferences.setOrientation(LinearLayout.VERTICAL);
        preferences.setPadding(0, 0, 0, dp(activity, 16));
        scroll.addView(preferences);
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));

        for (int category = 0; category < CATEGORIES.length; category++) {
            TextView heading = text(activity, CATEGORIES[category], 14, PRIMARY, true);
            heading.setPadding(dp(activity, 16), dp(activity, 24), dp(activity, 16), dp(activity, 8));
            heading.setAccessibilityHeading(true);
            preferences.addView(heading);
            for (Settings.Feature feature : Settings.Feature.values()) {
                if (feature.category == category) preferences.addView(featureRow(activity, feature));
            }
        }

        LinearLayout apply = new LinearLayout(activity);
        apply.setOrientation(LinearLayout.VERTICAL);
        apply.setPadding(dp(activity, 16), dp(activity, 20), dp(activity, 16), dp(activity, 20));
        apply.setMinimumHeight(dp(activity, 64));
        apply.setBackground(new RippleDrawable(ColorStateList.valueOf(0x1F005FAC),
            null, new ColorDrawable(Color.WHITE)));
        apply.addView(text(activity, "Apply & reopen Meesho", 16, PRIMARY, false));
        TextView applySummary = text(activity, "Rebuild navigation and profile. Your sign-in is kept.",
            14, MUTED, false);
        applySummary.setPadding(0, dp(activity, 4), 0, 0);
        apply.addView(applySummary);
        preferences.addView(apply, new LinearLayout.LayoutParams(-1, -2));
        TextView note = text(activity,
            "Settings are saved automatically. Reload results after changing filters; "
            + "cached content may need a fresh response.", 13, MUTED, false);
        note.setPadding(dp(activity, 16), dp(activity, 8), dp(activity, 16), dp(activity, 16));
        preferences.addView(note);
        apply.setOnClickListener(view -> {
            try {
                activity.startActivity(Intent.makeRestartActivityTask(new ComponentName(
                    activity, "com.meesho.supply.main.MainActivity")));
                dialog.dismiss();
            } catch (ActivityNotFoundException error) {
                Log.e("WindowShopper", "Meesho main entry unavailable", error);
                Toast.makeText(activity, "Could not reopen Meesho; reopen it manually", Toast.LENGTH_LONG).show();
            }
        });
        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window == null) throw new IllegalStateException("Morphe settings window unavailable");
        window.setStatusBarColor(BACKGROUND);
        window.setNavigationBarColor(BACKGROUND);
        window.getDecorView().setSystemUiVisibility(
            View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        dialog.show();
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        root.requestApplyInsets();
    }

    private static View featureRow(Activity activity, Settings.Feature feature) {
        boolean available = feature.available();
        LinearLayout row = new LinearLayout(activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(activity, 72));
        row.setPadding(dp(activity, 16), dp(activity, 12), dp(activity, 16), dp(activity, 12));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(0x1F005FAC),
            null, new ColorDrawable(Color.WHITE)));
        row.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.setPadding(0, 0, dp(activity, 12), 0);
        labels.addView(text(activity, feature.title, 16, INK, false));
        TextView detail = text(activity, available ? feature.summary
            : "Not included in this APK. Select its patch before building.", 14, MUTED, false);
        detail.setPadding(0, dp(activity, 4), 0, 0);
        labels.addView(detail);
        row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1));
        Switch toggle = new Switch(activity);
        toggle.setMinimumHeight(dp(activity, 48));
        toggle.setContentDescription(feature.title);
        toggle.setTag("morphe-" + feature.name());
        toggle.setChecked(Settings.enabled(feature));
        toggle.setEnabled(available);
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[] {PRIMARY, 0xFF73777F}));
        toggle.setTrackTintList(new ColorStateList(states, new int[] {0xFFD4E3FF, 0xFFDFE2EB}));
        toggle.setOnCheckedChangeListener((view, checked) -> {
            if (!Settings.save(feature, checked)) {
                Toast.makeText(activity, "Could not save setting; it may reset after restart",
                    Toast.LENGTH_LONG).show();
            }
        });
        row.addView(toggle);
        row.setOnClickListener(view -> { if (available) toggle.setChecked(!toggle.isChecked()); });
        if (!available) row.setAlpha(0.55f);
        return row;
    }

    private static TextView text(Activity activity, String value, int size, int color, boolean bold) {
        TextView text = new TextView(activity);
        text.setText(value);
        text.setTextSize(size);
        text.setTextColor(color);
        text.setTypeface(Typeface.create(bold ? "sans-serif-medium" : "sans-serif", Typeface.NORMAL));
        return text;
    }

    private static final class BackIcon extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int size;

        BackIcon(Activity activity) {
            size = dp(activity, 24);
            paint.setColor(INK);
            paint.setStrokeWidth(2);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        public int getIntrinsicWidth() { return size; }
        public int getIntrinsicHeight() { return size; }

        public void draw(Canvas canvas) {
            canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            canvas.scale(getBounds().width() / 24f, getBounds().height() / 24f);
            canvas.drawLine(4, 12, 20, 12, paint);
            canvas.drawLine(4, 12, 11, 5, paint);
            canvas.drawLine(4, 12, 11, 19, paint);
            canvas.restore();
        }

        public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
        public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
        public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    static final class SortIcon extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        SortIcon() {
            paint.setColor(Color.WHITE);
            paint.setStrokeWidth(2);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStyle(Paint.Style.STROKE);
        }

        public void draw(Canvas canvas) {
            canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            canvas.scale(getBounds().width() / 24f, getBounds().height() / 24f);
            canvas.drawLine(4, 6, 15, 6, paint);
            canvas.drawLine(4, 12, 12, 12, paint);
            canvas.drawLine(4, 18, 9, 18, paint);
            canvas.drawLine(19, 5, 19, 19, paint);
            canvas.drawLine(16, 16, 19, 19, paint);
            canvas.drawLine(19, 19, 22, 16, paint);
            canvas.restore();
        }

        public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
        public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
        public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
