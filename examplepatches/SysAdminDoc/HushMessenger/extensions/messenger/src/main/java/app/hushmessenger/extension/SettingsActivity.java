package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.EditText;
import android.text.Editable;
import android.text.TextWatcher;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/** A launcher entry keeps settings discoverable without replacing a Messenger menu action. */
public final class SettingsActivity extends Activity {
    private SettingsUi ui;
    private SettingsText text;
    private LinearLayout controlsPage, appPage;
    private LinearLayout header, brand, controlsContent, appContent;
    private ScrollView controlsScroll, appScroll;
    private TextView reminder;
    private EditText search;
    private boolean compact, scrollHeader, binding, lightTheme, recreatingTheme;
    private int restoreControlsScroll = -1, restoreAppScroll = -1;
    private final List<Switch> switches = new ArrayList<>();
    private final SharedPreferences.OnSharedPreferenceChangeListener preferenceListener = (preferences, key) -> refreshChoices();
    private String category = "all", page = "controls";
    private final List<View> controlRows = new ArrayList<>();
    private final List<String[]> installedControls = new ArrayList<>();
    private final List<LinearLayout> groups = new ArrayList<>();
    private final List<Button> categories = new ArrayList<>();
    private final List<Button> tabs = new ArrayList<>();
    private final List<View> tabLines = new ArrayList<>();
    private TextView searchStatus, enabledCount, setupNote;
    private LinearLayout emptyState;
    private Button clearSearch;
    static final String[][] CONTROLS = {
        {"ads", "Hide inbox ads", "Supported inbox ad cards. Live removal isn't verified yet.", "inbox"},
        {"people", "Hide People You May Know", "Removes suggested people from the inbox.", "inbox"},
        {"friend_requests", "Hide friend request cards", "Hides cards without accepting or rejecting requests.", "inbox"},
        {"growth", "Hide growth prompts", "Removes add-more-people prompts.", "inbox"},
        {"inbox_promotions", "Hide inbox promotions", "Hides Messenger's quick-promotion banners in the chat list.", "inbox"},
        {"stories", "Hide stories and notes", "Removes the horizontal tray above your chats.", "inbox"},
        {"subtabs", "Hide inbox tabs", "Hides the Home and Channels tabs inside the inbox.", "inbox"},
        {"facebook", "Hide Facebook shortcuts", "Hides Facebook buttons, profile shortcuts and sharing shortcuts.", "navigation"},
        {"meta_ai", "Hide Meta AI buttons", "Hides the floating button, toolbar button and AI menu entries. Search and existing AI chats stay available.", "navigation"},
        {"moments", "Hide Chat Moments", "Hides Chat Moments from the menu.", "navigation"},
        {"reels_badge", "Hide Reels badge", "Hides the Reels notification badge.", "navigation"},
        {"ai_stickers", "Hide AI sticker tools", "Hides the generated-sticker tab and AI sticker suggestions.", "stickers"},
        {"avatar_stickers", "Hide avatar stickers", "Hides the avatar tab in the sticker keyboard.", "stickers"},
        {"chat_promotions", "Hide chat promotions", "Hides Messenger's quick-promotion banners inside conversations.", "conversations"},
        {"suggested_replies", "Hide business reply suggestions", "Hides suggested replies in business conversations.", "conversations"},
        {"business_suggestions", "Hide business typing suggestions", "Hides business suggestions as you type.", "conversations"},
        {"event_prompts", "Hide event prompts", "Hides event quick-promotion prompts inside chats.", "conversations"},
        {"typing", "Hide typing indicator", "Stops your outgoing active-typing signal. Messages and read receipts are separate.", "conversations"},
        {"external_browser", "Open web links externally", "Uses your default browser for HTTP and HTTPS links. Other link types keep their original behavior.", "links_bubbles"},
        {"bubbles", "Allow chat bubbles", "Removes the low-memory restriction on Android 11 or newer. Enable bubbles in Android notification settings too.", "links_bubbles"},
    };

    @Override @SuppressWarnings("deprecation") public void onCreate(Bundle state) {
        Settings.initialize(this);
        boolean light = Settings.preferences.getBoolean("light", false);
        lightTheme = light;
        setTheme(light ? android.R.style.Theme_Material_Light_NoActionBar : android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        text = new SettingsText(this);
        ui = new SettingsUi(this, light);
        setTitle(text.get(Settings.preview ? "preview_title" : "settings"));
        getWindow().setNavigationBarColor(ui.background);
        getWindow().setStatusBarColor(ui.background);
        getWindow().getDecorView().setSystemUiVisibility(light ? View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR : 0);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        if (state != null) {
            page = "app".equalsIgnoreCase(state.getString("page", "controls")) ? "app" : "controls";
            category = state.getString("category", "all").toLowerCase(Locale.ROOT);
            if (!java.util.Arrays.asList("all", "inbox", "chats", "more").contains(category)) category = "all";
            restoreControlsScroll = state.getInt("controls_scroll");
            restoreAppScroll = state.getInt("app_scroll");
        }
        LinearLayout root = new LinearLayout(this) {
            private int availableHeight = -1;
            private boolean revealSearch;

            @Override protected void onMeasure(int width, int height) {
                int nextHeight = View.MeasureSpec.getSize(height) - getPaddingTop() - getPaddingBottom();
                if (nextHeight != availableHeight) {
                    availableHeight = nextHeight;
                    revealSearch = search != null && search.hasFocus();
                }
                adaptToHeight(nextHeight);
                super.onMeasure(width, height);
            }

            @Override protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
                super.onLayout(changed, left, top, right, bottom);
                if (!revealSearch) return;
                revealSearch = false;
                if (search.hasFocus() && search.isShown())
                    search.requestRectangleOnScreen(new Rect(0, 0, search.getWidth(), search.getHeight()), false);
            }
        };
        root.setOrientation(LinearLayout.VERTICAL);
        root.setLayoutDirection(text.layoutDirection());
        root.setBackgroundColor(ui.background);
        root.setFocusableInTouchMode(true);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets.consumeSystemWindowInsets();
        });
        setContentView(root);
        buildHeader(root);
        controlsPage = ui.column();
        controlsPage.setTag("controls_page");
        controlsPage.setAccessibilityPaneTitle(text.get("controls"));
        root.addView(controlsPage, new LinearLayout.LayoutParams(-1, 0, 1));
        controlsScroll = scrollPage(controlsPage);
        controlsContent = pageContent(controlsScroll);
        buildControls(controlsContent);
        reminder = ui.text(text.get("reopen"), 12, ui.muted, false);
        reminder.setPadding(ui.dp(24), ui.dp(12), ui.dp(24), ui.dp(16));
        ui.add(controlsPage, reminder, 0);
        appPage = ui.column();
        appPage.setTag("app_page");
        appPage.setAccessibilityPaneTitle(text.get("app"));
        root.addView(appPage, new LinearLayout.LayoutParams(-1, 0, 1));
        appScroll = scrollPage(appPage);
        appContent = pageContent(appScroll);
        buildApp(appContent);
        search.setText(state == null ? "" : state.getString("query", ""));
        if (state != null) {
            int length = search.length();
            search.setSelection(Math.max(0, Math.min(length, state.getInt("selection_start", length))),
                Math.max(0, Math.min(length, state.getInt("selection_end", length))));
        }
        filterControls(search.getText().toString());
        showPage(page);
        updateSetup();
        if (state != null) {
            String focused = state.getString("focused_control");
            if (focused != null) root.post(() -> {
                View target = root.findViewWithTag(focused);
                if (target != null && target.isShown()) target.requestFocus();
            });
        }
    }

    @Override protected void onStart() {
        super.onStart();
        Settings.preferences.registerOnSharedPreferenceChangeListener(preferenceListener);
    }

    @Override protected void onResume() {
        super.onResume();
        refreshChoices();
    }

    @Override protected void onStop() {
        Settings.preferences.unregisterOnSharedPreferenceChangeListener(preferenceListener);
        super.onStop();
    }

    private void refreshChoices() {
        if (lightTheme != Settings.preferences.getBoolean("light", false)) {
            if (!recreatingTheme) {
                recreatingTheme = true;
                recreate();
            }
            return;
        }
        binding = true;
        try {
            for (Switch control : switches) control.setChecked(Settings.preferences.getBoolean((String) control.getTag(), false));
        } finally { binding = false; }
        updateSetup();
    }

    private void adaptToHeight(int height) {
        if (header == null || reminder == null || appContent == null || height <= 0) return;
        boolean next = height < ui.dp(480);
        // Let focused content use the full viewport when the keyboard leaves little room.
        boolean nextScrollHeader = height < ui.dp(160);
        if (compact == next && scrollHeader == nextScrollHeader) return;
        compact = next;
        scrollHeader = nextScrollHeader;
        header.setPadding(ui.dp(scrollHeader ? 4 : 24), ui.dp(compact ? 8 : 50), ui.dp(scrollHeader ? 4 : 24), 0);
        placeBrand();
        placeHeader();
        ((ViewGroup) reminder.getParent()).removeView(reminder);
        reminder.setPadding(ui.dp(compact ? 4 : 24), ui.dp(12), ui.dp(compact ? 4 : 24), ui.dp(16));
        ui.add(compact ? controlsContent : controlsPage, reminder, 0);
    }

    private void placeBrand() {
        if (brand == null || appContent == null) return;
        LinearLayout parent = compact ? ("app".equals(page) ? appContent : controlsContent) : header;
        if (brand.getParent() == parent) return;
        ((ViewGroup) brand.getParent()).removeView(brand);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.bottomMargin = ui.dp(compact ? 24 : 0);
        parent.addView(brand, 0, params);
    }

    private void placeHeader() {
        LinearLayout parent = scrollHeader ? ("app".equals(page) ? appContent : controlsContent) : (LinearLayout) controlsPage.getParent();
        if (header.getParent() == parent) return;
        ((ViewGroup) header.getParent()).removeView(header);
        parent.addView(header, 0, new LinearLayout.LayoutParams(-1, -2));
    }

    private void buildHeader(LinearLayout root) {
        header = ui.column();
        header.setPadding(ui.dp(24), ui.dp(50), ui.dp(24), 0);
        ui.add(root, header, 0);
        brand = ui.row();
        if (ui.largeText) brand.setOrientation(LinearLayout.VERTICAL);
        LinearLayout wordmark = ui.column();
        TextView title = ui.text("HushMessenger", 28, ui.text, true);
        title.setAccessibilityHeading(true);
        ui.add(wordmark, title, 0);
        TextView subtitle = ui.text(text.get(Settings.preview ? "preview_notice" : "tagline"), 14,
            Settings.preview ? ui.warning : ui.muted, false);
        if (Settings.preview) subtitle.setTag("preview_notice");
        ui.add(wordmark, subtitle, 5);
        brand.addView(wordmark, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        Button open = ui.button(text.get("open"));
        open.setTag("open_messenger");
        open.setContentDescription(text.get("open_messenger"));
        open.setBackground(new android.graphics.drawable.InsetDrawable(ui.interactive(ui.background, ui.accent, 8), 0, ui.dp(8), 0, ui.dp(8)));
        open.setPadding(ui.dp(12), ui.dp(8), ui.dp(12), ui.dp(8));
        open.setOnClickListener(view -> openMessenger());
        LinearLayout.LayoutParams openParams = new LinearLayout.LayoutParams(ui.largeText ? -2 : ui.dp(68), -2);
        openParams.setMarginStart(ui.dp(ui.largeText ? 0 : 12));
        openParams.topMargin = ui.dp(ui.largeText ? 12 : 0);
        brand.addView(open, openParams);
        ui.add(header, brand, 0);
        LinearLayout navigation = ui.row();
        for (String name : new String[] {"controls", "app"}) {
            LinearLayout tab = ui.column();
            Button button = ui.button(text.get(name));
            button.setTag("tab_" + name);
            button.setTextSize(16);
            button.setOnClickListener(view -> showPage(name));
            ui.add(tab, button, 0);
            tabs.add(button);
            View underline = new View(this);
            tab.addView(underline, new LinearLayout.LayoutParams(-1, ui.dp(2)));
            tabLines.add(underline);
            navigation.addView(tab, new LinearLayout.LayoutParams(0, -2, 1));
        }
        ui.add(header, navigation, 0);
    }

    private ScrollView scrollPage(LinearLayout parent) {
        ScrollView view = new ScrollView(this);
        view.setFillViewport(true);
        view.addOnLayoutChangeListener((changed, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
            if (!view.isShown() || view.getHeight() == 0) return;
            if (view == controlsScroll && restoreControlsScroll >= 0) {
                view.scrollTo(0, restoreControlsScroll);
                restoreControlsScroll = -1;
            } else if (view == appScroll && restoreAppScroll >= 0) {
                view.scrollTo(0, restoreAppScroll);
                restoreAppScroll = -1;
            }
        });
        parent.addView(view, new LinearLayout.LayoutParams(-1, 0, 1));
        return view;
    }

    private LinearLayout pageContent(ScrollView scroll) {
        LinearLayout content = ui.column();
        content.setPadding(ui.dp(20), ui.dp(20), ui.dp(20), ui.dp(24));
        scroll.addView(content);
        return content;
    }

    private void buildControls(LinearLayout content) {
        LinearLayout setup = ui.panel();
        setup.setPadding(ui.dp(16), ui.dp(14), ui.dp(16), ui.dp(8));
        ui.add(setup, ui.heading(text.get("setup")), 0);
        enabledCount = ui.text("", 22, ui.text, true);
        enabledCount.setTag("enabled_count");
        enabledCount.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        ui.add(setup, enabledCount, 8);
        setupNote = ui.text("", 13, ui.muted, false);
        ui.add(setup, setupNote, 6);
        ui.rule(setup, 12);
        ui.add(setup, controlRow("paused", text.base("paused"), "", false), 0);
        ui.add(content, setup, 0);
        search = new EditText(this);
        search.setTag("find_control");
        search.setHint(text.get("search"));
        search.setContentDescription(text.get("search"));
        search.setTextSize(16);
        search.setSingleLine(true);
        search.setTextColor(ui.text);
        search.setHintTextColor(ui.muted);
        search.setMinHeight(ui.dp(48));
        search.setPadding(ui.dp(14), ui.dp(10), ui.dp(14), ui.dp(10));
        search.setBackground(ui.interactive(ui.surface, ui.outline, 8));
        ui.add(content, search, 16);
        LinearLayout filters = ui.row();
        for (String name : new String[] {"all", "inbox", "chats", "more"}) {
            Button button = ui.button(text.get(name));
            button.setTag("category_" + name);
            button.setPadding(ui.dp(4), ui.dp(8), ui.dp(4), ui.dp(8));
            button.setOnClickListener(view -> {
                category = name;
                filterControls(search.getText().toString());
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, -2, 1);
            if (!categories.isEmpty()) params.setMarginStart(ui.dp(8));
            filters.addView(button, params);
            categories.add(button);
        }
        ui.add(content, filters, 6);
        searchStatus = ui.text("", 13, ui.muted, false);
        searchStatus.setTag("search_status");
        searchStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        ui.add(content, searchStatus, 8);
        LinearLayout group = null;
        String last = "";
        for (String[] spec : CONTROLS) {
            if (!Settings.installed.contains(spec[0])) continue;
            if (!last.equals(spec[3])) {
                last = spec[3];
                group = ui.column();
                group.setTag(last);
                LinearLayout heading = ui.row();
                heading.addView(ui.heading(text.get(last).toUpperCase(Locale.ROOT)), new LinearLayout.LayoutParams(0, -2, 1));
                heading.addView(ui.text("", 13, ui.muted, true));
                ui.add(group, heading, 0);
                ui.rule(group, 10);
                ui.add(content, group, 24);
                groups.add(group);
            }
            LinearLayout row = controlRow(spec[0], spec[1], spec[2], true);
            row.setTag(spec[3]);
            ui.add(group, row, 0);
            controlRows.add(row);
            installedControls.add(spec);
        }
        emptyState = ui.panel();
        emptyState.setTag("empty_state");
        ui.add(emptyState, ui.text(text.get("empty_title"), 18, ui.text, true), 0);
        ui.add(emptyState, ui.text(text.get("empty_help"), 14, ui.muted, false), 10);
        clearSearch = ui.button(text.get("clear"));
        clearSearch.setTag("clear_filters");
        clearSearch.setOnClickListener(view -> {
            category = "all";
            search.setText("");
            filterControls("");
        });
        ui.add(emptyState, clearSearch, 16);
        ui.add(content, emptyState, 20);
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { filterControls(s.toString()); }
            @Override public void afterTextChanged(Editable value) { }
        });
    }

    @SuppressWarnings("deprecation")
    private LinearLayout controlRow(String key, String title, String description, boolean divided) {
        boolean available = Settings.available(key);
        if (!available) description += " " + text.base("unavailable");
        LinearLayout row = ui.row();
        LinearLayout labels = ui.column();
        labels.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        LinearLayout titleLine = ui.row();
        if (ui.largeText) titleLine.setOrientation(LinearLayout.VERTICAL);
        titleLine.addView(ui.text(text.display(title), 16, ui.text, false), new LinearLayout.LayoutParams(-2, -2));
        if ("ads".equals(key)) {
            TextView badge = ui.text(text.get("experimental"), 11, ui.warning, false);
            badge.setBackground(ui.shape(ui.warningSurface, 0, 4));
            badge.setPadding(ui.dp(6), ui.dp(3), ui.dp(6), ui.dp(3));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
            params.setMarginStart(ui.dp(ui.largeText ? 0 : 8));
            titleLine.addView(badge, params);
        }
        ui.add(labels, titleLine, 0);
        if (!description.isEmpty()) ui.add(labels, ui.text(text.display(description), 14, ui.muted, false), 6);
        row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1));
        Switch control = ui.toggle(key, text.display(title), text.display(("ads".equals(key) ? text.base("experimental") + ". " : "") + description), Settings.preferences.getBoolean(key, false));
        LinearLayout.LayoutParams switchParams = new LinearLayout.LayoutParams(ui.dp(48), -2);
        switchParams.setMarginStart(ui.dp(12));
        row.addView(control, switchParams);
        switches.add(control);
        control.setEnabled(available);
        control.setOnCheckedChangeListener((button, checked) -> {
            if (binding) return;
            Settings.preferences.edit().putBoolean(key, checked).apply();
            updateSetup();
            Toast.makeText(this, text.get(checked ? "choice_on" : "choice_off", title), Toast.LENGTH_SHORT).show();
            if ("light".equals(key)) refreshChoices();
        });
        row.setOnClickListener(view -> { if (control.isEnabled()) control.toggle(); });
        row.setEnabled(available);
        row.setFocusable(false);
        row.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.setBackground(ui.interactive(ui.background, 0, 0));
        if (divided) {
            row.setBackground(new android.graphics.drawable.LayerDrawable(new android.graphics.drawable.Drawable[] {
                ui.shape(ui.line, 0, 0), new android.graphics.drawable.InsetDrawable(ui.interactive(ui.background, 0, 0), 0, 0, 0, ui.dp(1))
            }));
        } else row.setBackground(ui.interactive(ui.surface, 0, 0));
        row.setPadding(0, ui.dp(divided ? 16 : 0), 0, ui.dp(divided ? 16 : 0));
        return row;
    }

    private void buildApp(LinearLayout content) {
        ui.add(content, ui.heading(text.get("quick_access")), 4);
        LinearLayout access = ui.panel();
        ui.add(access, ui.text(text.get("access_help"), 14, ui.muted, false), 0);
        Button restart = ui.button(text.get("restart"));
        restart.setTag("restart_messenger");
        restart.setOnClickListener(view -> startActivity(new Intent(this, RestartActivity.class)));
        ui.add(access, restart, 14);
        ui.add(content, access, 12);
        ui.add(content, ui.heading(text.get("appearance")), 22);
        LinearLayout appearance = ui.panel();
        ui.add(appearance, controlRow("light", text.base("light"), text.base("light_help"), false), 0);
        ui.rule(appearance, 14);
        ui.add(appearance, ui.text(text.get("theme_help"), 13, ui.muted, false), 14);
        ui.add(content, appearance, 12);
        ui.add(content, ui.heading(text.get("about")), 22);
        LinearLayout about = ui.panel();
        infoRow(about, text.get("version"), BuildConfig.VERSION_NAME);
        ui.rule(about, 12);
        infoRow(about, text.get("installed"), text.number(installedControls.size()));
        ui.rule(about, 12);
        Button copy = ui.button(text.get("copy"));
        copy.setTag("copy_setup");
        copy.setOnClickListener(view -> copySetup());
        ui.add(about, copy, 8);
        ui.add(about, ui.text(text.get("copy_help"), 13, ui.muted, false), 8);
        ui.add(content, about, 12);
        ui.add(content, ui.heading(text.get("usage")), 22);
        ui.add(content, ui.text(text.get("save_help"), 14, ui.muted, false), 16);
        ui.add(content, ui.text(text.get("pause_help"), 14, ui.muted, false), 14);
        ui.add(content, ui.text(text.get("account_help"), 14, ui.muted, false), 14);
        LinearLayout help = ui.panel();
        help.setBackground(ui.shape(ui.infoSurface, ui.infoBorder, 8));
        ui.add(help, ui.text(text.get("missing"), 16, ui.accent, true), 0);
        ui.add(help, ui.text(text.get("missing_help"), 14, ui.muted, false), 8);
        ui.add(content, help, 18);
        Button source = ui.button(text.get("source"));
        source.setTag("source_licenses");
        source.setOnClickListener(view -> {
            try { startActivity(new Intent(Intent.ACTION_VIEW, android.net.Uri.parse("https://github.com/SysAdminDoc/HushMessenger#research-and-credits"))); }
            catch (android.content.ActivityNotFoundException error) { Toast.makeText(this, text.get("no_browser"), Toast.LENGTH_LONG).show(); }
        });
        ui.add(content, source, 16);
        ui.add(content, ui.text(text.get("credits"), 12, ui.muted, false), 16);
        ui.add(content, ui.text(text.get("independent"), 12, ui.muted, false), 20);
    }

    private void copySetup() {
        try {
            PackageInfo host = getPackageManager().getPackageInfo(getPackageName(), 0);
            boolean paused = Settings.preferences.getBoolean("paused", false);
            StringBuilder summary = new StringBuilder("HushMessenger v").append(BuildConfig.VERSION_NAME)
                .append("\nHost package: ").append(getPackageName())
                .append("\nHost version: ").append(host.versionName == null ? "unknown" : host.versionName)
                .append("\nHost version code: ").append(host.getLongVersionCode())
                .append("\nAndroid API: ").append(Build.VERSION.SDK_INT)
                .append("\nPaused: ").append(paused).append("\nControls:\n");
            if (Settings.preview) summary.append("Mode: UI preview. Does not change Messenger.\n");
            for (String[] spec : CONTROLS) {
                String key = spec[0];
                boolean installed = Settings.installed.contains(key);
                boolean selected = Settings.preferences.getBoolean(key, false);
                summary.append(key).append(": installed=").append(installed)
                    .append(", selected=").append(selected)
                    .append(", active=").append(!Settings.preview && installed && selected && !paused && Settings.available(key)).append('\n');
            }
            ClipData clip = ClipData.newPlainText(text.get("clipboard"), summary.toString());
            PersistableBundle extras = new PersistableBundle();
            extras.putBoolean(Build.VERSION.SDK_INT >= 33 ? ClipDescription.EXTRA_IS_SENSITIVE : "android.content.extra.IS_SENSITIVE", true);
            clip.getDescription().setExtras(extras);
            ClipboardManager clipboard = getSystemService(ClipboardManager.class);
            if (clipboard == null) throw new IllegalStateException("Clipboard service unavailable");
            clipboard.setPrimaryClip(clip);
            if (Build.VERSION.SDK_INT < 33) Toast.makeText(this, text.get("copied"), Toast.LENGTH_SHORT).show();
        } catch (PackageManager.NameNotFoundException | SecurityException | IllegalStateException error) {
            android.util.Log.e("HushMessenger", "Can't copy setup", error);
            Toast.makeText(this, text.get("copy_failed"), Toast.LENGTH_LONG).show();
        }
    }

    private void infoRow(LinearLayout parent, String title, String value) {
        LinearLayout row = ui.row();
        row.setPadding(0, ui.dp(3), 0, ui.dp(4));
        row.addView(ui.text(title, 16, ui.text, false), new LinearLayout.LayoutParams(0, -2, 1));
        row.addView(ui.text(value, 16, ui.accent, true));
        ui.add(parent, row, 4);
    }

    private void showPage(String name) {
        if ("app".equals(name) && search.hasFocus()) {
            search.clearFocus();
            ((InputMethodManager) getSystemService(INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(search.getWindowToken(), 0);
            tabs.get(1).requestFocus();
        }
        page = name;
        controlsPage.setVisibility("controls".equals(page) ? View.VISIBLE : View.GONE);
        appPage.setVisibility("app".equals(page) ? View.VISIBLE : View.GONE);
        placeBrand();
        placeHeader();
        for (int i = 0; i < tabs.size(); i++) {
            Button tab = tabs.get(i);
            boolean selected = tab.getTag().equals("tab_" + page);
            tab.setSelected(selected);
            tab.setTextColor(selected ? ui.accent : ui.muted);
            tab.setBackground(ui.interactive(ui.background, 0, 4));
            tabLines.get(i).setBackgroundColor(selected ? ui.accent : ui.line);
        }
    }

    private void updateSetup() {
        if (enabledCount == null) return;
        int enabled = 0, saved = 0;
        for (String[] spec : installedControls) if (Settings.preferences.getBoolean(spec[0], false)) {
            saved++;
            if (Settings.available(spec[0])) enabled++;
        }
        boolean paused = Settings.preferences.getBoolean("paused", false);
        enabledCount.setText(paused ? text.get("changes_paused") : text.count("enabled", enabled));
        setupNote.setText(paused ? text.count("saved", saved) : text.get("saved"));
    }

    private void filterControls(String query) {
        String needle = query.trim().toLowerCase(Locale.ROOT);
        int visible = 0;
        for (int i = 0; i < controlRows.size(); i++) {
            String[] spec = installedControls.get(i);
            String bucket = "inbox".equals(spec[3]) ? "inbox" :
                ("conversations".equals(spec[3]) || "stickers".equals(spec[3])) ? "chats" : "more";
            boolean match = ("all".equals(category) || category.equals(bucket)) &&
                (spec[1] + " " + spec[2] + " " + text.base(spec[3]) + " " +
                    text.display(spec[1]) + " " + text.display(spec[2]) + " " + text.get(spec[3])).toLowerCase(Locale.ROOT).contains(needle);
            controlRows.get(i).setVisibility(match ? View.VISIBLE : View.GONE);
            if (match) visible++;
        }
        for (LinearLayout group : groups) {
            int count = 0;
            for (View row : controlRows) if (row.getTag().equals(group.getTag()) && row.getVisibility() == View.VISIBLE) count++;
            group.setVisibility(count == 0 ? View.GONE : View.VISIBLE);
            ((TextView) ((LinearLayout) group.getChildAt(0)).getChildAt(1)).setText(text.number(count));
        }
        for (Button button : categories) {
            boolean selected = button.getTag().equals("category_" + category);
            button.setSelected(selected);
            button.setTextColor(selected ? ui.selectedText : ui.muted);
            button.setBackground(new android.graphics.drawable.InsetDrawable(
                ui.interactive(selected ? ui.selected : ui.background, selected ? 0 : ui.outline, 8), 0, ui.dp(6), 0, ui.dp(6)));
            button.setPadding(ui.dp(4), ui.dp(8), ui.dp(4), ui.dp(8));
        }
        searchStatus.setText(controlRows.isEmpty() ? text.get("none_installed") :
            visible == 0 ? text.get("no_matches") : text.get(controlRows.size() == 1 ? "results_one" : "results_many", visible, controlRows.size()));
        emptyState.setVisibility(visible == 0 ? View.VISIBLE : View.GONE);
        clearSearch.setVisibility(controlRows.isEmpty() ? View.GONE : View.VISIBLE);
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putString("page", page);
        state.putString("category", category);
        state.putString("query", search.getText().toString());
        state.putInt("selection_start", search.getSelectionStart());
        state.putInt("selection_end", search.getSelectionEnd());
        View focused = getCurrentFocus();
        if (focused != null && focused.getTag() instanceof String) state.putString("focused_control", (String) focused.getTag());
        state.putInt("controls_scroll", restoreControlsScroll >= 0 ? restoreControlsScroll : controlsScroll.getScrollY());
        state.putInt("app_scroll", restoreAppScroll >= 0 ? restoreAppScroll : appScroll.getScrollY());
        super.onSaveInstanceState(state);
    }

    private void openMessenger() {
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(getPackageName());
        for (android.content.pm.ResolveInfo match : getPackageManager().queryIntentActivities(query, 0)) {
            if (match.activityInfo.name.equals(getClass().getName())) continue;
            try {
                startActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED)
                    .setComponent(new ComponentName(getPackageName(), match.activityInfo.name)));
                return;
            } catch (android.content.ActivityNotFoundException error) {
                android.util.Log.e("HushMessenger", "Messenger launcher is unavailable", error);
            }
        }
        Toast.makeText(this, text.get("open_help"), Toast.LENGTH_LONG).show();
    }
}
