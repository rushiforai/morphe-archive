package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Dialog;
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
import android.view.Gravity;
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
import android.util.TypedValue;
import android.text.TextWatcher;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Locale;
import java.util.Set;

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
        if (key == null || "paused".equals(key) || Settings.SUB_SWITCHES.containsKey(key) || Settings.installed.contains(key))
            documentGeneration++;
        refreshChoices();
        if (key == null || "check_updates".equals(key)) syncUpdateChoice(true);
    };
    private String page = "controls";
    private final List<View> controlRows = new ArrayList<>();
    private final List<String[]> installedControls = new ArrayList<>();
    private final List<LinearLayout> groups = new ArrayList<>();
    private final List<Button> tabs = new ArrayList<>();
    /**
     * HushFacebook's accordion: every section starts closed, and the ones a person opens stay open, a restart included.
     * Kept in a store of its own, so opening one isn't a settings change and never reaches a backup.
     */
    static final String SECTIONS_STORE = "hushmessenger_sections", OPEN_SECTIONS = "open";
    /** A section to open on arrival, for a link or a check that has to reach a row inside it. */
    static final String OPEN_EXTRA = "app.hushmessenger.open";
    private final Set<String> openSections = new java.util.LinkedHashSet<>();
    /** Each section's header row and body, by id. */
    private final Map<String, LinearLayout[]> sections = new java.util.LinkedHashMap<>();
    /** True while a search is typed: a Controls section with a match shows it, open or not. */
    private boolean searching;
    private final Set<String> searchClosed = new java.util.HashSet<>();
    private TextView searchStatus, enabledCount, setupNote;
    private Button safeModeAction, clearQuery;
    private Button drawerSearchLink;
    private TextView updateStatus;
    private Button updateCheckNow, updateRelease;
    private volatile long updateGeneration;
    private java.net.HttpURLConnection updateConnection;
    private LinearLayout emptyState;
    /** Shown above both pages while a change waits for Messenger to restart. */
    private LinearLayout restartRow;
    private TextView restartWaiting;
    /** Shown above both pages for a few seconds after a Quick setup or Clear log, which act at once with no dialog. */
    private Button undoButton;
    /** What Undo does and when its time runs out. Main thread only, null when nothing can be taken back. */
    private Runnable undoAction, undoExpiry;
    /** While Undo can still put back the log a Clear took, the log's empty page shows an Undo too. */
    private boolean messageLogUndo;
    /** Between onStart and onStop. A Clear that finishes while settings are out of sight is final at once. */
    private boolean started;
    static final int UNDO_MILLIS = 10_000;
    static final int SAVE_CHOICES = 7101, READ_CHOICES = 7102, PICK_FONT = 7103, PICK_AUTO_REPLY_PICTURE = 7104;
    /** The names providers give fonts, and plain bytes for one that doesn't know a font. The copy checks what it really is. */
    static final String[] FONT_TYPES = {"font/ttf", "font/otf", "font/collection", "font/sfnt", "application/x-font-ttf",
        "application/x-font-otf", "application/font-sfnt", "application/vnd.ms-opentype", "application/octet-stream"};
    static final int MAX_FONT_NAME = 80;
    /** The font copy running now, if any. Process-wide, like the page that shows it, which the theme switch can recreate. */
    private static volatile FontJob fontJob;
    /** A provider that never answers leaves its copy's thread waiting, so at most two ever wait at once. */
    private static final java.util.concurrent.Semaphore fontSlots = new java.util.concurrent.Semaphore(2);
    static int fontTimeoutMillis = 60_000;
    /** Size, move and phone font saves, off the main thread and one at a time, so each tap starts from the one before. */
    static final java.util.concurrent.ExecutorService FONT_WRITES = java.util.concurrent.Executors.newSingleThreadExecutor(work -> {
        Thread thread = new Thread(work, "HushMessengerFontSave");
        thread.setDaemon(true);
        return thread;
    });
    /**
     * Saves tapped and not yet back on the main thread, how many of them put the phone's font back, and what the latest
     * finished one had to say. Main thread only.
     */
    private static int fontWrites, phoneFontWrites;
    private static String fontWriteMessage;
    private static java.lang.ref.WeakReference<SettingsActivity> fontPage = new java.lang.ref.WeakReference<>(null);
    private TextView fontStatus, fontSize, fontShift;
    private Button fontChoose, fontStop, fontPhone, fontSmaller, fontLarger, fontUp, fontDown;
    private LinearLayout fontAdjust;
    /**
     * The switch for each way back in (#22, HushFacebook#146), and the help and reason each was built with. Turning one
     * way off can change what the others say or whether they can turn off, so they're rebuilt when that changes.
     */
    private final Map<String, LinearLayout> wayControls = new java.util.LinkedHashMap<>();
    private final Map<String, String> wayBuilt = new java.util.HashMap<>();
    /** The Quick setups heading and panel, hidden by a long press on either, and the line that says which way the choice is. */
    private TextView quickHomeStatus;
    /** The Quick setups card, and the section around it that a long press hides. */
    private LinearLayout quickPanel, quickSection;
    /** The App tab's line on how to get back here, which names the Menu row only while it shows. */
    private TextView accessHelp;
    private String accessHelpId;
    private boolean accessHelpMenuRow;
    private String documentExport;
    private boolean documentImport;
    private boolean documentBusy;
    private Button saveChoicesFile, readChoicesFile;
    private Button cancelChoicesFile;
    private TextView documentStatus;
    /** The whole restore result. The toast holds only its first part, since Android 12+ cuts a toast after two lines. */
    private TextView restoreStatus;
    private DocumentJob documentJob;
    static int documentTimeoutMillis = 30_000;
    private static final java.util.concurrent.Semaphore documentSlots = new java.util.concurrent.Semaphore(2);
    // Process-wide so a page recreated by the theme switch can still replace the last toast.
    private static Toast toast;
    static final String SUPPORT_PAGE = "https://ko-fi.com/X8K126YVER";
    /** Switches whose effect hasn't been confirmed on a phone. Each shows the Experimental badge. */
    /** The switches that take a way into these settings away, each with a reason when it can't turn on. */
    static final Set<String> WAYS_IN = Set.of("hide_menu_row", Settings.HIDE_ICON_SHORTCUTS, Settings.HIDE_LOGO_PRESS);
    static final Set<String> EXPERIMENTAL = Set.of("pinned_chats", "nearby_scans", "phone_id_sync", "mark_read_button", "story_hold", "quiet_calls");
    static final String[][] CONTROLS = {
        {"people", "Hide People You May Know", "Hides suggested people in chats, search and stories, and on the People and Notifications tabs. Good if you only want people you know.", "inbox"},
        {"friend_requests", "Hide friend request cards", "Hides friend request cards in your chat list. It doesn't accept or decline anyone.", "inbox"},
        {"community_inbox", "Hide joined community chats", "Hides joined community chats from your main chat list. Search and community folders still show them. The list updates the next time it refreshes.", "inbox"},
        {"growth", "Hide growth prompts", "Hides prompts to add more people, tip sheets in notes like Make my notes public, and the Share your own story card.", "inbox"},
        {"inbox_promotions", "Hide inbox promotions", "Hides promotion banners in your chat list.", "inbox"},
        {"stories", "Hide stories and notes", "Hides the row of stories and notes above your chats.", "inbox"},
        {"subtabs", "Hide inbox tabs", "Hides the Home and Channels tabs inside your inbox.", "inbox"},
        {"mark_read_action", "Hide Mark as read", "Hides Mark as read in the menu you get when you press and hold a chat in your chat list, so you can't mark a chat read by accident. Mark as unread stays.", "inbox"},
        {"pinned_chats", "Pin more chats", "Raises Messenger's limit of three pinned chats to 20, so you can keep more chats at the top of your chat list. Messenger's servers can still stop you sooner.", "inbox"},
        {"facebook", "Hide Facebook shortcuts", "Hides Facebook buttons, profile and sharing shortcuts, and the Also from Meta and Subscriptions sections in the Menu tab. Handy if you only use Messenger.", "navigation"},
        {"meta_ai", "Hide Meta AI", "Hides the Meta AI floating button, toolbar button, tab and menu entries, plus AI in search and in @ suggestions. Restart Messenger to see the tab go.", "navigation"},
        {"moments", "Hide Chat Moments", "Hides Chat Moments in the menu.", "navigation"},
        {"reels_badge", "Hide Reels badge", "Hides the Reels notification badge.", "navigation"},
        {"tab_people", "Hide People tab", "Hides the People tab in the bar at the bottom. Restart Messenger to see the tab go.", "navigation"},
        {"tab_badges", "Hide tab badges", "Hides the red dots and counts on the tabs at the bottom and on the Facebook button at the top. Turn on Keep for any you still want. Restart Messenger to see the change.", "navigation"},
        {"tab_notifications", "Hide Notifications tab", "Hides the Notifications tab in the bar at the bottom. Restart Messenger to see the tab go.", "navigation"},
        {"chat_animation", "Slide chats in and out", "Slides a chat in from the side when you open it and out when you go back. Chat heads and bubbles aren't affected.", "navigation"},
        {"story_hold", "Hold stories at the end", "Keeps a story on screen when it ends instead of moving on to the next one, so you go on with a tap or a swipe. Photos and videos both wait, and the last story stays open until you close it.", "navigation"},
        {"ai_stickers", "Hide AI sticker tools", "Hides the Generate and Generate AI sticker buttons, the AI sticker tab and AI sticker suggestions. Custom and music stickers in the Generate menu go with it.", "stickers"},
        {"avatar_stickers", "Hide avatar stickers", "Hides the avatar tab in the sticker keyboard.", "stickers"},
        {"emoji_drawer", "Restore old emoji drawer", "Brings back the earlier emoji keyboard layout by turning off Meta's redesign. Restart Messenger to see the change. Nothing changes if you never got the redesign.", "stickers"},
        {"emoji_search", "Keep emoji search on emoji", "Typing while the emoji keyboard is open no longer jumps to sticker search. The keyboard stays on emoji.", "stickers"},
        {"chat_promotions", "Hide chat promotions", "Hides promotion banners inside conversations.", "conversations"},
        {"ad_context_banner", "Hide ad banners in business chats", "In a chat you started from a business's ad, hides the banner that shows that ad.", "conversations"},
        {"suggested_replies", "Hide business reply suggestions", "Hides suggested replies in conversations with businesses.", "conversations"},
        {"business_suggestions", "Hide business typing suggestions", "Hides business suggestions that pop up as you type.", "conversations"},
        {"event_prompts", "Hide event prompts", "Hides event promotion prompts inside chats.", "conversations"},
        {"typing", "Hide typing indicator", "Stops Messenger from showing others when you're typing, even in end-to-end encrypted chats.", "conversations"},
        {"use_system_emoji", "Use system emoji", "Shows emoji in your phone's own style instead of Messenger's built-in set.", "conversations"},
        {"disappearing_swipe", "Ignore the swipe up for disappearing messages", "Swiping up at the bottom of a chat no longer turns on disappearing messages. Scrolling works as usual, and you can still set them in the chat's settings.", "conversations"},
        {"auto_reply", "Auto reply", "Answers a message with a reply you write below when it has words you pick, or any message if you leave the words empty. Replies go out through Messenger's own notification reply, encrypted chats too, at most once every five minutes per chat. One-to-one chats only unless you allow groups. A chat with disappearing messages on gets no notification reply from Messenger, so it isn't answered.", "conversations"},
        {"text_style", "Bold and italic text", "Select words you typed and pick Bold or Italic in the menu that pops up (it can be behind the three dots). Pick it again to undo. Bold changes the letters A to Z (accents are fine) and digits. Italic changes only the letters, and other alphabets stay as they are. They're special Unicode letters, so they show on any phone, but screen readers may read them oddly.", "conversations"},
        {"quiet_calls", "Quiet incoming calls", "Calls still come in, but Messenger doesn't ring, vibrate or pop the call up over your screen. The call waits in the notification shade with Answer and Decline. A call you miss still shows in the chat. If the Facebook app is on your phone, it can still ring for the same call.", "conversations"},
        {"original_photo", "Send photos at original quality", "With HD on, sends JPEG photos at their full size, not a smaller copy. Location is still removed. Photos over 20 MB are still made smaller.", "photos_videos"},
        {"original_video", "Send videos without re-encoding", "Sends a video as the original file when Messenger allows it, instead of a recompressed copy. Videos over 25 MB and edited videos are still compressed.", "photos_videos"},
        {"xhe_audio", "Fix videos that won't send", "Some videos fail with \"Unable to send\", even in stock Messenger, because of a newer sound format (xHE-AAC) or a tag Samsung's screen recorder adds. This fixes the sound or drops the tag before the video goes out, whether you share it into Messenger or pick it in a chat. The picture isn't touched.", "photos_videos"},
        {"recent_media", "Hide the recent photo card", "Opening a chat right after you take a screenshot, photo or video no longer shows a card above the message box offering to send it. You can still pick it from the gallery.", "photos_videos"},
        {"share_story", "Hide Your story when sharing", "When you share a photo, video or link into Messenger from another app, the Send to list no longer offers Your story, so a tap on Add can't post it by mistake. Your chats and groups are still there.", "photos_videos"},
        {"system_camera", "Use the phone's camera app", "The camera button in a chat opens your phone's camera app. The photo opens in Messenger's editor, ready to send. Photos only.", "photos_videos"},
        {"external_gallery", "Open your gallery app", "The gallery button in a chat opens your phone's own gallery app. One photo or video opens in Messenger's editor for that chat, ready to send. Pick several and Messenger's Send to sheet opens with all of them and that chat at the top.", "photos_videos"},
        {"external_browser", "Open web links externally", "Opens web links (http and https) in your default browser. Other link types work as before.", "links_bubbles"},
        {"bubbles", "Allow chat bubbles", "Choose Stock, Chat heads or Android bubbles below. Android bubbles need Android 11 or newer, a supported account and notification permission. Restart Messenger after changing.", "links_bubbles"},
        {"analytics_uploads", "Stop analytics uploads", "Stops Messenger's background services from uploading usage statistics. It still records them on your phone, and they can upload after you turn this off.", "privacy"},
        {"attribution_uploads", "Stop ad attribution uploads", "Stops the job that reads your phone's advertising ID and sends it to Meta with your ad tracking setting. The ID itself doesn't change.", "privacy"},
        {"ad_events", "Stop inbox and ad link logging", "Stops two reports Messenger logs. One says which part of your chat list was on screen, which Messenger files under inbox ads. The other says which ad brought you in when a link from an ad opens a chat.", "privacy"},
        {"mqtt_telemetry", "Stop live connection logging", "Drops the health reports and push logging Messenger sends over its live connection (MQTT). Messenger sends most of its traffic another way, so there's often little for it to drop. Messages, calls and active status keep working.", "privacy"},
        {"nearby_scans", "Stop nearby scans", "Stops Messenger from reading the list of Wi-Fi networks around you, and hides the name and hardware address of the one you're connected to, the way Android does when Messenger can't see your location. Also stops the timer it can run while it's open to check your location and scan for Wi-Fi networks and Bluetooth devices.", "privacy"},
        {"phone_id_sync", "Stop app list and device ID sharing", "Stops Messenger from going through the apps on your phone to find other Meta apps, and from asking them for the device ID Meta uses to link the apps on one phone. Messenger keeps the ID it already has.", "privacy"},
        {"message_log", "Keep a message log", "Saves each message when its notification arrives, so you can read it after it's unsent. Works in encrypted chats. Stays on your phone. In a chat with disappearing messages on, Messenger leaves the words out of its notification, so those messages aren't logged.", "privacy"},
        {"allow_screenshot", "Allow screenshots", "Lets you screenshot protected chat media, such as view-once photos and Quicksnap, and stops screenshot notices. It doesn't add replay or saving.", "privacy"},
        {"hide_read_receipts", "Hide read receipts", "Opening a chat no longer tells people you read their message, and the chat stays unread here. Marking it read yourself or replying marks it read and shows Seen, like Messenger does. Group chats aren't tested. Messenger's own Read receipts setting under Privacy & safety marks chats read without Seen.", "privacy"},
        {"mark_read_button", "Mark as read button", "Puts Messenger's Mark as read icon in a chat's top bar while Hide read receipts is on. Opening the chat still sends nothing. Tap the icon when you want the sender to see Seen, and the chat turns read here too. It takes the place of the chat details button (tapping the chat's name opens the same page), so the call buttons stay put.", "privacy"},
        {"keep_unsent", "Keep unsent messages", "Keeps messages on screen after someone unsends them, in chats where it works. Encrypted chats aren't supported and group chats aren't tested. Your own unsends may be limited.", "privacy"},
        {"anonymous_stories", "View stories anonymously", "Opens other people's stories without adding you to their viewer list. Messenger still marks them as seen on your side.", "privacy"},
        {"save_stories", "Save any story", "Adds Save to the More options menu on other people's stories, so you can keep the photo or video on your phone.", "privacy"},
        {"material_you", "Material You theme", "Colors Messenger's dark mode with your wallpaper colors on Android 12 and newer, and a fixed blue on Android 11. Turn on dark mode in Messenger first.", "theme"},
        {"app_icons", "Unlock app icons", "Lets you pick any icon in Messenger's App icon setting without a subscription. Messenger decides whether that setting shows for you. Turning this off can bring the default icon back.", "theme"},
        {"custom_font", "Use your own font", "Shows Messenger's text in your phone's font instead of Meta's, or in a .ttf or .otf font file you choose below, which you can also make larger or smaller and move up or down. Emoji don't change. Restart Messenger to see a change.", "theme"},
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
            restoreControlsScroll = state.getInt("controls_scroll");
            restoreAppScroll = state.getInt("app_scroll");
        } else {
            // Reopened after a restart asked for here: back on the page it was asked from.
            page = SettingsReopen.page(getIntent().getStringExtra(SettingsReopen.EXTRA));
        }
        String saved = sectionStore().getString(OPEN_SECTIONS, "");
        for (String id : saved.split(",")) if (!id.isEmpty()) openSections.add(id);
        String asked = getIntent().getStringExtra(OPEN_EXTRA);
        if (state == null && asked != null && !asked.isEmpty() && openSections.add(asked)) saveSections();
        // What Messenger read as it started, as near as settings can tell, so the restart row knows what changed since.
        RestartWaiting.baseline(Settings.preferences, readAtStart());
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
                if (!search.hasFocus() || !search.isShown()) return;
                // From the search row down a whole page, so its filters and first matches show above the keyboard too.
                View row = (View) search.getParent();
                int viewport = controlsScroll.getHeight() - controlsScroll.getPaddingTop() - controlsScroll.getPaddingBottom();
                row.requestRectangleOnScreen(new Rect(0, 0, row.getWidth(), Math.max(row.getHeight(), viewport)), false);
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
        reminder.setPadding(ui.dp(16), ui.dp(12), ui.dp(16), ui.dp(32));
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
            Bundle draft = state.getBundle("auto_reply_draft");
            // The picker's answer arrives before the posted sheet is back, so the card it's for is known now.
            if (draft != null) {
                autoReplyPictureFor = draft.getInt("picture_for", -1);
                autoReplyPictureId = draft.getString("picture_for_id");
            }
            messageLogClearFailed = state.getBoolean("message_log_clear_failed");
            if (draft != null) root.post(() -> showAutoReplies(draft));
            else if (state.getBoolean("message_log_open")) root.post(this::showMessageLog);
        }
        Object retained = getLastNonConfigurationInstance();
        if (retained instanceof MessageLogClearJob) {
            messageLogClearJob = (MessageLogClearJob) retained;
            messageLogClearJob.owner = new java.lang.ref.WeakReference<>(this);
            if (messageLogClearJob.finished) {
                messageLogClearFailed = !messageLogClearJob.cleared;
                root.post(() -> messageLogCleared(messageLogClearJob));
            }
        }
    }

    @Override public Object onRetainNonConfigurationInstance() { return messageLogClearJob; }

    @Override protected void onStart() {
        super.onStart();
        started = true;
        Settings.preferences.registerOnSharedPreferenceChangeListener(preferenceListener);
    }

    @Override protected void onResume() {
        super.onResume();
        refreshChoices();
        syncUpdateChoice(false);
    }

    @Override protected void onStop() {
        // Leaving settings makes a Quick setup or a Clear final, one still running included.
        started = false;
        if (messageLogClearJob != null) messageLogClearJob.undoable = false;
        endUndo();
        Settings.preferences.unregisterOnSharedPreferenceChangeListener(preferenceListener);
        super.onStop();
    }

    @Override protected void onDestroy() {
        invalidateAutoReplyImports();
        if (autoReplyDialog != null) autoReplyDialog.dismiss();
        if (messageLogDialog != null) messageLogDialog.dismiss();
        if (messageLogClearJob != null && messageLogClearJob.owner.get() == this) messageLogClearJob.owner.clear();
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

    /** Kept in the settings file like the other choices, but not a control: backups and Quick setups never carry it. */
    static final String HIDE_QUICK_SETUPS = "hide_quick_setups";

    private static boolean quickSetupsHidden() { return Settings.preferences.getBoolean(HIDE_QUICK_SETUPS, false); }

    /** Shows or hides the Quick setups section to match the saved choice, and words the restore button's line. */
    private void showQuickSetups() {
        int shown = quickSetupsHidden() ? View.GONE : View.VISIBLE;
        if (quickSection != null) quickSection.setVisibility(shown);
        if (quickHomeStatus != null) quickHomeStatus.setText(text.get(quickSetupsHidden() ? "quick_setups_home_hidden" : "quick_setups_home_shown"));
    }

    private void holdToHide(View view) {
        view.setOnLongClickListener(held -> {
            Settings.preferences.edit().putBoolean(HIDE_QUICK_SETUPS, true).apply();
            showQuickSetups();
            // The section is hidden from the App tab, so the toast names the button on this tab that brings it back.
            feedback(text.get("quick_setups_hidden", text.format("quick_setups_home"), text.format("choices")), Toast.LENGTH_LONG);
            return true;
        });
    }

    /** The help a way's switch shows, which names only the ways back that are still on. */
    private String wayHelp(String key) {
        if (!"hide_menu_row".equals(key)) return key + "_help";
        if (!Settings.iconShortcutsShown(this)) return Settings.logoPressOn() ? "hide_menu_row_help_without_shortcut" : "hide_menu_row_help_plain";
        return Settings.logoPressOn() ? "hide_menu_row_help" : "hide_menu_row_help_without_logo";
    }

    /** Why a way's switch can't turn on, or null when it can. */
    private String wayReason(String key) {
        if (Settings.available(key)) return null;
        if (!"hide_menu_row".equals(key)) return "last_way_in";
        if (Settings.iconShortcutsShown(this)) return "menu_row_needs_shortcut";
        return Settings.logoPressOn() ? "menu_row_needs_logo" : "menu_row_needs_way";
    }

    private LinearLayout wayControl(String key) {
        String help = wayHelp(key);
        wayBuilt.put(key, help + "|" + wayReason(key));
        LinearLayout row = controlRow(key, text.format(key), text.format(help), false);
        wayControls.put(key, row);
        return row;
    }

    /** Swaps each way's switch whose help or reason has changed for one built with the current ones. */
    private void rebuildWayControls() {
        for (String key : new ArrayList<>(wayControls.keySet())) {
            LinearLayout old = wayControls.get(key);
            LinearLayout parent = (LinearLayout) old.getParent();
            if (parent == null || (wayHelp(key) + "|" + wayReason(key)).equals(wayBuilt.get(key))) continue;
            switches.remove(old.findViewWithTag(key));
            int at = parent.indexOfChild(old);
            ViewGroup.LayoutParams params = old.getLayoutParams();
            LinearLayout row = wayControl(key);
            parent.removeViewAt(at);
            parent.addView(row, at, params);
        }
    }

    private String accessHelpText() {
        // The Menu row patch also makes the Messenger logo open settings where it finds the logo's handler, and that keeps
        // working while the row is hidden, unless its own switch turns it off.
        boolean logo = Settings.logoPressOn();
        boolean menuRow = accessHelpMenuRow && !Settings.menuRowHidden();
        if (!Settings.iconShortcutsShown(this)) {
            StringBuilder ways = new StringBuilder();
            if (menuRow) ways.append(text.get("way_menu")).append(' ');
            if (logo) ways.append(text.get("way_logo")).append(' ');
            if (Settings.drawerIconShown(this)) ways.append(text.get("way_drawer")).append(' ');
            return ways.append(text.get("way_shortcuts_hidden")).toString();
        }
        if (!accessHelpMenuRow) return text.get(accessHelpId);
        if (!menuRow) return text.get(accessHelpId + (logo ? "_logo" : ""));
        return text.get(accessHelpId + (logo ? "_menu" : "_menu_without_logo"));
    }

    private void refreshChoices() {
        if (lightTheme != Settings.preferences.getBoolean("light", false)) {
            if (!recreatingTheme) {
                recreatingTheme = true;
                recreate();
            }
            return;
        }
        // Opening settings from the long-press shortcut can bring this screen back rather than a new one, and turning one
        // way in off changes what the others can do.
        rebuildWayControls();
        if (accessHelp != null) {
            String help = accessHelpText();
            if (!help.contentEquals(accessHelp.getText())) accessHelp.setText(help);
        }
        binding = true;
        try {
            for (Switch control : switches) {
                control.setChecked(Settings.preferences.getBoolean((String) control.getTag(), false));
                refreshStatus(control);
            }
            for (RadioButton mode : bubbleModes) mode.setChecked(mode.getTag().equals("bubble_" + Settings.selectedBubbleMode()));
        } finally { binding = false; }
        refreshFontFile();
        updateSetup();
    }

    private void adaptToHeight(int height) {
        if (header == null || reminder == null || appContent == null || height <= 0) return;
        float fontScale = Math.max(1f, getResources().getConfiguration().fontScale);
        boolean next = height < ui.dp(Math.round(480 * fontScale));
        // Let focused content use the full viewport when the keyboard leaves little room.
        boolean nextScrollHeader = height < ui.dp(Math.round(160 * fontScale));
        if (compact == next && scrollHeader == nextScrollHeader) return;
        compact = next;
        scrollHeader = nextScrollHeader;
        // Content pages already pad 16dp, so a header or reminder moved inside them adds none.
        header.setPadding(ui.dp(scrollHeader ? 0 : 16), ui.dp(compact ? 4 : 8), ui.dp(scrollHeader ? 0 : 16), 0);
        placeBrand();
        placeHeader();
        ((ViewGroup) reminder.getParent()).removeView(reminder);
        reminder.setPadding(ui.dp(compact ? 0 : 16), ui.dp(12), ui.dp(compact ? 0 : 16), ui.dp(compact ? 16 : 32));
        ui.add(compact ? controlsContent : controlsPage, reminder, 0);
    }

    private void placeBrand() {
        if (brand == null || appContent == null) return;
        LinearLayout parent = compact ? ("app".equals(page) ? appContent : controlsContent) : header;
        if (brand.getParent() == parent) return;
        ((ViewGroup) brand.getParent()).removeView(brand);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.bottomMargin = ui.dp(compact ? 12 : 0);
        parent.addView(brand, 0, params);
    }

    private void placeHeader() {
        LinearLayout parent = scrollHeader ? ("app".equals(page) ? appContent : controlsContent) : (LinearLayout) controlsPage.getParent();
        if (header.getParent() == parent) return;
        ((ViewGroup) header.getParent()).removeView(header);
        parent.addView(header, 0, new LinearLayout.LayoutParams(-1, -2));
    }

    private void buildHeader(LinearLayout root) {
        // A toolbar, like HushFacebook's: the name, Open and the two tabs, with no banner above the settings.
        header = ui.column();
        header.setPadding(ui.dp(16), ui.dp(8), ui.dp(16), 0);
        ui.add(root, header, 0);
        brand = ui.row();
        if (ui.largeText) brand.setOrientation(LinearLayout.VERTICAL);
        LinearLayout wordmark = ui.column();
        TextView title = ui.title("HushMessenger", 20);
        title.setTag("wordmark");
        title.setAccessibilityHeading(true);
        // Linear font scaling on Android 13 and older could otherwise split the wordmark mid-word.
        title.setMaxLines(1);
        title.setAutoSizeTextTypeUniformWithConfiguration(14, 20, 1, TypedValue.COMPLEX_UNIT_SP);
        ui.add(wordmark, title, 0);
        // Only a preview build says anything under the name, since that's a warning.
        if (Settings.preview) {
            TextView notice = ui.text(text.get("preview_notice"), 13, ui.warning, false);
            notice.setTag("preview_notice");
            ui.add(wordmark, notice, 4);
        }
        brand.addView(wordmark, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        Button open = ui.button(text.get("open"));
        open.setTag("open_messenger");
        open.setContentDescription(text.get("open_messenger"));
        open.setBackground(new android.graphics.drawable.InsetDrawable(ui.interactive(ui.background, ui.accent, 12), 0, ui.dp(6), 0, ui.dp(6)));
        open.setPadding(ui.dp(12), ui.dp(6), ui.dp(12), ui.dp(6));
        open.setOnClickListener(view -> openMessenger());
        LinearLayout.LayoutParams openParams = new LinearLayout.LayoutParams(ui.largeText ? -2 : ui.dp(68), -2);
        openParams.setMarginStart(ui.dp(ui.largeText ? 0 : 12));
        openParams.topMargin = ui.dp(ui.largeText ? 8 : 0);
        brand.addView(open, openParams);
        ui.add(header, brand, 0);
        LinearLayout navigation = ui.row();
        navigation.setPadding(ui.dp(3), ui.dp(3), ui.dp(3), ui.dp(3));
        navigation.setBackground(ui.shape(ui.surface, ui.line, 12));
        for (String name : new String[] {"controls", "app"}) {
            Button button = ui.button(text.get(name));
            button.setTag("tab_" + name);
            button.setTextSize(15);
            button.setOnClickListener(view -> showPage(name));
            tabs.add(button);
            navigation.addView(button, new LinearLayout.LayoutParams(0, -2, 1));
        }
        ui.add(header, navigation, 8);
        // In the header, so it shows on both pages the moment a restart-gated change is made, with the button right there.
        restartRow = ui.row();
        restartRow.setTag("restart_row");
        restartRow.setGravity(Gravity.CENTER_VERTICAL);
        if (ui.largeText) restartRow.setOrientation(LinearLayout.VERTICAL);
        restartRow.setPadding(ui.dp(14), ui.dp(10), ui.dp(10), ui.dp(10));
        restartRow.setBackground(ui.shape(ui.warningSurface, 0, 12));
        restartWaiting = ui.text("", 14, ui.warning, true);
        restartWaiting.setTag("restart_waiting");
        restartWaiting.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        restartRow.addView(restartWaiting, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        Button restartNow = ui.primaryButton(text.get("restart"));
        restartNow.setTag("restart_now");
        restartNow.setOnClickListener(view -> HostScreens.restartInto(this, page));
        LinearLayout.LayoutParams restartParams = new LinearLayout.LayoutParams(-2, -2);
        restartParams.setMarginStart(ui.dp(ui.largeText ? 0 : 12));
        restartParams.topMargin = ui.dp(ui.largeText ? 8 : 0);
        restartRow.addView(restartNow, restartParams);
        restartRow.setVisibility(View.GONE);
        ui.add(header, restartRow, 8);
        undoButton = ui.button("");
        undoButton.setTag("undo");
        undoButton.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        undoButton.setOnClickListener(view -> undo());
        undoButton.setVisibility(View.GONE);
        ui.add(header, undoButton, 8);
    }

    /** Shows Undo for [what] until it's tapped, its time runs out, something else takes its place or settings close. */
    private void offerUndo(String what, Runnable action) {
        endUndo();
        undoAction = action;
        undoButton.setText(text.get("undo_action", what));
        undoButton.setVisibility(View.VISIBLE);
        long millis = UNDO_MILLIS;
        // TalkBack and Switch Access users can ask for longer, and this timeout takes a button away.
        android.view.accessibility.AccessibilityManager access = getSystemService(android.view.accessibility.AccessibilityManager.class);
        if (Build.VERSION.SDK_INT >= 29 && access != null) millis = access.getRecommendedTimeoutMillis(UNDO_MILLIS,
            android.view.accessibility.AccessibilityManager.FLAG_CONTENT_TEXT | android.view.accessibility.AccessibilityManager.FLAG_CONTENT_CONTROLS);
        undoExpiry = this::endUndo;
        undoButton.postDelayed(undoExpiry, millis);
    }

    private void undo() {
        Runnable action = undoAction;
        // The log's page shows what the undo brings back once it's written, not an empty page in between.
        messageLogUndo = false;
        View sheetUndo = messageLogList == null ? null : messageLogList.findViewWithTag("message_log_undo");
        if (sheetUndo != null) sheetUndo.setEnabled(false);
        endUndo();
        if (action != null) action.run();
    }

    /** Lets go of what Undo held, so the change stands, and hides the button. */
    private void endUndo() {
        if (undoExpiry != null) undoButton.removeCallbacks(undoExpiry);
        undoExpiry = null;
        undoAction = null;
        if (undoButton != null) undoButton.setVisibility(View.GONE);
        if (messageLogUndo) {
            messageLogUndo = false;
            if (messageLogList != null) loadMessageLog();
        }
    }

    /**
     * Choices Messenger reads only as it starts, as they'd apply now: Pause, safe mode and a phone that can't run bubbles
     * count as Stock. Font choices count only while the font is in use.
     */
    private java.util.Map<String, Object> readAtStart() {
        java.util.Map<String, Object> values = new java.util.LinkedHashMap<>();
        SharedPreferences prefs = Settings.preferences;
        if (Settings.installed.contains("bubbles")) values.put("bubbles",
            Settings.available("bubbles") && Settings.wouldUse("bubbles") ? Settings.selectedBubbleMode() : "stock");
        if (Settings.installed.contains(OwnFont.KEY) && Settings.wouldUse(OwnFont.KEY)) {
            // The copy's size and time too, so a new file under the same name still counts.
            java.io.File copy = FontFile.file(this);
            values.put(OwnFont.NAME_KEY, prefs.getString(OwnFont.NAME_KEY, "") + "\n" + copy.length() + "\n" + copy.lastModified());
            values.put(OwnFont.SCALE_KEY, OwnFont.scale(prefs));
            values.put(OwnFont.SHIFT_KEY, OwnFont.shift(prefs));
        }
        return values;
    }

    private void updateRestartRow() {
        if (restartRow == null) return;
        List<String> keys = new ArrayList<>();
        for (String[] spec : installedControls) keys.add(spec[0]);
        int waiting = RestartWaiting.count(Settings.preferences, keys, readAtStart());
        restartRow.setVisibility(waiting > 0 ? View.VISIBLE : View.GONE);
        if (waiting > 0) {
            String line = text.count("restart_waiting", waiting);
            if (!line.contentEquals(restartWaiting.getText())) restartWaiting.setText(line);
        }
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
        content.setPadding(ui.dp(16), ui.dp(12), ui.dp(16), ui.dp(24));
        scroll.addView(content);
        return content;
    }

    private void buildControls(LinearLayout content) {
        // One small card: how many controls are on, and Pause.
        LinearLayout setup = ui.panel();
        setup.setPadding(ui.dp(14), ui.dp(10), ui.dp(14), ui.dp(2));
        enabledCount = ui.text("", 15, ui.text, true);
        enabledCount.setTag("enabled_count");
        ui.add(setup, enabledCount, 0);
        setupNote = ui.text("", 12, ui.muted, false);
        ui.add(setup, setupNote, 4);
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
        ui.rule(setup, 8);
        ui.add(setup, controlRow("paused", text.format("paused"), "", false), 0);
        ui.add(content, setup, 0);
        search = ui.field(text.get("search"), 100, true);
        search.setTag("find_control");
        search.setBackground(ui.interactive(ui.surface, ui.outline, 8));
        search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);
        search.setOnEditorActionListener((view, action, event) -> {
            if (action != android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH) return false;
            ((InputMethodManager) getSystemService(INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(search.getWindowToken(), 0);
            return true;
        });
        LinearLayout searchRow = ui.row();
        searchRow.addView(search, new LinearLayout.LayoutParams(0, -2, 1));
        clearQuery = ui.button(text.get("search_clear"));
        clearQuery.setTag("clear_query");
        clearQuery.setContentDescription(text.get("search_clear_description"));
        clearQuery.setOnClickListener(view -> { search.setText(""); search.requestFocus(); });
        LinearLayout.LayoutParams clearQueryParams = new LinearLayout.LayoutParams(-2, -2);
        clearQueryParams.setMarginStart(ui.dp(8));
        searchRow.addView(clearQuery, clearQueryParams);
        ui.add(content, searchRow, 10);
        searchStatus = ui.text("", 12, ui.muted, false);
        searchStatus.setTag("search_status");
        searchStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        ui.add(content, searchStatus, 6);
        drawerSearchLink = ui.button(text.get("drawer_search"));
        drawerSearchLink.setTag("find_drawer_icon");
        drawerSearchLink.setOnClickListener(view -> {
            // The drawer switches live in Quick access, so the link opens it on the way.
            if (openSections.add("quick_access")) {
                saveSections();
                bindSection("quick_access");
            }
            showPage("app");
        });
        ui.add(content, drawerSearchLink, 8);
        LinearLayout group = null;
        LinearLayout groupBody = null;
        String last = "";
        for (String[] spec : CONTROLS) {
            if (!Settings.installed.contains(spec[0])) continue;
            if (!last.equals(spec[3])) {
                last = spec[3];
                groupBody = ui.column();
                groupBody.setPadding(ui.dp(14), ui.dp(2), ui.dp(14), ui.dp(2));
                groupBody.setBackground(ui.shape(ui.surface, ui.line, 12));
                // Lines only between shown controls: none above the first, none over the card's own border under the last.
                android.graphics.drawable.GradientDrawable divider = ui.shape(ui.line, 0, 0);
                divider.setSize(1, ui.dp(1));
                groupBody.setDividerDrawable(divider);
                groupBody.setShowDividers(LinearLayout.SHOW_DIVIDER_MIDDLE);
                group = section(content, last, groupBody, groups.isEmpty() ? 12 : 8);
                groups.add(group);
            }
            LinearLayout row = controlRow(spec[0], text.control(spec, 1), text.control(spec, 2), true);
            if ("bubbles".equals(spec[0]) || "facebook".equals(spec[0]) || Settings.TAB_BADGES.equals(spec[0]) || OwnFont.KEY.equals(spec[0])
                    || MessageLog.KEY.equals(spec[0]) || AutoReply.KEY.equals(spec[0])) {
                // Below the row, where TalkBack reaches them: the row's label column hides its descendants.
                LinearLayout wrapper = ui.column();
                ui.add(wrapper, row, 0);
                if ("bubbles".equals(spec[0])) addBubbleModes(wrapper);
                else if ("facebook".equals(spec[0])) ui.add(wrapper, controlRow(Settings.KEEP_FACEBOOK_PROFILE,
                    text.format("facebook_keep_profile"), text.format("facebook_keep_profile_help"), false), 8);
                else if (Settings.TAB_BADGES.equals(spec[0])) {
                    for (String keep : Settings.KEEP_BADGES.values()) ui.add(wrapper, controlRow(keep, text.format(keep), "", false), 8);
                }
                else if (OwnFont.KEY.equals(spec[0])) addFontFile(wrapper);
                else if (AutoReply.KEY.equals(spec[0])) addAutoReplyActions(wrapper);
                else addMessageLogActions(wrapper);
                wrapper.setPadding(0, 0, 0, ui.dp(12));
                row = wrapper;
            }
            row.setTag(spec[3]);
            ui.add(groupBody, row, 0);
            controlRows.add(row);
            installedControls.add(spec);
        }
        if (installedControls.isEmpty()) {
            // Nothing to search; the status line explains how to add controls.
            search.setVisibility(View.GONE);
        }
        emptyState = ui.panel();
        emptyState.setTag("empty_state");
        TextView emptyTitle = ui.title(text.get("empty_title"), 18);
        emptyTitle.setTag("empty_title");
        ui.add(emptyState, emptyTitle, 0);
        ui.add(emptyState, ui.text(text.get("empty_help"), 14, ui.muted, false), 10);
        Button clearSearch = ui.button(text.get("clear"));
        clearSearch.setTag("clear_filters");
        clearSearch.setOnClickListener(view -> {
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
            choice.setTextColor(new android.content.res.ColorStateList(
                new int[][] {{-android.R.attr.state_enabled}, {}}, new int[] {ui.muted, ui.text}));
            choice.setTextSize(16);
            choice.setMinHeight(ui.dp(48));
            choice.setPadding(ui.dp(8), ui.dp(8), ui.dp(8), ui.dp(8));
            choice.setButtonTintList(new android.content.res.ColorStateList(
                new int[][] {{-android.R.attr.state_enabled}, {android.R.attr.state_checked}, {}}, new int[] {ui.outline, ui.accent, ui.muted}));
            choice.setBackground(ui.interactive(0, 0, 8));
            choice.setChecked(mode.equals(Settings.selectedBubbleMode()));
            choice.setEnabled(Settings.available("bubbles") || "stock".equals(mode));
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
        // An unavailable bundle already says so in the row's description.
        if (Settings.available("bubbles")) ui.add(content, ui.text(text.get("bubble_help"), 13, ui.muted, false), 8);
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

    /** The font file rows under Use your own font. Use your phone's font shows only while there's a file to go back from. */
    private void addFontFile(LinearLayout content) {
        fontPage = new java.lang.ref.WeakReference<>(this);
        fontStatus = ui.text("", 13, ui.muted, false);
        fontStatus.setTag("font_file_status");
        fontStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        ui.add(content, fontStatus, 8);
        fontChoose = ui.button(text.get("font_file_choose"));
        fontChoose.setTag("font_file");
        fontChoose.setOnClickListener(view -> pickFontFile());
        ui.add(content, fontChoose, 8);
        fontStop = ui.button(text.get("font_file_stop"));
        fontStop.setTag("font_file_stop");
        fontStop.setOnClickListener(view -> {
            FontJob job = fontJob;
            if (job != null) job.stop("font_file_stopped");
        });
        ui.add(content, fontStop, 8);
        fontPhone = ui.button(text.get("font_phone"));
        fontPhone.setTag("font_phone");
        fontPhone.setOnClickListener(view -> usePhoneFont());
        ui.add(content, fontPhone, 8);
        ui.add(content, ui.text(text.get("font_file_help"), 13, ui.muted, false), 8);
        // #48: size and place the picked file, for a font that draws small or sits high in a bubble.
        fontAdjust = new LinearLayout(this);
        fontAdjust.setTag("font_adjust");
        fontAdjust.setOrientation(LinearLayout.VERTICAL);
        fontSize = ui.text("", 14, ui.text, false);
        fontSize.setTag("font_size_value");
        fontSmaller = ui.button(text.get("font_size_smaller"));
        fontSmaller.setTag("font_size_smaller");
        fontSmaller.setOnClickListener(view -> stepFont(OwnFont.SCALE_KEY, -FontFile.SCALE_STEP));
        fontLarger = ui.button(text.get("font_size_larger"));
        fontLarger.setTag("font_size_larger");
        fontLarger.setOnClickListener(view -> stepFont(OwnFont.SCALE_KEY, FontFile.SCALE_STEP));
        fontAdjustRow(fontSize, fontSmaller, fontLarger);
        fontShift = ui.text("", 14, ui.text, false);
        fontShift.setTag("font_shift_value");
        fontUp = ui.button(text.get("font_shift_up_button"));
        fontUp.setTag("font_shift_up");
        fontUp.setOnClickListener(view -> stepFont(OwnFont.SHIFT_KEY, -FontFile.SHIFT_STEP));
        fontDown = ui.button(text.get("font_shift_down_button"));
        fontDown.setTag("font_shift_down");
        fontDown.setOnClickListener(view -> stepFont(OwnFont.SHIFT_KEY, FontFile.SHIFT_STEP));
        fontAdjustRow(fontShift, fontUp, fontDown);
        ui.add(fontAdjust, ui.text(text.get("font_adjust_help"), 13, ui.muted, false), 8);
        ui.add(content, fontAdjust, 4);
        refreshFontFile();
    }

    /** A value with its two step buttons beside it. The value says the change out loud as it happens. */
    private void fontAdjustRow(TextView value, Button less, Button more) {
        value.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        LinearLayout row = ui.row();
        if (ui.largeText) ui.add(fontAdjust, value, 16);
        else row.addView(value, new LinearLayout.LayoutParams(0, -2, 1));
        LinearLayout.LayoutParams first = new LinearLayout.LayoutParams(ui.largeText ? 0 : -2, -2, ui.largeText ? 1 : 0);
        row.addView(less, first);
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(first);
        gap.setMarginStart(ui.dp(8));
        if (!ui.largeText) first.setMarginStart(ui.dp(8));
        row.addView(more, new LinearLayout.LayoutParams(gap));
        ui.add(fontAdjust, row, 8);
    }

    /**
     * Moves the size or the text one step, held inside what the font file can take. The save waits its turn off the main
     * thread and starts from what the tap before it saved, so quick taps add up.
     */
    private void stepFont(String key, int step) {
        if (fontJob != null) return;
        SharedPreferences prefs = Settings.preferences;
        SettingsText words = text;
        writeFont(getApplicationContext(), () -> {
            boolean size = OwnFont.SCALE_KEY.equals(key);
            synchronized (FontFile.LOCK) {
                // The phone's font went back in first, so there's no picked file left to size.
                if (prefs.getString(OwnFont.NAME_KEY, "").isEmpty()) return null;
                int now = size ? OwnFont.scale(prefs) : OwnFont.shift(prefs);
                int next = size ? Math.max(FontFile.SCALE_LEAST, Math.min(FontFile.SCALE_MOST, now + step))
                    : Math.max(-FontFile.SHIFT_MOST, Math.min(FontFile.SHIFT_MOST, now + step));
                if (next == now) return null;
                if (!OwnFont.save(prefs, key, next)) throw new IllegalStateException("Not saved");
                return words.get("font_adjust_saved", size ? fontSizeText(words, next) : fontShiftText(words, next));
            }
        }, words.get("font_adjust_failed"), Toast.LENGTH_SHORT, false);
    }

    /**
     * Runs [save] on the font save thread and comes back to whichever page shows the rows then. [save] answers what to say,
     * or null for nothing, and a throw says [failed] at once. Otherwise only the last of a run of taps says its result.
     * [phone] marks the save that puts the phone's font back, which holds the size and move buttons until it's done.
     */
    private void writeFont(Context app, java.util.concurrent.Callable<String> save, String failed, int length, boolean phone) {
        fontWrites++;
        if (phone) phoneFontWrites++;
        refreshFontFile();
        android.os.Handler main = new android.os.Handler(android.os.Looper.getMainLooper());
        FONT_WRITES.execute(() -> {
            String message;
            boolean ok;
            try {
                message = save.call();
                ok = true;
            } catch (Exception | LinkageError error) {
                android.util.Log.w("HushMessenger", "Can't save the font choice: " + error.getClass().getSimpleName());
                message = failed;
                ok = false;
            }
            String said = message;
            boolean saved = ok;
            main.post(() -> {
                fontWrites--;
                if (phone) phoneFontWrites--;
                if (said != null) fontWriteMessage = said;
                SettingsActivity page = shownFontPage();
                if (page != null) page.refreshFontFile();
                if ((!saved || fontWrites == 0) && fontWriteMessage != null) {
                    sayFont(app, page, fontWriteMessage, length);
                    fontWriteMessage = null;
                }
            });
        });
    }

    private static String fontSizeText(SettingsText words, int scale) {
        return words.get("font_size", scale);
    }

    private static String fontShiftText(SettingsText words, int shift) {
        return shift == 0 ? words.get("font_shift_none") : words.get(shift > 0 ? "font_shift_down" : "font_shift_up", Math.abs(shift));
    }

    private void refreshFontFile() {
        // A new file under the old name saves nothing new, so no settings change calls refreshChoices.
        updateRestartRow();
        if (fontStatus == null) return;
        String name = Settings.preferences.getString(OwnFont.NAME_KEY, "");
        boolean copy = FontFile.file(this).isFile(), busy = fontJob != null, on = Settings.preferences.getBoolean(OwnFont.KEY, false);
        // A file swap waits for queued saves, and a queued phone font save would remove what it picked.
        boolean saving = fontWrites > 0, reverting = phoneFontWrites > 0;
        // Two stopped copies still waiting on their files hold both slots, so a third can't start until one gives up.
        boolean stuck = !busy && fontSlots.availablePermits() == 0;
        // With the switch off nothing here is in use yet, so the line says what turning it on would do.
        String status = busy ? text.get("font_file_copying")
            : name.isEmpty() ? text.get(on ? "font_file_none" : "font_file_none_off", FontFile.MAX_MEGABYTES)
            : !copy ? text.get("font_file_missing", name)
            : text.get(on ? "font_file_using" : "font_file_picked_off", name);
        // Stuck copies don't change which font is in use, so the line still says that first.
        if (stuck) status = status + " " + text.get("font_file_stuck");
        if (!status.contentEquals(fontStatus.getText())) fontStatus.setText(status);
        fontChoose.setEnabled(!busy && !saving && !stuck);
        fontStop.setVisibility(busy ? View.VISIBLE : View.GONE);
        fontPhone.setEnabled(!busy && !saving);
        // A copy no name points at still gets a way out.
        fontPhone.setVisibility(!name.isEmpty() || copy ? View.VISIBLE : View.GONE);
        // Sizing works on the picked file, so it shows only while there is one.
        fontAdjust.setVisibility(!name.isEmpty() && copy ? View.VISIBLE : View.GONE);
        SharedPreferences prefs = Settings.preferences;
        int scale = OwnFont.scale(prefs), shift = OwnFont.shift(prefs);
        String size = fontSizeText(text, scale), place = fontShiftText(text, shift);
        if (!size.contentEquals(fontSize.getText())) fontSize.setText(size);
        if (!place.contentEquals(fontShift.getText())) fontShift.setText(place);
        fontSmaller.setEnabled(!busy && !reverting && scale > FontFile.SCALE_LEAST);
        fontLarger.setEnabled(!busy && !reverting && scale < FontFile.SCALE_MOST);
        fontUp.setEnabled(!busy && !reverting && shift > -FontFile.SHIFT_MOST);
        fontDown.setEnabled(!busy && !reverting && shift < FontFile.SHIFT_MOST);
    }

    private void pickFontFile() {
        if (fontJob != null || fontWrites > 0) return;
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*")
            .putExtra(Intent.EXTRA_MIME_TYPES, FONT_TYPES);
        try { startActivityForResult(picker, PICK_FONT); }
        catch (android.content.ActivityNotFoundException missing) { feedback(text.get("font_file_no_picker"), Toast.LENGTH_LONG); }
        catch (RuntimeException error) { feedback(text.get("font_file_picker_failed"), Toast.LENGTH_LONG); }
    }

    /** Copies the picked file in on a worker. The saved name changes only once the copy has passed its checks. */
    private void copyFontFile(android.net.Uri uri) {
        // A stuck copy can't be ended from here, only left behind, so a third waits until one of two gives up.
        if (fontJob != null || fontWrites > 0 || !fontSlots.tryAcquire()) {
            feedback(text.get("font_file_busy"), Toast.LENGTH_LONG);
            return;
        }
        FontJob job = new FontJob(getApplicationContext(), Settings.preferences, uri, text);
        fontJob = job;
        refreshFontFile();
        job.handler.postDelayed(job.deadline, Math.max(1, fontTimeoutMillis));
        try {
            job.worker.start();
        } catch (RuntimeException | OutOfMemoryError error) {
            // No thread, so nothing will hand the slot back but this.
            android.util.Log.w("HushMessenger", "Can't start the font copy: " + error.getClass().getSimpleName());
            job.handler.removeCallbacks(job.deadline);
            fontJob = null;
            fontSlots.release();
            refreshFontFile();
            feedback(text.get("font_file_busy"), Toast.LENGTH_LONG);
        }
    }

    /**
     * A picked file's copy on a thread of its own. Its provider can stall in any call, so the copy has a deadline and a
     * Stop button, and a stopped copy never saves: the name and file change only from RUNNING, and a stop ends RUNNING.
     */
    private static final class FontJob implements Runnable {
        static final int RUNNING = 0, SAVING = 1, STOPPED = 2, FINISHED = 3;
        final java.util.concurrent.atomic.AtomicInteger state = new java.util.concurrent.atomic.AtomicInteger(RUNNING);
        final android.os.CancellationSignal cancellation = new android.os.CancellationSignal();
        final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable deadline = () -> stop("font_file_timeout", false);
        final Context app;
        final SharedPreferences prefs;
        final android.net.Uri uri;
        final SettingsText words;
        final Thread worker;
        volatile java.io.Closeable input;

        FontJob(Context app, SharedPreferences prefs, android.net.Uri uri, SettingsText words) {
            this.app = app;
            this.prefs = prefs;
            this.uri = uri;
            this.words = words;
            worker = new Thread(this, "HushMessengerFontCopy");
            worker.setDaemon(true);
        }

        @Override public void run() {
            String message = null;
            try {
                message = copyFont(this);
            } catch (RuntimeException | LinkageError error) {
                android.util.Log.e("HushMessenger", "Can't copy the font file: " + error.getClass().getSimpleName());
            } finally {
                // In finally, so even an error this can't catch frees the slot and the page.
                input = null;
                // Done: a deadline or Stop from here on can't stand in for the copy's own answer.
                if (!state.compareAndSet(RUNNING, FINISHED)) state.compareAndSet(SAVING, FINISHED);
                fontSlots.release();
                String said = message != null ? message : words.get("font_file_not_saved");
                handler.post(() -> {
                    handler.removeCallbacks(deadline);
                    if (fontJob == this) fontJob = null;
                    // A stopped copy said so when it stopped, and saved nothing after. Its slot is free again, though.
                    if (state.get() != STOPPED) fontDone(app, said);
                    else {
                        SettingsActivity page = shownFontPage();
                        if (page != null) page.refreshFontFile();
                    }
                });
            }
        }

        /** Whether the copy may save its name and file now. Once it may, a stop no longer takes it back. */
        boolean startSaving() {
            return state.compareAndSet(RUNNING, SAVING);
        }

        boolean stopped() {
            return state.get() == STOPPED;
        }

        /** The Stop button. */
        void stop(String status) {
            stop(status, true);
        }

        /** On the main thread, from the Stop button or the deadline. A copy already saving finishes and says how it went. */
        void stop(String status, boolean tapped) {
            if (!state.compareAndSet(RUNNING, STOPPED)) {
                // Saving can't be taken back. A tap hears it's finishing; the deadline lets it finish without a word.
                if (tapped && state.get() == SAVING) sayFont(app, shownFontPage(), words.get("font_file_finishing"), Toast.LENGTH_SHORT);
                return;
            }
            handler.removeCallbacks(deadline);
            if (fontJob == this) fontJob = null;
            worker.interrupt();
            // A provider's cancellation and close can both block, so neither runs on the main thread.
            Thread closer = new Thread(() -> {
                try {
                    cancellation.cancel();
                } catch (RuntimeException ignored) {
                    // Closing the stream is the other way out.
                } finally {
                    java.io.Closeable open = input;
                    try {
                        if (open != null) open.close();
                    } catch (java.io.IOException | RuntimeException ignored) {
                        // The copy is stopped either way and saves nothing.
                    }
                }
            }, "HushMessengerFontStop");
            closer.setDaemon(true);
            closer.start();
            fontDone(app, words.get(status));
        }
    }

    private static String copyFont(FontJob job) {
        Context app = job.app;
        SharedPreferences prefs = job.prefs;
        SettingsText words = job.words;
        String name = fontName(app, job.uri, job.cancellation);
        try {
            if (job.stopped()) throw new FontFile.Refused(FontFile.Refusal.UNREADABLE, "Stopped");
            java.io.InputStream opened;
            try {
                opened = app.getContentResolver().openInputStream(job.uri);
            } catch (java.io.IOException | RuntimeException error) {
                // The class only: a provider's message can carry the document's name or address.
                throw new FontFile.Refused(FontFile.Refusal.UNREADABLE, error.getClass().getSimpleName());
            }
            job.input = opened;
            // A provider can swallow the interrupt, so every read also asks whether the copy was stopped.
            java.io.InputStream input = opened == null ? null : new java.io.FilterInputStream(opened) {
                @Override public int read(byte[] buffer, int offset, int length) throws java.io.IOException {
                    if (job.stopped()) throw new java.io.InterruptedIOException("Stopped");
                    return super.read(buffer, offset, length);
                }
            };
            FontFile.copy(input, FontFile.file(app), OwnFont.fileCheck, new FontFile.Choice() {
                private boolean wrote;
                private Object before;

                @Override public boolean save() {
                    if (!job.startSaving()) return false;
                    // Read under FontFile.LOCK, so it's the name the copy in place goes with.
                    before = prefs.getAll().get(OwnFont.NAME_KEY);
                    wrote = true;
                    return prefs.edit().putString(OwnFont.NAME_KEY, name).commit();
                }

                @Override public void undo() {
                    if (wrote) OwnFont.restore(prefs, OwnFont.NAME_KEY, before);
                }
            });
            // With the switch off a restart changes nothing, so the toast names the switch instead. The status line
            // under it names the file, which can be too long for a toast.
            return words.get(prefs.getBoolean(OwnFont.KEY, false) ? "font_file_set" : "font_file_set_off");
        } catch (FontFile.Refused refused) {
            android.util.Log.i("HushMessenger", "Font file refused: " + refused.reason);
            switch (refused.reason) {
                case NOT_A_FONT: return words.get("font_file_not_font");
                case TOO_LARGE: return words.get("font_file_too_large", FontFile.MAX_MEGABYTES);
                case WONT_LOAD: return words.get("font_file_wont_load");
                case NOT_SAVED: return words.get("font_file_not_saved");
                default: return words.get("font_file_unreadable");
            }
        }
    }

    static String fontName(Context context, android.net.Uri uri) {
        return fontName(context, uri, null);
    }

    /** The picked file's name as its provider gives it, or the last part of its address. Never its path. */
    static String fontName(Context context, android.net.Uri uri, android.os.CancellationSignal cancellation) {
        String name = null;
        try (android.database.Cursor cursor = context.getContentResolver().query(uri,
                new String[] {android.provider.OpenableColumns.DISPLAY_NAME}, null, null, null, cancellation)) {
            if (cursor != null && cursor.moveToFirst()) name = cursor.getString(0);
        } catch (RuntimeException unknown) {
            // A provider that can't say leaves the address's own last part.
        }
        if (name == null || name.trim().isEmpty()) name = lastPart(uri.getLastPathSegment());
        return cleanFontName(name);
    }

    /** A document ID like "primary:Download/Fonts/x.ttf" is a path, so only what follows its last '/' or ':' is kept. */
    static String lastPart(String segment) {
        return segment == null ? null : segment.substring(Math.max(segment.lastIndexOf('/'), segment.lastIndexOf(':')) + 1);
    }

    /** One line with no control or formatting characters, at most {@link #MAX_FONT_NAME} long, and a stand-in when nothing's left. */
    static String cleanFontName(String name) {
        if (name == null) return "your font file";
        StringBuilder clean = new StringBuilder();
        int kept = 0;
        for (int index = 0; index < name.length() && kept < MAX_FONT_NAME; ) {
            int at = name.codePointAt(index);
            index += Character.charCount(at);
            int type = Character.getType(at);
            if (type == Character.CONTROL || type == Character.FORMAT || type == Character.UNASSIGNED || type == Character.LINE_SEPARATOR
                || type == Character.PARAGRAPH_SEPARATOR || type == Character.PRIVATE_USE || type == Character.SURROGATE) continue;
            clean.appendCodePoint(Character.isWhitespace(at) ? ' ' : at);
            kept++;
        }
        String trimmed = clean.toString().trim().replaceAll(" {2,}", " ");
        return trimmed.isEmpty() ? "your font file" : trimmed;
    }

    /** Back on the main thread: the page showing the rows now, which may be a newer one than started the copy. */
    private static void fontDone(Context app, String message) {
        SettingsActivity page = shownFontPage();
        if (page != null) page.refreshFontFile();
        sayFont(app, page, message, Toast.LENGTH_LONG);
    }

    /** The page showing the font rows now, if one is open. */
    private static SettingsActivity shownFontPage() {
        SettingsActivity page = fontPage.get();
        return page != null && page.isDestroyed() ? null : page;
    }

    /** On [page] when one shows the rows, or a toast of its own once settings have closed. */
    private static void sayFont(Context app, SettingsActivity page, String message, int length) {
        if (page != null) {
            page.feedback(message, length);
            return;
        }
        if (toast != null) toast.cancel();
        toast = Toast.makeText(app, message, length);
        toast.show();
    }

    /**
     * Saves the phone's font as the choice, then removes the copy, so the name never points at a deleted file. A save that
     * fails keeps the picked name and its copy together. Both run on the font save thread.
     */
    private void usePhoneFont() {
        if (fontJob != null) return;
        SharedPreferences prefs = Settings.preferences;
        Context app = getApplicationContext();
        String set = text.get("font_phone_set");
        writeFont(app, () -> {
            java.io.File copy = FontFile.file(app);
            synchronized (FontFile.LOCK) {
                if (!OwnFont.save(prefs, OwnFont.NAME_KEY, "")) throw new IllegalStateException("Not saved");
                if (copy.exists() && !copy.delete()) android.util.Log.i("HushMessenger", "The font file copy couldn't be removed");
            }
            FontFile.dropAdjusted(copy.getParentFile(), null);
            return set;
        }, text.get("font_phone_failed"), Toast.LENGTH_LONG, true);
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
        boolean appRow = !divided && !"paused".equals(key);
        boolean overlay = !"paused".equals(key) && !ui.largeText;
        boolean available = Settings.available(key);
        if (!available) description += " " + text.format(CameraActivity.KEY.equals(key) ? "camera_unsupported"
            : GalleryPicker.KEY.equals(key) ? "gallery_unsupported"
            : TextStyleActivity.KEY.equals(key) ? "text_style_unsupported"
            : WAYS_IN.contains(key) ? wayReason(key)
            : "bubbles".equals(key) && Build.VERSION.SDK_INT >= 30 ? "bubble_unsupported" : "unavailable");
        LinearLayout row = ui.row();
        LinearLayout labels = ui.column();
        labels.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        LinearLayout titleLine = ui.row();
        LinearLayout.LayoutParams titleSpace = new LinearLayout.LayoutParams(-1, -2);
        // A margin, since relative padding set before the row is attached stays on the right in a mirrored layout.
        if (overlay) titleSpace.setMarginEnd(ui.dp(60));
        if (ui.largeText) titleLine.setOrientation(LinearLayout.VERTICAL);
        titleLine.addView(ui.text(text.display(title), appRow ? 14 : 15, ui.text, false), new LinearLayout.LayoutParams(-2, -2));
        if (EXPERIMENTAL.contains(key)) {
            TextView badge = ui.text(text.get("experimental"), 11, ui.warning, false);
            badge.setBackground(ui.shape(ui.warningSurface, 0, 4));
            badge.setPadding(ui.dp(6), ui.dp(3), ui.dp(6), ui.dp(3));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
            params.setMarginStart(ui.dp(ui.largeText ? 0 : 8));
            titleLine.addView(badge, params);
        }
        labels.addView(titleLine, titleSpace);
        if (!description.isEmpty()) ui.add(labels, ui.text(text.display(description), appRow ? 12 : 13, ui.muted, false), 4);
        // A switch records a use only when Messenger reaches its screen or event, so an off switch shows nothing.
        // A failure newer than the last use means the switch isn't doing its job, so that shows instead.
        TextView activeLabel = null;
        if (divided) {
            activeLabel = ui.text("", 12, ui.muted, false);
            activeLabel.setTag("active_" + key);
            activityLabels.put(key, activeLabel);
            ui.add(labels, activeLabel, 4);
        }
        row.addView(labels, new LinearLayout.LayoutParams(overlay ? -1 : 0, -2, overlay ? 0 : 1));
        Switch control = ui.toggle(key, text.display(title), text.display((EXPERIMENTAL.contains(key) ? text.format("experimental") + ". " : "") + description), Settings.preferences.getBoolean(key, false));
        LinearLayout.LayoutParams switchParams = new LinearLayout.LayoutParams(ui.dp(48), -2);
        // Normal-size App descriptions span the panel. Large text reserves a separate switch column.
        switchParams.setMarginStart(ui.dp(overlay ? -48 : 12));
        if (overlay) {
            row.setGravity(Gravity.TOP);
            control.setGravity(Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        }
        row.addView(control, switchParams);
        switches.add(control);
        if (divided) {
            switchDescriptions.put(control, control.getContentDescription());
            refreshStatus(control);
        }
        control.setEnabled(available);
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
            // The icon shortcuts follow their switch now, and stand in when another way in goes while they're hidden.
            if (Settings.HIDE_ICON_SHORTCUTS.equals(key) || (Settings.HIDE_LOGO_PRESS.equals(key) || "hide_drawer_icon".equals(key))
                    && Settings.preferences.getBoolean(Settings.HIDE_ICON_SHORTCUTS, false)) HostScreens.refreshShortcuts(this, () -> runOnUiThread(() -> {
                // Hide the Menu row asks whether Patch controls is published, which is known only now.
                if (!isFinishing() && !isDestroyed()) refreshChoices();
            }));
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
        // A group draws the lines between its controls, so a control's own buttons sit above the line, not below it.
        row.setBackground(ui.interactive(ui.surface, 0, 0));
        row.setPadding(0, ui.dp(divided ? 11 : 0), 0, ui.dp(divided ? 11 : 0));
        return row;
    }

    private void refreshStatus(Switch control) {
        String key = (String) control.getTag();
        TextView label = activityLabels.get(key);
        if (label == null) return;
        long used = Settings.lastActive(key), failedAt = Settings.hookErrorAt(key);
        boolean paused = Settings.preferences.getBoolean("paused", false) || CrashGuard.isSafeMode();
        boolean failed = failedAt > 0 && failedAt >= used;
        // A control that keeps its first answer for the run says so until a restart, even with its switch now off.
        Boolean held = Settings.heldUntilRestart(key);
        String status = held != null ? text.get(("meta_ai".equals(key) ? "meta_ai_tab_pending_" : Settings.BOTTOM_TABS.contains(key) ? key + "_pending_"
                : "restart_pending_") + (held ? "off" : "on"))
            : paused ? text.get("changes_paused") : failed ? formatSince(failedAt, "error_now", "error_ago")
            : used == 0 ? text.get("keep_unsent".equals(key) ? "unsent_not_active" : "not_active") : formatSince(used, "active_now", "active_ago");
        if (!status.contentEquals(label.getText())) label.setText(status);
        label.setTextColor(held != null || (!paused && failed) ? ui.warning : !paused && used > 0 ? ui.accent : ui.muted);
        boolean shown = control.isChecked() || held != null;
        label.setVisibility(shown ? View.VISIBLE : View.GONE);
        // Hidden labels share the description exposed by the row's switch node.
        String description = switchDescriptions.get(control).toString() + (shown ? " " + status : "");
        if (!description.contentEquals(control.getContentDescription())) control.setContentDescription(description);
    }

    private void buildApp(LinearLayout content) {
        // Restart sits above the sections, so it's one tap however many are closed.
        Button restart = ui.primaryButton(text.get("restart"));
        restart.setTag("restart_messenger");
        restart.setOnClickListener(view -> HostScreens.restartInto(this, page));
        ui.add(content, restart, 0);
        LinearLayout access = ui.panel();
        access.setPadding(ui.dp(14), ui.dp(14), ui.dp(14), ui.dp(14));
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
        accessHelpId = hosted ? "access_help_hosted" : drawerAlias ? "access_help" : "access_help_missing";
        accessHelpMenuRow = menuRow;
        accessHelp = ui.text(accessHelpText(), 13, ui.muted, false);
        accessHelp.setTag("access_help");
        ui.add(access, accessHelp, 0);
        // Without the Menu row, a launcher that has no app shortcuts would leave no way back in.
        if (menuRow && drawerAlias && !hosted) {
            ui.rule(access, 12);
            ui.add(access, controlRow("hide_drawer_icon", text.format("hide_drawer_icon"), text.format("hide_drawer_icon_help"), false), 10);
        } else {
            TextView drawerHelp = ui.text(text.get(hosted ? "drawer_root" : !drawerAlias ? "drawer_missing" : "drawer_requires_menu"), 14, ui.muted, false);
            drawerHelp.setTag("drawer_help");
            ui.add(access, drawerHelp, 14);
        }
        wayControls.clear();
        wayBuilt.clear();
        // #22: the Menu row can go once another way back has proved it works here.
        if (menuRow) {
            ui.rule(access, 12);
            ui.add(access, wayControl("hide_menu_row"), 10);
        }
        // HushFacebook#146: every install has the icon shortcuts, and the logo's long press comes with the Menu row.
        ui.rule(access, 12);
        ui.add(access, wayControl(Settings.HIDE_ICON_SHORTCUTS), 10);
        if (Settings.logoOpensSettings()) {
            ui.rule(access, 12);
            ui.add(access, wayControl(Settings.HIDE_LOGO_PRESS), 10);
        }
        if (drawerAlias && !hosted) {
            TextView sharedInstall = ui.text(text.get("shared_install_help"), 13, ui.muted, false);
            sharedInstall.setTag("shared_install_help");
            sharedInstall.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
            sharedInstall.setBackground(ui.shape(ui.infoSurface, ui.infoBorder, 8));
            ui.add(access, sharedInstall, 12);
        }
        section(content, "quick_access", access, 12);
        if (!installedControls.isEmpty()) {
            // The section around it carries the "quick_setups" tag.
            LinearLayout quick = quickPanel = ui.panel();
            ui.add(quick, ui.text(text.get("quick_setups_help"), 13, ui.muted, false), 0);
            for (String name : QuickSetups.CHOICES) {
                ui.rule(quick, 12);
                Button choice = ui.button(text.get("quick_" + name));
                choice.setTag("quick_" + name);
                choice.setOnClickListener(view -> applyQuickSetup(name));
                ui.add(quick, choice, 8);
                ui.add(quick, ui.text(text.get("quick_" + name + "_help"), 13, ui.muted, false), 8);
            }
            quickSection = section(content, "quick_setups", quick, 8);
            // A long press anywhere on the section hides it, header, buttons and help lines included.
            holdToHide(quickSection.getChildAt(0));
            holdToHide(quick);
            for (int i = 0; i < quick.getChildCount(); i++) holdToHide(quick.getChildAt(i));
            showQuickSetups();
        }
        LinearLayout appearance = ui.panel();
        appearance.setPadding(ui.dp(14), ui.dp(14), ui.dp(14), ui.dp(14));
        ui.add(appearance, controlRow("light", text.format("light"), text.format("light_help"), false), 0);
        if (Settings.installed.contains("material_you")) {
            ui.rule(appearance, 10);
            ui.add(appearance, controlRow("material_you_black", text.format("material_you_black"), text.format("material_you_black_help"), false), 12);
        }
        ui.rule(appearance, 10);
        ui.add(appearance, ui.text(text.get("theme_help"), 13, ui.muted, false), 12);
        section(content, "appearance", appearance, 8);
        LinearLayout about = ui.panel();
        about.setPadding(ui.dp(14), ui.dp(14), ui.dp(14), ui.dp(14));
        infoRow(about, text.get("version"), BuildConfig.VERSION_NAME);
        int art = ScreenArt.artDpi.applyAsInt(this), screen = getResources().getDisplayMetrics().densityDpi;
        if (ScreenArt.blurry(art, screen)) {
            TextView blurry = ui.text(text.get("screen_art_blurry", text.number(art), text.number(screen)), 13, ui.warning, false);
            blurry.setTag("screen_art_blurry");
            ui.add(about, blurry, 8);
        }
        ui.rule(about, 10);
        infoRow(about, text.get("installed"), text.number(installedControls.size()));
        // Update checks sit with the version they compare against.
        ui.rule(about, 10);
        ui.add(about, controlRow("check_updates", text.format("check_updates"), text.format("check_updates_help"), false), 4);
        updateStatus = ui.text("", 13, ui.muted, false);
        updateStatus.setTag("update_status");
        updateStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        updateStatus.setVisibility(View.GONE);
        ui.add(about, updateStatus, 8);
        updateCheckNow = ui.button(text.get("check_now"));
        updateCheckNow.setTag("check_now");
        updateCheckNow.setOnClickListener(view -> checkForUpdates());
        ui.add(about, updateCheckNow, 8);
        section(content, "about", about, 8);
        syncUpdateChoice(true);
        LinearLayout choices = ui.panel();
        Button copy = ui.button(text.get("copy"));
        copy.setTag("copy_setup");
        copy.setOnClickListener(view -> copySetup());
        ui.add(choices, copy, 0);
        ui.add(choices, ui.text(text.get("copy_help"), 13, ui.muted, false), 8);
        ui.rule(choices, 12);
        Button exportBtn = ui.button(text.get("export"));
        exportBtn.setTag("export_choices");
        exportBtn.setOnClickListener(view -> exportChoices());
        ui.add(choices, exportBtn, 8);
        ui.add(choices, ui.text(text.get("export_help"), 13, ui.muted, false), 8);
        ui.rule(choices, 12);
        Button importBtn = ui.button(text.get("import_choices"));
        importBtn.setTag("import_choices");
        importBtn.setOnClickListener(view -> importChoices());
        ui.add(choices, importBtn, 8);
        ui.add(choices, ui.text(text.get("import_help"), 13, ui.muted, false), 8);
        ui.rule(choices, 12);
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
        ui.add(choices, saveFile, 8);
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
                feedback(text.get("choices_file_no_picker"), Toast.LENGTH_LONG);
            }
        });
        ui.add(choices, readFile, 8);
        documentStatus = ui.text("", 13, ui.muted, false);
        documentStatus.setTag("choices_file_status");
        documentStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        documentStatus.setVisibility(View.GONE);
        ui.add(choices, documentStatus, 8);
        restoreStatus = ui.text("", 13, ui.muted, false);
        restoreStatus.setTag("choices_restore_status");
        restoreStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        restoreStatus.setVisibility(View.GONE);
        ui.add(choices, restoreStatus, 8);
        cancelChoicesFile = ui.button(text.get("cancel_choices_file"));
        cancelChoicesFile.setTag("cancel_choices_file");
        cancelChoicesFile.setVisibility(View.GONE);
        cancelChoicesFile.setOnClickListener(view -> cancelDocumentJob(
            documentJob != null && documentJob.request == READ_CHOICES ? "choices_file_canceled_read" : "choices_file_canceled"));
        ui.add(choices, cancelChoicesFile, 8);
        ui.add(choices, ui.text(text.get("choices_file_help"), 13, ui.muted, false), 8);
        // Where the Quick setups section comes back after a long press hid it.
        if (quickPanel != null) {
            ui.rule(choices, 12);
            Button quickHome = ui.button(text.get("quick_setups_home"));
            quickHome.setTag("quick_setups_home");
            quickHome.setOnClickListener(view -> {
                Settings.preferences.edit().putBoolean(HIDE_QUICK_SETUPS, !quickSetupsHidden()).apply();
                showQuickSetups();
            });
            ui.add(choices, quickHome, 8);
            quickHomeStatus = ui.text("", 13, ui.muted, false);
            quickHomeStatus.setTag("quick_setups_home_status");
            ui.add(choices, quickHomeStatus, 8);
            showQuickSetups();
        }
        section(content, "choices", choices, 8);
        LinearLayout usage = ui.panel();
        usage.setPadding(ui.dp(14), ui.dp(14), ui.dp(14), ui.dp(14));
        ui.add(usage, ui.text(text.get("save_help"), 13, ui.muted, false), 0);
        ui.add(usage, ui.text(text.get("pause_help"), 13, ui.muted, false), 10);
        ui.add(usage, ui.text(text.get("account_help"), 13, ui.muted, false), 10);
        LinearLayout help = ui.column();
        help.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
        help.setBackground(ui.shape(ui.infoSurface, ui.infoBorder, 8));
        ui.add(help, ui.text(text.get("missing"), 15, ui.accent, true), 0);
        ui.add(help, ui.text(text.get("missing_help"), 13, ui.muted, false), 6);
        ui.add(usage, help, 12);
        section(content, "usage", usage, 8);
        Button source = ui.button(text.get("source"));
        source.setTag("source_licenses");
        source.setOnClickListener(view -> openPage("https://github.com/SysAdminDoc/HushMessenger#credits"));
        ui.add(content, source, 16);
        // Built when tapped, so the controls listed are the ones on right then.
        ui.add(content, linkPanel("report_problem", "report", () -> openPage(ProblemReport.issueUrl(reportFacts()))), 12);
        ui.add(content, linkPanel("support", "support", () -> openPage(SUPPORT_PAGE)), 12);
        ui.add(content, ui.text(text.get("credits"), 12, ui.muted, false), 16);
        ui.add(content, ui.text(text.get("independent"), 12, ui.muted, false), 20);
    }

    /** A panel that opens a page: text [id]'s title in the accent color over its "_help" line, read out as one button. */
    private LinearLayout linkPanel(String tag, String id, Runnable open) {
        // A row with no "_help" text is its title alone, like Support.
        boolean help = SettingsText.ENGLISH.containsKey(id + "_help");
        LinearLayout panel = ui.panel();
        panel.setTag(tag);
        panel.setClickable(true);
        panel.setFocusable(true);
        panel.setBackground(ui.interactive(ui.surface, ui.line, 12));
        panel.setContentDescription(help ? text.get(id) + ". " + text.get(id + "_help") : text.get(id));
        panel.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                // A panel that opens a page is a button to a screen reader.
                info.setClassName(Button.class.getName());
            }
        });
        ui.add(panel, ui.text(text.get(id), 16, ui.accent, true), 0);
        if (help) ui.add(panel, ui.text(text.get(id + "_help"), 14, ui.muted, false), 4);
        panel.setOnClickListener(view -> open.run());
        return panel;
    }

    /** What Report a problem fills in: versions, the phone and the English titles of the controls saved on. */
    private ProblemReport.Facts reportFacts() {
        String messenger = "";
        long code = 0;
        try {
            PackageInfo host = getPackageManager().getPackageInfo(getPackageName(), 0);
            messenger = host.versionName;
            code = host.getLongVersionCode();
        } catch (PackageManager.NameNotFoundException unknown) {
            // The report says "unknown" instead.
        }
        List<String> on = new ArrayList<>();
        for (String[] spec : installedControls) if (Settings.preferences.getBoolean(spec[0], false)) on.add(spec[1]);
        return new ProblemReport.Facts(BuildConfig.VERSION_NAME, messenger, code,
            ProblemReport.patchedFrom(HostScreens.originalBuild(), Settings.preview), Build.MANUFACTURER, Build.MODEL,
            Build.VERSION.RELEASE, Build.VERSION.SDK_INT, Settings.preferences.getBoolean("paused", false), CrashGuard.isSafeMode(), on,
            GalleryPicker.lastOutcome.name(), LastCrash.read(getFilesDir(), System.currentTimeMillis()));
    }

    /**
     * Saves one Quick setups choice in a single write, then says how many controls changed. The switches, the counts and
     * the restart row follow from refreshChoices, the same as after a tap on each switch.
     */
    private void applyQuickSetup(String name) {
        java.util.Map<String, Boolean> values = QuickSetups.values(name);
        // Turning a control off never needs this phone to run it, so Back to defaults also clears one it can't.
        java.util.function.Predicate<String> settable = "defaults".equals(name) ? Settings.installed::contains
            : key -> Settings.installed.contains(key) && Settings.available(key);
        java.util.Map<String, Boolean> changes = QuickSetups.changes(values, Settings.preferences, settable);
        // What each changed key held, null for one never saved, so Undo puts back exactly that.
        java.util.Map<String, Boolean> before = new java.util.HashMap<>();
        for (String key : changes.keySet()) before.put(key, Settings.preferences.contains(key) ? Settings.preferences.getBoolean(key, false) : null);
        if (!changes.isEmpty()) {
            SharedPreferences.Editor edit = Settings.preferences.edit();
            for (java.util.Map.Entry<String, Boolean> change : changes.entrySet()) edit.putBoolean(change.getKey(), change.getValue());
            edit.apply();
        }
        refreshChoices();
        feedback(!changes.isEmpty() ? text.count("quick_changed", changes.size())
            : text.get(QuickSetups.anySettable(values, settable) ? "quick_unchanged" : "quick_missing"), Toast.LENGTH_SHORT);
        if (!changes.isEmpty()) offerUndo(text.format("quick_" + name), () -> undoQuickSetup(changes, before));
    }

    /** Puts back what a Quick setup changed, except a switch flipped again since, which stays as it is now. */
    private void undoQuickSetup(java.util.Map<String, Boolean> changes, java.util.Map<String, Boolean> before) {
        SharedPreferences.Editor edit = Settings.preferences.edit();
        int restored = 0;
        for (java.util.Map.Entry<String, Boolean> change : changes.entrySet()) {
            String key = change.getKey();
            boolean set = change.getValue();
            if (Settings.preferences.getBoolean(key, !set) != set) continue;
            Boolean old = before.get(key);
            if (old == null) edit.remove(key);
            else edit.putBoolean(key, old);
            restored++;
        }
        edit.apply();
        refreshChoices();
        feedback(text.count("quick_undone", restored), Toast.LENGTH_SHORT);
    }

    private void copySetup() {
        try {
            PackageInfo host = getPackageManager().getPackageInfo(getPackageName(), 0);
            boolean paused = Settings.preferences.getBoolean("paused", false);
            boolean safeMode = CrashGuard.isSafeMode();
            StringBuilder summary = new StringBuilder("HushMessenger v").append(BuildConfig.VERSION_NAME)
                .append("\nHost package: ").append(getPackageName())
                .append("\nSettings provider: ").append(HostScreens.settingsProviderFound(this) ? "found" : "missing")
                .append("\nHost version: ").append(host.versionName == null ? "unknown" : host.versionName)
                .append("\nHost version code: ").append(host.getLongVersionCode())
                .append("\nPatched from: ").append(ProblemReport.patchedFrom(HostScreens.originalBuild(), Settings.preview))
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
                Boolean held = Settings.heldUntilRestart(key);
                summary.append(key).append(": installed=").append(installed)
                    .append(", selected=").append(selected)
                    .append(", active=").append(!Settings.preview && installed && selected && !paused && !safeMode && Settings.available(key))
                    .append(", last_active=").append(lastActive == 0 ? "none" : ((System.currentTimeMillis() - lastActive) / 1000) + "s ago")
                    .append(held == null ? "" : ", until_restart=" + held)
                    .append(", scope=").append(text.control(spec, 2))
                    .append('\n');
            }
            String lateStart = HostScreens.lateStart;
            summary.append("Late start: ").append(lateStart == null ? "not needed" : lateStart).append('\n');
            String dataDir = getApplicationInfo().dataDir;
            summary.append("Analytics stores: ").append(dataDir == null ? "unreadable" : analyticsStores(new java.io.File(dataDir))).append('\n');
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
    private static final Object UPDATE_CACHE_LOCK = new Object();

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

    private boolean saveUpdate(long generation, SharedPreferences.Editor editor, String error) {
        // Only workers take this lock. Serialize accepted writes so an older write cannot
        // finish after a newer one, without making cancellation wait for disk I/O.
        synchronized (UPDATE_CACHE_LOCK) {
            if (!currentUpdate(generation)) return false;
            if (!editor.commit()) android.util.Log.w("HushMessenger", error);
            return true;
        }
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
                view.setOnClickListener(v -> openPage(release.page));
                ViewGroup parent = (ViewGroup) updateStatus.getParent();
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
                params.topMargin = ui.dp(8);
                parent.addView(view, parent.indexOfChild(updateStatus) + 1, params);
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
                    if (!saveUpdate(generation, prefs.edit().putLong(ReleaseCheck.RETRY_KEY, deadline)
                        .putString(ReleaseCheck.RETRY_ENDPOINT_KEY, endpoint).putInt(ReleaseCheck.FAILURES_KEY, Math.min(6, failures + 1)),
                        "Couldn't save update retry time")) return;
                    showRetry(generation, deadline);
                    return;
                }
                ReleaseCheck release;
                if (code == 304) {
                    if (cached == null || cached.etag.isEmpty()) throw new java.io.IOException("304 without a conditional release cache");
                    release = cached.revalidated(conn.getHeaderField("ETag"), updateClock.getAsLong());
                    if (release == null) {
                        // A changed ETag can't confirm the cached release. Drop it so the next check asks unconditionally.
                        if (!saveUpdate(generation, prefs.edit().remove(ReleaseCheck.CACHE_KEY), "Couldn't clear the cached release")) return;
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
                if (!saveUpdate(generation, prefs.edit().putString(ReleaseCheck.CACHE_KEY, release.encode()).remove(ReleaseCheck.RETRY_KEY)
                    .remove(ReleaseCheck.RETRY_ENDPOINT_KEY).remove(ReleaseCheck.FAILURES_KEY), "Couldn't save checked release")) return;
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

    private Dialog messageLogDialog;
    private LinearLayout messageLogList;
    private ScrollView messageLogScroll;
    /** Builds the log's next page of cards, while one is left. */
    private Runnable messageLogMore;
    private Button messageLogClear;
    private long messageLogGeneration;
    private boolean messageLogClearFailed;
    /** Opening the log is what put FLAG_SECURE on this screen's window, so closing it takes back only that. */
    private boolean messageLogSecured;
    private MessageLogClearJob messageLogClearJob;
    private Dialog autoReplyDialog;
    private LinearLayout autoReplyList;
    private android.widget.CheckBox autoReplyGroups;
    private TextView autoReplyCount;
    private Button autoReplyAdd;
    private ScrollView autoReplyScroll;
    /** The picture each reply card holds, by card, until Save. */
    private final java.util.WeakHashMap<View, String> autoReplyPictures = new java.util.WeakHashMap<>();
    private final java.util.WeakHashMap<View, String> autoReplyCardIds = new java.util.WeakHashMap<>();
    private final java.util.Map<View, AutoReplyPicture.Import> autoReplyPictureOps = new java.util.HashMap<>();
    /** Each copy's deadline, posted with its Import as the token. */
    private final android.os.Handler autoReplyDeadlines = new android.os.Handler(android.os.Looper.getMainLooper());
    private Button autoReplySave;
    /** The card whose picture is being picked, by position, or -1. */
    private int autoReplyPictureFor = -1;
    private String autoReplyPictureId;
    /** A picked picture that came back while the sheet was being rebuilt, and the card it's for. */
    private android.net.Uri pendingAutoReplyPicture;
    private int pendingAutoReplyPictureFor = -1;
    private String pendingAutoReplyPictureId;

    /** Two actions under the message-log switch: open the log or wipe it, no confirmation, just a toast. */
    private void addMessageLogActions(LinearLayout content) {
        LinearLayout actions = ui.row();
        Button view = ui.button(text.get("message_log_view"));
        view.setTag("message_log_view");
        view.setOnClickListener(clicked -> showMessageLog());
        actions.addView(view);
        Button clear = ui.button(text.get("message_log_clear"));
        clear.setTag("message_log_clear");
        clear.setOnClickListener(clicked -> clearMessageLog());
        LinearLayout.LayoutParams clearParams = new LinearLayout.LayoutParams(-2, -2);
        clearParams.setMarginStart(ui.dp(8));
        actions.addView(clear, clearParams);
        ui.add(content, actions, 8);
    }

    private void showMessageLog() {
        if (isFinishing() || isDestroyed() || messageLogDialog != null) return;
        SettingsDialog sheet = new SettingsDialog(this, ui, text, text.get("message_log_title"), text.get("message_log_hint"));
        Dialog dialog = sheet.dialog;
        messageLogDialog = dialog;
        hideFromRecents(dialog);
        dialog.setOnDismissListener(dismissed -> {
            showInRecents();
            if (messageLogDialog == dismissed) {
                messageLogDialog = null;
                messageLogList = null;
                messageLogScroll = null;
                messageLogMore = null;
                messageLogClear = null;
                messageLogGeneration++;
            }
        });
        messageLogList = sheet.body;
        messageLogScroll = sheet.scroll;
        // Scrolling near the end builds the next page, and so does a layout that leaves the end in view.
        sheet.scroll.setOnScrollChangeListener((view, x, y, oldX, oldY) -> moreMessageLogIfNear());
        sheet.scroll.getViewTreeObserver().addOnGlobalLayoutListener(this::moreMessageLogIfNear);
        messageLogClear = ui.button(text.get("message_log_clear"));
        messageLogClear.setTag("message_log_dialog_clear");
        messageLogClear.setOnClickListener(clicked -> clearMessageLog());
        sheet.action(messageLogClear);
        Button close = ui.primaryButton(text.get("message_log_close"));
        close.setTag("message_log_dialog_close");
        close.setOnClickListener(clicked -> dialog.dismiss());
        sheet.action(close);
        sheet.show();
        loadMessageLog();
    }

    /**
     * The log holds chat text, so the Recents thumbnail leaves it out while it's open. Android 13 and newer can do that on
     * its own, and screenshots still work. Before that the only way is FLAG_SECURE, on this screen's window and on the
     * log's own, which blocks screenshots of the log too. Both are set before any message is loaded.
     */
    private void hideFromRecents(Dialog dialog) {
        if (Build.VERSION.SDK_INT >= 33) {
            setRecentsScreenshotEnabled(false);
            return;
        }
        android.view.Window window = getWindow();
        messageLogSecured = (window.getAttributes().flags & WindowManager.LayoutParams.FLAG_SECURE) == 0;
        if (messageLogSecured) window.addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        if (dialog.getWindow() != null) dialog.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
    }

    private void showInRecents() {
        if (Build.VERSION.SDK_INT >= 33) {
            setRecentsScreenshotEnabled(true);
            return;
        }
        if (!messageLogSecured) return;
        messageLogSecured = false;
        getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
    }

    private void loadMessageLog() {
        final LinearLayout list = messageLogList;
        if (list == null) return;
        final long generation = ++messageLogGeneration;
        messageLogMore = null;
        list.removeAllViews();
        TextView loading = ui.text(text.get("message_log_loading"), 14, ui.muted, false);
        loading.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        list.addView(loading);
        if (messageLogClear != null) messageLogClear.setEnabled(false);
        if (messageLogClearJob != null && !messageLogClearJob.finished) return;
        new Thread(() -> {
            final MessageLog.LoadResult result = MessageLog.loadResult();
            runOnUiThread(() -> {
                if (messageLogList != list || generation != messageLogGeneration) return;
                list.removeAllViews();
                if (messageLogClear != null) messageLogClear.setEnabled(result.failed || result.setAside || messageLogClearFailed || !result.entries.isEmpty());
                if (result.failed || messageLogClearFailed) {
                    LinearLayout failure = ui.panel();
                    failure.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
                    failure.addView(ui.text(text.get(messageLogClearFailed ? "message_log_clear_failed" : "message_log_load_failed"), 18, ui.error, true));
                    ui.add(failure, ui.text(text.get(messageLogClearFailed ? "message_log_clear_help" : "message_log_load_help"), 14, ui.muted, false), 8);
                    Button retry = ui.button(text.get(messageLogClearFailed ? "message_log_clear" : "retry"));
                    retry.setTag("message_log_retry");
                    retry.setOnClickListener(view -> { if (messageLogClearFailed) clearMessageLog(); else loadMessageLog(); });
                    ui.add(failure, retry, 16);
                    ui.add(list, failure, 0);
                } else {
                    // The log works; only an older file it couldn't read was moved aside. Say so without calling it a failure.
                    if (result.setAside) {
                        LinearLayout notice = ui.panel();
                        notice.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
                        notice.addView(ui.title(text.get("message_log_set_aside"), 18));
                        ui.add(notice, ui.text(text.get("message_log_set_aside_help"), 14, ui.muted, false), 8);
                        Button remove = ui.button(text.get("message_log_set_aside_remove"));
                        remove.setTag("message_log_set_aside_remove");
                        remove.setOnClickListener(view -> { view.setEnabled(false); removeSetAsideLog(); });
                        ui.add(notice, remove, 16);
                        ui.add(list, notice, 0);
                    }
                    if (result.entries.isEmpty()) {
                        LinearLayout empty = ui.panel();
                        empty.setPadding(ui.dp(20), ui.dp(20), ui.dp(20), ui.dp(20));
                        empty.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
                        View accent = new View(this);
                        accent.setBackground(ui.shape(ui.accent, 0, 2));
                        empty.addView(accent, new LinearLayout.LayoutParams(ui.dp(36), ui.dp(4)));
                        TextView emptyLog = ui.title(text.get("message_log_empty"), 18);
                        emptyLog.setTag("message_log_empty_title");
                        ui.add(empty, emptyLog, 16);
                        ui.add(empty, ui.text(text.get(Settings.wouldUse(MessageLog.KEY) ? "message_log_empty_on" : "message_log_empty_off"), 14, ui.muted, false), 8);
                        // The settings page's Undo sits behind this sheet.
                        if (messageLogUndo) {
                            Button undo = ui.button(text.get("undo"));
                            undo.setTag("message_log_undo");
                            undo.setOnClickListener(view -> undo());
                            ui.add(empty, undo, 16);
                        }
                        ui.add(list, empty, result.setAside ? 12 : 0);
                    }
                }
                if (!result.entries.isEmpty()) ui.add(list, ui.text(text.get("message_log_retention"), 13, ui.muted, false), list.getChildCount() > 0 ? 12 : 0);
                showMessageLogPage(list, generation, result.entries, 0);
            });
        }, "HushMessageLogView").start();
    }

    /** Cards built at a time. A full log is 500 of them, and building them all at once froze the screen for two seconds. */
    static final int MESSAGE_LOG_PAGE = 20;

    private void showMessageLogPage(LinearLayout list, long generation, List<MessageLog.Entry> entries, int from) {
        messageLogMore = null;
        if (messageLogList != list || generation != messageLogGeneration) return;
        int to = Math.min(entries.size(), from + MESSAGE_LOG_PAGE);
        for (int i = from; i < to; i++) list.addView(messageLogEntry(entries.get(i)));
        if (to < entries.size()) messageLogMore = () -> showMessageLogPage(list, generation, entries, to);
    }

    /**
     * Builds the next page once the log is scrolled within a screen of its end. A list still waiting for its layout is
     * measured after it, so a page that was just added can't count as the end and pull in the rest. The dismiss listener
     * runs a message after the sheet goes, so a page asked for just before then checks the sheet is still up.
     */
    private void moreMessageLogIfNear() {
        ScrollView scroll = messageLogScroll;
        Runnable more = messageLogMore;
        if (scroll == null || more == null || scroll.getChildCount() == 0) return;
        View content = scroll.getChildAt(0);
        int height = scroll.getHeight();
        if (height == 0 || content.isLayoutRequested()) return;
        if (content.getBottom() - (scroll.getScrollY() + height) < height) scroll.post(() -> { if (messageLogMore == more && scroll.isAttachedToWindow()) more.run(); });
    }

    private void removeSetAsideLog() {
        new Thread(() -> {
            final boolean removed = MessageLog.removeSetAside();
            runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) return;
                if (!removed) feedback(text.get("message_log_set_aside_failed"), Toast.LENGTH_LONG);
                loadMessageLog();
            });
        }, "HushMessageLogView").start();
    }

    private View messageLogEntry(MessageLog.Entry entry) {
        LinearLayout card = ui.column();
        card.setBackground(ui.shape(ui.surface, ui.line, 12));
        card.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(16));
        // Messenger's chat key means nothing to a reader, so an entry without a name reads as an unknown chat.
        String who = entry.sender.isEmpty() ? (entry.chat.isEmpty() ? text.get("message_log_unknown_thread") : entry.chat)
            : entry.chat.isEmpty() ? entry.sender : text.get("message_log_in_group", entry.sender, entry.chat);
        TextView metadata = ui.text(who + "  ·  " + formatSince(entry.time, "message_log_now", "message_log_ago"), 12, ui.muted, true);
        metadata.setContentDescription(who + ". " + android.text.format.DateFormat.getDateFormat(this).format(new java.util.Date(entry.time)) + ", " +
            android.text.format.DateFormat.getTimeFormat(this).format(new java.util.Date(entry.time)));
        card.addView(metadata);
        TextView body = ui.text(entry.text == null || entry.text.isEmpty() ? text.get("message_log_no_text") : entry.text, 15, ui.text, false);
        body.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        body.setTextIsSelectable(true);
        ui.add(card, body, 8);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = ui.dp(8);
        card.setLayoutParams(params);
        return card;
    }

    /** One button under the auto reply switch that opens the replies. */
    private void addAutoReplyActions(LinearLayout content) {
        LinearLayout actions = ui.row();
        Button edit = ui.button(text.get("auto_reply_edit"));
        edit.setTag("auto_reply_edit");
        edit.setOnClickListener(clicked -> showAutoReplies());
        actions.addView(edit);
        ui.add(content, actions, 8);
    }

    /** Drafts stay in saved instance state until Save commits them or Cancel discards them. */
    private void showAutoReplies() { showAutoReplies(null); }

    private void showAutoReplies(Bundle draft) {
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null || isFinishing() || isDestroyed() || autoReplyDialog != null) return;
        SettingsDialog sheet = new SettingsDialog(this, ui, text, text.get("auto_reply_title"), text.get("auto_reply_hint"));
        Dialog dialog = sheet.dialog;
        autoReplyDialog = dialog;
        autoReplyScroll = sheet.scroll;
        dialog.setOnDismissListener(dismissed -> {
            if (autoReplyDialog != dismissed) return;
            invalidateAutoReplyImports();
            autoReplyDialog = null;
            autoReplyList = null;
            autoReplyGroups = null;
            autoReplyCount = null;
            autoReplyAdd = null;
            autoReplyScroll = null;
            autoReplySave = null;
        });
        if (!Settings.wouldUse(AutoReply.KEY)) {
            TextView status = ui.text(text.get("auto_reply_off"), 14, ui.muted, false);
            status.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
            status.setBackground(ui.shape(ui.surface, ui.line, 12));
            ui.add(sheet.body, status, 0);
        }
        LinearLayout listHeading = ui.row();
        if (ui.largeText) listHeading.setOrientation(LinearLayout.VERTICAL);
        autoReplyCount = ui.text("", 13, ui.muted, true);
        autoReplyCount.setTag("auto_reply_count");
        autoReplyCount.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        listHeading.addView(autoReplyCount, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        autoReplyAdd = ui.button(text.get("auto_reply_add"));
        autoReplyAdd.setTag("auto_reply_add");
        listHeading.addView(autoReplyAdd, new LinearLayout.LayoutParams(ui.largeText ? -1 : -2, -2));
        ui.add(sheet.body, listHeading, 12);
        LinearLayout list = ui.column();
        autoReplyList = list;
        ui.add(sheet.body, list, 0);
        ArrayList<String> words = draft == null ? null : draft.getStringArrayList("words");
        ArrayList<String> replies = draft == null ? null : draft.getStringArrayList("replies");
        if (words != null && replies != null) {
            ArrayList<String> pictures = draft.getStringArrayList("pictures");
            ArrayList<String> ids = draft.getStringArrayList("card_ids");
            for (int i = 0; i < Math.min(AutoReply.MAX_RULES, Math.min(words.size(), replies.size())); i++) {
                String picture = pictures != null && i < pictures.size() ? pictures.get(i) : null;
                View card = autoReplyCard(list, new AutoReply.Rule("", "", picture));
                if (ids != null && i < ids.size() && ids.get(i) != null) autoReplyCardIds.put(card, ids.get(i));
                ((EditText) card.findViewWithTag("auto_reply_when")).setText(words.get(i));
                ((EditText) card.findViewWithTag("auto_reply_reply")).setText(replies.get(i));
                list.addView(card);
            }
        } else {
            for (AutoReply.Rule rule : AutoReply.rules(prefs)) list.addView(autoReplyCard(list, rule));
            if (list.getChildCount() == 0) list.addView(autoReplyCard(list, new AutoReply.Rule("", "")));
        }
        android.widget.CheckBox groups = new android.widget.CheckBox(this);
        autoReplyGroups = groups;
        groups.setTag("auto_reply_groups");
        groups.setText(text.get("auto_reply_groups"));
        groups.setTextSize(15);
        groups.setTextColor(ui.text);
        groups.setButtonTintList(new android.content.res.ColorStateList(new int[][] {{android.R.attr.state_checked}, {}}, new int[] {ui.accent, ui.outline}));
        groups.setMinHeight(ui.dp(48));
        groups.setPadding(ui.dp(4), ui.dp(8), ui.dp(4), ui.dp(8));
        groups.setBackground(ui.interactive(0, 0, 8));
        groups.setChecked(draft == null ? prefs.getBoolean(AutoReply.GROUPS, false) : draft.getBoolean("groups"));
        ui.add(sheet.body, groups, 12);
        autoReplyAdd.setOnClickListener(clicked -> {
            if (list.getChildCount() >= AutoReply.MAX_RULES) return;
            View card = autoReplyCard(list, new AutoReply.Rule("", ""));
            list.addView(card);
            refreshReplyCount();
            View field = card.findViewWithTag("auto_reply_when");
            field.requestFocus();
            field.post(() -> field.requestRectangleOnScreen(new Rect(0, 0, field.getWidth(), field.getHeight()), false));
        });
        Button cancel = ui.button(text.get("auto_reply_cancel"));
        cancel.setTag("auto_reply_cancel");
        cancel.setOnClickListener(clicked -> {
            invalidateAutoReplyImports();
            pruneAutoReplyPictures(prefs);
            dialog.dismiss();
        });
        // Back or a tap outside throws the edits away like Cancel. The dismiss listener can't do this: it also runs
        // when the screen is rebuilt with the edits kept as a draft.
        dialog.setOnCancelListener(canceled -> {
            invalidateAutoReplyImports();
            pruneAutoReplyPictures(prefs);
        });
        sheet.action(cancel);
        Button save = ui.primaryButton(text.get("auto_reply_save"));
        autoReplySave = save;
        save.setTag("auto_reply_save");
        save.setOnClickListener(clicked -> {
            if (!autoReplyPictureOps.isEmpty()) {
                feedback(text.get("auto_reply_picture_copying"), Toast.LENGTH_SHORT);
                return;
            }
            List<AutoReply.Rule> rules = new ArrayList<>();
            EditText firstInvalid = null;
            for (int i = 0; i < list.getChildCount(); i++) {
                View card = list.getChildAt(i);
                EditText when = card.findViewWithTag("auto_reply_when"), reply = card.findViewWithTag("auto_reply_reply");
                AutoReply.Rule rule = new AutoReply.Rule(when.getText().toString(), reply.getText().toString(), autoReplyPictures.get(card));
                // A picture only asks for a reply where its row shows. Without the row the card looks blank and goes like one.
                boolean pictureShown = rule.picture != null && card.findViewWithTag("auto_reply_picture_thumb") != null;
                if ((!rule.when.isEmpty() || pictureShown) && rule.reply.isEmpty()) {
                    TextView error = card.findViewWithTag("auto_reply_error");
                    error.setVisibility(View.VISIBLE);
                    reply.setBackground(ui.interactive(ui.surface, ui.error, 12, ui.error));
                    if (Build.VERSION.SDK_INT >= 30) reply.setStateDescription(text.get("auto_reply_required"));
                    if (firstInvalid == null) firstInvalid = reply;
                }
                rules.add(rule);
            }
            if (firstInvalid != null) {
                firstInvalid.requestFocus();
                firstInvalid.requestRectangleOnScreen(new Rect(0, 0, firstInvalid.getWidth(), firstInvalid.getHeight()), false);
                firstInvalid.announceForAccessibility(text.get("auto_reply_required"));
                return;
            }
            invalidateAutoReplyImports();
            int kept = AutoReply.save(prefs, rules, groups.isChecked());
            pruneAutoReplyPictures(prefs);
            feedback(kept == 0 ? text.get("auto_reply_saved_none") : text.get("auto_reply_saved", kept), Toast.LENGTH_SHORT);
            dialog.dismiss();
        });
        sheet.action(save);
        refreshReplyCount();
        sheet.show();
        if (draft != null) sheet.post(() -> {
            int index = draft.getInt("focus_index", -1);
            String tag = draft.getString("focus_tag");
            if (index >= 0 && index < list.getChildCount() && tag != null) {
                EditText field = list.getChildAt(index).findViewWithTag(tag);
                if (field != null) {
                    field.requestFocus();
                    int length = field.length();
                    field.setSelection(Math.max(0, Math.min(length, draft.getInt("selection_start", length))),
                        Math.max(0, Math.min(length, draft.getInt("selection_end", length))));
                }
            }
            sheet.scroll.scrollTo(0, draft.getInt("scroll"));
        });
        if (pendingAutoReplyPicture != null) {
            android.net.Uri picked = pendingAutoReplyPicture;
            pendingAutoReplyPicture = null;
            copyAutoReplyPicture(picked, pendingAutoReplyPictureFor, pendingAutoReplyPictureId);
            pendingAutoReplyPictureId = null;
        }
    }

    /** Deletes picture copies no saved reply uses: the ones picked and then discarded, or swapped for another. */
    private void pruneAutoReplyPictures(SharedPreferences prefs) {
        Set<String> keep = new java.util.HashSet<>();
        for (AutoReply.Rule rule : AutoReply.rules(prefs)) if (rule.picture != null) keep.add(rule.picture);
        try {
            AutoReplyPicture.prune(getApplicationContext(), keep);
        } catch (RuntimeException failed) {
            android.util.Log.w("HushMessenger", "auto_reply: unused pictures weren't cleared", failed);
        }
    }

    /** The picture part of a reply card: a thumbnail, a line saying what happens, and pick and remove buttons. */
    private void autoReplyPictureRow(LinearLayout card, String picture) {
        ui.add(card, ui.text(text.get("auto_reply_picture"), 14, ui.text, true), 16);
        LinearLayout shown = ui.row();
        shown.setGravity(Gravity.CENTER_VERTICAL);
        android.widget.ImageView thumb = new android.widget.ImageView(this);
        thumb.setTag("auto_reply_picture_thumb");
        thumb.setScaleType(android.widget.ImageView.ScaleType.CENTER_CROP);
        thumb.setContentDescription(text.get("auto_reply_picture_thumb"));
        LinearLayout.LayoutParams square = new LinearLayout.LayoutParams(ui.dp(56), ui.dp(56));
        square.setMarginEnd(ui.dp(12));
        shown.addView(thumb, square);
        TextView status = ui.text("", 13, ui.muted, false);
        status.setTag("auto_reply_picture_status");
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        shown.addView(status, new LinearLayout.LayoutParams(0, -2, 1));
        ui.add(card, shown, 8);
        LinearLayout buttons = ui.row();
        if (ui.largeText) buttons.setOrientation(LinearLayout.VERTICAL);
        buttons.setGravity(Gravity.END);
        Button pick = ui.button(text.get("auto_reply_picture_pick"));
        pick.setTag("auto_reply_picture_pick");
        pick.setOnClickListener(clicked -> pickAutoReplyPicture(card));
        buttons.addView(pick);
        Button clear = ui.button(text.get("auto_reply_picture_clear"));
        clear.setTag("auto_reply_picture_clear");
        clear.setOnClickListener(clicked -> {
            invalidateAutoReplyImport(card);
            setAutoReplyPicture(card, null);
            pick.requestFocus();
        });
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(-2, -2);
        if (ui.largeText) gap.topMargin = ui.dp(8);
        else gap.setMarginStart(ui.dp(8));
        buttons.addView(clear, gap);
        ui.add(card, buttons, 8);
        setAutoReplyPicture(card, picture);
    }

    /** Shows [name] on its card. The file stays until Save or Cancel, so a draft can still bring it back. */
    private void setAutoReplyPicture(View card, String name) {
        String picture = AutoReplyPicture.validName(name) ? name : null;
        autoReplyPictures.put(card, picture);
        android.widget.ImageView thumb = card.findViewWithTag("auto_reply_picture_thumb");
        if (thumb == null) return;
        android.graphics.Bitmap small = picture == null ? null : AutoReplyPicture.thumbnail(this, picture, ui.dp(56));
        thumb.setImageBitmap(small);
        thumb.setVisibility(small == null ? View.GONE : View.VISIBLE);
        ((TextView) card.findViewWithTag("auto_reply_picture_status")).setText(text.get(picture == null ? "auto_reply_picture_none" :
            small == null ? "auto_reply_picture_missing" : "auto_reply_picture_set"));
        ((Button) card.findViewWithTag("auto_reply_picture_pick")).setText(text.get(picture == null ? "auto_reply_picture_pick" : "auto_reply_picture_change"));
        card.findViewWithTag("auto_reply_picture_clear").setVisibility(picture == null ? View.GONE : View.VISIBLE);
    }

    private void pickAutoReplyPicture(View card) {
        if (autoReplyList == null) return;
        invalidateAutoReplyImport(card);
        setAutoReplyPicture(card, autoReplyPictures.get(card));
        autoReplyPictureFor = autoReplyList.indexOfChild(card);
        autoReplyPictureId = autoReplyCardIds.get(card);
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*");
        try { startActivityForResult(picker, PICK_AUTO_REPLY_PICTURE); }
        catch (android.content.ActivityNotFoundException missing) {
            autoReplyPictureFor = -1;
            autoReplyPictureId = null;
            feedback(text.get("auto_reply_picture_no_picker"), Toast.LENGTH_LONG);
        }
        catch (RuntimeException error) {
            autoReplyPictureFor = -1;
            autoReplyPictureId = null;
            feedback(text.get("auto_reply_picture_failed"), Toast.LENGTH_LONG);
        }
    }

    /** Copies a selection only for its original card and current operation. */
    private void copyAutoReplyPicture(android.net.Uri uri, int index, String cardId) {
        if (cardId != null && autoReplyList != null) {
            index = -1;
            for (int i = 0; i < autoReplyList.getChildCount(); i++)
                if (cardId.equals(autoReplyCardIds.get(autoReplyList.getChildAt(i)))) { index = i; break; }
        }
        if (autoReplyList == null || index < 0 || index >= autoReplyList.getChildCount()) return;
        View card = autoReplyList.getChildAt(index);
        AutoReplyPicture.Import operation = new AutoReplyPicture.Import();
        cancelAutoReplyImport(autoReplyPictureOps.put(card, operation));
        updateAutoReplySave();
        TextView status = card.findViewWithTag("auto_reply_picture_status");
        if (status != null) status.setText(text.get("auto_reply_picture_copying"));
        View clear = card.findViewWithTag("auto_reply_picture_clear");
        if (clear != null) clear.setVisibility(View.VISIBLE);
        Context app = getApplicationContext();
        Runnable worker = () -> {
            String name = null;
            AutoReplyPicture.Failure.Kind why = null;
            try {
                name = AutoReplyPicture.copy(app, uri, operation);
            } catch (AutoReplyPicture.Failure failed) {
                android.util.Log.w("HushMessenger", "auto_reply: the picked picture wasn't copied, " + failed.getMessage());
                why = failed.kind;
            } catch (java.io.IOException | RuntimeException | OutOfMemoryError failed) {
                android.util.Log.w("HushMessenger", "auto_reply: the picked picture couldn't be copied, " + failed.getClass().getName());
                why = AutoReplyPicture.Failure.Kind.UNREADABLE;
            }
            String copied = name;
            AutoReplyPicture.Failure.Kind reason = why;
            runOnUiThread(() -> placeAutoReplyPicture(card, operation, copied, reason));
        };
        // The worker checks the same deadline, but a picker stuck in open() only stops when this gives up on it.
        autoReplyDeadlines.postAtTime(() -> {
            if (autoReplyPictureOps.get(card) != operation) return;
            operation.cancel();
            placeAutoReplyPicture(card, operation, null, AutoReplyPicture.Failure.Kind.TOO_SLOW);
        }, operation, android.os.SystemClock.uptimeMillis() + AutoReplyPicture.DEADLINE_MS);
        try { AutoReplyPicture.submit(operation, worker); }
        catch (java.util.concurrent.RejectedExecutionException busy) {
            placeAutoReplyPicture(card, operation, null, AutoReplyPicture.Failure.Kind.TOO_SLOW);
        }
    }

    private void placeAutoReplyPicture(View card, AutoReplyPicture.Import operation, String name, AutoReplyPicture.Failure.Kind why) {
        autoReplyDeadlines.removeCallbacksAndMessages(operation);
        if (isFinishing() || isDestroyed() || autoReplyList == null || autoReplyList.indexOfChild(card) < 0 ||
                autoReplyPictureOps.get(card) != operation) {
            discardAutoReplyPicture(name);
            return;
        }
        autoReplyPictureOps.remove(card);
        updateAutoReplySave();
        if (name == null) feedback(text.get(why == AutoReplyPicture.Failure.Kind.TOO_BIG ? "auto_reply_picture_too_big"
            : why == AutoReplyPicture.Failure.Kind.TOO_SLOW ? "auto_reply_picture_too_slow" : "auto_reply_picture_failed"), Toast.LENGTH_LONG);
        setAutoReplyPicture(card, name == null ? autoReplyPictures.get(card) : name);
    }

    /** Stops a replaced or abandoned copy, so it drops its queue slot, its picker stream and the card it holds. */
    private void cancelAutoReplyImport(AutoReplyPicture.Import operation) {
        if (operation == null) return;
        autoReplyDeadlines.removeCallbacksAndMessages(operation);
        operation.cancel();
    }

    private void updateAutoReplySave() {
        if (autoReplySave != null) autoReplySave.setEnabled(autoReplyPictureOps.isEmpty());
    }

    private void invalidateAutoReplyImport(View card) {
        cancelAutoReplyImport(autoReplyPictureOps.remove(card));
        if (autoReplyPictureId != null && autoReplyPictureId.equals(autoReplyCardIds.get(card))) {
            autoReplyPictureId = null;
            autoReplyPictureFor = -1;
        }
        updateAutoReplySave();
    }

    private void invalidateAutoReplyImports() {
        for (AutoReplyPicture.Import operation : autoReplyPictureOps.values()) cancelAutoReplyImport(operation);
        autoReplyPictureOps.clear();
        autoReplyPictureFor = -1;
        autoReplyPictureId = null;
        pendingAutoReplyPicture = null;
        pendingAutoReplyPictureId = null;
        updateAutoReplySave();
    }

    private void discardAutoReplyPicture(String name) {
        if (name == null || autoReplyPictures.containsValue(name)) return;
        if (Settings.preferences != null) for (AutoReply.Rule rule : AutoReply.rules(Settings.preferences))
            if (name.equals(rule.picture)) return;
        java.io.File orphan = AutoReplyPicture.fileFor(getApplicationContext(), name);
        if (orphan != null && orphan.exists() && !orphan.delete())
            android.util.Log.w("HushMessenger", "auto_reply: an unused picture couldn't be deleted");
    }

    private void refreshReplyCount() {
        if (autoReplyList == null) return;
        int count = autoReplyList.getChildCount();
        autoReplyCount.setText(text.get("auto_reply_count", text.number(count), text.number(AutoReply.MAX_RULES)));
        autoReplyAdd.setEnabled(count < AutoReply.MAX_RULES);
        for (int i = 0; i < count; i++) {
            View card = autoReplyList.getChildAt(i);
            ((TextView) card.findViewWithTag("auto_reply_number")).setText(text.get("auto_reply_number", text.number(i + 1)));
            card.findViewWithTag("auto_reply_remove").setContentDescription(text.get("auto_reply_remove_number", text.number(i + 1)));
        }
    }

    private View autoReplyCard(LinearLayout list, AutoReply.Rule rule) {
        LinearLayout card = ui.column();
        autoReplyCardIds.put(card, java.util.UUID.randomUUID().toString());
        card.setBackground(ui.shape(ui.surface, ui.line, 12));
        card.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(12));
        TextView number = ui.text("", 13, ui.accent, true);
        number.setTag("auto_reply_number");
        number.setAccessibilityHeading(true);
        card.addView(number);
        EditText when = replyField(card, "auto_reply_when", text.get("auto_reply_when"), text.get("auto_reply_when_hint"), rule.when, AutoReply.MAX_WHEN_CHARS, true);
        ui.add(card, ui.text(text.get("auto_reply_any"), 13, ui.muted, false), 6);
        EditText reply = replyField(card, "auto_reply_reply", text.get("auto_reply_reply"), text.get("auto_reply_reply_hint"), rule.reply, AutoReply.MAX_REPLY_CHARS, false);
        TextView error = ui.text(text.get("auto_reply_required"), 13, ui.error, false);
        error.setTag("auto_reply_error");
        error.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        error.setVisibility(View.GONE);
        ui.add(card, error, 6);
        TextWatcher clearError = new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (error.getVisibility() != View.VISIBLE) return;
                error.setVisibility(View.GONE);
                reply.setBackground(ui.interactive(ui.surface, ui.outline, 12));
                if (Build.VERSION.SDK_INT >= 30) reply.setStateDescription(null);
            }
            @Override public void afterTextChanged(Editable value) { }
        };
        when.addTextChangedListener(clearError);
        reply.addTextChangedListener(clearError);
        // Without the row the card still carries its picture, so Save doesn't drop it and prune doesn't delete the file.
        if (AutoReplyPicture.supported()) autoReplyPictureRow(card, rule.picture);
        else setAutoReplyPicture(card, rule.picture);
        LinearLayout row = ui.row();
        row.setGravity(Gravity.END);
        Button remove = ui.button(text.get("auto_reply_remove"));
        remove.setTag("auto_reply_remove");
        remove.setOnClickListener(clicked -> {
            int index = list.indexOfChild(card);
            invalidateAutoReplyImport(card);
            autoReplyPictures.remove(card);
            autoReplyCardIds.remove(card);
            list.removeView(card);
            refreshReplyCount();
            if (list.getChildCount() == 0) autoReplyAdd.requestFocus();
            else list.getChildAt(Math.min(index, list.getChildCount() - 1)).findViewWithTag("auto_reply_when").requestFocus();
        });
        row.addView(remove);
        ui.add(card, row, 12);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = ui.dp(12);
        card.setLayoutParams(params);
        return card;
    }

    private EditText replyField(LinearLayout card, String tag, String title, String hint, String value, int max, boolean singleLine) {
        EditText field = ui.field(hint, max, singleLine);
        field.setTag(tag);
        field.setText(value);
        if (!singleLine) {
            field.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_FLAG_CAP_SENTENCES |
                android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE);
            field.setMinLines(2);
            // The sheet owns vertical scrolling, so long replies grow instead of trapping drags in a nested editor.
            field.setGravity(Gravity.TOP | Gravity.START);
        }
        TextView label = ui.text(title, 14, ui.text, true);
        label.setLabelFor(field.getId());
        ui.add(card, label, 16);
        ui.add(card, field, 8);
        return field;
    }

    private Bundle autoReplyDraft() {
        if (autoReplyDialog == null || autoReplyList == null) return null;
        Bundle draft = new Bundle();
        ArrayList<String> words = new ArrayList<>(), replies = new ArrayList<>(), pictures = new ArrayList<>(), ids = new ArrayList<>();
        for (int i = 0; i < autoReplyList.getChildCount(); i++) {
            View card = autoReplyList.getChildAt(i);
            EditText when = card.findViewWithTag("auto_reply_when"), reply = card.findViewWithTag("auto_reply_reply");
            words.add(when.getText().toString());
            replies.add(reply.getText().toString());
            String picture = autoReplyPictures.get(card);
            pictures.add(picture == null ? "" : picture);
            ids.add(autoReplyCardIds.get(card));
            EditText focused = when.hasFocus() ? when : reply.hasFocus() ? reply : null;
            if (focused != null) {
                draft.putInt("focus_index", i);
                draft.putString("focus_tag", (String) focused.getTag());
                draft.putInt("selection_start", focused.getSelectionStart());
                draft.putInt("selection_end", focused.getSelectionEnd());
            }
        }
        draft.putStringArrayList("words", words);
        draft.putStringArrayList("replies", replies);
        draft.putStringArrayList("pictures", pictures);
        draft.putStringArrayList("card_ids", ids);
        draft.putInt("picture_for", autoReplyPictureFor);
        draft.putString("picture_for_id", autoReplyPictureId);
        draft.putBoolean("groups", autoReplyGroups.isChecked());
        draft.putInt("scroll", autoReplyScroll.getScrollY());
        return draft;
    }

    private void clearMessageLog() {
        if (messageLogClearJob != null && !messageLogClearJob.finished) return;
        messageLogClearJob = new MessageLogClearJob(this);
        loadMessageLog();
        messageLogClearJob.start();
    }

    private void messageLogCleared(MessageLogClearJob job) {
        if (job != messageLogClearJob || isFinishing() || isDestroyed()) return;
        messageLogClearFailed = !job.cleared;
        if (!job.notified) {
            job.notified = true;
            feedback(text.get(job.cleared ? "message_log_cleared" : "message_log_clear_failed"), Toast.LENGTH_LONG);
            // Undo gets the only copy of what went, and nothing is offered after a failed or empty clear.
            List<MessageLog.Entry> removed = job.removed;
            job.removed = null;
            if (started && job.undoable && job.cleared && removed != null && !removed.isEmpty()) {
                offerUndo(text.format("message_log_clear"), () -> restoreMessageLog(removed));
                messageLogUndo = true;
            }
        }
        if (messageLogList != null) loadMessageLog();
    }

    /** Undo for Clear log: writes back the copy the clear kept, off the main thread, ahead of anything logged since. */
    private void restoreMessageLog(List<MessageLog.Entry> removed) {
        MESSAGE_LOG_WORK.execute(() -> {
            boolean restored = MessageLog.restore(removed);
            runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) return;
                feedback(text.get(restored ? "message_log_restored" : "message_log_restore_failed"), Toast.LENGTH_LONG);
                if (messageLogList != null) loadMessageLog();
            });
        });
    }

    /** Clears and their Undos run one at a time in the order they were tapped, so a Clear right after Undo stays cleared. */
    private static final java.util.concurrent.ExecutorService MESSAGE_LOG_WORK = java.util.concurrent.Executors.newSingleThreadExecutor(work -> {
        Thread thread = new Thread(work, "HushMessageLogWork");
        thread.setDaemon(true);
        return thread;
    });

    /** Only the work and its outcome survive rotation. The worker never owns a screen or chat text. */
    private static final class MessageLogClearJob {
        java.lang.ref.WeakReference<SettingsActivity> owner;
        boolean finished, cleared, notified;
        /** Cleared when settings stop while this runs, so coming back before it ends doesn't bring Undo back. */
        boolean undoable = true;
        /** What the clear took, until the page hands it to Undo. */
        List<MessageLog.Entry> removed;

        MessageLogClearJob(SettingsActivity activity) { owner = new java.lang.ref.WeakReference<>(activity); }

        void start() {
            MESSAGE_LOG_WORK.execute(() -> {
                MessageLog.Cleared result = MessageLog.clearForUndo();
                new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> {
                    cleared = result.cleared;
                    removed = result.removed;
                    finished = true;
                    SettingsActivity activity = owner.get();
                    if (activity != null) activity.messageLogCleared(this);
                });
            });
        }
    }

    private String formatSince(long timestamp, String now, String ago) {
        long seconds = (System.currentTimeMillis() - timestamp) / 1000;
        if (seconds < 10) return text.get(now);
        if (seconds < 60) return text.get(ago, text.format("seconds_short", seconds));
        long minutes = seconds / 60;
        if (minutes < 60) return text.get(ago, text.format("minutes_short", minutes));
        long hours = minutes / 60;
        if (hours < 48) return text.get(ago, text.format("hours_short", hours));
        return text.get(ago, text.format("days_short", hours / 24));
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
        restoreStatus.setVisibility(View.GONE);
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
        known.addAll(Settings.SUB_SWITCHES.keySet());
        Map<String, Boolean> supported = new java.util.LinkedHashMap<>();
        int unknown = 0, unavailable = 0;
        for (Map.Entry<String, Boolean> choice : choices.entrySet()) {
            String key = choice.getKey();
            String owner = Settings.SUB_SWITCHES.get(key);
            if ("paused".equals(key) || (known.contains(key) && Settings.installed.contains(owner != null ? owner : key)))
                supported.put(key, choice.getValue());
            else if (known.contains(key)) unavailable++;
            else unknown++;
        }
        String skipped = (unknown == 0 ? "" : " " + text.count("import_unknown", unknown)) +
            (unavailable == 0 ? "" : " " + text.count("import_unavailable", unavailable));
        // A backup carries Auto reply's switch but not its replies. Turning it on here would start answering with
        // whatever replies this phone already has, so it only comes on from this screen. Turning it off still applies.
        boolean autoReplyLeftOff = Boolean.TRUE.equals(supported.get(AutoReply.KEY)) &&
            !Settings.preferences.getBoolean(AutoReply.KEY, false);
        if (autoReplyLeftOff) supported.remove(AutoReply.KEY);
        String autoReply = autoReplyLeftOff ? " " + text.get("import_auto_reply_off") : "";
        if (supported.isEmpty()) {
            restoreResult(autoReplyLeftOff ? text.get("import_auto_reply_off") : text.get("import_no_choices"), skipped);
            return;
        }
        // Every choice starts off, so a value the backup shares with this phone isn't news, and the count says so. The
        // pause isn't a choice; it gets its own sentence.
        int changed = 0, total = 0;
        boolean wasPaused = Settings.preferences.getBoolean("paused", false);
        SharedPreferences.Editor editor = Settings.preferences.edit();
        for (Map.Entry<String, Boolean> choice : supported.entrySet()) {
            if (!"paused".equals(choice.getKey())) {
                total++;
                if (Settings.preferences.getBoolean(choice.getKey(), false) != choice.getValue()) changed++;
            }
            editor.putBoolean(choice.getKey(), choice.getValue());
        }
        editor.apply();
        refreshChoices();
        // A backup can carry the pause, and a restored pause is easy to miss, so it stays in the toast, and so does a
        // pause the backup lifted.
        Boolean pause = supported.get("paused");
        String paused = Boolean.TRUE.equals(pause) ? " " + text.get("changes_paused") + "."
            : Boolean.FALSE.equals(pause) && wasPaused ? " " + text.get("changes_resumed") + "." : "";
        // The choices only match the backup when nothing in it was skipped, held back or left the pause different.
        boolean whole = total > 0 && skipped.isEmpty() && autoReply.isEmpty() && (pause == null || pause == wasPaused);
        String headline = changed == 0 ? text.get(whole ? "import_same" : "import_none_changed")
            : changed == total ? text.count("imported", changed) : text.get("imported_partial", changed, total);
        restoreResult(headline + paused, autoReply + skipped);
    }

    /**
     * The headline goes in the toast. With notes after it, the whole result also stays on the card under the buttons.
     * Both parts are whole SettingsText sentences, already translated, so joining them adds no untranslated text.
     */
    @android.annotation.SuppressLint("SetTextI18n")
    private void restoreResult(String headline, String notes) {
        feedback(headline, Toast.LENGTH_LONG);
        restoreStatus.setText(headline + notes);
        restoreStatus.setVisibility(notes.isEmpty() ? View.GONE : View.VISIBLE);
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request == PICK_AUTO_REPLY_PICTURE) {
            int index = autoReplyPictureFor;
            String cardId = autoReplyPictureId;
            autoReplyPictureFor = -1;
            autoReplyPictureId = null;
            if (index < 0 && cardId == null) return;
            if (result != RESULT_OK || data == null || data.getData() == null) return;
            android.net.Uri picked = data.getData();
            // Only a provider grant, never a path read with Messenger's own access.
            if (!"content".equals(picked.getScheme())) {
                feedback(text.get("auto_reply_picture_failed"), Toast.LENGTH_LONG);
                return;
            }
            if (autoReplyList == null) {
                pendingAutoReplyPicture = picked;
                pendingAutoReplyPictureFor = index;
                pendingAutoReplyPictureId = cardId;
            } else {
                copyAutoReplyPicture(picked, index, cardId);
            }
            return;
        }
        if (request == PICK_FONT) {
            // Cancelled: nothing to do and nothing to say.
            if (result != RESULT_OK || data == null || data.getData() == null) return;
            if ("content".equals(data.getData().getScheme())) copyFontFile(data.getData());
            else feedback(text.get("font_file_unreadable"), Toast.LENGTH_LONG);
            return;
        }
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
            feedback(text.get(request == SAVE_CHOICES ? "export_failed" : "restore_failed"), Toast.LENGTH_LONG);
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
        restoreStatus.setVisibility(View.GONE);
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
        // A file that can't be read isn't a bad backup, so the two get different advice.
        if (!success) feedback(text.get(job.request == SAVE_CHOICES ? "export_failed" : job.invalid ? "import_invalid" : "restore_failed"), Toast.LENGTH_LONG);
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
        /** The document was read but isn't a backup, as opposed to a document that couldn't be read. */
        volatile boolean invalid;
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
            // A read that runs out of time changes nothing. Only a save can leave a cut-off file behind.
            String timeout = request == READ_CHOICES ? "choices_file_timeout_read" : "choices_file_timeout";
            timeoutMessage = screen.text.get(timeout);
            generation = screen.documentGeneration;
            before = ChoiceCodec.encode(Settings.preferences, Settings.installed);
            deadline = () -> {
                SettingsActivity current = owner.get();
                if (current != null && current.documentJob == this) current.cancelDocumentJob(timeout);
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
                if (request == SAVE_CHOICES) {
                    android.net.Uri media = "media".equals(authority) ? uri : null;
                    boolean mediaDocument = "com.android.providers.media.documents".equals(authority);
                    if (android.os.Build.VERSION.SDK_INT >= 29 && (mediaDocument ||
                            "com.android.externalstorage.documents".equals(authority))) {
                        media = android.provider.MediaStore.getMediaUri(context, uri);
                    }
                    if (mediaDocument && media == null)
                        throw new SecurityException("Choices media ownership is unavailable");
                    if (media != null) {
                        if (android.os.Build.VERSION.SDK_INT < 29)
                            throw new SecurityException("Choices media ownership is unavailable");
                        // A third-party picker can return MediaStore rows owned by Messenger.
                        // Check before opening with wt, which can truncate immediately.
                        try (android.database.Cursor row = context.getContentResolver().query(media,
                                new String[] {android.provider.MediaStore.MediaColumns.OWNER_PACKAGE_NAME},
                                null, null, null, cancellation)) {
                            if (row == null || !row.moveToFirst())
                                throw new SecurityException("Choices media ownership is unavailable");
                            String ownerPackage = row.getString(row.getColumnIndexOrThrow(
                                    android.provider.MediaStore.MediaColumns.OWNER_PACKAGE_NAME));
                            if (ownerPackage == null || ownerPackage.isEmpty() || context.getPackageName().equals(ownerPackage) || row.moveToNext())
                                throw new SecurityException("Choices media is private or has unknown ownership");
                        }
                    }
                }
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
                        boolean pipe = false;
                        if (opened.getDeclaredLength() >= 0) {
                            // Older AssetFileDescriptor input skips relative to the provider's position.
                            // Normalize seekable descriptors so the declared slice has an absolute start.
                            try { android.system.Os.lseek(opened.getFileDescriptor(), 0, android.system.OsConstants.SEEK_SET); }
                            catch (android.system.ErrnoException error) {
                                if (error.errno != android.system.OsConstants.ESPIPE)
                                    throw new java.io.IOException("Choices document seek failed", error);
                                pipe = true;
                            }
                        }
                        boolean brokenSkip = pipe && opened.getStartOffset() > 0 &&
                            android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.R;
                        try (java.io.InputStream input = brokenSkip ? pipeSlice(opened) : opened.createInputStream()) {
                            stream = input;
                            if (canceled) return;
                            try { choices = ChoiceCodec.parse(ChoiceCodec.read(input)); }
                            catch (ChoiceCodec.TooLarge | IllegalArgumentException malformed) { invalid = true; throw malformed; }
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

    /**
     * Android 9 and 10 skip to a slice's start before they set its length, so on a pipe that skip reads through an
     * empty slice and moves nothing. Read the start bytes off the descriptor itself, then stop at the declared length.
     */
    static java.io.InputStream pipeSlice(android.content.res.AssetFileDescriptor opened) throws java.io.IOException {
        // Close through the ParcelFileDescriptor, the way createInputStream's stream does, so the later close is a no-op.
        java.io.InputStream raw = new android.os.ParcelFileDescriptor.AutoCloseInputStream(opened.getParcelFileDescriptor());
        byte[] discard = new byte[8192];
        for (long left = opened.getStartOffset(); left > 0; ) {
            int read = raw.read(discard, 0, (int) Math.min(discard.length, left));
            if (read < 0) throw new java.io.EOFException("Choices document ends before its slice");
            left -= read;
        }
        return new java.io.FilterInputStream(raw) {
            long remaining = opened.getDeclaredLength();
            @Override public int read() throws java.io.IOException {
                if (remaining <= 0) return -1;
                int value = super.read();
                if (value >= 0) remaining--;
                return value;
            }
            @Override public int read(byte[] bytes, int offset, int length) throws java.io.IOException {
                if (length == 0) return 0;
                if (remaining <= 0) return -1;
                int read = super.read(bytes, offset, (int) Math.min(length, remaining));
                if (read > 0) remaining -= read;
                return read;
            }
            @Override public long skip(long count) throws java.io.IOException {
                if (count <= 0 || remaining <= 0) return 0;
                long skipped = super.skip(Math.min(count, remaining));
                remaining -= skipped;
                return skipped;
            }
            @Override public int available() throws java.io.IOException {
                return (int) Math.min(super.available(), remaining);
            }
        };
    }

    /**
     * Folders one or two levels under the data dir whose names mention analytics, with how many files they hold and their
     * total size. Shell can't read the data dir, so this is how to see whether Messenger's analytics pile up while Stop
     * analytics uploads is on. Names and sizes only, never what's in the files, and links aren't followed.
     */
    static String analyticsStores(java.io.File dataDir) {
        return analyticsStores(dataDir, 20_000, 2_000);
    }

    /**
     * One budget covers the whole report, so a huge cache, many stores or a folder loop can't hold up the tap: at most
     * {@code entries} directory entries looked at and {@code folders} folders opened. A count cut short ends in "+".
     */
    static String analyticsStores(java.io.File dataDir, int entries, int folders) {
        java.nio.file.Path root = dataDir.toPath();
        int[] budget = {entries, folders};
        java.util.List<java.nio.file.Path> top = folders(root, budget, false);
        if (top == null) return "unreadable";
        java.util.TreeMap<String, java.nio.file.Path> found = new java.util.TreeMap<>();
        for (java.nio.file.Path first : top) {
            if (namesAnalytics(first)) {
                found.put(first.getFileName().toString(), first);
                continue;
            }
            java.util.List<java.nio.file.Path> inner = folders(first, budget, true);
            if (inner != null) for (java.nio.file.Path second : inner) found.put(first.getFileName() + "/" + second.getFileName(), second);
        }
        java.util.List<String> stores = new java.util.ArrayList<>();
        for (java.util.Map.Entry<String, java.nio.file.Path> store : found.entrySet())
            stores.add(storeSize(store.getKey(), store.getValue(), budget));
        return stores.isEmpty() ? "none" : String.join(", ", stores);
    }

    private static boolean namesAnalytics(java.nio.file.Path path) {
        return path.getFileName().toString().toLowerCase(java.util.Locale.ROOT).contains("analytics");
    }

    /** The folders directly in dir, or only those named for analytics, checking a name before touching the entry. Null if dir can't be read. */
    private static java.util.List<java.nio.file.Path> folders(java.nio.file.Path dir, int[] budget, boolean analyticsOnly) {
        java.util.List<java.nio.file.Path> folders = new java.util.ArrayList<>();
        if (budget[1]-- <= 0) return folders;
        try (java.nio.file.DirectoryStream<java.nio.file.Path> entries = java.nio.file.Files.newDirectoryStream(dir)) {
            for (java.nio.file.Path entry : entries) {
                if (budget[0]-- <= 0) break;
                if (analyticsOnly && !namesAnalytics(entry)) continue;
                if (java.nio.file.Files.isDirectory(entry, java.nio.file.LinkOption.NOFOLLOW_LINKS)) folders.add(entry);
            }
        } catch (java.io.IOException | java.nio.file.DirectoryIteratorException | SecurityException e) {
            return null;
        }
        return folders;
    }

    private static String storeSize(String name, java.nio.file.Path dir, int[] budget) {
        long files = 0, bytes = 0;
        boolean cut = false;
        java.util.ArrayDeque<java.nio.file.Path> pending = new java.util.ArrayDeque<>();
        pending.add(dir);
        walk:
        while (!pending.isEmpty()) {
            if (budget[1]-- <= 0) {
                cut = true;
                break;
            }
            try (java.nio.file.DirectoryStream<java.nio.file.Path> entries = java.nio.file.Files.newDirectoryStream(pending.poll())) {
                for (java.nio.file.Path entry : entries) {
                    if (budget[0]-- <= 0) {
                        cut = true;
                        break walk;
                    }
                    java.nio.file.attribute.BasicFileAttributes attributes = java.nio.file.Files.readAttributes(entry,
                        java.nio.file.attribute.BasicFileAttributes.class, java.nio.file.LinkOption.NOFOLLOW_LINKS);
                    if (attributes.isDirectory()) pending.add(entry);
                    else if (attributes.isRegularFile()) {
                        files++;
                        bytes += attributes.size();
                    }
                }
            } catch (java.io.IOException | java.nio.file.DirectoryIteratorException | SecurityException e) {
                // A folder that went away or can't be read just isn't counted.
            }
        }
        String more = cut ? "+" : "";
        return name + " " + files + more + " files " + bytes + more + " bytes";
    }

    private void infoRow(LinearLayout parent, String title, String value) {
        LinearLayout row = ui.row();
        row.setPadding(0, ui.dp(3), 0, ui.dp(3));
        row.addView(ui.text(title, 14, ui.text, false), new LinearLayout.LayoutParams(0, -2, 1));
        row.addView(ui.text(value, 14, ui.muted, false));
        ui.add(parent, row, 0);
    }

    private android.content.SharedPreferences sectionStore() { return getSharedPreferences(SECTIONS_STORE, MODE_PRIVATE); }

    private void saveSections() { sectionStore().edit().putString(OPEN_SECTIONS, String.join(",", openSections)).apply(); }

    /**
     * One accordion section, HushFacebook's way: a header that opens and closes the card under it.
     * The header holds the title, a count the Controls tab fills in and the chevron, in that order.
     */
    private LinearLayout section(LinearLayout parent, String id, View body, int top) {
        LinearLayout group = ui.column();
        group.setTag(id);
        LinearLayout header = ui.row();
        header.setTag("section_" + id);
        header.setMinimumHeight(ui.dp(48));
        header.setPadding(ui.dp(14), ui.dp(10), ui.dp(10), ui.dp(10));
        header.setBackground(ui.interactive(ui.surface, ui.line, 12));
        header.setClickable(true);
        header.setFocusable(true);
        TextView title = ui.heading(text.get(id));
        header.addView(title, new LinearLayout.LayoutParams(0, -2, 1));
        TextView count = ui.text("", 12, ui.muted, false);
        LinearLayout.LayoutParams countParams = new LinearLayout.LayoutParams(-2, -2);
        countParams.setMarginEnd(ui.dp(8));
        header.addView(count, countParams);
        TextView chevron = ui.text(String.valueOf((char) 0x203a), 20, ui.muted, true);
        chevron.setGravity(android.view.Gravity.CENTER);
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        // Square and as big as the glyph, which grows with the text size: it turns a quarter round as the section opens.
        int side = Math.max(ui.dp(24), (int) Math.ceil(Math.max(chevron.getPaint().getFontSpacing(),
            chevron.getPaint().measureText(chevron.getText().toString()))));
        header.addView(chevron, new LinearLayout.LayoutParams(side, side));
        header.setOnClickListener(view -> toggleSection(id));
        header.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(Button.class.getName());
                info.setHeading(true);
                info.addAction(sectionShown(id) ? android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_COLLAPSE
                    : android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_EXPAND);
            }
            @Override public boolean performAccessibilityAction(View host, int action, Bundle args) {
                boolean shown = sectionShown(id);
                if ((action == android.view.accessibility.AccessibilityNodeInfo.ACTION_EXPAND && !shown)
                        || (action == android.view.accessibility.AccessibilityNodeInfo.ACTION_COLLAPSE && shown)) {
                    toggleSection(id);
                    return true;
                }
                return super.performAccessibilityAction(host, action, args);
            }
        });
        ui.add(group, header, 0);
        ui.add(group, body, 6);
        ui.add(parent, group, top);
        sections.put(id, new LinearLayout[] {group, header});
        bindSection(id);
        return group;
    }

    /** Open, or shown by a search that found something in it. A section closed during a search stays closed until the search changes. */
    private boolean sectionShown(String id) {
        LinearLayout[] parts = sections.get(id);
        boolean found = searching && parts != null && groups.contains(parts[0]);
        return found ? !searchClosed.contains(id) : openSections.contains(id);
    }

    private void toggleSection(String id) {
        LinearLayout[] parts = sections.get(id);
        if (searching && parts != null && groups.contains(parts[0])) {
            if (!searchClosed.remove(id)) searchClosed.add(id);
        } else {
            if (!openSections.remove(id)) openSections.add(id);
            saveSections();
        }
        bindSection(id);
        if (parts != null) parts[1].sendAccessibilityEvent(android.view.accessibility.AccessibilityEvent.TYPE_VIEW_SELECTED);
    }

    private void bindSection(String id) {
        LinearLayout[] parts = sections.get(id);
        if (parts == null) return;
        boolean shown = sectionShown(id);
        LinearLayout header = parts[1];
        parts[0].getChildAt(1).setVisibility(shown ? View.VISIBLE : View.GONE);
        ((TextView) header.getChildAt(0)).setTextColor(shown ? ui.accent : ui.muted);
        header.getChildAt(2).setRotation(shown ? -90 : 90);
        header.setActivated(shown);
        if (Build.VERSION.SDK_INT >= 30) header.setStateDescription(text.get(shown ? "section_expanded" : "section_collapsed"));
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
            tab.setTextColor(selected ? ui.selectedText : ui.muted);
            tab.setBackground(ui.interactive(selected ? ui.accentFill : ui.surface, 0, 10));
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
        updateRestartRow();
    }

    private void filterControls(String query) {
        // Every word typed, in any order, with accents and case ignored (SettingsSearch).
        List<String> terms = SettingsSearch.terms(query);
        clearQuery.setVisibility(query.isEmpty() ? View.GONE : View.VISIBLE);
        String drawerWords = "hide app drawer icon launcher settings menu row shortcuts " + text.get("hide_drawer_icon") + " "
            + text.get("hide_menu_row") + " " + text.get("hide_icon_shortcuts") + " " + text.get("hide_logo_press");
        // One letter matches almost anything, so the link waits for a second one.
        drawerSearchLink.setVisibility(controlRows.isEmpty() || (query.trim().length() >= 2 && SettingsSearch.matches(terms, drawerWords)) ? View.VISIBLE : View.GONE);
        int visible = 0;
        for (int i = 0; i < controlRows.size(); i++) {
            String[] spec = installedControls.get(i);
            // A switch inside a control's block is found by its own words too.
            String inside = "facebook".equals(spec[0]) ? text.get("facebook_keep_profile") + " " + text.get("facebook_keep_profile_help") : "";
            if (Settings.TAB_BADGES.equals(spec[0])) for (String keep : Settings.KEEP_BADGES.values()) inside += " " + text.get(keep);
            boolean match = SettingsSearch.matches(terms, spec[1], spec[2],
                SettingsText.english(spec[3]), text.display(text.control(spec, 1)), text.display(text.control(spec, 2)), text.get(spec[3]), inside);
            controlRows.get(i).setVisibility(match ? View.VISIBLE : View.GONE);
            if (match) visible++;
        }
        for (LinearLayout group : groups) {
            int count = 0;
            for (View row : controlRows) if (row.getTag().equals(group.getTag()) && row.getVisibility() == View.VISIBLE) count++;
            group.setVisibility(count == 0 ? View.GONE : View.VISIBLE);
            TextView tally = (TextView) ((LinearLayout) group.getChildAt(0)).getChildAt(1);
            tally.setText(text.number(count));
            tally.setContentDescription(text.count("group_count", count));
        }
        // A search shows every match, so the sections it found open for as long as it's typed.
        searching = !terms.isEmpty();
        searchClosed.clear();
        for (String id : sections.keySet()) bindSection(id);
        searchStatus.setText(controlRows.isEmpty() ? text.get("none_installed") :
            visible == 0 ? text.get("no_matches") : text.get(controlRows.size() == 1 ? "results_one" : "results_many", visible, controlRows.size()));
        // With nothing installed, the status line already explains what to do.
        emptyState.setVisibility(visible == 0 && !controlRows.isEmpty() ? View.VISIBLE : View.GONE);
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        Bundle draft = autoReplyDraft();
        if (draft != null) state.putBundle("auto_reply_draft", draft);
        state.putBoolean("message_log_open", messageLogDialog != null && messageLogDialog.isShowing());
        state.putBoolean("message_log_clear_failed", messageLogClearFailed);
        state.putString("page", page);
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

    /** Opens a web page in the phone's browser, or says why it couldn't. */
    private void openPage(String url) {
        try { startActivity(new Intent(Intent.ACTION_VIEW, android.net.Uri.parse(url)).addCategory(Intent.CATEGORY_BROWSABLE)); }
        catch (android.content.ActivityNotFoundException error) { feedback(text.get("no_browser"), Toast.LENGTH_LONG); }
        catch (SecurityException denied) {
            // Android can refuse a launch it would otherwise resolve. The page and the platform's message stay out of the log.
            android.util.Log.w("HushMessenger", "The phone refused to open a web page from settings");
            feedback(text.get("page_blocked"), Toast.LENGTH_LONG);
        }
    }

    /** One toast at a time, built on the app context so no destroyed page is kept alive. */
    private void feedback(String message, int length) {
        if (toast != null) toast.cancel();
        toast = Toast.makeText(getApplicationContext(), message, length);
        toast.show();
    }

}
