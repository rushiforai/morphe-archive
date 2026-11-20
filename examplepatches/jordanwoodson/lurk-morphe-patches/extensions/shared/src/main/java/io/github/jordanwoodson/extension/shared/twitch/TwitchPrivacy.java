package io.github.jordanwoodson.extension.shared.twitch;

import android.content.Context;

import java.util.ArrayList;
import java.util.Iterator;

import org.json.JSONObject;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/** Local presentation decisions; never writes or submits the user's consent. */
@SuppressWarnings("unused")
public final class TwitchPrivacy {
    private static boolean initialized;

    private TwitchPrivacy() { }

    /** Providers run before Application.onCreate; reuse one early preference initialization. */
    public static synchronized void initSettingsOnce(Context context) {
        if (!initialized && context != null) {
            Context application = context.getApplicationContext();
            Settings.init(application != null ? application : context);
            initialized = true;
        }
    }

    public static boolean showCookieNotice(boolean requested) {
        return requested && !Settings.isEnabled("block_cookie_notice");
    }

    public static boolean allowAnalyticsCollection(boolean requested) {
        return requested && !Settings.isEnabled("disable_analytics");
    }

    /** Null restores the SDK default; suppression must override that request too. */
    public static Boolean allowAnalyticsCollectionBoxed(Boolean requested) {
        return Settings.isEnabled("disable_analytics") ? Boolean.FALSE : requested;
    }

    public static boolean disableBranchTracking(boolean requested) {
        return requested || Settings.isEnabled("disable_analytics");
    }

    /**
     * Injection point, while Disable analytics is on: whether a Spade event still goes out. Only minute-watched
     * does, and only while Auto-claim channel points or Auto-claim Drops is on: Twitch credits watch time from it,
     * and without that credit a channel never offers channel points or the bonus chest to claim (issue 69), and
     * time-based Drops never progress.
     */
    public static boolean keepSpadeEvent(String event) {
        return "minute-watched".equals(event) &&
                (Settings.isEnabled("chat_auto_claim") || Settings.isEnabled("drops_auto_claim"));
    }

    /**
     * Injection point, while Disable analytics is on: a batch of Spade events about to be uploaded. Drops every
     * event but the kept ones in place (the queue is cleared after the upload anyway); true if any is left to send.
     */
    public static boolean keepSpadeBatch(ArrayList<?> events) {
        if (events == null) return false;
        Iterator<?> it = events.iterator();
        while (it.hasNext()) {
            Object event = it.next();
            if (!(event instanceof JSONObject) || !keepSpadeEvent(((JSONObject) event).optString("event"))) it.remove();
        }
        if (events.isEmpty()) return false;
        Logger.d("analytics: sent " + events.size() + " minute-watched event(s) for channel points and Drops");
        return true;
    }
}
