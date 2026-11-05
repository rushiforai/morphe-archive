// Based on SysAdminDoc/HushMessenger (GPL-3.0), extensions/messenger/src/main/java/app/hushmessenger/extension/SettingsActivity.java:
// a framework Activity with views built in code, edge-to-edge insets including the display cutout, a safe-mode
// banner with Resume, sensitive clipboard copy and a restart through Intent.makeRestartActivityTask;
// modified 2026-10-14: new, much smaller screen for the patch-time registry (categories, states, restart badge),
// minSdk 23 guards, light/dark/AMOLED palettes, OnBackInvokedCallback on API 33+, row-level accessibility.
// 2026-11-03: list settings (a row per list feature and the ListPicker panel).

package app.template.extension.hevalcontrols.ui;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.template.extension.hevalcontrols.CrashGuard;
import app.template.extension.hevalcontrols.Feature;
import app.template.extension.hevalcontrols.HevalSettings;
import app.template.extension.hevalcontrols.Registry;

/**
 * The Patch settings screen. Declared {@code exported="false"} by the patch: only the
 * patched app itself can open it, through {@link #open(Context)} from an in-app entry point. It
 * reads nothing from its intent, so starting it can never change a setting.
 *
 * <p>A list feature gets a row with an "N hidden" summary; tapping it shows {@link ListPicker} in
 * place of the main screen (back or Done returns).
 *
 * <p>Extension points for later steps (not built yet): search above the categories, import and
 * export next to "Copy diagnostics", and profiles as a section after the master pause.
 */
@SuppressWarnings("unused")
public final class HevalControlsActivity extends Activity {
    static final String TITLE = "Patch settings";

    /** Opens the screen; for in-app menu hooks. Never throws. */
    public static void open(Context context) {
        try {
            Intent intent = new Intent(context, HevalControlsActivity.class);
            if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable failure) {
            android.util.Log.e("HevalControls", "Cannot open Patch settings: " + failure.getClass().getName());
        }
    }

    private Palette palette;
    private Views views;
    private TextView status;
    private View safeModeCard, engineCard, restartCard, resetConfirm;
    private TextView restartText;
    private Button resetButton;
    private Switch pauseSwitch;
    private LinearLayout pauseRow;
    private final List<FeatureRow> rows = new ArrayList<>();
    private Object backCallback;
    private LinearLayout root;
    private ScrollView scroll;
    /** The open list picker, or null. */
    private ListPicker picker;

    private static final String STATE_PICKER = "heval_picker";
    private static final String STATE_QUERY = "heval_picker_query";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // Normally done by the init provider; repeated here in case the provider never ran.
        HevalSettings.init(this);
        palette = Palette.resolve(this, HevalSettings.theme());
        setTheme(palette.light ? android.R.style.Theme_Material_Light_NoActionBar : android.R.style.Theme_Material_NoActionBar);
        super.onCreate(savedInstanceState);
        setTitle(TITLE);
        views = new Views(this, palette);

        root = views.column();
        root.setBackgroundColor(palette.background);
        // Follows the locale; the host's android:supportsRtl still decides whether RTL applies.
        root.setLayoutDirection(View.LAYOUT_DIRECTION_LOCALE);
        // Tapjacking: ignore touches while another window covers this one.
        root.setFilterTouchesWhenObscured(true);
        applyInsets(root);

        scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setClipToPadding(false);
        LinearLayout content = views.column();
        content.setPaddingRelative(views.dp(16), views.dp(12), views.dp(16), views.dp(32));
        scroll.addView(content, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(root);
        configureSystemBars();
        // The picker's search field: below API 30 the window resizes for the keyboard; on API 30+
        // the root is padded by the IME inset instead (edge-to-edge windows are not resized).
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                | WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);

        build(content);
        refresh();

        // Reopen the picker after a configuration change (rotation, theme switch).
        String open = savedInstanceState == null ? null : savedInstanceState.getString(STATE_PICKER);
        Feature reopen = open == null ? null : Registry.get().feature(open);
        if (reopen != null && reopen.isList()) openPicker(reopen, savedInstanceState.getString(STATE_QUERY));
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (picker != null) {
            outState.putString(STATE_PICKER, picker.feature.id);
            outState.putString(STATE_QUERY, picker.query());
        }
    }

    // -------------------------------------------------------------------------------------------
    // Window: edge-to-edge (enforced from targetSdk 35 on Android 15) and system bar icons
    // -------------------------------------------------------------------------------------------

    @SuppressWarnings("deprecation")
    private void configureSystemBars() {
        Window window = getWindow();
        if (Build.VERSION.SDK_INT >= 30) {
            window.setDecorFitsSystemWindows(false);
            if (Build.VERSION.SDK_INT < 35) {
                window.setStatusBarColor(Color.TRANSPARENT);
                window.setNavigationBarColor(Color.TRANSPARENT);
            }
            Api30.lightBars(window, palette.light);
        } else {
            window.setStatusBarColor(palette.background);
            int flags = palette.light ? View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR : 0;
            if (Build.VERSION.SDK_INT >= 26) {
                window.setNavigationBarColor(palette.background);
                if (palette.light) flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            } else {
                // Light navigation icons need API 26; keep the bar dark so its icons stay visible.
                window.setNavigationBarColor(Color.BLACK);
            }
            window.getDecorView().setSystemUiVisibility(flags);
        }
    }

    /** Pads the root by the system bars and the display cutout, whichever is larger per edge. */
    @SuppressWarnings("deprecation")
    private void applyInsets(View root) {
        root.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View view, WindowInsets insets) {
                if (Build.VERSION.SDK_INT >= 30) {
                    Api30.padForSystemBars(view, insets);
                    return Api30.consumed();
                }
                int left = insets.getSystemWindowInsetLeft(), top = insets.getSystemWindowInsetTop();
                int right = insets.getSystemWindowInsetRight(), bottom = insets.getSystemWindowInsetBottom();
                if (Build.VERSION.SDK_INT >= 28) {
                    int[] cutout = Api28.cutout(insets);
                    left = Math.max(left, cutout[0]);
                    top = Math.max(top, cutout[1]);
                    right = Math.max(right, cutout[2]);
                    bottom = Math.max(bottom, cutout[3]);
                }
                view.setPadding(left, top, right, bottom);
                return insets.consumeSystemWindowInsets();
            }
        });
    }

    // -------------------------------------------------------------------------------------------
    // Content
    // -------------------------------------------------------------------------------------------

    private void build(LinearLayout content) {
        Registry registry = Registry.get();

        TextView title = views.text(TITLE, 26, palette.text, true);
        Views.markHeading(title);
        views.add(content, title, 12);
        views.add(content, views.text("Turn patched features on or off without patching the app again.", 14, palette.muted, false), 6);

        LinearLayout info = views.card(palette.surface, palette.line);
        infoLine(info, "App version", Diagnostics.runningVersion(this));
        infoLine(info, "Patched for", Diagnostics.orUnknown(Registry.patchedAppVersion()));
        infoLine(info, "Patch bundle", Diagnostics.orUnknown(Registry.bundleVersion()));
        infoLine(info, "Features", featureCounts(registry));
        status = infoLine(info, "Status", "");
        views.add(content, info, 16);

        safeModeCard = safeModeCard();
        views.add(content, safeModeCard, 12);
        engineCard = notice("Settings unavailable",
                "Patch settings could not be read, so every feature uses the app's stock behaviour until the app restarts.",
                palette.error, palette.errorSurface);
        views.add(content, engineCard, 12);
        if (!registry.decoded.supported) {
            views.add(content, notice("Feature list unreadable",
                    "This app was patched with a feature list this version cannot read. Every feature uses stock behaviour. Patch the app again.",
                    palette.error, palette.errorSurface), 12);
        } else if (registry.features().isEmpty()) {
            views.add(content, notice("No features", "No switchable feature was patched into this app.",
                    palette.muted, palette.surface), 12);
        }
        restartCard = restartCard();
        views.add(content, restartCard, 12);

        LinearLayout pauseCard = views.card(palette.surface, palette.line);
        pauseCard.setPadding(0, 0, 0, 0);
        pauseSwitch = views.toggle(false);
        pauseRow = switchRow("Pause all patches",
                "Every runtime feature behaves like the stock app. Your choices are kept.", null, pauseSwitch);
        pauseRow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                boolean paused = !HevalSettings.isPaused();
                if (!HevalSettings.setPaused(paused)) toast("Could not save the change");
                refresh();
                view.announceForAccessibility(paused ? "All patches paused" : "Patches resumed");
            }
        });
        pauseRow.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(Switch.class.getName());
                info.setCheckable(true);
                info.setChecked(HevalSettings.isPaused());
            }
        });
        pauseCard.addView(pauseRow);
        views.add(content, pauseCard, 16);

        for (Map.Entry<String, List<Feature>> category : byCategory(registry.features()).entrySet()) {
            views.add(content, views.heading(category.getKey()), 24);
            LinearLayout card = views.card(palette.surface, palette.line);
            card.setPadding(0, 0, 0, 0);
            boolean first = true;
            for (Feature feature : category.getValue()) {
                if (!first) views.divider(card);
                first = false;
                card.addView(feature.isList() ? listRow(feature) : featureRow(feature));
            }
            views.add(content, card, 8);
        }

        views.add(content, views.heading("Appearance"), 24);
        final Button theme = views.button(themeLabel(HevalSettings.theme()));
        theme.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (HevalSettings.setTheme(nextTheme(HevalSettings.theme()))) recreate();
                else toast("Could not save the change");
            }
        });
        views.add(content, theme, 8);

        views.add(content, views.heading("Diagnostics"), 24);
        views.add(content, views.text("Versions, device model and feature states. No account data or app content.",
                13, palette.muted, false), 8);
        Button copy = views.button("Copy diagnostics");
        copy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                copyDiagnostics();
            }
        });
        views.add(content, copy, 8);

        views.add(content, views.heading("App"), 24);
        Button restart = views.button("Restart app");
        restart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                restartApp();
            }
        });
        views.add(content, restart, 8);
        resetButton = views.button("Reset all to defaults");
        resetButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                setResetConfirmation(true);
            }
        });
        views.add(content, resetButton, 8);
        resetConfirm = resetConfirmation();
        views.add(content, resetConfirm, 8);

        views.add(content, views.text("Only runtime features can be switched here. Changes made when the app was patched "
                + "(manifest, resources, removed code) stay until you patch again.", 12, palette.muted, false), 24);
        views.add(content, views.text("Settings framework based on SysAdminDoc/HushMessenger (GPL-3.0).",
                12, palette.muted, false), 8);
    }

    private TextView infoLine(LinearLayout card, String label, String value) {
        LinearLayout line = views.row();
        line.setMinimumHeight(views.dp(28));
        TextView name = views.text(label, 13, palette.muted, false);
        line.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView text = views.text(value, 13, palette.text, true);
        text.setGravity(Gravity.END);
        text.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_END);
        line.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        card.addView(line);
        return text;
    }

    private static String featureCounts(Registry registry) {
        int runtime = 0, buildTime = 0, lists = 0;
        for (Feature feature : registry.features()) {
            if (feature.buildTimeOnly) buildTime++;
            else if (feature.isList()) lists++;
            else runtime++;
        }
        return runtime + " runtime, " + (lists > 0 ? lists + (lists == 1 ? " list, " : " lists, ") : "")
                + buildTime + " patch-time";
    }

    private View notice(String title, String body, int color, int fill) {
        LinearLayout card = views.card(fill, 0);
        TextView heading = views.text(title, 15, color, true);
        Views.markHeading(heading);
        card.addView(heading);
        views.add(card, views.text(body, 13, palette.text, false), 6);
        return card;
    }

    private View safeModeCard() {
        LinearLayout card = views.card(palette.errorSurface, 0);
        TextView heading = views.text("Safe mode is on", 15, palette.error, true);
        Views.markHeading(heading);
        card.addView(heading);
        views.add(card, views.text("The app crashed three times in a row within a minute of starting, so Patch settings "
                + "switched every runtime feature off. The app now uses its stock behaviour everywhere below.", 13, palette.text, false), 6);
        views.add(card, views.text("Safe mode cannot help when the crash comes from a change made at patch time, happens "
                + "before Patch settings starts, or is a native crash on Android 10 or older. If the app still crashes, "
                + "patch it again without the feature that causes it.", 12, palette.muted, false), 8);
        LinearLayout buttons = views.row();
        Button resume = views.primaryButton("Resume");
        resume.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!CrashGuard.resume(false)) toast("Could not save the change");
                refresh();
                view.announceForAccessibility("Safe mode off");
            }
        });
        Button paused = views.button("Resume paused");
        paused.setContentDescription("Resume paused: leave safe mode with every feature paused, then turn them on one at a time");
        paused.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!CrashGuard.resume(true)) toast("Could not save the change");
                refresh();
                view.announceForAccessibility("Safe mode off, all features paused");
            }
        });
        buttons.addView(resume, wrap(0));
        buttons.addView(paused, wrap(8));
        views.add(card, buttons, 12);
        return card;
    }

    private View restartCard() {
        LinearLayout card = views.card(palette.warningSurface, 0);
        restartText = views.text("", 14, palette.warning, true);
        card.addView(restartText);
        Button now = views.primaryButton("Restart now");
        now.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                restartApp();
            }
        });
        views.add(card, now, 10);
        return card;
    }

    private View resetConfirmation() {
        LinearLayout card = views.card(palette.warningSurface, 0);
        card.addView(views.text("Reset every feature to its default and turn the pause off?", 14, palette.text, false));
        LinearLayout buttons = views.row();
        Button reset = views.primaryButton("Reset");
        reset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                boolean saved = HevalSettings.resetAll();
                setResetConfirmation(false);
                refresh();
                toast(saved ? "Every feature is back to its default" : "Could not save the change");
            }
        });
        Button cancel = views.button("Cancel");
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                setResetConfirmation(false);
            }
        });
        buttons.addView(reset, wrap(0));
        buttons.addView(cancel, wrap(8));
        views.add(card, buttons, 12);
        // Closed until "Reset all to defaults" is tapped; otherwise it shows from the start and
        // the first back press only closes it.
        card.setVisibility(View.GONE);
        return card;
    }

    private LinearLayout.LayoutParams wrap(int startMarginDp) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMarginStart(views.dp(startMarginDp));
        return params;
    }

    /** A focusable row with title, description, a state line and an optional trailing switch. */
    private LinearLayout switchRow(String title, String description, TextView stateLine, Switch toggle) {
        LinearLayout row = views.row();
        row.setMinimumHeight(views.dp(64));
        row.setPaddingRelative(views.dp(16), views.dp(12), views.dp(12), views.dp(12));
        row.setBackground(views.interactive(palette.surface, 0, 14, palette.accent));
        row.setFocusable(true);
        LinearLayout texts = views.column();
        texts.addView(views.text(title, 16, palette.text, true));
        if (!description.isEmpty()) views.add(texts, views.text(description, 13, palette.muted, false), 4);
        if (stateLine != null) views.add(texts, stateLine, 6);
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        if (toggle != null) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.setMarginStart(views.dp(12));
            row.addView(toggle, params);
        }
        return row;
    }

    private View featureRow(final Feature feature) {
        LinearLayout stateLine = views.row();
        TextView state = views.text("", 12, palette.muted, true);
        stateLine.addView(state);
        if (feature.restartRequired && !feature.buildTimeOnly) {
            TextView badge = views.badge("Restart", palette.warning, palette.warningSurface);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.setMarginStart(views.dp(8));
            stateLine.addView(badge, params);
        }
        final Switch toggle = feature.buildTimeOnly ? null : views.toggle(false);
        final LinearLayout row = switchRow(feature.name, feature.description, null, toggle);
        ((LinearLayout) row.getChildAt(0)).addView(stateLine, topMargin(6));
        final FeatureRow holder = new FeatureRow(feature, row, toggle, state);
        rows.add(holder);
        if (toggle == null) return row;
        row.setClickable(true);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (HevalSettings.missingDependency(feature) != null) return;
                boolean enabled = !HevalSettings.isChosen(feature.id);
                if (!HevalSettings.setEnabled(feature.id, enabled)) toast("Could not save the change");
                refresh();
                view.announceForAccessibility(feature.name + (enabled ? " on" : " off")
                        + (feature.restartRequired ? ". Restart the app to apply." : ""));
            }
        });
        row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                // Spoken as a switch, with the row as the single focus stop.
                info.setClassName(Switch.class.getName());
                info.setCheckable(true);
                info.setChecked(HevalSettings.isChosen(feature.id));
            }
        });
        return row;
    }

    /**
     * A list feature: name, description and an "N hidden" state line; tapping opens the picker.
     * Spoken as a button with the summary as its state.
     */
    private View listRow(final Feature feature) {
        LinearLayout stateLine = views.row();
        TextView state = views.text("", 12, palette.muted, true);
        stateLine.addView(state);
        if (feature.restartRequired) {
            TextView badge = views.badge("Restart", palette.warning, palette.warningSurface);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.setMarginStart(views.dp(8));
            stateLine.addView(badge, params);
        }
        final LinearLayout row = switchRow(feature.name, feature.description, null, null);
        ((LinearLayout) row.getChildAt(0)).addView(stateLine, topMargin(6));
        TextView edit = views.text("Edit", 14, palette.accent, true);
        edit.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMarginStart(views.dp(12));
        row.addView(edit, params);
        rows.add(new FeatureRow(feature, row, null, state));
        row.setClickable(true);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (HevalSettings.missingDependency(feature) != null) return;
                openPicker(feature, null);
            }
        });
        row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(Button.class.getName());
            }
        });
        return row;
    }

    /** "None hidden", "1 hidden", "12 hidden". */
    static String hiddenSummary(int count) {
        return count == 0 ? "None hidden" : count + " hidden";
    }

    private LinearLayout.LayoutParams topMargin(int dp) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = views.dp(dp);
        return params;
    }

    private static Map<String, List<Feature>> byCategory(List<Feature> features) {
        Map<String, List<Feature>> groups = new LinkedHashMap<>();
        for (Feature feature : features) {
            List<Feature> group = groups.get(feature.category);
            if (group == null) {
                group = new ArrayList<>();
                groups.put(feature.category, group);
            }
            group.add(feature);
        }
        return groups;
    }

    // -------------------------------------------------------------------------------------------
    // State
    // -------------------------------------------------------------------------------------------

    private void refresh() {
        boolean paused = HevalSettings.isPaused(), safeMode = HevalSettings.isSafeMode();
        boolean failed = HevalSettings.isEngineFailed();
        status.setText(failed ? "Unavailable (stock)" : safeMode ? "Safe mode (stock)" : paused ? "Paused (stock)" : "Active");
        status.setTextColor(failed || safeMode ? palette.error : paused ? palette.warning : palette.success);
        safeModeCard.setVisibility(safeMode ? View.VISIBLE : View.GONE);
        engineCard.setVisibility(failed ? View.VISIBLE : View.GONE);
        int pending = HevalSettings.pendingRestartCount();
        restartCard.setVisibility(pending > 0 ? View.VISIBLE : View.GONE);
        restartText.setText(pending == 1 ? "1 change needs a restart" : pending + " changes need a restart");

        pauseSwitch.setChecked(paused);
        describe(pauseRow, "Pause all patches", paused ? "On" : "Off");

        boolean inactive = paused || safeMode || failed;
        for (FeatureRow row : rows) row.update(inactive, paused, safeMode, failed);
    }

    private final class FeatureRow {
        final Feature feature;
        final LinearLayout row;
        final Switch toggle;
        final TextView state;

        FeatureRow(Feature feature, LinearLayout row, Switch toggle, TextView state) {
            this.feature = feature;
            this.row = row;
            this.toggle = toggle;
            this.state = state;
        }

        void update(boolean inactive, boolean paused, boolean safeMode, boolean failed) {
            HevalSettings.State current = HevalSettings.stateOf(feature);
            boolean chosen = HevalSettings.isChosen(feature.id);
            String text;
            int color;
            if (feature.isList()) {
                updateList(current, inactive, paused, safeMode, failed);
                return;
            }
            switch (current) {
                case ENABLED:
                    text = "On";
                    color = palette.success;
                    break;
                case RESTART_REQUIRED:
                    text = "Restart required";
                    color = palette.warning;
                    break;
                case UNSUPPORTED:
                    text = "Unsupported: needs " + HevalSettings.missingDependency(feature) + ", which is not in this app";
                    color = palette.error;
                    break;
                case FAILED:
                    text = "Failed, using stock behaviour";
                    color = palette.error;
                    break;
                case BUILD_TIME_ONLY:
                    text = "Applied at patch time";
                    color = palette.muted;
                    break;
                default:
                    text = failed ? "Off (settings unavailable)" : safeMode ? "Off (safe mode)" : paused ? "Off (paused)"
                            : chosen ? "Off (needs " + dependencyNames(feature) + ")" : "Off";
                    color = palette.muted;
                    break;
            }
            state.setText(text);
            state.setTextColor(color);
            if (toggle != null) {
                toggle.setChecked(chosen);
                toggle.setEnabled(current != HevalSettings.State.UNSUPPORTED);
            }
            row.setAlpha(inactive && !feature.buildTimeOnly ? 0.6f : 1f);
            describe(row, feature.name + (feature.description.isEmpty() ? "" : ". " + feature.description), text);
        }

        private void updateList(HevalSettings.State current, boolean inactive, boolean paused, boolean safeMode, boolean failed) {
            int count = HevalSettings.pickedHidden(feature.id).size();
            String picked = hiddenSummary(count);
            String text;
            int color;
            switch (current) {
                case UNSUPPORTED:
                    text = "Unsupported: needs " + HevalSettings.missingDependency(feature) + ", which is not in this app";
                    color = palette.error;
                    break;
                case FAILED:
                    text = picked + ". Failed, using stock behaviour";
                    color = palette.error;
                    break;
                case RESTART_REQUIRED:
                    text = picked + ", restart required";
                    color = palette.warning;
                    break;
                case ENABLED:
                    text = picked;
                    color = palette.success;
                    break;
                default:
                    text = count == 0 ? picked : picked + (failed ? " (settings unavailable)" : safeMode ? " (safe mode)"
                            : paused ? " (paused)" : " (needs " + dependencyNames(feature) + ")");
                    color = palette.muted;
                    break;
            }
            state.setText(text);
            state.setTextColor(color);
            row.setAlpha(inactive ? 0.6f : 1f);
            describe(row, feature.name + (feature.description.isEmpty() ? "" : ". " + feature.description), text);
        }
    }

    // -------------------------------------------------------------------------------------------
    // List picker
    // -------------------------------------------------------------------------------------------

    /** Shows the picker of a list feature in place of the main screen. */
    void openPicker(Feature feature, String query) {
        if (picker != null) closePicker(false);
        picker = new ListPicker(this, views, palette, feature);
        scroll.setVisibility(View.GONE);
        root.addView(picker.panel, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        picker.start(query);
        updateBackCallback();
    }

    /** Back to the main screen, with the list row focused again. */
    void closePicker(boolean restoreFocus) {
        ListPicker open = picker;
        if (open == null) return;
        picker = null;
        open.dismissKeyboard();
        root.removeView(open.panel);
        scroll.setVisibility(View.VISIBLE);
        refresh();
        updateBackCallback();
        if (restoreFocus) {
            for (FeatureRow row : rows) {
                if (row.feature == open.feature) {
                    row.row.requestFocus();
                    row.row.sendAccessibilityEvent(android.view.accessibility.AccessibilityEvent.TYPE_VIEW_FOCUSED);
                    break;
                }
            }
        }
    }

    /** Back closes the picker, then the reset confirmation; otherwise the system back applies. */
    boolean handleBack() {
        if (picker != null) {
            closePicker(true);
            return true;
        }
        if (resetConfirm != null && resetConfirm.getVisibility() == View.VISIBLE) {
            setResetConfirmation(false);
            return true;
        }
        return false;
    }

    private void updateBackCallback() {
        if (Build.VERSION.SDK_INT < 33) return;
        boolean wanted = picker != null || (resetConfirm != null && resetConfirm.getVisibility() == View.VISIBLE);
        if (wanted && backCallback == null) backCallback = Api33.register(this);
        else if (!wanted && backCallback != null) {
            Api33.unregister(this, backCallback);
            backCallback = null;
        }
    }

    private static String dependencyNames(Feature feature) {
        StringBuilder names = new StringBuilder();
        Registry registry = Registry.get();
        for (String id : feature.dependencies) {
            Feature dependency = registry.feature(id);
            if (names.length() > 0) names.append(", ");
            names.append(dependency == null ? id : dependency.name);
        }
        return names.length() == 0 ? "another feature" : names.toString();
    }

    /** One spoken description per row: what it is, then its state. */
    private static void describe(View row, String what, String state) {
        if (Build.VERSION.SDK_INT >= 30) {
            row.setContentDescription(what);
            Api30.stateDescription(row, state);
        } else {
            row.setContentDescription(what + ". " + state);
        }
    }

    // -------------------------------------------------------------------------------------------
    // Actions
    // -------------------------------------------------------------------------------------------

    private void copyDiagnostics() {
        try {
            ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
            ClipData clip = ClipData.newPlainText("Patch settings diagnostics", Diagnostics.report(this));
            if (Build.VERSION.SDK_INT >= 24) {
                // Keeps the text out of clipboard previews (honoured from Android 13).
                PersistableBundle extras = new PersistableBundle();
                extras.putBoolean(Build.VERSION.SDK_INT >= 33 ? ClipDescription.EXTRA_IS_SENSITIVE
                        : "android.content.extra.IS_SENSITIVE", true);
                clip.getDescription().setExtras(extras);
            }
            clipboard.setPrimaryClip(clip);
            toast("Diagnostics copied");
        } catch (Throwable failure) {
            toast("Could not copy diagnostics");
        }
    }

    /** Relaunches the app's launcher activity in a fresh process. Settings are already committed. */
    private void restartApp() {
        try {
            Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
            if (launch == null || launch.getComponent() == null) {
                toast("Close the app and open it again to restart it");
                return;
            }
            startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
            finishAffinity();
            Runtime.getRuntime().exit(0);
        } catch (Throwable failure) {
            toast("Close the app and open it again to restart it");
        }
    }

    private void setResetConfirmation(boolean open) {
        resetConfirm.setVisibility(open ? View.VISIBLE : View.GONE);
        resetButton.setVisibility(open ? View.GONE : View.VISIBLE);
        if (open) resetConfirm.requestFocus();
        else resetButton.requestFocus();
        // Back closes the confirmation while it is open; otherwise the system back (and its
        // predictive animation) applies.
        updateBackCallback();
    }

    /**
     * Below API 33, or when the host has not opted in to OnBackInvokedCallback. With predictive
     * back (targetSdk 36+ on Android 16) this is not called; the callback registered in
     * {@link #updateBackCallback()} handles back instead, so lint's migration advice
     * (androidx OnBackPressedDispatcher, unavailable here) does not apply.
     */
    @Override
    @SuppressWarnings("deprecation")
    @android.annotation.SuppressLint("GestureBackNavigation")
    public void onBackPressed() {
        if (handleBack()) return;
        super.onBackPressed();
    }

    @Override
    protected void onDestroy() {
        if (Build.VERSION.SDK_INT >= 33 && backCallback != null) {
            Api33.unregister(this, backCallback);
            backCallback = null;
        }
        super.onDestroy();
    }

    void toast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
    }

    private static String themeLabel(String theme) {
        switch (theme) {
            case HevalSettings.THEME_LIGHT: return "Theme: Light";
            case HevalSettings.THEME_DARK: return "Theme: Dark";
            case HevalSettings.THEME_AMOLED: return "Theme: AMOLED black";
            default: return "Theme: System";
        }
    }

    private static String nextTheme(String theme) {
        switch (theme) {
            case HevalSettings.THEME_SYSTEM: return HevalSettings.THEME_LIGHT;
            case HevalSettings.THEME_LIGHT: return HevalSettings.THEME_DARK;
            case HevalSettings.THEME_DARK: return HevalSettings.THEME_AMOLED;
            default: return HevalSettings.THEME_SYSTEM;
        }
    }

    // -------------------------------------------------------------------------------------------
    // API-level helpers, kept in their own classes so older devices never verify newer types.
    // -------------------------------------------------------------------------------------------

    @TargetApi(28)
    private static final class Api28 {
        static int[] cutout(WindowInsets insets) {
            android.view.DisplayCutout cutout = insets.getDisplayCutout();
            if (cutout == null) return new int[4];
            return new int[] {cutout.getSafeInsetLeft(), cutout.getSafeInsetTop(),
                    cutout.getSafeInsetRight(), cutout.getSafeInsetBottom()};
        }
    }

    @TargetApi(30)
    private static final class Api30 {
        static void padForSystemBars(View view, WindowInsets insets) {
            // The keyboard (the picker's search field) counts as a bottom bar.
            android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars()
                    | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime());
            view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
        }

        static WindowInsets consumed() {
            return WindowInsets.CONSUMED;
        }

        static void lightBars(Window window, boolean light) {
            WindowInsetsController controller = window.getInsetsController();
            if (controller == null) return;
            int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            controller.setSystemBarsAppearance(light ? mask : 0, mask);
        }

        static void stateDescription(View view, String state) {
            view.setStateDescription(state);
        }
    }

    @TargetApi(33)
    private static final class Api33 {
        static Object register(final HevalControlsActivity activity) {
            OnBackInvokedCallback callback = new OnBackInvokedCallback() {
                @Override
                public void onBackInvoked() {
                    activity.handleBack();
                }
            };
            activity.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_DEFAULT, callback);
            return callback;
        }

        static void unregister(HevalControlsActivity activity, Object callback) {
            activity.getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback((OnBackInvokedCallback) callback);
        }
    }
}
