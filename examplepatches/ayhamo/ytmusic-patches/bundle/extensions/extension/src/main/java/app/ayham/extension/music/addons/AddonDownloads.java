package app.ayham.extension.music.addons;

import android.content.Context;
import android.os.Process;
import android.os.SystemClock;
import android.util.Base64;
import android.util.Log;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Properties;

/**
 * Lossless downloads: alongside YT's own download of a song, its lossless file from the user's
 * addons (allowDownloads ones, ±2 s, the bytes checked), fitted to YouTube's audio like playback
 * and kept in files/ayham-downloads with what the fit found (id.json). A downloaded song then plays
 * from its file, offline too. The tier asked for steps down (Best, Hi-Res, CD) when no addon has it;
 * with none, YT's download is all the song has.
 *
 * <p>One worker; the queue is kept on disk, so downloads cut off by the app closing go on at the next start.
 */
public final class AddonDownloads {
    private static final String TAG = AddonPrep.TAG;
    /** The tiers of the popup, in the order they step down. ATMOS only with the Dolby Atmos switch on. */
    public static final String BEST = Pick.LOSSLESS, HIRES = Pick.HIRES, CD = Pick.CD, ATMOS = Pick.DOLBY;
    private static final Deque<String> queue = new ArrayDeque<>();
    private static Thread worker;
    private static Context ctx;
    private static volatile String working;
    /** Failed tries per song this run: a network failure is tried again, at most TRIES times. */
    private static final java.util.Map<String, Integer> tries = new java.util.HashMap<>();
    private static final int TRIES = 3;
    private static java.util.Timer later;

    private AddonDownloads() {
    }

    public static File dir(Context c) {
        return new File(c.getFilesDir(), "ayham-downloads");
    }

    private static File meta(Context c, String id) {
        return new File(dir(c), id + ".json");
    }

    private static File pendingFile(Context c) {
        return new File(dir(c), "pending.properties");
    }

    /** A downloaded file is here for the song. */
    public static boolean has(Context c, String id) {
        if (c == null || id == null) return false;
        try {
            File m = meta(c, id);
            if (!m.exists()) return false;
            return new File(new JSONObject(read(m)).getString("file")).length() > 0;
        } catch (Exception e) {
            return false;
        }
    }

    /** The file's format line for the downloads list ("FLAC 96 kHz/24 bit"), or null. */
    public static String describe(Context c, String id) {
        try {
            JSONObject j = new JSONObject(read(meta(c, id)));
            return j.optString("format", null);
        } catch (Exception e) {
            return null;
        }
    }

    /** Adds a song to download at tier (BEST, HIRES, CD or ATMOS). */
    public static synchronized void enqueue(Context c, String id, String title, String artist, boolean isVideo, String tier) {
        if (c == null || id == null || title == null || title.isEmpty()) return;
        ctx = c.getApplicationContext();
        if (has(c, id) || id.equals(working) || queue.contains(id)) return;
        if (AddonSettings.links(c).isEmpty()) {
            Log.i(TAG, "download " + id + ": no addon links, YouTube's download only");
            return;
        }
        Properties p = pending(c);
        // one line per field: a line break in the artist would shift the title into it
        String a = artist == null ? "" : artist.replace('\r', ' ').replace('\n', ' ');
        p.setProperty(id, tier + "\n" + (isVideo ? "1" : "0") + "\n" + a + "\n" + title);
        savePending(c, p);
        queue.addLast(id);
        start();
    }

    /** At start: downloads left over from the last run go on. */
    public static synchronized void resume(Context c) {
        ctx = c.getApplicationContext();
        Properties p = pending(c);
        for (String id : p.stringPropertyNames()) if (!queue.contains(id)) queue.addLast(id);
        if (!queue.isEmpty()) {
            Log.i(TAG, "downloads: " + queue.size() + " left over from the last run, going on");
            start();
        }
    }

    private static void start() {
        if (worker == null) {
            worker = new Thread(AddonDownloads::work, "addon-downloads");
            worker.start();
        }
        AddonDownloads.class.notifyAll();
    }

    /** The tiers tried for the one asked: each steps down to the next. */
    static String[] steps(String tier) {
        if (ATMOS.equals(tier)) return new String[]{ATMOS, BEST, HIRES, CD};
        if (HIRES.equals(tier)) return new String[]{HIRES, CD};
        if (CD.equals(tier)) return new String[]{CD};
        return new String[]{BEST, HIRES, CD};
    }

    private static void work() {
        try {
            workLoop();
        } finally {
            // a throw past the loop's own catch ends this thread: the next enqueue or retry starts another
            synchronized (AddonDownloads.class) {
                if (worker == Thread.currentThread()) worker = null;
                working = null;
            }
        }
    }

    private static void workLoop() {
        Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND);
        while (true) {
            String id;
            String[] info;
            synchronized (AddonDownloads.class) {
                while (queue.isEmpty()) {
                    try {
                        AddonDownloads.class.wait();
                    } catch (InterruptedException e) {
                        return;
                    }
                }
                id = queue.pollFirst();
                String v = pending(ctx).getProperty(id);
                info = v == null ? null : v.split("\n", 4);
                if (info == null || info.length < 4) continue;
                working = id;
            }
            // no network (a dropped Wi-Fi): wait for it rather than fail every song left; on mobile data
            // with the addons' "Off on mobile data" on, wait for Wi-Fi (protocol.md §8.4.3, the phone's
            // form of Wi-Fi only)
            for (int waited = 0; ; waited++) {
                boolean online = online(ctx), held = online && AddonSettings.offForMobile(ctx);
                if (mayFetch(online, held)) break;
                if (waited == 0) Log.i(TAG, held ? "downloads: on mobile data, waiting for Wi-Fi (Off on mobile data)" : "downloads: offline, waiting for the network");
                SystemClock.sleep(15_000);
            }
            synchronized (AddonDownloads.class) {
                // deleted while it waited for the network
                if (pending(ctx).getProperty(id) == null) {
                    working = null;
                    continue;
                }
            }
            long t0 = SystemClock.elapsedRealtime();
            AddonPrep.Prepared got = null;
            String why = null;
            boolean retry = false;
            try {
                for (String tier : steps(info[0])) {
                    AddonPrep.Download dl = new AddonPrep.Download();
                    dl.tier = tier;
                    dl.dir = dir(ctx);
                    dl.byIsrc = AddonDownloads::byIsrc;
                    got = AddonPrep.prepare(ctx, id, info[3], info[2], "1".equals(info[1]), dl);
                    if (got != null) break;
                    Log.i(TAG, "download " + id + ": no addon has it at " + tier + (tier.equals(info[0]) ? "" : " (stepped down)"));
                }
                if (got != null && !saveIfWanted(id, got, info[3], info[2])) {
                    got = null;
                    why = "deleted while it downloaded: not kept";
                } else if (got == null) why = "no addon has it lossless" + (ATMOS.equals(info[0]) ? " or in Atmos" : "") + ": YouTube's download only";
            } catch (Throwable t) {
                why = Protocol.scrub(String.valueOf(t));
                retry = true;
            }
            synchronized (AddonDownloads.class) {
                working = null;
                int n = tries.containsKey(id) ? tries.get(id) + 1 : 1;
                if (retry && n < TRIES) {
                    // a failure (network, a refused fetch) is tried again in a minute or two; kept on disk meanwhile
                    tries.put(id, n);
                    final String again = id;
                    java.util.TimerTask task = new java.util.TimerTask() {
                        @Override
                        public void run() {
                            // a task that throws cancels the Timer for good: nothing gets out
                            try {
                                synchronized (AddonDownloads.class) {
                                    if (pending(ctx).getProperty(again) != null && !queue.contains(again) && !again.equals(working)) {
                                        queue.addLast(again);
                                        start();
                                    }
                                }
                            } catch (Throwable t) {
                                Log.w(TAG, "download " + again + ": the retry failed: " + Protocol.scrub(String.valueOf(t)));
                            }
                        }
                    };
                    if (later == null) later = new java.util.Timer("addon-downloads-retry", true);
                    try {
                        later.schedule(task, 60_000L * n);
                    } catch (IllegalStateException cancelled) {
                        later = new java.util.Timer("addon-downloads-retry", true);
                        later.schedule(task, 60_000L * n);
                    }
                    why += " (tried again in " + n + " min)";
                } else {
                    // "no addon has it", or tried TRIES times: YouTube's download is all it has
                    tries.remove(id);
                    Properties p = pending(ctx);
                    p.remove(id);
                    savePending(ctx, p);
                }
            }
            Log.i(TAG, (got != null ? "downloaded: " + got : "download " + id + ": " + why) + " in " + (SystemClock.elapsedRealtime() - t0) + " ms");
        }
    }

    /**
     * Keeps a finished download unless the song was deleted meanwhile (delete() takes it off the
     * pending list): then its file goes too, or the deleted song would come back.
     */
    private static boolean saveIfWanted(String id, AddonPrep.Prepared got, String title, String artist) throws Exception {
        synchronized (AddonDownloads.class) {
            if (pending(ctx).getProperty(id) != null) {
                save(ctx, got, title, artist);
                return true;
            }
            //noinspection ResultOfMethodCallIgnored
            if (got.file != null && !sharedBy(ctx, got.file)) got.file.delete();
            //noinspection ResultOfMethodCallIgnored
            if (got.wav != null) got.wav.delete();
            return false;
        }
    }

    /** A download fetches only online and not held off by "Off on mobile data". */
    static boolean mayFetch(boolean online, boolean heldByMobile) {
        return online && !heldByMobile;
    }

    @SuppressWarnings("deprecation")
    private static boolean online(Context c) {
        try {
            android.net.ConnectivityManager cm = (android.net.ConnectivityManager) c.getSystemService(Context.CONNECTIVITY_SERVICE);
            android.net.NetworkCapabilities nc = cm.getNetworkCapabilities(cm.getActiveNetwork());
            return nc != null && nc.hasCapability(android.net.NetworkCapabilities.NET_CAPABILITY_INTERNET);
        } catch (Throwable t) {
            return true; // unknown: tried, and a failure is tried again
        }
    }

    /** A file of this recording (ISRC) already downloaded, Atmos or stereo as asked, else null. */
    static File byIsrc(String isrc, Boolean atmos) {
        if (isrc == null || isrc.isEmpty() || ctx == null) return null;
        File[] fs = dir(ctx).listFiles((d, n) -> n.endsWith(".json"));
        if (fs != null) for (File m : fs) {
            try {
                JSONObject j = new JSONObject(read(m));
                if (isrc.equalsIgnoreCase(j.optString("isrc")) && j.optBoolean("atmos", false) == Boolean.TRUE.equals(atmos)) {
                    File f = new File(j.getString("file"));
                    if (f.length() > 0) return f;
                }
            } catch (Exception ignored) {
            }
        }
        return null;
    }

    private static void save(Context c, AddonPrep.Prepared p, String title, String artist) throws Exception {
        JSONObject j = new JSONObject();
        j.put("title", title).put("artist", artist);
        j.put("file", p.file.getAbsolutePath()).put("addon", p.addon).put("host", p.host).put("row", p.rowId)
                .put("offset", p.offsetSec).put("gain", p.gainDb)
                .put("want", p.gain == null || Double.isNaN(p.gain.wantDb) ? p.gainDb : p.gain.wantDb).put("ytDur", p.ytDurationSec).put("addonDur", p.addonDurationSec)
                .put("score", p.score).put("rate", p.rate).put("channels", p.channels).put("codec", p.codec)
                .put("isrc", p.isrc).put("tier", p.tier).put("atmos", p.atmos).put("at", System.currentTimeMillis());
        byte[] head = new byte[1 << 16];
        int n;
        try (InputStream in = new FileInputStream(p.file)) {
            n = in.read(head);
        }
        Fetch.Info i = p.atmos ? Fetch.dolby(head, Math.max(0, n)) : Fetch.info(head, Math.max(0, n));
        if (i != null) j.put("format", i.toString());
        if (p.env != null) {
            ByteBuffer b = ByteBuffer.allocate(p.env.length * 4).order(ByteOrder.LITTLE_ENDIAN);
            for (float v : p.env) b.putFloat(v);
            j.put("env", Base64.encodeToString(b.array(), Base64.NO_WRAP));
        }
        write(meta(c, p.id), j.toString());
    }

    /** A downloaded song, ready to play: its deck PCM written again (the cache is cleared at start). */
    static AddonPrep.Prepared load(Context c, String id) throws Exception {
        JSONObject j = new JSONObject(read(meta(c, id)));
        AddonPrep.Prepared p = new AddonPrep.Prepared();
        p.id = id;
        p.saved = true;
        p.file = new File(j.getString("file"));
        if (p.file.length() == 0) throw new IOException("the downloaded file is gone");
        p.addon = j.optString("addon");
        p.host = j.optString("host");
        p.rowId = j.optString("row", null);
        p.offsetSec = j.getDouble("offset");
        p.gainDb = j.getDouble("gain");
        p.ytDurationSec = j.getDouble("ytDur");
        p.addonDurationSec = j.optDouble("addonDur", 0);
        p.score = j.optDouble("score", 0);
        p.rate = j.getInt("rate");
        p.channels = j.getInt("channels");
        p.codec = j.optString("codec");
        p.isrc = j.optString("isrc", null);
        p.tier = j.optString("tier", null);
        p.atmos = j.optBoolean("atmos", false);
        String env = j.optString("env", "");
        if (!env.isEmpty()) {
            ByteBuffer b = ByteBuffer.wrap(Base64.decode(env, Base64.NO_WRAP)).order(ByteOrder.LITTLE_ENDIAN);
            p.env = new float[b.remaining() / 4];
            for (int k = 0; k < p.env.length; k++) p.env[k] = b.getFloat();
        }
        if (p.atmos) {
            // Dolby Atmos plays from our decode of it (AtmosWav), a WAV in the cache deleted with the song
            // the same boost as for playback, toward YouTube's loudness under the limiter
            double db = AtmosWav.boostDb(p.gainDb, j.optDouble("want", p.gainDb));
            p.wav = AtmosWav.decode(p.file, new File(AddonPrep.dir(c), id + ".atmos.wav"), db);
            p.gainDb = db;
            p.file = p.wav;
            p.bakedDb = p.gainDb;
            p.gainDb = 0;
        }
        try {
            app.ayham.extension.music.automix.AddonPcm.write(c, p);
        } catch (Throwable t) {
            if (p.wav != null) //noinspection ResultOfMethodCallIgnored
                p.wav.delete();
            throw t;
        }
        Log.i(TAG, "downloaded file of " + id + " loaded: " + p.file.getName());
        return p;
    }

    /** The song's download was deleted: its file goes (unless another song's ISRC shares it). */
    public static synchronized long delete(Context c, String id) {
        if (c == null || id == null) return 0;
        Properties pend = pending(c);
        if (pend.remove(id) != null) savePending(c, pend);
        queue.remove(id);
        File m = meta(c, id);
        long freed = 0;
        if (m.exists()) {
            try {
                File f = new File(new JSONObject(read(m)).getString("file"));
                //noinspection ResultOfMethodCallIgnored
                m.delete();
                if (!sharedBy(c, f) && f.exists()) {
                    freed = f.length();
                    //noinspection ResultOfMethodCallIgnored
                    f.delete();
                }
            } catch (Exception e) {
                //noinspection ResultOfMethodCallIgnored
                m.delete();
            }
        }
        // a file left half-fetched for it
        File[] parts = dir(c).listFiles((d, n) -> n.startsWith(id + ".") && n.endsWith(".part"));
        if (parts != null) for (File f : parts) //noinspection ResultOfMethodCallIgnored
            f.delete();
        AddonPrep.forget(id);
        return freed;
    }

    /** A downloaded file to export: the file, and "Artist - Title" for its name. */
    public static final class Saved {
        public String id, name, format;
        public File file;
    }

    /** The downloaded files, one per song. */
    public static java.util.List<Saved> saved(Context c) {
        java.util.List<Saved> out = new java.util.ArrayList<>();
        File[] fs = dir(c).listFiles((d, n) -> n.endsWith(".json"));
        if (fs != null) for (File m : fs) {
            try {
                JSONObject j = new JSONObject(read(m));
                Saved s = new Saved();
                s.id = m.getName().substring(0, m.getName().length() - 5);
                s.file = new File(j.getString("file"));
                if (s.file.length() == 0) continue;
                String t = j.optString("title", ""), a = j.optString("artist", "");
                s.name = t.isEmpty() ? s.id : a.isEmpty() ? t : a + " - " + t;
                s.format = j.optString("format", null);
                out.add(s);
            } catch (Exception ignored) {
            }
        }
        return out;
    }

    /** The ids with a download record. */
    public static java.util.List<String> ids(Context c) {
        java.util.List<String> out = new java.util.ArrayList<>();
        File[] fs = dir(c).listFiles((d, n) -> n.endsWith(".json"));
        if (fs != null) for (File f : fs) out.add(f.getName().substring(0, f.getName().length() - 5));
        out.addAll(pending(c).stringPropertyNames());
        return out;
    }

    private static boolean sharedBy(Context c, File f) {
        File[] fs = dir(c).listFiles((d, n) -> n.endsWith(".json"));
        if (fs != null) for (File m : fs) {
            try {
                if (f.getAbsolutePath().equals(new JSONObject(read(m)).getString("file"))) return true;
            } catch (Exception ignored) {
            }
        }
        return false;
    }

    private static Properties pending(Context c) {
        Properties p = new Properties();
        File f = pendingFile(c);
        if (f.exists()) {
            try (InputStream in = new FileInputStream(f)) {
                p.load(in);
            } catch (Exception e) {
                Log.w(TAG, "downloads: pending list unreadable", e);
            }
        }
        return p;
    }

    private static void savePending(Context c, Properties p) {
        try {
            if (p.isEmpty()) {
                //noinspection ResultOfMethodCallIgnored
                pendingFile(c).delete();
                return;
            }
            ByteArrayOut out = new ByteArrayOut();
            p.store(out, "Ayham: lossless downloads not done yet");
            write(pendingFile(c), out.toString("ISO-8859-1"));
        } catch (Exception e) {
            Log.w(TAG, "downloads: pending list not saved", e);
        }
    }

    private static final class ByteArrayOut extends java.io.ByteArrayOutputStream {
    }

    static String read(File f) throws IOException {
        try (InputStream in = new FileInputStream(f)) {
            java.io.ByteArrayOutputStream b = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            for (int n; (n = in.read(buf)) > 0; ) b.write(buf, 0, n);
            return b.toString("UTF-8");
        }
    }

    /** Written next to it and moved over it, so a kill mid-write leaves the old one whole. */
    static void write(File f, String text) throws IOException {
        //noinspection ResultOfMethodCallIgnored
        f.getParentFile().mkdirs();
        File tmp = new File(f.getPath() + ".tmp");
        try (OutputStream o = new FileOutputStream(tmp)) {
            o.write(text.getBytes(StandardCharsets.UTF_8));
        }
        if (!tmp.renameTo(f)) {
            //noinspection ResultOfMethodCallIgnored
            tmp.delete();
            throw new IOException("could not write " + f.getName());
        }
    }
}
