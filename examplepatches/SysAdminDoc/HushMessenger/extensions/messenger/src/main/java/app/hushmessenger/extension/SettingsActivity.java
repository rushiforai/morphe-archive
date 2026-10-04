package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.DisplayCutout;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.text.Editable;
import android.text.InputFilter;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.text.TextWatcher;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
    private final List<RadioButton> bubbleModes = new ArrayList<>();
    private final Map<String, TextView> activityLabels = new java.util.HashMap<>();
    private final Map<Switch, CharSequence> switchDescriptions = new java.util.HashMap<>();
    private long documentGeneration;
    private final SharedPreferences.OnSharedPreferenceChangeListener preferenceListener = (preferences, key) -> {
        if (key == null || "paused".equals(key) || Settings.BUBBLE_CHAT_HEADS.equals(key) || Settings.installed.contains(key))
            documentGeneration++;
        refreshChoices();
        if (key == null || "check_updates".equals(key)) syncUpdateChoice(true);
    };
    private String category = "all", page = "controls";
    private final List<View> controlRows = new ArrayList<>();
    private final List<String[]> installedControls = new ArrayList<>();
    private final List<LinearLayout> groups = new ArrayList<>();
    private final List<Button> categories = new ArrayList<>();
    private final List<Button> tabs = new ArrayList<>();
    private final List<View> tabLines = new ArrayList<>();
    private TextView searchStatus, enabledCount, setupNote;
    private Button safeModeAction;
    private Button drawerSearchLink;
    private TextView updateStatus;
    private Button updateCheckNow, updateRelease;
    private volatile long updateGeneration;
    private java.net.HttpURLConnection updateConnection;
    private LinearLayout emptyState;
    static final int SAVE_CHOICES = 7101, READ_CHOICES = 7102;
    private String documentExport;
    private boolean documentImport;
    private boolean documentBusy;
    private Button saveChoicesFile, readChoicesFile;
    private Button cancelChoicesFile;
    private TextView documentStatus;
    private DocumentJob documentJob;
    static int documentTimeoutMillis = 30_000;
    private static final java.util.concurrent.Semaphore documentSlots = new java.util.concurrent.Semaphore(2);
    // Process-wide so a page recreated by the theme switch can still replace the last toast.
    private static Toast toast;
    static final String[][] CONTROLS = {
        {"ads", "Hide inbox ads", "Removes inbox ad cards if Meta brings back the inbox ads it stopped selling in November 2025.", "inbox"},
        {"people", "Hide People You May Know", "Removes suggested people from chats, search and stories, and from the People and Notifications tabs.", "inbox"},
        {"friend_requests", "Hide friend request cards", "Hides cards without accepting or rejecting requests.", "inbox"},
        {"community_inbox", "Hide joined community chats", "Hides joined community chats from the main inbox. Search and community folders keep them. Delivery and unread counts stay unchanged. Changes apply when the inbox next renders.", "inbox"},
        {"growth", "Hide growth prompts", "Removes add-more-people prompts, the tip sheets in notes like Make my notes public, and the Share your own story card after someone else's stories.", "inbox"},
        {"inbox_promotions", "Hide inbox promotions", "Hides Messenger's quick-promotion banners in the chat list.", "inbox"},
        {"stories", "Hide stories and notes", "Removes the horizontal tray above your chats.", "inbox"},
        {"subtabs", "Hide inbox tabs", "Hides the Home and Channels tabs inside the inbox.", "inbox"},
        {"facebook", "Hide Facebook shortcuts", "Hides Facebook buttons, profile and sharing shortcuts, and Also from Meta in the Menu tab.", "navigation"},
        {"meta_ai", "Hide Meta AI", "Hides the floating button, toolbar button, Meta AI tab, menu entries and search AI.", "navigation"},
        {"moments", "Hide Chat Moments", "Hides Chat Moments from the menu.", "navigation"},
        {"reels_badge", "Hide Reels badge", "Hides the Reels notification badge.", "navigation"},
        {"chat_animation", "Slide chats in and out", "Slides a chat in from the side when you open it and back out when you go back, while the screen underneath holds still. Chat heads and bubbles keep their own animations.", "navigation"},
        {"ai_stickers", "Hide AI sticker tools", "Hides the Generate AI sticker buttons, generated-sticker tab and AI sticker suggestions.", "stickers"},
        {"avatar_stickers", "Hide avatar stickers", "Hides the avatar tab in the sticker keyboard.", "stickers"},
        {"chat_promotions", "Hide chat promotions", "Hides Messenger's quick-promotion banners inside conversations.", "conversations"},
        {"suggested_replies", "Hide business reply suggestions", "Hides suggested replies in business conversations.", "conversations"},
        {"business_suggestions", "Hide business typing suggestions", "Hides business suggestions as you type.", "conversations"},
        {"event_prompts", "Hide event prompts", "Hides event quick-promotion prompts inside chats.", "conversations"},
        {"typing", "Hide typing indicator", "Stops your outgoing active-typing signal, including in end-to-end encrypted chats.", "conversations"},
        {"use_system_emoji", "Use system emoji", "Renders emoji with your phone's own font instead of Messenger's built-in set.", "conversations"},
        {"original_photo", "Send photos at original quality", "With HD on, sends a JPEG photo's own image data instead of Messenger's re-encoded copy. Its metadata, such as location and camera details, is left out, as it is from Messenger's copy, except the tag that turns a sideways photo upright. Photos over 20 MB and videos still get Messenger's compression.", "conversations"},
        {"external_browser", "Open web links externally", "Uses your default browser for HTTP and HTTPS links. Other link types keep their original behavior.", "links_bubbles"},
        {"bubbles", "Allow chat bubbles", "Choose Stock, Chat Heads or Native Bubbles below. Native Bubbles needs Android 11, account support and notification permissions. Restart Messenger after changing modes.", "links_bubbles"},
        {"allow_screenshot", "Allow screenshots", "Lets you screenshot protected chat media, including view-once media and Quicksnap, and stops screenshot notices. This doesn't add replay or saving.", "privacy"},
        {"hide_read_receipts", "Hide read receipts", "Stops sending read receipts. Opened encrypted chats can stay unread on this phone. Replying or switching this off may notify the sender. Group coverage isn't verified.", "privacy"},
        {"keep_unsent", "Keep unsent messages", "Keeps messages on verified legacy unsend routes. End-to-end encrypted chats aren't supported, and group coverage isn't verified. Activity records intercepted legacy unsends, not whether a chat is supported. Your own unsend may be limited.", "privacy"},
        {"anonymous_stories", "View stories anonymously", "Opens other people's stories without adding you to their viewer list. Stories you open this way are still marked as seen on your side.", "privacy"},
        {"save_stories", "Save any story", "Adds Save to the More options menu on other people's stories. The photo or video goes to your phone the same way Messenger saves your own.", "privacy"},
        {"material_you", "Material You theme", "Tints Messenger's dark mode with the colors Android takes from your wallpaper on Android 12 and newer. Android 11 gets a fixed blue palette. Turn on dark mode in Messenger first.", "theme"},
    };

    static final String DRAWER_ALIAS = "app.hushmessenger.extension.SettingsLauncher";

    /**
     * Shows or hides the app drawer entry, an alias of this screen that only a patched Messenger has.
     * The screen itself stays enabled for the long-press shortcut and the Menu tab row.
     */
    static void syncDrawerIcon(Context context) {
        applyDrawerIcon(context, Settings.drawerIconHidden());
    }

    static void applyDrawerIcon(Context context, boolean hidden) {
        PackageManager packages = context.getPackageManager();
        ComponentName alias = new ComponentName(context.getPackageName(), DRAWER_ALIAS);
        try {
            boolean disabled = packages.getComponentEnabledSetting(alias) == PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
            if (hidden != disabled) {
                packages.setComponentEnabledSetting(alias, hidden ? PackageManager.COMPONENT_ENABLED_STATE_DISABLED
                    : PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, PackageManager.DONT_KILL_APP);
            }
        } catch (IllegalArgumentException | SecurityException missing) {
            android.util.Log.w("HushMessenger", "Can't change the app drawer icon", missing);
        }
    }

    @Override @SuppressWarnings("deprecation") public void onCreate(Bundle state) {
        // On a Root Mount install this screen can be the first thing in the process, before any hook.
        HostScreens.start(this);
        Settings.initialize(this);
        syncDrawerIcon(this);
        boolean light = Settings.preferences.getBoolean("light", false);
        lightTheme = light;
        setTheme(light ? android.R.style.Theme_Material_Light_NoActionBar : android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        text = new SettingsText(this);
        ui = new SettingsUi(this, light);
        setTitle(text.get(Settings.preview ? "preview_title" : "settings"));
        // Hosted in a stock Messenger screen, recents would otherwise label this task "Messenger".
        if (HostScreens.hosted(this)) setTaskDescription(new android.app.ActivityManager.TaskDescription(getTitle().toString()));
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
        // Mirrored text starts with an override mark, so first-strong detection would align it left.
        if (text.layoutDirection() == View.LAYOUT_DIRECTION_RTL) root.setTextDirection(View.TEXT_DIRECTION_RTL);
        root.setBackgroundColor(ui.background);
        root.setFocusableInTouchMode(true);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            // Edge-to-edge windows can sit under a camera cutout, which the system window insets leave out.
            DisplayCutout cutout = insets.getDisplayCutout();
            int left = insets.getSystemWindowInsetLeft(), top = insets.getSystemWindowInsetTop();
            int right = insets.getSystemWindowInsetRight(), bottom = insets.getSystemWindowInsetBottom();
            if (cutout != null) {
                left = Math.max(left, cutout.getSafeInsetLeft());
                top = Math.max(top, cutout.getSafeInsetTop());
                right = Math.max(right, cutout.getSafeInsetRight());
                bottom = Math.max(bottom, cutout.getSafeInsetBottom());
            }
            view.setPadding(left, top, right, bottom);
            return insets.consumeSystemWindowInsets().consumeDisplayCutout();
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
        reminder.setPadding(ui.dp(20), ui.dp(12), ui.dp(20), ui.dp(16));
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
        syncUpdateChoice(false);
    }

    @Override protected void onStop() {
        Settings.preferences.unregisterOnSharedPreferenceChangeListener(preferenceListener);
        super.onStop();
    }

    @Override protected void onDestroy() {
        documentGeneration++;
        if (documentJob != null && documentJob.request == SAVE_CHOICES) {
            // The provider may already have truncated the file. Finish this authorized save,
            // keeping its original deadline and only an application context after the screen closes.
            documentJob.owner.clear();
            documentJob = null;
            documentBusy = false;
        } else cancelDocumentJob(null);
        cancelUpdateCheck();
        super.onDestroy();
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
            for (Switch control : switches) {
                control.setChecked(Settings.preferences.getBoolean((String) control.getTag(), false));
                refreshStatus(control);
            }
            for (RadioButton mode : bubbleModes) mode.setChecked(mode.getTag().equals("bubble_" + Settings.selectedBubbleMode()));
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
        // Content pages already pad 20dp, so a header or reminder moved inside them adds none.
        header.setPadding(ui.dp(scrollHeader ? 0 : 20), ui.dp(compact ? 8 : 50), ui.dp(scrollHeader ? 0 : 20), 0);
        placeBrand();
        placeHeader();
        ((ViewGroup) reminder.getParent()).removeView(reminder);
        reminder.setPadding(ui.dp(compact ? 0 : 20), ui.dp(12), ui.dp(compact ? 0 : 20), ui.dp(16));
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
        header.setPadding(ui.dp(20), ui.dp(50), ui.dp(20), 0);
        ui.add(root, header, 0);
        brand = ui.row();
        if (ui.largeText) brand.setOrientation(LinearLayout.VERTICAL);
        LinearLayout wordmark = ui.column();
        TextView title = ui.text("HushMessenger", 28, ui.text, true);
        title.setTag("wordmark");
        title.setAccessibilityHeading(true);
        // Linear font scaling on Android 13 and older could otherwise split the wordmark mid-word.
        title.setMaxLines(1);
        title.setAutoSizeTextTypeUniformWithConfiguration(18, 28, 1, TypedValue.COMPLEX_UNIT_SP);
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
        ui.add(setup, enabledCount, 8);
        setupNote = ui.text("", 13, ui.muted, false);
        ui.add(setup, setupNote, 6);
        safeModeAction = ui.button("");
        safeModeAction.setTag("resume_safe_mode");
        safeModeAction.setOnClickListener(view -> {
            boolean paused = Settings.preferences.getBoolean("paused", false);
            if (!CrashGuard.clearSafeMode()) {
                refreshChoices();
                feedback(text.get("safe_mode_save_failed"), Toast.LENGTH_LONG);
                return;
            }
            refreshChoices();
            feedback(text.get(paused ? "safe_mode_cleared" : "changes_resumed"), Toast.LENGTH_SHORT);
        });
        ui.add(setup, safeModeAction, 8);
        ui.rule(setup, 12);
        ui.add(setup, controlRow("paused", text.format("paused"), "", false), 0);
        ui.add(content, setup, 0);
        search = new EditText(this);
        search.setTag("find_control");
        // The hint labels the field; a content description would make TalkBack skip what was typed.
        search.setHint(text.get("search"));
        search.setTextSize(16);
        search.setSingleLine(true);
        search.setFilters(new InputFilter[] {new InputFilter.LengthFilter(100)});
        search.setHighlightColor((ui.accent & 0x00ffffff) | 0x55000000);
        tintTextHandles(search);
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
        drawerSearchLink = ui.button(text.get("drawer_search"));
        drawerSearchLink.setTag("find_drawer_icon");
        drawerSearchLink.setOnClickListener(view -> showPage("app"));
        ui.add(content, drawerSearchLink, 8);
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
            LinearLayout row = controlRow(spec[0], text.control(spec, 1), text.control(spec, 2), true);
            if ("bubbles".equals(spec[0])) {
                LinearLayout wrapper = ui.column();
                ui.add(wrapper, row, 0);
                addBubbleModes(wrapper);
                row = wrapper;
            }
            row.setTag(spec[3]);
            ui.add(group, row, 0);
            controlRows.add(row);
            installedControls.add(spec);
        }
        if (installedControls.isEmpty()) {
            // Nothing to search; the status line explains how to add controls.
            search.setVisibility(View.GONE);
            filters.setVisibility(View.GONE);
        }
        emptyState = ui.panel();
        emptyState.setTag("empty_state");
        ui.add(emptyState, ui.text(text.get("empty_title"), 18, ui.text, true), 0);
        ui.add(emptyState, ui.text(text.get("empty_help"), 14, ui.muted, false), 10);
        Button clearSearch = ui.button(text.get("clear"));
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

    private void addBubbleModes(LinearLayout content) {
        RadioGroup modes = new RadioGroup(this);
        modes.setOrientation(LinearLayout.VERTICAL);
        for (String mode : new String[] {"stock", "chat_heads", "native"}) {
            RadioButton choice = new RadioButton(this);
            choice.setId(View.generateViewId());
            choice.setTag("bubble_" + mode);
            choice.setText(text.get("bubble_" + mode));
            choice.setTextColor(ui.text);
            choice.setTextSize(16);
            choice.setMinHeight(ui.dp(48));
            choice.setPadding(ui.dp(8), ui.dp(8), ui.dp(8), ui.dp(8));
            choice.setButtonTintList(new android.content.res.ColorStateList(
                new int[][] {new int[] {android.R.attr.state_checked}, new int[] {}}, new int[] {ui.accent, ui.muted}));
            choice.setChecked(mode.equals(Settings.selectedBubbleMode()));
            choice.setEnabled(Settings.available("bubbles") || "stock".equals(mode));
            if (!choice.isEnabled()) choice.setAlpha(0.4f);
            choice.setOnClickListener(view -> {
                Settings.preferences.edit().putBoolean("bubbles", !"stock".equals(mode))
                    .putBoolean(Settings.BUBBLE_CHAT_HEADS, "chat_heads".equals(mode)).apply();
                refreshChoices();
                feedback(text.get("bubble_changed", text.base("bubble_" + mode)), Toast.LENGTH_SHORT);
            });
            modes.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            bubbleModes.add(choice);
        }
        ui.add(content, modes, 8);
        ui.add(content, ui.text(text.get(Settings.available("bubbles") ? "bubble_help" :
            Build.VERSION.SDK_INT >= 30 ? "bubble_unsupported" : "unavailable"), 13, ui.muted, false), 8);
        if (Build.VERSION.SDK_INT >= 30) {
            Button permissions = ui.button(text.get("bubble_permissions"));
            permissions.setTag("bubble_permissions");
            permissions.setOnClickListener(view -> openNotificationSettings(android.provider.Settings.ACTION_APP_NOTIFICATION_BUBBLE_SETTINGS));
            ui.add(content, permissions, 8);
        }
        Button notifications = ui.button(text.get("bubble_notifications"));
        notifications.setTag("bubble_notifications");
        notifications.setOnClickListener(view -> openNotificationSettings(android.provider.Settings.ACTION_APP_NOTIFICATION_SETTINGS));
        ui.add(content, notifications, 8);
        if (Build.VERSION.SDK_INT >= 30) {
            Button conversations = ui.button(text.get("bubble_conversations"));
            conversations.setTag("bubble_conversations");
            conversations.setOnClickListener(view -> openNotificationSettings("android.settings.CONVERSATION_SETTINGS"));
            ui.add(content, conversations, 8);
        }
    }

    private void openNotificationSettings(String action) {
        // The conversation action may be restricted or absent on a vendor phone.
        Intent intent = new Intent(action);
        if (!"android.settings.CONVERSATION_SETTINGS".equals(action))
            intent.putExtra(android.provider.Settings.EXTRA_APP_PACKAGE, getPackageName());
        // Samsung's settings homepage can otherwise reuse an unrelated screen for a new deep link.
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        try {
            if (getPackageManager().resolveActivity(intent, 0) == null) throw new android.content.ActivityNotFoundException();
            startActivity(intent);
        } catch (RuntimeException unavailable) {
            feedback(text.get("bubble_settings_missing"), Toast.LENGTH_LONG);
        }
    }

    @SuppressWarnings("deprecation")
    private LinearLayout controlRow(String key, String title, String description, boolean divided) {
        boolean available = Settings.available(key);
        if (!available) description += " " + text.format("bubbles".equals(key) && Build.VERSION.SDK_INT >= 30 ? "bubble_unsupported" : "unavailable");
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
        // A switch records a use only when Messenger reaches its screen or event, so an off switch shows nothing.
        // A failure newer than the last use means the switch isn't doing its job, so that shows instead.
        TextView activeLabel = null;
        if (divided) {
            activeLabel = ui.text("", 12, ui.muted, false);
            activeLabel.setTag("active_" + key);
            activityLabels.put(key, activeLabel);
            ui.add(labels, activeLabel, 4);
        }
        row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1));
        Switch control = ui.toggle(key, text.display(title), text.display(("ads".equals(key) ? text.format("experimental") + ". " : "") + description), Settings.preferences.getBoolean(key, false));
        LinearLayout.LayoutParams switchParams = new LinearLayout.LayoutParams(ui.dp(48), -2);
        switchParams.setMarginStart(ui.dp(12));
        row.addView(control, switchParams);
        switches.add(control);
        if (divided) {
            switchDescriptions.put(control, control.getContentDescription());
            refreshStatus(control);
        }
        control.setEnabled(available);
        // The custom track has no disabled state, so dim it; the description says why.
        if (!available) control.setAlpha(0.4f);
        control.setOnCheckedChangeListener((button, checked) -> {
            refreshStatus(control);
            if (binding) return;
            if ("paused".equals(key) && !checked && CrashGuard.isSafeMode() && !CrashGuard.clearSafeMode()) {
                refreshChoices();
                feedback(text.get("safe_mode_save_failed"), Toast.LENGTH_LONG);
                return;
            }
            Settings.preferences.edit().putBoolean(key, checked).apply();
            refreshChoices();
            feedback("paused".equals(key) ? text.get(checked ? "changes_paused" : "changes_resumed")
                : text.get(checked ? "choice_on" : "choice_off", title), Toast.LENGTH_SHORT);
            if ("light".equals(key)) refreshChoices();
            if ("hide_drawer_icon".equals(key)) applyDrawerIcon(this, checked);
        });
        row.setOnClickListener(view -> { if (control.isEnabled()) control.toggle(); });
        row.setEnabled(available);
        row.setFocusable(false);
        control.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        row.setScreenReaderFocusable(true);
        row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(Switch.class.getName());
                info.setCheckable(true);
                info.setChecked(control.isChecked());
                info.setEnabled(control.isEnabled());
                info.setContentDescription(control.getContentDescription());
                if (Build.VERSION.SDK_INT >= 30) {
                    AccessibilityNodeInfo switchInfo = control.createAccessibilityNodeInfo();
                    info.setStateDescription(switchInfo.getStateDescription());
                    switchInfo.recycle();
                }
            }
            @Override public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
                super.onInitializeAccessibilityEvent(host, event);
                event.setClassName(Switch.class.getName());
                event.setChecked(control.isChecked());
                event.setContentDescription(control.getContentDescription());
            }
            @Override public boolean performAccessibilityAction(View host, int action, Bundle arguments) {
                if (action == AccessibilityNodeInfo.ACTION_CLICK && !control.isEnabled()) return false;
                return super.performAccessibilityAction(host, action, arguments);
            }
        });
        row.setBackground(ui.interactive(ui.background, 0, 0));
        if (divided) {
            row.setBackground(new android.graphics.drawable.LayerDrawable(new android.graphics.drawable.Drawable[] {
                ui.shape(ui.line, 0, 0), new android.graphics.drawable.InsetDrawable(ui.interactive(ui.background, 0, 0), 0, 0, 0, ui.dp(1))
            }));
        } else row.setBackground(ui.interactive(ui.surface, 0, 0));
        row.setPadding(0, ui.dp(divided ? 16 : 0), 0, ui.dp(divided ? 16 : 0));
        return row;
    }

    private void refreshStatus(Switch control) {
        String key = (String) control.getTag();
        TextView label = activityLabels.get(key);
        if (label == null) return;
        long used = Settings.lastActive(key), failedAt = Settings.hookErrorAt(key);
        boolean paused = Settings.preferences.getBoolean("paused", false) || CrashGuard.isSafeMode();
        boolean failed = failedAt > 0 && failedAt >= used;
        String status = paused ? text.get("changes_paused") : failed ? formatSince(failedAt, "error_now", "error_ago")
            : used == 0 ? text.get("keep_unsent".equals(key) ? "unsent_not_active" : "not_active") : formatSince(used, "active_now", "active_ago");
        if (!status.contentEquals(label.getText())) label.setText(status);
        label.setTextColor(!paused && failed ? ui.warning : !paused && used > 0 ? ui.accent : ui.muted);
        label.setVisibility(control.isChecked() ? View.VISIBLE : View.GONE);
        // Hidden labels share the description exposed by the row's switch node.
        String description = switchDescriptions.get(control).toString() + (control.isChecked() ? " " + status : "");
        if (!description.contentEquals(control.getContentDescription())) control.setContentDescription(description);
    }

    private void buildApp(LinearLayout content) {
        ui.add(content, ui.heading(text.get("quick_access")), 4);
        LinearLayout access = ui.panel();
        // The Menu tab row is its own patch, recorded as menu_row only when it applied.
        boolean menuRow = Settings.installed.contains("menu_row");
        // A Root Mount install has no drawer entry to mention or hide.
        boolean hosted = HostScreens.hosted(this);
        boolean drawerAlias = false;
        if (!hosted) try {
            getPackageManager().getActivityInfo(new ComponentName(getPackageName(), DRAWER_ALIAS), PackageManager.MATCH_DISABLED_COMPONENTS);
            drawerAlias = true;
        } catch (PackageManager.NameNotFoundException | SecurityException unavailable) {
            // Some bundles have settings activities but omit the launcher alias.
        }
        TextView accessHelp = ui.text(text.get((hosted ? "access_help_hosted" : drawerAlias ? "access_help" : "access_help_missing") + (menuRow ? "_menu" : "")), 14, ui.muted, false);
        accessHelp.setTag("access_help");
        ui.add(access, accessHelp, 0);
        Button restart = ui.button(text.get("restart"));
        restart.setTag("restart_messenger");
        restart.setOnClickListener(view -> HostScreens.open(this, HostScreens.RESTART));
        ui.add(access, restart, 14);
        // Without the Menu row, a launcher that has no app shortcuts would leave no way back in.
        if (menuRow && drawerAlias && !hosted) {
            ui.rule(access, 14);
            ui.add(access, controlRow("hide_drawer_icon", text.format("hide_drawer_icon"), text.format("hide_drawer_icon_help"), false), 14);
        } else {
            TextView drawerHelp = ui.text(text.get(hosted ? "drawer_root" : !drawerAlias ? "drawer_missing" : "drawer_requires_menu"), 14, ui.muted, false);
            drawerHelp.setTag("drawer_help");
            ui.add(access, drawerHelp, 14);
        }
        if (drawerAlias && !hosted) {
            TextView sharedInstall = ui.text(text.get("shared_install_help"), 14, ui.muted, false);
            sharedInstall.setTag("shared_install_help");
            ui.add(access, sharedInstall, 12);
        }
        ui.add(content, access, 12);
        ui.add(content, ui.heading(text.get("appearance")), 22);
        LinearLayout appearance = ui.panel();
        ui.add(appearance, controlRow("light", text.format("light"), text.format("light_help"), false), 0);
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
        ui.rule(about, 12);
        Button exportBtn = ui.button(text.get("export"));
        exportBtn.setTag("export_choices");
        exportBtn.setOnClickListener(view -> exportChoices());
        ui.add(about, exportBtn, 8);
        ui.add(about, ui.text(text.get("export_help"), 13, ui.muted, false), 8);
        ui.rule(about, 12);
        Button importBtn = ui.button(text.get("import_choices"));
        importBtn.setTag("import_choices");
        importBtn.setOnClickListener(view -> importChoices());
        ui.add(about, importBtn, 8);
        ui.add(about, ui.text(text.get("import_help"), 13, ui.muted, false), 8);
        ui.rule(about, 12);
        Button saveFile = saveChoicesFile = ui.button(text.get("save_choices_file"));
        saveFile.setTag("save_choices_file");
        saveFile.setOnClickListener(view -> {
            if (documentBusy || documentImport || documentExport != null) return;
            documentGeneration++;
            documentImport = false;
            documentExport = ChoiceCodec.encode(Settings.preferences, Settings.installed);
            Intent picker = new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                .setType("text/plain").putExtra(Intent.EXTRA_TITLE, "HushMessenger-choices.txt");
            try { startActivityForResult(picker, SAVE_CHOICES); }
            catch (android.content.ActivityNotFoundException | SecurityException error) {
                documentExport = null;
                feedback(text.get("export_failed"), Toast.LENGTH_LONG);
            }
        });
        ui.add(about, saveFile, 8);
        Button readFile = readChoicesFile = ui.button(text.get("read_choices_file"));
        readFile.setTag("read_choices_file");
        readFile.setOnClickListener(view -> {
            if (documentBusy || documentImport || documentExport != null) return;
            documentGeneration++;
            documentExport = null;
            documentImport = true;
            Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("text/*");
            try { startActivityForResult(picker, READ_CHOICES); }
            catch (android.content.ActivityNotFoundException | SecurityException error) {
                documentImport = false;
                feedback(text.get("import_invalid"), Toast.LENGTH_LONG);
            }
        });
        ui.add(about, readFile, 8);
        documentStatus = ui.text("", 13, ui.muted, false);
        documentStatus.setTag("choices_file_status");
        documentStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        documentStatus.setVisibility(View.GONE);
        ui.add(about, documentStatus, 8);
        cancelChoicesFile = ui.button(text.get("cancel_choices_file"));
        cancelChoicesFile.setTag("cancel_choices_file");
        cancelChoicesFile.setVisibility(View.GONE);
        cancelChoicesFile.setOnClickListener(view -> cancelDocumentJob("choices_file_canceled"));
        ui.add(about, cancelChoicesFile, 8);
        ui.add(about, ui.text(text.get("choices_file_help"), 13, ui.muted, false), 8);
        ui.add(content, about, 12);
        LinearLayout updates = ui.panel();
        ui.add(updates, controlRow("check_updates", text.format("check_updates"), text.format("check_updates_help"), false), 0);
        updateStatus = ui.text("", 13, ui.muted, false);
        updateStatus.setTag("update_status");
        updateStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        updateStatus.setVisibility(View.GONE);
        ui.add(updates, updateStatus, 8);
        updateCheckNow = ui.button(text.get("check_now"));
        updateCheckNow.setTag("check_now");
        updateCheckNow.setOnClickListener(view -> checkForUpdates());
        ui.add(updates, updateCheckNow, 8);
        ui.add(content, updates, 12);
        syncUpdateChoice(true);
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
            catch (android.content.ActivityNotFoundException error) { feedback(text.get("no_browser"), Toast.LENGTH_LONG); }
        });
        ui.add(content, source, 16);
        ui.add(content, ui.text(text.get("credits"), 12, ui.muted, false), 16);
        ui.add(content, ui.text(text.get("independent"), 12, ui.muted, false), 20);
    }

    private void copySetup() {
        try {
            PackageInfo host = getPackageManager().getPackageInfo(getPackageName(), 0);
            boolean paused = Settings.preferences.getBoolean("paused", false);
            boolean safeMode = CrashGuard.isSafeMode();
            StringBuilder summary = new StringBuilder("HushMessenger v").append(BuildConfig.VERSION_NAME)
                .append("\nHost package: ").append(getPackageName())
                .append("\nHost version: ").append(host.versionName == null ? "unknown" : host.versionName)
                .append("\nHost version code: ").append(host.getLongVersionCode())
                .append("\nAndroid API: ").append(Build.VERSION.SDK_INT)
                .append("\nPaused: ").append(paused)
                .append("\nSafe mode: ").append(safeMode).append('\n');
            if (Settings.preview) summary.append("Mode: UI preview. Does not change Messenger.\n");
            summary.append(text.get("setup_activity_help")).append("\nControls:\n");
            for (String[] spec : CONTROLS) {
                String key = spec[0];
                boolean installed = Settings.installed.contains(key);
                boolean selected = Settings.preferences.getBoolean(key, false);
                long lastActive = Settings.lastActive(key);
                summary.append(key).append(": installed=").append(installed)
                    .append(", selected=").append(selected)
                    .append(", active=").append(!Settings.preview && installed && selected && !paused && !safeMode && Settings.available(key))
                    .append(", last_active=").append(lastActive == 0 ? "none" : ((System.currentTimeMillis() - lastActive) / 1000) + "s ago")
                    .append(", scope=").append(text.control(spec, 2))
                    .append('\n');
            }
            summary.append("Facebook caller checks: ").append(MessengerSignature.callerSummary()).append('\n');
            // Only controls that failed get a line: the exception's class, where it hit HushMessenger's code and when.
            Map<String, String> errors = Settings.lastHookErrors();
            if (!errors.isEmpty()) summary.append("Hook errors:\n");
            for (Map.Entry<String, String> error : errors.entrySet()) {
                String record = error.getValue();
                int split = record.lastIndexOf('|');
                summary.append(error.getKey()).append(": ").append(split < 0 ? record : record.substring(0, split)).append(", ")
                    .append(java.time.Instant.ofEpochMilli(Settings.hookErrorTime(record)).truncatedTo(java.time.temporal.ChronoUnit.SECONDS))
                    .append('\n');
            }
            ClipData clip = ClipData.newPlainText(text.get("clipboard"), summary.toString());
            PersistableBundle extras = new PersistableBundle();
            extras.putBoolean(Build.VERSION.SDK_INT >= 33 ? ClipDescription.EXTRA_IS_SENSITIVE : "android.content.extra.IS_SENSITIVE", true);
            clip.getDescription().setExtras(extras);
            ClipboardManager clipboard = getSystemService(ClipboardManager.class);
            if (clipboard == null) throw new IllegalStateException("Clipboard service unavailable");
            clipboard.setPrimaryClip(clip);
            if (Build.VERSION.SDK_INT < 33) feedback(text.get("copied"), Toast.LENGTH_SHORT);
        } catch (PackageManager.NameNotFoundException | SecurityException | IllegalStateException error) {
            android.util.Log.e("HushMessenger", "Can't copy setup", error);
            feedback(text.get("copy_failed"), Toast.LENGTH_LONG);
        }
    }

    /** Where the update check asks, and how long it waits. Tests point these at a local server. */
    static String releasesUrl = "https://api.github.com/repos/SysAdminDoc/HushMessenger/releases/latest";
    static int updateTimeoutMillis = 5000;
    static java.util.function.LongSupplier updateClock = System::currentTimeMillis;

    /**
     * Compares release numbers part by part as integers, so 0.10.0 is newer than 0.9.0. A leading "v"
     * is ignored and a missing or non-numeric part counts as 0. Build metadata is ignored. Numeric
     * pre-release identifiers sort numerically and before text; a release sorts after its pre-releases.
     */
    static int compareVersions(String a, String b) {
        String[] left = a.trim().replaceFirst("^v", "").split("\\+", 2)[0].split("-", 2);
        String[] right = b.trim().replaceFirst("^v", "").split("\\+", 2)[0].split("-", 2);
        String[] x = left[0].split("\\."), y = right[0].split("\\.");
        for (int i = 0; i < Math.max(x.length, y.length); i++) {
            int diff = versionPart(x, i).compareTo(versionPart(y, i));
            if (diff != 0) return diff;
        }
        if (left.length != right.length) return left.length > right.length ? -1 : 1;
        if (left.length == 1) return 0;
        x = left[1].split("\\."); y = right[1].split("\\.");
        for (int i = 0; i < Math.min(x.length, y.length); i++) {
            boolean numericX = x[i].matches("[0-9]+"), numericY = y[i].matches("[0-9]+");
            int diff = numericX && numericY ? versionPart(x, i).compareTo(versionPart(y, i))
                : numericX != numericY ? (numericX ? -1 : 1) : x[i].compareTo(y[i]);
            if (diff != 0) return diff;
        }
        return Integer.compare(x.length, y.length);
    }

    private static java.math.BigInteger versionPart(String[] parts, int index) {
        return index < parts.length && parts[index].matches("[0-9]+") ? new java.math.BigInteger(parts[index]) : java.math.BigInteger.ZERO;
    }

    /** The release page to offer, or "" when the response points anywhere but this project's releases. */
    static String releasePage(String htmlUrl) {
        // A plain tag page only, so "../" or an encoded path can't walk out of this project.
        return htmlUrl.matches("https://github\\.com/SysAdminDoc/HushMessenger/releases/tag/[0-9A-Za-z._+-]+")
            && !htmlUrl.contains("..") ? htmlUrl : "";
    }

    static String releasePage(String htmlUrl, String tag) {
        return ReleaseCheck.validTag(tag) && !releasePage(htmlUrl).isEmpty()
            && htmlUrl.equals("https://github.com/SysAdminDoc/HushMessenger/releases/tag/" + tag) ? htmlUrl : "";
    }

    private void syncUpdateChoice(boolean check) {
        if (updateStatus == null) return;
        boolean enabled = Settings.preferences.getBoolean("check_updates", false);
        updateCheckNow.setVisibility(enabled ? View.VISIBLE : View.GONE);
        if (!enabled) {
            cancelUpdateCheck();
            updateStatus.setVisibility(View.GONE);
        } else if (check) checkForUpdates();
    }

    private synchronized void cancelUpdateCheck() {
        updateGeneration++;
        if (updateConnection != null) {
            updateConnection.disconnect();
            updateConnection = null;
        }
        if (updateRelease != null) {
            ((ViewGroup) updateRelease.getParent()).removeView(updateRelease);
            updateRelease = null;
        }
    }

    private boolean currentUpdate(long generation) {
        return generation == updateGeneration && !isDestroyed() && Settings.preferences.getBoolean("check_updates", false);
    }

    private void showRelease(long generation, ReleaseCheck release) {
        runOnUiThread(() -> {
            if (!currentUpdate(generation)) return;
            String latest = release.version();
            int comparison = compareVersions(latest, BuildConfig.VERSION_NAME);
            updateStatus.setTextColor(comparison > 0 ? ui.accent : ui.muted);
            if (comparison > 0) {
                updateStatus.setText(text.get("update_available", latest));
                Button view = ui.button(text.get("update_action"));
                view.setTag("update_release");
                updateRelease = view;
                view.setOnClickListener(v -> {
                    try { startActivity(new Intent(Intent.ACTION_VIEW, android.net.Uri.parse(release.page))); }
                    catch (android.content.ActivityNotFoundException error) { feedback(text.get("no_browser"), Toast.LENGTH_LONG); }
                });
                ViewGroup parent = (ViewGroup) updateStatus.getParent();
                parent.addView(view, parent.indexOfChild(updateStatus) + 1);
            } else updateStatus.setText(comparison == 0 ? text.get("up_to_date")
                : text.get("update_ahead", BuildConfig.VERSION_NAME, latest));
            updateStatus.setVisibility(View.VISIBLE);
        });
    }

    private void showRetry(long generation, long deadline) {
        runOnUiThread(() -> {
            if (!currentUpdate(generation)) return;
            String date = java.text.DateFormat.getDateTimeInstance(java.text.DateFormat.SHORT, java.text.DateFormat.MEDIUM,
                getResources().getConfiguration().getLocales().get(0)).format(new java.util.Date(deadline));
            updateStatus.setText(text.get("update_retry", date));
            updateStatus.setVisibility(View.VISIBLE);
        });
    }

    private void checkForUpdates() {
        cancelUpdateCheck();
        if (!Settings.preferences.getBoolean("check_updates", false) || isDestroyed()) return;
        long generation = updateGeneration;
        String endpoint = releasesUrl;
        updateStatus.setText(text.get("update_loading"));
        updateStatus.setTextColor(ui.muted);
        updateStatus.setVisibility(View.VISIBLE);
        new Thread(() -> {
            java.net.HttpURLConnection conn = null;
            try {
                long now = updateClock.getAsLong();
                SharedPreferences prefs = Settings.preferences;
                long retry = ReleaseCheck.retryDeadline(prefs, endpoint, now);
                if (now < retry) { showRetry(generation, retry); return; }
                ReleaseCheck cached = ReleaseCheck.cached(prefs, endpoint, now);
                if (cached != null && cached.recent(now)) { showRelease(generation, cached); return; }
                conn = (java.net.HttpURLConnection) new java.net.URL(endpoint).openConnection();
                synchronized (this) {
                    if (!currentUpdate(generation)) return;
                    updateConnection = conn;
                }
                conn.setInstanceFollowRedirects(false);
                conn.setRequestProperty("Accept", "application/vnd.github.v3+json");
                if (cached != null && !cached.etag.isEmpty()) conn.setRequestProperty("If-None-Match", cached.etag);
                conn.setConnectTimeout(updateTimeoutMillis);
                conn.setReadTimeout(updateTimeoutMillis);
                int code = conn.getResponseCode();
                if (code == 403 || code == 429) {
                    int failures = ReleaseCheck.failures(prefs);
                    long deadline = ReleaseCheck.retryAt(conn, updateClock.getAsLong(), failures);
                    synchronized (this) {
                        if (!currentUpdate(generation)) return;
                        if (!prefs.edit().putLong(ReleaseCheck.RETRY_KEY, deadline).putString(ReleaseCheck.RETRY_ENDPOINT_KEY, endpoint)
                            .putInt(ReleaseCheck.FAILURES_KEY, Math.min(6, failures + 1)).commit())
                            android.util.Log.w("HushMessenger", "Couldn't save update retry time");
                    }
                    showRetry(generation, deadline);
                    return;
                }
                ReleaseCheck release;
                if (code == 304) {
                    if (cached == null || cached.etag.isEmpty()) throw new java.io.IOException("304 without a conditional release cache");
                    release = cached.revalidated(conn.getHeaderField("ETag"), updateClock.getAsLong());
                    if (release == null) {
                        // A changed ETag can't confirm the cached release. Drop it so the next check asks unconditionally.
                        synchronized (this) {
                            if (!currentUpdate(generation)) return;
                            if (!prefs.edit().remove(ReleaseCheck.CACHE_KEY).commit())
                                android.util.Log.w("HushMessenger", "Couldn't clear the cached release");
                        }
                        throw new java.io.IOException("Changed ETag on 304");
                    }
                } else {
                    if (code != 200) throw new java.io.IOException("HTTP " + code);
                    java.io.ByteArrayOutputStream response = new java.io.ByteArrayOutputStream();
                    try (java.io.InputStream stream = conn.getInputStream()) {
                        byte[] bytes = new byte[4096];
                        int read;
                        while ((read = stream.read(bytes)) != -1) {
                            if (response.size() + read > 256 * 1024) throw new java.io.IOException("Release response exceeds 256 KiB");
                            response.write(bytes, 0, read);
                        }
                    }
                    String body = java.nio.charset.StandardCharsets.UTF_8.newDecoder()
                        .onMalformedInput(java.nio.charset.CodingErrorAction.REPORT).onUnmappableCharacter(java.nio.charset.CodingErrorAction.REPORT)
                        .decode(java.nio.ByteBuffer.wrap(response.toByteArray())).toString();
                    release = ReleaseCheck.parse(body, endpoint, conn.getHeaderField("ETag"), updateClock.getAsLong());
                }
                synchronized (this) {
                    if (!currentUpdate(generation)) return;
                    if (!prefs.edit().putString(ReleaseCheck.CACHE_KEY, release.encode()).remove(ReleaseCheck.RETRY_KEY)
                        .remove(ReleaseCheck.RETRY_ENDPOINT_KEY).remove(ReleaseCheck.FAILURES_KEY).commit())
                        android.util.Log.w("HushMessenger", "Couldn't save checked release");
                }
                showRelease(generation, release);
            } catch (java.io.IOException | IllegalArgumentException | IllegalStateException | SecurityException error) {
                if (generation == updateGeneration) android.util.Log.e("HushMessenger", "Update check failed", error);
                runOnUiThread(() -> {
                    if (!currentUpdate(generation)) return;
                    updateStatus.setText(text.get("update_error"));
                    updateStatus.setVisibility(View.VISIBLE);
                });
            } finally {
                if (conn != null) conn.disconnect();
                synchronized (this) { if (updateConnection == conn) updateConnection = null; }
            }
        }, "HushUpdateCheck").start();
    }

    private String formatSince(long timestamp, String now, String ago) {
        long seconds = (System.currentTimeMillis() - timestamp) / 1000;
        if (seconds < 10) return text.get(now);
        if (seconds < 60) return text.get(ago, text.format("seconds_short", seconds));
        long minutes = seconds / 60;
        if (minutes < 60) return text.get(ago, text.format("minutes_short", minutes));
        long hours = minutes / 60;
        return text.get(ago, text.format("hours_short", hours));
    }

    private void exportChoices() {
        try {
            ClipData clip = ClipData.newPlainText(text.get("clipboard"), ChoiceCodec.encode(Settings.preferences, Settings.installed));
            PersistableBundle extras = new PersistableBundle();
            extras.putBoolean(Build.VERSION.SDK_INT >= 33 ? ClipDescription.EXTRA_IS_SENSITIVE : "android.content.extra.IS_SENSITIVE", true);
            clip.getDescription().setExtras(extras);
            ClipboardManager clipboard = getSystemService(ClipboardManager.class);
            if (clipboard == null) throw new IllegalStateException("Clipboard unavailable");
            clipboard.setPrimaryClip(clip);
            if (Build.VERSION.SDK_INT < 33) feedback(text.get("exported"), Toast.LENGTH_SHORT);
        } catch (Exception error) {
            android.util.Log.e("HushMessenger", "Can't export choices", error);
            feedback(text.get("export_failed"), Toast.LENGTH_LONG);
        }
    }

    private void importChoices() {
        documentGeneration++;
        try {
            ClipboardManager clipboard = getSystemService(ClipboardManager.class);
            if (clipboard == null || !clipboard.hasPrimaryClip()) {
                feedback(text.get("import_empty"), Toast.LENGTH_LONG);
                return;
            }
            ClipData clip = clipboard.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) {
                feedback(text.get("import_empty"), Toast.LENGTH_LONG);
                return;
            }
            CharSequence raw = clip.getItemAt(0).getText();
            restoreChoices(ChoiceCodec.parse(raw == null ? null : raw.toString()));
        } catch (Exception error) {
            android.util.Log.e("HushMessenger", "Can't import choices", error);
            feedback(text.get("import_invalid"), Toast.LENGTH_LONG);
        }
    }

    private void restoreChoices(Map<String, Boolean> choices) {
        java.util.Set<String> known = new java.util.HashSet<>();
        for (String[] spec : CONTROLS) known.add(spec[0]);
        known.add(Settings.BUBBLE_CHAT_HEADS);
        Map<String, Boolean> supported = new java.util.LinkedHashMap<>();
        int unknown = 0, unavailable = 0;
        for (Map.Entry<String, Boolean> choice : choices.entrySet()) {
            String key = choice.getKey();
            if ("paused".equals(key) || (known.contains(key) && Settings.installed.contains(
                Settings.BUBBLE_CHAT_HEADS.equals(key) ? "bubbles" : key))) supported.put(key, choice.getValue());
            else if (known.contains(key)) unavailable++;
            else unknown++;
        }
        String skipped = (unknown == 0 ? "" : " " + text.count("import_unknown", unknown)) +
            (unavailable == 0 ? "" : " " + text.count("import_unavailable", unavailable));
        if (supported.isEmpty()) {
            feedback(text.get("import_no_choices") + skipped, Toast.LENGTH_LONG);
            return;
        }
        SharedPreferences.Editor editor = Settings.preferences.edit();
        for (Map.Entry<String, Boolean> choice : supported.entrySet()) editor.putBoolean(choice.getKey(), choice.getValue());
        editor.apply();
        refreshChoices();
        feedback(text.count("imported", supported.size()) + skipped, Toast.LENGTH_LONG);
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != SAVE_CHOICES && request != READ_CHOICES) return;
        String export = documentExport;
        boolean importing = documentImport;
        documentExport = null;
        documentImport = false;
        // Pending document operations deliberately don't survive recreation. A returned URI alone isn't authorization.
        if (result != RESULT_OK || data == null || data.getData() == null ||
            (request == SAVE_CHOICES ? export == null : !importing)) return;
        android.net.Uri uri = data.getData();
        // A document picker must return a provider grant, never a path opened with Messenger's own UID.
        if (!"content".equals(uri.getScheme())) {
            feedback(text.get(request == SAVE_CHOICES ? "export_failed" : "import_invalid"), Toast.LENGTH_LONG);
            return;
        }
        if (!documentSlots.tryAcquire()) {
            documentStatus.setText(text.get("choices_file_busy"));
            documentStatus.setVisibility(View.VISIBLE);
            return;
        }
        DocumentJob job = new DocumentJob(this, uri, request, export);
        documentJob = job;
        documentBusy = true;
        saveChoicesFile.setEnabled(false);
        readChoicesFile.setEnabled(false);
        cancelChoicesFile.setVisibility(View.VISIBLE);
        documentStatus.setText(text.get(request == SAVE_CHOICES ? "choices_file_saving" : "choices_file_reading"));
        documentStatus.setVisibility(View.VISIBLE);
        job.handler.postDelayed(job.deadline, Math.max(1, documentTimeoutMillis));
        job.worker.start();
    }

    private void cancelDocumentJob(String status) {
        DocumentJob job = documentJob;
        if (job == null) return;
        documentJob = null;
        documentBusy = false;
        documentGeneration++;
        job.owner.clear();
        job.handler.removeCallbacks(job.deadline);
        job.cancel();
        if (status != null) {
            saveChoicesFile.setEnabled(true);
            readChoicesFile.setEnabled(true);
            cancelChoicesFile.setVisibility(View.GONE);
            documentStatus.setText(text.get(status));
            documentStatus.setVisibility(View.VISIBLE);
        }
    }

    private void finishDocumentJob(DocumentJob job, boolean success, Map<String, Boolean> choices) {
        if (documentJob != job || isDestroyed()) return;
        documentJob = null;
        documentBusy = false;
        saveChoicesFile.setEnabled(true);
        readChoicesFile.setEnabled(true);
        cancelChoicesFile.setVisibility(View.GONE);
        documentStatus.setVisibility(View.GONE);
        if (!success) feedback(text.get(job.request == SAVE_CHOICES ? "export_failed" : "import_invalid"), Toast.LENGTH_LONG);
        else if (job.request == SAVE_CHOICES) feedback(text.get("choices_file_saved"), Toast.LENGTH_SHORT);
        else if (job.generation == documentGeneration && job.before.equals(ChoiceCodec.encode(Settings.preferences, Settings.installed)))
            restoreChoices(choices);
        else feedback(text.get("choices_file_changed"), Toast.LENGTH_LONG);
    }

    /** Provider calls may ignore cancellation. Keep their resources bounded without retaining a screen. */
    private static final class DocumentJob implements Runnable {
        final java.lang.ref.WeakReference<SettingsActivity> owner;
        final Context context;
        final android.net.Uri uri;
        final int request;
        final String export, before;
        final String savedMessage, failedMessage, timeoutMessage;
        final long generation;
        final android.os.CancellationSignal cancellation = new android.os.CancellationSignal();
        final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable deadline;
        final Thread worker;
        volatile boolean canceled;
        volatile android.content.res.AssetFileDescriptor asset;
        volatile java.io.Closeable stream;
        private int users = 1;
        private boolean finished;

        DocumentJob(SettingsActivity screen, android.net.Uri uri, int request, String export) {
            owner = new java.lang.ref.WeakReference<>(screen);
            context = screen.getApplicationContext();
            this.uri = uri;
            this.request = request;
            this.export = export;
            savedMessage = screen.text.get("choices_file_saved");
            failedMessage = screen.text.get("export_failed");
            timeoutMessage = screen.text.get("choices_file_timeout");
            generation = screen.documentGeneration;
            before = ChoiceCodec.encode(Settings.preferences, Settings.installed);
            deadline = () -> {
                SettingsActivity current = owner.get();
                if (current != null && current.documentJob == this) current.cancelDocumentJob("choices_file_timeout");
                else if (!canceled) {
                    cancel();
                    Toast.makeText(context, timeoutMessage, Toast.LENGTH_LONG).show();
                }
            };
            worker = new Thread(this, "HushChoicesDocument");
            worker.setDaemon(true);
        }

        void cancel() {
            synchronized (this) {
                if (canceled) return;
                canceled = true;
                if (finished) return;
                users++;
            }
            worker.interrupt();
            // Both remote cancellation listeners and close can block, so neither runs on the UI thread.
            Thread closer = new Thread(() -> {
                try {
                    try { cancellation.cancel(); }
                    finally {
                        java.io.Closeable currentStream = stream;
                        android.content.res.AssetFileDescriptor currentAsset = asset;
                        try { if (currentStream != null) currentStream.close(); }
                        finally { if (currentAsset != null) currentAsset.close(); }
                    }
                } catch (java.io.IOException | RuntimeException error) {
                    android.util.Log.w("HushMessenger", "Can't close choices document: " + error.getClass().getName());
                } finally { release(); }
            }, "HushChoicesCancel");
            closer.setDaemon(true);
            closer.start();
        }

        private synchronized void release() {
            if (--users == 0) {
                finished = true;
                documentSlots.release();
            }
        }

        @Override public void run() {
            Map<String, Boolean> choices = null;
            boolean success = false;
            try {
                if (canceled) return;
                String authority = uri.getAuthority();
                if (authority == null || authority.isEmpty()) throw new SecurityException("Choices document has no provider");
                // ContentResolver strips Android's userId@ prefix before resolving a provider.
                authority = authority.substring(authority.lastIndexOf('@') + 1);
                android.content.pm.ProviderInfo provider = context.getPackageManager().resolveContentProvider(authority, 0);
                if (provider != null && (context.getPackageName().equals(provider.packageName) ||
                        (provider.applicationInfo != null && provider.applicationInfo.uid == android.os.Process.myUid())))
                    throw new SecurityException("Choices document belongs to this app");
                try (android.content.res.AssetFileDescriptor opened = context.getContentResolver()
                        .openAssetFileDescriptor(uri, request == SAVE_CHOICES ? "wt" : "r", cancellation)) {
                    if (opened == null) throw new java.io.IOException("No choices document");
                    asset = opened;
                    if (canceled) return;
                    if (request == SAVE_CHOICES) {
                        byte[] bytes = export.getBytes(java.nio.charset.StandardCharsets.UTF_8);
                        if (opened.getDeclaredLength() >= 0 && opened.getDeclaredLength() < bytes.length)
                            throw new java.io.IOException("Choices document slice is too small");
                        try (java.io.OutputStream output = opened.createOutputStream()) {
                            stream = output;
                            if (canceled) return;
                            output.write(bytes);
                        }
                    } else {
                        if (opened.getDeclaredLength() >= 0) {
                            // Older AssetFileDescriptor input skips relative to the provider's position.
                            // Normalize seekable descriptors so the declared slice has an absolute start.
                            try { android.system.Os.lseek(opened.getFileDescriptor(), 0, android.system.OsConstants.SEEK_SET); }
                            catch (android.system.ErrnoException error) {
                                if (error.errno != android.system.OsConstants.ESPIPE)
                                    throw new java.io.IOException("Choices document seek failed", error);
                            }
                        }
                        try (java.io.InputStream input = opened.createInputStream()) {
                            stream = input;
                            if (canceled) return;
                            choices = ChoiceCodec.parse(ChoiceCodec.read(input));
                        }
                    }
                }
                success = !canceled;
            } catch (java.io.IOException | RuntimeException error) {
                // Providers run outside this app's trust boundary. Their messages can include private paths or contents.
                if (!canceled) android.util.Log.e("HushMessenger", "Can't use choices document: " + error.getClass().getName());
            } finally {
                asset = null;
                stream = null;
                handler.removeCallbacks(deadline);
                boolean completed = success;
                Map<String, Boolean> result = choices;
                handler.post(() -> {
                    SettingsActivity screen = owner.get();
                    if (screen != null) screen.finishDocumentJob(this, completed, result);
                    else if (request == SAVE_CHOICES && !canceled)
                        Toast.makeText(context, completed ? savedMessage : failedMessage, Toast.LENGTH_LONG).show();
                });
                release();
            }
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
        boolean safeMode = CrashGuard.isSafeMode();
        boolean paused = Settings.preferences.getBoolean("paused", false);
        safeModeAction.setVisibility(safeMode ? View.VISIBLE : View.GONE);
        safeModeAction.setText(text.get(paused ? "clear_safe_mode" : "resume"));
        if (safeMode) {
            enabledCount.setText(text.get("safe_mode"));
            setupNote.setText(text.get(paused ? "safe_mode_help_paused" : "safe_mode_help"));
        } else if (paused) {
            enabledCount.setText(text.get("changes_paused"));
            setupNote.setText(text.count("saved", saved));
        } else {
            enabledCount.setText(text.count("enabled", enabled));
            setupNote.setText(text.get("saved"));
        }
    }

    private void filterControls(String query) {
        String needle = query.trim().toLowerCase(Locale.ROOT);
        String drawerWords = "hide app drawer icon launcher settings " + text.get("hide_drawer_icon");
        drawerSearchLink.setVisibility(controlRows.isEmpty() || (!needle.isEmpty() && drawerWords.toLowerCase(Locale.ROOT).contains(needle)) ? View.VISIBLE : View.GONE);
        int visible = 0;
        for (int i = 0; i < controlRows.size(); i++) {
            String[] spec = installedControls.get(i);
            String bucket = "inbox".equals(spec[3]) ? "inbox" :
                ("conversations".equals(spec[3]) || "stickers".equals(spec[3])) ? "chats" : "more";
            boolean match = ("all".equals(category) || category.equals(bucket)) &&
                (spec[1] + " " + spec[2] + " " + SettingsText.english(spec[3]) + " " +
                    text.display(text.control(spec, 1)) + " " + text.display(text.control(spec, 2)) + " " + text.get(spec[3])).toLowerCase(Locale.ROOT).contains(needle);
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
                ui.interactive(selected ? ui.selected : ui.background, selected ? 0 : ui.outline, 8, selected ? ui.text : ui.accent),
                0, ui.dp(6), 0, ui.dp(6)));
            button.setPadding(ui.dp(4), ui.dp(8), ui.dp(4), ui.dp(8));
        }
        searchStatus.setText(controlRows.isEmpty() ? text.get("none_installed") :
            visible == 0 ? text.get("no_matches") : text.get(controlRows.size() == 1 ? "results_one" : "results_many", visible, controlRows.size()));
        // With nothing installed, the status line already explains what to do.
        emptyState.setVisibility(visible == 0 && !controlRows.isEmpty() ? View.VISIBLE : View.GONE);
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
            var activity = match.activityInfo;
            if (activity == null || !getPackageName().equals(activity.packageName) || activity.name == null ||
                activity.name.startsWith("app.hushmessenger.extension.") ||
                (activity.targetActivity != null && activity.targetActivity.startsWith("app.hushmessenger.extension.")) ||
                !RestartActivity.enabledNow(getPackageManager(), getPackageName(), activity)) continue;
            try {
                startActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED)
                    .setComponent(new ComponentName(getPackageName(), activity.name)));
                return;
            } catch (android.content.ActivityNotFoundException | SecurityException error) {
                android.util.Log.e("HushMessenger", "Messenger launcher is unavailable", error);
            }
        }
        feedback(text.get("open_help"), Toast.LENGTH_LONG);
    }

    /** One toast at a time, built on the app context so no destroyed page is kept alive. */
    private void feedback(String message, int length) {
        if (toast != null) toast.cancel();
        toast = Toast.makeText(getApplicationContext(), message, length);
        toast.show();
    }

    /** Framework Material themes draw the cursor and handles in teal; match the settings accent. */
    private void tintTextHandles(EditText field) {
        if (Build.VERSION.SDK_INT < 29) return;
        Drawable cursor = field.getTextCursorDrawable(), middle = field.getTextSelectHandle();
        Drawable left = field.getTextSelectHandleLeft(), right = field.getTextSelectHandleRight();
        if (cursor != null) field.setTextCursorDrawable(tinted(cursor));
        if (middle != null) field.setTextSelectHandle(tinted(middle));
        if (left != null) field.setTextSelectHandleLeft(tinted(left));
        if (right != null) field.setTextSelectHandleRight(tinted(right));
    }

    private Drawable tinted(Drawable drawable) {
        Drawable copy = drawable.mutate();
        copy.setTint(ui.accent);
        return copy;
    }
}
