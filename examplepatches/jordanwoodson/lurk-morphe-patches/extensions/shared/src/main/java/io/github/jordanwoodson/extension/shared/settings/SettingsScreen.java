package io.github.jordanwoodson.extension.shared.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.Build;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.Toolbar;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import io.github.jordanwoodson.extension.shared.Logger;

/**
 * The Lurk settings screen, built from the registry the included patches wrote: a switch, choice or text for
 * each setting, grouped by section, with search, Pause Lurk, export and import, a bug report and a restart
 * bar. Plain framework views and drawables only, since the patched app brings its own AppCompat and Kotlin.
 * Shown by a {@link Host}: {@link SettingsActivity}, or {@link SettingsDialog} over the app's own activity
 * when the installed app's manifest doesn't declare that activity.
 */
@SuppressWarnings("deprecation")
final class SettingsScreen {
    static final int REQUEST_EXPORT = 0x4c01;
    static final int REQUEST_IMPORT = 0x4c02;
    static final String STATE_QUERY = "query";

    /** The window the screen is shown in. */
    interface Host {
        Window window();

        /** Closes the screen. */
        void close();

        /**
         * Starts a file picker whose result comes back through {@link #onPicked}; false when this host can't
         * receive one, and the screen uses the clipboard instead.
         */
        boolean pick(Intent intent, int request);

        /** Android 13+: where back callbacks are registered. */
        android.window.OnBackInvokedDispatcher backDispatcher();
    }

    private final Context context;
    private final Host host;
    private static final int MAX_IMPORT_BYTES = 256 * 1024;

    private static final int HEADER = 0;
    private static final int NOTICE = 1;
    private static final int SECTION = 2;
    private static final int ROW = 3;
    private static final int EMPTY = 4;

    private Palette palette;
    private Registry registry;
    private final List<Row> rows = new ArrayList<>();
    private final RowAdapter adapter = new RowAdapter();
    private ListView list;
    private View restartBar;
    private EditText search;
    private View clearSearch;
    private String query = "";

    /** One line of the list. */
    private static final class Row {
        final int kind;
        String title = "";
        String value;
        String summary;
        String icon;
        Boolean checked;
        boolean indent;
        boolean enabled = true;
        /** The switch this row only matters under, by title. */
        String needs;
        boolean warning;
        Runnable click;
        boolean first;
        boolean last;

        Row(int kind) {
            this.kind = kind;
        }
    }

    /** Whether the device is in dark mode, which picks the host's theme and the screen's palette. */
    static boolean dark(Context context) {
        return (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                != Configuration.UI_MODE_NIGHT_NO;
    }

    static int theme(boolean dark) {
        return dark ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar;
    }

    /** {@code context} carries {@link #theme}; {@code savedQuery} is the search to restore, or null. */
    SettingsScreen(Context context, Host host, String savedQuery) {
        this.context = context;
        this.host = host;
        palette = Palette.of(dark(context));
        registry = Settings.registry();
        if (savedQuery != null) query = savedQuery;
    }

    /** Builds the screen. The host sets the returned view as its content, then calls {@link #attached}. */
    View create() {

        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(palette.background);
        // Keeps the search field from taking focus (and the keyboard) when the screen opens.
        root.setFocusableInTouchMode(true);
        root.addView(toolbar(), new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        restartBar = restartBar();
        root.addView(restartBar, new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        root.addView(searchField(), new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

        list = new ListView(context);
        list.setDivider(null);
        list.setSelector(new ColorDrawable(Color.TRANSPARENT));
        list.setClipToPadding(false);
        list.setItemsCanFocus(true);
        list.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
        list.setPadding(0, dp(4), 0, dp(24));
        list.setAdapter(adapter);
        root.addView(list, new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, 0, 1));

        // Drawn edge to edge on every version (Android 15+ insists): keep clear of the status bar and
        // cutouts at the top, and of the navigation bar and keyboard at the end of the list.
        int listBottom = list.getPaddingBottom();
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int bottom = insets.getSystemWindowInsetBottom();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                bottom = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.ime()).bottom;
            }
            view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), 0);
            list.setPadding(0, list.getPaddingTop(), 0, listBottom + bottom);
            return insets;
        });
        this.root = root;
        return root;
    }

    private View root;

    /** After the host has set {@link #create}'s view as its content. */
    void attached() {
        host.window().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                | WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);
        drawEdgeToEdge(!palette.dark);
        if (!query.isEmpty()) search.setText(query);
        root.requestFocus();
        rebuild();
    }

    /** The values may have changed while the screen was in the background. */
    void resumed() {
        rebuild();
    }

    String query() {
        return query;
    }

    /** Back clears the search first; false when there is none and the host should close. */
    boolean onBack() {
        if (query.isEmpty()) return false;
        search.setText("");
        return true;
    }

    /** Back clears the search first, also in apps that opt in to predictive back (Android 13+), which skip onBackPressed. */
    private Object backCallback;

    private void updateBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return;
        boolean wanted = !query.isEmpty();
        if (wanted == (backCallback != null)) return;
        android.window.OnBackInvokedDispatcher dispatcher = host.backDispatcher();
        if (dispatcher == null) return;
        if (wanted) {
            android.window.OnBackInvokedCallback callback = () -> search.setText("");
            dispatcher.registerOnBackInvokedCallback(android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT, callback);
            backCallback = callback;
        } else {
            dispatcher.unregisterOnBackInvokedCallback((android.window.OnBackInvokedCallback) backCallback);
            backCallback = null;
        }
    }

    private void drawEdgeToEdge(boolean light) {
        Window window = host.window();
        window.setStatusBarColor(Color.TRANSPARENT);
        window.setNavigationBarColor(Color.TRANSPARENT);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false);
            int lightBars = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                    | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) controller.setSystemBarsAppearance(light ? lightBars : 0, lightBars);
        } else {
            int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
            if (light) flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            window.getDecorView().setSystemUiVisibility(flags);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Fixed views: toolbar, restart bar, search

    private View toolbar() {
        Toolbar toolbar = new Toolbar(context);
        toolbar.setTitle(registry.name + " settings");
        toolbar.setTitleTextColor(palette.text);
        toolbar.setNavigationIcon(Icons.icon(Icons.BACK, palette.text, dp(24)));
        toolbar.setNavigationContentDescription("Back");
        toolbar.setNavigationOnClickListener(view -> host.close());
        return toolbar;
    }

    /** "Restart <app>", shown while a setting that is read at startup differs from what the app started with. */
    private View restartBar() {
        LinearLayout bar = new LinearLayout(context);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(16), dp(12), dp(16), dp(12));
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(palette.fill);
        shape.setCornerRadius(dp(16));
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(dp(16));
        bar.setBackground(new RippleDrawable(ColorStateList.valueOf(0x33000000), shape, mask));
        ImageView icon = new ImageView(context);
        icon.setImageDrawable(Icons.icon(Icons.RESTART, palette.onFill, dp(24)));
        bar.addView(icon, new LinearLayout.LayoutParams(dp(24), dp(24)));
        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setPadding(dp(14), 0, 0, 0);
        texts.addView(text("Restart " + registry.app, 16, palette.onFill, true));
        texts.addView(text("Some of your changes apply after a restart.", 13.5f, palette.onFill, false));
        bar.addView(texts, new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1));
        bar.setOnClickListener(view -> Settings.restart(context));
        bar.setContentDescription("Restart " + registry.app + ". Some of your changes apply after a restart.");
        FrameLayout outer = new FrameLayout(context);
        outer.setPadding(dp(16), dp(4), dp(16), dp(8));
        outer.addView(bar);
        return outer;
    }

    private View searchField() {
        LinearLayout box = new LinearLayout(context);
        box.setOrientation(LinearLayout.HORIZONTAL);
        box.setGravity(Gravity.CENTER_VERTICAL);
        box.setPadding(dp(14), 0, dp(6), 0);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(palette.raised);
        shape.setCornerRadius(dp(24));
        box.setBackground(shape);
        ImageView icon = new ImageView(context);
        icon.setImageDrawable(Icons.icon(Icons.SEARCH, palette.secondary, dp(22)));
        box.addView(icon, new LinearLayout.LayoutParams(dp(22), dp(22)));

        search = new EditText(context);
        search.setBackground(null);
        search.setHint("Search " + registry.name + " settings");
        search.setHintTextColor(palette.secondary);
        search.setTextColor(palette.text);
        search.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        search.setSingleLine(true);
        search.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        search.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        search.setPadding(dp(12), dp(12), dp(4), dp(12));
        search.setOnEditorActionListener((view, action, event) -> {
            if (action == EditorInfo.IME_ACTION_SEARCH
                    || (event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER)) {
                hideKeyboard();
                return true;
            }
            return false;
        });
        search.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                String typed = s.toString().trim();
                if (typed.equals(query)) return;
                query = typed;
                rebuild();
                list.setSelection(0);
            }
        });
        box.addView(search, new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1));

        ImageView clear = new ImageView(context);
        clear.setImageDrawable(Icons.icon(Icons.CLOSE, palette.secondary, dp(20)));
        clear.setScaleType(ImageView.ScaleType.CENTER);
        clear.setContentDescription("Clear search");
        clear.setBackground(new RippleDrawable(ColorStateList.valueOf(palette.ripple), null, null));
        clear.setOnClickListener(view -> search.setText(""));
        box.addView(clear, new LinearLayout.LayoutParams(dp(40), dp(40)));
        clearSearch = clear;

        FrameLayout outer = new FrameLayout(context);
        outer.setPadding(dp(16), dp(4), dp(16), dp(8));
        outer.addView(box);
        return outer;
    }

    private void hideKeyboard() {
        InputMethodManager keyboard = context.getSystemService(InputMethodManager.class);
        if (keyboard != null) keyboard.hideSoftInputFromWindow(search.getWindowToken(), 0);
        search.clearFocus();
    }

    // ---------------------------------------------------------------------------------------------
    // The list

    /** Builds the rows again from the registry, the stored values and the search. */
    private void rebuild() {
        rows.clear();
        boolean searching = !query.isEmpty();
        String[] words = query.toLowerCase(Locale.ROOT).split("\\s+");
        Map<String, String> values = Settings.values();

        if (!searching) {
            rows.add(new Row(HEADER));
            notices();
        }
        Row pause = pauseRow();
        if (!searching || matches(words, pause.title, pause.summary, "pause off all")) {
            rows.add(pause);
        }

        Map<String, List<Row>> sections = new LinkedHashMap<>();
        String shownParent = null;
        for (Registry.Entry entry : registry.entries) {
            Row row = settingRow(entry, values);
            if (searching && !matches(words, entry.title, entry.summary, entry.section, entry.key,
                    row.value == null ? "" : row.value, String.join(" ", entry.choiceLabels))) {
                continue;
            }
            List<Row> section = sections.get(entry.section);
            if (section == null) sections.put(entry.section, section = new ArrayList<>());
            // A result under a switch comes with that switch, so it can be turned on right there.
            Registry.Entry parent = entry.parent == null ? null : registry.get(entry.parent);
            if (parent != null && !parent.key.equals(shownParent)) section.add(settingRow(parent, values));
            shownParent = parent != null ? parent.key : entry.key;
            section.add(row);
        }
        List<Row> tools = new ArrayList<>();
        for (Row tool : tools()) {
            if (!searching || matches(words, tool.title, tool.summary)) tools.add(tool);
        }
        if (!tools.isEmpty()) {
            List<Row> advanced = sections.get("Advanced");
            if (advanced == null) sections.put("Advanced", advanced = new ArrayList<>());
            advanced.addAll(tools);
        }
        for (Map.Entry<String, List<Row>> section : sections.entrySet()) {
            Row title = new Row(SECTION);
            title.title = section.getKey();
            title.icon = sectionIcon(section.getKey());
            rows.add(title);
            rows.addAll(section.getValue());
        }
        if (searching && sections.isEmpty() && rows.isEmpty()) {
            Row empty = new Row(EMPTY);
            empty.title = "No settings match “" + query + "”.";
            rows.add(empty);
        }

        // Rows next to each other share one card.
        for (int i = 0; i < rows.size(); i++) {
            Row row = rows.get(i);
            if (row.kind != ROW) continue;
            row.first = i == 0 || rows.get(i - 1).kind != ROW;
            row.last = i == rows.size() - 1 || rows.get(i + 1).kind != ROW;
        }
        adapter.notifyDataSetChanged();
        restartBar.setVisibility(Settings.restartNeeded() ? View.VISIBLE : View.GONE);
        clearSearch.setVisibility(searching ? View.VISIBLE : View.GONE);
        updateBackCallback();
    }

    private void notices() {
        if (!registry.readable) {
            Row notice = new Row(NOTICE);
            notice.warning = true;
            notice.title = registry.name + "'s settings could not be read; every patch is off.";
            notice.summary = "Patch " + registry.app + " again. If this stays, report a problem below.";
            rows.add(notice);
        }
        if (Settings.autoPaused()) {
            Row notice = new Row(NOTICE);
            notice.warning = true;
            notice.title = registry.name + " paused itself.";
            notice.summary = registry.app + " stopped " + Settings.CRASHES_TO_PAUSE + " times in a row within a "
                    + "minute of starting, so every switch is off. Turn off Pause " + registry.name + " to try again, "
                    + "and report a problem if it keeps happening.";
            rows.add(notice);
        } else if (Settings.pausedNow() && Settings.pauseRequested()) {
            Row notice = new Row(NOTICE);
            notice.title = registry.name + " is paused.";
            notice.summary = "Every switch is off until you turn Pause " + registry.name + " off. Your settings are "
                    + "kept and come back then.";
            rows.add(notice);
        }
    }

    private Row pauseRow() {
        Row row = new Row(ROW);
        boolean requested = Settings.pauseRequested();
        row.title = "Pause " + registry.name;
        row.icon = Icons.PAUSE;
        row.checked = requested;
        String kept = keptWhenPaused();
        row.summary = "Turns every switch off from the next start of " + registry.app + ", without forgetting "
                + "your settings." + (kept.isEmpty() ? "" : " Stays on: " + kept + ".")
                + (requested != Settings.pausedNow() ? " Applies after a restart." : "");
        row.click = () -> {
            Settings.setPaused(!Settings.pauseRequested());
            rebuild();
        };
        return row;
    }

    /** The titles of the switches Pause Lurk leaves alone. */
    private String keptWhenPaused() {
        List<String> titles = new ArrayList<>();
        for (Registry.Entry entry : registry.entries) {
            if (entry.isSwitch() && entry.keepWhenPaused) titles.add(entry.title);
        }
        return TextUtils.join(", ", titles);
    }

    private Row settingRow(Registry.Entry entry, Map<String, String> values) {
        Row row = new Row(ROW);
        String value = values.get(entry.key);
        row.title = entry.title;
        row.indent = entry.parent != null;
        if (entry.parent != null) {
            // Under a switch a setting only applies while the switch is on; under a choice it is just grouped.
            Registry.Entry parent = registry.get(entry.parent);
            if (parent != null && parent.isSwitch()) {
                row.enabled = Settings.storedBoolean(parent);
                row.needs = parent.title;
            }
        }
        StringBuilder summary = new StringBuilder(entry.summary);
        if (entry.restart) summary.append(summary.length() > 0 ? " " : "").append("Needs a restart.");
        row.summary = summary.toString();
        if (entry.isSwitch()) {
            row.checked = Boolean.parseBoolean(value);
            row.click = () -> {
                Settings.putBoolean(entry.key, !Settings.storedBoolean(entry));
                rebuild();
            };
        } else if (Registry.CHOICE.equals(entry.type)) {
            row.value = entry.choiceLabel(value);
            row.click = () -> showChoice(entry);
        } else {
            row.value = textLabel(value);
            row.click = () -> showText(entry);
        }
        return row;
    }

    private List<Row> tools() {
        List<Row> tools = new ArrayList<>();
        if (registry.readable) {
            tools.add(tool("Export settings", "Save your " + registry.name + " settings to a file.", Icons.EXPORT,
                    this::exportSettings));
            tools.add(tool("Import settings", "Load settings from a file. You see what changes before anything "
                    + "is applied.", Icons.IMPORT, this::importSettings));
        }
        tools.add(tool("Report a problem", "Open a bug report on GitHub with your versions and switches filled "
                + "in.", Icons.BUG, this::reportProblem));
        if (registry.readable) {
            tools.add(tool("Reset to defaults", "Go back to the settings chosen when " + registry.app
                    + " was patched.", Icons.RESET, this::confirmReset));
        }
        return tools;
    }

    private Row tool(String title, String summary, String icon, Runnable click) {
        Row row = new Row(ROW);
        row.title = title;
        row.summary = summary;
        row.icon = icon;
        row.click = click;
        return row;
    }

    private static boolean matches(String[] words, String... fields) {
        String haystack = TextUtils.join(" ", fields).toLowerCase(Locale.ROOT);
        for (String word : words) {
            if (!word.isEmpty() && !haystack.contains(word)) return false;
        }
        return true;
    }

    private static String sectionIcon(String section) {
        switch (section) {
            case "Privacy": return Icons.SHIELD;
            case "Interface": return Icons.DASHBOARD;
            case "Playback": return Icons.VIDEO;
            case "Chat": return Icons.CHAT;
            case "Premium": return Icons.STAR;
            case "Advanced": return Icons.TUNE;
            default: return null;
        }
    }

    private static String textLabel(String value) {
        if (value == null || value.isEmpty()) return "Not set";
        String line = value.replace('\n', ' ');
        return line.length() > 80 ? line.substring(0, 79) + "…" : line;
    }

    private final class RowAdapter extends BaseAdapter {
        @Override
        public int getCount() {
            return rows.size();
        }

        @Override
        public Object getItem(int position) {
            return rows.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public int getViewTypeCount() {
            return 5;
        }

        @Override
        public int getItemViewType(int position) {
            return rows.get(position).kind;
        }

        @Override
        public boolean areAllItemsEnabled() {
            return false;
        }

        @Override
        public boolean isEnabled(int position) {
            // Rows handle their own clicks, so the list draws no selection of its own.
            return false;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            Row row = rows.get(position);
            switch (row.kind) {
                case HEADER: return convertView != null ? convertView : header();
                case NOTICE: return notice(row);
                case SECTION: return section(row);
                case EMPTY: return empty(row);
                default: return bindRow(convertView instanceof RowView ? (RowView) convertView : new RowView(), row);
            }
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Row views

    private View header() {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(20), dp(20), dp(20), dp(18));
        card.setBackground(rounded(palette.surface, dp(22)));

        LinearLayout top = new LinearLayout(context);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        ImageView logo = new ImageView(context);
        logo.setImageDrawable(Icons.logo(dp(56)));
        logo.setContentDescription(registry.name);
        top.addView(logo, new LinearLayout.LayoutParams(dp(56), dp(56)));
        LinearLayout names = new LinearLayout(context);
        names.setOrientation(LinearLayout.VERTICAL);
        names.setPadding(dp(16), 0, 0, 0);
        TextView name = text(registry.name, 24, palette.text, true);
        name.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
        names.addView(name);
        StringBuilder versions = new StringBuilder();
        if (!registry.version.isEmpty()) versions.append('v').append(registry.version).append("  ·  ");
        versions.append(registry.app);
        String appVersion = Settings.appVersion(context);
        if (!appVersion.isEmpty()) versions.append(' ').append(appVersion);
        names.addView(text(versions.toString(), 14, palette.accent, true));
        top.addView(names, new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1));
        card.addView(top);

        TextView about = text("Turn patches off or on without patching again. Changes apply the next time "
                + registry.app + " loads the screen they affect.", 14, palette.secondary, false);
        about.setPadding(0, dp(14), 0, 0);
        card.addView(about);
        return outer(card, dp(4), dp(12));
    }

    private View notice(Row row) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setPadding(dp(16), dp(14), dp(16), dp(14));
        int tint = row.warning ? palette.warning : palette.accent;
        card.setBackground(rounded(row.warning ? palette.warningSurface : palette.surface, dp(18)));
        ImageView icon = new ImageView(context);
        icon.setImageDrawable(Icons.icon(row.warning ? Icons.WARNING : Icons.PAUSE, tint, dp(22)));
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp(22), dp(22));
        iconParams.topMargin = dp(1);
        card.addView(icon, iconParams);
        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setPadding(dp(14), 0, 0, 0);
        texts.addView(text(row.title, 15, row.warning ? palette.warning : palette.text, true));
        if (row.summary != null) {
            TextView summary = text(row.summary, 13.5f, palette.secondary, false);
            summary.setPadding(0, dp(4), 0, 0);
            texts.addView(summary);
        }
        card.addView(texts, new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1));
        return outer(card, 0, dp(12));
    }

    private View section(Row row) {
        LinearLayout line = new LinearLayout(context);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setPadding(dp(32), dp(18), dp(16), dp(8));
        if (row.icon != null) {
            ImageView icon = new ImageView(context);
            icon.setImageDrawable(Icons.icon(row.icon, palette.accent, dp(18)));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(18), dp(18));
            params.rightMargin = dp(10);
            line.addView(icon, params);
        }
        TextView title = text(row.title, 14, palette.accent, true);
        title.setLetterSpacing(0.04f);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) title.setAccessibilityHeading(true);
        line.addView(title);
        return line;
    }

    private View empty(Row row) {
        TextView text = text(row.title, 15, palette.secondary, false);
        text.setGravity(Gravity.CENTER);
        text.setPadding(dp(32), dp(48), dp(32), dp(48));
        return text;
    }

    /** A setting or tool: icon, title, value, summary and a switch, in a card shared with its neighbours. */
    private final class RowView extends FrameLayout {
        final LinearLayout card = new LinearLayout(getContext());
        final ImageView icon = new ImageView(getContext());
        final TextView title = text("", 16, palette.text, true);
        final TextView value = text("", 14, palette.accent, true);
        final TextView summary = text("", 13.5f, palette.secondary, false);
        final LinearLayout texts = new LinearLayout(getContext());
        final Switch toggle = new Switch(getContext());
        Row row;

        RowView() {
            super(context);
            setPadding(dp(16), 0, dp(16), 0);
            card.setOrientation(LinearLayout.HORIZONTAL);
            card.setGravity(Gravity.CENTER_VERTICAL);
            card.setMinimumHeight(dp(64));
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp(24), dp(24));
            iconParams.rightMargin = dp(16);
            card.addView(icon, iconParams);
            texts.setOrientation(LinearLayout.VERTICAL);
            value.setPadding(0, dp(2), 0, 0);
            summary.setPadding(0, dp(2), 0, 0);
            texts.addView(title);
            texts.addView(value);
            texts.addView(summary);
            card.addView(texts, new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1));
            toggle.setClickable(false);
            toggle.setFocusable(false);
            toggle.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            toggle.setThumbTintList(palette.thumb());
            toggle.setTrackTintList(palette.track());
            LinearLayout.LayoutParams toggleParams = new LinearLayout.LayoutParams(
                    LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
            toggleParams.leftMargin = dp(12);
            card.addView(toggle, toggleParams);
            card.setOnClickListener(view -> {
                if (row == null || !row.enabled || row.click == null) return;
                hideKeyboard();
                row.click.run();
            });
            card.setAccessibilityDelegate(new AccessibilityDelegate() {
                @Override
                public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    if (row == null) return;
                    if (row.checked == null) {
                        info.setClassName(Button.class.getName());
                        return;
                    }
                    info.setClassName(Switch.class.getName());
                    info.setCheckable(true);
                    info.setChecked(row.checked);
                }
            });
            addView(card, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        }
    }

    private View bindRow(RowView view, Row row) {
        view.row = row;
        view.card.setPadding(dp(row.indent ? 36 : 16), dp(14), dp(16), dp(14));
        view.card.setBackground(cardBackground(row.first, row.last));
        view.icon.setVisibility(row.icon == null ? View.GONE : View.VISIBLE);
        if (row.icon != null) view.icon.setImageDrawable(Icons.icon(row.icon, palette.accent, dp(24)));
        view.title.setText(row.title);
        view.value.setText(row.value);
        view.value.setVisibility(row.value == null ? View.GONE : View.VISIBLE);
        view.summary.setText(row.summary);
        view.summary.setVisibility(TextUtils.isEmpty(row.summary) ? View.GONE : View.VISIBLE);
        view.toggle.setVisibility(row.checked == null ? View.GONE : View.VISIBLE);
        if (row.checked != null) view.toggle.setChecked(row.checked);
        view.toggle.setEnabled(row.enabled);
        view.card.setEnabled(row.enabled);
        // Dim what's on the card, not the card.
        float alpha = row.enabled ? 1f : 0.45f;
        view.texts.setAlpha(alpha);
        view.icon.setAlpha(alpha);
        view.toggle.setAlpha(alpha);
        // One description for the whole row, which reads (and reports to UI tests) as a switch with its state.
        StringBuilder description = new StringBuilder(row.title);
        if (row.value != null) description.append(", ").append(row.value);
        if (!TextUtils.isEmpty(row.summary)) description.append(". ").append(row.summary);
        if (!row.enabled && row.needs != null) description.append(" Turn on ").append(row.needs).append(" first.");
        view.card.setContentDescription(description);
        return view;
    }

    private View outer(View card, int top, int bottom) {
        FrameLayout outer = new FrameLayout(context);
        outer.setPadding(dp(16), top, dp(16), bottom);
        outer.addView(card);
        return outer;
    }

    /** A card's background: rounded at the top for a group's first row, at the bottom for its last. */
    private Drawable cardBackground(boolean first, boolean last) {
        float radius = dp(20);
        float top = first ? radius : 0, bottom = last ? radius : 0;
        float[] radii = {top, top, top, top, bottom, bottom, bottom, bottom};
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(palette.surface);
        shape.setCornerRadii(radii);
        Drawable content = shape;
        if (!last) {
            LayerDrawable layers = new LayerDrawable(new Drawable[]{shape, new ColorDrawable(palette.divider)});
            layers.setLayerGravity(1, Gravity.BOTTOM | Gravity.FILL_HORIZONTAL);
            layers.setLayerHeight(1, Math.max(1, dp(1) / 2));
            layers.setLayerInsetLeft(1, dp(16));
            layers.setLayerInsetRight(1, dp(16));
            content = layers;
        }
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadii(radii);
        return new RippleDrawable(ColorStateList.valueOf(palette.ripple), content, mask);
    }

    private GradientDrawable rounded(int color, int radius) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(radius);
        return shape;
    }

    private TextView text(String value, float sp, int color, boolean medium) {
        TextView text = new TextView(context);
        text.setText(value);
        text.setTextColor(color);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        if (medium) text.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        text.setLineSpacing(0, 1.08f);
        return text;
    }

    private int dp(float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    // ---------------------------------------------------------------------------------------------
    // Dialogs

    private AlertDialog.Builder dialog() {
        return new AlertDialog.Builder(context, palette.dark ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert);
    }

    /** Shows a dialog on Lurk's surface color, with accent buttons. */
    private AlertDialog show(AlertDialog.Builder builder) {
        AlertDialog dialog = builder.create();
        ListView choices = dialog.getListView();
        if (choices != null) {
            // The radio buttons of a choice dialog, in the accent color.
            choices.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
                @Override
                public void onChildViewAdded(View parent, View child) {
                    tintChecks(child);
                }

                @Override
                public void onChildViewRemoved(View parent, View child) {
                }
            });
        }
        dialog.setOnShowListener(shown -> {
            for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE,
                    AlertDialog.BUTTON_NEUTRAL}) {
                Button button = dialog.getButton(which);
                if (button != null) button.setTextColor(palette.accent);
            }
            if (choices != null) choices.post(() -> tintChecks(choices));
        });
        dialog.show();
        Window window = dialog.getWindow();
        if (window != null) {
            GradientDrawable background = rounded(palette.surface, dp(24));
            window.setBackgroundDrawable(new android.graphics.drawable.InsetDrawable(background, dp(16), dp(24),
                    dp(16), dp(24)));
        }
        return dialog;
    }

    /**
     * A choice row's radio button in the accent color: a CheckedTextView's check mark, or its start drawable
     * (Material dialogs), or a RadioButton in some device themes.
     */
    private void tintChecks(View view) {
        ColorStateList accent = new ColorStateList(new int[][]{{android.R.attr.state_checked}, {}},
                new int[]{palette.accent, palette.secondary});
        if (view instanceof CheckedTextView) {
            ((CheckedTextView) view).setCheckMarkTintList(accent);
            ((CheckedTextView) view).setCompoundDrawableTintList(accent);
        }
        if (view instanceof android.widget.CompoundButton) ((android.widget.CompoundButton) view).setButtonTintList(accent);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) tintChecks(group.getChildAt(i));
        }
    }

    private void showChoice(Registry.Entry entry) {
        String current = Settings.getString(entry.key);
        int checked = -1;
        for (int i = 0; i < entry.choiceValues.length; i++) {
            if (entry.choiceValues[i].equals(current)) checked = i;
        }
        show(dialog()
                .setTitle(entry.title)
                .setSingleChoiceItems(entry.choiceLabels, checked, (dialog, which) -> {
                    Settings.putString(entry.key, entry.choiceValues[which]);
                    dialog.dismiss();
                    rebuild();
                })
                .setNegativeButton(android.R.string.cancel, null));
    }

    /** Free text, edited in a dialog. Saved trimmed; an empty text is a valid value. */
    private void showText(Registry.Entry entry) {
        EditText field = new EditText(context);
        field.setText(Settings.getText(entry.key));
        field.setSelection(field.getText().length());
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        field.setTextColor(palette.text);
        field.setBackgroundTintList(ColorStateList.valueOf(palette.accent));
        field.setMinLines(2);
        FrameLayout box = new FrameLayout(context);
        box.setPadding(dp(20), dp(4), dp(20), 0);
        box.addView(field);
        show(dialog()
                .setTitle(entry.title)
                .setMessage(entry.summary.isEmpty() ? null : entry.summary)
                .setView(box)
                .setPositiveButton("Save", (dialog, which) -> {
                    Settings.putString(entry.key, field.getText().toString().trim());
                    rebuild();
                })
                .setNegativeButton(android.R.string.cancel, null));
    }

    private void confirmReset() {
        show(dialog()
                .setTitle("Reset to defaults?")
                .setMessage("Every " + registry.name + " setting goes back to how it was when " + registry.app
                        + " was patched, and " + registry.name + " is no longer paused.")
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Reset", (dialog, which) -> {
                    Settings.reset();
                    rebuild();
                }));
    }

    // ---------------------------------------------------------------------------------------------
    // Export, import, report

    private void exportSettings() {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .setType("application/json")
                .putExtra(Intent.EXTRA_TITLE, "lurk-" + registry.app.toLowerCase(Locale.ROOT) + "-settings.json");
        launch(intent, REQUEST_EXPORT);
    }

    private void importSettings() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*")
                .putExtra(Intent.EXTRA_MIME_TYPES,
                        new String[]{"application/json", "text/plain", "application/octet-stream"});
        launch(intent, REQUEST_IMPORT);
    }

    private void launch(Intent intent, int request) {
        try {
            if (host.pick(intent, request)) return;
        } catch (ActivityNotFoundException e) {
            toast("No file picker on this device.");
            return;
        }
        // A host that can't get a file picker's result back: the clipboard carries the settings instead.
        ClipboardManager clipboard = context.getSystemService(ClipboardManager.class);
        if (clipboard == null) {
            toast("No clipboard on this device.");
        } else if (request == REQUEST_EXPORT) {
            try {
                clipboard.setPrimaryClip(ClipData.newPlainText(registry.name + " settings",
                        Backup.export(registry, Settings.values(), context.getPackageName())));
                toast("Settings copied. Paste them into a note or file to keep them.");
            } catch (Exception e) {
                Logger.w("settings: export failed: " + e.getClass().getSimpleName());
                toast("Couldn't copy the settings.");
            }
        } else {
            ClipData clip = clipboard.getPrimaryClip();
            CharSequence text = clip == null || clip.getItemCount() == 0 ? null : clip.getItemAt(0).coerceToText(context);
            if (text == null || text.length() == 0) {
                toast("Copy the exported settings first, then tap Import again.");
            } else if (text.length() > MAX_IMPORT_BYTES) {
                toast("Couldn't read that: too large.");
            } else {
                applyImport(text.toString());
            }
        }
    }

    /** A file picker's result, from the host's onActivityResult. */
    void onPicked(int request, int resultCode, Intent data) {
        Uri uri = data == null ? null : data.getData();
        if (resultCode != Activity.RESULT_OK || uri == null) return;
        if (request == REQUEST_EXPORT) writeExport(uri);
        else if (request == REQUEST_IMPORT) readImport(uri);
    }

    private void writeExport(Uri uri) {
        try (OutputStream output = context.getContentResolver().openOutputStream(uri, "wt")) {
            if (output == null) throw new IllegalStateException("no output stream");
            output.write(Backup.export(registry, Settings.values(), context.getPackageName()).getBytes(StandardCharsets.UTF_8));
            toast("Settings saved.");
        } catch (Exception e) {
            Logger.w("settings: export failed: " + e.getClass().getSimpleName());
            toast("Couldn't save the settings.");
        }
    }

    private void readImport(Uri uri) {
        String text;
        try (InputStream input = context.getContentResolver().openInputStream(uri)) {
            if (input == null) throw new IllegalStateException("no input stream");
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int n; (n = input.read(buffer)) != -1; ) {
                if (bytes.size() + n > MAX_IMPORT_BYTES) throw new IllegalStateException("file too large");
                bytes.write(buffer, 0, n);
            }
            text = new String(bytes.toByteArray(), StandardCharsets.UTF_8);
        } catch (Exception e) {
            Logger.w("settings: import failed: " + e.getClass().getSimpleName());
            toast("Couldn't read that file.");
            return;
        }
        applyImport(text);
    }

    private void applyImport(String text) {
        Backup.Plan plan;
        try {
            plan = Backup.plan(text, registry, Settings.values());
        } catch (Exception e) {
            show(dialog().setTitle("Not a " + registry.name + " settings file")
                    .setMessage("Pick a file made with Export settings.")
                    .setPositiveButton(android.R.string.ok, null));
            return;
        }
        StringBuilder message = new StringBuilder();
        if (!plan.app.isEmpty() && !plan.app.equals(registry.app)) {
            message.append("This file is from ").append(plan.app).append(": only the settings ")
                    .append(registry.app).append(" also has are used.\n\n");
        }
        for (String line : plan.lines) message.append("• ").append(line).append('\n');
        if (plan.unchanged > 0) {
            message.append(plan.lines.isEmpty() ? "" : "\n").append(plan.unchanged)
                    .append(plan.unchanged == 1 ? " setting already matches.\n" : " settings already match.\n");
        }
        if (!plan.skipped.isEmpty()) {
            message.append("\nLeft out (not in this build, or a value it can't take): ")
                    .append(TextUtils.join(", ", plan.skipped)).append('\n');
        }
        if (plan.changes.isEmpty()) {
            show(dialog().setTitle("Nothing to change").setMessage(message.toString().trim())
                    .setPositiveButton(android.R.string.ok, null));
            return;
        }
        int count = plan.changes.size();
        show(dialog()
                .setTitle(count == 1 ? "Import 1 change?" : "Import " + count + " changes?")
                .setMessage(message.toString().trim())
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Import", (dialog, which) -> {
                    Settings.putAll(plan.changes);
                    rebuild();
                    toast(count == 1 ? "1 setting changed." : count + " settings changed.");
                }));
    }

    private void reportProblem() {
        String appVersion = Settings.appVersion(context);
        // A report from the dialog says so: that install's manifest isn't the patched one (a mount install),
        // which explains manifest patches that seem to do nothing.
        String device = "Android " + Build.VERSION.RELEASE + " (API " + Build.VERSION.SDK_INT + "), "
                + Build.MANUFACTURER + " " + Build.MODEL
                + (host instanceof SettingsDialog ? ", mount install (the app's manifest isn't the patched one)" : "");
        String url = Report.url(registry, Settings.values(), Settings.pauseRequested(), appVersion, device);
        show(dialog()
                .setTitle("Report a problem")
                .setMessage("Opens GitHub's bug report form with these filled in: " + registry.app + " "
                        + appVersion + ", " + registry.name + " " + registry.version + ", " + device
                        + ", and which switches are on. Nothing is sent until you submit the form, which needs a "
                        + "GitHub account. Say what happened and add the steps.")
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Open GitHub", (dialog, which) -> {
                    try {
                        context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
                    } catch (ActivityNotFoundException e) {
                        toast("No browser on this device.");
                    }
                }));
    }

    private void toast(String text) {
        Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
    }
}
