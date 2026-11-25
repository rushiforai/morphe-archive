/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b493914 (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.os.CancellationSignal;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.pinterest.settings.SettingsStatus;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;

/**
 * Pinterest's text in a font file the person picks (#51).
 *
 * <p>Pinterest sets its text in Pin Sans, a family of font resources (pin_sans_regular,
 * pin_sans_bold and the rest) that every screen loads through AndroidX's ResourcesCompat: a
 * TextView's fontFamily, Gestalt's own text and Compose text alike. The patch hands each font that
 * loader returns to {@link #resourceFont} with the resource it was loaded from. While the switch
 * is on and a font file is kept, a Pin Sans font comes back as the picked font at the weight and
 * slant Pinterest loaded.
 *
 * <p>Text that never asks for a font draws in Android's sans-serif families and its default. At
 * the end of the application's onCreate, before any screen exists, the picked font goes into the
 * font table Android keeps for this process, in place of each sans-serif family at that family's
 * weight and slant, and in place of Android's defaults by style. Android won't let
 * Typeface.DEFAULT, SANS_SERIF or DEFAULT_BOLD change, so the patch points each of Pinterest's
 * reads of them at {@link #androidDefault} and its two neighbors.
 *
 * <p>The picked file is copied into Pinterest's own files, so it keeps working after the original
 * is moved or deleted. A variable font gets its weight from its own axis, a fixed one is made
 * bolder or slanted by Android where Pinterest asks for that.
 *
 * <p>Off, paused, before the settings are ready, with no file kept, a file Android can't load, or a
 * failure in here, and Pinterest keeps its own font. Pinterest keeps the fonts it loaded, so a
 * change shows after a restart.
 */
public final class CustomFont {
    /** The kept copy of the picked font, in Pinterest's files. */
    static final String KEPT = "hushpinterest_custom_font";
    /** The picked file's name as its app gave it, beside the copy. */
    static final String KEPT_NAME = "hushpinterest_custom_font.name";
    /** A copy still being written, put in the kept one's place once it loads. */
    static final String PART = "hushpinterest_custom_font.part";
    /** Larger than any font file people use for text, collections of Chinese, Japanese and Korean included. */
    static final long MAX_BYTES = 64L * 1024 * 1024;
    /** The size a picked file may reach: {@link #MAX_BYTES}, unless a test sets its own. */
    static volatile long maxBytes = MAX_BYTES;

    /** Count label for a font swapped. */
    static final String SWAPPED = "used the picked font";
    /** Count label for Android's sans-serif families put in at Pinterest's start. */
    static final String ANDROID_SWAPPED = "put the picked font in Android's font table";
    /** Count label for Android's defaults by style put in at Pinterest's start. */
    static final String DEFAULTS_SWAPPED = "put the picked font in as Android's default for each style";
    /** Count label for the picked font put in where Pinterest's code reads Android's default fonts. */
    static final String DEFAULT_READS = "put the picked font in where Pinterest reads Android's default";
    /** Prefix for a refusal's count label; one label per fixed reason. */
    static final String LEFT_TO_PINTEREST = "left the font to Pinterest: ";
    /** Android's sans-serif families couldn't be reached at Pinterest's start. */
    static final String NO_TABLE = "Android's font table is out of reach";
    /** Android's defaults by style couldn't be reached at Pinterest's start. */
    static final String NO_DEFAULTS = "Android's defaults by style are out of reach";

    private static final int REGULAR = 400;
    private static final int BOLD = 700;

    /** How a picked file went. */
    public enum Outcome { KEPT, TOO_LARGE, NOT_A_FONT, UNREADABLE }

    /** Makes a typeface from a font file. Android's, unless a test stands in. */
    interface Loader {
        /** The font in [file] at [weight], slanted when [italic], or null when Android can't load it. */
        @Nullable
        Typeface load(File file, int weight, boolean italic);
    }

    static final Loader ANDROID = (file, weight, italic) -> {
        Typeface.Builder builder = new Typeface.Builder(file);
        // A variable font draws the weight itself. A fixed one is left as it is, and
        // Typeface.create below makes it bolder or slanted where it has to.
        if (variable(file)) builder.setFontVariationSettings("'wght' " + weight).setWeight(weight);
        Typeface base = builder.build();
        return base == null ? null : Typeface.create(base, weight, italic);
    };

    static volatile Loader loader = ANDROID;

    /** Android's own fonts in this process: its sans-serif families by name, and its defaults. */
    interface AndroidFonts {
        /** The table Typeface.create(String, int) and a theme's font family names are looked up in. */
        Map<String, Typeface> families() throws ReflectiveOperationException;

        /**
         * Puts the four in as what Typeface.defaultFromStyle answers for each style, which a
         * TextView with no font of its own draws in.
         */
        void defaults(Typeface regular, Typeface bold, Typeface italic, Typeface boldItalic) throws ReflectiveOperationException;
    }

    /**
     * Android's fields, reached by reflection: Android has no call that sets them. Typeface.DEFAULT,
     * SANS_SERIF and DEFAULT_BOLD can't be among them: Android 16 refuses a write to a static final
     * field and keeps setDefault from apps, so the patch points each of Pinterest's reads of those
     * at {@link #androidDefault} and its two neighbors instead.
     */
    static final AndroidFonts ANDROID_FONTS = new AndroidFonts() {
        @SuppressWarnings("unchecked")
        @Override
        public Map<String, Typeface> families() throws ReflectiveOperationException {
            Field table = Typeface.class.getDeclaredField("sSystemFontMap");
            table.setAccessible(true);
            return (Map<String, Typeface>) table.get(null);
        }

        @Override
        public void defaults(Typeface regular, Typeface bold, Typeface italic, Typeface boldItalic)
                throws ReflectiveOperationException {
            Field byStyle = Typeface.class.getDeclaredField("sDefaults");
            byStyle.setAccessible(true);
            Typeface[] styles = (Typeface[]) byStyle.get(null);
            if (styles == null) throw new NoSuchFieldException("sDefaults is empty");
            Typeface[] own = {regular, bold, italic, boldItalic};
            System.arraycopy(own, 0, styles, 0, Math.min(styles.length, own.length));
        }
    };

    static volatile AndroidFonts androidFonts = ANDROID_FONTS;

    /** The picked font at each weight and slant asked for, by weight * 2 plus one when slanted. */
    private static final Map<Integer, Typeface> made = new ConcurrentHashMap<>();
    /** The kept file wouldn't load, so it isn't tried again for every font Pinterest asks for. */
    private static volatile boolean unusable;

    /*
     * What Pinterest's code reads in place of Typeface.DEFAULT, SANS_SERIF and DEFAULT_BOLD: the
     * patch points each of its reads of those at these. Android's own until Pinterest's start puts
     * the picked font in, and for the whole run when it doesn't.
     */
    public static volatile Typeface androidDefault = Typeface.DEFAULT;
    public static volatile Typeface androidSansSerif = Typeface.SANS_SERIF;
    public static volatile Typeface androidDefaultBold = Typeface.DEFAULT_BOLD;
    @Nullable
    private static volatile String lastLogged;

    private CustomFont() { }

    /**
     * At the end of Pinterest's application onCreate, before any screen exists. Puts the picked font
     * in Android's font table and defaults while the switch is on and a font file is kept. Only a
     * build with Custom font does anything. Never throws.
     */
    public static void onPinterestStart(@Nullable Context context) {
        if (SettingsStatus.customFont()) start(context);
    }

    /** {@link #onPinterestStart} in a build with Custom font. */
    static void start(@Nullable Context context) {
        try {
            HookStatus.invoked(FamilyNames.CUSTOM_FONT);
            String off = offBecause();
            Typeface regular = off == null ? picked(REGULAR, false) : null;
            Typeface bold = regular != null ? picked(BOLD, false) : null;
            Typeface italic = bold != null ? picked(REGULAR, true) : null;
            Typeface boldItalic = italic != null ? picked(BOLD, true) : null;
            if (off == null && boldItalic == null) off = unusable ? "the font file won't load" : "no font file picked";
            if (off != null) {
                HookStatus.counted(FamilyNames.CUSTOM_FONT, LEFT_TO_PINTEREST + off);
                log(off);
                return;
            }
            androidDefault = regular;
            androidSansSerif = regular;
            androidDefaultBold = bold;
            HookStatus.counted(FamilyNames.CUSTOM_FONT, DEFAULT_READS);
            int families = 0;
            try {
                families = replaceTextFamilies(androidFonts.families());
                if (families > 0) HookStatus.counted(FamilyNames.CUSTOM_FONT, ANDROID_SWAPPED);
            } catch (ReflectiveOperationException | RuntimeException unreachable) {
                HookStatus.counted(FamilyNames.CUSTOM_FONT, LEFT_TO_PINTEREST + NO_TABLE);
                Logger.printInfo(() -> "Custom font: " + NO_TABLE + ", " + unreachable.getClass().getSimpleName());
            }
            try {
                androidFonts.defaults(regular, bold, italic, boldItalic);
                HookStatus.counted(FamilyNames.CUSTOM_FONT, DEFAULTS_SWAPPED);
            } catch (ReflectiveOperationException | RuntimeException unreachable) {
                HookStatus.counted(FamilyNames.CUSTOM_FONT, LEFT_TO_PINTEREST + NO_DEFAULTS);
                Logger.printInfo(() -> "Custom font: " + NO_DEFAULTS + ", " + unreachable.getClass().getSimpleName());
            }
            int swapped = families;
            Logger.printDebug(() -> "Custom font: put in for " + swapped + " of Android's sans-serif families");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CUSTOM_FONT, "custom font at start", failure);
        }
    }

    /**
     * Puts the picked font in place of each text font of [families], at the weight and slant of the
     * one it replaces, and returns how many. Every one is loaded before the first goes in, so a file
     * that won't load leaves the table as it was. Only names already there are written, so the
     * table never grows under a thread reading it.
     */
    static int replaceTextFamilies(Map<String, Typeface> families) {
        Map<String, Typeface> own = new LinkedHashMap<>();
        for (String name : new ArrayList<>(families.keySet())) {
            if (!isTextFont(name)) continue;
            Typeface typeface = picked(families.get(name));
            if (typeface == null) return 0;
            own.put(name, typeface);
        }
        for (Map.Entry<String, Typeface> entry : own.entrySet()) families.put(entry.getKey(), entry.getValue());
        return own.size();
    }

    /**
     * After AndroidX's ResourcesCompat loads the font resource [id] into [loaded], as it returns it.
     * A font that didn't load stays that way. Never throws.
     */
    public static Typeface resourceFont(@Nullable Typeface loaded, int id) {
        if (loaded == null) return null;
        try {
            Context context = Utils.getContext();
            String name = null;
            if (context != null) {
                try {
                    name = context.getResources().getResourceEntryName(id);
                } catch (Resources.NotFoundException unknown) {
                    // Not one of Pinterest's resources, so not one of its text fonts.
                }
            }
            return swap(loaded, name);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CUSTOM_FONT, "custom font", failure);
            return loaded;
        }
    }

    /** [loaded], or the picked font in its place when [name] is a text font and the switch applies. */
    static Typeface swap(Typeface loaded, @Nullable String name) {
        HookStatus.invoked(FamilyNames.CUSTOM_FONT);
        String off = offBecause();
        if (off == null && !isTextFont(name)) off = "not a text font";
        Typeface own = null;
        if (off == null) {
            own = picked(loaded);
            if (own == null) off = unusable ? "the font file won't load" : "no font file picked";
        }
        HookStatus.counted(FamilyNames.CUSTOM_FONT, off == null ? SWAPPED : LEFT_TO_PINTEREST + off);
        log(off);
        return own != null ? own : loaded;
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    @Nullable
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (HushPinterestPause.isPaused()) return "HushPinterest paused";
        if (!Settings.CUSTOM_FONT.get()) return "switch off";
        return null;
    }

    /**
     * Whether [name] is a font Pinterest sets text in: its own Pin Sans, by its family resources
     * (pin_sans_bold) or the files under them (raw_pin_sans_bold), and Android's sans-serif
     * families. Anything else, such as the video player's number font, isn't.
     */
    static boolean isTextFont(@Nullable String name) {
        if (name == null) return false;
        String lower = name.toLowerCase(Locale.ROOT);
        return lower.startsWith("sans-serif") || lower.startsWith("pin_sans") || lower.startsWith("raw_pin_sans");
    }

    /** The picked font at [loaded]'s weight and slant, or null when none is kept or it won't load. */
    @Nullable
    private static Typeface picked(@Nullable Typeface loaded) {
        return picked(loaded != null ? loaded.getWeight() : REGULAR, loaded != null && loaded.isItalic());
    }

    /** The picked font at [weight], slanted when [italic], or null when none is kept or it won't load. */
    @Nullable
    private static Typeface picked(int weight, boolean italic) {
        if (unusable) return null;
        // Typeface.create takes 1 to 1000 and throws on anything else.
        if (weight < 1 || weight > 1000) weight = REGULAR;
        int key = weight * 2 + (italic ? 1 : 0);
        Typeface ready = made.get(key);
        if (ready != null) return ready;
        Context context = Utils.getContext();
        if (context == null) return null;
        File file = new File(context.getFilesDir(), KEPT);
        if (!file.isFile()) return null;
        Typeface typeface = loader.load(file, weight, italic);
        if (typeface == null) {
            unusable = true;
            return null;
        }
        made.put(key, typeface);
        return typeface;
    }

    /**
     * Whether the font in [file] has a weight axis of its own: its table list names "fvar". A
     * collection's first font is the one Android loads, so that's the one read.
     */
    static boolean variable(File file) {
        try (RandomAccessFile font = new RandomAccessFile(file, "r")) {
            long start = 0;
            if (font.length() < 12) return false;
            if (font.readInt() == 0x74746366) { // "ttcf"
                font.seek(12);
                start = font.readInt() & 0xffffffffL;
            }
            font.seek(start + 4);
            int tables = font.readUnsignedShort();
            for (int index = 0; index < tables; index++) {
                font.seek(start + 12 + 16L * index);
                if (font.readInt() == 0x66766172) return true; // "fvar"
            }
            return false;
        } catch (IOException | RuntimeException unreadable) {
            return false;
        }
    }

    /**
     * Copies a picked font from [in] into Pinterest's files under [name], in place of any kept one,
     * once Android loads it. Nothing changes when it's too large, isn't a font, can't be read, or
     * [cancel] is cancelled first. Never on the main thread.
     */
    public static Outcome keep(Context context, InputStream in, @Nullable String name, CancellationSignal cancel) {
        File folder = context.getFilesDir();
        File part = new File(folder, PART);
        try {
            long total = 0;
            // Closed before anything deletes it: Windows, where the tests run, keeps an open file.
            try (OutputStream out = new FileOutputStream(part)) {
                byte[] buffer = new byte[64 * 1024];
                for (int read; (read = in.read(buffer)) != -1; ) {
                    total += read;
                    if (total > maxBytes) break;
                    out.write(buffer, 0, read);
                }
            }
            if (total > maxBytes) return dropped(part, Outcome.TOO_LARGE);
            if (loader.load(part, REGULAR, false) == null) return dropped(part, Outcome.NOT_A_FONT);
            if (cancel.isCanceled()) return dropped(part, Outcome.UNREADABLE);
            File kept = new File(folder, KEPT);
            if (!part.renameTo(kept) && !(kept.delete() && part.renameTo(kept))) return dropped(part, Outcome.UNREADABLE);
        } catch (IOException | RuntimeException failure) {
            Logger.printInfo(() -> "Font file not copied: " + failure.getClass().getSimpleName());
            return dropped(part, Outcome.UNREADABLE);
        }
        File label = new File(folder, KEPT_NAME);
        if (name == null || name.trim().isEmpty()) {
            //noinspection ResultOfMethodCallIgnored
            label.delete();
        } else {
            try (OutputStream out = new FileOutputStream(label)) {
                out.write(name.trim().getBytes(StandardCharsets.UTF_8));
            } catch (IOException failure) {
                // The font is kept all the same; its row names it generically.
                //noinspection ResultOfMethodCallIgnored
                label.delete();
            }
        }
        made.clear();
        unusable = false;
        Logger.printDebug(() -> "Custom font: a new font file is kept");
        return Outcome.KEPT;
    }

    private static Outcome dropped(File part, Outcome outcome) {
        //noinspection ResultOfMethodCallIgnored
        part.delete();
        return outcome;
    }

    /**
     * The kept font's name as its app gave it, an empty string for a kept font with no name, or
     * null when none is kept.
     */
    @Nullable
    public static String keptName(Context context) {
        File folder = context.getFilesDir();
        if (!new File(folder, KEPT).isFile()) return null;
        File label = new File(folder, KEPT_NAME);
        if (!label.isFile() || label.length() > 4096) return "";
        try (InputStream in = new FileInputStream(label)) {
            byte[] bytes = new byte[(int) label.length()];
            int at = 0;
            for (int read; at < bytes.length && (read = in.read(bytes, at, bytes.length - at)) != -1; ) at += read;
            return new String(bytes, 0, at, StandardCharsets.UTF_8);
        } catch (IOException failure) {
            return "";
        }
    }

    private static void log(@Nullable String off) {
        String outcome = off == null ? "swapped" : "left to Pinterest, " + off;
        if (outcome.equals(lastLogged)) return;
        lastLogged = outcome;
        Logger.printDebug(() -> "Custom font: " + outcome);
    }

    /** Forgets every font made and puts Android's loader back. Tests only. */
    static void forget() {
        made.clear();
        unusable = false;
        androidDefault = Typeface.DEFAULT;
        androidSansSerif = Typeface.SANS_SERIF;
        androidDefaultBold = Typeface.DEFAULT_BOLD;
        lastLogged = null;
        loader = ANDROID;
        androidFonts = ANDROID_FONTS;
    }
}
