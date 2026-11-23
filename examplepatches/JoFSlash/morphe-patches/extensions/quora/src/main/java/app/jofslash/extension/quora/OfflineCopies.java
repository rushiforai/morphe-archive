package app.jofslash.extension.quora;

import android.content.Context;
import android.util.Log;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * For Bookmarks: the text of each saved answer or post, so it can be read without internet and
 * stays readable when its author deletes it. One file per bookmark in the app's own storage; the
 * text only, without images. A copy goes when its bookmark is removed. Backups don't hold them;
 * Save to Downloads under Bookmarks writes them to a Markdown file.
 */
final class OfflineCopies {

    private static final String TAG = "JoFSlashPatches";
    private static final String FOLDER = "jofslash_offline";
    /** Longer texts are cut; the longest Quora answers are well under this. */
    private static final int MAX_CHARS = 300_000;

    static final class Copy {
        final String title, author, text;
        final long time;

        Copy(String title, String author, String text, long time) {
            this.title = title;
            this.author = author;
            this.text = text;
            this.time = time;
        }
    }

    private OfflineCopies() {
    }

    /** Saves or replaces the copy of a bookmarked page. Returns whether it was saved. */
    static synchronized boolean save(Context context, String url, String title, String author, String text) {
        if (context == null || !ReadingHistory.isQuoraUrl(url) || text == null) return false;
        String body = text.trim();
        // Shorter is a page that hasn't loaded its text yet, not an answer.
        if (body.length() < 20) return false;
        if (body.length() > MAX_CHARS) body = body.substring(0, MAX_CHARS);
        try {
            JSONObject o = new JSONObject();
            o.put("u", url);
            o.put("t", title == null ? "" : title.trim());
            o.put("a", author == null ? "" : author.trim());
            o.put("x", body);
            o.put("d", System.currentTimeMillis());
            return write(context, url, o);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to save the offline copy", ex);
            return false;
        }
    }

    private static boolean write(Context context, String url, JSONObject o) throws Exception {
        File file = file(context, url);
        File parent = file.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) return false;
        // Written next to it first, so a crash never leaves half a file.
        File temp = new File(file.getPath() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(temp)) {
            out.write(o.toString().getBytes(StandardCharsets.UTF_8));
        }
        return temp.renameTo(file);
    }

    /** The saved copy, or null when there is none. */
    static synchronized Copy load(Context context, String url) {
        if (context == null || !ReadingHistory.isQuoraUrl(url)) return null;
        try {
            File file = file(context, url);
            if (!file.isFile()) return null;
            byte[] data = new byte[(int) file.length()];
            try (FileInputStream in = new FileInputStream(file)) {
                int read = 0;
                while (read < data.length) {
                    int n = in.read(data, read, data.length - read);
                    if (n < 0) break;
                    read += n;
                }
            }
            JSONObject o = new JSONObject(new String(data, StandardCharsets.UTF_8));
            if (!url.equals(o.optString("u"))) return null;
            return new Copy(o.optString("t"), o.optString("a"), o.optString("x"), o.optLong("d"));
        } catch (Exception ex) {
            Log.e(TAG, "Failed to read the offline copy", ex);
            return null;
        }
    }

    /** The saved copy as it is kept, for a backup file; null when there is none. */
    static synchronized JSONObject toJson(Context context, String url) {
        Copy copy = load(context, url);
        if (copy == null) return null;
        try {
            JSONObject o = new JSONObject();
            o.put("u", url);
            o.put("t", copy.title);
            o.put("a", copy.author);
            o.put("x", copy.text);
            o.put("d", copy.time);
            return o;
        } catch (Exception ex) {
            return null;
        }
    }

    /**
     * Puts back a copy from a backup file, keeping its date. Only for a page in Bookmarks that has
     * no copy yet: the one on the phone is newer. Returns whether it was put back.
     */
    static synchronized boolean restore(Context context, JSONObject o) {
        if (context == null || o == null) return false;
        String url = o.optString("u");
        if (!ReadingHistory.BOOKMARKS.contains(context, url) || has(context, url)) return false;
        String body = o.optString("x").trim();
        if (body.length() < 20) return false;
        if (body.length() > MAX_CHARS) body = body.substring(0, MAX_CHARS);
        try {
            JSONObject copy = new JSONObject();
            copy.put("u", url);
            copy.put("t", o.optString("t").trim());
            copy.put("a", o.optString("a").trim());
            copy.put("x", body);
            copy.put("d", o.optLong("d", System.currentTimeMillis()));
            return write(context, url, copy);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to restore the offline copy", ex);
            return false;
        }
    }

    static synchronized boolean has(Context context, String url) {
        return context != null && ReadingHistory.isQuoraUrl(url) && file(context, url).isFile();
    }

    static synchronized void remove(Context context, String url) {
        if (context == null || url == null) return;
        try {
            File file = file(context, url);
            if (file.isFile() && !file.delete()) Log.e(TAG, "Failed to remove the offline copy");
        } catch (Exception ex) {
            Log.e(TAG, "Failed to remove the offline copy", ex);
        }
    }

    /**
     * All bookmarks as one Markdown text, newest first: each title, author, link and, when there
     * is one, the saved text. For keeping them outside the app (Save to Downloads).
     */
    static String markdown(Context context, java.util.List<ReadingHistory.Item> items) {
        StringBuilder out = new StringBuilder("# Quora bookmarks\n\n");
        java.text.DateFormat date = java.text.DateFormat.getDateInstance(java.text.DateFormat.MEDIUM);
        for (ReadingHistory.Item item : items) {
            Copy copy = load(context, item.url);
            out.append("## ").append(oneLine(item.title)).append("\n\n");
            String by = item.author.isEmpty() ? "" : oneLine(item.author) + " · ";
            out.append('*').append(by).append(date.format(new java.util.Date(item.time))).append("*  \n");
            out.append(item.url).append("\n\n");
            if (copy != null && !copy.text.isEmpty()) out.append(copy.text.trim()).append("\n\n");
            out.append("---\n\n");
        }
        return out.toString();
    }

    private static String oneLine(String s) {
        return s == null ? "" : s.replaceAll("\\s+", " ").trim();
    }

    /** The file of a page: the SHA-256 of its link, so any link makes a safe file name. */
    private static File file(Context context, String url) {
        StringBuilder name = new StringBuilder();
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(url.getBytes(StandardCharsets.UTF_8));
            for (byte b : hash) name.append(String.format("%02x", b));
        } catch (Exception ex) {
            name.append(Integer.toHexString(url.hashCode()));
        }
        return new File(new File(context.getFilesDir(), FOLDER), name + ".json");
    }
}
