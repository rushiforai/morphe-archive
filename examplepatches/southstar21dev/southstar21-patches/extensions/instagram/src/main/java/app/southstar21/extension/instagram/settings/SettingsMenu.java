package app.southstar21.extension.instagram.settings;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.Dialog;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Full-screen southstar21 Patches menu: one card per included patch with its on/off switch
 * and settings. Built from plain views so it needs no resources or manifest entries.
 */
@SuppressWarnings("deprecation")
public final class SettingsMenu {
    private static final int ACCENT = 0xFF0095F6; // Instagram blue

    private final Activity activity;
    private final float density;
    private final boolean dark;
    private final int background, card, textPrimary, textSecondary, divider;

    private Dialog dialog;
    private View restartBar;

    public static void show(Activity activity) {
        Settings.init(activity);
        new SettingsMenu(activity).open();
    }

    private SettingsMenu(Activity activity) {
        this.activity = activity;
        this.density = activity.getResources().getDisplayMetrics().density;
        int mode = activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        this.dark = mode == Configuration.UI_MODE_NIGHT_YES;
        background = dark ? Color.BLACK : 0xFFF2F2F7;
        card = dark ? 0xFF1C1C1E : Color.WHITE;
        textPrimary = dark ? 0xFFF5F5F5 : Color.BLACK;
        textSecondary = dark ? 0xFF98989F : 0xFF6C6C70;
        divider = dark ? 0xFF2C2C2E : 0xFFE5E5EA;
    }

    private void open() {
        dialog = new Dialog(activity, dark
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar);
        dialog.setContentView(buildContent());
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setStatusBarColor(background);
            window.setNavigationBarColor(background);
        }
        dialog.show();
    }

    // region Layout

    private View buildContent() {
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background);
        root.addView(buildTopBar());

        ScrollView scroll = new ScrollView(activity);
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(dp(16), dp(8), dp(16), dp(24));
        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        List<PatchSettings> patches = Settings.includedPatches();
        if (patches.isEmpty()) {
            list.addView(text("No patches with settings are included in this build.", 15, textSecondary, false));
        }
        for (PatchSettings patch : patches) {
            list.addView(buildPatchCard(patch));
        }

        restartBar = buildRestartBar();
        restartBar.setVisibility(View.GONE);
        root.addView(restartBar);

        // The window is drawn edge to edge: keep the content clear of the status and nav bars.
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets.consumeSystemWindowInsets();
        });
        return root;
    }

    private View buildTopBar() {
        FrameLayout bar = new FrameLayout(activity);
        bar.setMinimumHeight(dp(56));

        TextView back = text("‹", 34, textPrimary, false);
        back.setGravity(Gravity.CENTER);
        back.setOnClickListener(v -> dialog.dismiss());
        back.setContentDescription("Back");
        bar.addView(back, new FrameLayout.LayoutParams(dp(56), dp(56), Gravity.START | Gravity.CENTER_VERTICAL));

        TextView title = text("southstar21 Patches", 17, textPrimary, true);
        bar.addView(title, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        return bar;
    }

    private View buildPatchCard(PatchSettings patch) {
        LinearLayout section = new LinearLayout(activity);
        section.setOrientation(LinearLayout.VERTICAL);
        section.setPadding(0, dp(16), 0, 0);

        TextView header = text(patch.title.toUpperCase(), 13, textSecondary, false);
        header.setPadding(dp(16), 0, dp(16), dp(6));
        section.addView(header);

        LinearLayout cardView = new LinearLayout(activity);
        cardView.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(card);
        shape.setCornerRadius(dp(12));
        cardView.setBackground(shape);
        cardView.setClipToOutline(true);
        section.addView(cardView);

        List<View> dependentRows = new ArrayList<>();
        cardView.addView(booleanRow(patch.enabled, enabledNow -> setEnabled(dependentRows, enabledNow)));
        for (Setting setting : patch.settings) {
            cardView.addView(dividerView());
            View row = setting instanceof IntSetting
                    ? intRow((IntSetting) setting)
                    : booleanRow((BooleanSetting) setting, null);
            dependentRows.add(row);
            cardView.addView(row);
        }
        setEnabled(dependentRows, patch.enabled.get());

        if (patch.description != null) {
            TextView footer = text(patch.description, 13, textSecondary, false);
            footer.setPadding(dp(16), dp(6), dp(16), 0);
            section.addView(footer);
        }

        TextView reset = text("Reset to defaults", 15, ACCENT, false);
        reset.setPadding(dp(16), dp(10), dp(16), dp(4));
        reset.setOnClickListener(v -> {
            patch.enabled.reset();
            for (Setting s : patch.settings) s.reset();
            onChanged(true);
            dialog.setContentView(buildContent());
            if (restartBar != null) restartBar.setVisibility(View.VISIBLE);
        });
        section.addView(reset);
        return section;
    }

    private interface BooleanListener {
        void onChanged(boolean value);
    }

    private View booleanRow(BooleanSetting setting, BooleanListener listener) {
        LinearLayout row = rowContainer();
        LinearLayout labels = labels(setting.title, setting.summary);
        row.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Switch toggle = new Switch(activity);
        toggle.setChecked(setting.get());
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[]{Color.WHITE, dark ? 0xFFCCCCCC : Color.WHITE}));
        toggle.setTrackTintList(new ColorStateList(states, new int[]{ACCENT, dark ? 0xFF39393D : 0xFFE9E9EA}));
        toggle.setOnCheckedChangeListener((button, checked) -> {
            setting.set(checked);
            onChanged(setting.requiresRestart);
            if (listener != null) listener.onChanged(checked);
        });
        row.addView(toggle);
        row.setOnClickListener(v -> toggle.toggle());
        return row;
    }

    private View intRow(IntSetting setting) {
        LinearLayout row = rowContainer();
        row.setOrientation(LinearLayout.VERTICAL);

        LinearLayout top = new LinearLayout(activity);
        top.setGravity(Gravity.CENTER_VERTICAL);
        top.addView(labels(setting.title, setting.summary),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView value = text(format(setting, setting.get()), 15, textSecondary, false);
        top.addView(value);
        row.addView(top);

        SeekBar slider = new SeekBar(activity);
        slider.setMax(setting.max - setting.min);
        slider.setProgress(setting.get() - setting.min);
        slider.setProgressTintList(ColorStateList.valueOf(ACCENT));
        slider.setThumbTintList(ColorStateList.valueOf(ACCENT));
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                value.setText(format(setting, setting.min + progress));
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                setting.set(setting.min + seekBar.getProgress());
                onChanged(setting.requiresRestart);
            }
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        row.addView(slider, lp);
        return row;
    }

    private View buildRestartBar() {
        LinearLayout bar = new LinearLayout(activity);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(card);
        bar.setPadding(dp(16), dp(12), dp(16), dp(12));
        bar.addView(text("Restart Instagram to apply changes", 15, textPrimary, false),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView restart = text("Restart", 15, Color.WHITE, true);
        restart.setPadding(dp(16), dp(8), dp(16), dp(8));
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(ACCENT);
        pill.setCornerRadius(dp(20));
        restart.setBackground(pill);
        restart.setOnClickListener(v -> restartApp(activity));
        bar.addView(restart);
        return bar;
    }

    private LinearLayout rowContainer() {
        LinearLayout row = new LinearLayout(activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(52));
        row.setPadding(dp(16), dp(10), dp(12), dp(10));
        return row;
    }

    private LinearLayout labels(String title, String summary) {
        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(text(title, 16, textPrimary, false));
        if (!TextUtils.isEmpty(summary)) {
            TextView s = text(summary, 13, textSecondary, false);
            s.setPadding(0, dp(2), dp(8), 0);
            labels.addView(s);
        }
        return labels;
    }

    private View dividerView() {
        View line = new View(activity);
        line.setBackgroundColor(divider);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                Math.max(1, Math.round(0.5f * density)));
        lp.leftMargin = dp(16);
        line.setLayoutParams(lp);
        return line;
    }

    private TextView text(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    // endregion

    private void setEnabled(List<View> rows, boolean enabled) {
        for (View row : rows) {
            row.setAlpha(enabled ? 1f : 0.4f);
            setEnabledRecursive(row, enabled);
        }
    }

    private static void setEnabledRecursive(View view, boolean enabled) {
        view.setEnabled(enabled);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) setEnabledRecursive(group.getChildAt(i), enabled);
        }
    }

    private void onChanged(boolean requiresRestart) {
        if (requiresRestart && restartBar != null) restartBar.setVisibility(View.VISIBLE);
    }

    private static String format(IntSetting setting, int value) {
        return setting.unit == null ? String.valueOf(value) : value + " " + setting.unit;
    }

    private int dp(int value) {
        return Math.round(value * density);
    }

    /** Relaunches Instagram: schedules the launcher intent, then ends the process. */
    static void restartApp(Context context) {
        Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (launch == null) return;
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        PendingIntent pending = PendingIntent.getActivity(context, 0, launch,
                PendingIntent.FLAG_CANCEL_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        AlarmManager alarms = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        alarms.set(AlarmManager.ELAPSED_REALTIME, SystemClock.elapsedRealtime() + 300, pending);
        if (context instanceof Activity) ((Activity) context).finishAffinity();
        android.os.Process.killProcess(android.os.Process.myPid());
    }
}
