package io.github.sabopura.morphe.extension.twitch.app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/** Small hooks of the app-wide patches, each gated by its feature and in-app setting. */
@SuppressWarnings("unused")
public final class AppHooks {
    public static final String KEY_UPDATE_PROMPTS = "disable_update_prompts";
    public static final String KEY_FIX_STUCK_START = "fix_stuck_start";
    public static final String KEY_STARTUP_TAB = "startup_tab";
    public static final String KEY_NORMAL_LATENCY = "normal_latency";
    public static final String KEY_OFFICIAL_STATS = "official_stats";
    public static final String KEY_BACKGROUND_AUDIO = "background_audio";
    public static final String KEY_HIDE_UPSELLS = "hide_upsells";
    public static final String KEY_CLEAN_SHARE_LINKS = "clean_share_links";
    public static final String KEY_WATCH_SIGNED_OUT = "watch_signed_out";

    private static final int UPDATE_NOT_AVAILABLE = 1;
    private static final long STUCK_START_MS = 5000;
    private static final Set<Activity> ROUTED = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private static boolean feedTabDecided;
    private static volatile Context app;

    private AppHooks() {
    }

    public static void initialize(Context context) {
        app = context.getApplicationContext();
    }

    static Context app() {
        return app;
    }

    static boolean on(Feature feature, String key, boolean fallback) {
        if (!Features.has(feature)) return false;
        SharedPreferences prefs = ChatSettings.preferences();
        return prefs != null && prefs.getBoolean(key, fallback);
    }

    /** Injection point: Twitch deciding between its signed-out mode and the login screen. */
    public static boolean watchSignedOut() {
        try {
            // On by default: the login screen this replaces is the only screen a signed-out user can reach,
            // so the switch could never be turned on from inside the app.
            return on(Feature.WATCH_SIGNED_OUT, KEY_WATCH_SIGNED_OUT, true);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.watch-signed-out", e);
            return false;
        }
    }

    static boolean on(Feature feature, String key) {
        return on(feature, key, false);
    }

    private static String choice(Feature feature, String key, String fallback) {
        if (!Features.has(feature)) return fallback;
        SharedPreferences prefs = ChatSettings.preferences();
        return prefs == null ? fallback : prefs.getString(key, fallback);
    }

    /** Injection point: Play's update check result. */
    public static int updateAvailability(int original) {
        try {
            return on(Feature.DISABLE_UPDATE_PROMPTS, KEY_UPDATE_PROMPTS) ? UPDATE_NOT_AVAILABLE : original;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.update-prompts", e);
            return original;
        }
    }

    /** Injection point: the start screen routing. False skips a route that already ran for this screen. */
    public static boolean firstRoute(Activity activity) {
        try {
            return !on(Feature.FIX_STUCK_START, KEY_FIX_STUCK_START, true) || ROUTED.add(activity);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.stuck-start-route", e);
            return true;
        }
    }

    /** Injection point: the start screen's onCreate. {@code route} names its routing method. */
    public static void watchStart(Activity activity, String route) {
        try {
            if (!on(Feature.FIX_STUCK_START, KEY_FIX_STUCK_START, true)) return;
            new Handler(Looper.getMainLooper()).postDelayed(() -> routeNow(activity, route), STUCK_START_MS);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.stuck-start-watch", e);
        }
    }

    private static void routeNow(Activity activity, String route) {
        try {
            if (activity.isFinishing() || activity.isDestroyed() || ROUTED.contains(activity)) return;
            Method method = activity.getClass().getDeclaredMethod(route);
            method.setAccessible(true);
            method.invoke(activity);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError e) {
            Diagnostics.note("app.stuck-start-reroute", e);
        }
    }

    /**
     * Injection point: the launch destination. Only a plain launch (Default) is replaced, by the
     * chosen entry of the same enum, so links and notifications keep their own target.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Enum<?> startDestination(Enum<?> destination) {
        try {
            if (destination == null || !"Default".equals(destination.name())) return destination;
            String tab = choice(Feature.STARTUP_TAB, KEY_STARTUP_TAB, "");
            String entry = tab.equals("browse") ? "Browse" : tab.equals("following") ? "Following"
                    : tab.equals("activity") ? "NotificationCenter" : null;
            return entry == null ? destination : Enum.valueOf((Class) destination.getDeclaringClass(), entry);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.startup-tab", e);
            return destination;
        }
    }

    /**
     * Injection point: the React Native Home feed's first tab. Signed-in Home is that feed, which opens
     * on Live even for the Following destination, so the first plain launch asks for Following there.
     */
    public static String feedTab(boolean fromLink, String benchmarkId, String benchmarkTrial, String subfeedTab) {
        try {
            if (feedTabDecided) return subfeedTab;
            feedTabDecided = true;
            if (fromLink || !"following".equals(choice(Feature.STARTUP_TAB, KEY_STARTUP_TAB, ""))) return subfeedTab;
            return subfeedTab == null || "live".equals(subfeedTab) ? "following" : subfeedTab;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.startup-feed-tab", e);
            return subfeedTab;
        }
    }

    /** Injection point: Twitch asking the player for low-latency mode. */
    public static boolean lowLatency(boolean original) {
        try {
            return original && !on(Feature.NORMAL_LATENCY, KEY_NORMAL_LATENCY);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.low-latency", e);
            return original;
        }
    }

    /** Injection point: before a player loads, because Twitch's native players never set the mode. */
    public static void beforeLoad(Object player) {
        try {
            if (on(Feature.NORMAL_LATENCY, KEY_NORMAL_LATENCY))
                player.getClass().getMethod("setLiveLowLatencyEnabled", boolean.class).invoke(player, false);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError e) {
            Diagnostics.note("app.low-latency-load", e);
        }
    }

    /** Injection point: the flag that offers Twitch's staff-only video stats button. */
    public static boolean statsEnabled(boolean original) {
        try {
            return original || on(Feature.OFFICIAL_STATS, KEY_OFFICIAL_STATS);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.official-stats", e);
            return original;
        }
    }

    /** Injection point: replaces Intent.putExtra(String, String) where Twitch builds share text. */
    public static Intent putShareExtra(Intent intent, String key, String value) {
        return intent.putExtra(key, Intent.EXTRA_TEXT.equals(key) ? cleanLinks(value) : value);
    }

    /** Injection point: text about to go on the clipboard. */
    public static CharSequence cleanClipboard(CharSequence text) {
        if (text == null) return null;
        String original = text.toString();
        String cleaned = cleanLinks(original);
        return cleaned.equals(original) ? text : cleaned;
    }

    private static String cleanLinks(String text) {
        try {
            return on(Feature.CLEAN_SHARE_LINKS, KEY_CLEAN_SHARE_LINKS) ? ShareLinks.clean(text) : text;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.clean-share-links", e);
            return text;
        }
    }

    /** Injection point: a promotion about to show. True skips it. */
    public static boolean hideUpsells() {
        try {
            return on(Feature.HIDE_UPSELLS, KEY_HIDE_UPSELLS);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.hide-upsells", e);
            return false;
        }
    }

    /** Injection point: whether a Turbo tab or startup offer may show. */
    public static boolean keepTurbo(boolean original) {
        return original && !hideUpsells();
    }

    /** Injection point: Twitch's fallback when no background audio choice is saved. */
    public static String backgroundAudioDefault(String original) {
        try {
            String choice = choice(Feature.BACKGROUND_AUDIO, KEY_BACKGROUND_AUDIO, original);
            return choice == null || choice.isEmpty() ? original : choice;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.background-audio", e);
            return original;
        }
    }
}
