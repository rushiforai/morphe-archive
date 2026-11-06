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
import android.view.Gravity;
import android.os.Build;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.DisplayCutout;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
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
    // Package-private for the sections that live in classes of their own.
    SettingsUi ui;
    SettingsText text;
    private LinearLayout controlsPage, appPage;
    private LinearLayout header, brand, controlsContent, appContent, pageHeader;
    private ScrollView controlsScroll, appScroll;
    private TextView reminder, wordmark, headerName;
    /** The bar title's visibility as last set here, so it changes only when what it should show does. */
    private int barTitleShown = -1;
    private EditText search;
    private boolean compact, scrollHeader, binding, lightTheme, recreatingTheme;
    private int restoreControlsScroll = -1, restoreAppScroll = -1;
    private final List<Switch> switches = new ArrayList<>();
    private final List<RadioButton> bubbleModes = new ArrayList<>();
    private final Map<String, TextView> activityLabels = new java.util.HashMap<>();
    private final Map<Switch, CharSequence> switchDescriptions = new java.util.HashMap<>();
    private final UpdateCheck updates = new UpdateCheck(this);
    private final MessageLogSheet messageLog = new MessageLogSheet(this);
    private final AutoReplySheet autoReplies = new AutoReplySheet(this);
    private final ThemeColors themeColors = new ThemeColors(this);
    private final ChoicesBackup backup = new ChoicesBackup(this);
    private final FontFileRow fontFile = new FontFileRow(this);
    private final HomeHeaderRow homeHeader = new HomeHeaderRow(this);
    private final MessageActionsRow messageActions = new MessageActionsRow(this);
    private final SharedPreferences.OnSharedPreferenceChangeListener preferenceListener = (preferences, key) -> {
        if (key == null || "paused".equals(key) || Settings.SUB_SWITCHES.containsKey(key) || Settings.installed.contains(key))
            backup.choicesChanged();
        refreshChoices();
        if (key == null || "check_updates".equals(key)) updates.syncUpdateChoice(true);
    };
    private String page = "controls";
    private final List<View> controlRows = new ArrayList<>();
    /** The rows under Hide chosen chats, or null while the controls page isn't built. */
    private LinearLayout hiddenChats;
    /** The switch for each chat that called lately under Quiet incoming calls, or null while the page isn't built. */
    private LinearLayout quietCallers;
    private final List<Switch> quietCallerSwitches = new ArrayList<>();
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
    private Button drawerSearchLink, batteryUse;
    private LinearLayout emptyState;
    /** Shown above both pages while a change waits for Messenger to restart. */
    private LinearLayout restartRow;
    private TextView restartWaiting;
    private LinearLayout viewToggle;
    /** Shown above both pages for a few seconds after a Quick setup or Clear log, which act at once with no dialog. */
    private Button undoButton;
    /** What Undo does and when its time runs out. Main thread only, null when nothing can be taken back. */
    private Runnable undoAction, undoExpiry;
    /** Whether the header last laid out with Undo showing, so the page only makes up for Undo coming or going. */
    private boolean undoLaidOut;
    /** Between onStart and onStop. A Clear that finishes while settings are out of sight is final at once. */
    boolean started;
    static final int UNDO_MILLIS = 10_000;
    static final int SAVE_CHOICES = 7101, READ_CHOICES = 7102, PICK_FONT = 7103, PICK_AUTO_REPLY_PICTURE = 7104, SAVE_MESSAGE_LOG = 7105,
        PICK_HOME_HEADER = 7106;
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
    // Process-wide so a page recreated by the theme switch can still replace the last toast.
    static Toast toast;
    static final String SUPPORT_PAGE = "https://ko-fi.com/X8K126YVER";
    /** Switches whose effect hasn't been confirmed on a phone. Each shows the Experimental badge. */
    /** The switches that take a way into these settings away, each with a reason when it can't turn on. */
    static final Set<String> WAYS_IN = Set.of("hide_menu_row", Settings.HIDE_ICON_SHORTCUTS, Settings.HIDE_LOGO_PRESS);
    static final Set<String> EXPERIMENTAL = Set.of("pinned_chats", "hidden_chats", "nearby_scans", "phone_id_sync", "mark_read_button", "story_hold", "chat_preview", "quiet_calls", "save_voice", "gallery_to_chat", "call_recording", "inbox_search_bar", "landscape", "restricted_notify");
    static final String[][] CONTROLS = {
        {"people", "Hide People You May Know", "Hides suggested people in chats, search and stories, and on the People and Notifications tabs. Good if you only want people you know.", "inbox"},
        {"friend_requests", "Hide friend request cards", "Hides friend request cards in your chat list. It doesn't accept or decline anyone.", "inbox"},
        {"community_inbox", "Hide joined community chats", "Hides joined community chats from your main chat list. Search and community folders still show them. The list updates the next time it refreshes.", "inbox"},
        {"growth", "Hide growth prompts", "Hides prompts to add more people, tip sheets in notes like Make my notes public, and the Share your own story card.", "inbox"},
        {"inbox_promotions", "Hide inbox promotions", "Hides promotion banners in your chat list.", "inbox"},
        {"stories", "Hide stories and notes", "Hides the row of stories and notes above your chats, and the story rings around profile pictures.", "inbox"},
        {"instants_button", "Hide the Instants button", "Hides the + button that slides in at the right edge of your chat list and the one under your chat heads. Both open Instants.", "inbox"},
        {"subtabs", "Hide inbox tabs", "Hides the All, Unread and Groups tabs above your chats.", "inbox"},
        {"inbox_search_bar", "Keep the search bar", "Brings back the search bar at the top of your chat list when Messenger has swapped it for a search icon. Restart Messenger to see the change. Nothing changes if you never got the icon.", "inbox"},
        {"chat_preview", "Preview chats on long press", "Press and hold a chat to peek at it in Messenger's own preview, with the chat's menu under it, without opening the chat.", "inbox"},
        {"mark_read_action", "Hide Mark as read", "Hides Mark as read in the menu you get when you press and hold a chat in your chat list, so you can't mark a chat read by accident. Mark as unread stays.", "inbox"},
        {"pinned_chats", "Pin more chats", "Lets you pin chats past Messenger's limit and puts Pin back on chats that don't offer it. Pins past the limit stay on this phone, so they won't show on your other devices.", "inbox"},
        {"hidden_chats", "Hide chosen chats", "Adds Hide from chat list to the menu you get when you press and hold a chat. A hidden chat stays off your chat list when new messages come in, and search still finds it. Hiding stays on this phone, and you can unhide chats in HushMessenger settings. It doesn't stop notifications, so mute the chat in Messenger for that.", "inbox"},
        {"facebook", "Hide Facebook shortcuts", "Hides Facebook buttons, profile and sharing shortcuts, and the Also from Meta and Subscriptions sections in the Menu tab. Handy if you only use Messenger.", "navigation"},
        {"meta_ai", "Hide Meta AI", "Hides the Meta AI floating button, toolbar button, tab and menu entries, AI in search and in @ suggestions, and the offer to summarize a chat's unread messages. Restart Messenger to see the tab go.", "navigation"},
        {"moments", "Hide Chat Moments", "Hides Chat Moments in the menu.", "navigation"},
        {"reels_badge", "Hide Reels badge", "Hides the Reels notification badge.", "navigation"},
        {"tab_people", "Hide People tab", "Hides the People tab in the bar at the bottom. Restart Messenger to see the tab go.", "navigation"},
        {"tab_people_show", "Show People tab", "Puts the People tab back in the bar at the bottom, right after Chats, on accounts where Messenger took it away. Hide People tab wins if both are on. Restart Messenger to see the tab.", "navigation"},
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
        {"message_actions", "Customize message actions", "Choose the order of the actions you get when you press and hold a message, and hide the ones you don't use, separately for messages you sent and messages you got. The first ones show in the row under the message and the rest under More. Press and hold a message once and its actions show up below.", "conversations"},
        {"auto_reply", "Auto reply", "Answers a message with a reply you write below when it has words you pick, or any message if you leave the words empty. Replies go out through Messenger's own notification reply, encrypted chats too, at most once every five minutes per chat. One-to-one chats only unless you allow groups. A chat with disappearing messages on gets no notification reply from Messenger, so it isn't answered.", "conversations"},
        {"text_style", "Bold and italic text", "Select words you typed and pick Bold or Italic in the menu that pops up (it can be behind the three dots). Pick it again to undo. Bold changes the letters A to Z (accents are fine) and digits. Italic changes only the letters, and other alphabets stay as they are. They're special Unicode letters, so they show on any phone, but screen readers may read them oddly.", "conversations"},
        {"car_messages", "Android Auto messages", "Lets Android Auto read your messages out loud and send the replies you speak, on its own messaging screen. Android Auto only shows apps from the Play Store. Unknown sources in its developer settings opens that up on a desktop head unit, and a real car can still leave Messenger out. Playing a message aloud marks the chat read and shows Seen, even with Hide read receipts on.", "conversations"},
        {"local_chat_search", "Search saved messages", "Adds a button to a chat's search results that searches the messages saved on this phone. It helps with old chats Messenger's own search finds nothing in. It works in chats that aren't end-to-end encrypted, and it can only find what the phone has loaded, so scroll up in the chat first.", "conversations"},
        {"chat_jump", "Jump to the first message or a date", "Long press a chat's name at the top of the chat to jump to its first message or to a day you pick. Messenger loads a chat a page at a time, so it scrolls back with a count on screen until it gets there, and Cancel stops it. It can only go as far back as Messenger can load.", "conversations"},
        {"landscape", "Allow landscape", "Lets Messenger turn sideways with your phone, for a wider keyboard and bigger photos and videos. It follows your phone's auto-rotate setting. Calls, the camera, payments and a few other screens stay upright. Restart Messenger after you change it.", "conversations"},
        {"quiet_calls", "Quiet incoming calls", "Calls still come in, but Messenger doesn't ring, vibrate or pop the call up over your screen. The call waits in the notification shade with Answer and Decline. A call you miss still shows in the chat. Only chosen chats keeps this to the chats you pick, and every other call rings. If the Facebook app is on your phone, it can still ring for the same call.", "calls"},
        {"call_recording", "Record calls", "Adds a Record button over Messenger during a call. The call goes into one sound file in Recordings/Messenger Calls on your phone (Music/Messenger Calls on Android 10 and 11). While it's on, calls use Android's regular audio path instead of Messenger's own, and Messenger needs a restart after you change it. Messenger doesn't tell the other people, and recording laws differ from place to place, so get everyone's OK first.", "calls"},
        {"hide_call_buttons", "Hide call buttons", "Takes the audio and video call buttons out of a chat's top bar, so you can't tap one by accident. Calls still ring, and you can still join one that's going.", "calls"},
        {"call_confirm", "Ask before a call", "Tapping the audio or video call button in a chat's top bar asks first, so a stray tap doesn't ring anyone. Call starts it, Cancel doesn't. Calls coming in aren't affected.", "calls"},
        {"original_photo", "Send photos at original quality", "With HD on, sends JPEG photos at their full size, not a smaller copy. Location is still removed. Photos over 20 MB are still made smaller.", "photos_videos"},
        {"original_video", "Send videos without re-encoding", "Sends a video as the original file when Messenger allows it, instead of a recompressed copy. Videos over 25 MB and edited videos are still compressed.", "photos_videos"},
        {"xhe_audio", "Fix videos that won't send", "Some videos fail with \"Unable to send\", even in stock Messenger, because of a newer sound format (xHE-AAC) or a tag Samsung's screen recorder adds. This fixes the sound or drops the tag before the video goes out, whether you share it into Messenger or pick it in a chat. The picture isn't touched.", "photos_videos"},
        {"recent_media", "Hide the recent photo card", "Opening a chat right after you take a screenshot, photo or video no longer shows a card above the message box offering to send it. You can still pick it from the gallery.", "photos_videos"},
        {"save_voice", "Save voice messages you play", "Each voice message you play is also saved to Recordings/Messenger on your phone (Music/Messenger on Android 10 and 11), where a file manager or another player can open it. Playing it again doesn't save another copy.", "photos_videos"},
        {"save_voice_menu", "Save button for voice messages", "Hold a voice message and tap More: Save voice message is the top row there, for saving just that one. It goes in the same folder as Save voice messages you play, and that switch can stay off.", "photos_videos"},
        {"share_story", "Hide Your story when sharing", "When you share a photo, video or link into Messenger from another app, the Send to list no longer offers Your story, so a tap on Add can't post it by mistake. Your chats and groups are still there.", "photos_videos"},
        {"system_camera", "Use the phone's camera app", "The camera button in a chat opens your phone's camera app. The photo opens in Messenger's editor, ready to send. Photos only.", "photos_videos"},
        {"external_gallery", "Open your gallery app", "The gallery button in a chat opens your phone's own gallery app. One photo or video opens in Messenger's editor for that chat, ready to send. Pick several and Messenger's Send to sheet opens with all of them and that chat at the top.", "photos_videos"},
        {"gallery_to_chat", "Put gallery picks in the chat", "With Open your gallery app on, what you pick goes into the chat's message box like Messenger's own gallery, instead of the editor or the Send to sheet. Nothing sends until you tap Send. A chat that was already open needs opening again.", "photos_videos"},
        {"external_browser", "Open web links externally", "Opens web links (http and https) in your default browser. Other link types work as before.", "links_bubbles"},
        {"bubbles", "Allow chat bubbles", "Choose Stock, Chat heads or Android bubbles below. Android bubbles need Android 11 or newer, a supported account and notification permission. Restart Messenger after changing.", "links_bubbles"},
        {"analytics_uploads", "Stop analytics uploads", "Stops Messenger's background services from uploading usage statistics. It still records them on your phone, and they can upload after you turn this off.", "privacy"},
        {"attribution_uploads", "Stop ad attribution uploads", "Stops the job that reads your phone's advertising ID and sends it to Meta with your ad tracking setting. The ID itself doesn't change.", "privacy"},
        {"ad_events", "Stop inbox and ad link logging", "Stops two reports Messenger logs. One says which part of your chat list was on screen, which Messenger files under inbox ads. The other says which ad brought you in when a link from an ad opens a chat.", "privacy"},
        {"mqtt_telemetry", "Stop live connection logging", "Drops the health reports and push logging Messenger sends over its live connection (MQTT). Messenger sends most of its traffic another way, so there's often little for it to drop. Messages, calls and active status keep working.", "privacy"},
        {"nearby_scans", "Stop nearby scans", "Stops Messenger from reading the list of Wi-Fi networks around you, and hides the name and hardware address of the one you're connected to, the way Android does when Messenger can't see your location. Also stops the timer it can run while it's open to check your location and scan for Wi-Fi networks and Bluetooth devices.", "privacy"},
        {"phone_id_sync", "Stop app list and device ID sharing", "Stops Messenger from going through the apps on your phone to find other Meta apps, and from asking them for the device ID Meta uses to link the apps on one phone. Messenger keeps the ID it already has.", "privacy"},
        {"message_log", "Keep a message log", "Saves each message when its notification arrives, so you can read it after it's unsent, and marks the ones that were. Works in encrypted chats. Stays on your phone. In a chat with disappearing messages on, Messenger leaves the words out of its notification, so those messages aren't logged.", "privacy"},
        {"allow_screenshot", "Allow screenshots", "Lets you screenshot protected chat media, such as view-once photos and Quicksnap, and stops screenshot notices. It doesn't add replay or saving.", "privacy"},
        {"hide_read_receipts", "Hide read receipts", "Opening a chat no longer tells people you read their message, and the chat stays unread here. Marking it read yourself or replying marks it read and shows Seen, like Messenger does. Group chats aren't tested. Messenger's own Read receipts setting under Privacy & safety marks chats read without Seen.", "privacy"},
        {"mark_read_button", "Mark as read button", "Puts Messenger's Mark as read icon in a chat's top bar while Hide read receipts is on. Opening the chat still sends nothing. Tap the icon when you want the sender to see Seen, and the chat turns read here too. When the bar is full it takes the place of the chat details button (tapping the chat's name opens the same page), or of another button that isn't for calls when a chat doesn't have one, so the call buttons stay put.", "privacy"},
        {"keep_unsent", "Keep unsent messages", "Keeps messages on screen after someone unsends them, in chats where it works. In encrypted chats the message stays in its notification instead. Group chats aren't tested. Your own unsends may be limited.", "privacy"},
        {"anonymous_stories", "View stories anonymously", "Opens other people's stories without adding you to their viewer list. Messenger still marks them as seen on your side.", "privacy"},
        {"save_stories", "Save any story", "Adds Save to the More options menu on other people's stories, so you can keep the photo or video on your phone.", "privacy"},
        {"blocked_list_pictures", "Hide pictures on the Blocked list", "Hides people's profile pictures on the list of people you've blocked, under Privacy and safety. Their names and Unblock stay.", "privacy"},
        {"restricted_notify", "Notify for restricted chats", "Chats with people you've restricted notify you like your other chats. A chat you've muted stays quiet. Restricted people still can't see when you're active or when you've read their messages.", "privacy"},
        {"material_you", "Material You theme", "Colors Messenger's dark mode with your wallpaper colors on Android 12 and newer, and a fixed blue on Android 11. Turn on dark mode in Messenger first. Light mode keeps its colors unless you turn on Light mode accent.", "theme"},
        {"app_icons", "Unlock app icons", "Lets you pick any icon in Messenger's App icon setting without a subscription. Messenger decides whether that setting shows for you. Turning this off can bring the default icon back.", "theme"},
        {"app_themes", "Unlock app themes", "Lets you pick any theme in Messenger's Theme setting without a subscription, so light mode can get a color too. Messenger still decides which themes it offers your account.", "theme"},
        {"avatar_shape", "Square profile pictures", "Shows people's profile pictures as squares instead of circles. Turn on Round the corners below for rounded squares. Restart Messenger to see the change.", "theme"},
        {"home_header", "Your own home header", "Puts words or a picture of your own at the top of the chat list in place of Messenger's wordmark. Type the words or choose the picture below. With neither, the wordmark stays. Restart Messenger to see a change.", "theme"},
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
                // The header above can leave a short list of matches too little page to lift the search to the top,
                // so the page grows while the search has focus, and then the reveal runs again.
                int room = row.getTop() + Math.max(row.getHeight(), viewport) + controlsContent.getPaddingBottom();
                if (controlsContent.getHeight() < room && controlsContent.getMinimumHeight() < room) {
                    revealSearch = true;
                    controlsContent.post(() -> controlsContent.setMinimumHeight(room));
                    return;
                }
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
        // The page opens on HushMessenger's icon, name and version, and the bar leaves the name off while it shows.
        pageHeader = SettingsHeader.create(this, ui, text, hostVersion());
        controlsContent.addView(pageHeader, new LinearLayout.LayoutParams(-1, -2));
        headerName = pageHeader.findViewWithTag(SettingsHeader.NAME);
        headerName.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> updateBarTitle());
        controlsScroll.setOnScrollChangeListener((view, x, y, oldX, oldY) -> updateBarTitle());
        buildControls(controlsContent);
        reminder = ui.text(text.get("reopen"), 12, ui.muted, false);
        reminder.setPadding(ui.dp(18), ui.dp(12), ui.dp(18), ui.dp(32));
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
            if (draft != null) autoReplies.restorePick(draft);
            messageLog.restoreState(state);
            if (draft != null) root.post(() -> autoReplies.showAutoReplies(draft));
            else if (state.getBoolean("message_log_open")) root.post(messageLog::showMessageLog);
        }
        messageLog.adopt(getLastNonConfigurationInstance(), root);
        // The top bar's message log button opens straight into the log. Coming back from a rotation or a restart keeps whatever was showing.
        if (state == null && getIntent().getBooleanExtra(MessageLogSheet.OPEN_EXTRA, false)) root.post(messageLog::showMessageLog);
    }

    @Override public Object onRetainNonConfigurationInstance() { return messageLog.retained(); }

    @Override protected void onStart() {
        super.onStart();
        started = true;
        Settings.preferences.registerOnSharedPreferenceChangeListener(preferenceListener);
    }

    @Override protected void onResume() {
        super.onResume();
        refreshChoices();
        if (hiddenChats != null) fillHiddenChats();
        if (quietCallers != null) fillQuietCallers();
        messageActions.fill(null);
        updates.syncUpdateChoice(false);
    }

    @Override protected void onPause() {
        // Coming back from an Android screen measures the list again, and a focused search then pulls it back up to its
        // cursor. One scrolled out of sight lets go, so the list stays where it was.
        if (search != null && search.hasFocus() && !inList(search)) search.clearFocus();
        super.onPause();
    }

    @Override protected void onStop() {
        // Leaving settings makes a Quick setup or a Clear final, one still running included.
        started = false;
        homeHeader.saveWords();
        messageLog.stop();
        endUndo();
        Settings.preferences.unregisterOnSharedPreferenceChangeListener(preferenceListener);
        super.onStop();
    }

    @Override protected void onDestroy() {
        autoReplies.destroy();
        messageLog.destroy();
        backup.destroy();
        updates.cancelUpdateCheck();
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

    void refreshChoices() {
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
        // Coming back from Android's battery prompt or app info shows what was chosen there.
        if (batteryUse != null) {
            String label = batteryLabel();
            if (!label.contentEquals(batteryUse.getText())) batteryUse.setText(label);
        }
        fontFile.refreshFontFile();
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
        // Content pages already pad 18 dp, so a header or reminder moved inside them adds none.
        header.setPadding(ui.dp(scrollHeader ? 0 : 16), ui.dp(compact ? 4 : 8), ui.dp(scrollHeader ? 0 : 16), 0);
        placeBrand();
        placeHeader();
        ((ViewGroup) reminder.getParent()).removeView(reminder);
        reminder.setPadding(ui.dp(compact ? 0 : 18), ui.dp(12), ui.dp(compact ? 0 : 18), ui.dp(compact ? 16 : 32));
        ui.add(compact ? controlsContent : controlsPage, reminder, 0);
        // A short window keeps its height for the rows, so the bar names the page instead.
        if (pageHeader != null) pageHeader.setVisibility(compact ? View.GONE : View.VISIBLE);
        updateBarTitle();
    }

    /** Messenger's version name, or null when Android doesn't say. */
    private String hostVersion() {
        try {
            return getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException unknown) {
            return null;
        }
    }

    /** The bar's title: Search settings while there's a search, else HushMessenger unless the page's header shows it. */
    private void updateBarTitle() {
        if (wordmark == null || search == null) return;
        // The search lives on the Controls tab, so a search left typed there doesn't rename the App tab.
        boolean typed = "controls".equals(page) && !search.getText().toString().trim().isEmpty();
        CharSequence shown = typed ? text.get("search_settings") : "HushMessenger";
        if (!android.text.TextUtils.equals(shown, wordmark.getText())) wordmark.setText(shown);
        // Invisible rather than gone, so the bar keeps its height and the rows don't jump as the header scrolls.
        int visibility = !typed && headerNameShown() ? View.INVISIBLE : View.VISIBLE;
        if (visibility == barTitleShown) return;
        barTitleShown = visibility;
        wordmark.setVisibility(visibility);
    }

    /** Whether any of the header's name is on screen, counting a header not laid out yet as showing. */
    private boolean headerNameShown() {
        if (headerName == null || !headerName.isShown()) return false;
        if (headerName.getHeight() == 0) return true;
        android.graphics.Rect place = new android.graphics.Rect(0, 0, headerName.getWidth(), headerName.getHeight());
        controlsContent.offsetDescendantRectToMyCoords(headerName, place);
        return place.bottom > controlsScroll.getScrollY();
    }

    private void placeBrand() {
        if (brand == null || appContent == null) return;
        LinearLayout parent = compact ? ("app".equals(page) ? appContent : controlsContent) : header;
        if (brand.getParent() == parent) return;
        ((ViewGroup) brand.getParent()).removeView(brand);
        LinearLayout.LayoutParams params = brandSpace(parent);
        params.bottomMargin = ui.dp(compact ? 12 : 0);
        parent.addView(brand, 0, params);
    }

    /** The brand row's place: into its parent's padding, so Back's touch area starts 4 dp from the edge and its arrow 16. */
    private LinearLayout.LayoutParams brandSpace(LinearLayout parent) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        // The header pads 16 dp, a page 18.
        params.setMarginStart(-ui.dp(parent == header ? 12 : 14));
        return params;
    }

    private void placeHeader() {
        LinearLayout parent = scrollHeader ? ("app".equals(page) ? appContent : controlsContent) : (LinearLayout) controlsPage.getParent();
        if (header.getParent() != parent) {
            ((ViewGroup) header.getParent()).removeView(header);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
            if (scrollHeader) {
                // Inside a page the bar keeps the 16 dp line it has above one.
                params.setMarginStart(-ui.dp(2));
                params.setMarginEnd(-ui.dp(2));
            }
            parent.addView(header, 0, params);
        }
        placeRestartBar(parent);
    }

    /**
     * The restart bar sits under the list, on the 18 dp line and above the gesture bar the window pads for. When the keyboard
     * leaves the list almost no room, it goes into the page under the bar, with the header, and scrolls away with it.
     */
    private void placeRestartBar(LinearLayout parent) {
        if (restartRow.getParent() == parent) return;
        if (restartRow.getParent() != null) ((ViewGroup) restartRow.getParent()).removeView(restartRow);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        // A page's content already pads 18 dp at the sides.
        int side = ui.dp(scrollHeader ? 0 : 18);
        params.setMargins(side, ui.dp(8), side, ui.dp(8));
        if (scrollHeader) parent.addView(restartRow, parent.indexOfChild(header) + 1, params);
        else parent.addView(restartRow, params);
    }

    @SuppressWarnings("deprecation")
    private void buildHeader(LinearLayout root) {
        // A toolbar, like HushFacebook's: Back, the name, Open and the two tabs, with no banner above the settings.
        header = ui.column();
        header.setPadding(ui.dp(16), ui.dp(8), ui.dp(16), 0);
        // The bar reaches into the padding, so Back's arrow lines up 16 dp from the edge with all 48 dp of it tappable.
        header.setClipToPadding(false);
        ui.add(root, header, 0);
        brand = ui.row();
        if (ui.largeText) brand.setOrientation(LinearLayout.VERTICAL);
        LinearLayout bar = ui.row();
        android.widget.ImageButton back = new android.widget.ImageButton(this);
        back.setTag("back");
        back.setImageDrawable(SettingsIcons.icon(this, SettingsIcons.BACK, ui.heading));
        back.setScaleType(android.widget.ImageView.ScaleType.CENTER);
        back.setPadding(0, 0, 0, 0);
        back.setBackground(ui.interactive(ui.background, 0, 12, ui.heading));
        back.setContentDescription(text.get("back"));
        // What the system Back does, so a settings screen opened from the app drawer closes the same way.
        back.setOnClickListener(view -> onBackPressed());
        LinearLayout.LayoutParams backSpace = new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48));
        backSpace.setMarginEnd(ui.dp(8));
        bar.addView(back, backSpace);
        LinearLayout wordmarkColumn = ui.column();
        TextView title = ui.title("HushMessenger", 20);
        title.setTag("wordmark");
        title.setAccessibilityHeading(true);
        // Linear font scaling on Android 13 and older could otherwise split the wordmark mid-word.
        title.setMaxLines(1);
        title.setAutoSizeTextTypeUniformWithConfiguration(14, 20, 1, TypedValue.COMPLEX_UNIT_SP);
        ui.add(wordmarkColumn, title, 0);
        wordmark = title;
        // Only a preview build says anything under the name, since that's a warning.
        if (Settings.preview) {
            TextView notice = ui.text(text.get("preview_notice"), 13, ui.warning, false);
            notice.setTag("preview_notice");
            ui.add(wordmarkColumn, notice, 4);
        }
        bar.addView(wordmarkColumn, new LinearLayout.LayoutParams(0, -2, 1));
        brand.addView(bar, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        Button open = ui.button(text.get("open"));
        open.setTag("open_messenger");
        open.setContentDescription(text.get("open_messenger"));
        open.setBackground(new android.graphics.drawable.InsetDrawable(ui.interactive(ui.background, ui.accent, 12), 0, ui.dp(6), 0, ui.dp(6)));
        open.setPadding(ui.dp(12), ui.dp(6), ui.dp(12), ui.dp(6));
        open.setOnClickListener(view -> openMessenger());
        LinearLayout.LayoutParams openParams = new LinearLayout.LayoutParams(ui.largeText ? -2 : ui.dp(68), -2);
        // Large text stacks Open under the bar, on the page's line rather than the bar's.
        openParams.setMarginStart(ui.dp(12));
        openParams.topMargin = ui.dp(ui.largeText ? 8 : 0);
        brand.addView(open, openParams);
        header.addView(brand, brandSpace(header));
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
        // The bar keeps 16 dp for Back's arrow, and the tabs step in to the cards' 18 dp line under it.
        LinearLayout.LayoutParams navigationSpace = new LinearLayout.LayoutParams(-1, -2);
        navigationSpace.topMargin = ui.dp(8);
        navigationSpace.setMarginStart(ui.dp(2));
        navigationSpace.setMarginEnd(ui.dp(2));
        header.addView(navigation, navigationSpace);
        // HushGram's restart bar: off until a change waits on a restart, then one tap target under the list on both pages
        // (placeHeader puts it there). The tools icon and the waiting line lead, and Restart says what a tap does.
        restartRow = ui.row();
        restartRow.setTag("restart_row");
        restartRow.setGravity(Gravity.CENTER_VERTICAL);
        if (ui.largeText) restartRow.setOrientation(LinearLayout.VERTICAL);
        restartRow.setBackground(ui.interactive(ui.card, ui.heading, 12, ui.heading));
        // After the background, which would otherwise set the padding.
        restartRow.setPaddingRelative(ui.dp(16), ui.dp(12), ui.dp(20), ui.dp(12));
        restartRow.setMinimumHeight(ui.dp(56));
        restartRow.setClickable(true);
        restartRow.setFocusable(true);
        restartRow.setOnClickListener(view -> HostScreens.restartInto(this, page));
        restartRow.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(Button.class.getName());
            }
        });
        restartWaiting = ui.text("", 15, ui.text, false);
        restartWaiting.setTag("restart_waiting");
        restartWaiting.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        restartWaiting.setGravity(Gravity.CENTER_VERTICAL);
        restartWaiting.setCompoundDrawablesRelativeWithIntrinsicBounds(SettingsIcons.icon(this, SettingsIcons.TOOLS, ui.heading), null, null, null);
        restartWaiting.setCompoundDrawablePadding(ui.dp(14));
        restartRow.addView(restartWaiting, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        TextView restartNow = ui.text(text.get("restart"), 15, ui.heading, true);
        restartNow.setTag("restart_now");
        // The bar takes the tap and the screen reader's focus, so the label only names what it does.
        restartNow.setOnClickListener(view -> HostScreens.restartInto(this, page));
        restartNow.setClickable(false);
        restartNow.setFocusable(false);
        LinearLayout.LayoutParams restartParams = new LinearLayout.LayoutParams(-2, -2);
        // Stacked under large text, it starts where the waiting line's words do, past the icon.
        restartParams.setMarginStart(ui.dp(ui.largeText ? 38 : 12));
        restartParams.topMargin = ui.dp(ui.largeText ? 8 : 0);
        restartRow.addView(restartNow, restartParams);
        restartRow.setVisibility(View.GONE);
        undoButton = ui.button("");
        undoButton.setTag("undo");
        undoButton.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        undoButton.setOnClickListener(view -> undo());
        undoButton.setVisibility(View.GONE);
        // On the cards' 18 dp line, like the tabs.
        LinearLayout.LayoutParams undoSpace = new LinearLayout.LayoutParams(-1, -2);
        undoSpace.topMargin = ui.dp(8);
        undoSpace.setMarginStart(ui.dp(2));
        undoSpace.setMarginEnd(ui.dp(2));
        header.addView(undoButton, undoSpace);
        // The header sits above the page, so Undo coming or going would slide every row under the finger. The page scrolls
        // by what the header grew or shrank instead, leaving the swatch or button just tapped where it was.
        header.addOnLayoutChangeListener((changed, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
            boolean shown = undoButton.getVisibility() == View.VISIBLE;
            if (shown == undoLaidOut) return;
            undoLaidOut = shown;
            int grew = (bottom - top) - (oldBottom - oldTop);
            ScrollView scroll = "app".equals(page) ? appScroll : controlsScroll;
            if (scrollHeader || oldBottom == oldTop || grew == 0 || scroll == null || !scroll.isShown()) return;
            scroll.scrollBy(0, grew);
        });
    }

    /** Shows Undo for [what] until it's tapped, its time runs out, something else takes its place or settings close. */
    void offerUndo(String what, Runnable action) {
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

    void undo() {
        Runnable action = undoAction;
        messageLog.undoTaken();
        endUndo();
        if (action != null) action.run();
    }

    /** Lets go of what Undo held, so the change stands, and hides the button. */
    private void endUndo() {
        if (undoExpiry != null) undoButton.removeCallbacks(undoExpiry);
        undoExpiry = null;
        undoAction = null;
        if (undoButton != null) undoButton.setVisibility(View.GONE);
        messageLog.undoEnded();
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
        // The header is drawn once as the chat list opens, so new words or a new picture wait for a restart.
        if (Settings.installed.contains(HomeHeader.KEY)) values.put(HomeHeader.KEY, HomeHeader.inUse(this));
        return values;
    }

    void updateRestartRow() {
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

    /** Whether some of a view in the controls list shows in the list's window. */
    private boolean inList(View view) {
        if (controlsScroll == null || !view.isShown()) return false;
        Rect spot = new Rect();
        view.getDrawingRect(spot);
        controlsScroll.offsetDescendantRectToMyCoords(view, spot);
        int top = controlsScroll.getScrollY();
        return spot.bottom > top && spot.top < top + controlsScroll.getHeight();
    }

    /**
     * Keeps [anchor] where it is on screen through the next frame, scrolling its page by however far a change above it
     * moved it. A line of text above a row growing or shrinking would otherwise slide the row out from under the finger.
     */
    void keepInPlace(View anchor) {
        View list = anchor;
        while (list != null && !(list instanceof ScrollView)) list = list.getParent() instanceof View ? (View) list.getParent() : null;
        if (list == null || !anchor.isLaidOut() || !anchor.isShown()) return;
        ScrollView scroll = (ScrollView) list;
        int[] spot = new int[2];
        anchor.getLocationInWindow(spot);
        int before = spot[1];
        // After the frame's layout, which has already made up for Undo coming or going in the header.
        anchor.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override public boolean onPreDraw() {
                anchor.getViewTreeObserver().removeOnPreDrawListener(this);
                if (!anchor.isShown()) return true;
                anchor.getLocationInWindow(spot);
                scroll.scrollBy(0, spot[1] - before);
                return true;
            }
        });
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
        // HushGram's card line: cards, search and the restart bar all sit 18 dp in from the screen edge.
        content.setPadding(ui.dp(18), ui.dp(12), ui.dp(18), ui.dp(24));
        // A short window moves the bar in here, and Back's touch area reaches into the padding.
        content.setClipToPadding(false);
        scroll.addView(content);
        return content;
    }

    private void buildControls(LinearLayout content) {
        // HushGram's order under the header: the search, the list switch, then the Pause card and the sections.
        // ui.field is HushGram's field: 12 dp corners in a 2 dp outline that takes the heading color with focus.
        search = ui.field(text.get("search"), 100, true);
        search.setTag("find_control");
        search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);
        // The room a reveal added under the matches goes with the keyboard.
        search.setOnFocusChangeListener((view, focused) -> { if (!focused) controlsContent.setMinimumHeight(0); });
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
        ui.add(content, searchRow, 0);
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
        // HushGram's list switch: every section open on one page, or each folded under its heading. It stays through a
        // search, so nothing above the field moves while a word is typed.
        viewToggle = linkPanel("view_toggle", "show_as_list", SettingsIcons.MENU, false, this::flipSectionView);
        viewToggle.setMinimumHeight(ui.dp(48));
        addOverview(content, viewToggle, 10, false);
        // One small card: how many controls are on, and Pause.
        LinearLayout setup = ui.panel();
        // 12 dp in from the card, so its text starts on the rows' 30 dp icon line.
        setup.setPadding(ui.dp(12), ui.dp(10), ui.dp(12), ui.dp(2));
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
        ui.add(content, setup, 10);
        LinearLayout group = null;
        LinearLayout groupBody = null;
        String last = "";
        for (String[] spec : CONTROLS) {
            if (!Settings.installed.contains(spec[0])) continue;
            if (!last.equals(spec[3])) {
                last = spec[3];
                groupBody = ui.column();
                // Inside the section's 1 dp outline, with HushGram's 4 dp more above the first row and below the last.
                groupBody.setPadding(ui.dp(1), ui.dp(4), ui.dp(1), ui.dp(4));
                // Lines only between shown controls: none above the first, none over the card's own border under the last.
                android.graphics.drawable.GradientDrawable divider = ui.shape(ui.line, 0, 0);
                divider.setSize(1, ui.dp(1));
                groupBody.setDividerDrawable(divider);
                groupBody.setShowDividers(LinearLayout.SHOW_DIVIDER_MIDDLE);
                group = section(content, last, groupBody);
                groups.add(group);
            }
            LinearLayout row = controlRow(spec[0], text.control(spec, 1), text.control(spec, 2), true);
            if ("bubbles".equals(spec[0]) || "facebook".equals(spec[0]) || Settings.TAB_BADGES.equals(spec[0]) || OwnFont.KEY.equals(spec[0])
                    || MessageLog.KEY.equals(spec[0]) || AutoReply.KEY.equals(spec[0]) || Settings.AVATAR_SHAPE.equals(spec[0])
                    || QuietCalls.KEY.equals(spec[0]) || HomeHeader.KEY.equals(spec[0]) || ChatHiding.KEY.equals(spec[0])
                    || MessageActions.KEY.equals(spec[0])) {
                // Below the row, where TalkBack reaches them: the row's label column hides its descendants.
                LinearLayout wrapper = ui.column();
                ui.add(wrapper, row, 0);
                if ("bubbles".equals(spec[0])) addBubbleModes(wrapper);
                else if ("facebook".equals(spec[0])) ui.add(wrapper, controlRow(Settings.KEEP_FACEBOOK_PROFILE,
                    text.format("facebook_keep_profile"), text.format("facebook_keep_profile_help"), false), 8);
                else if (Settings.AVATAR_SHAPE.equals(spec[0])) ui.add(wrapper, controlRow(Settings.AVATAR_ROUNDED,
                    text.format(Settings.AVATAR_ROUNDED), text.format("avatar_shape_rounded_help"), false), 8);
                else if (Settings.TAB_BADGES.equals(spec[0])) {
                    for (String keep : Settings.KEEP_BADGES.values()) ui.add(wrapper, controlRow(keep, text.format(keep), "", false), 8);
                }
                else if (QuietCalls.KEY.equals(spec[0])) addQuietCallChats(wrapper);
                else if (ChatHiding.KEY.equals(spec[0])) addHiddenChats(wrapper);
                else if (OwnFont.KEY.equals(spec[0])) fontFile.addTo(wrapper);
                else if (HomeHeader.KEY.equals(spec[0])) homeHeader.addTo(wrapper);
                else if (MessageActions.KEY.equals(spec[0])) messageActions.addTo(wrapper);
                else if (AutoReply.KEY.equals(spec[0])) autoReplies.addAutoReplyActions(wrapper);
                else {
                    messageLog.addMessageLogActions(wrapper);
                    ui.add(wrapper, controlRow(MessageLogButton.KEY, text.format(MessageLogButton.KEY), text.format("message_log_button_help"), false), 8);
                    if (Settings.installed.contains("menu_row")) ui.add(wrapper, controlRow(MessageLogButton.MENU_KEY,
                        text.format(MessageLogButton.MENU_KEY), text.format("message_log_menu_row_help"), false), 8);
                    if (Build.VERSION.SDK_INT >= 29) ui.add(wrapper, controlRow(MessageLog.SAVE_EXPIRING,
                        text.format(MessageLog.SAVE_EXPIRING), text.format("message_log_save_expiring_help"), false), 8);
                }
                // The wrapper takes the row's side padding, so the row's extras line up with its icon.
                row.setPadding(0, row.getPaddingTop(), 0, row.getPaddingBottom());
                ((android.graphics.drawable.LayerDrawable) row.getBackground()).setLayerInsetRelative(1, 0, 0, 0, 0);
                wrapper.setPadding(ui.dp(11), 0, ui.dp(11), ui.dp(12));
                row = wrapper;
            }
            row.setTag(spec[3]);
            ui.add(groupBody, row, 0);
            controlRows.add(row);
            installedControls.add(spec);
        }
        if (installedControls.isEmpty()) {
            // Nothing to search or fold; the status line explains how to add controls.
            search.setVisibility(View.GONE);
            viewToggle.setVisibility(View.GONE);
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

    /** Only chosen chats, then a switch for each chat that called lately, under its name. */
    private void addQuietCallChats(LinearLayout content) {
        ui.add(content, controlRow(QuietCalls.CHOSEN_ONLY, text.format(QuietCalls.CHOSEN_ONLY),
            text.format("quiet_calls_chosen_help"), false), 8);
        quietCallers = ui.column();
        quietCallers.setTag("quiet_calls_recent_list");
        ui.add(content, quietCallers, 0);
        fillQuietCallers();
    }

    /** Filled again on every return, so a chat that called while settings sat behind Messenger shows up here too. */
    private void fillQuietCallers() {
        switches.removeAll(quietCallerSwitches);
        quietCallerSwitches.clear();
        quietCallers.removeAllViews();
        List<String[]> chats = QuietCalls.recent();
        if (chats.isEmpty()) {
            TextView none = ui.text(text.get("quiet_calls_recent_empty"), 13, ui.muted, false);
            none.setTag("quiet_calls_recent_empty");
            ui.add(quietCallers, none, 8);
        }
        for (String[] chat : chats) {
            int before = switches.size();
            ui.add(quietCallers, controlRow(QuietCalls.CHAT_PREFIX + chat[0], chat[1], "", false), 8);
            quietCallerSwitches.addAll(switches.subList(before, switches.size()));
        }
    }

    /** This account's hidden chats, each under its name with Unhide, or a line saying where they'll show up. */
    private void addHiddenChats(LinearLayout content) {
        hiddenChats = ui.column();
        hiddenChats.setTag("hidden_chats_list");
        ui.add(content, hiddenChats, 0);
        fillHiddenChats();
    }

    /** Filled again on every return, so a chat hidden while settings sat behind the chat list shows up here too. */
    private void fillHiddenChats() {
        LinearLayout content = hiddenChats;
        content.removeAllViews();
        TextView none = ui.text(text.get("hidden_chats_empty"), 13, ui.muted, false);
        none.setTag("hidden_chats_empty");
        ui.add(content, none, 8);
        List<String[]> chats = ChatHiding.chosen();
        none.setVisibility(chats.isEmpty() ? View.VISIBLE : View.GONE);
        for (String[] chat : chats) {
            LinearLayout row = ui.row();
            if (ui.largeText) row.setOrientation(LinearLayout.VERTICAL);
            String name = chat[1].isEmpty() ? text.get("hidden_chats_unnamed") : chat[1];
            row.addView(ui.text(name, 15, ui.text, false), new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
            Button unhide = ui.button(text.get("hidden_chats_unhide"));
            unhide.setTag("hidden_chats_unhide_" + chat[0]);
            unhide.setContentDescription(text.get("hidden_chats_unhide") + ", " + name);
            unhide.setOnClickListener(view -> {
                ChatHiding.unhide(chat[0]);
                content.removeView(row);
                if (ChatHiding.chosen().isEmpty()) none.setVisibility(View.VISIBLE);
                feedback(text.get("hidden_chats_shown"), Toast.LENGTH_SHORT);
            });
            row.addView(unhide, new LinearLayout.LayoutParams(ui.largeText ? -1 : -2, -2));
            ui.add(content, row, 8);
        }
    }

    /** One choice of a RadioGroup, in the page's colors. */
    RadioButton radio(String tag, String label) {
        RadioButton choice = new RadioButton(this);
        choice.setId(View.generateViewId());
        choice.setTag(tag);
        choice.setText(label);
        choice.setTextColor(new android.content.res.ColorStateList(
            new int[][] {{-android.R.attr.state_enabled}, {}}, new int[] {ui.muted, ui.text}));
        choice.setTextSize(16);
        choice.setMinHeight(ui.dp(48));
        choice.setPadding(ui.dp(8), ui.dp(8), ui.dp(8), ui.dp(8));
        choice.setButtonTintList(new android.content.res.ColorStateList(
            new int[][] {{-android.R.attr.state_enabled}, {android.R.attr.state_checked}, {}}, new int[] {ui.outline, ui.accent, ui.muted}));
        choice.setBackground(ui.choice(8));
        return choice;
    }

    private void addBubbleModes(LinearLayout content) {
        RadioGroup modes = new RadioGroup(this);
        modes.setOrientation(LinearLayout.VERTICAL);
        for (String mode : new String[] {"stock", "chat_heads", "native"}) {
            RadioButton choice = radio("bubble_" + mode, text.get("bubble_" + mode));
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
        batteryUse = ui.button(batteryLabel());
        batteryUse.setTag("bubble_battery");
        batteryUse.setOnClickListener(view -> openBatterySettings());
        ui.add(content, batteryUse, 8);
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

    private boolean unrestrictedBattery() {
        android.os.PowerManager power = getSystemService(android.os.PowerManager.class);
        return power != null && power.isIgnoringBatteryOptimizations(getPackageName());
    }

    private String batteryLabel() {
        return text.get(unrestrictedBattery() ? "bubble_battery_on" : "bubble_battery_off");
    }

    private void openBatterySettings() {
        // On Optimized battery Android refuses the chat head service whenever a message arrives while Messenger is
        // running in the background. Messenger holds the permission to ask for Unrestricted, and app info is where
        // someone turns it back.
        boolean ask = !unrestrictedBattery() && checkSelfPermission(
            android.Manifest.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS) == PackageManager.PERMISSION_GRANTED;
        String[] actions = ask
            ? new String[] {android.provider.Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS, android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS}
            : new String[] {android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS};
        for (String action : actions) {
            Intent intent = new Intent(action, android.net.Uri.parse("package:" + getPackageName()));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            try {
                if (getPackageManager().resolveActivity(intent, 0) == null) continue;
                startActivity(intent);
                return;
            } catch (RuntimeException unavailable) {
                // The next route, or the note below.
            }
        }
        feedback(text.get("bubble_battery_missing"), Toast.LENGTH_LONG);
    }

    @SuppressWarnings("deprecation")
    private LinearLayout controlRow(String key, String title, String description, boolean divided) {
        boolean overlay = !"paused".equals(key) && !ui.largeText;
        boolean available = Settings.available(key);
        String reason = available ? "" : text.format(CameraActivity.KEY.equals(key) ? "camera_unsupported"
            : GalleryPicker.KEY.equals(key) ? "gallery_unsupported"
            : LocalChatSearch.KEY.equals(key) ? "local_search_unsupported"
            : CallRecording.KEY.equals(key) ? "call_recording_unsupported"
            : WAYS_IN.contains(key) ? wayReason(key)
            : "bubbles".equals(key) && Build.VERSION.SDK_INT >= 30 ? "bubble_unsupported" : "unavailable");
        LinearLayout row = ui.row();
        LinearLayout labels = ui.column();
        labels.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        LinearLayout titleLine = ui.row();
        LinearLayout.LayoutParams titleSpace = new LinearLayout.LayoutParams(-1, -2);
        // A margin, since relative padding set before the row is attached stays on the right in a mirrored layout.
        if (overlay) titleSpace.setMarginEnd(ui.dp(60));
        // As tall as the switch track beside it, so the description starts under the track.
        if (overlay) titleLine.setMinimumHeight(ui.dp(24));
        if (ui.largeText) titleLine.setOrientation(LinearLayout.VERTICAL);
        // HushGram's row type: a 16 sp medium title over a 13 sp summary, both wrapping, an unusable row's dimmed.
        TextView titleView = ui.text(text.display(title), 16, ui.text, true);
        titleView.setLineSpacing(0, 1);
        if (!available) titleView.setAlpha(0.38f);
        titleLine.addView(titleView, new LinearLayout.LayoutParams(-2, -2));
        if (EXPERIMENTAL.contains(key)) {
            TextView badge = ui.text(text.get("experimental"), 11, ui.warning, false);
            badge.setBackground(ui.shape(ui.warningSurface, 0, 4));
            badge.setPadding(ui.dp(6), ui.dp(3), ui.dp(6), ui.dp(3));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
            params.setMarginStart(ui.dp(ui.largeText ? 0 : 8));
            titleLine.addView(badge, params);
        }
        labels.addView(titleLine, titleSpace);
        if (!description.isEmpty()) {
            TextView summary = ui.text(text.display(description), 13, ui.muted, false);
            summary.setLineSpacing(0, 1);
            if (!available) summary.setAlpha(0.75f);
            ui.add(labels, summary, 4);
        }
        // Why the switch is off limits, on its own line at full strength: dimmed with the summary it fell under 4.5:1.
        if (!available) {
            TextView why = ui.text(text.display(reason), 13, ui.muted, false);
            why.setTag("unavailable_" + key);
            why.setLineSpacing(0, 1);
            ui.add(labels, why, 4);
            description = description.isEmpty() ? reason : description + " " + reason;
        }
        // A switch records a use only when Messenger reaches its screen or event, so an off switch shows nothing.
        // A failure newer than the last use means the switch isn't doing its job, so that shows instead.
        TextView activeLabel = null;
        if (divided) {
            activeLabel = ui.text("", 12, ui.muted, false);
            activeLabel.setTag("active_" + key);
            activityLabels.put(key, activeLabel);
            ui.add(labels, activeLabel, 4);
        }
        LinearLayout.LayoutParams labelSpace = new LinearLayout.LayoutParams(overlay ? -1 : 0, -2, overlay ? 0 : 1);
        // The row's icon sits in this 38 dp: 24 dp of icon and 14 dp before the title.
        labelSpace.setMarginStart(ui.dp(38));
        row.addView(labels, labelSpace);
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
        // The icon is drawn by the background, 30 dp from the screen edge in a section card or an App panel.
        row.setBackground(ui.rowParts(ui.interactive(0, 0, 6), rowIcon(key), divided ? 11 : 0, false, 0));
        // After the background, which would otherwise set the padding.
        row.setPadding(ui.dp(divided ? 11 : 0), ui.dp(divided ? 10 : 0), ui.dp(divided ? 11 : 0), ui.dp(divided ? 10 : 0));
        if (divided) row.setMinimumHeight(ui.dp(64));
        return row;
    }

    /** A row's icon: one its key's words call for, else its section's. Fixed per key, since some rows are rebuilt later. */
    private static String rowIcon(String key) {
        if (WAYS_IN.contains(key) || "hide_drawer_icon".equals(key)) return SettingsIcons.forKey(key, sectionIcon("quick_access"));
        if ("light".equals(key) || "material_you_black".equals(key) || MaterialYouTheme.LIGHT_KEY.equals(key))
            return SettingsIcons.forKey(key, sectionIcon("appearance"));
        if ("check_updates".equals(key)) return SettingsIcons.forKey(key, sectionIcon("about"));
        // A switch under another one takes that one's section.
        String parent = Settings.KEEP_FACEBOOK_PROFILE.equals(key) ? "facebook"
            : Settings.AVATAR_ROUNDED.equals(key) ? Settings.AVATAR_SHAPE
            : Settings.KEEP_BADGES.containsValue(key) ? Settings.TAB_BADGES
            : MessageLogButton.KEY.equals(key) || MessageLogButton.MENU_KEY.equals(key) || MessageLog.SAVE_EXPIRING.equals(key) ? MessageLog.KEY
            : QuietCalls.CHOSEN_ONLY.equals(key) || key.startsWith(QuietCalls.CHAT_PREFIX) ? QuietCalls.KEY : key;
        String section = "";
        for (String[] spec : CONTROLS) if (spec[0].equals(parent)) { section = spec[3]; break; }
        return SettingsIcons.forKey(key, sectionIcon(section));
    }

    /** Each section's icon, for its rows that have none of their own. */
    private static String sectionIcon(String section) {
        switch (section) {
            case "inbox": return SettingsIcons.CHATS;
            case "navigation": return SettingsIcons.TAB_BAR;
            case "stickers": return SettingsIcons.LIKE;
            case "conversations": return SettingsIcons.WRITING;
            case "calls": return SettingsIcons.PHONE;
            case "photos_videos": return SettingsIcons.STORIES;
            case "links_bubbles": return SettingsIcons.LINKS;
            case "privacy": return SettingsIcons.PRIVACY;
            case "theme": return SettingsIcons.APPEARANCE;
            case "quick_access": return SettingsIcons.OPENING;
            case "appearance": return SettingsIcons.MOON;
            case "about": return SettingsIcons.ABOUT;
            default: return SettingsIcons.SETTINGS;
        }
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
        access.setPadding(ui.dp(12), ui.dp(14), ui.dp(12), ui.dp(14));
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
            // Amber, since uninstalling from there wipes Messenger's data along with the icon.
            TextView sharedInstall = ui.notice(text.get("shared_install_help"), true);
            sharedInstall.setTag("shared_install_help");
            ui.add(access, sharedInstall, 12);
        }
        section(content, "quick_access", access);
        if (!installedControls.isEmpty()) {
            // The section around it carries the "quick_setups" tag.
            LinearLayout quick = quickPanel = ui.panel();
            quick.setPadding(ui.dp(12), ui.dp(14), ui.dp(12), ui.dp(14));
            ui.add(quick, ui.text(text.get("quick_setups_help"), 13, ui.muted, false), 0);
            for (String name : QuickSetups.CHOICES) {
                ui.rule(quick, 12);
                Button choice = ui.button(text.get("quick_" + name));
                choice.setTag("quick_" + name);
                choice.setOnClickListener(view -> applyQuickSetup(name));
                ui.add(quick, choice, 8);
                ui.add(quick, ui.text(text.get("quick_" + name + "_help"), 13, ui.muted, false), 8);
            }
            quickSection = section(content, "quick_setups", quick);
            // A long press anywhere on the section hides it, header, buttons and help lines included.
            holdToHide(quickSection.getChildAt(0));
            holdToHide(quick);
            for (int i = 0; i < quick.getChildCount(); i++) holdToHide(quick.getChildAt(i));
            showQuickSetups();
        }
        LinearLayout appearance = ui.panel();
        appearance.setPadding(ui.dp(12), ui.dp(14), ui.dp(12), ui.dp(14));
        ui.add(appearance, controlRow("light", text.format("light"), text.format("light_help"), false), 0);
        if (Settings.installed.contains("material_you")) {
            ui.rule(appearance, 10);
            ui.add(appearance, controlRow("material_you_black", text.format("material_you_black"), text.format("material_you_black_help"), false), 12);
            ui.rule(appearance, 10);
            ui.add(appearance, controlRow(MaterialYouTheme.LIGHT_KEY, text.format(MaterialYouTheme.LIGHT_KEY), text.format("material_you_light_help"), false), 12);
            ui.rule(appearance, 10);
            themeColors.addTo(appearance);
        }
        ui.rule(appearance, 10);
        ui.add(appearance, ui.text(text.get("theme_help"), 13, ui.muted, false), 12);
        section(content, "appearance", appearance);
        LinearLayout about = ui.panel();
        about.setPadding(ui.dp(12), ui.dp(14), ui.dp(12), ui.dp(14));
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
        updates.addTo(about);
        section(content, "about", about);
        updates.syncUpdateChoice(true);
        LinearLayout choices = ui.panel();
        choices.setPadding(ui.dp(12), ui.dp(14), ui.dp(12), ui.dp(14));
        Button copy = ui.button(text.get("copy"));
        copy.setTag("copy_setup");
        copy.setOnClickListener(view -> copySetup());
        ui.add(choices, copy, 0);
        ui.add(choices, ui.text(text.get("copy_help"), 13, ui.muted, false), 8);
        backup.addTo(choices);
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
        section(content, "choices", choices);
        LinearLayout usage = ui.panel();
        usage.setPadding(ui.dp(12), ui.dp(14), ui.dp(12), ui.dp(14));
        ui.add(usage, ui.text(text.get("save_help"), 13, ui.muted, false), 0);
        ui.add(usage, ui.text(text.get("pause_help"), 13, ui.muted, false), 10);
        ui.add(usage, ui.text(text.get("account_help"), 13, ui.muted, false), 10);
        LinearLayout help = ui.column();
        help.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
        help.setBackground(ui.shape(ui.infoSurface, ui.infoBorder, 8));
        ui.add(help, ui.text(text.get("missing"), 15, ui.accent, true), 0);
        ui.add(help, ui.text(text.get("missing_help"), 13, ui.muted, false), 6);
        ui.add(usage, help, 12);
        section(content, "usage", usage);
        // #88: Messenger's own Log out, no dialog in front of it. A build the patch found none in says where to go instead.
        // Log out acts on the spot, so it gets no chevron.
        LinearLayout logOut = linkPanel("log_out", "log_out", SettingsIcons.PERSON, false, this::logOut);
        if (!LogOut.available()) {
            logOut.setOnClickListener(null);
            logOut.setEnabled(false);
            logOut.setClickable(false);
            // The title dims, but the line saying where to log out instead keeps its full contrast.
            logOut.getChildAt(0).setAlpha(0.38f);
            ((TextView) logOut.getChildAt(1)).setText(text.get("log_out_unavailable"));
            logOut.setContentDescription(text.get("log_out") + ". " + text.get("log_out_unavailable"));
        }
        addOverview(content, logOut, 16, false);
        addOverview(content, linkPanel("source_licenses", "source", SettingsIcons.LICENSE, true,
            () -> openPage("https://github.com/SysAdminDoc/HushMessenger#credits")), 16, false);
        // Built when tapped, so the controls listed are the ones on right then.
        addOverview(content, linkPanel("report_problem", "report", SettingsIcons.BUG, true,
            () -> openPage(ProblemReport.issueUrl(reportFacts()))), 16, false);
        // Report and Support share one card, so Support's top line is Report's bottom one.
        addOverview(content, linkPanel("support", "support", SettingsIcons.LIKE, true, () -> openPage(SUPPORT_PAGE)), 0, true);
        ui.add(content, ui.text(text.get("credits"), 12, ui.muted, false), 16);
        ui.add(content, ui.text(text.get("independent"), 12, ui.muted, false), 20);
    }

    /**
     * HushGram's overview row: text [id]'s title over its "_help" line, read out as one button, with icon at the start
     * and a chevron at the end when it opens a page. Full bleed, so its side lines sit just off screen.
     */
    private LinearLayout linkPanel(String tag, String id, String icon, boolean opens, Runnable open) {
        // A row with no "_help" text is its title alone, like Support.
        boolean help = SettingsText.ENGLISH.containsKey(id + "_help");
        LinearLayout panel = ui.column();
        panel.setTag(tag);
        panel.setClickable(true);
        panel.setFocusable(true);
        android.graphics.drawable.LayerDrawable parts = ui.rowParts(ui.interactive(ui.card, ui.line, 0), icon, 20, opens, 20);
        parts.setLayerInsetRelative(0, -ui.dp(1), 0, -ui.dp(1), 0);
        panel.setBackground(parts);
        // After the background, which would otherwise set the padding.
        panel.setPadding(ui.dp(20), ui.dp(6), ui.dp(20), ui.dp(6));
        panel.setMinimumHeight(ui.dp(52));
        panel.setGravity(Gravity.CENTER_VERTICAL);
        panel.setContentDescription(help ? text.get(id) + ". " + text.get(id + "_help") : text.get(id));
        panel.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                // A panel that opens a page is a button to a screen reader.
                info.setClassName(Button.class.getName());
            }
        });
        // The icon's 38 dp at the start, and the chevron's 16 plus 12 at the end.
        TextView title = ui.text(text.get(id), 15, ui.text, true);
        panel.addView(title, overviewText(opens, 0));
        if (help) panel.addView(ui.text(text.get(id + "_help"), 12, ui.muted, false), overviewText(opens, 2));
        panel.setOnClickListener(view -> open.run());
        return panel;
    }

    private LinearLayout.LayoutParams overviewText(boolean opens, int top) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = ui.dp(top);
        params.setMarginStart(ui.dp(38));
        params.setMarginEnd(ui.dp(opens ? 28 : 0));
        return params;
    }

    /** An overview row across the whole window, out of the page's 18 dp padding. Joined, it shares the row above's line. */
    private void addOverview(LinearLayout content, LinearLayout row, int top, boolean joined) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = ui.dp(top);
        params.setMarginStart(-ui.dp(18));
        params.setMarginEnd(-ui.dp(18));
        if (joined) ((android.graphics.drawable.LayerDrawable) row.getBackground()).setLayerInset(0, -ui.dp(1), -ui.dp(1), -ui.dp(1), 0);
        content.addView(row, params);
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
            GalleryPicker.reportLine(), LastCrash.read(getFilesDir(), System.currentTimeMillis()), reportNotifications());
    }

    /** Whether Messenger's notifications can pop up, for the report: Android's switches and each channel's importance. */
    private String reportNotifications() {
        try {
            android.app.NotificationManager manager = getSystemService(android.app.NotificationManager.class);
            if (manager == null) return "";
            List<String[]> channels = new ArrayList<>();
            for (android.app.NotificationChannel channel : manager.getNotificationChannels()) {
                // A conversation's own channel carries its chat in the id, so it never goes in.
                String id = Build.VERSION.SDK_INT >= 30 && channel.getConversationId() != null ? "" : channel.getId();
                channels.add(new String[] {id, Integer.toString(channel.getImportance())});
            }
            return ProblemReport.notificationsLine(manager.areNotificationsEnabled(), Settings.selectedBubbleMode(),
                android.provider.Settings.canDrawOverlays(this), Build.VERSION.SDK_INT >= 34 ? manager.canUseFullScreenIntent() : null,
                channels);
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately("report_problem", "Couldn't read the notification settings for the report", error);
            return "";
        }
    }

    /**
     * Saves one Quick setups choice in a single write, then says how many controls changed. The switches, the counts and
     * the restart row follow from refreshChoices, the same as after a tap on each switch.
     */
    private void applyQuickSetup(String name) {
        // Words typed a moment ago count as there, so iPhone look never writes over them.
        homeHeader.saveWords();
        java.util.Map<String, Boolean> values = QuickSetups.values(name);
        // Turning a control off never needs this phone to run it, so Back to defaults also clears one it can't.
        java.util.function.Predicate<String> settable = "defaults".equals(name) ? Settings.installed::contains
            : key -> Settings.installed.contains(key) && Settings.available(key);
        java.util.Map<String, Boolean> changes = QuickSetups.changes(values, Settings.preferences, settable);
        // What each changed key held, null for one never saved, so Undo puts back exactly that.
        java.util.Map<String, Boolean> before = new java.util.HashMap<>();
        for (String key : changes.keySet()) before.put(key, Settings.preferences.contains(key) ? Settings.preferences.getBoolean(key, false) : null);
        // iPhone look titles a header with no words and no picture "Chats", in this page's language.
        String words = "iphone".equals(name) && settable.test(HomeHeader.KEY) && !HomeHeader.file(this).isFile()
            && HomeHeader.clean(Settings.preferences.getString(HomeHeader.TEXT, "")).isEmpty()
            ? text.get("quick_iphone_words") : null;
        int changed = changes.size() + (words != null ? 1 : 0);
        if (changed > 0) {
            SharedPreferences.Editor edit = Settings.preferences.edit();
            for (java.util.Map.Entry<String, Boolean> change : changes.entrySet()) edit.putBoolean(change.getKey(), change.getValue());
            if (words != null) edit.putString(HomeHeader.TEXT, words);
            edit.apply();
        }
        if (words != null) homeHeader.reload();
        refreshChoices();
        feedback(changed > 0 ? text.count("quick_changed", changed)
            : text.get(QuickSetups.anySettable(values, settable) ? "quick_unchanged" : "quick_missing"), Toast.LENGTH_SHORT);
        if (changed > 0) offerUndo(text.format("quick_" + name), () -> undoQuickSetup(changes, before, words));
    }

    /**
     * Puts back what a Quick setup changed, except a switch flipped again since, which stays as it is now. Header words
     * it filled in go too, unless they were edited since.
     */
    private void undoQuickSetup(java.util.Map<String, Boolean> changes, java.util.Map<String, Boolean> before, String words) {
        homeHeader.saveWords();
        SharedPreferences.Editor edit = Settings.preferences.edit();
        int restored = 0;
        if (words != null && words.equals(Settings.preferences.getString(HomeHeader.TEXT, ""))) {
            edit.remove(HomeHeader.TEXT);
            restored++;
        }
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
        if (words != null) homeHeader.reload();
        refreshChoices();
        feedback(text.count("quick_undone", restored), Toast.LENGTH_SHORT);
    }

    private void copySetup() {
        try {
            ClipData clip = ClipData.newPlainText(text.get("clipboard"), SetupSummary.build(this, text));
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

    String formatSince(long timestamp, String now, String ago) {
        long seconds = (System.currentTimeMillis() - timestamp) / 1000;
        if (seconds < 10) return text.get(now);
        if (seconds < 60) return text.get(ago, text.format("seconds_short", seconds));
        long minutes = seconds / 60;
        if (minutes < 60) return text.get(ago, text.format("minutes_short", minutes));
        long hours = minutes / 60;
        if (hours < 48) return text.get(ago, text.format("hours_short", hours));
        return text.get(ago, text.format("days_short", hours / 24));
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request == SAVE_MESSAGE_LOG) {
            messageLog.saveResult(result, data);
            return;
        }
        if (request == PICK_AUTO_REPLY_PICTURE) {
            autoReplies.pictureResult(result, data);
            return;
        }
        if (request == PICK_HOME_HEADER) {
            homeHeader.pictureResult(result, data);
            return;
        }
        if (request == PICK_FONT) {
            // Cancelled: nothing to do and nothing to say.
            if (result != RESULT_OK || data == null || data.getData() == null) return;
            if ("content".equals(data.getData().getScheme())) fontFile.copyFontFile(data.getData());
            else feedback(text.get("font_file_unreadable"), Toast.LENGTH_LONG);
            return;
        }
        if (request != SAVE_CHOICES && request != READ_CHOICES) return;
        backup.documentResult(request, result, data);
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
     * It looks like HushGram's heading, 22 dp in from the screen edge over a card on the 18 dp line.
     */
    private LinearLayout section(LinearLayout parent, String id, View body) {
        LinearLayout group = ui.column();
        group.setTag(id);
        LinearLayout header = ui.row();
        header.setTag("section_" + id);
        header.setMinimumHeight(ui.dp(48));
        header.setBackground(ui.interactive(0, 0, 8));
        // After the background, which would otherwise set the padding.
        header.setPadding(ui.dp(4), ui.dp(20), ui.dp(4), ui.dp(8));
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
        // The glyph mirrors in a right-to-left paragraph, and the quarter turn would then point it up while shut.
        chevron.setTextDirection(View.TEXT_DIRECTION_LTR);
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
                // A label of its own: read from the children, TalkBack said "Collapsed, Button" before the section's name.
                CharSequence tally = count.getContentDescription();
                info.setContentDescription(tally == null ? text.get(id) : text.get(id) + ". " + tally);
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
        // HushGram's section card, one per section.
        body.setBackground(ui.cardShape());
        ui.add(group, body, 0);
        ui.add(parent, group, 0);
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
        updateViewToggle();
        if (parts != null) parts[1].sendAccessibilityEvent(android.view.accessibility.AccessibilityEvent.TYPE_VIEW_SELECTED);
    }

    /** Whether every Controls section on show is open, which is the list view. With none on show, the saved choice says. */
    private boolean listView() {
        boolean any = false;
        for (LinearLayout group : groups) {
            if (group.getVisibility() != View.VISIBLE) continue;
            any = true;
            if (!sectionShown((String) group.getTag())) return false;
        }
        if (any) return true;
        for (LinearLayout group : groups) if (!openSections.contains((String) group.getTag())) return false;
        return !groups.isEmpty();
    }

    /** The list switch's tap: every Controls section opens, or they all fold. During a search only the search's view changes. */
    private void flipSectionView() {
        boolean list = !listView();
        for (LinearLayout group : groups) {
            String id = (String) group.getTag();
            if (searching) {
                if (list) searchClosed.remove(id);
                else searchClosed.add(id);
            } else if (list) openSections.add(id);
            else openSections.remove(id);
        }
        if (!searching) saveSections();
        for (LinearLayout group : groups) bindSection((String) group.getTag());
        updateViewToggle();
    }

    /** Words the list switch for what a tap shows: the long list, or the sections under their headings. */
    private void updateViewToggle() {
        if (viewToggle == null) return;
        boolean list = listView();
        String label = text.get(list ? "show_by_category" : "show_as_list");
        TextView title = (TextView) viewToggle.getChildAt(0);
        if (label.contentEquals(title.getText())) return;
        title.setText(label);
        viewToggle.setContentDescription(label);
        // Stacked cards for the sections, lines for the long list, after HushGram.
        android.graphics.drawable.Drawable icon = SettingsIcons.icon(this, list ? SettingsIcons.FEED : SettingsIcons.MENU, ui.heading);
        // A drawable swapped into a layer gets no state of its own, and with none its tint reads as disabled.
        icon.setState(viewToggle.getDrawableState());
        ((android.graphics.drawable.LayerDrawable) viewToggle.getBackground()).setDrawable(1, icon);
    }

    private void bindSection(String id) {
        LinearLayout[] parts = sections.get(id);
        if (parts == null) return;
        boolean shown = sectionShown(id);
        LinearLayout header = parts[1];
        parts[0].getChildAt(1).setVisibility(shown ? View.VISIBLE : View.GONE);
        // The heading keeps its color and the chevron says open or shut, so an open section wears no outline.
        header.getChildAt(2).setRotation(shown ? -90 : 90);
        // No state description: TalkBack already says "collapsed" or "expanded" from the expand and collapse actions,
        // and a description of our own made it say the state twice.
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
        updateBarTitle();
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
            if (Settings.AVATAR_SHAPE.equals(spec[0])) inside = text.get(Settings.AVATAR_ROUNDED) + " " + text.get("avatar_shape_rounded_help");
            if (HomeHeader.KEY.equals(spec[0])) inside = text.get("home_header_words") + " " + text.get("home_header_choose") + " "
                + text.get("home_header_help", HomeHeaderPicture.MAX_MEGABYTES);
            if (QuietCalls.KEY.equals(spec[0])) {
                inside = text.get(QuietCalls.CHOSEN_ONLY) + " " + text.get("quiet_calls_chosen_help");
                for (String[] chat : QuietCalls.recent()) inside += " " + chat[1];
            }
            if (MessageLog.KEY.equals(spec[0])) {
                inside = text.get("message_log_keep");
                for (int days : MessageLog.KEEP_CHOICES) inside += " " + text.get("message_log_keep_" + days);
                inside += " " + text.get(MessageLogButton.KEY) + " " + text.get("message_log_button_help");
                if (Settings.installed.contains("menu_row"))
                    inside += " " + text.get(MessageLogButton.MENU_KEY) + " " + text.get("message_log_menu_row_help");
                if (Build.VERSION.SDK_INT >= 29) inside += " " + text.get(MessageLog.SAVE_EXPIRING) + " " + text.get("message_log_save_expiring_help");
            }
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
        updateViewToggle();
        searchStatus.setText(controlRows.isEmpty() ? text.get("none_installed") :
            visible == 0 ? text.get("no_matches") : text.get(controlRows.size() == 1 ? "results_one" : "results_many", visible, controlRows.size()));
        // With nothing installed, the status line already explains what to do.
        emptyState.setVisibility(visible == 0 && !controlRows.isEmpty() ? View.VISIBLE : View.GONE);
        updateBarTitle();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        Bundle draft = autoReplies.autoReplyDraft();
        if (draft != null) state.putBundle("auto_reply_draft", draft);
        messageLog.saveState(state);
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
    void openPage(String url) {
        try { startActivity(new Intent(Intent.ACTION_VIEW, android.net.Uri.parse(url)).addCategory(Intent.CATEGORY_BROWSABLE)); }
        catch (android.content.ActivityNotFoundException error) { feedback(text.get("no_browser"), Toast.LENGTH_LONG); }
        catch (SecurityException denied) {
            // Android can refuse a launch it would otherwise resolve. The page and the platform's message stay out of the log.
            android.util.Log.w("HushMessenger", "The phone refused to open a web page from settings");
            feedback(text.get("page_blocked"), Toast.LENGTH_LONG);
        }
    }

    /** Hands over to Messenger's account screen, which signs out, and closes settings so Back doesn't land here. */
    private void logOut() {
        if (LogOut.start(this, HostScreens.logoutRoute())) finish();
        else feedback(text.get("log_out_failed"), Toast.LENGTH_LONG);
    }

    /** One toast at a time, built on the app context so no destroyed page is kept alive. */
    void feedback(String message, int length) {
        if (toast != null) toast.cancel();
        toast = Toast.makeText(getApplicationContext(), message, length);
        toast.show();
    }

}
