package app.noam.extension.chesscom.discord;

import android.app.Activity;
import android.app.Application;
import android.os.Handler;
import android.os.Looper;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Locale;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;

/**
 * What the rest of the app talks to: starts and stops the Discord session and names the screen that
 * is open. The activity comes from the app's own screen names, so nothing here depends on
 * chess.com's internals.
 */
public final class DiscordPresence {
    /** Discord takes about five presence updates in twenty seconds; a game needs far fewer. */
    private static final int WINDOW_MS = 20_000;
    private static final int MAX_IN_WINDOW = 5;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Deque<Long> SENT = new ArrayDeque<>();
    private static final Runnable DELAYED = () -> {
        scheduled = false;
        send();
    };

    private static Application application;
    private static DiscordGateway gateway;
    private static String details = "";
    private static long sessionStart;
    private static boolean scheduled;

    private DiscordPresence() {}

    /** Called once from MainApplication.onCreate. */
    public static void install(Application app) {
        if (application != null || app == null) return;
        application = app;
        sessionStart = System.currentTimeMillis();
        try {
            refresh();
        } catch (Throwable failure) {
            Utils.logError("Discord could not start", failure);
        }
    }

    /** Named by the activity tracker, when a screen is opened. */
    public static void onActivityResumed(Activity activity) {
        if (activity == null || !active()) return;
        String text = detailsFor(activity.getClass().getName());
        if (text.equals(details)) return;
        details = text;
        send();
    }

    /** Re-reads the settings: connected, switched on, or neither. Safe to call any time. */
    public static void refresh() {
        if (application == null) return;
        if (!active()) {
            stop();
            return;
        }
        Activity top = Utils.topActivity();
        if (top != null) details = detailsFor(top.getClass().getName());
        else if (details.isEmpty()) details = "Browsing chess.com";
        DiscordGateway current = gateway;
        if (current == null || !current.isRunning()) {
            sessionStart = System.currentTimeMillis();
            gateway = new DiscordGateway(application);
            gateway.start();
        }
        send();
    }

    /** "Connected", "Connecting", "Reconnecting" or "Not connected". */
    public static String state() {
        DiscordGateway current = gateway;
        if (!active() || current == null) return "Not connected";
        return current.state();
    }

    /** The Discord account's own name, when Discord told us. */
    public static String userName() {
        DiscordGateway current = gateway;
        String name = current == null ? "" : current.userName();
        return name.isEmpty() ? DiscordAuth.userName() : name;
    }

    private static void stop() {
        DiscordGateway current = gateway;
        gateway = null;
        details = "";
        if (current != null) current.stop();
        synchronized (SENT) {
            SENT.clear();
        }
        scheduled = false;
        MAIN.removeCallbacks(DELAYED);
    }

    private static boolean active() {
        return application != null
            && Features.discordPatched()
            && Features.isEnabled(Features.DISCORD)
            && DiscordApp.configured(application)
            && DiscordAuth.linked();
    }

    private static void send() {
        DiscordGateway current = gateway;
        JSONObject presence = presence();
        if (current == null || presence == null) return;
        if (!current.isReady()) {
            // Kept by the gateway and sent as soon as Discord accepts the session.
            current.sendPresence(presence);
            return;
        }
        long now = System.currentTimeMillis();
        synchronized (SENT) {
            while (!SENT.isEmpty() && now - SENT.peekFirst() >= WINDOW_MS) SENT.pollFirst();
            if (SENT.size() >= MAX_IN_WINDOW) {
                if (!scheduled) {
                    scheduled = true;
                    long when = SENT.peekFirst() + WINDOW_MS - now + 100;
                    MAIN.postDelayed(DELAYED, Math.max(100, when));
                }
                return;
            }
            SENT.addLast(now);
        }
        current.sendPresence(presence);
    }

    private static JSONObject presence() {
        try {
            JSONObject activity = new JSONObject();
            activity.put("name", DiscordApp.NAME);
            activity.put("type", 0);
            if (!details.isEmpty()) activity.put("details", details);
            activity.put("application_id", DiscordApp.clientId(application));
            if (sessionStart > 0) {
                JSONObject timestamps = new JSONObject();
                timestamps.put("start", sessionStart);
                activity.put("timestamps", timestamps);
            }
            JSONArray activities = new JSONArray();
            activities.put(activity);

            JSONObject payload = new JSONObject();
            payload.put("activities", activities);
            payload.put("afk", false);
            payload.put("since", JSONObject.NULL);
            payload.put("status", DiscordSettings.status());
            return payload;
        } catch (Throwable failure) {
            Utils.logError("Discord presence could not be built", failure);
            return null;
        }
    }

    /** What friends read, from the name of the screen that is open. */
    private static String detailsFor(String className) {
        String name = className == null ? "" : className.toLowerCase(Locale.ROOT);
        if (name.contains("noam.extension.chesscom")) return "Setting up Quwi's Patches";
        if (name.contains("review") || name.contains("analysis")) return "Analyzing a game";
        if (name.contains("puzzle")) return "Solving puzzles";
        if (name.contains("lesson") || name.contains("course")) return "In a lesson";
        if (name.contains("tournament")) return "In a tournament";
        if (name.contains("game") && !name.contains("games")) return "Playing a game";
        if (name.contains("news") || name.contains("article") || name.contains("video")) {
            return "Reading chess news";
        }
        return "Browsing chess.com";
    }
}
