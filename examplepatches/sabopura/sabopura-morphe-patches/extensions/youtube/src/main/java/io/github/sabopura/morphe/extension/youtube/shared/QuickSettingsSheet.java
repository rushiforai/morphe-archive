package io.github.sabopura.morphe.extension.youtube.shared;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.List;
import java.util.function.BooleanSupplier;

/**
 * The long-press sheet of a player-menu row: the feature's switch and its most used values as
 * sliders over the video, so a change shows on the playing video right away. The sliders only
 * take the values the full settings screen offers, so both always agree.
 */
final class QuickSettingsSheet {
    /** One slider: a preference stored as a string, like the settings screen's lists. */
    static final class Slider {
        final String key;
        final String japanese;
        final String english;
        final int[] values;
        final int defaultValue;
        final String suffix;
        /** Words shown instead of the numbers, when the settings screen uses words too. */
        final String[] names;

        Slider(String key, String japanese, String english, int[] values, int defaultValue,
               String suffix) {
            this(key, japanese, english, values, defaultValue, suffix, null);
        }

        Slider(String key, String japanese, String english, int[] values, int defaultValue,
               String suffix, String[] names) {
            this.key = key;
            this.japanese = japanese;
            this.english = english;
            this.values = values;
            this.defaultValue = defaultValue;
            this.suffix = suffix;
            this.names = names;
        }

        String describe(int index) {
            return names != null ? names[index] : values[index] + suffix;
        }
    }

    /** An on/off preference shown as a small switch row. */
    static final class Toggle {
        final String key;
        final String japanese;
        final String english;
        final boolean defaultValue;

        Toggle(String key, String japanese, String english, boolean defaultValue) {
            this.key = key;
            this.japanese = japanese;
            this.english = english;
            this.defaultValue = defaultValue;
        }
    }

    private QuickSettingsSheet() {
    }

    static void show(Context context, String title, BooleanSupplier enabled, Runnable toggle,
                     List<Slider> sliders, Runnable openFullSettings, int textColor) {
        show(context, title, enabled, toggle, sliders, null, null, openFullSettings, textColor);
    }

    static void show(Context context, String title, BooleanSupplier enabled, Runnable toggle,
                     List<Slider> sliders, String togglesTitle, List<Toggle> toggles,
                     Runnable openFullSettings, int textColor) {
        Activity activity = Views.findActivity(context);
        if (activity == null || activity.isFinishing()) {
            openFullSettings.run();
            return;
        }
        boolean dark = isLight(textColor);
        int background = dark ? 0xFF212121 : Color.WHITE;
        int secondary = withAlpha(textColor, 0.6f);
        float density = activity.getResources().getDisplayMetrics().density;
        boolean japanese = Views.isJapanese();
        SharedPreferences store = SettingsStore.open(activity);

        Dialog dialog = new Dialog(activity);
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(16 * density);
        column.setPadding(padding, Math.round(8 * density), padding, padding);

        View handle = new View(activity);
        GradientDrawable handleShape = new GradientDrawable();
        handleShape.setColor(withAlpha(textColor, 0.3f));
        handleShape.setCornerRadius(2 * density);
        handle.setBackground(handleShape);
        LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(
                Math.round(32 * density), Math.round(4 * density));
        handleParams.gravity = Gravity.CENTER_HORIZONTAL;
        handleParams.bottomMargin = Math.round(8 * density);
        column.addView(handle, handleParams);

        // Title row with the feature's switch, like the menu row it came from.
        LinearLayout header = new LinearLayout(activity);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setMinimumHeight(Math.round(48 * density));
        TextView titleView = text(activity, title, 18, textColor);
        titleView.setTypeface(Typeface.create(Typeface.DEFAULT, 500, false));
        header.addView(titleView, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        FlyoutSwitch toggleSwitch = new FlyoutSwitch(activity);
        toggleSwitch.setTextColor(textColor);
        toggleSwitch.setChecked(enabled.getAsBoolean(), false);
        header.addView(toggleSwitch);
        column.addView(header);

        LinearLayout sliderColumn = new LinearLayout(activity);
        sliderColumn.setOrientation(LinearLayout.VERTICAL);
        for (Slider slider : sliders) {
            addSlider(activity, sliderColumn, slider, store, textColor, secondary, density,
                    japanese);
        }
        if (toggles != null && !toggles.isEmpty()) {
            TextView heading = text(activity, togglesTitle, 13, secondary);
            heading.setPadding(0, Math.round(16 * density), 0, Math.round(4 * density));
            sliderColumn.addView(heading);
            for (Toggle item : toggles) {
                addToggle(activity, sliderColumn, item, store, textColor, density, japanese);
            }
        }
        sliderColumn.setAlpha(enabled.getAsBoolean() ? 1f : 0.4f);
        column.addView(sliderColumn);
        header.setOnClickListener(view -> {
            toggle.run();
            boolean on = enabled.getAsBoolean();
            toggleSwitch.setChecked(on, true);
            sliderColumn.setAlpha(on ? 1f : 0.4f);
        });

        TextView more = text(activity, japanese ? "詳しい設定" : "More settings", 14, textColor);
        more.setTypeface(Typeface.create(Typeface.DEFAULT, 500, false));
        more.setGravity(Gravity.CENTER);
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(withAlpha(textColor, 0.1f));
        pill.setCornerRadius(18 * density);
        more.setBackground(pill);
        more.setMinHeight(Math.round(36 * density));
        more.setPadding(padding, 0, padding, 0);
        LinearLayout.LayoutParams moreParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        moreParams.gravity = Gravity.CENTER_HORIZONTAL;
        moreParams.topMargin = Math.round(12 * density);
        more.setOnClickListener(view -> {
            dialog.dismiss();
            openFullSettings.run();
        });
        column.addView(more, moreParams);

        ScrollView scroll = new ScrollView(activity);
        scroll.addView(column);
        GradientDrawable sheet = new GradientDrawable();
        sheet.setColor(background);
        float radius = 12 * density;
        sheet.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        scroll.setBackground(sheet);

        FrameLayout root = new FrameLayout(activity);
        root.addView(scroll, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM));
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(root);
        dialog.setCanceledOnTouchOutside(true);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setGravity(Gravity.BOTTOM);
            int width = Math.min(activity.getResources().getDisplayMetrics().widthPixels,
                    Math.round(600 * density));
            window.setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
            // A light dim only: the point is to watch the video change.
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(0.15f);
        }
        dialog.show();
    }

    private static void addSlider(Context context, LinearLayout column, Slider slider,
                                  SharedPreferences store, int textColor, int secondary,
                                  float density, boolean japanese) {
        LinearLayout labels = new LinearLayout(context);
        labels.setPadding(0, Math.round(12 * density), 0, 0);
        TextView label = text(context, japanese ? slider.japanese : slider.english, 14, textColor);
        labels.addView(label, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView value = text(context, "", 14, secondary);
        labels.addView(value);
        column.addView(labels);

        SeekBar bar = new SeekBar(context);
        bar.setMax(slider.values.length - 1);
        bar.setProgress(indexOf(slider, current(store, slider)));
        ColorStateList tint = ColorStateList.valueOf(textColor);
        bar.setProgressTintList(tint);
        bar.setThumbTintList(tint);
        bar.setProgressBackgroundTintList(ColorStateList.valueOf(withAlpha(textColor, 0.3f)));
        value.setText(slider.describe(bar.getProgress()));
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                int chosen = slider.values[progress];
                value.setText(slider.describe(progress));
                // Stored like the settings screen stores it, so the change applies right away.
                if (fromUser) store.edit().putString(slider.key, Integer.toString(chosen)).apply();
            }

            @Override public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        // The track lines up with the labels; the thumb keeps room to be drawn at both ends.
        int thumbRoom = Math.round(10 * density);
        bar.setPadding(thumbRoom, 0, thumbRoom, 0);
        LinearLayout.LayoutParams barParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.round(40 * density));
        barParams.leftMargin = -thumbRoom;
        barParams.rightMargin = -thumbRoom;
        column.addView(bar, barParams);
    }

    private static void addToggle(Context context, LinearLayout column, Toggle item,
                                  SharedPreferences store, int textColor, float density,
                                  boolean japanese) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(Math.round(44 * density));
        TextView label = text(context, japanese ? item.japanese : item.english, 14, textColor);
        row.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT,
                1f));
        FlyoutSwitch toggle = new FlyoutSwitch(context);
        toggle.setTextColor(textColor);
        toggle.setChecked(store.getBoolean(item.key, item.defaultValue), false);
        row.addView(toggle);
        row.setOnClickListener(view -> {
            boolean on = !store.getBoolean(item.key, item.defaultValue);
            store.edit().putBoolean(item.key, on).apply();
            toggle.setChecked(on, true);
        });
        column.addView(row);
    }

    private static int current(SharedPreferences store, Slider slider) {
        Object stored = store.getAll().get(slider.key);
        try {
            if (stored instanceof Number) return ((Number) stored).intValue();
            if (stored instanceof String) return Integer.parseInt(((String) stored).trim());
        } catch (NumberFormatException ignored) {
            // Falls back to the default below.
        }
        return slider.defaultValue;
    }

    /** The closest offered value, for a stored value the list does not have. */
    private static int indexOf(Slider slider, int value) {
        int best = 0;
        for (int i = 1; i < slider.values.length; i++) {
            if (Math.abs(slider.values[i] - value) < Math.abs(slider.values[best] - value)) best = i;
        }
        return best;
    }

    private static TextView text(Context context, String value, int sizeSp, int color) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
        view.setTextColor(color);
        return view;
    }

    private static int withAlpha(int color, float alpha) {
        return Color.argb(Math.round(Color.alpha(color) * alpha),
                Color.red(color), Color.green(color), Color.blue(color));
    }

    /** Light text means a dark sheet. */
    private static boolean isLight(int color) {
        return Color.red(color) * 299 + Color.green(color) * 587 + Color.blue(color) * 114
                > 128_000;
    }
}
