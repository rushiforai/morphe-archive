package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.os.SystemClock;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/** Runtime switches default to the original Messenger behavior. */
public final class Settings {
    static volatile SharedPreferences preferences;
    static volatile Context appContext;
    static volatile Set<String> installed = Collections.emptySet();
    static boolean preview;
    static boolean bubbleRoutes;
    static final String BUBBLE_CHAT_HEADS = "bubble_chat_heads";
    static final ConcurrentHashMap<String, Long> activeAt = new ConcurrentHashMap<>();

    public static void initialize(Context context) {
        Context app = context.getApplicationContext();
        // Messenger's Application has no application context of its own until Android finishes attaching it.
        appContext = app != null ? app : context;
        Set<String> features = new HashSet<>();
        // Worked out in locals: the settings and restart screens run this again, and a notification built on another
        // thread meanwhile must not see the bubble routes drop out and back.
        boolean previewNow = false, bubbleRoutesNow = false, listed = false;
        try {
            Bundle metadata = context.getPackageManager().getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA).metaData;
            listed = true;
            previewNow = metadata != null && metadata.getBoolean("hush.preview", false);
            bubbleRoutesNow = previewNow || HostScreens.nativeBubbleRoutes() ||
                    (metadata != null && metadata.getBoolean("hush.native_bubble_routes", false));
            if (metadata != null) for (String name : metadata.keySet()) {
                if (name.startsWith("hush.feature.") && metadata.getBoolean(name, false)) features.add(name.substring(13));
            }
        } catch (PackageManager.NameNotFoundException error) {
            android.util.Log.e("HushMessenger", "Can't read installed controls", error);
        }
        // A Root Mount install keeps the stock manifest, so the controls come from the patched code instead.
        features.addAll(bundled(HostScreens.bundledControls()));
        preview = previewNow;
        bubbleRoutes = bubbleRoutesNow;
        installed = Collections.unmodifiableSet(features);
        // Set last: a hook that sees preferences also sees the installed controls.
        preferences = appContext.getSharedPreferences("hushmessenger", Context.MODE_PRIVATE);
        // Only the main process writes the log; its lock doesn't reach other processes.
        if (appContext.getPackageName().equals(android.app.Application.getProcessName())) {
            if (installed.contains(MessageLog.KEY)) MessageLog.scheduleExpiry();
            // Only when the installed list was read for sure, so a failed read can't cost a log the control still has.
            else if (listed && !preview) MessageLog.dropLeftovers(appContext);
        }
    }

    static Set<String> bundled(String list) {
        Set<String> keys = new HashSet<>();
        if (list != null) for (String key : list.split(",")) if (!key.isEmpty()) keys.add(key);
        return keys;
    }

    public static boolean enabled(String key) {
        boolean on = wouldUse(key);
        if (on) activeAt.put(key, System.currentTimeMillis());
        return on;
    }

    /** Whether a control is in effect right now, without counting it as a use. */
    static boolean wouldUse(String key) {
        if (!HostScreens.started) HostScreens.initializeLate();
        if (HostScreens.failed) return false;
        SharedPreferences prefs = preferences;
        return installed.contains(key) && prefs != null && !prefs.getBoolean("paused", false)
                && !CrashGuard.isSafeMode() && prefs.getBoolean(key, false);
    }

    public static long lastActive(String key) {
        Long ts = activeAt.get(key);
        return ts != null ? ts : 0;
    }

    /**
     * Each control's last caught hook failure as "<exception class> at <first HushMessenger frame>|<time>".
     * The exception's message is never kept, since it could hold chat content.
     */
    static final ConcurrentHashMap<String, String> hookErrors = new ConcurrentHashMap<>();
    private static final String HOOK_ERROR = "hook_error_";

    static void hookFailed(String key, String what, Throwable error) {
        android.util.Log.e("HushMessenger", what, error);
        recordHookError(key, error);
    }

    /** For hooks that handle file paths or chat content: logs only the error's type and where it happened. */
    static void hookFailedPrivately(String key, String what, Throwable error) {
        android.util.Log.e("HushMessenger", what + ": " + recordHookError(key, error));
    }

    private static synchronized String recordHookError(String key, Throwable error) {
        StackTraceElement[] stack = error.getStackTrace();
        StackTraceElement frame = stack.length == 0 ? null : stack[0];
        for (StackTraceElement element : stack) {
            if (element.getClassName().startsWith("app.hushmessenger.")) { frame = element; break; }
        }
        String where = frame == null ? "unknown" : frame.getClassName().substring(frame.getClassName().lastIndexOf('.') + 1)
            + "." + frame.getMethodName() + (frame.getLineNumber() >= 0 ? ":" + frame.getLineNumber() : "");
        String failure = error.getClass().getName() + " at " + where;
        long now = System.currentTimeMillis();
        hookErrors.put(key, failure + "|" + now);
        SharedPreferences prefs = preferences;
        // A hook can fail on every screen draw, so the saved copy changes only for a new failure or once a minute.
        if (prefs != null) {
            String previous = prefs.getString(HOOK_ERROR + key, null);
            if (previous == null || !previous.startsWith(failure + "|") || now - hookErrorTime(previous) >= 60_000
                    || now < hookErrorTime(previous))
                prefs.edit().putString(HOOK_ERROR + key, failure + "|" + now).apply();
        }
        return failure;
    }

    static long hookErrorTime(String record) {
        try {
            return Long.parseLong(record.substring(record.lastIndexOf('|') + 1));
        } catch (RuntimeException malformed) {
            return 0;
        }
    }

    /** When the control's hook last failed, this run or an earlier one, or 0 if it never did. */
    static long hookErrorAt(String key) {
        String record = hookErrors.get(key);
        SharedPreferences prefs = preferences;
        if (record == null && prefs != null) record = prefs.getString(HOOK_ERROR + key, null);
        return record == null ? 0 : hookErrorTime(record);
    }

    /** Control key to its last failure record, with this run's failures over the saved ones. */
    static Map<String, String> lastHookErrors() {
        Map<String, String> errors = new java.util.TreeMap<>();
        SharedPreferences prefs = preferences;
        if (prefs != null) for (Map.Entry<String, ?> saved : prefs.getAll().entrySet()) {
            if (saved.getKey().startsWith(HOOK_ERROR) && saved.getValue() instanceof String)
                errors.put(saved.getKey().substring(HOOK_ERROR.length()), (String) saved.getValue());
        }
        errors.putAll(hookErrors);
        return errors;
    }

    public static boolean hideStories() { return enabled("stories"); }
    public static boolean hideFacebook() { return enabled("facebook"); }

    /** Under Hide Facebook shortcuts: leaves the Profile button on a chat's details page while the rest stays hidden. */
    static final String KEEP_FACEBOOK_PROFILE = "facebook_keep_profile";

    /** Asked by the gates that create only the chat details Profile button. */
    public static boolean hideFacebookProfile() { return hideFacebook() && !preferences.getBoolean(KEEP_FACEBOOK_PROFILE, false); }
    public static boolean hideMetaAi() { return enabled("meta_ai"); }

    /**
     * The @ suggestion list asks a cached plugin state before it adds the Meta AI or imagine row, and skips the row when
     * that state is Messenger's own disabled marker. With the switch on the state reads as that marker. The cache itself
     * isn't written, so Off, Pause and safe mode bring the rows back on the next keystroke.
     */
    public static Object hideMetaAiRow(Object state, Object disabled) {
        try {
            return hideMetaAi() ? disabled : state;
        } catch (RuntimeException error) {
            hookFailed("meta_ai", "Can't hide Meta AI in @ suggestions", error);
            return state;
        }
    }

    /**
     * The inbox search bar, and the search screen it opens, read "Ask Meta AI or search" when Messenger's Meta AI search
     * check is true. With the switch on the check reads false, the answer accounts without Meta AI in search get, so both
     * boxes show the plain hint.
     */
    public static boolean metaAiSearchHint(boolean original) {
        if (!original) return false;
        try {
            return !hideMetaAi();
        } catch (RuntimeException error) {
            hookFailed("meta_ai", "Can't change the search hint", error);
            return true;
        }
    }

    /** First answer this process gave for the Meta AI tab, or null before the bottom bar asked. */
    static volatile Boolean metaAiTab;

    /**
     * The bottom bar keeps the tab list it counted first, but checks each tab again when it draws, the way Messenger's own
     * kill switch never changes while it runs. So the tab keeps its first answer until a restart instead of following the
     * switch mid-session and leaving the bar and its list out of step.
     */
    public static boolean hideMetaAiTab() {
        Boolean hidden = metaAiTab;
        if (hidden != null) return hidden;
        // Started before the lock below, so nothing waits on HostScreens' startup lock while holding it.
        if (!HostScreens.started) HostScreens.initializeLate();
        // Its own lock, so two first askers can't get different answers if the switch flips between them.
        synchronized (META_AI_TAB) {
            if (metaAiTab == null) metaAiTab = hideMetaAi();
            return metaAiTab;
        }
    }

    private static final Object META_AI_TAB = new Object();

    /** Bottom tabs with a switch of their own, held for the run like the Meta AI tab. */
    static final List<String> BOTTOM_TABS = Collections.unmodifiableList(Arrays.asList("tab_people", "tab_notifications"));
    /** First answer this process gave for each of {@link #BOTTOM_TABS}, by key, once the bottom bar asked. */
    static final ConcurrentHashMap<String, Boolean> bottomTabs = new ConcurrentHashMap<>();

    public static boolean hidePeopleTab() { return hideBottomTab("tab_people"); }
    public static boolean hideNotificationsTab() { return hideBottomTab("tab_notifications"); }

    private static boolean hideBottomTab(String key) {
        // putIfAbsent keeps whichever answer landed first, so two first askers can't get different answers. wouldUse runs
        // outside the map's lock because it can reach HostScreens.initializeLate, which takes a lock of its own.
        Boolean held = bottomTabs.get(key);
        if (held == null) {
            boolean answer = wouldUse(key);
            held = bottomTabs.putIfAbsent(key, answer);
            if (held == null) held = answer;
        }
        boolean hidden = held;
        if (hidden) activeAt.put(key, System.currentTimeMillis());
        return hidden;
    }

    /**
     * Messenger's tab list for the bottom bar as it's built. The bar draws only the tabs whose gate let them in, but it
     * marks the open tab by its place in this full list, so a hidden tab ahead of it lit up its neighbor (with People
     * hidden, opening Notifications showed Menu as open). Dropping the hidden tabs here keeps the two in step; every other
     * tab and its order stay as Messenger built them.
     */
    public static <T> List<T> visibleTabs(List<T> tabs) {
        try {
            List<T> kept = new ArrayList<>(tabs.size());
            for (T tab : tabs) {
                String key = tab instanceof Enum ? barTabKey(((Enum<?>) tab).name()) : null;
                if (key == null || !("meta_ai".equals(key) ? hideMetaAiTab() : hideBottomTab(key))) kept.add(tab);
            }
            return kept.size() == tabs.size() ? tabs : kept;
        } catch (RuntimeException error) {
            // The one list serves every tab switch, so the failure goes on each switch that's on, never on one that's off.
            boolean blamed = false;
            for (String control : TAB_CONTROLS) {
                if (wouldUse(control)) { hookFailed(control, "Can't line up the tab bar", error); blamed = true; }
            }
            if (!blamed) android.util.Log.e("HushMessenger", "Can't line up the tab bar", error);
            return tabs;
        }
    }

    /** Every switch that takes a tab off the bottom bar, so each one's list goes through {@link #visibleTabs}. */
    static final List<String> TAB_CONTROLS = Collections.unmodifiableList(Arrays.asList("tab_people", "tab_notifications", "meta_ai"));

    /**
     * The switch that hides a bottom tab, by the tab's constant in Messenger's tab enum, or null for a tab with none. MUSE
     * is the AI agent tab some accounts get in Meta AI's place, so Hide Meta AI takes it too.
     */
    static String barTabKey(String name) {
        switch (name) {
            case "PEOPLE": return "tab_people";
            case "JEWEL": return "tab_notifications";
            case "AI":
            case "MUSE": return "meta_ai";
            default: return null;
        }
    }

    static final String TAB_BADGES = "tab_badges";
    /**
     * Under Hide tab badges: each badge's Keep switch, by the tab id Messenger's bottom bar asks its badge for. The
     * Facebook button at the top of Chats goes by "facebook". Menu is the "more" tab; "me_setting" never has a badge.
     */
    static final Map<String, String> KEEP_BADGES;
    static {
        Map<String, String> keep = new LinkedHashMap<>();
        keep.put("inbox", "tab_badges_keep_chats");
        keep.put("people", "tab_badges_keep_people");
        keep.put("jewel", "tab_badges_keep_notifications");
        keep.put("more", "tab_badges_keep_menu");
        keep.put("facebook", "tab_badges_keep_facebook");
        KEEP_BADGES = Collections.unmodifiableMap(keep);
    }

    /** Switches shown under a control's row, by the control that has to be in the bundle for them to mean anything. */
    static final Map<String, String> SUB_SWITCHES;
    static {
        Map<String, String> owners = new LinkedHashMap<>();
        owners.put(BUBBLE_CHAT_HEADS, "bubbles");
        owners.put(KEEP_FACEBOOK_PROFILE, "facebook");
        for (String keep : KEEP_BADGES.values()) owners.put(keep, TAB_BADGES);
        SUB_SWITCHES = Collections.unmodifiableMap(owners);
    }

    /** The badges hidden this run, by the tab ids KEEP_BADGES lists, or null before Messenger asked for one. */
    static volatile Set<String> hiddenBadges;
    private static final Object HIDDEN_BADGES = new Object();

    /** The badges the saved switches, Pause and safe mode hide now. */
    static Set<String> badgesToHide() {
        if (!wouldUse(TAB_BADGES)) return Collections.emptySet();
        SharedPreferences prefs = preferences;
        Set<String> hidden = new HashSet<>();
        for (Map.Entry<String, String> badge : KEEP_BADGES.entrySet())
            if (!prefs.getBoolean(badge.getValue(), false)) hidden.add(badge.getKey());
        return Collections.unmodifiableSet(hidden);
    }

    /**
     * Messenger's bottom bar and the Facebook button take a badge controller as they're built and keep listening to it,
     * so a badge doesn't come back or go away mid-run. Every asker gets the first answer until a restart, like the tabs.
     */
    private static Set<String> hiddenBadges() {
        Set<String> held = hiddenBadges;
        if (held != null) return held;
        if (!HostScreens.started) HostScreens.initializeLate();
        synchronized (HIDDEN_BADGES) {
            if (hiddenBadges == null) hiddenBadges = badgesToHide();
            return hiddenBadges;
        }
    }

    /**
     * Asked by the bottom bar for each tab's badge controller. True hands the tab the controller Messenger itself uses for
     * a tab whose badge is turned off, so the tab shows no dot or count and opens as usual.
     */
    public static boolean hideTabBadge(String tab) {
        try {
            if (tab == null || !hiddenBadges().contains(tab)) return false;
            activeAt.put(TAB_BADGES, System.currentTimeMillis());
            return true;
        } catch (RuntimeException error) {
            hookFailed(TAB_BADGES, "Can't hide a tab badge", error);
            return false;
        }
    }

    /** Whether the Facebook button at the top of Chats gets its badge. Without one Messenger draws the plain button. */
    public static boolean facebookButtonBadge(boolean original) {
        return original && !hideTabBadge("facebook");
    }

    /** First answer this process gave for the emoji drawer, or null before Messenger asked. */
    static volatile Boolean oldEmojiDrawer;
    private static final Object EMOJI_DRAWER = new Object();

    /**
     * Messenger reads its redesigned emoji drawer flag in each part of the drawer as it builds it, and the parts have to
     * agree, the way Meta's server flag never changes while Messenger runs. So the first answer holds until a restart,
     * and a switch, Pause or safe-mode change can't leave half the drawer redesigned. This only ever turns a yes into a no.
     */
    public static boolean redesignedEmojiDrawer(boolean original) {
        // Without the redesign there's nothing to hold, so the settings row doesn't wait for a restart that changes nothing.
        if (!original) return false;
        Boolean old = oldEmojiDrawer;
        if (old == null) {
            if (!HostScreens.started) HostScreens.initializeLate();
            synchronized (EMOJI_DRAWER) {
                if (oldEmojiDrawer == null) oldEmojiDrawer = wouldUse("emoji_drawer");
                old = oldEmojiDrawer;
            }
        }
        if (!old) return true;
        activeAt.put("emoji_drawer", System.currentTimeMillis());
        return false;
    }

    /**
     * The answer a control that holds its first answer for the run is still giving, when the saved switch, Pause or
     * safe mode now says otherwise. Null when the control doesn't hold one, Messenger hasn't asked yet, or they agree.
     */
    static Boolean heldUntilRestart(String key) {
        if (TAB_BADGES.equals(key)) {
            Set<String> badges = hiddenBadges;
            if (badges == null) return null;
            Set<String> now = badgesToHide();
            // Still hiding what a restart would show again reads as held on; any other change is waiting to take effect.
            return badges.equals(now) ? null : !badges.isEmpty() && now.isEmpty();
        }
        Boolean held = "meta_ai".equals(key) ? metaAiTab : "emoji_drawer".equals(key) ? oldEmojiDrawer
            : OwnFont.KEY.equals(key) ? customFont : bottomTabs.get(key);
        return held == null || held == wouldUse(key) ? null : held;
    }

    /**
     * The mode Messenger asks its emoji and sticker tray for after each edit in the composer, right before the tray hears
     * it. With the switch on, the sticker search mode becomes the plain emoji mode, so typing keeps the tray on emoji.
     * Every other mode, and every mode while the switch is off, paused or in safe mode, passes through unchanged.
     */
    public static String emojiSearchMode(String original) {
        if (!"expression_search".equals(original)) return original;
        try {
            return enabled("emoji_search") ? "expression" : original;
        } catch (RuntimeException error) {
            hookFailed("emoji_search", "Can't keep emoji search on emoji", error);
            return original;
        }
    }

    public static boolean showSubtabs(boolean original) { return original && !enabled("subtabs"); }
    public static boolean hidePeopleSection(boolean original) { return original || enabled("people"); }
    public static boolean keepPeopleSection(boolean original) { return original && !enabled("people"); }
    public static boolean suppressTyping() { return enabled("typing"); }
    /** Every analytics upload service, job and retry asks this as it starts, so a change applies to the next upload. */
    public static boolean stopAnalyticsUploads() { return enabled("analytics_uploads"); }
    /** The extra holding the Messenger that the analytics logger's upload starter waits on. */
    static final String UPLOAD_STARTER = "_messenger";
    /**
     * Run before a skipped upload service start stops. The logger that starts the service holds a wakelock for up to 90
     * seconds and keeps a handler until the service sends one empty message back, which Messenger's own service does as
     * soon as it holds its own wakelock. Without this answer every skipped start kept the phone awake for the full 90
     * seconds (#37). A start from an alarm carries no starter, so it has nothing to answer.
     */
    public static void releaseUploadStarter(android.content.Intent intent) {
        if (intent == null) return;
        try {
            android.os.Bundle extras = intent.getExtras();
            Object starter = extras == null ? null : extras.get(UPLOAD_STARTER);
            if (starter instanceof android.os.Messenger) ((android.os.Messenger) starter).send(android.os.Message.obtain());
        } catch (android.os.DeadObjectException gone) {
            // The starter's process has died, and its wakelock went with it.
        } catch (android.os.RemoteException | RuntimeException error) {
            hookFailed("analytics_uploads", "Couldn't answer the analytics upload starter", error);
        }
    }
    /** Asked each time the ad attribution job runs, before it reads the Advertising ID; true skips that run. */
    public static boolean stopAttributionUploads() { return enabled("attribution_uploads"); }
    /** Asked before the inbox visibility event and the ad deep link's entry event are logged; true drops that one event. */
    public static boolean stopAdEvents() { return enabled("ad_events"); }

    static final String MQTT_TELEMETRY = "mqtt_telemetry";
    /** The topics Messenger publishes its own connection logging on. Messages, typing and presence use other topics. */
    static final Set<String> MQTT_TELEMETRY_TOPICS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList("/mqtt_health_stats", "/fbns_exp_logging")));
    /**
     * Asked before every publish on Messenger's MQTT connection. True drops a logging publish as if the connection were
     * down, which the health report's senders shrug off. Every other topic, and every topic while the switch is off,
     * goes out as before. A failure here sends the publish, since this sits in front of every message too.
     */
    public static boolean dropMqttPublish(String topic) {
        try {
            return topic != null && MQTT_TELEMETRY_TOPICS.contains(topic) && enabled(MQTT_TELEMETRY);
        } catch (RuntimeException error) {
            hookFailed(MQTT_TELEMETRY, "Can't check an MQTT publish", error);
            return false;
        }
    }
    /**
     * Messenger's config can make the keepalive send the health report instead of a plain ping. With the switch on the
     * keepalive keeps to the plain ping, so the connection stays up without the report.
     */
    public static boolean mqttHealthKeepalive(boolean healthReport) {
        try {
            return healthReport && !enabled(MQTT_TELEMETRY);
        } catch (RuntimeException error) {
            hookFailed(MQTT_TELEMETRY, "Can't check the MQTT keepalive", error);
            return healthReport;
        }
    }
    /**
     * Asked each time Messenger is about to queue its foreground location task, the one that requests a location and
     * starts its Wi-Fi and Bluetooth scans. True keeps the task from being queued.
     */
    public static boolean stopNearbyScans() { return enabled("nearby_scans"); }

    /**
     * Asked when Messenger is about to list the installed apps to find other Meta apps, and when it's about to ask them
     * for their family device ID. True gives it an empty list and skips the request.
     */
    public static boolean stopPhoneIdSync() { return enabled("phone_id_sync"); }

    /**
     * Asked when a story card ends on its own, from its timer, its video or a failed load, just before Messenger moves to
     * the next card. True keeps the card on screen. Taps and swipes never ask.
     */
    public static boolean holdStoryAtEnd() { return enabled("story_hold"); }

    /**
     * Asked when a call starts ringing, before Messenger decides to ring and vibrate, and again for the call's
     * notification. True takes Messenger's own ringtone-off path and posts the notification without the pop-up.
     */
    public static boolean quietIncomingCalls() { return enabled("quiet_calls"); }

    /** What Android tells an app that can't see the phone's location about the Wi-Fi network it's on. */
    static final String HIDDEN_WIFI_NAME = "<unknown ssid>";
    static final String HIDDEN_WIFI_BSSID = "02:00:00:00:00:00";

    /**
     * Asked each time Messenger reads the name of the Wi-Fi network the phone is connected to. With Stop nearby scans on
     * it gets Android's answer for an app without location access. No name stays no name.
     */
    public static String wifiName(String name) { return hideWifi(name, HIDDEN_WIFI_NAME); }

    /** The same for the network's BSSID, the access point's hardware address, which can place the phone on a map. */
    public static String wifiBssid(String bssid) { return hideWifi(bssid, HIDDEN_WIFI_BSSID); }

    private static String hideWifi(String value, String hidden) {
        if (value == null) return null;
        try {
            return enabled("nearby_scans") ? hidden : value;
        } catch (RuntimeException error) {
            hookFailed("nearby_scans", "Can't check Stop nearby scans", error);
            return value;
        }
    }

    static final String PINNED_CHATS = "pinned_chats";
    /** How many chats can be pinned with the switch on. Messenger's own limit is three. */
    static final int PINNED_CHAT_LIMIT = 20;
    /**
     * Asked each time Messenger reads how many chats can be pinned. With the switch on the answer is 20, or Messenger's
     * own number if that's ever higher. Off, Pause and safe mode give Messenger's number back.
     */
    public static int pinnedChatLimit(int stock) {
        try {
            return enabled(PINNED_CHATS) ? Math.max(stock, PINNED_CHAT_LIMIT) : stock;
        } catch (RuntimeException error) {
            hookFailed(PINNED_CHATS, "Can't check the pinned chat limit", error);
            return stock;
        }
    }
    /** Asked each time a chat's swipe up for disappearing messages could start; true keeps the gesture from starting. */
    public static boolean blockDisappearingSwipe() { return enabled("disappearing_swipe"); }
    /** Asked each time a chat looks for a photo or video taken just before it opened; true shows no card for it. */
    public static boolean hideRecentMedia() { return enabled("recent_media"); }
    static final String SHARE_STORY = "share_story";
    /** The Send to list's more-ways-to-share loader asks whether to add Your story; false leaves it out. */
    public static boolean keepShareStory(boolean shown) { return shown && !enabled(SHARE_STORY); }
    /**
     * The Send to list's story-only section compares its run state with its skip marker. Handing the marker back skips
     * the section, the same path Messenger takes when it turns the section off. Off, Pause and safe mode keep the state.
     */
    public static Object shareStorySection(Object state, Object skip) {
        return state != skip && enabled(SHARE_STORY) ? skip : state;
    }
    /** Messenger's own original-upload check allows 25 MB, so a bigger video keeps its re-encode. */
    static final long ORIGINAL_VIDEO_MAX_BYTES = 25L * 1024 * 1024;
    /**
     * The video transcoder's size check before it re-encodes. A negative answer sends the file through Messenger's own
     * passthrough. Off, Pause, safe mode and a file over 25 MB get Messenger's comparison back unchanged.
     */
    public static int videoPassthrough(int comparison, long bytes) {
        if (comparison < 0 || bytes <= 0 || bytes > ORIGINAL_VIDEO_MAX_BYTES) return comparison;
        return enabled("original_video") ? -1 : comparison;
    }

    /** The notification hook asks this before it reads a message, so nothing is read when the switch is off or paused. */
    public static boolean logReceivedMessages() { return wouldUse("message_log"); }

    /**
     * The message's own id, which the notification hook hands over just before the text and thread (the constructor it
     * runs in has room for two values at a time). The sink right after takes it on the same thread.
     */
    private static final ThreadLocal<String> INCOMING_ID = new ThreadLocal<>();

    public static void incomingMessageId(String id) { INCOMING_ID.set(id); }

    static String takeIncomingMessageId() {
        String id = INCOMING_ID.get();
        INCOMING_ID.remove();
        return id;
    }

    /** The notification hook hands the message here; the log stores it off this thread and swallows its own failures. */
    public static void recordReceivedMessage(String text, String thread) { MessageLog.record(text, thread, takeIncomingMessageId()); }

    /** The same notification hook asks this for an auto reply: on, not paused, and with at least one reply written. */
    public static boolean autoReplyWanted() { return AutoReply.wanted(); }

    /** Hands an incoming message to the auto reply, which answers it off this thread. */
    public static void autoReplyTo(String text, String thread) { AutoReply.received(text, thread, takeIncomingMessageId()); }

    /**
     * The chat camera button's intent, right before Messenger starts it. With the switch on it opens the capture screen,
     * which uses the phone's camera app. Off, Pause, safe mode and an install without the capture screen get Messenger's.
     */
    public static android.content.Intent systemCamera(android.content.Intent original) {
        try {
            Context context = appContext;
            if (original == null || context == null || !wouldUse(CameraActivity.KEY)) return original;
            android.content.Intent capture = CameraActivity.captureIntent(context);
            return capture != null && enabled(CameraActivity.KEY) ? capture : original;
        } catch (RuntimeException error) {
            hookFailed(CameraActivity.KEY, "Can't open the phone's camera app", error);
            return original;
        }
    }
    /** The chat reads a photo from another app back under its own request code, so the capture screen starts with that one. */
    public static int cameraRequestCode(android.content.Intent intent, int requestCode) {
        return GalleryPicker.isPick(appContext, intent) || CameraActivity.isCapture(appContext, intent)
            ? CameraActivity.EXTERNAL_MEDIA_REQUEST : requestCode;
    }
    /** Set on the extras the chat screen copies into its camera launcher. Edit opens its editor through that launcher too. */
    static final String CHAT_CAMERA_MARK = "app.hushmessenger.chat_camera";
    /** Set on one launch's own extras when the chat's camera button opens the camera, so Edit's launches go without it. */
    static final String CHAT_CAPTURE_MARK = "app.hushmessenger.chat_capture";
    /**
     * The chat camera's launcher factory hands over its copy of the camera screen's extras. Story and note replies build
     * the same kind of launcher for the same screen, and their extras never get the mark.
     */
    public static void markChatCamera(android.os.Bundle extras) {
        if (extras != null) extras.putBoolean(CHAT_CAMERA_MARK, true);
    }
    /** The camera button's ActivateCameraEvent handler hands over the extras of the launch it's about to make. */
    public static void markChatCapture(android.os.Bundle extras) {
        if (extras != null) extras.putBoolean(CHAT_CAPTURE_MARK, true);
    }
    /**
     * Every intent Messenger's activity launcher starts for a result comes past here. Only a capture from the chat's
     * camera button carries both marks, and that one goes to systemCamera. The marks come off either way, so Messenger's
     * camera and editor get their extras as they were.
     */
    public static android.content.Intent chatCamera(android.content.Intent intent) {
        try {
            if (intent == null) return null;
            boolean gallery = intent.getBooleanExtra(CHAT_GALLERY_MARK, false);
            boolean capture = intent.getBooleanExtra(CHAT_CAMERA_MARK, false)
                && intent.getBooleanExtra(CHAT_CAPTURE_MARK, false);
            intent.removeExtra(CHAT_GALLERY_MARK);
            intent.removeExtra(CHAT_CAMERA_MARK);
            intent.removeExtra(CHAT_CAPTURE_MARK);
            if (gallery) {
                android.content.Intent pick = GalleryPicker.screenIntent(appContext);
                if (pick != null) return pick;
            }
            if (!capture) return intent;
        } catch (RuntimeException error) {
            hookFailed(CameraActivity.KEY, "Couldn't read the chat camera's launch", error);
            return intent;
        }
        return systemCamera(intent);
    }
    /** Set on the extras the gallery button hands the chat camera's launcher, so its start opens the phone's gallery app. */
    static final String CHAT_GALLERY_MARK = "app.hushmessenger.chat_gallery";
    /**
     * The chat's gallery button asks this first. With the switch on and a gallery app on the phone, the button hands these
     * extras to the chat camera's launcher, whose start then opens that app. Null leaves the button to Messenger.
     */
    public static android.os.Bundle chatGallery() {
        try {
            Context context = appContext;
            if (context == null || !wouldUse(GalleryPicker.KEY) || GalleryPicker.screenIntent(context) == null ||
                !enabled(GalleryPicker.KEY)) return null;
            android.os.Bundle extras = new android.os.Bundle();
            extras.putBoolean(CHAT_GALLERY_MARK, true);
            return extras;
        } catch (RuntimeException error) {
            hookFailed(GalleryPicker.KEY, "Can't open your gallery app", error);
            return null;
        }
    }
    /**
     * The chat hands every result here before it reads one. A photo from another app comes back under 1112, and the chat
     * takes its type from the result and sends one without a type as a plain file. Gallery apps often hand back only the
     * picked item, so with the switch on a missing type comes from the item itself.
     */
    public static void externalMediaResult(int requestCode, int resultCode, android.content.Intent data) {
        try {
            if (requestCode != CameraActivity.EXTERNAL_MEDIA_REQUEST || resultCode != android.app.Activity.RESULT_OK || data == null ||
                data.getType() != null || data.getBooleanExtra(GalleryPicker.RESULT_PREPARED, false)) return;
            android.net.Uri picked = data.getData();
            Context context = appContext;
            if (picked == null || context == null || !"content".equals(picked.getScheme()) || !wouldUse(GalleryPicker.KEY) ||
                !enabled(GalleryPicker.KEY)) return;
            String type = context.getContentResolver().getType(picked);
            if (type != null) data.setDataAndType(picked, type);
        } catch (RuntimeException error) {
            hookFailed(GalleryPicker.KEY, "Couldn't read what your gallery app picked", error);
        }
    }
    /**
     * The chat's handler for a photo from another app asks this first, with the chat's thread and the result. It opens
     * only one item in the editor, so a pick of several from the pick screen goes to Messenger's Send to sheet with that
     * chat on top, and true tells the handler it's taken. False leaves the first item to the editor: one item, Off, Pause,
     * or a sheet that didn't open.
     */
    public static boolean galleryItems(Object thread, android.content.Intent data) {
        try {
            Context context = appContext;
            android.content.ClipData clip = data == null ? null : data.getClipData();
            if (context == null || clip == null || clip.getItemCount() < 2 || !data.getBooleanExtra(GalleryPicker.ITEMS_MARK, false) ||
                !enabled(GalleryPicker.KEY)) return false;
            // Two callers hand the handler the same result, so the second only takes it and opens no second sheet.
            if (data.getBooleanExtra(GalleryPicker.ITEMS_SENT, false)) return true;
            context.startActivity(GalleryPicker.sendIntent(context, thread, clip));
            data.putExtra(GalleryPicker.ITEMS_SENT, true);
            return true;
        } catch (RuntimeException error) {
            hookFailedPrivately(GalleryPicker.KEY, "Couldn't send everything you picked", error);
            return false;
        }
    }
    /**
     * Messenger 582's chat asks this before it copies a picked photo, and only copies from apps outside Meta's. The capture
     * screen's photo comes from a provider inside Messenger, so the one it just handed back is let through while its file
     * is there. It doesn't follow the switch, because a photo already on its way back must not close Messenger, and
     * everything else, other names in the same folder included, gets Messenger's own answer.
     */
    public static boolean trustCapturedPhoto(android.net.Uri uri) {
        try {
            Context context = appContext;
            java.io.File photo = context == null ? null : CameraProvider.fileFor(context, uri);
            return photo != null && photo.getName().equals(CameraActivity.handedBack) && photo.isFile();
        } catch (RuntimeException error) {
            hookFailed(CameraActivity.KEY, "Couldn't check the camera photo", error);
            return false;
        }
    }
    /**
     * Messenger then opens the photo and refuses any file Messenger itself owns, which every file the capture screen's
     * provider serves is. Its own photo counts as outside, and every other file keeps Messenger's answer.
     */
    public static boolean internalFile(boolean internal, android.net.Uri uri) {
        return internal && !trustCapturedPhoto(uri);
    }
    /** Encrypted chats send typing through one mailbox call; "not typing" is always allowed through. */
    public static boolean outgoingTyping(boolean typing) { return typing && !enabled("typing"); }
    static boolean available(String key) {
        // Without the capture screen, as on a Root Mount install, the chat camera stays Messenger's own.
        if (CameraActivity.KEY.equals(key)) {
            Context context = appContext;
            return context == null || CameraActivity.captureIntent(context) != null;
        }
        // A Root Mount install keeps the stock manifest, with no pick screen and maybe no gallery app Messenger can see.
        if (GalleryPicker.KEY.equals(key)) {
            Context context = appContext;
            return context == null || GalleryPicker.screenIntent(context) != null;
        }
        if (TextStyleActivity.KEY.equals(key)) {
            Context context = appContext;
            return context == null || TextStyleActivity.present(context);
        }
        if ("hide_menu_row".equals(key)) return menuRowCanHide();
        if (HIDE_ICON_SHORTCUTS.equals(key) || HIDE_LOGO_PRESS.equals(key)) return anotherWayIn(key);
        if (!"bubbles".equals(key)) return true;
        if (Build.VERSION.SDK_INT < 30) return false;
        if (!HostScreens.started) HostScreens.initializeLate();
        return !HostScreens.failed && bubbleRoutes;
    }
    public static boolean enableBubbles() {
        return available("bubbles") && enabled("bubbles") && !preferences.getBoolean(BUBBLE_CHAT_HEADS, false);
    }
    public static boolean forceChatHeads() {
        return available("bubbles") && enabled("bubbles") && preferences.getBoolean(BUBBLE_CHAT_HEADS, false);
    }
    public static boolean nativeBubbleRollout(boolean original) {
        return original || enableBubbles();
    }
    static String selectedBubbleMode() {
        if (preferences == null || !preferences.getBoolean("bubbles", false)) return "stock";
        return preferences.getBoolean(BUBBLE_CHAT_HEADS, false) ? "chat_heads" : "native";
    }
    public static boolean allowScreenshot() { return enabled("allow_screenshot"); }
    /** Messenger's subscription check for its built-in launcher icons. Off, paused or safe mode keeps Messenger's answer. */
    public static boolean unlockAppIcons() { return enabled("app_icons"); }
    public static void addScreenshotFlags(Window window, int flags) {
        window.addFlags(allowScreenshot() ? flags & ~WindowManager.LayoutParams.FLAG_SECURE : flags);
    }
    public static void setScreenshotFlags(Window window, int flags, int mask) {
        window.setFlags(allowScreenshot() ? flags & ~WindowManager.LayoutParams.FLAG_SECURE : flags, mask);
    }
    /** How long after you send something the open chat may mark itself read, which shows Seen as stock Messenger does. */
    static final long REPLY_READ_MS = 5_000;
    static volatile ReplyMarker lastReply;

    static final class ReplyMarker {
        final WeakReference<Object> session;
        final WeakReference<Object> thread;
        final long sentAt;

        ReplyMarker(Object session, Object thread, long sentAt) {
            this.session = new WeakReference<>(session);
            this.thread = new WeakReference<>(thread);
            this.sentAt = sentAt;
        }
    }

    /**
     * Hide read receipts: whether the open chat skips the job that marks it read and sends Seen. Right after you send
     * something from it, only that chat in the same session may run the job, since a reply shows you read it anyway.
     */
    public static boolean hideChatSeen(Object session, Object thread) {
        if (!wouldUse("hide_read_receipts")) return false;
        ReplyMarker reply = lastReply;
        if (session != null && thread != null && reply != null && reply.session.get() == session) {
            Object sentThread = reply.thread.get();
            long since = SystemClock.elapsedRealtime() - reply.sentAt;
            if (sentThread != null && since >= 0 && since < REPLY_READ_MS && sentThread.equals(thread)) return false;
        }
        return enabled("hide_read_receipts");
    }

    /**
     * The read receipt hook's entry, with Messenger's read handler and the message it's marking. A Seen held back is kept
     * for the Mark as read button, and the button's own tap goes through.
     */
    public static boolean hideChatSeen(Object session, Object thread, Object handler, String messageId) {
        if (MarkReadButton.replaying()) return false;
        if (!hideChatSeen(session, thread)) return false;
        try {
            MarkReadButton.hold(session, thread, handler, messageId);
        } catch (RuntimeException error) {
            hookFailed(MarkReadButton.KEY, "Can't keep the chat's Seen for Mark as read", error);
        }
        return true;
    }

    /** Record the account and thread only after the native composer dispatch returns. */
    public static void noteMessageSent(Object session, Object thread) {
        if (session != null && thread != null && wouldUse("hide_read_receipts")) {
            lastReply = new ReplyMarker(session, thread, SystemClock.elapsedRealtime());
        }
    }
    public static boolean keepUnsent() { return wouldUse("keep_unsent"); }
    public static boolean viewStoriesAnonymously() { return enabled("anonymous_stories"); }
    public static boolean saveAnyStory() { return enabled("save_stories"); }

    /** Story cards read on this phone, as "account:card:time kept". A story is up for a day; each entry lasts two. */
    static final String SEEN_STORIES = "anonymous_seen_stories";
    static final long SEEN_STORY_TTL = 48 * 60 * 60 * 1000L;
    private static final Object SEEN_STORIES_LOCK = new Object();

    /** Messenger's session hashes its user ID, so an account keeps its key across restarts and never shares it. */
    static String storyAccount(Object session) { return session == null ? "-" : Integer.toHexString(session.hashCode()); }

    /**
     * Messenger just marked a story card read on this phone. With the switch on, the server never hears about it, so
     * the card is kept for its account until the next launch can hand it back.
     */
    public static void markStorySeen(Object session, String cardId) {
        if (cardId == null || cardId.isEmpty()) return;
        try {
            if (!enabled("anonymous_stories")) return;
            String card = storyAccount(session) + ":" + cardId + ":";
            long now = System.currentTimeMillis();
            synchronized (SEEN_STORIES_LOCK) {
                Set<String> kept = new HashSet<>();
                for (String entry : preferences.getStringSet(SEEN_STORIES, Collections.emptySet())) {
                    if (!entry.startsWith(card) && !seenStoryExpired(entry, now)) kept.add(entry);
                }
                kept.add(card + now);
                preferences.edit().putStringSet(SEEN_STORIES, kept).apply();
            }
            clearStoryRings(cardId);
        } catch (RuntimeException error) {
            hookFailed("anonymous_stories", "Can't keep a story marked seen", error);
        }
    }

    static final int STORY_RING_CARDS = 512;
    private static final int STORY_RING_COPIES = 8;
    /**
     * Story previews Messenger built while their card was still new, by card ID. Messenger keeps a preview in its
     * story cache once it's built, so opening the card has to clear the ring of the ones still around.
     */
    static final Map<String, List<WeakReference<Object>>> storyRings =
        new LinkedHashMap<String, List<WeakReference<Object>>>(16, 0.75f, true) {
            @Override protected boolean removeEldestEntry(Map.Entry<String, List<WeakReference<Object>>> eldest) {
                return size() > STORY_RING_CARDS;
            }
        };
    /** The patch adds this static method to Messenger's story preview. It asks storyRingSeen, then clears the ring. */
    static final String STORY_RING_HELPER = "hushmessengerStoryRing";

    /**
     * Messenger built a story preview, and the new-story ring in the chat list reads it. Messenger sets that ring from
     * the server's seen state and never looks at the cards read on this phone, so with the switch on a card kept here
     * counts as seen. Card IDs don't depend on the account, so a card any account here opened counts.
     */
    public static boolean storyRingSeen(Object preview, String cardId) {
        if (preview == null || cardId == null || cardId.isEmpty()) return false;
        try {
            if (!wouldUse("anonymous_stories")) return false;
            if (storyKept(cardId, System.currentTimeMillis())) return enabled("anonymous_stories");
            synchronized (storyRings) {
                List<WeakReference<Object>> previews = storyRings.get(cardId);
                if (previews == null) storyRings.put(cardId, previews = new ArrayList<>());
                previews.removeIf(ref -> ref.get() == null || ref.get() == preview);
                if (previews.size() >= STORY_RING_COPIES) previews.remove(0);
                previews.add(new WeakReference<>(preview));
            }
            return false;
        } catch (RuntimeException error) {
            hookFailed("anonymous_stories", "Can't check a story ring", error);
            return false;
        }
    }

    static boolean storyKept(String cardId, long now) {
        for (String entry : preferences.getStringSet(SEEN_STORIES, Collections.emptySet())) {
            int card = entry.indexOf(':');
            int time = entry.lastIndexOf(':');
            if (card >= 0 && time > card && entry.substring(card + 1, time).equals(cardId) && !seenStoryExpired(entry, now)) return true;
        }
        return false;
    }

    /** Runs the preview's own helper again on each preview still around for a card that was just kept. */
    private static void clearStoryRings(String cardId) {
        List<WeakReference<Object>> previews;
        synchronized (storyRings) {
            previews = storyRings.remove(cardId);
        }
        if (previews == null) return;
        for (WeakReference<Object> ref : previews) {
            Object preview = ref.get();
            if (preview == null) continue;
            try {
                preview.getClass().getMethod(STORY_RING_HELPER, preview.getClass()).invoke(null, preview);
            } catch (ReflectiveOperationException | RuntimeException error) {
                hookFailed("anonymous_stories", "Can't clear a story ring", error);
            }
        }
    }

    /**
     * Each session starts Messenger's set of cards read on this phone empty, and its story lists count a card in it
     * as seen. This puts back the cards the session's account opened while the switch was on.
     */
    public static void seedSeenStories(Set<String> readOnPhone, Object session) {
        if (readOnPhone == null) return;
        try {
            if (!wouldUse("anonymous_stories")) return;
            String account = storyAccount(session) + ":";
            long now = System.currentTimeMillis();
            for (String entry : preferences.getStringSet(SEEN_STORIES, Collections.emptySet())) {
                int time = entry.lastIndexOf(':');
                if (entry.startsWith(account) && time > account.length() && !seenStoryExpired(entry, now)) {
                    readOnPhone.add(entry.substring(account.length(), time));
                }
            }
        } catch (RuntimeException error) {
            hookFailed("anonymous_stories", "Can't restore stories marked seen", error);
        }
    }

    static boolean seenStoryExpired(String entry, long now) {
        int time = entry.lastIndexOf(':');
        if (time < 0) return true;
        try {
            return now - Long.parseLong(entry.substring(time + 1)) > SEEN_STORY_TTL;
        } catch (NumberFormatException error) {
            return true;
        }
    }

    /** The icon stays hidden only while the Menu row that replaces it exists. */
    static boolean drawerIconHidden() {
        SharedPreferences prefs = preferences;
        return installed.contains("menu_row") && prefs != null && prefs.getBoolean("hide_drawer_icon", false);
    }

    /** Set the first time settings open from the long-press shortcut, which proves that way in works on this phone. */
    static final String SHORTCUT_USED = "shortcut_used";

    static void noteShortcutUsed() {
        SharedPreferences prefs = preferences;
        if (prefs != null && !prefs.getBoolean(SHORTCUT_USED, false)) prefs.edit().putBoolean(SHORTCUT_USED, true).apply();
    }

    /**
     * The patched build a long press on the logo last opened settings on, the same proof for that way in. It holds for
     * that build only: after an update or a repatch the patch can still find the logo's handler while Messenger never
     * calls it, so one press has to work again.
     */
    static final String LOGO_USED = "logo_used_build";

    static boolean logoPressProven(Context context) {
        SharedPreferences prefs = preferences;
        String build = patchedBuild(context);
        return prefs != null && build != null && build.equals(prefs.getString(LOGO_USED, null));
    }

    /**
     * This Messenger install and the HushMessenger version patched into it. A Root Mount repatch keeps Messenger's
     * install time, so the version is what tells a new patch apart. Null when the install time is unknown.
     */
    static String patchedBuild(Context context) {
        Long install = installedAt(context);
        return install == null ? null : install + "/" + BuildConfig.VERSION_NAME;
    }

    private static volatile Long installedAt;

    /** When this Messenger install went in, read once: an update or a repatch ends the process. Null when unknown. */
    static Long installedAt(Context context) {
        Long known = installedAt;
        if (known != null || context == null) return known;
        try {
            known = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).lastUpdateTime;
        } catch (android.content.pm.PackageManager.NameNotFoundException | RuntimeException error) {
            return null;
        }
        installedAt = known;
        return known;
    }

    /**
     * The Menu row can stay out only once another way in has opened settings here and is still on: the logo long press,
     * or the long-press shortcut while it's published. If neither is left, as after a Root Mount start that couldn't
     * publish the shortcut, the row comes back.
     */
    static boolean menuRowCanHide() {
        SharedPreferences prefs = preferences;
        if (prefs == null) return false;
        if (logoPressOn() && logoPressProven(appContext)) return true;
        return !prefs.getBoolean(HIDE_ICON_SHORTCUTS, false) && prefs.getBoolean(SHORTCUT_USED, false)
            && HostScreens.controlsShortcutPresent(appContext);
    }

    static boolean menuRowHidden() {
        SharedPreferences prefs = preferences;
        return prefs != null && prefs.getBoolean("hide_menu_row", false) && menuRowCanHide();
    }

    /** Recorded with the Menu row only when the long press on the Messenger logo at the top of Chats went in too. */
    static final String LOGO_LONG_PRESS = "logo_long_press";

    static boolean logoOpensSettings() {
        return installed.contains(LOGO_LONG_PRESS);
    }

    /**
     * The ways back into settings each have a switch (HushFacebook#146): these two, Hide the Menu row and Hide app
     * drawer icon. They aren't controls, so Pause and safe mode leave them as they are, since each is a way back in to
     * undo either.
     */
    static final String HIDE_ICON_SHORTCUTS = "hide_icon_shortcuts";
    static final String HIDE_LOGO_PRESS = "hide_logo_press";

    /** Whether a long press on the Messenger logo opens settings: patched in and not switched off. */
    static boolean logoPressOn() {
        SharedPreferences prefs = preferences;
        return logoOpensSettings() && (prefs == null || !prefs.getBoolean(HIDE_LOGO_PRESS, false));
    }

    /** Whether the settings icon in the app drawer is there to tap, which a Root Mount install never has. */
    static boolean drawerIconShown(Context context) {
        if (context == null || drawerIconHidden()) return false;
        try {
            android.content.pm.PackageManager packages = context.getPackageManager();
            android.content.ComponentName alias = new android.content.ComponentName(context, SettingsActivity.DRAWER_ALIAS);
            packages.getActivityInfo(alias, android.content.pm.PackageManager.MATCH_DISABLED_COMPONENTS);
            return !HostScreens.hosted(context);
        } catch (android.content.pm.PackageManager.NameNotFoundException | RuntimeException missing) {
            return false;
        }
    }

    /**
     * Whether Patch controls and Restart Messenger belong on the app icon's long-press menu: their switch, or on anyway
     * when no other way back in is left. The Menu row counts whenever it's patched in, since it comes back by itself
     * once the shortcut and the logo press are both gone.
     */
    static boolean iconShortcutsShown(Context context) {
        SharedPreferences prefs = preferences;
        if (prefs == null || !prefs.getBoolean(HIDE_ICON_SHORTCUTS, false)) return true;
        return !(logoPressOn() || installed.contains("menu_row") || drawerIconShown(context));
    }

    /**
     * Whether [key], one of the hide switches for a way back in, can be turned on: only while another way stays. One
     * already on can always be turned off.
     */
    private static boolean anotherWayIn(String key) {
        SharedPreferences prefs = preferences;
        if (prefs == null || prefs.getBoolean(key, false)) return true;
        Context context = appContext;
        boolean menuRow = installed.contains("menu_row") && !menuRowHidden();
        if (HIDE_ICON_SHORTCUTS.equals(key)) return logoPressOn() || menuRow || drawerIconShown(context);
        return iconShortcutsShown(context) || menuRow || drawerIconShown(context);
    }

    private static final String KEPT_UNSENT_KEY = "kept_unsent_ids";
    private static final int KEPT_UNSENT_LIMIT = 4096;
    private static final Object KEPT_UNSENT_LOCK = new Object();

    public static void recordUnsent(String messageId) {
        if (messageId == null || messageId.isEmpty() || !wouldUse("keep_unsent")) return;
        SharedPreferences prefs = preferences;
        if (prefs == null) return;
        synchronized (KEPT_UNSENT_LOCK) {
            Set<String> previous = prefs.getStringSet(KEPT_UNSENT_KEY, Collections.emptySet());
            if (previous.size() > KEPT_UNSENT_LIMIT || !previous.contains(messageId)) {
                Set<String> ids = new HashSet<>();
                ids.add(messageId);
                // StringSet has no age ordering. Preserve this interception and bound the remaining markers.
                for (String id : previous) {
                    if (ids.size() == KEPT_UNSENT_LIMIT) break;
                    ids.add(id);
                }
                prefs.edit().putStringSet(KEPT_UNSENT_KEY, ids).apply();
            }
        }
        activeAt.put("keep_unsent", System.currentTimeMillis());
    }

    public static boolean isKeptUnsent(String messageId) {
        if (messageId == null) return false;
        SharedPreferences prefs = preferences;
        if (prefs == null) return false;
        return prefs.getStringSet(KEPT_UNSENT_KEY, Collections.emptySet()).contains(messageId);
    }

    public static String labelKeptUnsent(String text, String messageId) {
        if (!wouldUse("keep_unsent") || text == null) return text;
        if (isKeptUnsent(messageId)) return "[unsent] " + text;
        return text;
    }

    public static boolean suppressUnsent(boolean original, String messageId) {
        if (original && wouldUse("keep_unsent") && isKeptUnsent(messageId)) return false;
        return original;
    }

    /** Android's standard color emoji font, used when the phone can't say which font it draws emoji with. */
    static final String NOTO_EMOJI_FONT = "/system/fonts/NotoColorEmoji.ttf";
    /** Null asks Android which font it draws emoji with. Tests point this at a missing file. */
    static volatile String systemEmojiFont;
    /** Read without a lock by every hook thread that draws emoji, and loaded once under Settings.class. */
    static volatile android.graphics.Typeface systemEmoji;
    static volatile boolean systemEmojiMissing;
    /** Which font the emoji typeface came from, for diagnostics and tests. */
    static volatile String systemEmojiSource;
    public static android.graphics.Typeface systemEmojiTypeface() {
        // Checked before enabled(), so a font that failed to load doesn't count as a use.
        if (systemEmojiMissing || !enabled("use_system_emoji")) return null;
        android.graphics.Typeface loaded = systemEmoji;
        if (loaded != null) return loaded;
        synchronized (Settings.class) {
            // Another thread may have loaded it, or failed to, while this one waited.
            if (systemEmojiMissing) return null;
            if (systemEmoji != null) return systemEmoji;
            try {
                // Samsung, many other phones and emoji modules draw emoji with a font other than NotoColorEmoji.ttf (#25).
                String font = systemEmojiFont;
                android.graphics.Typeface shaped = font == null ? shapedEmojiTypeface() : null;
                if (shaped != null) {
                    systemEmoji = shaped;
                } else {
                    String path = font != null ? font : NOTO_EMOJI_FONT;
                    android.graphics.Typeface typeface = android.graphics.Typeface.createFromFile(path);
                    systemEmojiSource = path;
                    systemEmoji = typeface;
                }
            } catch (Exception error) {
                // The font file won't appear later, so Messenger's own emoji stay without retrying on every draw.
                systemEmojiMissing = true;
                hookFailed("use_system_emoji", "Can't load the system emoji font", error);
            }
            return systemEmoji;
        }
    }

    /** Default emoji presentation, so Android picks its emoji font rather than a text symbol font. */
    static final String EMOJI_PROBE = "😀";

    /**
     * Android 12 and newer report the font they shape an emoji with, which is the phone's own emoji set. The typeface
     * keeps Android's usual fallback, so flags in a separate font still draw. Null means use the font file path instead.
     */
    static android.graphics.Typeface shapedEmojiTypeface() {
        if (android.os.Build.VERSION.SDK_INT < 31) return null;
        try {
            android.graphics.text.PositionedGlyphs glyphs = android.graphics.text.TextRunShaper.shapeTextRun(
                EMOJI_PROBE, 0, EMOJI_PROBE.length(), 0, EMOJI_PROBE.length(), 0f, 0f, false, new android.graphics.Paint());
            // Glyph 0 is the missing-glyph box: the phone has no emoji font, so Messenger's set should stay.
            if (glyphs.glyphCount() == 0 || glyphs.getGlyphId(0) == 0) return null;
            android.graphics.fonts.Font font = glyphs.getFont(0);
            systemEmojiShaped = font;
            java.io.File file = font.getFile();
            android.graphics.Typeface typeface;
            if (file != null && file.canRead()) {
                typeface = android.graphics.Typeface.createFromFile(file);
            } else {
                // Updated emoji fonts can live where the app can't open them; the shaped font is already loaded.
                typeface = new android.graphics.Typeface.CustomFallbackBuilder(
                    new android.graphics.fonts.FontFamily.Builder(font).build()).setSystemFallback("sans-serif").build();
            }
            systemEmojiSource = file != null ? file.getPath() : "shaped emoji font";
            return typeface;
        } catch (RuntimeException error) {
            android.util.Log.w("HushMessenger", "Can't find the phone's emoji font, using " + NOTO_EMOJI_FONT, error);
            return null;
        }
    }

    /** The android.graphics.fonts.Font Android shaped the emoji probe with; Object so Android 9 never resolves the type. */
    static volatile Object systemEmojiShaped;
    /** Messenger's downloaded FacebookEmoji.ttf, recorded as Messenger loads it. */
    static volatile java.io.File messengerEmojiFile;
    static java.io.File mergedEmojiFile;
    static android.graphics.Typeface mergedEmoji;
    static int mergeTries;

    /** Where Messenger's emoji font was the last time it loaded, kept across runs. */
    static final String EMOJI_FONT_PATH = "messenger_emoji_font";

    /** Messenger's emoji font holder hands over its font file as Messenger builds it. */
    public static void messengerEmojiFont(java.io.File file) {
        messengerEmojiFile = file;
        logEmoji("Messenger emoji font " + (file == null ? "null" : file.getName() + " " + file.length() + " bytes"));
        SharedPreferences prefs = preferences;
        if (file != null && prefs != null && !file.getPath().equals(prefs.getString(EMOJI_FONT_PATH, null)))
            prefs.edit().putString(EMOJI_FONT_PATH, file.getPath()).apply();
    }

    /** The font file Messenger loaded on an earlier run, while it's still there. */
    static java.io.File rememberedEmojiFont() {
        SharedPreferences prefs = preferences;
        String path = prefs == null ? null : prefs.getString(EMOJI_FONT_PATH, null);
        java.io.File file = path == null ? null : new java.io.File(path);
        return file != null && file.isFile() ? file : null;
    }

    static volatile String lastEmojiLog;

    /** One line per change, so a report's logcat shows which emoji path a phone took. */
    static void logEmoji(String state) {
        if (state.equals(lastEmojiLog)) return;
        lastEmojiLog = state;
        android.util.Log.i("HushMessenger", "use_system_emoji: " + state);
    }

    /**
     * Wraps every return of Messenger's emoji typeface getter. The phone's emoji font has no glyph for Messenger's own
     * Like (U+F0000) and similar private characters, so Android 10 and newer draw those from Messenger's font (#34).
     */
    public static android.graphics.Typeface systemEmojiTypeface(android.graphics.Typeface messenger) {
        android.graphics.Typeface system = systemEmojiTypeface();
        if (system == null) return messenger;
        java.io.File file = messengerEmojiFile;
        // After an update Messenger can ask before its font has loaded and keeps that first answer for the whole run, so
        // the chat list would lose the Like until the next restart. The font file from the last run stands in until then.
        if (file == null) file = rememberedEmojiFont();
        if (file == null || android.os.Build.VERSION.SDK_INT < 29) {
            logEmoji("phone emoji only (" + (file == null ? "no Messenger font file yet" : "Android " + android.os.Build.VERSION.SDK_INT)
                + "), source " + systemEmojiSource);
            likeWithoutFont = true;
            return system;
        }
        synchronized (Settings.class) {
            // A merge that failed gets a couple more tries on the same file, since a font still being written fails once.
            if (!file.equals(mergedEmojiFile) || (mergedEmoji == null && mergeTries < 3)) {
                if (!file.equals(mergedEmojiFile)) mergeTries = 0;
                mergeTries++;
                mergedEmojiFile = file;
                mergedEmoji = null;
                try {
                    mergedEmoji = withMessengerFallback(file);
                } catch (Exception error) {
                    // The phone's emoji still apply; only Messenger's private characters stay as boxes.
                    hookFailedPrivately("use_system_emoji", "Can't add Messenger's emoji font behind the phone's", error);
                }
            }
            logEmoji(mergedEmoji != null ? "phone emoji with Messenger's font behind it, source " + systemEmojiSource
                : "phone emoji only (merge failed), source " + systemEmojiSource);
            if (mergedEmoji == null) likeWithoutFont = true;
            return mergedEmoji != null ? mergedEmoji : system;
        }
    }

    /**
     * Set once this run hands Messenger an emoji typeface without Messenger's font behind it (Android 9, no font file
     * yet, or a failed merge). Messenger keeps its first answer, so the Like stays a box until the next start even if
     * the font turns up later.
     */
    static volatile boolean likeWithoutFont;

    private static final String LIKE = new String(Character.toChars(0xF0000));
    private static final String THUMBS_UP = new String(Character.toChars(0x1F44D));

    /**
     * The chat list's last-message snippet as Messenger builds it (#34 follow-up). A Like there is U+F0000, which only
     * Messenger's downloaded emoji font can draw. With Use system emoji on, the phone's own thumbs up stands in whenever
     * the typeface Messenger got this run can't draw it. Both are two chars long, so spans over the text stay where they
     * were.
     */
    public static CharSequence chatListSnippet(CharSequence text) {
        try {
            if (text == null || android.text.TextUtils.indexOf(text, LIKE) < 0 || !wouldUse("use_system_emoji")
                || likeDrawn()) return text;
            CharSequence swapped = withThumbsUp(text);
            if (swapped != text) enabled("use_system_emoji");
            return swapped;
        } catch (RuntimeException error) {
            hookFailedPrivately("use_system_emoji", "Can't show the Like in the chat list", error);
            return text;
        }
    }

    /** Whether this run's emoji typeface draws the Like, as far as Hush can tell before Messenger asks for one. */
    static boolean likeDrawn() {
        if (likeWithoutFont) return false;
        // Android 9 can't put Messenger's font behind the phone's, unless the phone's failed and Messenger's own is used.
        if (android.os.Build.VERSION.SDK_INT < 29 && !systemEmojiMissing) return false;
        return messengerEmojiFile != null || rememberedEmojiFont() != null;
    }

    /** The text with every Like swapped, as the same class so Messenger's own code sees what it built. */
    static CharSequence withThumbsUp(CharSequence text) {
        if (text instanceof String) return ((String) text).replace(LIKE, THUMBS_UP);
        Class<?> type = text.getClass();
        if (type != android.text.SpannableStringBuilder.class && type != android.text.SpannableString.class
            && type != android.text.SpannedString.class) return text;
        android.text.SpannableStringBuilder swapped = new android.text.SpannableStringBuilder(text);
        for (int at = android.text.TextUtils.indexOf(swapped, LIKE); at >= 0;
             at = android.text.TextUtils.indexOf(swapped, LIKE, at + THUMBS_UP.length())) {
            swapped.replace(at, at + LIKE.length(), THUMBS_UP);
        }
        if (type == android.text.SpannableString.class) return new android.text.SpannableString(swapped);
        if (type == android.text.SpannedString.class) return new android.text.SpannedString(swapped);
        return swapped;
    }

    @android.annotation.TargetApi(29)
    static android.graphics.Typeface withMessengerFallback(java.io.File messengerFont) throws java.io.IOException {
        android.graphics.fonts.Font system = systemEmojiShaped instanceof android.graphics.fonts.Font
            ? (android.graphics.fonts.Font) systemEmojiShaped
            : new android.graphics.fonts.Font.Builder(new java.io.File(systemEmojiSource)).build();
        return new android.graphics.Typeface.CustomFallbackBuilder(new android.graphics.fonts.FontFamily.Builder(system).build())
            .addCustomFallback(new android.graphics.fonts.FontFamily.Builder(
                new android.graphics.fonts.Font.Builder(messengerFont).build()).build())
            .setSystemFallback("sans-serif")
            .build();
    }

    /** First answer this process gave for the font switch, or null before Messenger asked for a typeface. */
    static volatile Boolean customFont;
    private static final Object CUSTOM_FONT = new Object();

    /**
     * Messenger keeps many typefaces it gets for the whole run, so the font switch holds its first answer until a restart
     * and a change can't leave half the screen in each font. Nothing is held before the settings load.
     */
    static boolean customFontOn() {
        Boolean on = customFont;
        if (on != null) return on;
        if (!HostScreens.started) HostScreens.initializeLate();
        if (preferences == null && !HostScreens.failed) return false;
        synchronized (CUSTOM_FONT) {
            if (customFont == null) customFont = wouldUse(OwnFont.KEY);
            return customFont;
        }
    }

    private static android.graphics.Typeface fontUsed(android.graphics.Typeface original, android.graphics.Typeface chosen) {
        if (chosen != original) activeAt.put(OwnFont.KEY, System.currentTimeMillis());
        return chosen;
    }

    /** Litho's text layouts hand over each typeface before laying text out. A picked file replaces the phone's font. */
    public static android.graphics.Typeface customFontLayout(android.graphics.Typeface original) {
        try {
            return customFontOn() ? fontUsed(original, OwnFont.replacePhoneFont(original)) : original;
        } catch (RuntimeException | LinkageError error) {
            hookFailed(OwnFont.KEY, "Can't change a text layout's font", error);
            return original;
        }
    }

    /**
     * Messenger's typeface repository hands over each font family it resolves, with the weight asked for. The Optimistic
     * families become the phone's font or the picked file. Roboto Mono and the rest stay Messenger's.
     */
    public static android.graphics.Typeface customFontRepository(android.graphics.Typeface original, Object family, int weight) {
        try {
            if (!customFontOn()) return original;
            String name = family instanceof Enum ? ((Enum<?>) family).name() : null;
            return fontUsed(original, OwnFont.replace(original, name, weight));
        } catch (RuntimeException | LinkageError error) {
            hookFailed(OwnFont.KEY, "Can't change Messenger's font", error);
            return original;
        }
    }

    /** Messenger's Roboto builder hands over the phone's sans-serif at a text style's weight. A picked file replaces it. */
    public static android.graphics.Typeface customFontRoboto(android.graphics.Typeface original) {
        if (original == null) return null;
        try {
            return customFontOn() ? fontUsed(original, OwnFont.replacePhoneFont(original)) : original;
        } catch (RuntimeException | LinkageError error) {
            hookFailed(OwnFont.KEY, "Can't change the Roboto font", error);
            return original;
        }
    }

    /** MIG's typeface by name hands over what it found for [name]. A picked file replaces the phone's sans-serif. */
    public static android.graphics.Typeface customFontByName(android.graphics.Typeface original, String name) {
        if (original == null) return null;
        try {
            if (!customFontOn()) return original;
            boolean phone = OwnFont.isPhoneSans(name) || OwnFont.isPhoneTypeface(original);
            return fontUsed(original, phone ? OwnFont.pickedInstead(original) : original);
        } catch (RuntimeException | LinkageError error) {
            hookFailed(OwnFont.KEY, "Can't change a font picked by name", error);
            return original;
        }
    }

    /** Litho's text inputs set their typeface here. A picked file replaces the phone's font, and the style applies as usual. */
    public static void customFontInput(android.widget.TextView view, android.graphics.Typeface typeface, int style) {
        android.graphics.Typeface chosen = typeface;
        try {
            if (customFontOn()) chosen = fontUsed(typeface, OwnFont.replacePhoneFont(typeface));
        } catch (RuntimeException | LinkageError error) {
            hookFailed(OwnFont.KEY, "Can't change a text input's font", error);
        }
        view.setTypeface(chosen, style);
    }

    /** Only the section renderer receives a copy. The captured native snapshot is never changed. */
    public static List<?> filterJoinedCommunityInboxRows(List<?> items, Object callback, Object filter) {
        return filterJoinedCommunityInboxRows(items, () -> isAllChatsFilter(filter) && HostScreens.isMainInboxScope(callback, filter),
            HostScreens::isJoinedCommunityRow);
    }

    // Every chip except Message Requests keeps the INBOX folder, so Channels and Unread would otherwise count as the main list.
    static boolean isAllChatsFilter(Object filter) {
        return filter instanceof Enum && "ALL".equals(((Enum<?>) filter).name());
    }

    static List<?> filterJoinedCommunityInboxRows(List<?> items, java.util.function.BooleanSupplier mainInbox,
            java.util.function.Predicate<Object> joined) {
        if (items == null || items.isEmpty() || !enabled("community_inbox")) return items;
        try {
            if (!mainInbox.getAsBoolean()) return items;
            List<Object> kept = null;
            for (int at = 0; at < items.size(); at++) {
                Object item = items.get(at);
                boolean hide = item != null && joined.test(item);
                if (hide && kept == null) kept = new ArrayList<>(items.subList(0, at));
                if (!hide && kept != null) kept.add(item);
            }
            return kept == null ? items : Collections.unmodifiableList(kept);
        } catch (RuntimeException | LinkageError error) {
            hookFailedPrivately("community_inbox", "Can't filter joined community chats", error);
            return items;
        }
    }

    private static final String AVATAR_TAB_EVENT = "com.facebook.xapp.messaging.composer.avatar.composertab.event.ActivateAvatarSticker";

    /** The composer factory passes its local tab list here just before copying it, so the list is ours to change. */
    public static void removeAvatarTabs(Iterable<?> tabs) {
        if (!(tabs instanceof java.util.Collection) || !enabled("avatar_stickers")) return;
        try {
            ((java.util.Collection<?>) tabs).removeIf(Settings::opensAvatarTab);
        } catch (RuntimeException | LinkageError error) {
            hookFailed("avatar_stickers", "Can't filter the sticker keyboard tabs", error);
        }
    }

    // Some builds keep the tab's event directly on the item, others on a config object the item holds.
    static boolean opensAvatarTab(Object tab) {
        return holdsAvatarEvent(tab, 2);
    }

    private static boolean holdsAvatarEvent(Object value, int depth) {
        if (value == null || depth == 0) return false;
        java.lang.reflect.Field[] fields;
        // Listing the fields resolves each field's type, and one that won't load says nothing about the avatar tab.
        try { fields = value.getClass().getDeclaredFields(); }
        catch (LinkageError unloadable) { return false; }
        for (java.lang.reflect.Field f : fields) {
            if (java.lang.reflect.Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
            try {
                f.setAccessible(true);
                Object field = f.get(value);
                if (field == null) continue;
                if (AVATAR_TAB_EVENT.equals(field.getClass().getName())) return true;
                // Only Messenger's own obfuscated classes are walked into, never strings or collections.
                if (field.getClass().getName().startsWith("X.") && holdsAvatarEvent(field, depth - 1)) return true;
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        }
        return false;
    }

    /** Keep non-web routes and Messenger's surrounding link handling intact. */
    public static boolean preferExternalBrowser(boolean original, Uri uri) {
        if (uri == null || !enabled("external_browser")) return original;
        String scheme = uri.getScheme();
        return ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme)) || original;
    }

    private static Object legacyDrawerKey;

    /** Replaced by the menu patch with constructors from the validated host build. */
    public static Object legacyDrawerSection(Context context) {
        return null;
    }

    /**
     * Replaced by the auto reply patch when this Messenger's media send matched: builds the photo messages for [picture]
     * in the chat [thread] (a thread key string) and returns Messenger's future of them. Null means the build has no
     * bridge, so a reply goes out as text only.
     */
    public static Object autoReplyPictureMessages(Context context, String thread, Uri picture) {
        return null;
    }

    /** Replaced with the notification reply service's own send for one built message. Returns its future, or null. */
    public static Object autoReplySendMessage(Object message) {
        return null;
    }

    /** Replaced to return true when the two methods above were filled in. */
    public static boolean autoReplyPictures() {
        return false;
    }

    /** Only the independent folder identity survives refreshes, never a context or a row. */
    public static synchronized Object cachedLegacyDrawerKey(Object proposed) {
        if (proposed == null) return null;
        if (legacyDrawerKey == null) legacyDrawerKey = proposed;
        return legacyDrawerKey.getClass() == proposed.getClass() ? legacyDrawerKey : null;
    }

    /** The legacy drawer can omit Settings entirely, so construct a separate native section. */
    @SuppressWarnings("unchecked")
    public static List addLegacyDrawerEntry(Object fragment, List sections) {
        if (fragment == null || sections == null) return sections;
        try {
            if (menuRowHidden()) return sections;
            java.lang.reflect.Method getContext = fragment.getClass().getMethod("getContext");
            getContext.setAccessible(true);
            Object current = getContext.invoke(fragment);
            if (!(current instanceof Context)) return sections;
            Context context = (Context) current;
            Object section = legacyDrawerSection(context);
            if (section == null) return sections;

            Class<?> sectionClass = section.getClass();
            java.lang.reflect.Field rowsField = sectionClass.getDeclaredField("A06");
            if (rowsField.getType() != List.class) throw new IllegalArgumentException("Drawer rows changed");
            rowsField.setAccessible(true);
            Object rows = rowsField.get(section);
            if (!(rows instanceof List) || ((List) rows).size() != 1)
                throw new IllegalArgumentException("Drawer factory rows changed");
            Object row = ((List) rows).get(0);
            if (row == null) throw new IllegalArgumentException("Drawer factory row missing");
            Class<?> rowClass = row.getClass();
            java.lang.reflect.Field title = rowClass.getDeclaredField("A06");
            java.lang.reflect.Field owner = rowClass.getDeclaredField("A00");
            java.lang.reflect.Field key = rowClass.getDeclaredField("A03");
            java.lang.reflect.Field metadata = rowClass.getDeclaredField("A04");
            if (title.getType() != String.class || owner.getType() != Context.class
                    || !key.getType().getName().endsWith("DrawerFolderKey")
                    || !metadata.getType().getName().endsWith("HeterogeneousMap"))
                throw new IllegalArgumentException("Drawer row fields changed");
            title.setAccessible(true);
            owner.setAccessible(true);
            key.setAccessible(true);
            metadata.setAccessible(true);
            Object ownKey = key.get(row);
            if (!"HushMessenger".equals(title.get(row)) || owner.get(row) != context
                    || ownKey == null || !ownKey.getClass().getName().endsWith("SettingsFolderKey")
                    || !key.getType().isInstance(ownKey) || metadata.get(row) == null
                    || !metadata.getType().isInstance(metadata.get(row)))
                throw new IllegalArgumentException("Drawer factory values changed");

            boolean present = false;
            // Validate the complete input even when an earlier section already contains our row.
            for (Object originalSection : sections) {
                if (originalSection == null || originalSection.getClass() != sectionClass)
                    throw new IllegalArgumentException("Drawer section changed");
                Object originalRows = rowsField.get(originalSection);
                if (!(originalRows instanceof List)) throw new IllegalArgumentException("Drawer rows missing");
                for (Object originalRow : (List) originalRows) {
                    if (originalRow == null || originalRow.getClass() != rowClass)
                        throw new IllegalArgumentException("Drawer row changed");
                    Object originalKey = key.get(originalRow);
                    Object originalMetadata = metadata.get(originalRow);
                    Object originalTitle = title.get(originalRow);
                    if (originalKey == null || !key.getType().isInstance(originalKey)
                            || originalTitle == null || !(originalTitle instanceof String)
                            || (originalMetadata != null && !metadata.getType().isInstance(originalMetadata)))
                        throw new IllegalArgumentException("Drawer row values changed");
                    if ("HushMessenger".equals(originalTitle) && originalKey.getClass() == ownKey.getClass())
                        present = true;
                }
            }
            if (present) return sections;
            ArrayList result = new ArrayList(sections);
            result.add(section);
            return result;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            hookFailedPrivately("menu_row", "Legacy drawer entry unavailable", error);
            return sections;
        }
    }

    /** Puts a HushMessenger copy of the Menu tab's Settings folder row right after it (one title String per row). */
    @SuppressWarnings("unchecked")
    public static void addMenuSettingsEntry(ArrayList list) {
        try {
            if (list == null || list.isEmpty() || menuRowHidden()) return;
            // Messenger builds its QR code row into the same list, so find Settings by its folder key.
            int at = -1;
            for (int i = 0; i < list.size() && at < 0; i++) if (holdsSettingsKey(list.get(i))) at = i;
            if (at < 0) return;
            Object original = list.get(at);
            Object clone = shallowClone(original);
            if (clone == null) return;
            java.lang.reflect.Field title = null;
            for (java.lang.reflect.Field f : original.getClass().getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                if (f.getType() == String.class) {
                    if (title != null) return;
                    title = f;
                } else if (f.getType() == Integer.class) {
                    f.set(clone, null);
                } else if (f.getType().getName().endsWith("HeterogeneousMap")) {
                    // Folder metadata, such as Settings' unseen badge count, belongs to the Settings row.
                    Object metadata = f.get(original);
                    if (metadata == null) continue;
                    Object copy = shallowClone(metadata);
                    if (copy == null) return;
                    for (java.lang.reflect.Field m : copy.getClass().getDeclaredFields()) {
                        if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) || m.getType() != Map.class) continue;
                        m.setAccessible(true);
                        m.set(copy, new java.util.HashMap<>());
                    }
                    f.set(clone, copy);
                } else if (f.getType().getName().endsWith("DrawerFolderKey")) {
                    // Folder keys compare by identity, so a copy keeps this row from acting as Settings.
                    Object key = f.get(original);
                    Object copy = key == null ? null : shallowClone(key);
                    if (copy == null) return;
                    f.set(clone, copy);
                }
            }
            if (title == null) return;
            title.set(clone, "HushMessenger");
            list.add(at + 1, clone);
        } catch (Exception | LinkageError e) {
            hookFailed("menu_row", "addMenuSettingsEntry failed", e);
        }
    }

    private static boolean holdsSettingsKey(Object row) throws IllegalAccessException {
        if (row == null) return false;
        for (java.lang.reflect.Field f : row.getClass().getDeclaredFields()) {
            if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
            f.setAccessible(true);
            Object value = f.get(row);
            if (value != null && value.getClass().getName().endsWith("SettingsFolderKey")) return true;
        }
        return false;
    }

    /** Opens settings for the HushMessenger folder row and returns null; other rows come back unchanged. */
    public static Object drawerFolderClicked(Object item) {
        if (item == null) return null;
        boolean recognized = false;
        Context context = null;
        try {
            boolean titled = false, settingsKey = false;
            for (java.lang.reflect.Field f : item.getClass().getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object value = f.get(item);
                if (value instanceof Context) context = (Context) value;
                else if ("HushMessenger".equals(value)) titled = true;
                // Only the copy of the Settings row carries a Settings folder key with this title.
                else if (value != null && value.getClass().getName().endsWith("SettingsFolderKey")) settingsKey = true;
            }
            if (!titled || !settingsKey || context == null) return item;
            recognized = true;
            HostScreens.open(context, HostScreens.SETTINGS);
            return null;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            hookFailedPrivately("menu_row", "Opening the drawer entry failed", error);
            if (recognized) try {
                showOpenFailed(context);
            } catch (RuntimeException | LinkageError feedbackError) {
                hookFailedPrivately("menu_row", "Drawer entry feedback unavailable", feedbackError);
            }
            // Our independent row has no native dispatcher, including when Android rejects the launch.
            return recognized ? null : item;
        }
    }

    // The menu entry hooks don't ask Pause or safe mode first, on purpose: they're the way back into settings to undo either.
    // Only Hide the Menu row takes them out, and only while the long-press shortcut is a proven way back.
    @SuppressWarnings("unchecked")
    public static java.util.List addMenuDrawerEntry(java.util.List list) {
        try {
            if (list == null || list.size() < 2 || menuRowHidden()) return list;
            for (Object item : list) {
                try {
                    java.lang.reflect.Field f = item.getClass().getDeclaredField("A05");
                    f.setAccessible(true);
                    if ("HushMessenger".equals(f.get(item))) return list;
                } catch (NoSuchFieldException ignored) {}
            }
            Object template = list.get(0);
            Object clone = shallowClone(template);
            if (clone == null) return list;
            java.lang.reflect.Field label = clone.getClass().getDeclaredField("A05");
            if (label.getType() != String.class) return list;
            label.setAccessible(true);
            label.set(clone, "HushMessenger");
            try {
                java.lang.reflect.Field longPress = clone.getClass().getDeclaredField("A03");
                longPress.setAccessible(true);
                longPress.set(clone, null);
            } catch (NoSuchFieldException ignored) {}
            java.util.ArrayList result = new java.util.ArrayList(list);
            result.add(clone);
            return result;
        } catch (Exception | LinkageError e) {
            hookFailed("menu_row", "addMenuDrawerEntry failed", e);
            return list;
        }
    }

    public static void handleMenuItemBound(Object viewHolder) {
        if (viewHolder == null) return;
        try {
            java.lang.reflect.Field textField;
            // The binder serves several holder types. Only the text row has this field; the others aren't failures.
            try { textField = viewHolder.getClass().getDeclaredField("A06"); }
            catch (NoSuchFieldException otherHolder) { return; }
            textField.setAccessible(true);
            Object tv = textField.get(viewHolder);
            if (!(tv instanceof android.widget.TextView)) return;
            CharSequence text = ((android.widget.TextView) tv).getText();
            if (!"HushMessenger".equals(text != null ? text.toString() : null)) return;
            java.lang.reflect.Field viewField = null;
            for (Class<?> c = viewHolder.getClass(); c != null; c = c.getSuperclass()) {
                try { viewField = c.getDeclaredField("A0I"); break; }
                catch (NoSuchFieldException ignored) {}
            }
            if (viewField == null) return;
            viewField.setAccessible(true);
            android.view.View itemView = (android.view.View) viewField.get(viewHolder);
            if (itemView == null) return;
            android.view.View.OnClickListener stock = clickListenerOf(itemView);
            if (stock instanceof MenuRowClick) return;
            itemView.setOnClickListener(new MenuRowClick(stock, (android.widget.TextView) tv));
        } catch (Exception | LinkageError e) {
            hookFailed("menu_row", "handleMenuItemBound failed", e);
        }
    }

    /**
     * Messenger sets a row's listener once, when the holder is created, and reuses the holder for other rows as the menu
     * scrolls. So the row is read at tap time: ours opens settings, any other row gets the listener Messenger set.
     */
    static final class MenuRowClick implements android.view.View.OnClickListener {
        final android.view.View.OnClickListener stock;
        private final android.widget.TextView label;

        MenuRowClick(android.view.View.OnClickListener stock, android.widget.TextView label) {
            this.stock = stock;
            this.label = label;
        }

        @Override public void onClick(android.view.View v) {
            CharSequence text = label.getText();
            if ("HushMessenger".equals(text != null ? text.toString() : null)) {
                try {
                    HostScreens.open(v.getContext(), HostScreens.SETTINGS);
                } catch (RuntimeException e) {
                    hookFailed("menu_row", "Opening settings failed", e);
                }
            } else if (stock != null) {
                stock.onClick(v);
            }
        }
    }

    /**
     * A long press on the Messenger logo at the top of Chats, or on the Menu tab's title, ends here, after Messenger's own
     * handling of that press. The patch calls this just before each title's long press handler returns, with the
     * toolbar's context. Messenger hands the press to a title shortcut plugin that only its internal builds have, so for
     * everyone else it did nothing but vibrate. Like the Menu rows, this doesn't ask Pause or safe mode first: it's a way back into settings to undo
     * either. A launch Android refuses gets the same toasts as the side menu row, pointing at the launcher shortcut.
     * Ignore the logo long press leaves the press to Messenger.
     */
    public static void logoLongPressed(Context context) {
        // Only the switch counts here: a press can come before settings have read what the patch put in.
        SharedPreferences prefs = preferences;
        if (context == null || prefs != null && prefs.getBoolean(HIDE_LOGO_PRESS, false)) return;
        try {
            HostScreens.open(context, HostScreens.SETTINGS);
            String build = patchedBuild(context);
            if (prefs != null && build != null && !logoPressProven(context)) prefs.edit().putString(LOGO_USED, build).apply();
        } catch (RuntimeException | LinkageError error) {
            hookFailed("menu_row", "Opening settings from a tab title failed", error);
            try {
                showOpenFailed(context);
            } catch (RuntimeException | LinkageError feedbackError) {
                hookFailedPrivately("menu_row", "Tab title feedback unavailable", feedbackError);
            }
        }
    }

    /**
     * Android 12 and later show two lines of a toast, so one says settings didn't open and the next names the way in,
     * unless Hide the icon shortcuts took that way away.
     */
    private static void showOpenFailed(Context context) {
        SettingsText words = new SettingsText(context);
        android.widget.Toast.makeText(context, words.get("settings_open_failed"), android.widget.Toast.LENGTH_SHORT).show();
        if (iconShortcutsShown(context))
            android.widget.Toast.makeText(context, words.get("settings_open_instead"), android.widget.Toast.LENGTH_LONG).show();
    }

    private static final java.util.concurrent.atomic.AtomicBoolean MENU_LISTENER_LOGGED = new java.util.concurrent.atomic.AtomicBoolean();

    /** The listener already on [view], read from View's hidden ListenerInfo. Null when there's none or it can't be read. */
    // No public getter exists, and a field that moves only costs the delegation, logged privately once a run since
    // every bound row would hit the same failure.
    @android.annotation.SuppressLint("DiscouragedPrivateApi")
    private static android.view.View.OnClickListener clickListenerOf(android.view.View view) {
        try {
            java.lang.reflect.Field info = android.view.View.class.getDeclaredField("mListenerInfo");
            info.setAccessible(true);
            Object listeners = info.get(view);
            if (listeners == null) return null;
            java.lang.reflect.Field click = listeners.getClass().getDeclaredField("mOnClickListener");
            click.setAccessible(true);
            return (android.view.View.OnClickListener) click.get(listeners);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            if (MENU_LISTENER_LOGGED.compareAndSet(false, true))
                hookFailedPrivately("menu_row", "The menu row's own listener couldn't be read", error);
            return null;
        }
    }

    private static java.lang.reflect.Method allocateMethod;
    private static Object unsafeInstance;

    private static Object shallowClone(Object src) {
        try {
            if (allocateMethod == null) {
                Class<?> u = Class.forName("sun.misc.Unsafe");
                java.lang.reflect.Field f = u.getDeclaredField("theUnsafe");
                f.setAccessible(true);
                unsafeInstance = f.get(null);
                allocateMethod = u.getMethod("allocateInstance", Class.class);
            }
            Object dst = allocateMethod.invoke(unsafeInstance, src.getClass());
            for (Class<?> c = src.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                    f.setAccessible(true);
                    f.set(dst, f.get(src));
                }
            }
            return dst;
        } catch (Exception | LinkageError e) {
            hookFailed("menu_row", "shallowClone failed", e);
            return null;
        }
    }

    private Settings() { }
}
