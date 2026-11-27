package app.ayham.extension.music.features;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

/**
 * What was saved with each downloaded song, by video id: its lyrics (Morphe's lyrics file and our
 * copy, which Morphe's trim can't reach), its animated art and its canvas. Deleting the song in YT
 * deletes all of it with the lossless file; YT's offline database is the truth (a song still in
 * another downloaded playlist keeps its things). The three Clear rows of Fork settings empty one kind.
 */
public final class OfflineIndex {
    private static final String TAG = "AyhamDownloads";
    public static final String LYRICS = "lyr", ART = "art", CANVAS = "cv";
    /** A record this new may not be in YT's database yet (YT writes it after the save). */
    private static final long SETTLE_MS = 3 * 60_000L;
    private static File file;
    private static Properties props;

    private OfflineIndex() {
    }

    static synchronized void init(Context c) {
        if (file != null) return;
        file = new File(dir(c), "index.properties");
        props = new Properties();
        if (file.exists()) {
            try (InputStream in = new FileInputStream(file)) {
                props.load(in);
            } catch (Exception e) {
                Log.w(TAG, "offline index unreadable", e);
            }
        }
    }

    static File dir(Context c) {
        File d = new File(c.getFilesDir(), "ayham-offline");
        //noinspection ResultOfMethodCallIgnored
        d.mkdirs();
        return d;
    }

    private static void save() {
        File tmp = new File(file.getPath() + ".part");
        try (OutputStream out = new FileOutputStream(tmp)) {
            props.store(out, "Ayham: what was saved with each downloaded song");
        } catch (Exception e) {
            Log.w(TAG, "offline index: write failed", e);
            return;
        }
        if (!tmp.renameTo(file)) Log.w(TAG, "offline index: could not replace " + file);
    }

    /** Notes a saved thing of a song: kind LYRICS (Morphe's file|our copy), ART or CANVAS (the clip path). */
    static synchronized void note(Context c, String videoId, String kind, String value) {
        init(c);
        props.setProperty(kind + "." + videoId, value);
        props.setProperty("at." + videoId, String.valueOf(System.currentTimeMillis()));
        save();
    }

    /** A song YT is saving now: its things are not checked against YT's database for SETTLE_MS. */
    static synchronized void touch(Context c, String videoId) {
        init(c);
        props.setProperty("at." + videoId, String.valueOf(System.currentTimeMillis()));
        save();
    }

    /** At start: lyrics Morphe's cache trimmed away come back from our copy; then the database check. */
    public static void start(Context c) {
        new Thread(() -> {
            try {
                init(c);
                int back = 0;
                synchronized (OfflineIndex.class) {
                    for (String k : props.stringPropertyNames()) {
                        if (!k.startsWith(LYRICS + ".")) continue;
                        String[] v = props.getProperty(k).split("\\|", 2);
                        if (v.length == 2 && !new File(v[0]).exists() && new File(v[1]).exists()) {
                            copy(new File(v[1]), new File(v[0]));
                            File raw = new File(v[1] + ".raw");
                            if (raw.exists()) copy(raw, new File(v[0] + ".raw"));
                            back++;
                        }
                    }
                }
                if (back > 0) Log.i(TAG, back + " downloaded songs' lyrics put back in Morphe's cache");
                watch(c);
                reconcile(c, null);
                app.ayham.extension.music.addons.AddonDownloads.resume(c);
            } catch (Throwable t) {
                Log.w(TAG, "offline start failed", t);
            }
        }, "ayham-offline-start").start();
    }

    private static android.os.FileObserver observer;
    private static android.os.Handler checks;
    private static final Runnable CHECK = () -> {
        Context c = Features.appContext;
        if (c != null) reconcile(c, null);
    };

    /**
     * YT's offline databases changing (a song, album or playlist removed, smart downloads): checked
     * 5 s after the last change. Removing an album or playlist doesn't pass Morphe's one-song hook.
     */
    @SuppressWarnings("deprecation")
    private static synchronized void watch(Context c) {
        if (observer != null) return;
        android.os.HandlerThread t = new android.os.HandlerThread("ayham-offline-watch");
        t.start();
        checks = new android.os.Handler(t.getLooper());
        String dir = new File(c.getApplicationInfo().dataDir, "databases").getPath();
        // a fresh install may have no databases folder yet: a watch on a missing folder never fires
        //noinspection ResultOfMethodCallIgnored
        new File(dir).mkdirs();
        observer = new android.os.FileObserver(dir, android.os.FileObserver.CLOSE_WRITE | android.os.FileObserver.DELETE | android.os.FileObserver.MOVED_TO) {
            @Override
            public void onEvent(int event, String path) {
                if (path == null || !path.startsWith("offline")) return;
                checks.removeCallbacks(CHECK);
                checks.postDelayed(CHECK, 5000);
            }
        };
        observer.startWatching();
    }

    /** Injection point: Morphe's offlineVideoRemoved (YT removed a song). The database decides a moment later. */
    public static void removed(String videoId) {
        Context c = Features.appContext;
        if (c == null) return;
        Log.i(TAG, "YT removed " + videoId + ": checking its downloads");
        new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(
                () -> new Thread(() -> reconcile(c, videoId), "ayham-offline-check").start(), 3000);
    }

    /** Ids in YT's offline databases (every account), or null when none could be read. */
    static Set<String> inYt(Context c) {
        File[] dbs = new File(c.getApplicationInfo().dataDir, "databases").listFiles((d, n) -> n.startsWith("offline") && n.endsWith(".db"));
        if (dbs == null || dbs.length == 0) return null;
        Set<String> ids = new HashSet<>();
        for (File db : dbs) {
            try (SQLiteDatabase d = SQLiteDatabase.openDatabase(db.getPath(), null, SQLiteDatabase.OPEN_READONLY);
                 Cursor cur = d.rawQuery("SELECT id FROM videosV2", null)) {
                while (cur.moveToNext()) ids.add(cur.getString(0));
            } catch (Exception e) {
                // one account's database unreadable: its songs can't be told from deleted ones
                Log.w(TAG, "offline db " + db.getName() + " unreadable: " + e);
                return null;
            }
        }
        return ids;
    }

    /** A song (videosV2) or playlist (playlistsV13) already in YT's downloads, on any account. */
    static boolean inYt(Context c, String id, boolean playlist) {
        File[] dbs = new File(c.getApplicationInfo().dataDir, "databases").listFiles((d, n) -> n.startsWith("offline") && n.endsWith(".db"));
        if (dbs == null) return false;
        String key = playlist && id.startsWith("VL") ? id.substring(2) : id;
        for (File db : dbs) {
            try (SQLiteDatabase d = SQLiteDatabase.openDatabase(db.getPath(), null, SQLiteDatabase.OPEN_READONLY);
                 Cursor cur = d.rawQuery("SELECT 1 FROM " + (playlist ? "playlistsV13" : "videosV2") + " WHERE id = ? LIMIT 1", new String[]{key})) {
                if (cur.moveToFirst()) return true;
            } catch (Exception e) {
                Log.w(TAG, "offline db " + db.getName() + " unreadable: " + e);
            }
        }
        return false;
    }

    /**
     * The song is one of the downloaded playlist's songs in YT's database: true, false, or null when
     * that can't be told yet (the playlist has no songs listed yet, or the database is unreadable).
     */
    static Boolean inPlaylist(Context c, String playlistId, String videoId) {
        File[] dbs = new File(c.getApplicationInfo().dataDir, "databases").listFiles((d, n) -> n.startsWith("offline") && n.endsWith(".db"));
        if (dbs == null) return null;
        String key = playlistId.startsWith("VL") ? playlistId.substring(2) : playlistId;
        boolean listed = false;
        for (File db : dbs) {
            try (SQLiteDatabase d = SQLiteDatabase.openDatabase(db.getPath(), null, SQLiteDatabase.OPEN_READONLY);
                 Cursor cur = d.rawQuery("SELECT video_id = ? FROM playlist_video WHERE playlist_id = ? ORDER BY 1 DESC LIMIT 1", new String[]{videoId, key})) {
                if (cur.moveToFirst()) {
                    if (cur.getInt(0) == 1) return true;
                    listed = true;
                }
            } catch (Exception e) {
                Log.w(TAG, "offline db " + db.getName() + " unreadable: " + e);
                return null;
            }
        }
        return listed ? false : null;
    }

    /** Our copy of the song's saved lyrics (LRC), or null. */
    static synchronized File lyricsFile(Context c, String videoId) {
        init(c);
        String v = props.getProperty(LYRICS + "." + videoId);
        if (v == null) return null;
        String[] p = v.split("\\|", 2);
        File f = new File(p[p.length - 1]);
        return f.length() > 0 ? f : null;
    }

    /**
     * Songs no longer in YT's downloads lose what was saved with them. removed: a song YT just
     * removed, checked however new its record is.
     */
    static synchronized void reconcile(Context c, String removed) {
        init(c);
        Set<String> yt = inYt(c);
        Set<String> ours = new HashSet<>(app.ayham.extension.music.addons.AddonDownloads.ids(c));
        for (String k : props.stringPropertyNames()) ours.add(k.substring(k.indexOf('.') + 1));
        if (yt == null) {
            Log.w(TAG, "offline check skipped: YT's offline database unreadable");
            return;
        }
        // every account's database is read, so a switched account keeps its songs
        if (removed != null && ours.contains(removed) && !yt.contains(removed)) {
            deleteAll(c, removed);
            ours.remove(removed);
        }
        long now = System.currentTimeMillis();
        int gone = 0;
        long again = -1;
        for (String id : ours) {
            if (yt.contains(id)) continue;
            long at = 0;
            try {
                at = Long.parseLong(props.getProperty("at." + id, "0"));
            } catch (NumberFormatException ignored) {
            }
            if (now - at < SETTLE_MS) {
                // checked again once it has settled (no other change may come to trigger it)
                long wait = at + SETTLE_MS - now + 1000;
                if (again < 0 || wait < again) again = wait;
                continue;
            }
            deleteAll(c, id);
            gone++;
        }
        Log.i(TAG, "offline check: " + yt.size() + " songs in YT's downloads, " + gone + " removed songs' files deleted"
                + (again < 0 ? "" : ", new ones checked again in " + again / 1000 + " s"));
        if (again >= 0 && checks != null) {
            checks.removeCallbacks(CHECK);
            checks.postDelayed(CHECK, again);
        }
    }

    /** Deletes everything saved with the song. */
    static synchronized long deleteAll(Context c, String id) {
        long freed = app.ayham.extension.music.addons.AddonDownloads.delete(c, id);
        for (String kind : new String[]{LYRICS, ART, CANVAS}) freed += drop(c, kind, id);
        props.remove("at." + id);
        save();
        OfflineExtras.forget(id);
        Log.i(TAG, "deleted " + id + "'s downloads: " + freed / 1024 + " KB");
        return freed;
    }

    /** Deletes one kind of a song (no save). */
    private static long drop(Context c, String kind, String id) {
        String v = props.getProperty(kind + "." + id);
        if (v == null) return 0;
        props.remove(kind + "." + id);
        long freed = 0;
        if (kind.equals(LYRICS)) {
            for (String p : v.split("\\|")) {
                for (File f : new File[]{new File(p), new File(p + ".raw")}) {
                    if (f.exists()) {
                        freed += f.length();
                        //noinspection ResultOfMethodCallIgnored
                        f.delete();
                    }
                }
            }
        } else {
            CanvasCache.init(c.getFilesDir());
            CanvasCache.remove(kind.equals(ART) ? CanvasCache.idKey(id) : CanvasCache.spotifyIdKey(id));
            File f = new File(v);
            // a clip shared by two songs of one album stays while another uses it
            if (f.exists() && !usedElsewhere(kind, v)) {
                freed += f.length();
                //noinspection ResultOfMethodCallIgnored
                f.delete();
            }
        }
        return freed;
    }

    private static boolean usedElsewhere(String kind, String path) {
        for (String k : props.stringPropertyNames()) if (k.startsWith(kind + ".") && path.equals(props.getProperty(k))) return true;
        return false;
    }

    /** The Clear rows: every downloaded song's things of one kind. */
    public static synchronized long clear(Context c, String kind) {
        init(c);
        long freed = 0;
        for (String k : props.stringPropertyNames()) if (k.startsWith(kind + ".")) freed += drop(c, kind, k.substring(kind.length() + 1));
        // anything left in our folder of that kind (a copy not in the index)
        File sub = new File(dir(c), kind.equals(LYRICS) ? "lyrics" : kind.equals(ART) ? "canvas" : "spotify/canvas");
        File[] fs = sub.listFiles();
        if (fs != null) for (File f : fs) {
            freed += f.length();
            //noinspection ResultOfMethodCallIgnored
            f.delete();
        }
        save();
        Log.i(TAG, "cleared downloaded " + kind + ": " + freed / 1024 + " KB");
        return freed;
    }

    /** Bytes held by one kind. */
    public static synchronized long size(Context c, String kind) {
        init(c);
        long n = 0;
        Set<String> seen = new HashSet<>();
        for (String k : props.stringPropertyNames()) {
            if (!k.startsWith(kind + ".")) continue;
            for (String p : props.getProperty(k).split("\\|")) {
                if (!seen.add(p)) continue;
                n += new File(p).length() + (kind.equals(LYRICS) ? new File(p + ".raw").length() : 0);
            }
        }
        return n;
    }

    static void copy(File from, File to) throws java.io.IOException {
        //noinspection ResultOfMethodCallIgnored
        to.getParentFile().mkdirs();
        try (InputStream in = new FileInputStream(from); OutputStream out = new FileOutputStream(to)) {
            byte[] b = new byte[16384];
            for (int n; (n = in.read(b)) > 0; ) out.write(b, 0, n);
        }
    }
}
