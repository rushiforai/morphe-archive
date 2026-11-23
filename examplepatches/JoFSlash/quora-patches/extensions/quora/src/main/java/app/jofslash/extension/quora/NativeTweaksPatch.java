package app.jofslash.extension.quora;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;
import android.webkit.WebView;

import org.json.JSONObject;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

@SuppressWarnings("unused")
public final class NativeTweaksPatch {

    private static final String TAG = "JoFSlashPatches";


    /**
     * Injection point: start of the handler Quora's pages call to ask for the notification permission.
     *
     * @return True to skip the system prompt. False when the permission is already granted,
     * so Quora's own handler reports it as granted.
     */
    public static boolean skipNotificationPrompt(Context context) {
        if (Build.VERSION.SDK_INT < 33 || context == null) return false;
        try {
            return context.checkSelfPermission("android.permission.POST_NOTIFICATIONS")
                    != PackageManager.PERMISSION_GRANTED;
        } catch (Exception ex) {
            Log.e(TAG, "Failed to check notification permission", ex);
            return false;
        }
    }

    /**
     * The answer Quora's page gets when the prompt is skipped: the permission was not granted.
     */
    public static JSONObject notificationPromptResult() {
        JSONObject result = new JSONObject();
        try {
            result.put("success", false);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to build notification result", ex);
        }
        return result;
    }

    /**
     * Injection point: start of QMessageBroadcaster.handle.
     *
     * @return True if the message from the page is the one named.
     */
    public static boolean isMessage(Object message, String name) {
        return message instanceof Enum && name.equals(((Enum<?>) message).name());
    }

    /**
     * Injection point: start of QMessageBroadcaster.handle.
     *
     * @return True for the page's own "Let Quora send you notifications?" alert (a SHOW_ALERT message
     * whose title mentions notifications), which comes before the system permission prompt.
     */
    public static boolean isNotificationAlert(Object message, JSONObject data) {
        if (!isMessage(message, "SHOW_ALERT") || data == null) return false;
        String title = data.optString("title", "") + " " + data.optString("message", "");
        return title.toLowerCase().contains("notification");
    }

    /**
     * Injection point: start of QMessageBroadcaster.handle.
     *
     * @return True if the message is the one named and the patch with this key is switched on.
     */
    public static boolean isBlockedMessage(Object message, String name, String key) {
        return isMessage(message, name) && PatchSettings.on(key);
    }

    private static final String[] TAB_LABELS = {"Following", "Answer", "Spaces", "Notifications"};
    private static final String[] TAB_NAMES = {"FOLLOWING", "ANSWER", "SPACES", "NOTIFS"};

    /** The tabs picked when patching, or null without the Hide tabs patch. */
    private static volatile String patchedHiddenTabs;

    /**
     * Injection point: start of QTabBar.createTabList.
     *
     * @param names Comma separated QTab names, such as "SPACES,FOLLOWING".
     */
    public static void setHiddenTabs(String names) {
        patchedHiddenTabs = names == null ? "" : names;
    }

    /** The tabs to hide: the ones picked in the settings, or else the ones picked when patching. */
    private static Set<String> hiddenTabs() {
        Set<String> set = new HashSet<>();
        String patched = patchedHiddenTabs;
        if (patched == null) return set;
        String names = PatchSettings.choice("hideTabs", "hiddenTabs", "Tabs to hide", patched,
                TAB_LABELS, TAB_NAMES, true);
        for (String name : (names == null ? "" : names).split(",")) {
            String trimmed = name.trim();
            // The first tab, Home, always stays: the app expects at least one tab.
            if (!trimmed.isEmpty() && !trimmed.equals("FEED")) set.add(trimmed);
        }
        return set;
    }

    /**
     * Injection point: QTabBar.createTabList, after the last tab is added.
     */
    public static void removeHiddenTabs(List<?> tabs) {
        if (tabs == null || !PatchSettings.on("hideTabs")) return;
        try {
            Set<String> hidden = hiddenTabs();
            Iterator<?> it = tabs.iterator();
            while (it.hasNext()) {
                Object tab = it.next();
                if (tab instanceof Enum && hidden.contains(((Enum<?>) tab).name())) it.remove();
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to remove tabs", ex);
        }
    }

    /**
     * Injection point: start of QTabBar.setupTabs.
     *
     * @param current The tab the app is about to open on.
     * @param patched The QTab name picked when patching.
     * @return The QTab to open on.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Object startTab(Object current, String patched) {
        if (!(current instanceof Enum) || patched == null) return current;
        String name = PatchSettings.choice("startTab", "startTabName", "Tab to open on", patched,
                TAB_LABELS, TAB_NAMES, false);
        if (!PatchSettings.on("startTab")) return current;
        try {
            if (PatchSettings.on("hideTabs") && hiddenTabs().contains(name)) return current;
            return Enum.valueOf((Class) ((Enum<?>) current).getDeclaringClass(), name);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to set start tab " + name, ex);
            return current;
        }
    }

    /**
     * Injection point: start of FCMIntentService.updateNotifications.
     *
     * @return True for digests and promotions: push_type 2 (QNotification.PROMO_PUSH_TYPE)
     * or the digest channel.
     */
    public static boolean isPromotionalNotification(Map<?, ?> extras) {
        if (extras == null || !PatchSettings.on("blockPromotionalNotifications")) return false;
        try {
            Object type = extras.get("push_type");
            Object channel = extras.get("channel");
            return "2".equals(type == null ? null : String.valueOf(type).trim())
                    || "channel_digest".equals(channel == null ? null : String.valueOf(channel).trim());
        } catch (Exception ex) {
            Log.e(TAG, "Failed to check notification", ex);
            return false;
        }
    }

    /**
     * Injection point: Quora.onCreate, right after Branch.getAutoInstance. Branch then stops
     * collecting and sending identifiers; links still open.
     */
    public static void disableBranchTracking() {
        try {
            Class<?> branch = Class.forName("io.branch.referral.Branch");
            Object instance = branch.getMethod("getInstance").invoke(null);
            if (instance != null) branch.getMethod("disableTracking", boolean.class).invoke(instance, true);
        } catch (Throwable ex) {
            Log.e(TAG, "Failed to turn off Branch tracking", ex);
        }
    }

    /**
     * Injection point: start of QSwipeRefreshLayout.setEnabled.
     */
    public static boolean pullToRefreshEnabled(boolean enabled) {
        return enabled && !PatchSettings.on("disablePullToRefresh");
    }

    /**
     * Injection point: start of SwitcherViewPager.shouldPage.
     */
    public static boolean swipeBetweenFeedsDisabled() {
        return PatchSettings.on("disableSwipeBetweenFeeds");
    }

    /**
     * Injection point: start of AppRefreshHelper.Companion.onResume. After some time in the
     * background Quora closes open answers and reloads the feed; this skips that.
     */
    public static boolean keepPlaceOnReturn() {
        return PatchSettings.on("keepPlaceOnReturn");
    }

    /**
     * Injection point: start of QNavBar.getShouldShowAskButton.
     */
    public static boolean hideAskButton() {
        return PatchSettings.on("hideAskButton");
    }

    /**
     * Injection point: QWebViewController.initWebView, the setMediaPlaybackRequiresUserGesture argument.
     */
    public static boolean requireGestureForMedia(boolean requested) {
        return PatchSettings.on("disableVideoAutoplay") || requested;
    }

    /**
     * Injection point: start of QWebViewController.initWebView.
     */
    public static void applyTextZoom(WebView webView, int percent) {
        if (webView == null || percent <= 0) return;
        try {
            percent = Integer.parseInt(PatchSettings.choice("textSize", "textSizePercent", "Size",
                    String.valueOf(percent),
                    new String[]{"85%", "90%", "100%", "110%", "115%", "125%", "150%"},
                    new String[]{"85", "90", "100", "110", "115", "125", "150"}, false));
        } catch (NumberFormatException ignored) {
        }
        if (!PatchSettings.on("textSize")) return;
        try {
            webView.getSettings().setTextZoom(percent);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to set text size", ex);
        }
    }

    /**
     * Fix device theme patch. A new install has no stored choice, so treat it as Auto.
     */
    public static Boolean useDeviceThemeOrDefault(Boolean stored) {
        return stored != null ? stored : Boolean.TRUE;
    }
}
