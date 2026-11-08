package app.twrailway.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

import java.util.Locale;
import java.util.Set;

/**
 * The patch settings page. It is a full screen dialog on top of the app's activity, so no
 * activity has to be added to the manifest.
 */
final class PatchSettingsDialog {
    private static Dialog current;

    private PatchSettingsDialog() {
    }

    static boolean isShowing() {
        return current != null && current.isShowing();
    }

    static void dismissFor(Activity activity) {
        if (current != null && current.getOwnerActivity() == activity) {
            current.dismiss();
            current = null;
        }
    }

    static void show(Activity activity) {
        try {
            if (isShowing()) return;

            boolean night = (activity.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            Dialog dialog = new Dialog(activity, night
                    ? android.R.style.Theme_DeviceDefault_NoActionBar
                    : android.R.style.Theme_DeviceDefault_Light_NoActionBar);
            dialog.setOwnerActivity(activity);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            dialog.setContentView(new PatchSettingsDialog.Page(dialog).build());
            dialog.setOnDismissListener(d -> {
                if (current == d) current = null;
            });
            current = dialog;
            dialog.show();
            Window window = dialog.getWindow();
            if (window != null) {
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            }
        } catch (Throwable t) {
            Log.e(PatchSettings.TAG, "Could not show the patch settings", t);
        }
    }

    private static final class Page {
        private final Dialog dialog;
        private final Context context;
        private final SharedPreferences preferences;
        private final Set<String> applied;
        private final LinearLayout list;

        Page(Dialog dialog) {
            this.dialog = dialog;
            this.context = dialog.getContext();
            this.preferences = PatchSettings.preferences(context);
            this.applied = PatchSettings.appliedPatches();
            this.list = new LinearLayout(context);
            list.setOrientation(LinearLayout.VERTICAL);
        }

        View build() {
            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setFitsSystemWindows(true);
            root.setBackgroundColor(themeColor(android.R.attr.colorBackground));

            root.addView(toolbar());

            ScrollView scroll = new ScrollView(context);
            scroll.addView(list);
            root.addView(scroll, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            section(Strings.SECTION_ADS);
            switchRow(PatchSettings.HIDE_ADS, Strings.HIDE_ADS, Strings.HIDE_ADS_SUMMARY, null);
            switchRow(PatchSettings.HIDE_REVIEW_PROMPT, Strings.HIDE_REVIEW_PROMPT,
                    Strings.HIDE_REVIEW_PROMPT_SUMMARY, null);
            switchRow(PatchSettings.HIDE_UPGRADE_BUTTON, Strings.HIDE_UPGRADE_BUTTON,
                    Strings.HIDE_UPGRADE_BUTTON_SUMMARY, null);
            switchRow(PatchSettings.HIDE_PROMOTIONS, Strings.HIDE_PROMOTIONS,
                    Strings.HIDE_PROMOTIONS_SUMMARY, null);

            section(Strings.SECTION_DISPLAY);
            switchRow(PatchSettings.FIX_RECENT_APPS_TITLE, Strings.FIX_RECENT_APPS_TITLE,
                    Strings.FIX_RECENT_APPS_TITLE_SUMMARY, null);

            section(Strings.SECTION_SEARCH_HISTORY);
            View limitRow = searchHistoryLimitRow();
            switchRow(PatchSettings.EXPAND_SEARCH_HISTORY, Strings.EXPAND_SEARCH_HISTORY,
                    Strings.EXPAND_SEARCH_HISTORY_SUMMARY, limitRow);
            list.addView(limitRow);
            switchRow(PatchSettings.FIX_SEARCH_HISTORY_COUNT, Strings.FIX_SEARCH_HISTORY_COUNT,
                    Strings.FIX_SEARCH_HISTORY_COUNT_SUMMARY, null);

            list.addView(footer());
            return root;
        }

        private View toolbar() {
            LinearLayout bar = new LinearLayout(context);
            bar.setOrientation(LinearLayout.HORIZONTAL);
            bar.setGravity(Gravity.CENTER_VERTICAL);
            bar.setPadding(dp(4), dp(8), dp(16), dp(8));

            TextView back = new TextView(context);
            back.setText("←");
            back.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24);
            back.setGravity(Gravity.CENTER);
            back.setContentDescription(Strings.CLOSE);
            back.setBackgroundResource(themeResource(android.R.attr.selectableItemBackgroundBorderless));
            back.setOnClickListener(v -> dialog.dismiss());
            bar.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));

            LinearLayout titles = new LinearLayout(context);
            titles.setOrientation(LinearLayout.VERTICAL);
            titles.setPadding(dp(12), 0, 0, 0);
            TextView title = new TextView(context);
            title.setText(Strings.TITLE);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
            title.setTypeface(Typeface.DEFAULT_BOLD);
            title.setTextColor(themeColor(android.R.attr.textColorPrimary));
            titles.addView(title);
            TextView subtitle = new TextView(context);
            subtitle.setText(Strings.SUBTITLE);
            subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            subtitle.setTextColor(themeColor(android.R.attr.textColorSecondary));
            titles.addView(subtitle);
            bar.addView(titles);
            return bar;
        }

        private void section(String text) {
            TextView header = new TextView(context);
            header.setText(text);
            header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            header.setTypeface(Typeface.DEFAULT_BOLD);
            header.setTextColor(themeColor(android.R.attr.colorAccent));
            header.setPadding(dp(16), dp(20), dp(16), dp(4));
            list.addView(header);
        }

        /**
         * A row with a title, a summary and a switch for the on/off setting {@code key}.
         * {@code dependent} is enabled only while the switch is on.
         */
        private void switchRow(String key, String titleText, String summaryText, View dependent) {
            boolean isApplied = applied.contains(key);

            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(16), dp(12), dp(16), dp(12));
            row.setMinimumHeight(dp(64));
            row.setBackgroundResource(themeResource(android.R.attr.selectableItemBackground));

            LinearLayout texts = textBlock(titleText, isApplied ? summaryText : Strings.NOT_APPLIED);
            row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            Switch toggle = new Switch(context);
            toggle.setChecked(isApplied && preferences.getBoolean(key, true));
            toggle.setPadding(dp(16), 0, 0, 0);
            row.addView(toggle);

            setEnabled(row, isApplied);
            if (dependent != null) setEnabled(dependent, isApplied && toggle.isChecked());

            toggle.setOnCheckedChangeListener((button, checked) -> {
                preferences.edit().putBoolean(key, checked).apply();
                if (dependent != null) setEnabled(dependent, checked);
            });
            row.setOnClickListener(v -> toggle.toggle());
            list.addView(row);
        }

        private View searchHistoryLimitRow() {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setPadding(dp(16), dp(4), dp(16), dp(12));

            int limit = PatchSettings.searchHistoryLimit(context);
            LinearLayout texts = textBlock(label(limit), Strings.SEARCH_HISTORY_LIMIT_SUMMARY);
            TextView title = (TextView) texts.getChildAt(0);
            row.addView(texts);

            SeekBar seekBar = new SeekBar(context);
            seekBar.setMax(PatchSettings.SEARCH_HISTORY_MAX - PatchSettings.SEARCH_HISTORY_MIN);
            seekBar.setProgress(limit - PatchSettings.SEARCH_HISTORY_MIN);
            seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                @Override
                public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                    int value = progress + PatchSettings.SEARCH_HISTORY_MIN;
                    title.setText(label(value));
                    if (fromUser) {
                        preferences.edit().putInt(PatchSettings.SEARCH_HISTORY_LIMIT, value).apply();
                    }
                }

                @Override
                public void onStartTrackingTouch(SeekBar bar) {
                }

                @Override
                public void onStopTrackingTouch(SeekBar bar) {
                }
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = dp(8);
            row.addView(seekBar, params);
            return row;
        }

        private View footer() {
            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.VERTICAL);
            footer.setPadding(dp(16), dp(24), dp(16), dp(24));

            TextView note = new TextView(context);
            note.setText(Strings.RESTART_NOTE);
            note.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            note.setTextColor(themeColor(android.R.attr.textColorSecondary));
            footer.addView(note);

            Button restart = new Button(context);
            restart.setText(Strings.RESTART);
            restart.setOnClickListener(v -> restartApp());
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = dp(12);
            footer.addView(restart, params);
            return footer;
        }

        private void restartApp() {
            try {
                Activity activity = dialog.getOwnerActivity();
                Intent launchIntent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
                ComponentName component = launchIntent != null ? launchIntent.getComponent() : null;
                if (activity == null || component == null) return;
                dialog.dismiss();
                activity.startActivity(Intent.makeRestartActivityTask(component));
                Runtime.getRuntime().exit(0);
            } catch (Throwable t) {
                Log.e(PatchSettings.TAG, "Could not restart the app", t);
            }
        }

        private LinearLayout textBlock(String titleText, String summaryText) {
            LinearLayout texts = new LinearLayout(context);
            texts.setOrientation(LinearLayout.VERTICAL);

            TextView title = new TextView(context);
            title.setText(titleText);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            title.setTextColor(themeColor(android.R.attr.textColorPrimary));
            texts.addView(title);

            TextView summary = new TextView(context);
            summary.setText(summaryText);
            summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            summary.setTextColor(themeColor(android.R.attr.textColorSecondary));
            summary.setPadding(0, dp(2), 0, 0);
            texts.addView(summary);
            return texts;
        }

        private static String label(int limit) {
            return String.format(Locale.ROOT, Strings.SEARCH_HISTORY_LIMIT, limit);
        }

        private static void setEnabled(View view, boolean enabled) {
            view.setEnabled(enabled);
            view.setAlpha(enabled ? 1f : 0.4f);
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    group.getChildAt(i).setEnabled(enabled);
                }
            }
        }

        private int themeColor(int attribute) {
            TypedValue value = new TypedValue();
            if (!context.getTheme().resolveAttribute(attribute, value, true)) return 0xFF808080;
            if (value.resourceId != 0) return context.getColor(value.resourceId);
            return value.data;
        }

        private int themeResource(int attribute) {
            TypedValue value = new TypedValue();
            context.getTheme().resolveAttribute(attribute, value, true);
            return value.resourceId;
        }

        private int dp(int value) {
            return Math.round(value * context.getResources().getDisplayMetrics().density);
        }
    }
}
