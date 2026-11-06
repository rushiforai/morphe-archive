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

/**
 * The custom-font switch, the imported fonts, and the one in use.
 *
 * An imported font is copied into the app's own files directory,
 * where the extension reads it without a permission: the picker is
 * only the way in. The list and the selection live in the same
 * prefs as every other switch, and the selection is what the
 * patch's hook answers the factory with.
 *
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

    /** Where imported fonts live: the app's own directory, no permission needed. */
    private static final String FONTS_DIRECTORY = "fonts";

    private static volatile File servedFrom;
    private static volatile long servedStamp;
    private static volatile Typeface served;

    private CustomFontSettings() {}

    public static boolean isEnabled(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY_ENABLED, false);
    }

    public static boolean isEnabled() {
        return isEnabled(appContext());
    }

    public static void setEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_ENABLED, value).apply();
    }

    /** The imported fonts, the newest first. */
    public static List<String> names(Context ctx) {
        List<String> names = new ArrayList<>();
        JSONArray array = namesArray(prefs(ctx));
        for (int i = 0; i < array.length(); i++) {
            String name = array.optString(i, null);
            if (name != null) names.add(name);
        }
        return names;
    }

    /** The font the feature serves, or null while none picked or the picked one is gone. */
    public static String selected(Context ctx) {
        String name = prefs(ctx).getString(KEY_SELECTED, null);
        return name != null && names(ctx).contains(name) ? name : null;
    }

    public static void select(Context ctx, String name) {
        prefs(ctx).edit().putString(KEY_SELECTED, name).apply();
    }

    /**
     * Copies a picked font into the app's files directory and makes it the one in use.
     *
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
            target.delete();
            return false;
        }
        if (load(target) == null) {
            target.delete();
            return false;
        }

        List<String> names = new ArrayList<>(names(ctx));
        names.remove(name);
        names.add(0, name);
        saveNames(ctx, names);
        select(ctx, name);
        return true;
    }

    /**
     * Removes an imported font, its file, and the selection when it held it;
     * the newest import left becomes the one in use.
     */
    public static boolean deleteFont(Context ctx, String name) {
        if (ctx == null || name == null) return false;
        List<String> names = new ArrayList<>(names(ctx));
        if (!names.remove(name)) return false;
        new File(fontsDir(ctx), name).delete();
        saveNames(ctx, names);
        if (name.equals(prefs(ctx).getString(KEY_SELECTED, null))) {
            if (names.isEmpty()) {
                prefs(ctx).edit().remove(KEY_SELECTED).apply();
            } else {
                select(ctx, names.get(0));
            }
        }
        return true;
    }

    /** Removes every imported font and its file, and the selection with them. */
    public static void clearFonts(Context ctx) {
        if (ctx == null) return;
        File[] files = fontsDir(ctx).listFiles();
        if (files != null) {
            for (File file : files) file.delete();
        }
        saveNames(ctx, new ArrayList<String>());
        prefs(ctx).edit().remove(KEY_SELECTED).apply();
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

    private static File fontsDir(Context ctx) {
        return new File(ctx.getFilesDir(), FONTS_DIRECTORY);
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
     * Flattens a picked name into one the app's files directory can hold:
     * a short base name of word characters and a {@code .ttf} or {@code .otf}
     * extension, which is all the file is ever addressed by.
     */
    private static String sanitize(String name) {
        if (name == null) return null;
        int dot = name.lastIndexOf('.');
        String base = dot > 0 ? name.substring(0, dot) : name;
        String extension = dot > 0 ? name.substring(dot).toLowerCase() : ".ttf";
        base = base.replaceAll("[^\\w\\-.]", "_");
        if (base.isEmpty()) base = "font";
        if (base.length() > 48) base = base.substring(0, 48);
        if (!extension.equals(".ttf") && !extension.equals(".otf")) extension = ".ttf";
        return base + extension;
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
