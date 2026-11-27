package app.ayham.extension.music.addons;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.List;

/**
 * The Addons settings (Fork settings > Addons): the switch, the user's addon links in their order
 * (the first one is asked first), and the length slack. Kept in Morphe's prefs file, the app's
 * private storage; links carry the user's tokens, so they are only ever logged redacted.
 */
public final class AddonSettings {
    public static final String KEY_ON = "ayham_addons", KEY_LINKS = "ayham_addon_links", KEY_SLACK = "ayham_addon_slack",
            KEY_ATMOS = "ayham_addon_atmos", KEY_MOBILE = "ayham_addon_mobile";
    private static volatile Context ctx;

    private AddonSettings() {
    }

    public static void init(Context c) {
        if (c == null) return;
        ctx = c.getApplicationContext();
        importTestLinks(ctx);
    }

    /**
     * Debug only (spike prop addonLinksFile=1): links from addons.txt in the app's external files
     * folder go into the settings and the file is deleted, so test links never need typing.
     */
    private static void importTestLinks(Context c) {
        try {
            if (!"1".equals(app.ayham.extension.music.features.Features.prop("addonLinksFile"))) return;
            java.io.File f = new java.io.File(c.getExternalFilesDir(null), "addons.txt");
            if (!f.exists()) return;
            List<String> l = new ArrayList<>();
            for (String s : new String(java.nio.file.Files.readAllBytes(f.toPath()), java.nio.charset.StandardCharsets.UTF_8).split("\n")) {
                if (!s.trim().isEmpty() && problem(s.trim()) == null) l.add(s.trim());
            }
            setLinks(c, l);
            //noinspection ResultOfMethodCallIgnored
            f.delete();
            android.util.Log.i("AyhamAddons", l.size() + " test links imported, file deleted");
        } catch (Throwable t) {
            android.util.Log.w("AyhamAddons", "test links not imported: " + t);
        }
    }

    static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("morphe_prefs", Context.MODE_PRIVATE);
    }

    /** On, with at least one link, and not held off by mobile data (the "Off on mobile data" switch). */
    public static boolean on() {
        Context c = ctx;
        return c != null && prefs(c).getBoolean(KEY_ON, false) && !links(c).isEmpty() && !offForMobile(c);
    }

    private static volatile long mobileReadAt;
    private static volatile boolean mobileWas;

    /**
     * The switch is on and the phone is on mobile data (cellular without Wi-Fi), as canvas.md §13
     * rule 4 does for the canvas: the song stays on YouTube's audio, no addon is asked. Downloads
     * aren't affected. Read at most every 2 s (this is asked from the mix's control loop).
     */
    static boolean offForMobile(Context c) {
        if (!prefs(c).getBoolean(KEY_MOBILE, false)) return false;
        long now = android.os.SystemClock.uptimeMillis();
        if (now - mobileReadAt < 2000) return mobileWas;
        boolean mobile = false;
        try {
            android.net.ConnectivityManager cm = (android.net.ConnectivityManager) c.getSystemService(Context.CONNECTIVITY_SERVICE);
            android.net.NetworkCapabilities nc = cm == null ? null : cm.getNetworkCapabilities(cm.getActiveNetwork());
            mobile = nc != null && nc.hasTransport(android.net.NetworkCapabilities.TRANSPORT_CELLULAR)
                    && !nc.hasTransport(android.net.NetworkCapabilities.TRANSPORT_WIFI);
        } catch (Throwable ignored) {
        }
        if (mobile != mobileWas || mobileReadAt == 0) android.util.Log.i("AyhamAddons", mobile ? "on mobile data: addons off (the setting)" : "not on mobile data: addons on");
        mobileWas = mobile;
        mobileReadAt = now;
        return mobile;
    }

    /**
     * The "Dolby Atmos" switch (off by default), and only on a phone with an Atmos decoder: addon
     * rows in Atmos are asked for and preferred; off, stereo only (protocol.md §1, §3).
     */
    public static boolean atmos() {
        Context c = ctx;
        return on() && atmosSwitch(c);
    }

    /** The switch alone (downloads need links, not playback on): set, on a phone with an Atmos decoder. */
    public static boolean atmosSwitch(Context c) {
        return c != null && prefs(c).getBoolean(KEY_ATMOS, false) && Atmos.available();
    }

    public static List<String> links(Context c) {
        List<String> out = new ArrayList<>();
        if (c == null) return out;
        for (String l : prefs(c).getString(KEY_LINKS, "").split("\n")) {
            String t = l.trim();
            if (!t.isEmpty()) out.add(t);
        }
        return out;
    }

    public static List<String> links() {
        return links(ctx);
    }

    static void setLinks(Context c, List<String> links) {
        prefs(c).edit().putString(KEY_LINKS, String.join("\n", links)).apply();
    }

    /** Seconds a file's length may differ from YouTube's (protocol.md §7: default 5, 0-10). */
    public static double slackSec() {
        Context c = ctx;
        if (c == null) return 5;
        try {
            return Math.max(0, Math.min(10, Double.parseDouble(prefs(c).getString(KEY_SLACK, "5"))));
        } catch (NumberFormatException e) {
            return 5;
        }
    }

    /**
     * A link as the user pasted it, checked: https only (protocol §1), a manifest link or its
     * base. Returns null when fine, else why not.
     */
    static String problem(String link) {
        Protocol.Url u = Protocol.parse(link == null ? "" : link.trim());
        if (u == null) return "Not a link";
        if (!"https".equals(u.scheme)) return "Only https links";
        return null;
    }
}
