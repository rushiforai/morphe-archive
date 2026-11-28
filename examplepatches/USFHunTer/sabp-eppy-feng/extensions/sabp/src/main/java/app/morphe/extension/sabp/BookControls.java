package app.morphe.extension.sabp;

import android.app.Service;
import android.content.Context;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;

/**
 * The classic player's per-book audio controls, driven through SABP's own PlayerService setters
 * (EppyBridge) and read back from the current BookData (Serializable, so its field names are
 * stable): volume boost, equalizer (5 bands, balance, mono, pitch, denoise), repeat, skip
 * start/end, ID3 titles, and the "rotate to control" switch. Values and ranges are SABP's.
 */
public final class BookControls {
    private BookControls() {
    }

    private static Object bookData() {
        Service s = EppyBridge.getPlayerService();
        if (s == null) return null;
        try {
            for (Field f : s.getClass().getDeclaredFields()) {
                if (f.getType().getName().equals(EppyBridge.SABP_PACKAGE + ".BookData")) {
                    f.setAccessible(true);
                    return f.get(s);
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Object get(Object o, String name) {
        if (o == null) return null;
        try {
            Field f = o.getClass().getDeclaredField(name);
            f.setAccessible(true);
            return f.get(o);
        } catch (Throwable t) {
            return null;
        }
    }

    private static void set(Object o, String name, Object value) throws Exception {
        Field f = o.getClass().getDeclaredField(name);
        f.setAccessible(true);
        f.set(o, value);
    }

    private static void call(String what, Runnable r) {
        try {
            r.run();
        } catch (Throwable t) {
            EppyDiag.error("controls", what + " failed: " + t);
        }
    }

    // ---- volume boost: -1 (quieter), 0 off, 1–3 ----------------------------------------------

    public static boolean canBoost() {
        return EppyBridge.getPlayerService() != null && EppyBridge.has("boost");
    }

    public static int boost() {
        Object v = get(bookData(), "mBoostVolume");
        return v instanceof Integer ? (Integer) v : 0;
    }

    public static void setBoost(int level) {
        Service s = EppyBridge.getPlayerService();
        if (s == null) return;
        int l = Math.max(-1, Math.min(3, level));
        call("boost", () -> EppyBridge.setBoost(s, l));
        EppyDiag.log("controls", "boost " + l);
    }

    // ---- ID3 titles -----------------------------------------------------------------------------

    public static boolean canId3() {
        return EppyBridge.getPlayerService() != null && EppyBridge.has("id3Titles");
    }

    public static boolean id3Titles() {
        return Boolean.TRUE.equals(get(bookData(), "mShowId3Titles"));
    }

    public static void setId3Titles(boolean on) {
        Service s = EppyBridge.getPlayerService();
        if (s == null) return;
        call("id3", () -> EppyBridge.setId3Titles(s, on));
    }

    // ---- equalizer ------------------------------------------------------------------------------

    /** Band centre frequencies (Hz), from SABP. */
    public static final int[] BANDS = {60, 230, 910, 4000, 14000};

    public static final class Eq {
        public final int[] levels = new int[5]; // dB, -15..15
        public float balance;                   // -1 (left) .. 1 (right)
        public boolean mono;
        public float pitch;                     // semitones, -2.5 .. 2.5
        public boolean denoise;

        public boolean flat() {
            for (int l : levels) if (l != 0) return false;
            return balance == 0f && !mono && pitch == 0f && !denoise;
        }
    }

    public static boolean canEqualize() {
        return EppyBridge.getPlayerService() != null && EppyBridge.has("equalizer");
    }

    public static Eq equalizer() {
        Eq e = new Eq();
        Object l = get(bookData(), "mEqualizerLevels");
        if (l == null) return e;
        for (int i = 0; i < 5; i++) {
            Object v = get(l, "mLevel" + i);
            e.levels[i] = v instanceof Integer ? (Integer) v : 0;
        }
        Object b = get(l, "mBalance"), m = get(l, "mMono"), p = get(l, "mPitch"), d = get(l, "mDenoise");
        e.balance = b instanceof Float ? (Float) b : 0f;
        e.mono = Boolean.TRUE.equals(m);
        e.pitch = p instanceof Float ? (Float) p : 0f;
        e.denoise = Boolean.TRUE.equals(d);
        return e;
    }

    public static void setEqualizer(Eq e) {
        Service s = EppyBridge.getPlayerService();
        if (s == null) return;
        call("equalizer", () -> {
            try {
                Object levels = null;
                if (!e.flat()) {
                    Class<?> cls = Class.forName(EppyBridge.SABP_PACKAGE + ".EqualizerLevels");
                    Constructor<?> ctor = cls.getDeclaredConstructor();
                    ctor.setAccessible(true);
                    levels = ctor.newInstance();
                    for (int i = 0; i < 5; i++) set(levels, "mLevel" + i, Math.max(-15, Math.min(15, e.levels[i])));
                    set(levels, "mBalance", Math.max(-1f, Math.min(1f, e.balance)));
                    set(levels, "mMono", e.mono);
                    set(levels, "mPitch", Math.max(-2.5f, Math.min(2.5f, e.pitch)));
                    set(levels, "mDenoise", e.denoise);
                }
                EppyBridge.setEqualizer(s, levels);
            } catch (RuntimeException re) {
                throw re;
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
        });
    }

    /** Balance, mono, pitch and denoise need SABP's built-in decoder ("App 1/2"), as in Classic. */
    public static boolean advancedEqAvailable(Context c) {
        String dec = SabpPrefs.prefs(c).getString("decoder_v12", "App 1");
        return "App 1".equals(dec) || "App 2".equals(dec);
    }

    // ---- repeat ---------------------------------------------------------------------------------

    /** SABP's repeat modes: a file or the whole book, 2–5 times or endlessly (1000). */
    public static final String[] REPEAT_MODES = {"File2", "File3", "File4", "File5", "File1000", "Book2", "Book3", "Book4", "Book5", "Book1000"};

    public static boolean canRepeat() {
        return EppyBridge.getPlayerService() != null && EppyBridge.has("repeat");
    }

    /** Current mode name, or null for off. */
    public static String repeatMode() {
        Object r = get(bookData(), "mRepeatSettings");
        Object m = get(r, "mMode");
        return m != null ? m.toString() : null;
    }

    public static String repeatLabel(String mode) {
        if (mode == null) return "Off";
        boolean file = mode.startsWith("File");
        String n = mode.substring(4);
        String times = "1000".equals(n) ? "endlessly" : n + " times";
        return (file ? "This file " : "Whole book ") + times;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void setRepeat(String mode) {
        Service s = EppyBridge.getPlayerService();
        if (s == null) return;
        call("repeat", () -> {
            try {
                Object value = null;
                if (mode != null) {
                    Class<?> cls = Class.forName(EppyBridge.SABP_PACKAGE + ".RepeatSettings");
                    Class modeCls = Class.forName(EppyBridge.SABP_PACKAGE + ".RepeatSettings$Mode");
                    Object m = Enum.valueOf(modeCls, mode);
                    Constructor<?> ctor = cls.getDeclaredConstructor(modeCls, cls);
                    ctor.setAccessible(true);
                    value = ctor.newInstance(m, get(bookData(), "mRepeatSettings"));
                }
                EppyBridge.setRepeat(s, value);
            } catch (RuntimeException re) {
                throw re;
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
        });
    }

    // ---- skip start / end -----------------------------------------------------------------------

    public static boolean canSkipStartEnd() {
        return EppyBridge.getPlayerService() != null && EppyBridge.has("skipStartEnd");
    }

    /** {start, end} seconds skipped at the start and end of every file. */
    public static int[] skipStartEnd() {
        Object o = get(bookData(), "mSkipStartEndSettings");
        Object a = get(o, "mStart"), b = get(o, "mEnd");
        return new int[]{a instanceof Integer ? (Integer) a : 0, b instanceof Integer ? (Integer) b : 0};
    }

    public static void setSkipStartEnd(int start, int end) {
        Service s = EppyBridge.getPlayerService();
        if (s == null) return;
        call("skipStartEnd", () -> {
            try {
                Class<?> cls = Class.forName(EppyBridge.SABP_PACKAGE + ".SkipStartEndSettings");
                Constructor<?> ctor = cls.getDeclaredConstructor(int.class, int.class);
                ctor.setAccessible(true);
                EppyBridge.setSkipStartEnd(s, ctor.newInstance(Math.max(0, start), Math.max(0, end)));
            } catch (RuntimeException re) {
                throw re;
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
        });
    }

    // ---- rotate to control (SABP's own setting, read by its service) -----------------------------

    public static boolean rotateActive(Context c) {
        return SabpPrefs.prefs(c).getBoolean("rotateActivated", false);
    }

    public static void setRotateActive(Context c, boolean on) {
        SabpPrefs.prefs(c).edit().putBoolean("rotateActivated", on).apply();
    }
}
