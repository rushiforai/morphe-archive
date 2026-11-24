package app.jofslash.extension.quora;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * The pictures of the answer Reader view shows. They are downloaded again into the app's cache
 * (the page's copies can't be read from the app), only from Quora's image servers, at most 20 of
 * 3 MB each, and not at all while Data saver holds pictures back. The next reader replaces them.
 */
final class ReaderImages {

    private static final String TAG = "JoFSlashPatches";
    private static final String FOLDER = "jofslash_reader";
    private static final int MAX = 20;
    private static final long ROOM = 40L * 1024 * 1024;

    // Each reader counts up; an older download stops when a newer reader opens.
    private static final java.util.concurrent.atomic.AtomicInteger run = new java.util.concurrent.atomic.AtomicInteger();
    private static final Object FILES = new Object();

    interface Loaded {
        void done(List<OfflineCopies.Image> images);
    }

    private ReaderImages() {
    }

    /** The pictures in the page's list that may be downloaded: {address, the text before it}. */
    static List<String[]> parse(String json) {
        List<String[]> out = new ArrayList<>();
        if (json == null || json.length() > 20_000) return out;
        try {
            JSONArray list = new JSONArray(json);
            for (int i = 0; i < list.length() && out.size() < MAX; i++) {
                JSONObject one = list.optJSONObject(i);
                if (one == null) continue;
                String src = one.optString("s");
                if (!src.matches("https://[a-z0-9.-]+\\.quoracdn\\.net/[^\\s]{1,1000}")) continue;
                out.add(new String[]{src, one.optString("a").trim()});
            }
        } catch (Exception ex) {
            Log.e(TAG, "Reader view: the picture list isn't valid", ex);
        }
        return out;
    }

    /** Downloads the pictures in the background and hands them over on the main thread. */
    static void load(Context context, String json, Loaded loaded) {
        List<String[]> wanted = parse(json);
        if (wanted.isEmpty() || OfflineCopies.dataSaverBlocks(context)) return;
        File folder = new File(context.getCacheDir(), FOLDER);
        int mine = run.incrementAndGet();
        new Thread(() -> {
            List<OfflineCopies.Image> images = new ArrayList<>();
            synchronized (FILES) {
                if (mine != run.get()) return;
                File[] old = folder.listFiles();
                if (old != null) for (File f : old) if (!f.delete()) Log.e(TAG, "Reader view: failed to remove an old picture");
                if (!folder.isDirectory() && !folder.mkdirs()) return;
                long room = ROOM;
                for (int i = 0; i < wanted.size(); i++) {
                    if (mine != run.get()) return;
                    File out = new File(folder, mine + "_" + i + ".img");
                    long n = OfflineCopies.fetch(wanted.get(i)[0], out, room);
                    room -= Math.max(n, 0);
                    if (n > 0) images.add(new OfflineCopies.Image(out, wanted.get(i)[1]));
                }
            }
            new Handler(Looper.getMainLooper()).post(() -> loaded.done(images));
        }, "JoFSlashReaderImages").start();
    }
}
