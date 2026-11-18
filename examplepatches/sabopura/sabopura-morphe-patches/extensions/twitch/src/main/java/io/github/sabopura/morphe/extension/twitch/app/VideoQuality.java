package io.github.sabopura.morphe.extension.twitch.app;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/** The rendition playback starts at until a player quality is saved. Saved choices are Twitch's own. */
@SuppressWarnings("unused")
public final class VideoQuality {
    public static final String KEY = "default_quality", KEY_METERED = "default_quality_metered";
    public static final String AUTO = "auto", SOURCE = "source";
    /** Highest to lowest; the rank of a choice is its place here. */
    public static final List<String> CHOICES =
            Arrays.asList(AUTO, SOURCE, "1080p60", "1080p", "720p60", "720p", "480p", "360p", "160p");
    private static final String SOURCE_SUFFIX = " (source)";

    private VideoQuality() {
    }

    /**
     * The rendition to start at, or null for Twitch's own default. On a metered network the metered
     * choice replaces the normal one only when it is lower.
     */
    static String chosen(String normal, String metered, boolean isMetered) {
        String choice = AUTO.equals(normal) ? null : normal;
        if (isMetered && !AUTO.equals(metered) && lowerThan(metered, normal)) choice = metered;
        return CHOICES.contains(choice) ? choice : null;
    }

    private static boolean lowerThan(String a, String b) {
        int rankA = CHOICES.indexOf(a), rankB = CHOICES.indexOf(b);
        return rankA >= 0 && (rankB < 0 || rankA > rankB);
    }

    private static String chosen() {
        if (!Features.has(Feature.DEFAULT_QUALITY)) return null;
        SharedPreferences prefs = ChatSettings.preferences();
        if (prefs == null) return null;
        return chosen(prefs.getString(KEY, AUTO), prefs.getString(KEY_METERED, AUTO), metered());
    }

    private static boolean metered() {
        Context context = AppHooks.app();
        if (context == null) return false;
        ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        return manager != null && manager.isActiveNetworkMetered();
    }

    /** Injection point: the fallback Twitch restores video with after audio-only. */
    public static String restoreDefault(String original) {
        try {
            String quality = chosen();
            return quality == null ? original : quality;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.quality-restore", e);
            return original;
        }
    }

    /** Injection point: the fallback of Twitch's saved-quality lookup, used only when nothing is saved. */
    public static String savedDefault(String suffix, String original) {
        try {
            String quality = chosen();
            if (quality == null) return original;
            return "_clip".equals(suffix) ? clipName(quality) : quality;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.quality-saved", e);
            return original;
        }
    }

    /** Clips use ClipQuality's names, without frame rates. */
    static String clipName(String quality) {
        if (SOURCE.equals(quality)) return "source";
        if (quality.equals("160p")) return "240";
        int p = quality.indexOf('p');
        return p > 0 ? quality.substring(0, p) : quality;
    }

    /**
     * Injection point: the player's select-by-name, which matches names exactly. Twitch names the
     * source rendition like "1080p60 (source)", so the Source choice and a choice equal to the source
     * become that full name. Requests made before the qualities load are retried by Twitch.
     */
    public static String playerName(String requested, Object player) {
        try {
            if (requested == null || player == null || chosen() == null) return requested;
            ClassLoader loader = player.getClass().getClassLoader();
            Method qualities = Class.forName("com.amazonaws.ivs.player.Player", false, loader).getMethod("getQualities");
            Method getName = Class.forName("com.amazonaws.ivs.player.Quality", false, loader).getMethod("getName");
            String source = null;
            for (Object quality : (Iterable<?>) qualities.invoke(player)) {
                String candidate = quality == null ? null : (String) getName.invoke(quality);
                if (candidate == null) continue;
                if (candidate.equalsIgnoreCase(requested)) return requested;
                if (candidate.toLowerCase(Locale.ROOT).endsWith(SOURCE_SUFFIX)) source = candidate;
            }
            if (source == null) return requested;
            String plain = source.substring(0, source.length() - SOURCE_SUFFIX.length());
            return SOURCE.equals(requested) || plain.equalsIgnoreCase(requested) ? source : requested;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError e) {
            Diagnostics.note("app.quality-name", e);
            return requested;
        }
    }
}
