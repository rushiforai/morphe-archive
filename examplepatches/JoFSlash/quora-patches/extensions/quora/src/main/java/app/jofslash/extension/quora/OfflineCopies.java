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
 * stays readable when its author deletes it. One file per bookmark in the app's own storage, and its
 * pictures in a folder next to it. A copy goes when its bookmark is removed. Backups don't hold them;
 * Save to Downloads under Bookmarks writes the texts to a Markdown file.
 */
final class OfflineCopies {

    private static final String TAG = "JoFSlashPatches";
    private static final String FOLDER = "jofslash_offline";
    /** Longer texts are cut; the longest Quora answers are well under this. */
    private static final int MAX_CHARS = 300_000;

    static final class Copy {
        final String title, author, text;
        final long time;
        /** The saved pictures, in the order of the page. */
        final java.util.List<Image> images = new java.util.ArrayList<>();

        Copy(String title, String author, String text, long time) {
            this.title = title;
            this.author = author;
            this.text = text;
            this.time = time;
        }
    }

    /** A saved picture: its file, and the end of the text it comes after. */
    static final class Image {
        final File file;
        final String after;

        Image(File file, String after) {
            this.file = file;
            this.after = after;
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
            // A new text keeps the pictures saved before; saveImages replaces them when they changed.
            JSONObject old = readJson(context, url);
            if (old != null && old.has("i")) o.put("i", old.getJSONArray("i"));
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

    /** The saved copy as it is kept, or null when there is none. */
    private static JSONObject readJson(Context context, String url) {
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
            return url.equals(o.optString("u")) ? o : null;
        } catch (Exception ex) {
            Log.e(TAG, "Failed to read the offline copy", ex);
            return null;
        }
    }

    /** The saved copy, or null when there is none. */
    static synchronized Copy load(Context context, String url) {
        if (context == null || !ReadingHistory.isQuoraUrl(url)) return null;
        JSONObject o = readJson(context, url);
        if (o == null) return null;
        Copy copy = new Copy(o.optString("t"), o.optString("a"), o.optString("x"), o.optLong("d"));
        org.json.JSONArray list = o.optJSONArray("i");
        File folder = images(context, url);
        for (int i = 0; list != null && i < list.length(); i++) {
            JSONObject one = list.optJSONObject(i);
            if (one == null) continue;
            File picture = new File(folder, one.optString("f"));
            // Only names this class made, in the copy's own folder.
            if (one.optString("f").matches("\\d{1,2}\\.img") && picture.isFile()) {
                copy.images.add(new Image(picture, one.optString("a")));
            }
        }
        return copy;
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
            deleteFolder(images(context, url));
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

    private static final int MAX_IMAGES = 20;
    private static final int MAX_IMAGE_BYTES = 3 * 1024 * 1024;
    /** All saved pictures together; past this, new ones aren't saved. */
    private static final long MAX_ALL_IMAGES = 150L * 1024 * 1024;
    private static final java.util.Set<String> downloading = new java.util.HashSet<>();

    /**
     * Keeps the pictures of a bookmarked page with its copy, from the list the page sent as
     * [{"s": address, "a": text before it}]. Only https addresses on Quora's image servers
     * (*.quoracdn.net). Downloads in the background, and not at all when nothing changed. With Data
     * saver on, only on Wi-Fi and other networks that aren't metered.
     */
    static void saveImages(Context context, String url, String json) {
        if (context == null || json == null || json.length() > 20_000) return;
        Context app = context.getApplicationContext();
        if (!ReadingHistory.BOOKMARKS.contains(app, url)) return;
        try {
            org.json.JSONArray list = new org.json.JSONArray(json);
            java.util.List<String[]> wanted = new java.util.ArrayList<>();
            for (int i = 0; i < list.length() && wanted.size() < MAX_IMAGES; i++) {
                JSONObject one = list.optJSONObject(i);
                if (one == null) continue;
                String src = one.optString("s");
                if (!src.matches("https://[a-z0-9.-]+\\.quoracdn\\.net/[^\\s]{1,1000}")) continue;
                wanted.add(new String[]{src, one.optString("a").trim()});
            }
            synchronized (OfflineCopies.class) {
                JSONObject copy = readJson(app, url);
                if (copy == null) return;
                if (same(copy.optJSONArray("i"), wanted, images(app, url))) return;
                if (!downloading.add(url)) return;
            }
            if (!wanted.isEmpty() && dataSaverBlocks(app)) {
                synchronized (OfflineCopies.class) {
                    downloading.remove(url);
                }
                return;
            }
            new Thread(() -> {
                try {
                    download(app, url, wanted);
                } finally {
                    synchronized (OfflineCopies.class) {
                        downloading.remove(url);
                    }
                }
            }, "JoFSlashOfflineImages").start();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to save the pictures", ex);
        }
    }

    /** Whether the saved pictures are these, with their files still there. */
    private static boolean same(org.json.JSONArray saved, java.util.List<String[]> wanted, File folder) {
        int count = saved == null ? 0 : saved.length();
        if (count != wanted.size()) return false;
        for (int i = 0; i < count; i++) {
            JSONObject one = saved.optJSONObject(i);
            if (one == null || !wanted.get(i)[0].equals(one.optString("s"))) return false;
            String name = one.optString("f");
            if (!name.isEmpty() && !new File(folder, name).isFile()) return false;
        }
        return true;
    }

    static boolean dataSaverBlocks(Context context) {
        if (!PatchSettings.isRegistered("dataSaver") || !PatchSettings.isOn("dataSaver")) return false;
        try {
            android.net.ConnectivityManager cm = (android.net.ConnectivityManager)
                    context.getSystemService(Context.CONNECTIVITY_SERVICE);
            return cm == null || cm.isActiveNetworkMetered();
        } catch (Exception ex) {
            return true;
        }
    }

    private static void download(Context context, String url, java.util.List<String[]> wanted) {
        File folder = images(context, url);
        File temp = new File(folder.getPath() + ".new");
        deleteFolder(temp);
        if (!wanted.isEmpty() && !temp.mkdirs()) return;
        long room = MAX_ALL_IMAGES - size(new File(context.getFilesDir(), FOLDER)) + size(folder);
        org.json.JSONArray saved = new org.json.JSONArray();
        try {
            for (int i = 0; i < wanted.size(); i++) {
                File out = new File(temp, i + ".img");
                long n = fetch(wanted.get(i)[0], out, room);
                room -= Math.max(n, 0);
                JSONObject one = new JSONObject();
                one.put("s", wanted.get(i)[0]);
                // One that failed is noted without a file, so the next visit doesn't try again.
                one.put("f", n > 0 ? out.getName() : "");
                one.put("a", wanted.get(i)[1]);
                saved.put(one);
            }
            synchronized (OfflineCopies.class) {
                JSONObject copy = readJson(context, url);
                // The bookmark was removed meanwhile.
                if (copy == null || !ReadingHistory.BOOKMARKS.contains(context, url)) {
                    deleteFolder(temp);
                    return;
                }
                deleteFolder(folder);
                if (temp.isDirectory() && !temp.renameTo(folder)) {
                    deleteFolder(temp);
                    saved = new org.json.JSONArray();
                }
                copy.put("i", saved);
                write(context, url, copy);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to download the pictures", ex);
        } finally {
            deleteFolder(temp);
        }
    }

    /** Downloads one picture to a file. Returns its size, or 0 when it isn't a picture or too big. */
    static long fetch(String src, File out, long room) {
        java.net.HttpURLConnection connection = null;
        try {
            connection = (java.net.HttpURLConnection) java.net.URI.create(src).toURL().openConnection();
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(20_000);
            connection.setInstanceFollowRedirects(false);
            if (connection.getResponseCode() != java.net.HttpURLConnection.HTTP_OK) return 0;
            String type = connection.getContentType();
            if (type == null || !type.startsWith("image/")) return 0;
            long total = 0;
            try (java.io.InputStream in = connection.getInputStream(); FileOutputStream file = new FileOutputStream(out)) {
                byte[] buffer = new byte[16 * 1024];
                int n;
                while ((n = in.read(buffer)) != -1) {
                    total += n;
                    if (total > MAX_IMAGE_BYTES || total > room) break;
                    file.write(buffer, 0, n);
                }
            }
            if (total > MAX_IMAGE_BYTES || total > room) {
                if (!out.delete()) Log.e(TAG, "Failed to remove a picture that is too big");
                return 0;
            }
            return total;
        } catch (Exception ex) {
            Log.e(TAG, "Failed to download a picture: " + ex);
            return 0;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static long size(File file) {
        if (file.isFile()) return file.length();
        long total = 0;
        File[] files = file.listFiles();
        if (files != null) for (File f : files) total += size(f);
        return total;
    }

    /**
     * Where a picture goes in the text: the end of the paragraph that holds the text it came after
     * on the page, looking from {@code from} on. The page sends that text with its spaces joined, so
     * any run of spaces and line breaks matches a space. No text puts it at {@code from}; text that
     * isn't found, at the end.
     */
    static int after(String text, String before, int from) {
        if (before == null || before.trim().isEmpty()) return from;
        StringBuilder regex = new StringBuilder();
        for (String word : before.trim().split("\\s+")) {
            // Also no space: the page joins its text pieces with spaces, as in "trail. [ 1 ]" for "trail.[1]".
            if (regex.length() > 0) regex.append("\\s*");
            regex.append(java.util.regex.Pattern.quote(word));
        }
        java.util.regex.Matcher m = java.util.regex.Pattern.compile(regex.toString()).matcher(text);
        if (!m.find(Math.max(0, Math.min(from, text.length())))) {
            // After the same text as the picture before it: right after that one.
            return m.find(0) ? from : text.length();
        }
        int end = text.indexOf('\n', m.end());
        return end < 0 ? text.length() : end;
    }

    /** The folder of a page's pictures, next to its file. */
    private static File images(Context context, String url) {
        File file = file(context, url);
        return new File(file.getParentFile(), file.getName().replace(".json", ""));
    }

    private static void deleteFolder(File folder) {
        File[] files = folder.listFiles();
        if (files != null) for (File f : files) if (!f.delete()) Log.e(TAG, "Failed to remove a saved picture");
        if (folder.isDirectory() && !folder.delete()) Log.e(TAG, "Failed to remove the pictures folder");
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
