package app.ayham.extension.music.addons;

import android.util.Log;

import java.lang.reflect.Field;

/**
 * What addon audio is doing now, for the quality badge and the stats line: the player we play it
 * on, the addon it came from, whether it is audible (not a silent pre-roll), and whether a lookup is
 * still running. Read from the renderer's own input Format (YT Music 9.30.53's media3 `cdr`:
 * L = sampleRate, M = pcmEncoding, found by dumping a 24-bit and a 16-bit FLAC on the emulator).
 */
public final class AddonPlayback {
    private static final String TAG = "Ayham";

    /**
     * Each player we play addon audio on, newest claim last. Several run at once (the song heard,
     * a mix's held next song, a song just left that winds down): the badge reads the newest one that
     * is audible and playing, so one left behind (phone, 2026-11-19: a skipped-back song's player
     * re-locked, then stopped) neither takes the badge nor clears it for the song heard.
     */
    private static final class Entry {
        // set under the lock, read by now() outside it
        volatile String addon;
        volatile boolean audible, ownAtmos, held;
        /** The last {badge, line} while it was heard: kept through a re-lock (hold). */
        volatile Object[] last;
    }

    private static final java.util.LinkedHashMap<Object, Entry> players = new java.util.LinkedHashMap<>();
    private static volatile boolean upgrading;
    private static Field rateField, encodingField;
    private static boolean fieldsFailed;

    private AddonPlayback() {
    }

    /** A lookup started (true) or ended (false) for the song now playing. */
    public static void upgrading(boolean on) {
        upgrading = on;
    }

    /** Our player now carries this addon's audio; audible once it is heard (after any pre-roll). */
    public static void playing(Object p, String addonName, boolean isAudible) {
        playing(p, addonName, isAudible, false);
    }

    /**
     * atmosDecode: the player plays our own decode of a Dolby Atmos file (AtmosWav), so its input
     * is PCM; the badge and the line still say what was decoded.
     */
    public static synchronized void playing(Object p, String addonName, boolean isAudible, boolean atmosDecode) {
        Entry e = players.remove(p);
        if (e == null) e = new Entry();
        e.addon = addonName;
        e.audible = isAudible;
        e.ownAtmos = atmosDecode;
        players.put(p, e);
    }

    /** Heard or not; becoming heard makes it the newest claim. */
    public static synchronized void audible(Object p, boolean isAudible) {
        Entry e = players.get(p);
        if (e == null) return;
        if (isAudible && !e.audible) {
            players.remove(p);
            players.put(p, e);
        }
        e.audible = isAudible;
    }

    /**
     * on: the player re-locks onto YT after a seek (YT's audio covers a few seconds). The badge
     * keeps what it showed rather than flicking to "Upgrading Quality" and back; the song is still
     * the addon's.
     */
    public static synchronized void hold(Object p, boolean on) {
        Entry e = players.get(p);
        if (e != null) e.held = on;
    }

    public static synchronized void stopped(Object p) {
        players.remove(p);
    }

    /** {badge, stats line or null}: the line only while addon audio is really heard. */
    public static Object[] now() {
        java.util.List<Object> order;
        java.util.List<Entry> entries;
        synchronized (AddonPlayback.class) {
            order = new java.util.ArrayList<>(players.keySet());
            entries = new java.util.ArrayList<>(players.values());
        }
        Object[] held = null;
        for (int i = order.size() - 1; i >= 0; i--) {
            Object p = order.get(i);
            Entry e = entries.get(i);
            if (e.audible) {
                try {
                    if ((int) p.getClass().getMethod("n").invoke(p) == 3) {
                        Object f = app.ayham.extension.music.features.PlayerTap.audioFormat(p);
                        if (f != null) {
                            String[] h = head(f.toString());
                            String mime = h[3];
                            int bitrate = parse(h[5]);
                            int rate = intField(f, "L");
                            int enc = intField(f, "M");
                            if (e.ownAtmos && "audio/raw".equals(mime)) {
                                // the phone's Dolby decoder's render, played from our WAV of it
                                mime = Atmos.EAC3_JOC;
                                bitrate = -1;
                                enc = -1;
                            }
                            Object[] r = {Quality.badge(false, mime, rate, enc, bitrate), Quality.line(mime, rate, enc, bitrate, e.addon)};
                            e.last = r;
                            return r;
                        }
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "addon format read failed", t);
                }
                // the newest heard one keeps its reading while it buffers (a resync's seek): an older
                // one still winding down would take it (phone, 2026-11-24: FLAC 24/44.1, then the song
                // before's 16/44.1 for 2 s, then 24 again)
                if (e.last != null) return e.last;
            }
            if (held == null && e.held && e.last != null) held = e.last;
        }
        if (held != null) return held;
        return new Object[]{Quality.badge(upgrading, null, 0, -1, -1), null};
    }

    /** Format(id, label, container, sampleMime, codecs, bitrate, ...) */
    public static String[] head(String s) {
        return s.substring(7, s.indexOf(", [")).split(", ");
    }

    public static int parse(String s) {
        try {
            return Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /** Synchronized: two threads could otherwise see rateField set before encodingField. */
    private static synchronized int intField(Object f, String name) throws Exception {
        if (fieldsFailed) return name.equals("M") ? -1 : 0;
        try {
            if (rateField == null) {
                rateField = f.getClass().getDeclaredField("L");
                encodingField = f.getClass().getDeclaredField("M");
                rateField.setAccessible(true);
                encodingField.setAccessible(true);
            }
            return (name.equals("L") ? rateField : encodingField).getInt(f);
        } catch (NoSuchFieldException e) {
            fieldsFailed = true;
            Log.w(TAG, "Format fields not found: badge without bit depth");
            return name.equals("M") ? -1 : 0;
        }
    }
}
