/*
 * Local storage for the story like history (Morphe).
 *
 * One small JSON file in the app's private storage, plus a folder of thumbnails next to it.
 * Reading is lazy, writing is atomic (tmp + rename) and happens off the caller's thread; the list
 * is capped and expired entries are dropped opportunistically. Follows the spirit of HushGram's
 * ViewingHistory <https://github.com/SysAdminDoc/HushGram> (GPLv3; see NOTICE.hushgram) without
 * reusing its TSV format.
 */

package app.morphe.extension.instagram.patches.story;

import android.content.Context;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@SuppressWarnings("unused")
public final class StoryLikeHistory {
    private static final String TAG = "StoryLikeHistory";
    private static final String DIRECTORY = "wagg13-story-likes";
    private static final String FILE = "history.json";
    private static final String THUMBS = "thumbs";
    private static final int MAX_ENTRIES = 200;
    private static final int MAX_THUMBNAIL_BYTES = 4 * 1024 * 1024;
    private static final Charset UTF_8 = Charset.forName("UTF-8");

    private static final Object LOCK = new Object();
    /** Newest first. */
    private static final List<StoryLikeHistoryEntry> ENTRIES = new ArrayList<>();
    private static File loadedFrom;

    private static final ExecutorService IO = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "wagg13-story-likes");
        thread.setDaemon(true);
        return thread;
    });

    private StoryLikeHistory() {
    }

    // ---- public API ----------------------------------------------------------------------

    /** Records a like, moving a repeated story to the top and writing off the caller's thread. */
    public static void add(Context context, StoryLikeHistoryEntry entry) {
        if (context == null || entry == null || isBlank(entry.storyId)) return;
        Context app = appContext(context);
        synchronized (LOCK) {
            load(app);
            removeLocked(entry.storyId);
            ENTRIES.add(0, entry);
            pruneLocked(System.currentTimeMillis());
            while (ENTRIES.size() > MAX_ENTRIES) {
                ENTRIES.remove(ENTRIES.size() - 1);
            }
        }
        IO.execute(() -> save(app));
    }

    /** The stored entries, newest first, without the ones past likedAt + 24h. */
    public static List<StoryLikeHistoryEntry> entries(Context context) {
        Context app = appContext(context);
        boolean changed = false;
        List<StoryLikeHistoryEntry> copy;
        synchronized (LOCK) {
            load(app);
            int sizeBefore = ENTRIES.size();
            pruneLocked(System.currentTimeMillis());
            changed = ENTRIES.size() != sizeBefore;
            copy = new ArrayList<>(ENTRIES);
        }
        if (changed) IO.execute(() -> save(app));

        Collections.sort(copy, new Comparator<StoryLikeHistoryEntry>() {
            @Override
            public int compare(StoryLikeHistoryEntry a, StoryLikeHistoryEntry b) {
                return Long.compare(b.likedAt, a.likedAt);
            }
        });
        return copy;
    }

    /** Forgets one story and deletes its thumbnail. */
    public static void remove(Context context, String storyId) {
        if (context == null || isBlank(storyId)) return;
        Context app = appContext(context);
        synchronized (LOCK) {
            load(app);
            removeLocked(storyId);
        }
        deleteThumbnail(app, storyId);
        IO.execute(() -> save(app));
    }

    /** Forgets everything and deletes the stored files. */
    public static void clear(Context context) {
        if (context == null) return;
        Context app = appContext(context);
        synchronized (LOCK) {
            ENTRIES.clear();
            loadedFrom = file(app);
        }
        IO.execute(() -> {
            File folder = file(app).getParentFile();
            File thumbs = thumbsDir(app);
            deleteFolder(thumbs);
            File tmp = new File(folder, FILE + ".tmp");
            if (tmp.exists()) tmp.delete();
            File file = file(app);
            if (file.exists()) file.delete();
        });
    }

    /** Copies the story's thumbnail into the private cache; best effort, off the caller's thread. */
    public static void saveThumbnail(Context context, String storyId, String imageUrl) {
        saveThumbnail(context, storyId, imageUrl, false);
    }

    /**
     * Same as {@link #saveThumbnail(Context, String, String)}, but a video story gets a
     * {@code <storyId>.mp4} name so the grid can show the play marker (the bytes are still the
     * still image sent as the video's cover).
     */
    public static void saveThumbnail(Context context, String storyId, String imageUrl, boolean isVideo) {
        if (context == null || isBlank(storyId) || isBlank(imageUrl)) return;
        Context app = appContext(context);
        String name = safeName(storyId) + (isVideo ? ".mp4" : ".jpg");
        IO.execute(() -> {
            File target = new File(thumbsDir(app), name);
            if (!download(imageUrl, target)) return;

            String path = target.getAbsolutePath();
            boolean changed = false;
            synchronized (LOCK) {
                load(app);
                for (int at = 0; at < ENTRIES.size(); at++) {
                    StoryLikeHistoryEntry entry = ENTRIES.get(at);
                    if (!storyId.equals(entry.storyId) || path.equals(entry.thumbnailPath)) continue;
                    ENTRIES.set(at, new StoryLikeHistoryEntry(
                            entry.storyId, entry.authorId, entry.username, entry.displayName,
                            entry.postedAt, entry.likedAt, path));
                    changed = true;
                    break;
                }
            }
            if (changed) save(app);
        });
    }

    // ---- internals -----------------------------------------------------------------------

    private static void removeLocked(String storyId) {
        for (Iterator<StoryLikeHistoryEntry> it = ENTRIES.iterator(); it.hasNext(); ) {
            if (storyId.equals(it.next().storyId)) it.remove();
        }
    }

    private static void pruneLocked(long now) {
        for (Iterator<StoryLikeHistoryEntry> it = ENTRIES.iterator(); it.hasNext(); ) {
            if (it.next().shouldRemove(now)) it.remove();
        }
    }

    private static Context appContext(Context context) {
        Context app = context.getApplicationContext();
        return app != null ? app : context;
    }

    private static File file(Context app) {
        return new File(new File(app.getFilesDir(), DIRECTORY), FILE);
    }

    private static File thumbsDir(Context app) {
        return new File(new File(app.getFilesDir(), DIRECTORY), THUMBS);
    }

    private static void deleteThumbnail(Context app, String storyId) {
        File dir = thumbsDir(app);
        String base = safeName(storyId);
        for (String name : new String[]{base + ".jpg", base + ".mp4"}) {
            File file = new File(dir, name);
            if (file.exists()) file.delete();
        }
    }

    private static void deleteFolder(File folder) {
        File[] children = folder.listFiles();
        if (children != null) {
            for (File child : children) {
                if (child.isDirectory()) deleteFolder(child);
                else child.delete();
            }
        }
        folder.delete();
    }

    private static void load(Context app) {
        File file = file(app);
        if (file.equals(loadedFrom)) return;
        loadedFrom = file;
        ENTRIES.clear();
        if (!file.isFile()) return;

        try {
            String text = new String(readFile(file), UTF_8);
            JSONArray array = new JSONArray(text);
            for (int at = 0; at < array.length() && ENTRIES.size() < MAX_ENTRIES; at++) {
                JSONObject object = array.optJSONObject(at);
                if (object == null) continue;
                String storyId = object.optString("story_id", "");
                if (isBlank(storyId)) continue;
                String thumbnail = object.has("thumbnail_path") && !object.isNull("thumbnail_path")
                        ? object.optString("thumbnail_path") : null;
                ENTRIES.add(new StoryLikeHistoryEntry(
                        storyId,
                        object.optString("author_id", ""),
                        object.optString("username", ""),
                        object.optString("display_name", ""),
                        object.optLong("posted_at", 0L),
                        object.optLong("liked_at", 0L),
                        thumbnail));
            }
        } catch (Throwable t) {
            // A torn or foreign file must never take the screen down: keep what parsed.
            Log.e(TAG, "load failed", t);
        }
    }

    private static void save(Context app) {
        synchronized (LOCK) {
            File file = file(app);
            File folder = file.getParentFile();
            if (folder == null || (!folder.mkdirs() && !folder.isDirectory())) return;

            try {
                JSONArray array = new JSONArray();
                for (StoryLikeHistoryEntry entry : ENTRIES) {
                    JSONObject object = new JSONObject();
                    object.put("story_id", entry.storyId);
                    object.put("author_id", entry.authorId == null ? "" : entry.authorId);
                    object.put("username", entry.username == null ? "" : entry.username);
                    object.put("display_name", entry.displayName == null ? "" : entry.displayName);
                    object.put("posted_at", entry.postedAt);
                    object.put("liked_at", entry.likedAt);
                    if (entry.thumbnailPath == null) object.put("thumbnail_path", JSONObject.NULL);
                    else object.put("thumbnail_path", entry.thumbnailPath);
                    array.put(object);
                }

                File work = new File(folder, FILE + ".tmp");
                try (FileOutputStream out = new FileOutputStream(work)) {
                    out.write(array.toString().getBytes(UTF_8));
                }
                if (!work.renameTo(file)) {
                    file.delete();
                    if (!work.renameTo(file)) Log.e(TAG, "could not replace " + file.getName());
                }
            } catch (Throwable t) {
                Log.e(TAG, "save failed", t);
            }
        }
    }

    private static byte[] readFile(File file) throws Exception {
        try (FileInputStream in = new FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
            return out.toByteArray();
        }
    }

    private static boolean download(String imageUrl, File target) {
        File folder = target.getParentFile();
        if (folder == null || (!folder.mkdirs() && !folder.isDirectory())) return false;

        File work = new File(folder, target.getName() + ".tmp");
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(imageUrl).openConnection();
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(10000);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("User-Agent", "Instagram 452.1.0.53.64 Android");

            int total = 0;
            try (InputStream in = connection.getInputStream();
                 FileOutputStream out = new FileOutputStream(work)) {
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    total += read;
                    if (total > MAX_THUMBNAIL_BYTES) throw new IllegalStateException("thumbnail too large");
                    out.write(buffer, 0, read);
                }
            }

            if (!work.renameTo(target)) {
                target.delete();
                if (!work.renameTo(target)) return false;
            }
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "thumbnail download failed", t);
            work.delete();
            return false;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static String safeName(String value) {
        StringBuilder out = new StringBuilder(value.length());
        for (int at = 0; at < value.length(); at++) {
            char c = value.charAt(at);
            boolean ok = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
                    || (c >= '0' && c <= '9') || c == '-' || c == '_' || c == '.';
            out.append(ok ? c : '_');
        }
        return out.toString().toLowerCase(Locale.ROOT);
    }

    private static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
