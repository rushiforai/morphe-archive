package io.github.bakwudo.uyu.extension.danmaku;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Typeface;
import android.graphics.fonts.Font;
import android.graphics.fonts.SystemFonts;
import android.net.Uri;
import android.os.Build;
import android.os.LocaleList;
import android.provider.OpenableColumns;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import io.github.bakwudo.uyu.extension.Utils;

/**
 * Fonts for danmaku comments. A font setting is one of:
 * <ul>
 *     <li>empty: the system default font</li>
 *     <li>a family name such as {@code serif}</li>
 *     <li>{@code file:<path>#<collection index>}: a system font file, or a file imported by
 *     the user</li>
 * </ul>
 * No font is bundled with uyu.
 */
public final class DanmakuFonts {
    private static final String FILE_PREFIX = "file:";
    private static final String IMPORT_DIR = "uyu_fonts";

    private static final String[][] FAMILIES = {
            {"", "System default"},
            {"sans-serif", "Sans serif"},
            {"serif", "Serif"},
            {"monospace", "Monospace"},
    };

    public static final class Choice {
        public final String value;
        public final String label;

        Choice(String value, String label) {
            this.value = value;
            this.label = label;
        }
    }

    private DanmakuFonts() {
    }

    /** Typefaces by setting and weight. Settings change often while a slider is dragged. */
    private static final Map<String, Typeface> typefaces = new HashMap<>();

    /**
     * @return A typeface for the font setting at the given weight (100 to 900). A font without
     * that weight is drawn in its closest weight, or with synthetic bold.
     */
    public static synchronized Typeface typeface(String value, int weight) {
        String key = weight + ":" + value;
        Typeface typeface = typefaces.get(key);
        if (typeface == null) {
            typeface = createTypeface(value, weight);
            typefaces.put(key, typeface);
        }
        return typeface;
    }

    private static Typeface createTypeface(String value, int weight) {
        Typeface base = null;
        try {
            if (value.startsWith(FILE_PREFIX)) {
                base = fromFile(value, weight);
            } else if (!value.isEmpty()) {
                base = Typeface.create(value, Typeface.NORMAL);
            }
        } catch (Exception ex) {
            Utils.logError("Failed to load danmaku font " + value, ex);
        }
        if (base == null) base = Typeface.DEFAULT;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            // Asking for a weight the font does not have makes the text renderer use the
            // closest one, and add synthetic bold when that is 200 or more lighter.
            return Typeface.create(base, weight, false);
        }
        return Typeface.create(base, weight >= 600 ? Typeface.BOLD : Typeface.NORMAL);
    }

    private static Typeface fromFile(String value, int weight) {
        String path = value.substring(FILE_PREFIX.length());
        int collectionIndex = 0;
        int hash = path.lastIndexOf('#');
        if (hash >= 0) {
            try {
                collectionIndex = Integer.parseInt(path.substring(hash + 1));
            } catch (NumberFormatException ignored) {
            }
            path = path.substring(0, hash);
        }

        File file = new File(path);
        if (!file.canRead()) return null;
        Typeface.Builder builder = new Typeface.Builder(file).setTtcIndex(collectionIndex);
        if (hasWeightAxis(file, collectionIndex)) {
            builder.setFontVariationSettings("'wght' " + weight).setWeight(weight);
        }
        return builder.build();
    }

    /**
     * @return true if the font is a variable font with a weight axis. Reads the OpenType
     * table directory and the axes of its 'fvar' table.
     */
    static boolean hasWeightAxis(File file, int collectionIndex) {
        try (RandomAccessFile font = new RandomAccessFile(file, "r")) {
            long fontOffset = 0;
            if (font.readInt() == 0x74746366 /* ttcf */) {
                font.seek(8);
                int fontCount = font.readInt();
                if (collectionIndex < 0 || collectionIndex >= fontCount) return false;
                font.seek(12 + 4L * collectionIndex);
                fontOffset = font.readInt() & 0xFFFFFFFFL;
            }

            font.seek(fontOffset + 4);
            int tableCount = font.readUnsignedShort();
            for (int i = 0; i < tableCount; i++) {
                font.seek(fontOffset + 12 + 16L * i);
                int tag = font.readInt();
                font.readInt(); // checksum
                long tableOffset = font.readInt() & 0xFFFFFFFFL;
                if (tag != 0x66766172 /* fvar */) continue;

                font.seek(tableOffset + 4);
                int axesOffset = font.readUnsignedShort();
                font.readUnsignedShort(); // reserved
                int axisCount = font.readUnsignedShort();
                int axisSize = font.readUnsignedShort();
                for (int axis = 0; axis < axisCount; axis++) {
                    font.seek(tableOffset + axesOffset + (long) axis * axisSize);
                    if (font.readInt() == 0x77676874 /* wght */) return true;
                }
                return false;
            }
        } catch (IOException ex) {
            return false;
        }
        return false;
    }

    /**
     * @return Font families, then imported font files, then system font files. System files
     * are limited to fonts for Latin text and for Chinese, Japanese and Korean, with Japanese
     * fonts first.
     */
    public static List<Choice> choices(Context context) {
        List<Choice> choices = new ArrayList<>();
        for (String[] family : FAMILIES) choices.add(new Choice(family[0], family[1]));

        File[] imported = importDir(context).listFiles();
        if (imported != null) {
            List<File> files = new ArrayList<>();
            Collections.addAll(files, imported);
            files.sort((a, b) -> a.getName().compareToIgnoreCase(b.getName()));
            for (File file : files) {
                choices.add(new Choice(FILE_PREFIX + file.getAbsolutePath() + "#0",
                        "Imported: " + stripExtension(file.getName())));
            }
        }

        choices.addAll(systemFontChoices());
        return choices;
    }

    private static List<Choice> systemFontChoices() {
        // Setting value to label, in the order found.
        Map<String, String> japanese = new LinkedHashMap<>();
        Map<String, String> others = new LinkedHashMap<>();

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            for (Font font : SystemFonts.getAvailableFonts()) {
                File file = font.getFile();
                if (file == null) continue;
                LocaleList locales = font.getLocaleList();
                String language = locales.isEmpty() ? "" : locales.get(0).getLanguage();
                if (!language.isEmpty() && !language.equals("ja")
                        && !language.equals("zh") && !language.equals("ko")) {
                    continue;
                }
                String value = FILE_PREFIX + file.getAbsolutePath() + "#" + font.getTtcIndex();
                String label = stripExtension(file.getName())
                        + (locales.isEmpty() ? "" : " (" + locales.toLanguageTags() + ")");
                (language.equals("ja") ? japanese : others).putIfAbsent(value, label);
            }
        } else {
            File[] files = new File("/system/fonts").listFiles();
            if (files != null) {
                for (File file : files) {
                    String name = file.getName();
                    String lower = name.toLowerCase(Locale.ROOT);
                    if (!lower.endsWith(".ttf") && !lower.endsWith(".otf") && !lower.endsWith(".ttc")) {
                        continue;
                    }
                    String value = FILE_PREFIX + file.getAbsolutePath() + "#0";
                    boolean isJapanese = lower.contains("cjk") || lower.contains("jp");
                    (isJapanese ? japanese : others).putIfAbsent(value, stripExtension(name));
                }
            }
        }

        List<Choice> choices = new ArrayList<>();
        addSorted(choices, japanese);
        addSorted(choices, others);
        return choices;
    }

    private static void addSorted(List<Choice> choices, Map<String, String> fonts) {
        List<Map.Entry<String, String>> entries = new ArrayList<>(fonts.entrySet());
        entries.sort((a, b) -> a.getValue().compareToIgnoreCase(b.getValue()));
        for (Map.Entry<String, String> entry : entries) {
            choices.add(new Choice(entry.getKey(), entry.getValue()));
        }
    }

    /**
     * @return A short name for the font setting, for the settings screen.
     */
    public static String label(String value) {
        for (String[] family : FAMILIES) {
            if (family[0].equals(value)) return family[1];
        }
        if (value.startsWith(FILE_PREFIX)) {
            String path = value.substring(FILE_PREFIX.length());
            int hash = path.lastIndexOf('#');
            if (hash >= 0) path = path.substring(0, hash);
            return stripExtension(new File(path).getName());
        }
        return value;
    }

    /**
     * Copies a font file picked by the user into the app's own storage.
     *
     * @return The font setting for the copy, or null if Android cannot load the file as a font.
     */
    public static String importFont(Context context, Uri uri) throws IOException {
        ContentResolver resolver = context.getContentResolver();
        String name = displayName(resolver, uri);
        if (name == null || name.trim().isEmpty()) name = "font.ttf";
        name = name.replaceAll("[\\\\/:*?\"<>|]", "_");

        File dir = importDir(context);
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Cannot create " + dir);
        File target = new File(dir, name);

        try (InputStream in = resolver.openInputStream(uri);
             OutputStream out = new FileOutputStream(target)) {
            if (in == null) throw new IOException("Cannot open " + uri);
            byte[] buffer = new byte[16 * 1024];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
        }

        synchronized (DanmakuFonts.class) {
            // A file imported again under the same name replaces the old one.
            typefaces.clear();
        }
        if (new Typeface.Builder(target).build() == null) {
            //noinspection ResultOfMethodCallIgnored
            target.delete();
            return null;
        }
        return FILE_PREFIX + target.getAbsolutePath() + "#0";
    }

    private static String displayName(ContentResolver resolver, Uri uri) {
        try (Cursor cursor = resolver.query(uri, new String[]{OpenableColumns.DISPLAY_NAME},
                null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) return cursor.getString(0);
        } catch (Exception ex) {
            Utils.logError("Failed to read the font file name", ex);
        }
        return uri.getLastPathSegment();
    }

    private static File importDir(Context context) {
        return new File(context.getFilesDir(), IMPORT_DIR);
    }

    private static String stripExtension(String name) {
        int dot = name.lastIndexOf('.');
        return dot > 0 ? name.substring(0, dot) : name;
    }
}
