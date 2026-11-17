/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.net.Uri;
import android.provider.OpenableColumns;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * A font file of your own for all of Telegram's text (#79), while Use system font is on. The file
 * is copied into Telegram's own files when it's picked, and loaded once per start.
 *
 * <p>Telegram starts every text paint and text view with the phone's regular face and later asks
 * AndroidUtilities.getTypeface for its medium, italic and bold faces by file name. The patch hands
 * every new TextPaint, every new TextView and every read of Typeface.DEFAULT, SANS_SERIF and
 * DEFAULT_BOLD here, and {@link SystemFont} asks {@link #forAsset} before it answers a file name.
 * A font file usually has one weight, so Android draws the bold faces by thickening it. Monospace
 * and serif text keep the phone's faces, and so do Telegram's digits, Instant View and Gram faces.
 */
public final class CustomFont {
    private CustomFont() {}

    /** The largest file copied. Full CJK fonts are well under it. */
    static final long MAX_BYTES = 64L * 1024 * 1024;

    private static final String FOLDER = "hushtelegram_fonts";
    /**
     * The small file naming the font in use. A font file is written once under a name of its own
     * and never renamed or written over: Android keeps the file it loaded open for the rest of the
     * run, so a new pick goes in beside it and this note moves to it.
     */
    private static final String CURRENT = "current";
    private static final String PREFIX = "font-";
    private static final String SUFFIX = ".font";

    /** How a save went, so the settings page's toast can say which. */
    public enum Saved { SAVED, NOT_A_FONT, TOO_LARGE, FAILED }

    /** The face loaded from the file, or null until it's loaded or when there's none to load. */
    @Nullable private static volatile Typeface loaded;
    /** Whether the file was looked at this start, so a missing or broken one isn't read again for every paint. */
    private static volatile boolean looked;

    /** Where fonts are kept: Telegram's own files, outside the backup Android makes of the app. */
    private static File folder(Context context) {
        return new File(context.getNoBackupFilesDir(), FOLDER);
    }

    /** The font file in use, or null when none is saved. */
    @Nullable
    public static File file(Context context) {
        File folder = folder(context);
        File current = new File(folder, CURRENT);
        if (!current.isFile() || current.length() > 200) return null;
        try {
            String name = new String(Files.readAllBytes(current.toPath()), StandardCharsets.UTF_8).trim();
            boolean ours = name.startsWith(PREFIX) && name.endsWith(SUFFIX) && name.indexOf('/') < 0;
            return ours ? new File(folder, name) : null;
        } catch (IOException | RuntimeException unreadable) {
            return null;
        }
    }

    /** Whether a font file is saved. */
    public static boolean present(@Nullable Context context) {
        if (context == null) return false;
        File file = file(context);
        return file != null && file.isFile() && file.length() > 0;
    }

    /** A new TextPaint, which starts with no face: it takes the font's regular face. */
    public static void paint(Paint paint) {
        if (paint == null) return;
        try {
            Typeface face = face();
            if (face == null || paint.getTypeface() != null) return;
            paint.setTypeface(face);
            HookStatus.counted(FamilyNames.USE_SYSTEM_FONT, "font file used");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.USE_SYSTEM_FONT, "font file", failure);
        }
    }

    /** A new TextView: its face becomes the font at the weight and slant it had. */
    public static void view(TextView view) {
        if (view == null) return;
        try {
            Typeface face = face();
            if (face == null) return;
            Typeface current = view.getTypeface();
            if (current == Typeface.MONOSPACE || current == Typeface.SERIF) return;
            view.setTypeface(current == null ? face : styled(face, current.getWeight(), current.isItalic()));
            HookStatus.counted(FamilyNames.USE_SYSTEM_FONT, "font file used");
        } catch (Throwable failure) {
            // Called right after the view's own constructor, so a subclass's setTypeface may meet fields it hasn't set yet.
            HookStatus.threw(FamilyNames.USE_SYSTEM_FONT, "font file", failure);
        }
    }

    /** Typeface.DEFAULT or SANS_SERIF as Telegram reads it: the font's regular face, or [stock] with none. */
    public static Typeface regular(Typeface stock) {
        try {
            Typeface face = face();
            return face == null ? stock : face;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.USE_SYSTEM_FONT, "font file", failure);
            return stock;
        }
    }

    /** Typeface.DEFAULT_BOLD as Telegram reads it: the font in bold, or [stock] with none. */
    public static Typeface bold(Typeface stock) {
        try {
            Typeface face = face();
            return face == null ? stock : styled(face, 700, false);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.USE_SYSTEM_FONT, "font file", failure);
            return stock;
        }
    }

    /**
     * The font's face for one of Telegram's bundled files, or null to leave that file to
     * {@link SystemFont}: monospace text keeps a monospace face, so code blocks still line up.
     */
    @Nullable
    static Typeface forAsset(String asset) {
        Typeface face = face();
        if (face == null || asset == null) return null;
        switch (asset) {
            // Telegram's medium is its bold. A one-weight file only gets thicker from 600 up.
            case "fonts/rmedium.ttf":
            case "fonts/rcondensedbold.ttf":
                return styled(face, 700, false);
            case "fonts/rmediumitalic.ttf":
                return styled(face, 700, true);
            case "fonts/ritalic.ttf":
                return styled(face, 400, true);
            case "fonts/rextrabold.ttf":
                return styled(face, 800, false);
            default:
                return null;
        }
    }

    /**
     * [face] at [weight] and slant. Medium weights go to bold: a one-weight file drawn at 500 looks
     * regular, and Telegram uses medium where it means bold.
     */
    static Typeface styled(Typeface face, int weight, boolean italic) {
        int drawn = weight >= 500 && weight < 700 ? 700 : weight;
        if (drawn == 400 && !italic) return face;
        return Typeface.create(face, drawn, italic);
    }

    /**
     * The font's regular face while Use system font is on and a file was saved when Telegram
     * started, else null. Looked up once per start: Telegram keeps the faces it was handed, so a
     * font picked or removed shows after a restart, never half way.
     */
    @Nullable
    static Typeface face() {
        if (!Utils.settingsReady() || !Settings.USE_SYSTEM_FONT.get()) return null;
        if (looked) return loaded;
        synchronized (CustomFont.class) {
            if (!looked) {
                loaded = Settings.CUSTOM_FONT.get().isEmpty() ? null : load();
                looked = true;
            }
            return loaded;
        }
    }

    @Nullable
    private static Typeface load() {
        Context context = Utils.getContext();
        if (context == null) return null;
        File file = file(context);
        if (file == null || !file.isFile()) return null;
        try {
            Typeface face = new Typeface.Builder(file).build();
            if (face == null) HookStatus.counted(FamilyNames.USE_SYSTEM_FONT, "font file unreadable");
            return face;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.USE_SYSTEM_FONT, "font file", failure);
            return null;
        }
    }

    /**
     * Copies [source] in as the font, moving to it only once the copy loads as a font, and deletes
     * the font it replaces. Run it off the main thread: the copy reads the whole file.
     */
    public static Saved save(Context context, Uri source) {
        File folder = folder(context);
        if (!folder.mkdirs() && !folder.isDirectory()) return Saved.FAILED;
        File font = fresh(folder);
        try {
            ContentResolver resolver = context.getContentResolver();
            try (InputStream in = resolver.openInputStream(source)) {
                if (in == null) return Saved.FAILED;
                try (FileOutputStream out = new FileOutputStream(font)) {
                    byte[] buffer = new byte[64 * 1024];
                    long total = 0;
                    for (int read; (read = in.read(buffer)) != -1; ) {
                        total += read;
                        if (total > MAX_BYTES) {
                            out.close();
                            font.delete();
                            return Saved.TOO_LARGE;
                        }
                        out.write(buffer, 0, read);
                    }
                    out.getFD().sync();
                }
            }
            if (!readable(font)) {
                font.delete();
                return Saved.NOT_A_FONT;
            }
            if (!point(folder, font.getName())) {
                font.delete();
                return Saved.FAILED;
            }
            sweep(folder, font.getName());
            return Saved.SAVED;
        } catch (IOException | RuntimeException failure) {
            Logger.printException(() -> "Could not copy the font file", failure);
            font.delete();
            return Saved.FAILED;
        }
    }

    /** A name in [folder] no file has. */
    private static File fresh(File folder) {
        long stamp = System.currentTimeMillis();
        File font = new File(folder, PREFIX + Long.toString(stamp, 36) + SUFFIX);
        while (font.exists()) font = new File(folder, PREFIX + Long.toString(++stamp, 36) + SUFFIX);
        return font;
    }

    /** Points the note at [name], replacing it whole. */
    private static boolean point(File folder, String name) {
        File current = new File(folder, CURRENT);
        File part = new File(folder, CURRENT + ".part");
        try (FileOutputStream out = new FileOutputStream(part)) {
            out.write(name.getBytes(StandardCharsets.UTF_8));
            out.getFD().sync();
        } catch (IOException failure) {
            Logger.printException(() -> "Could not note the font file", failure);
            part.delete();
            return false;
        }
        if (part.renameTo(current) || current.delete() && part.renameTo(current)) return true;
        part.delete();
        return false;
    }

    /** Deletes every file in [folder] but the note and [keep]: older fonts, refused copies, a cut-short note. */
    private static void sweep(File folder, @Nullable String keep) {
        File[] files = folder.listFiles();
        if (files == null) return;
        for (File file : files) {
            String name = file.getName();
            if (name.equals(CURRENT) || name.equals(keep) || file.delete()) continue;
            Logger.printDebug(() -> "Font file " + name + " stays until the next pick");
        }
    }

    /** The longest name the settings row shows, in characters. */
    static final int NAME_LENGTH = 60;

    /** The picked file's name as the picker shows it, for the settings row. */
    public static String name(Context context, Uri source) {
        String name = null;
        try (Cursor row = context.getContentResolver().query(source, new String[] {OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (row != null && row.moveToFirst() && !row.isNull(0)) name = row.getString(0);
        } catch (RuntimeException unreadable) {
            Logger.printInfo(() -> "No name for the font file: " + unreadable.getClass().getSimpleName());
        }
        if (name == null || name.trim().isEmpty()) {
            String segment = source.getLastPathSegment();
            name = segment == null ? null : segment.substring(Math.max(segment.lastIndexOf('/'), segment.lastIndexOf(':')) + 1);
        }
        if (name == null || name.trim().isEmpty()) return L10n.t("Font file");
        name = name.trim();
        return name.codePointCount(0, name.length()) > NAME_LENGTH ? name.substring(0, name.offsetByCodePoints(0, NAME_LENGTH)) : name;
    }

    /** Forgets the font and deletes its file. True when no font is saved any more. */
    public static boolean remove(@Nullable Context context) {
        if (context == null) return false;
        File folder = folder(context);
        File current = new File(folder, CURRENT);
        if (current.exists() && !current.delete()) return false;
        sweep(folder, null);
        return true;
    }

    /**
     * Whether Android loads [file] as a font. A file that doesn't start the way TrueType, OpenType,
     * a font collection or WOFF does is turned away before Android reads it.
     */
    static boolean readable(File file) {
        byte[] tag = new byte[4];
        try (FileInputStream in = new FileInputStream(file)) {
            if (in.read(tag) != tag.length) return false;
        } catch (IOException unreadable) {
            return false;
        }
        int start = (tag[0] & 0xff) << 24 | (tag[1] & 0xff) << 16 | (tag[2] & 0xff) << 8 | tag[3] & 0xff;
        boolean fontLike = start == 0x00010000 || start == 0x4f54544f || start == 0x74727565 || start == 0x74746366
                || start == 0x774f4646 || start == 0x774f4632;
        if (!fontLike) return false;
        try {
            return new Typeface.Builder(file).build() != null;
        } catch (RuntimeException unreadable) {
            return false;
        }
    }

    /** Forgets the face loaded this start, for tests that save and remove files in one process. */
    static synchronized void resetForTests() {
        loaded = null;
        looked = false;
    }
}
