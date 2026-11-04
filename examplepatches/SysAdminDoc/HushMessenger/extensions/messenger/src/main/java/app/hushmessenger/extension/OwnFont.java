package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Messenger's own text in the phone's font or a picked font file instead of Meta's Optimistic (#39). Settings checks the
 * switch, and this decides what each typeface becomes. The picked file is read once per run, like the switch, so text
 * laid out before and after a change never mixes fonts.
 */
final class OwnFont {
    static final String KEY = "custom_font";
    /** The picked file's name. Empty means the phone's font. */
    static final String NAME_KEY = "custom_font_name";
    /** #48: the picked file's size in percent, 100 as the font comes. */
    static final String SCALE_KEY = "custom_font_scale";
    /** #48: how far the picked file's text sits lower in the line, in percent of its size. Negative is higher. */
    static final String SHIFT_KEY = "custom_font_shift";

    /** The saved size, held to the steps the settings offer. */
    static int scale(SharedPreferences prefs) {
        int scale = prefs.getInt(SCALE_KEY, 100);
        return scale < FontFile.SCALE_LEAST || scale > FontFile.SCALE_MOST ? 100 : scale;
    }

    /** The saved move, held to the steps the settings offer. */
    static int shift(SharedPreferences prefs) {
        int shift = prefs.getInt(SHIFT_KEY, 0);
        return Math.abs(shift) > FontFile.SHIFT_MOST ? 0 : shift;
    }

    /**
     * Saves [value], a String or an Integer, under [key], or puts back the value it had when the save fails. Android takes
     * a commit into memory before it learns whether the disk took it, so a failed one would otherwise stay in use, and the
     * next write of any setting would save it.
     */
    static boolean save(SharedPreferences prefs, String key, Object value) {
        Object before = prefs.getAll().get(key);
        boolean saved;
        try {
            saved = put(prefs.edit(), key, value).commit();
        } catch (RuntimeException failure) {
            saved = false;
        }
        if (!saved) restore(prefs, key, before);
        return saved;
    }

    /** Puts [before] back under [key], and a null as no value at all. Memory takes it even when the disk still won't. */
    static void restore(SharedPreferences prefs, String key, Object before) {
        try {
            put(prefs.edit(), key, before).commit();
        } catch (RuntimeException ignored) {
            // Nothing more to try. Saving the choice again mends it.
        }
    }

    /** Every type a preference can hold, so an old value of a type these keys don't use still goes back as it was. */
    @SuppressWarnings("unchecked")
    private static SharedPreferences.Editor put(SharedPreferences.Editor edit, String key, Object value) {
        if (value == null) return edit.remove(key);
        if (value instanceof Integer) return edit.putInt(key, (Integer) value);
        if (value instanceof Boolean) return edit.putBoolean(key, (Boolean) value);
        if (value instanceof Long) return edit.putLong(key, (Long) value);
        if (value instanceof Float) return edit.putFloat(key, (Float) value);
        if (value instanceof java.util.Set) return edit.putStringSet(key, (java.util.Set<String>) value);
        return edit.putString(key, String.valueOf(value));
    }

    /** The phone's sans-serif and its named weights, the families {@link #isPhoneTypeface} knows. */
    private static final String[] PHONE_SANS = {"sans-serif", "sans-serif-thin", "sans-serif-light", "sans-serif-medium", "sans-serif-black"};
    /** The weights Android and Messenger name after "sans-serif-" and "roboto-". */
    private static final Set<String> SANS_WEIGHTS = new HashSet<>(Arrays.asList("thin", "light", "regular", "medium", "bold", "black"));

    private static volatile Set<Typeface> phoneTypefaces;

    /** The picked font for this run, or {@link #NONE} for the phone's font. Null before the first read. */
    private static volatile Picked picked;
    private static final Picked NONE = new Picked(null, null);
    private static final AtomicBoolean WARMING = new AtomicBoolean();

    private OwnFont() { }

    /** Meta's interface families: every OPTIMISTIC constant of Messenger's font family enum. */
    static boolean isOptimistic(String family) {
        return family != null && family.startsWith("OPTIMISTIC");
    }

    /** Messenger's asset copies of Roboto Light, which are the phone's font in all but name. */
    static boolean isRobotoLight(String family) {
        return "ROBOTO_LIGHT".equals(family) || "ROBOTO_LIGHT_ITALIC".equals(family);
    }

    /**
     * The repository's [original] for [family] with the switch on: the chosen font at the larger of [weight] and its own
     * weight for an Optimistic family, the picked file for Roboto Light, and [original] for anything else, Roboto Mono
     * included. [weight] is negative when Messenger asked for none.
     */
    static Typeface replace(Typeface original, String family, int weight) {
        if (original == null || family == null) return original;
        if (isOptimistic(family)) return typeface(Math.max(weight, original.getWeight()), original.isItalic());
        return isRobotoLight(family) ? pickedInstead(original) : original;
    }

    /**
     * One of the phone's sans-serif typefaces, or none, swapped for the picked file at its weight and slant. Emoji, Meta's
     * fonts and every other typeface stay as they are, and so does everything while no file is picked.
     */
    static Typeface replacePhoneFont(Typeface answer) {
        // Every Litho text layout comes through here, so nothing is looked up while no file is picked.
        if (picked() == null || !isPhoneTypeface(answer)) return answer;
        Typeface base = answer == null ? Typeface.DEFAULT : answer;
        Typeface instead = pickedInstead(base);
        return instead == base ? answer : instead;
    }

    /** Android's family [name] stands for the phone's sans-serif: "sans-serif" or "roboto" and their named weights. */
    static boolean isPhoneSans(String name) {
        if (name == null || name.isEmpty()) return false;
        String lower = name.toLowerCase(Locale.ROOT);
        for (String sans : new String[] {"sans-serif", "roboto"}) {
            if (lower.equals(sans)) return true;
            if (lower.startsWith(sans + "-")) return SANS_WEIGHTS.contains(lower.substring(sans.length() + 1));
        }
        return false;
    }

    /**
     * Whether Android hands out [typeface] for the phone's sans-serif: none, the defaults, defaultFromStyle's four, and
     * "sans-serif" and its named weights in each style and at each weight. Android keeps one of each, so identity works.
     */
    static boolean isPhoneTypeface(Typeface typeface) {
        if (typeface == null || typeface == Typeface.DEFAULT || typeface == Typeface.DEFAULT_BOLD || typeface == Typeface.SANS_SERIF)
            return true;
        return phoneTypefaces().contains(typeface);
    }

    private static Set<Typeface> phoneTypefaces() {
        Set<Typeface> known = phoneTypefaces;
        if (known == null) {
            Set<Typeface> built = Collections.newSetFromMap(new IdentityHashMap<>());
            for (int style = Typeface.NORMAL; style <= Typeface.BOLD_ITALIC; style++) built.add(Typeface.defaultFromStyle(style));
            for (String name : PHONE_SANS) {
                Typeface base = Typeface.create(name, Typeface.NORMAL);
                for (int style = Typeface.NORMAL; style <= Typeface.BOLD_ITALIC; style++) built.add(Typeface.create(base, style));
                for (int weight = 100; weight <= 900; weight += 100) {
                    built.add(Typeface.create(base, weight, false));
                    built.add(Typeface.create(base, weight, true));
                }
            }
            for (int weight = 100; weight <= 900; weight += 100) {
                built.add(Typeface.create(Typeface.DEFAULT, weight, false));
                built.add(Typeface.create(Typeface.DEFAULT, weight, true));
            }
            // Published only once it's full and never changed after, so readers need no lock.
            phoneTypefaces = known = built;
        }
        return known;
    }

    /** The picked file at [answer]'s weight and slant when one is picked and loads, otherwise [answer]. */
    static Typeface pickedInstead(Typeface answer) {
        if (answer == null) return null;
        Picked font = picked();
        Typeface styled = font == null ? null : font.styled(clamped(answer.getWeight()), answer.isItalic());
        return styled != null ? styled : answer;
    }

    /** The chosen font at [weight] and [italic]: the picked file when it loads, else the phone's default font. */
    static Typeface typeface(int weight, boolean italic) {
        int clamped = clamped(weight);
        Picked font = picked();
        Typeface styled = font == null ? null : font.styled(clamped, italic);
        return styled != null ? styled : Typeface.create(Typeface.DEFAULT, clamped, italic);
    }

    private static int clamped(int weight) {
        return weight >= 1 && weight <= 1000 ? weight : 400;
    }

    /**
     * The check the settings row runs on a picked file before it's kept. Tests load a copy instead, because Windows won't
     * rename a file a typeface still maps.
     */
    static volatile FontFile.Check fileCheck = OwnFont::loads;

    /** Whether Android builds a typeface from [file], the last check a picked file passes. */
    static boolean loads(File file) {
        try {
            return new Typeface.Builder(file).build() != null;
        } catch (RuntimeException failure) {
            return false;
        }
    }

    /**
     * Reads the picked file and builds the phone's typefaces on a worker, so Messenger's first text doesn't wait on them.
     * HostScreens starts it once CrashGuard has run.
     */
    static void warmUp() {
        if (picked != null || !WARMING.compareAndSet(false, true)) return;
        Thread worker = new Thread(() -> {
            try {
                warm();
            } catch (RuntimeException | LinkageError error) {
                // The first typeface Messenger asks for reads it again.
                android.util.Log.w("HushMessenger", "custom_font: couldn't read the font ahead of time", error);
            }
        }, "HushMessengerFont");
        worker.setDaemon(true);
        worker.start();
    }

    /** The warm-up's reads, only while the switch is in effect: on, not paused and not in safe mode. */
    static void warm() {
        if (!Settings.wouldUse(KEY)) return;
        phoneTypefaces();
        picked();
    }

    /** Forgets this run's font, for tests. Messenger itself keeps it until a restart. */
    static void forget() {
        synchronized (OwnFont.class) {
            picked = null;
            phoneTypefaces = null;
            WARMING.set(false);
        }
    }

    /** The picked font, or null while the phone's font is chosen or the settings haven't loaded. */
    static Picked picked() {
        Picked font = picked;
        if (font == null) {
            SharedPreferences prefs = Settings.preferences;
            Context context = Settings.appContext;
            if (prefs == null || context == null) return null;
            synchronized (OwnFont.class) {
                font = picked;
                if (font == null) picked = font = Picked.read(prefs.getString(NAME_KEY, ""), context, scale(prefs), shift(prefs));
            }
        }
        return font == NONE ? null : font;
    }

    /** A picked font file, read once, and the weights built from it so far. */
    static final class Picked {
        final File file;
        /** The copy at its own weight and slant, or null when it's missing or didn't load. */
        final Typeface base;
        /** The least and greatest weight of the copy's 'wght' axis, or null for a font without one. */
        final float[] weights;
        /** Each weight and slant built so far, by weight times two plus one for italic. */
        final ConcurrentHashMap<Integer, Typeface> styles = new ConcurrentHashMap<>();
        /** The copy as it was read. Settings can replace it mid-run, and later weights mustn't come from the new file. */
        private final long modified, length;

        private Picked(File file, Typeface base) {
            this.file = file;
            this.base = base;
            this.weights = base == null ? null : FontFile.weightAxis(file);
            modified = file == null ? 0 : file.lastModified();
            length = file == null ? 0 : file.length();
        }

        /** The picked copy, sized and moved first when [scale] or [shift] asks. One that can't be is used as it is. */
        static Picked read(String name, Context context, int scale, int shift) {
            if (name == null || name.isEmpty()) return NONE;
            File file = FontFile.file(context);
            if (file.isFile() && (scale != 100 || shift != 0)) {
                File adjusted = FontFile.adjusted(file, scale, shift);
                Typeface sized = adjusted == null ? null : build(adjusted);
                if (sized != null) return new Picked(adjusted, sized);
                android.util.Log.w("HushMessenger", "custom_font: the sized copy " + (adjusted == null ? "wasn't made" : "didn't load")
                    + ", so the font is drawn at its own size");
            } else if (file.isFile()) {
                FontFile.dropAdjusted(file.getParentFile(), null);
            }
            Typeface base = file.isFile() ? build(file) : null;
            if (base == null) android.util.Log.w("HushMessenger", "custom_font: the picked font file is missing or didn't load, so the phone's font is used");
            return new Picked(file, base);
        }

        private static Typeface build(File file) {
            try {
                return new Typeface.Builder(file).build();
            } catch (RuntimeException failure) {
                return null;
            }
        }

        /** The copy at [weight] and [italic], or null when it has nothing to build. */
        Typeface styled(int weight, boolean italic) {
            if (base == null) return null;
            int key = weight * 2 + (italic ? 1 : 0);
            Typeface styled = styles.get(key);
            if (styled != null) return styled;
            styled = build(weight, italic);
            Typeface raced = styles.putIfAbsent(key, styled);
            return raced != null ? raced : styled;
        }

        /**
         * A variable font is built with its 'wght' axis at [weight], held inside the axis, and told it's that weight so
         * Android doesn't embolden it again. Any other font keeps its outlines, and Android draws a bold or slant it lacks.
         */
        private Typeface build(int weight, boolean italic) {
            if (weights != null && file.lastModified() == modified && file.length() == length) {
                int axis = Math.round(Math.max(weights[0], Math.min(weights[1], weight)));
                try {
                    Typeface built = new Typeface.Builder(file).setFontVariationSettings("'wght' " + axis)
                        .setWeight(weight).setItalic(false).build();
                    if (built != null) return italic ? Typeface.create(built, weight, true) : built;
                } catch (RuntimeException failure) {
                    // The file at its own weight below.
                }
            }
            return Typeface.create(base, weight, italic);
        }
    }
}
