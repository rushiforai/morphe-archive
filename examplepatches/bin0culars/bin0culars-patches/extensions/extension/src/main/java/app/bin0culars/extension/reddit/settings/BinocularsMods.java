package app.bin0culars.extension.reddit.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class BinocularsMods {

    private static final String PREFS_NAME = "bin0culars_mods";
    private static final String[] SECTION_ORDER = {
        "feed", "posts", "media", "navigation", "links", "privacy", "misc"
    };

    private static Context appContext;
    private static SharedPreferences cachedPrefs;
    private static List<SettingEntry> registryEntries;

    private static final class SettingEntry {
        final String key;
        final String sectionId;
        final String parentKey;
        final boolean isSwitch;
        final boolean defaultBoolean;
        final String defaultChoice;
        final List<String> choiceValues;

        SettingEntry(
                String key,
                String sectionId,
                String parentKey,
                boolean isSwitch,
                boolean defaultBoolean,
                String defaultChoice,
                List<String> choiceValues) {
            this.key = key;
            this.sectionId = sectionId;
            this.parentKey = parentKey != null && !parentKey.isEmpty() ? parentKey : null;
            this.isSwitch = isSwitch;
            this.defaultBoolean = defaultBoolean;
            this.defaultChoice = defaultChoice;
            this.choiceValues = Collections.unmodifiableList(choiceValues);
        }
    }

    private static final class RowViewHolder {
        final SettingEntry entry;
        final View rowView;
        final Switch switchView;
        final TextView choiceLabelView;

        RowViewHolder(
                SettingEntry entry,
                View rowView,
                Switch switchView,
                TextView choiceLabelView) {
            this.entry = entry;
            this.rowView = rowView;
            this.switchView = switchView;
            this.choiceLabelView = choiceLabelView;
        }
    }

    private static String registryData() {
        // Modified during patching.
        return "";
    }

    private static synchronized List<SettingEntry> getEntries() {
        if (registryEntries != null) {
            return registryEntries;
        }
        String data = registryData();
        if (data == null || data.isEmpty()) {
            registryEntries = Collections.emptyList();
            return registryEntries;
        }
        List<SettingEntry> entries = new ArrayList<>();
        String[] lines = data.split("\n");
        for (String line : lines) {
            if (line.isEmpty()) {
                continue;
            }
            String[] parts = line.split("\\|", -1);
            if (parts.length < 6) {
                continue;
            }
            String key = parts[0];
            String sectionId = parts[1];
            String parentKey = parts[2].isEmpty() ? null : parts[2];
            boolean isSwitch = "S".equalsIgnoreCase(parts[3]);
            boolean defaultBoolean = false;
            String defaultChoice = null;
            if (isSwitch) {
                defaultBoolean = "1".equals(parts[4]);
            } else {
                defaultChoice = parts[4];
            }
            List<String> choiceValues = new ArrayList<>();
            if (!parts[5].isEmpty()) {
                String[] cv = parts[5].split(",");
                for (String c : cv) {
                    if (!c.isEmpty()) {
                        choiceValues.add(c);
                    }
                }
            }
            entries.add(
                    new SettingEntry(
                            key,
                            sectionId,
                            parentKey,
                            isSwitch,
                            defaultBoolean,
                            defaultChoice,
                            choiceValues));
        }
        registryEntries = Collections.unmodifiableList(entries);
        return registryEntries;
    }

    private static SettingEntry findEntry(String key) {
        if (key == null) {
            return null;
        }
        for (SettingEntry entry : getEntries()) {
            if (key.equals(entry.key)) {
                return entry;
            }
        }
        return null;
    }

    private static Context getApplicationContext() {
        if (appContext != null) {
            return appContext;
        }
        try {
            appContext = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Throwable ignored) {
        }
        return appContext;
    }

    private static synchronized SharedPreferences getPrefs() {
        if (cachedPrefs != null) {
            return cachedPrefs;
        }
        Context context = getApplicationContext();
        if (context != null) {
            cachedPrefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        }
        return cachedPrefs;
    }

    public static boolean isEnabled(String key) {
        try {
            SettingEntry entry = findEntry(key);
            if (entry == null || !entry.isSwitch) {
                return false;
            }
            if (entry.parentKey != null && !isEnabled(entry.parentKey)) {
                return false;
            }
            SharedPreferences prefs = getPrefs();
            if (prefs == null) {
                return entry.defaultBoolean;
            }
            return prefs.getBoolean(entry.key, entry.defaultBoolean);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static String getChoice(String key) {
        try {
            SettingEntry entry = findEntry(key);
            if (entry == null || entry.isSwitch) {
                return "";
            }
            String def = entry.defaultChoice != null ? entry.defaultChoice : "";
            SharedPreferences prefs = getPrefs();
            if (prefs == null) {
                return def;
            }
            String val = prefs.getString(entry.key, def);
            return val != null ? val : def;
        } catch (Throwable ignored) {
            return "";
        }
    }

    public static boolean openIfOurs(Activity activity, Uri uri) {
        if (activity == null || uri == null) {
            return false;
        }
        if (appContext == null) {
            appContext = activity.getApplicationContext();
        }
        try {
            int resId = activity.getResources().getIdentifier("content_policy_uri", "string", activity.getPackageName());
            if (resId == 0) {
                return false;
            }
            String contentPolicyUri = activity.getString(resId);
            if (contentPolicyUri.equals(uri.toString()) || uri.equals(Uri.parse(contentPolicyUri))) {
                if (Looper.myLooper() == Looper.getMainLooper()) {
                    showSettings(activity);
                } else {
                    activity.runOnUiThread(() -> showSettings(activity));
                }
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void restartApp(Activity activity) {
        try {
            Context context = activity != null ? activity : getApplicationContext();
            if (context != null) {
                String packageName = context.getPackageName();
                Intent launchIntent = context.getPackageManager().getLaunchIntentForPackage(packageName);
                if (launchIntent != null) {
                    ComponentName component = launchIntent.getComponent();
                    if (component != null) {
                        Intent restartIntent = Intent.makeRestartActivityTask(component);
                        context.startActivity(restartIntent);
                    } else {
                        context.startActivity(launchIntent);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        System.exit(0);
    }

    private static boolean isParentChecked(String parentKey, List<RowViewHolder> holders) {
        for (RowViewHolder h : holders) {
            if (parentKey.equals(h.entry.key)) {
                if (h.switchView != null) {
                    if (h.entry.parentKey != null && !isParentChecked(h.entry.parentKey, holders)) {
                        return false;
                    }
                    return h.switchView.isChecked();
                }
                return false;
            }
        }
        return isEnabled(parentKey);
    }

    private static void updateSubSwitches(List<RowViewHolder> holders) {
        for (RowViewHolder h : holders) {
            if (h.entry.parentKey != null) {
                boolean parentOn = isParentChecked(h.entry.parentKey, holders);
                h.rowView.setEnabled(parentOn);
                h.rowView.setClickable(parentOn);
                h.rowView.setAlpha(parentOn ? 1.0f : 0.38f);
                if (h.switchView != null) {
                    h.switchView.setEnabled(parentOn);
                }
            }
        }
    }

    private static void showSettings(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_DayNight);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        Context dialogContext = dialog.getContext();
        int textColorPrimary = resolveColor(dialogContext, android.R.attr.textColorPrimary);
        int textColorSecondary = resolveColor(dialogContext, android.R.attr.textColorSecondary);
        int colorAccent = resolveColor(dialogContext, android.R.attr.colorAccent);
        int colorBackground = resolveColor(dialogContext, android.R.attr.colorBackground);
        if (colorBackground == 0) {
            colorBackground = resolveColor(dialogContext, android.R.attr.windowBackground);
        }

        LinearLayout rootLayout = new LinearLayout(dialogContext);
        rootLayout.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));
        rootLayout.setOrientation(LinearLayout.VERTICAL);
        if (colorBackground != 0) {
            rootLayout.setBackgroundColor(colorBackground);
        }
        rootLayout.setFitsSystemWindows(true);

        LinearLayout topBar = new LinearLayout(dialogContext);
        topBar.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(dialogContext, 56)
        ));
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        topBar.setPadding(dp(dialogContext, 4), 0, dp(dialogContext, 16), 0);

        ImageButton backButton = new ImageButton(dialogContext);
        backButton.setLayoutParams(new LinearLayout.LayoutParams(
                dp(dialogContext, 48),
                dp(dialogContext, 48)
        ));
        backButton.setContentDescription(getString(dialogContext, "bin0culars_back"));
        backButton.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        backButton.setPadding(0, 0, 0, 0);

        TypedValue homeUpValue = new TypedValue();
        int backResId = 0;
        if (dialogContext.getTheme().resolveAttribute(android.R.attr.homeAsUpIndicator, homeUpValue, true)) {
            backResId = homeUpValue.resourceId;
        }
        if (backResId == 0) {
            backResId = dialogContext.getResources().getIdentifier("ic_arrow_back", "drawable", "android");
        }
        if (backResId == 0) {
            backResId = dialogContext.getResources().getIdentifier("action_bar_up_indicator", "drawable", "android");
        }
        if (backResId != 0) {
            backButton.setImageResource(backResId);
        }
        if (textColorPrimary != 0) {
            backButton.setColorFilter(textColorPrimary);
        }

        TypedValue selectableBorderless = new TypedValue();
        if (dialogContext.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, selectableBorderless, true)) {
            backButton.setBackgroundResource(selectableBorderless.resourceId);
        } else {
            backButton.setBackground(null);
        }
        backButton.setOnClickListener(v -> dialog.dismiss());
        topBar.addView(backButton);

        TextView titleView = new TextView(dialogContext);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        titleParams.setMarginStart(dp(dialogContext, 8));
        titleParams.leftMargin = dp(dialogContext, 8);
        titleView.setLayoutParams(titleParams);
        titleView.setText(getString(dialogContext, "bin0culars_mods_title"));
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        if (textColorPrimary != 0) {
            titleView.setTextColor(textColorPrimary);
        }
        topBar.addView(titleView);

        rootLayout.addView(topBar);

        ScrollView scrollView = new ScrollView(dialogContext);
        scrollView.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                0,
                1f
        ));

        LinearLayout contentLayout = new LinearLayout(dialogContext);
        contentLayout.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));
        contentLayout.setOrientation(LinearLayout.VERTICAL);
        contentLayout.setPadding(0, 0, 0, dp(dialogContext, 16));

        LinearLayout restartBanner = new LinearLayout(dialogContext);
        LinearLayout.LayoutParams bannerParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        bannerParams.setMargins(dp(dialogContext, 16), dp(dialogContext, 8), dp(dialogContext, 16), 0);
        bannerParams.setMarginStart(dp(dialogContext, 16));
        bannerParams.setMarginEnd(dp(dialogContext, 16));
        restartBanner.setLayoutParams(bannerParams);
        restartBanner.setOrientation(LinearLayout.HORIZONTAL);
        restartBanner.setGravity(Gravity.CENTER_VERTICAL);
        restartBanner.setPadding(dp(dialogContext, 12), dp(dialogContext, 8), dp(dialogContext, 12), dp(dialogContext, 8));

        GradientDrawable bannerBg = new GradientDrawable();
        bannerBg.setShape(GradientDrawable.RECTANGLE);
        bannerBg.setCornerRadius(dp(dialogContext, 8));
        int tintColor = textColorPrimary != 0
                ? Color.argb(20, Color.red(textColorPrimary), Color.green(textColorPrimary), Color.blue(textColorPrimary))
                : 0x14888888;
        bannerBg.setColor(tintColor);
        restartBanner.setBackground(bannerBg);
        restartBanner.setVisibility(View.GONE);

        TextView hintText = new TextView(dialogContext);
        hintText.setLayoutParams(new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1f
        ));
        hintText.setText(getString(dialogContext, "bin0culars_restart_hint"));
        hintText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        if (textColorSecondary != 0) {
            hintText.setTextColor(textColorSecondary);
        }
        restartBanner.addView(hintText);

        Button restartButton = new Button(dialogContext, null, android.R.attr.borderlessButtonStyle);
        restartButton.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));
        restartButton.setText(getString(dialogContext, "bin0culars_restart"));
        restartButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        restartButton.setMinimumHeight(0);
        restartButton.setMinimumWidth(0);
        restartButton.setPadding(dp(dialogContext, 12), dp(dialogContext, 4), dp(dialogContext, 12), dp(dialogContext, 4));
        if (colorAccent != 0) {
            restartButton.setTextColor(colorAccent);
        }
        restartButton.setOnClickListener(v -> restartApp(activity));
        restartBanner.addView(restartButton);

        contentLayout.addView(restartBanner);

        SharedPreferences prefs = getPrefs();
        List<SettingEntry> entries = getEntries();
        List<RowViewHolder> viewHolders = new ArrayList<>();

        List<String> sections = new ArrayList<>();
        for (String secId : SECTION_ORDER) {
            for (SettingEntry entry : entries) {
                if (secId.equals(entry.sectionId) && !sections.contains(secId)) {
                    sections.add(secId);
                    break;
                }
            }
        }
        for (SettingEntry entry : entries) {
            if (!sections.contains(entry.sectionId)) {
                sections.add(entry.sectionId);
            }
        }

        for (String sectionId : sections) {
            List<SettingEntry> sectionEntries = new ArrayList<>();
            for (SettingEntry entry : entries) {
                if (sectionId.equals(entry.sectionId)) {
                    String title = getString(dialogContext, "bin0culars_" + entry.key + "_title");
                    if (!title.isEmpty()) {
                        sectionEntries.add(entry);
                    }
                }
            }
            if (sectionEntries.isEmpty()) {
                continue;
            }

            TextView sectionHeader = new TextView(dialogContext);
            LinearLayout.LayoutParams headerParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            sectionHeader.setLayoutParams(headerParams);
            sectionHeader.setPadding(dp(dialogContext, 16), dp(dialogContext, 16), dp(dialogContext, 16), dp(dialogContext, 4));
            sectionHeader.setPaddingRelative(dp(dialogContext, 16), dp(dialogContext, 16), dp(dialogContext, 16), dp(dialogContext, 4));
            String sectionTitle = getString(dialogContext, "bin0culars_section_" + sectionId);
            sectionHeader.setText(!sectionTitle.isEmpty() ? sectionTitle : sectionId);
            sectionHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            sectionHeader.setTypeface(Typeface.DEFAULT_BOLD);
            if (colorAccent != 0) {
                sectionHeader.setTextColor(colorAccent);
            }
            contentLayout.addView(sectionHeader);

            for (SettingEntry entry : sectionEntries) {
                String title = getString(dialogContext, "bin0culars_" + entry.key + "_title");

                LinearLayout row = new LinearLayout(dialogContext);
                row.setLayoutParams(new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                ));
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setMinimumHeight(dp(dialogContext, 56));
                int startPadding = entry.parentKey != null ? dp(dialogContext, 32) : dp(dialogContext, 16);
                row.setPadding(startPadding, dp(dialogContext, 12), dp(dialogContext, 16), dp(dialogContext, 12));
                row.setPaddingRelative(startPadding, dp(dialogContext, 12), dp(dialogContext, 16), dp(dialogContext, 12));
                row.setClickable(true);
                row.setFocusable(true);

                TypedValue selectableBg = new TypedValue();
                if (dialogContext.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, selectableBg, true)) {
                    row.setBackgroundResource(selectableBg.resourceId);
                }

                LinearLayout textContainer = new LinearLayout(dialogContext);
                LinearLayout.LayoutParams textContainerParams = new LinearLayout.LayoutParams(
                        0,
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        1f
                );
                textContainerParams.setMarginEnd(dp(dialogContext, 16));
                textContainerParams.rightMargin = dp(dialogContext, 16);
                textContainer.setLayoutParams(textContainerParams);
                textContainer.setOrientation(LinearLayout.VERTICAL);

                TextView rowTitle = new TextView(dialogContext);
                rowTitle.setLayoutParams(new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                ));
                rowTitle.setText(title);
                rowTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
                if (textColorPrimary != 0) {
                    rowTitle.setTextColor(textColorPrimary);
                }
                textContainer.addView(rowTitle);

                String summary = getString(dialogContext, "bin0culars_" + entry.key + "_summary");
                if (!summary.isEmpty()) {
                    TextView rowSummary = new TextView(dialogContext);
                    LinearLayout.LayoutParams summaryParams = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                    );
                    summaryParams.topMargin = dp(dialogContext, 2);
                    rowSummary.setLayoutParams(summaryParams);
                    rowSummary.setText(summary);
                    rowSummary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                    if (textColorSecondary != 0) {
                        rowSummary.setTextColor(textColorSecondary);
                    }
                    textContainer.addView(rowSummary);
                }
                row.addView(textContainer);

                if (entry.isSwitch) {
                    Switch switchView = new Switch(dialogContext);
                    switchView.setLayoutParams(new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                    ));
                    switchView.setFocusable(false);
                    switchView.setClickable(false);
                    boolean currentChecked = prefs != null
                            ? prefs.getBoolean(entry.key, entry.defaultBoolean)
                            : entry.defaultBoolean;
                    switchView.setChecked(currentChecked);
                    row.addView(switchView);

                    RowViewHolder holder = new RowViewHolder(entry, row, switchView, null);
                    viewHolders.add(holder);

                    row.setOnClickListener(v -> {
                        if (!row.isEnabled()) {
                            return;
                        }
                        boolean newState = !switchView.isChecked();
                        switchView.setChecked(newState);
                        if (prefs != null) {
                            prefs.edit().putBoolean(entry.key, newState).apply();
                        }
                        updateSubSwitches(viewHolders);
                        restartBanner.setVisibility(View.VISIBLE);
                    });
                } else {
                    TextView choiceLabelView = new TextView(dialogContext);
                    choiceLabelView.setLayoutParams(new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                    ));
                    choiceLabelView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                    if (colorAccent != 0) {
                        choiceLabelView.setTextColor(colorAccent);
                    }

                    String initialVal = prefs != null
                            ? prefs.getString(entry.key, entry.defaultChoice != null ? entry.defaultChoice : "")
                            : (entry.defaultChoice != null ? entry.defaultChoice : "");
                    String initialLabel = getString(dialogContext, "bin0culars_" + entry.key + "_choice_" + initialVal);
                    choiceLabelView.setText(!initialLabel.isEmpty() ? initialLabel : initialVal);
                    row.addView(choiceLabelView);

                    RowViewHolder holder = new RowViewHolder(entry, row, null, choiceLabelView);
                    viewHolders.add(holder);

                    row.setOnClickListener(v -> {
                        if (!row.isEnabled()) {
                            return;
                        }
                        List<String> values = entry.choiceValues;
                        CharSequence[] items = new CharSequence[values.size()];
                        for (int i = 0; i < values.size(); i++) {
                            String val = values.get(i);
                            String cl = getString(dialogContext, "bin0culars_" + entry.key + "_choice_" + val);
                            items[i] = !cl.isEmpty() ? cl : val;
                        }
                        String currentVal = prefs != null
                                ? prefs.getString(entry.key, entry.defaultChoice != null ? entry.defaultChoice : "")
                                : (entry.defaultChoice != null ? entry.defaultChoice : "");
                        int checkedItem = values.indexOf(currentVal);

                        new AlertDialog.Builder(dialogContext)
                                .setTitle(title)
                                .setSingleChoiceItems(items, checkedItem, (d, which) -> {
                                    if (which >= 0 && which < values.size()) {
                                        String selectedVal = values.get(which);
                                        if (prefs != null) {
                                            prefs.edit().putString(entry.key, selectedVal).apply();
                                        }
                                        choiceLabelView.setText(items[which]);
                                        restartBanner.setVisibility(View.VISIBLE);
                                    }
                                    d.dismiss();
                                })
                                .show();
                    });
                }

                contentLayout.addView(row);
            }
        }

        updateSubSwitches(viewHolders);

        scrollView.addView(contentLayout);
        rootLayout.addView(scrollView);

        dialog.setContentView(rootLayout);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        }
        dialog.show();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        }
    }

    private static String getString(Context context, String name) {
        try {
            int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
            if (id != 0) {
                return context.getString(id);
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    private static int dp(Context context, float dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                context.getResources().getDisplayMetrics()
        );
    }

    private static int resolveColor(Context context, int attr) {
        TypedValue typedValue = new TypedValue();
        if (context.getTheme().resolveAttribute(attr, typedValue, true)) {
            if (typedValue.type >= TypedValue.TYPE_FIRST_COLOR_INT && typedValue.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return typedValue.data;
            }
            if (typedValue.resourceId != 0) {
                try {
                    return context.getColor(typedValue.resourceId);
                } catch (Throwable ignored) {
                }
            }
        }
        return 0;
    }
}
