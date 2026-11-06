package app.template.extension.googlemessages;

import android.content.Context;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Keywords live in a text file (one per line) in the app's private files dir, edited by
 * KeywordSettingsActivity. The file's modified time/length is checked on each message,
 * so edits apply immediately, in any process. Empty/missing file = nothing is dropped.
 */
@SuppressWarnings("unused")
public final class KeywordFilter {
    private static final String FILE_NAME = "keyword_filter.txt";

    private static volatile File file;
    private static volatile String[] keywords = new String[0];
    private static volatile long cachedModified = -1;
    private static volatile long cachedLength = -1;

    private KeywordFilter() {}

    /** Return true to drop the message. Never throws; fails open (returns false). */
    public static boolean shouldBlock(String sender, String body) {
        try {
            if (body == null || body.isEmpty()) return false;
            String[] list = load();
            if (list.length == 0) return false;
            String haystack = body.toLowerCase(Locale.ROOT);
            for (String keyword : list) {
                if (haystack.contains(keyword)) return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static synchronized String[] load() throws Exception {
        File f = file;
        if (f == null) {
            Context ctx = appContext();
            if (ctx == null) return keywords;
            f = new File(ctx.getFilesDir(), FILE_NAME);
            file = f;
        }
        long modified = f.lastModified();
        long length = f.length();
        if (modified == cachedModified && length == cachedLength) return keywords;

        keywords = parse(f.exists() ? readFile(f) : "");
        cachedModified = modified;
        cachedLength = length;
        return keywords;
    }

    private static String[] parse(String raw) {
        List<String> out = new ArrayList<>();
        for (String line : raw.split("\\r?\\n")) {
            String k = line.trim().toLowerCase(Locale.ROOT);
            if (!k.isEmpty()) out.add(k);
        }
        return out.toArray(new String[0]);
    }

    private static Context appContext() throws Exception {
        Class<?> at = Class.forName("android.app.ActivityThread");
        return (Context) at.getMethod("currentApplication").invoke(null);
    }

    private static String readFile(File f) throws IOException {
        try (FileInputStream in = new FileInputStream(f);
             ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    // ---- used by the settings screen ----

    static String readRaw(Context ctx) {
        try {
            File f = new File(ctx.getFilesDir(), FILE_NAME);
            return f.exists() ? readFile(f) : "";
        } catch (Throwable t) {
            return "";
        }
    }

    /** Saves the text and returns the number of keywords. */
    static int write(Context ctx, String raw) throws IOException {
        File f = new File(ctx.getFilesDir(), FILE_NAME);
        try (FileOutputStream out = new FileOutputStream(f)) {
            out.write(raw.getBytes(StandardCharsets.UTF_8));
        }
        f.setLastModified(System.currentTimeMillis());
        return parse(raw).length;
    }
}
