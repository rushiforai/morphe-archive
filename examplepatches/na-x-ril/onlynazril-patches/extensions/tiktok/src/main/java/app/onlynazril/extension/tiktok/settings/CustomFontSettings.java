package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.provider.OpenableColumns;

import org.json.JSONArray;

import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import app.onlynazril.extension.tiktok.internal.Debug;

/**
 * The custom-font switch, the imported fonts, and the one in use.
 * <p>
 * An imported font is copied into the app's own files directory,
 * where the extension reads it without a permission. The settings
 * backup carries the file's bytes, gzipped, so a reinstall or another
 * device gets the face back without the storage surviving by itself.
 * <p>
 * The face is loaded once and cached against the file's
 * timestamp, because the factory is asked for a face on
 * every text the app lays out, and a font file is not
 * something to read per layout.
 */
public final class CustomFontSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_ENABLED = "custom_font_enabled";
    private static final String KEY_NAMES = "custom_font_names";
    private static final String KEY_SELECTED = "custom_font_selected";

    /** Where the working copy lives: the app's own directory, no permission needed. */
    private static final String FONTS_DIRECTORY = "fonts";

    private static volatile File servedFrom;
    private static volatile long servedStamp;
    private static volatile Typeface served;

    /** The font directory and its listing, resolved once: this path runs on every text render. */
    private static volatile File cachedDir;
    private static volatile List<String> cachedNames;
    private static volatile long cachedAt;
    private static volatile boolean migrated;
    private static final long LIST_TTL_MS = 2000L;
    /** The heaviest font a backup carries; a bigger file stays on its own device. */
    private static final long MAX_BACKUP_BYTES = 8L * 1024 * 1024;

    private CustomFontSettings() {}

    private static volatile Boolean enabledCache;

    /**
     * Loads the switch off the main thread. The first SharedPreferences read costs a few hundred
     * milliseconds on a cold start, and the font is asked for during the splash.
     */
    public static void warm(Context ctx) {
        if (ctx == null || enabledCache != null) return;
        Context app = ctx.getApplicationContext();
        Thread thread = new Thread(() -> {
            try {
                enabledCache = prefs(app).getBoolean(KEY_ENABLED, false);
                names(app);
            } catch (Throwable ignored) {
                enabledCache = Boolean.FALSE;
            }
        }, "tiktok-font-warm");
        thread.setDaemon(true);
        thread.start();
    }

    public static boolean isEnabled(Context ctx) {
        if (ctx == null) return false;
        Boolean cached = enabledCache;
        if (cached != null) return cached;
        // Not loaded yet: do not block the render thread for it. The warm thread answers in a few
        // milliseconds and the faces that follow use it.
        warm(ctx);
        return false;
    }

    public static boolean isEnabled() {
        return isEnabled(appContext());
    }

    public static void setEnabled(Context ctx, boolean value) {
        enabledCache = value;
        prefs(ctx).edit().putBoolean(KEY_ENABLED, value).apply();
    }

    /**
     * The imported fonts the working directory holds, newest first. Read from the directory rather
     * than prefs, so a font is listed by what is actually here. Fonts an earlier build left under
     * Android/media are moved in on the first look.
     */
    public static List<String> names(Context ctx) {
        if (ctx == null) return new ArrayList<>();
        long now = System.currentTimeMillis();
        List<String> cached = cachedNames;
        if (cached != null && now - cachedAt < LIST_TTL_MS) return new ArrayList<>(cached);
        if (!migrated) {
            migrated = true;
            migrate(ctx);
        }
        List<String> found = files(ctx);
        cachedNames = found;
        cachedAt = now;
        return new ArrayList<>(found);
    }

    /** Every font the screen offers: the working directory, newest first. */
    public static List<String> list(Context ctx) {
        return names(ctx);
    }

    /** Whether a name is on the device: a file in the working directory. */
    public static boolean has(Context ctx, String name) {
        if (ctx == null || name == null) return false;
        return new File(fontsDir(ctx), name).isFile();
    }

    /** Moves the fonts an earlier build wrote under Android/media into the working directory, once. */
    private static void migrate(Context ctx) {
        File directory = fontsDir(ctx);
        File legacy = legacyMediaDir(ctx);
        File[] old = legacy == null ? null : legacy.listFiles();
        if (old == null) return;
        for (File file : old) {
            if (!isFontName(file.getName())) continue;
            File target = new File(directory, file.getName());
            if (target.exists() || !file.renameTo(target)) {
                try {
                    copyFile(file, target);
                } catch (IOException ignored) {
                    continue;
                }
            }
            deleteQuietly(file);
        }
    }

    private static boolean isFontName(String name) {
        String lower = name.toLowerCase(java.util.Locale.ROOT);
        return lower.endsWith(".ttf") || lower.endsWith(".otf");
    }

    private static void copyFile(File source, File target) throws IOException {
        try (InputStream in = new java.io.FileInputStream(source);
                FileOutputStream out = new FileOutputStream(target)) {
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) > 0) out.write(buffer, 0, read);
        }
    }

    /** The font the feature serves, or null while none picked or the picked one is gone. */
    public static String selected(Context ctx) {
        List<String> names = names(ctx);
        if (names.isEmpty()) return null;
        String name = prefs(ctx).getString(KEY_SELECTED, null);
        if (name != null && names.contains(name)) return name;
        // After an install the selection is gone but the files are not: the newest is used.
        String newest = names.get(0);
        prefs(ctx).edit().putString(KEY_SELECTED, newest).apply();
        return newest;
    }

    /** The stored name, without the newest-file fallback: what a backup should carry. */
    public static String storedSelection(Context ctx) {
        return ctx == null ? null : prefs(ctx).getString(KEY_SELECTED, null);
    }

    public static void select(Context ctx, String name) {
        prefs(ctx).edit().putString(KEY_SELECTED, name).apply();
    }

    /**
     * Copies a picked font into the working directory and makes it the one in use.
     * <p>
     * A file that is not a working font is deleted again and leaves the list
     * alone, so a bad pick never disables what was imported before it.
     */
    public static boolean importFont(Context ctx, Uri uri) {
        if (ctx == null || uri == null) return false;
        String name = sanitize(displayName(ctx, uri));
        if (name == null) return false;

        File directory = fontsDir(ctx);
        if (!directory.isDirectory() && !directory.mkdirs()) return false;
        File target = new File(directory, name);
        try {
            copy(ctx, uri, target);
        } catch (IOException failure) {
            deleteQuietly(target);
            return false;
        }
        if (load(target) == null) {
            deleteQuietly(target);
            return false;
        }

        List<String> names = new ArrayList<>(names(ctx));
        names.remove(name);
        names.add(0, name);
        saveNames(ctx, names);
        select(ctx, name);
        cachedNames = null;
        return true;
    }

    /**
     * Writes font bytes a backup carries into the working directory and lists them again. Answers
     * the name it was stored under, or null when the bytes are not a working font, in which case
     * nothing is added.
     */
    static String restore(Context ctx, String name, byte[] bytes) {
        if (ctx == null || name == null || bytes == null || bytes.length == 0) return null;
        String stored = sanitize(name);
        if (stored == null) return null;
        File directory = fontsDir(ctx);
        if (!directory.isDirectory() && !directory.mkdirs()) return null;
        File target = new File(directory, stored);
        try {
            write(target, bytes);
        } catch (IOException e) {
            deleteQuietly(target);
            return null;
        }
        if (load(target) == null) {
            deleteQuietly(target);
            return null;
        }
        cachedNames = null;
        return stored;
    }

    /** An imported font's bytes, for the settings backup. Null when the name is not a file here. */
    static byte[] bytes(Context ctx, String name) {
        if (ctx == null || name == null) return null;
        File file = new File(fontsDir(ctx), name);
        if (!file.isFile() || file.length() > MAX_BACKUP_BYTES) return null;
        try (InputStream in = new java.io.FileInputStream(file)) {
            java.io.ByteArrayOutputStream out =
                    new java.io.ByteArrayOutputStream((int) file.length());
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) > 0) out.write(buffer, 0, read);
            return out.toByteArray();
        } catch (IOException | OutOfMemoryError e) {
            return null;
        }
    }

    private static void write(File target, byte[] bytes) throws IOException {
        try (FileOutputStream out = new FileOutputStream(target)) {
            out.write(bytes);
        }
    }

    /**
     * Removes an imported font, its file, and the selection when it held it;
     * the newest import left becomes the one in use.
     */
    public static void deleteFont(Context ctx, String name) {
        if (ctx == null || name == null) return;
        List<String> names = new ArrayList<>(names(ctx));
        deleteQuietly(new File(fontsDir(ctx), name));
        deleteLegacyCopy(ctx, name);
        if (!names.remove(name)) {
            refresh();
            return;
        }
        saveNames(ctx, names);
        if (name.equals(prefs(ctx).getString(KEY_SELECTED, null))) {
            if (names.isEmpty()) {
                prefs(ctx).edit().remove(KEY_SELECTED).apply();
            } else {
                select(ctx, names.get(0));
            }
        }
        refresh();
    }

    /** Removes every imported font and its file, and the selection with them. */

    public static void clearFonts(Context ctx) {
        if (ctx == null) return;
        File[] files = fontsDir(ctx).listFiles();
        if (files != null) {
            for (File file : files) {
                deleteQuietly(file);
            }
        }
        // A copy an earlier build left under Android/media would be migrated back in on the next
        // launch, so it goes with the rest.
        File legacy = legacyMediaDir(ctx);
        File[] old = legacy == null ? null : legacy.listFiles();
        if (old != null) {
            for (File file : old) {
                if (isFontName(file.getName())) deleteQuietly(file);
            }
        }
        saveNames(ctx, new ArrayList<>());
        prefs(ctx).edit().remove(KEY_SELECTED).apply();
        refresh();
    }

    private static void deleteLegacyCopy(Context ctx, String name) {
        File legacy = legacyMediaDir(ctx);
        if (legacy != null) deleteQuietly(new File(legacy, name));
    }

    /** Drops the listing cache, for a caller that just changed the directory. */
    public static void refresh() {
        cachedNames = null;
        cachedAt = 0L;
    }

    /**
     * Puts the font feature back to nothing: every imported file, the selection and the switch.
     * The reset prompt promises the chosen font goes too, and files are not prefs.
     */
    public static void reset(Context ctx) {
        clearFonts(ctx);
        enabledCache = Boolean.FALSE;
        served = null;
        servedFrom = null;
        servedStamp = 0L;
    }

    /**
     * The face the patch serves, or null while the switch is
     * off, the context is missing, or nothing is picked.
     */
    public static Typeface typeface() {
        if (!isEnabled()) return null;
        Context ctx = appContext();
        if (ctx == null) return null;
        String name = selected(ctx);
        if (name == null) return null;
        File file = new File(fontsDir(ctx), name);
        long stamp = file.lastModified();
        Typeface cached = served;
        if (cached == null || !file.equals(servedFrom) || stamp != servedStamp) {
            cached = load(file);
            served = cached;
            servedFrom = file;
            servedStamp = stamp;
        }
        return cached;
    }

    /**
     * Whether a path names one of the faces TikTok bundles. The app's own asset
     * loader is handed every asset font it reads, so the path is what tells a
     * TikTok face from a Lynx page's or a sticker's own.
     */
    public static boolean isBundledFace(String path) {
        return path != null && path.startsWith("font/TikTok");
    }

    /**
     * The imported file the feature serves, or null while the switch is off, the
     * context is missing, or nothing is picked. A hybrid (H5) page is served this
     * file's bytes, so it needs the file itself rather than the face.
     */
    public static File selectedFile() {
        if (!isEnabled()) return null;
        Context ctx = appContext();
        if (ctx == null) return null;
        String name = selected(ctx);
        if (name == null) return null;
        File file = new File(fontsDir(ctx), name);
        return file.isFile() ? file : null;
    }

    /** A file that is missing or unreadable answers null, and the app keeps its own face. */
    private static Typeface load(File file) {
        if (!file.isFile()) return null;
        try {
            return Typeface.createFromFile(file);
        } catch (Throwable t) {
            return null;
        }
    }

    private static void deleteQuietly(File file) {
        if (file != null && file.exists() && !file.delete()) {
            Debug.print("fonts: failed to delete " + file.getName());
        }
    }

    private static JSONArray namesArray(SharedPreferences prefs) {
        JSONArray array = new JSONArray();
        String raw = prefs.getString(KEY_NAMES, null);
        if (raw == null) return array;
        try {
            return new JSONArray(raw);
        } catch (Throwable t) {
            // A list that will not parse starts over, without the fonts it named.
            return array;
        }
    }

    private static void saveNames(Context ctx, List<String> names) {
        JSONArray array = new JSONArray();
        for (String name : names) array.put(name);
        prefs(ctx).edit().putString(KEY_NAMES, array.toString()).apply();
    }

    /**
     * The working copy the renderer reads: the app's own files directory, which needs no
     * permission and is always writable. A settings backup carries the bytes, so the file does
     * not have to survive an uninstall.
     */
    private static File fontsDir(Context ctx) {
        File cached = cachedDir;
        if (cached != null) return cached;
        File dir = new File(ctx.getFilesDir(), FONTS_DIRECTORY);
        if (!dir.isDirectory()) dir.mkdirs();
        cachedDir = dir;
        Debug.mark("font dir resolved");
        return dir;
    }

    /** The directory earlier builds wrote to; read once so its fonts are not stranded. */
    private static File legacyMediaDir(Context ctx) {
        try {
            File root = android.os.Environment.getExternalStorageDirectory();
            if (root == null) return null;
            File dir = new File(new File(new File(root, "Android"), "media"),
                    ctx.getPackageName() + "/" + FONTS_DIRECTORY);
            return dir.isDirectory() ? dir : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** The names of the font files present, newest first. */
    private static List<String> files(Context ctx) {
        List<String> found = new ArrayList<>();
        File[] files = fontsDir(ctx).listFiles();
        if (files == null) return found;
        java.util.Arrays.sort(files, (a, b) -> Long.compare(b.lastModified(), a.lastModified()));
        for (File file : files) {
            if (isFontName(file.getName())) found.add(file.getName());
        }
        return found;
    }

    /** The picker's name for the file, without the directory it came from. */
    private static String displayName(Context ctx, Uri uri) {
        Cursor cursor = null;
        try {
            cursor = ctx.getContentResolver()
                    .query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null);
            if (cursor != null && cursor.moveToFirst()) {
                int column = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);
                if (column >= 0) return cursor.getString(column);
            }
        } catch (Throwable ignored) {
            // No display name: the caller falls back to a numbered one.
        } finally {
            closeQuietly(cursor);
        }
        return null;
    }

    /**
     * Flattens a picked name into one the app's files directory can hold. The extension the file
     * came with is kept as it is: only a name without a font extension gets one, because the
     * listing and the H5 response both read the extension. Nothing is ever appended twice.
     */
    private static String sanitize(String name) {
        if (name == null) return null;
        String flat = name.replaceAll("[^\\w\\-.]", "_");
        String lower = flat.toLowerCase(java.util.Locale.ROOT);
        boolean font = lower.endsWith(".ttf") || lower.endsWith(".otf");
        String base = font ? flat.substring(0, flat.length() - 4) : flat;
        if (!font) {
            // A name with another extension or none: the last dot goes, so "x.woff2" becomes
            // "x.ttf" rather than "x.woff2.ttf".
            int dot = base.lastIndexOf('.');
            if (dot > 0) base = base.substring(0, dot);
        }
        if (base.isEmpty()) base = "font";
        if (base.length() > 48) base = base.substring(0, 48);
        return base + (font ? lower.substring(lower.length() - 4) : ".ttf");
    }

    private static void copy(Context ctx, Uri uri, File target) throws IOException {
        InputStream input = null;
        FileOutputStream output = null;
        try {
            input = ctx.getContentResolver().openInputStream(uri);
            if (input == null) throw new IOException("the picker returned no stream");
            output = new FileOutputStream(target);
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) > 0) {
                output.write(buffer, 0, read);
            }
        } finally {
            closeQuietly(input);
            closeQuietly(output);
        }
    }

    private static void closeQuietly(Closeable closeable) {
        if (closeable == null) return;
        try {
            closeable.close();
        } catch (IOException ignored) {
        }
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Context appContext() {
        return HandleSettings.appContext();
    }
}
