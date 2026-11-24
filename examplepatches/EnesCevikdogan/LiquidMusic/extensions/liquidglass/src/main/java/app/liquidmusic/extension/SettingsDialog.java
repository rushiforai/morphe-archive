package app.liquidmusic.extension;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Native Android settings dialog opened by long-pressing the Liquid Tab Bar.
 * Uses pure Android framework widgets so it never conflicts with Apple Music's R8 Compose runtime.
 */
final class SettingsDialog {

    private SettingsDialog() {
    }

    static void show(Context context) {
        if (context == null) return;

        boolean isDark = (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;

        int bgColor = isDark ? 0xE61C1C1E : 0xF0F5F5F7;
        int strokeColor = isDark ? 0x44FFFFFF : 0x33000000;
        int textPrimary = isDark ? 0xFFFFFFFF : 0xFF1C1C1E;
        int textSecondary = isDark ? 0xFFAEAEB2 : 0xFF636366;
        int accentColor = isDark ? 0xFF0A84FF : 0xFF007AFF;

        float d = context.getResources().getDisplayMetrics().density;
        int pad = Math.round(20 * d);

        Dialog dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(pad, pad, pad, Math.round(14 * d));

        GradientDrawable panelBg = new GradientDrawable();
        panelBg.setColor(bgColor);
        panelBg.setCornerRadius(24 * d);
        panelBg.setStroke(Math.max(1, Math.round(1 * d)), strokeColor);
        root.setBackground(panelBg);

        // Header
        TextView title = new TextView(context);
        title.setText("Liquid Glass");
        title.setTextSize(20);
        title.setTextColor(textPrimary);
        title.setTypeface(title.getTypeface(), android.graphics.Typeface.BOLD);
        root.addView(title);

        TextView subtitle = new TextView(context);
        subtitle.setText(Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
                ? "Live settings • Long-press tab bar anytime"
                : "Live settings (Refraction requires Android 13+)");
        subtitle.setTextSize(12);
        subtitle.setTextColor(textSecondary);
        subtitle.setPadding(0, Math.round(2 * d), 0, Math.round(12 * d));
        root.addView(subtitle);

        // Scrollable controls
        ScrollView scroll = new ScrollView(context);
        LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        scroll.setLayoutParams(scrollLp);

        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);
        root.addView(scroll);

        List<Runnable> refreshers = new ArrayList<>();

        addSlider(context, list, refreshers, "Blur radius", "dp", 0, 64,
                () -> LiquidPrefs.getBlurRadiusDp(context),
                v -> LiquidPrefs.putInt(context, LiquidPrefs.KEY_BLUR_RADIUS, v),
                textPrimary, textSecondary, d);

        addSlider(context, list, refreshers, "Refraction width", "dp", 0, 64,
                () -> LiquidPrefs.getRefractionHeightDp(context),
                v -> LiquidPrefs.putInt(context, LiquidPrefs.KEY_REFRACTION_HEIGHT, v),
                textPrimary, textSecondary, d);

        addSlider(context, list, refreshers, "Refraction strength", "dp", 0, 96,
                () -> LiquidPrefs.getRefractionAmountDp(context),
                v -> LiquidPrefs.putInt(context, LiquidPrefs.KEY_REFRACTION_AMOUNT, v),
                textPrimary, textSecondary, d);

        addSlider(context, list, refreshers, "Vibrancy", "%", 0, 300,
                () -> LiquidPrefs.getSaturationPercent(context),
                v -> LiquidPrefs.putInt(context, LiquidPrefs.KEY_SATURATION, v),
                textPrimary, textSecondary, d);

        addSlider(context, list, refreshers, "Tint opacity", "%", 0, 100,
                () -> LiquidPrefs.getTintOpacityPercent(context),
                v -> LiquidPrefs.putInt(context, LiquidPrefs.KEY_TINT_OPACITY, v),
                textPrimary, textSecondary, d);

        addSlider(context, list, refreshers, "Edge highlight", "%", 0, 100,
                () -> LiquidPrefs.getHighlightPercent(context),
                v -> LiquidPrefs.putInt(context, LiquidPrefs.KEY_HIGHLIGHT, v),
                textPrimary, textSecondary, d);

        addToggle(context, list, refreshers, "Chromatic aberration",
                () -> LiquidPrefs.isChromaticAberration(context),
                v -> LiquidPrefs.putBoolean(context, LiquidPrefs.KEY_CHROMATIC, v),
                textPrimary, d);

        addToggle(context, list, refreshers, "Liquid tab bar",
                () -> LiquidPrefs.isLiquidTabBar(context),
                v -> LiquidPrefs.putBoolean(context, LiquidPrefs.KEY_LIQUID_TAB_BAR, v),
                textPrimary, d);

        addToggle(context, list, refreshers, "Tab labels",
                () -> LiquidPrefs.isTabLabels(context),
                v -> LiquidPrefs.putBoolean(context, LiquidPrefs.KEY_TAB_LABELS, v),
                textPrimary, d);

        addToggle(context, list, refreshers, "Haptic feedback",
                () -> LiquidPrefs.isTabHaptics(context),
                v -> LiquidPrefs.putBoolean(context, LiquidPrefs.KEY_TAB_HAPTICS, v),
                textPrimary, d);

        // Footer buttons
        LinearLayout footer = new LinearLayout(context);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.END);
        footer.setPadding(0, Math.round(12 * d), 0, 0);

        Button resetBtn = new Button(context, null, android.R.attr.borderlessButtonStyle);
        resetBtn.setText("Reset");
        resetBtn.setTextColor(textSecondary);
        resetBtn.setAllCaps(false);
        resetBtn.setOnClickListener(v -> {
            LiquidPrefs.reset(context);
            for (Runnable r : refreshers) r.run();
        });
        footer.addView(resetBtn);

        Button doneBtn = new Button(context, null, android.R.attr.borderlessButtonStyle);
        doneBtn.setText("Done");
        doneBtn.setTextColor(accentColor);
        doneBtn.setTypeface(doneBtn.getTypeface(), android.graphics.Typeface.BOLD);
        doneBtn.setAllCaps(false);
        doneBtn.setOnClickListener(v -> dialog.dismiss());
        footer.addView(doneBtn);

        root.addView(footer);

        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setGravity(Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
            int maxWidth = Math.min(
                    Math.round(context.getResources().getDisplayMetrics().widthPixels * 0.94f),
                    Math.round(440 * d)
            );
            int maxHeight = Math.round(context.getResources().getDisplayMetrics().heightPixels * 0.72f);
            window.setLayout(maxWidth, WindowManager.LayoutParams.WRAP_CONTENT);
            root.setLayoutParams(new ViewGroup.LayoutParams(maxWidth, ViewGroup.LayoutParams.WRAP_CONTENT));
            scroll.getLayoutParams().height = Math.min(maxHeight, Math.round(360 * d));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                window.addFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
                window.getAttributes().setBlurBehindRadius(Math.round(24 * d));
            }
        }
        dialog.show();
    }

    private interface IntSupplier {
        int get();
    }

    private interface IntConsumer {
        void accept(int value);
    }

    private interface BoolSupplier {
        boolean get();
    }

    private interface BoolConsumer {
        void accept(boolean value);
    }

    private static void addSlider(
            Context context,
            LinearLayout parent,
            List<Runnable> refreshers,
            String label,
            String unit,
            int min,
            int max,
            IntSupplier getter,
            IntConsumer setter,
            int textPrimary,
            int textSecondary,
            float d
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(0, Math.round(6 * d), 0, Math.round(6 * d));

        LinearLayout header = new LinearLayout(context);
        header.setOrientation(LinearLayout.HORIZONTAL);

        TextView titleView = new TextView(context);
        titleView.setText(label);
        titleView.setTextSize(14);
        titleView.setTextColor(textPrimary);
        titleView.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        header.addView(titleView);

        TextView valueView = new TextView(context);
        valueView.setTextSize(13);
        valueView.setTextColor(textSecondary);
        header.addView(valueView);

        row.addView(header);

        SeekBar seekBar = new SeekBar(context);
        seekBar.setMax(max - min);
        int initial = Math.max(min, Math.min(max, getter.get()));
        seekBar.setProgress(initial - min);
        valueView.setText(initial + " " + unit);

        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar sb, int progress, boolean fromUser) {
                int val = min + progress;
                valueView.setText(val + " " + unit);
                if (fromUser) {
                    setter.accept(val);
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar sb) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar sb) {
            }
        });

        refreshers.add(() -> {
            int val = Math.max(min, Math.min(max, getter.get()));
            seekBar.setProgress(val - min);
            valueView.setText(val + " " + unit);
        });

        row.addView(seekBar);
        parent.addView(row);
    }

    private static void addToggle(
            Context context,
            LinearLayout parent,
            List<Runnable> refreshers,
            String label,
            BoolSupplier getter,
            BoolConsumer setter,
            int textPrimary,
            float d
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, Math.round(8 * d), 0, Math.round(8 * d));

        TextView titleView = new TextView(context);
        titleView.setText(label);
        titleView.setTextSize(14);
        titleView.setTextColor(textPrimary);
        titleView.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(titleView);

        Switch toggle = new Switch(context);
        toggle.setChecked(getter.get());
        toggle.setOnCheckedChangeListener((btn, isChecked) -> setter.accept(isChecked));

        refreshers.add(() -> toggle.setChecked(getter.get()));

        row.addView(toggle);
        parent.addView(row);
    }
}
