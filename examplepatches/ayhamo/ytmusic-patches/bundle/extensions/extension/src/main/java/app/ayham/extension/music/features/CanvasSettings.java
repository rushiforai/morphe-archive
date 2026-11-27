package app.ayham.extension.music.features;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

/**
 * The canvas settings (canvas.md §13): the sources in the listener's order, each on or off under
 * its master switch (Canvas: the music video and Spotify; Animated covers: Apple), off on mobile
 * data, Apple's quality, the music video's quality and mode. Stored as Metrolist stores them
 * (AnimatedCoverSelection.kt), with our ids.
 */
public final class CanvasSettings {
    public static final String VIDEO = "video", SPOTIFY = "spotify", APPLE = "apple";
    public static final List<String> DEFAULT = Collections.unmodifiableList(Arrays.asList(VIDEO, SPOTIFY, APPLE));
    public static final String NONE = "NONE";

    /** Morphe's settings keys. */
    public static final String KEY_ORDER = "ayham_canvas_order", KEY_ON = "ayham_canvas_on", KEY_MOBILE = "ayham_canvas_mobile",
            KEY_APPLE_QUALITY = "ayham_canvas_apple_quality", KEY_YT_QUALITY = "ayham_canvas_yt_quality", KEY_YT_MODE = "ayham_canvas_yt_mode";

    private CanvasSettings() {
    }

    // ---- rule 3: how the lists are stored and read

    /** The order: unknown names dropped, a repeat counts once, the missing ones follow in the default order. */
    public static List<String> parseOrder(String stored) {
        List<String> out = new ArrayList<>();
        if (stored != null) for (String s : stored.split(",")) {
            String n = s.trim().toLowerCase(Locale.ROOT);
            if (DEFAULT.contains(n) && !out.contains(n)) out.add(n);
        }
        for (String d : DEFAULT) if (!out.contains(d)) out.add(d);
        return out;
    }

    /** The sources on, in the default order: empty is all on, NONE none. */
    public static List<String> parseEnabled(String stored) {
        if (stored == null || stored.trim().isEmpty()) return new ArrayList<>(DEFAULT);
        List<String> named = new ArrayList<>();
        for (String s : stored.split(",")) named.add(s.trim().toLowerCase(Locale.ROOT));
        List<String> out = new ArrayList<>();
        for (String d : DEFAULT) if (named.contains(d)) out.add(d);
        return out;
    }

    /** The sources on as stored: all off is NONE, never empty. */
    public static String storeEnabled(Collection<String> on) {
        List<String> out = new ArrayList<>();
        for (String d : DEFAULT) if (on.contains(d)) out.add(d);
        return out.isEmpty() ? NONE : String.join(",", out);
    }

    // ---- rule 5: Apple's variant

    /**
     * The variant ({width, height, bandwidth}) with the most pixels whose shorter side is at most
     * [cap] (null: Original, no cap), ties the higher bandwidth; none fitting, the fewest pixels.
     * -1 for none.
     */
    public static int pickVariant(long[][] variants, Integer cap) {
        int best = -1, smallest = -1;
        for (int i = 0; i < variants.length; i++) {
            long[] v = variants[i];
            long px = v[0] * v[1];
            if (smallest < 0 || px < pixels(variants[smallest]) || (px == pixels(variants[smallest]) && v[2] > variants[smallest][2])) smallest = i;
            if (cap != null && Math.min(v[0], v[1]) > cap) continue;
            if (best < 0 || px > pixels(variants[best]) || (px == pixels(variants[best]) && v[2] > variants[best][2])) best = i;
        }
        return best >= 0 ? best : smallest;
    }

    private static long pixels(long[] v) {
        return v[0] * v[1];
    }

    // ---- the settings as the features read them (Features.props)

    static List<String> order(Properties p) {
        return parseOrder(p.getProperty("canvasOrder", ""));
    }

    /** Rule 1: a source is looked up when it is on and so is its master switch. */
    static boolean on(Properties p, String source) {
        if (!parseEnabled(p.getProperty("canvasOn", "")).contains(source)) return false;
        return APPLE.equals(source) ? "1".equals(p.getProperty("canvasApple")) : !"0".equals(p.getProperty("canvasSpotify"));
    }

    /** Either master switch on: the canvas view runs. */
    static boolean anyMaster(Properties p) {
        return "1".equals(p.getProperty("canvas")) || !"0".equals(p.getProperty("canvasSpotify"));
    }

    /** Rule 5: the shorter-side cap for Apple's clip (360, 720, 1080), null for Original. */
    static Integer appleCap(Properties p) {
        String q = p.getProperty("canvasAppleQuality", "720");
        if ("orig".equals(q)) return null;
        try {
            return Integer.parseInt(q);
        } catch (NumberFormatException e) {
            return 720;
        }
    }

    /** Rule 6: the music video's height (2160 .. 480), 0 for Auto (the art's size decides). */
    static int ytHeight(Properties p) {
        String q = p.getProperty("canvasYtQuality", "480");
        if ("auto".equals(q)) return 0;
        try {
            return Integer.parseInt(q);
        } catch (NumberFormatException e) {
            return 480;
        }
    }

    /** Rule 7: Full video plays the whole music video, muted; else Clips. */
    static boolean fullVideo(Properties p) {
        return "full".equals(p.getProperty("canvasYtMode"));
    }

    /** Rule 4: no canvas while on mobile data, when the listener asked. */
    static boolean blockedByMobile(Context c, Properties p) {
        if (!"1".equals(p.getProperty("canvasMobile")) || c == null) return false;
        try {
            ConnectivityManager cm = (ConnectivityManager) c.getSystemService(Context.CONNECTIVITY_SERVICE);
            NetworkCapabilities nc = cm == null ? null : cm.getNetworkCapabilities(cm.getActiveNetwork());
            return nc != null && nc.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) && !nc.hasTransport(NetworkCapabilities.TRANSPORT_WIFI);
        } catch (Throwable t) {
            return false;
        }
    }

    /** Everything rule 10 names: a change forgets the "failed" marks and looks the song up again. */
    static String signature(Properties p) {
        StringBuilder b = new StringBuilder();
        for (String k : new String[]{"canvas", "canvasSpotify", "canvasOrder", "canvasOn", "canvasAppleQuality", "canvasYtQuality", "canvasYtMode"})
            b.append(p.getProperty(k, "")).append('|');
        return b.toString();
    }

    /** The suffix a non-default quality or mode adds to a cache key (rule 5, 6: part of the key). */
    static String appleKeySuffix(Properties p) {
        Integer cap = appleCap(p);
        return cap != null && cap == 720 ? "" : "|q" + (cap == null ? "orig" : cap);
    }

    static String videoKeySuffix(Properties p) {
        int h = ytHeight(p);
        return (h == 480 ? "" : "|q" + h) + (fullVideo(p) ? "|full" : "");
    }

    static String label(String source) {
        switch (source) {
            case VIDEO:
                return "Music video loop";
            case SPOTIFY:
                return "Spotify canvas";
            default:
                return "Apple animated cover";
        }
    }
}
