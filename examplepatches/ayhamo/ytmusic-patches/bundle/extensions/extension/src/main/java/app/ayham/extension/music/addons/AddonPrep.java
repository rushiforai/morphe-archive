package app.ayham.extension.music.addons;

import android.content.Context;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Gets a song's addon file ready before it is needed (protocol.md §8, the phone's Direct mode):
 * YouTube's own copy decoded, the addons raced at once (find, open, probe; AddonClient.race), and
 * the picked row fitted to YouTube's audio and levelled by RMS against YouTube's copy
 * (offset-map.md). A stereo file is streamed: only a 12 s audition window is read through
 * StreamCache and fitted, and the player reads the rest as it plays. HLS and DASH, Dolby Atmos
 * and downloads are fetched whole into a local file, decoded by the same decoder that plays it.
 * A row that doesn't fit is refused and the next row, then the next addon, is tried. The result: the local file, its offset and its gain; also its
 * opening and end as deck PCM on YouTube's timeline, for automix.
 *
 * <p>One worker, the playing song first, then the next one.
 */
public final class AddonPrep {
    static final String TAG = "AyhamAddons";
    /** Files kept: the playing song, the next one, and two before. */
    private static final int KEEP = 4;
    /** A failed song is not tried again for this long. */
    private static final long RETRY_MS = 10 * 60_000;

    /** A song ready to play from an addon. */
    public static final class Prepared {
        public String id, addon, host, rowId;
        public File file;
        /** addonTime = youtubeTime + offsetSec. */
        public double offsetSec, gainDb, ytDurationSec, addonDurationSec, score;
        public OffsetFit.Gain gain;
        public int rate, channels;
        public String codec;
        /** A downloaded song (AddonDownloads): its file is kept when it leaves memory. */
        public boolean saved;
        /** Downloads: the row's ISRC and the tier asked for (a streamed copy: playback's tier, for the upgrade pass). */
        public String isrc, tier;
        /** Streamed from a file already in the persistent cache (protocol.md 8.1.6): its upgrade pass asks only the addons above it (8.2.1). */
        public boolean cached;
        /** Dolby Atmos from the addon (the switch on, or an Atmos download): its decoder's 2-channel render plays. */
        public boolean atmos;
        /** The file's loudness (dBFS, mono RMS) every ENV_HOP seconds of its own time: where it is quiet. */
        public volatile float[] env;
        public static final double ENV_HOP = Envelope.HOP;

        /**
         * The quietest ENV_HOP of the file between YouTube times [fromSec, toSec), as YouTube
         * seconds; NaN when the window is outside the file.
         */
        public double quietest(double fromSec, double toSec) {
            if (env == null) return Double.NaN;
            int a = (int) Math.max(0, Math.ceil((fromSec + offsetSec) / ENV_HOP)), b = (int) Math.min(env.length, Math.floor((toSec + offsetSec) / ENV_HOP));
            int best = -1;
            for (int i = a; i < b; i++) if (best < 0 || env[i] < env[best]) best = i;
            return best < 0 ? Double.NaN : best * ENV_HOP - offsetSec;
        }

        /** The file's level at YouTube time sec (dBFS), or 0 outside it. */
        public float levelAt(double sec) {
            int i = (int) Math.floor((sec + offsetSec) / ENV_HOP);
            return env == null || i < 0 || i >= env.length ? 0f : env[i];
        }

        /**
         * The gain our player and the mix decks apply: at most 0 dB, since the player's volume stops at
         * 1 and a boost the decks alone had would step the level at a takeover or hand-over.
         */
        public float gainLinear() {
            return (float) Math.pow(10, Math.min(0, gainDb) / 20);
        }

        /**
         * The boost over 0 dB (offset-map.md, Level: at most +6 dB, lowered until the true peak stays
         * at or under -1 dBTP; the fit's gainDb is that). The player's volume stops at 1, so our
         * player applies it with Android's LoudnessEnhancer and the decks in their samples: 0 for a
         * cut, or for our own decode, which has it baked in.
         */
        public double boostDb() {
            return ownDecode() ? 0 : Math.max(0, gainDb);
        }

        /** Dolby Atmos: the fit's gain, in the WAV's samples (AtmosWav); gainDb is then 0. */
        public double bakedDb;
        /**
         * Streamed (not Atmos, not a download): no file of its own; the player reads the addon's
         * audio in ranges through this cache entry (StreamCache), released when the song goes.
         */
        public StreamCache.Entry stream;

        /** Pick.qualityRank of its stream (0 lossy, 1 lossless, 2 Hi-Res), -1 unknown: the lossless pass (8.2.1). */
        public int rank = -1;

        /** Dolby Atmos: the WAV our decode was written to (AtmosWav), deleted with the song even when saved. */
        public File wav;

        /** Dolby Atmos played from our own decode (AtmosWav), not from the addon's file. */
        public boolean ownDecode() {
            return atmos && wav != null && wav.equals(file);
        }

        @Override
        public String toString() {
            return String.format(Locale.US, "%s via %s: offset %+.4f s, gain %+.2f dB%s, %s%s %d Hz %d ch, score %.3f", id, addon, offsetSec,
                    gainDb + bakedDb, gain != null && gain.capped != null ? " (" + gain.capped + ")" : "", atmos ? "Dolby Atmos " : "", codec, rate, channels, score)
                    + (ownDecode() ? " (from our decode)" : "") + (stream != null ? " (streamed)" : "");
        }
    }

    /** Mono RMS in dBFS per HOP seconds, in order. */
    static final class Envelope {
        static final double HOP = 0.05;
        private int hop;
        private double acc;
        private int n;
        private float[] out = new float[4096];
        private int len;

        void format(int rate) {
            hop = Math.max(1, (int) Math.round(rate * HOP));
        }

        void add(float[][] planar, int frames) {
            int ch = planar.length;
            for (int f = 0; f < frames; f++) {
                float s = 0;
                for (int c = 0; c < ch; c++) s += planar[c][f];
                s /= ch;
                acc += s * (double) s;
                if (++n == hop) push();
            }
        }

        private void push() {
            if (len == out.length) out = java.util.Arrays.copyOf(out, len * 2);
            out[len++] = (float) (10 * Math.log10(acc / n + 1e-12));
            acc = 0;
            n = 0;
        }

        float[] done() {
            if (n > 0) push();
            return java.util.Arrays.copyOf(out, len);
        }
    }

    private static final Map<String, Prepared> ready = new LinkedHashMap<>();
    private static final Map<String, Long> failedAt = new HashMap<>();
    private static final Map<String, String[]> asked = new HashMap<>();
    private static final Deque<String> queue = new ArrayDeque<>();
    private static volatile String working;
    private static volatile Thread worker;
    /** The playing song and the next one, as last asked: work on any other song is dropped. */
    private static volatile String current, upNext;
    /** Songs the user set to YouTube's quality (the player's menu), this run. */
    private static final java.util.Set<String> youtubeOnly = java.util.concurrent.ConcurrentHashMap.newKeySet();

    /** Work dropped because its song is no longer the playing or next one (or set to YouTube's quality). */
    static final class Stale extends IOException {
        Stale() {
            super("no longer playing or next");
        }
    }

    /** No row was opened because an addon's /stream budget ran out (§4a): tried again soon, not a failure. */
    static final class Limited extends IOException {
        Limited() {
            super("stream limit reached");
        }
    }

    /** A song passed over for the stream limit is tried again after this. */
    private static final long LIMIT_RETRY_MS = 60_000;

    /** On the prep worker: its song is no longer wanted. Downloads (another thread) never are. */
    private static boolean stale() {
        String id = working;
        return Thread.currentThread() == worker && id != null
                && ((!id.equals(current) && !id.equals(upNext)) || youtubeOnly.contains(id));
    }
    private static Context ctx;
    private static AddonClient client;

    private AddonPrep() {
    }

    /** Set while automix mixes: the decodes wait, so the mix's audio thread has the CPU. */
    public static volatile boolean held;

    /** Called between decoded blocks; throws Stale when the song being prepared is no longer wanted. */
    public static void waitWhileHeld() throws IOException {
        if (stale()) throw new Stale();
        while (held) {
            // a mix can hold for its whole length: a song skipped meanwhile stops here too
            if (stale()) throw new Stale();
            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();   // kept for the caller to see
                return;
            }
        }
    }

    public static synchronized Prepared get(String id) {
        return id == null ? null : ready.get(id);
    }

    /** Being prepared now (the badge's "Upgrading Quality" for the playing song). */
    public static boolean busy(String id) {
        return id != null && id.equals(working);
    }

    // editor.md §11 rule 6: the stage of the copy being prepared for playback (downloads aren't shown)
    public static final String ASKING = "asking", FETCHING = "fetching", FITTING = "fitting";
    private static volatile String stageId, stage;
    private static volatile boolean stageLossless;

    /** The last copy fetched for playback, and whether it is lossless: the take-over's wording. */
    private static volatile String copyId;
    private static volatile boolean copyLossless;

    /** Whether the song's copy is lossless, as the row words it (editor.md §11 rule 6). */
    public static boolean losslessCopy(String id) {
        return id != null && id.equals(copyId) && copyLossless;
    }

    private static void stage(String id, String st, Protocol.Stream s) {
        stageLossless = s != null && lossless(s);
        if (s != null) {
            copyLossless = stageLossless;
            copyId = id;
        }
        stage = st;
        stageId = id;
    }

    /** The copy is read: now lined up with YouTube's (only a playback copy has a stage). */
    private static void fitting(String id) {
        if (id.equals(stageId)) stage = FITTING;
    }

    private static void stageOver(String id) {
        if (id.equals(stageId)) {
            stageId = null;
            stage = null;
        }
    }

    /** A FLAC, ALAC, WAV or AIFF copy, or one with a stated bit depth (editor.md §11 rule 6). */
    static boolean lossless(Protocol.Stream s) {
        String c = s.codec == null ? "" : s.codec.toLowerCase(Locale.ROOT);
        return c.startsWith("flac") || c.startsWith("alac") || c.startsWith("wav") || c.startsWith("aiff") || c.startsWith("pcm")
                || (s.bitDepth != null && s.bitDepth > 0);
    }

    /** The song's copy being prepared now: {ASKING, FETCHING or FITTING, "lossless" or ""}, or null. */
    public static String[] stageOf(String id) {
        String st = stage;
        return id != null && id.equals(stageId) && st != null ? new String[]{st, stageLossless ? "lossless" : ""} : null;
    }

    /** Being prepared, or waiting its turn: the badge says "Upgrading Quality" from the start. */
    public static synchronized boolean waiting(String id) {
        return id != null && (id.equals(working) || queue.contains(id));
    }

    /** The player's menu: this song plays YouTube's own audio (this run, until upgraded again). */
    public static synchronized void useYouTube(String id) {
        if (id == null) return;
        youtubeOnly.add(id);
        queue.remove(id);
        Log.i(TAG, id + ": YouTube's quality chosen");
    }

    /** The player's menu: look again now, even for a song that failed or was set to YouTube's quality. */
    public static synchronized void upgrade(String id) {
        if (id == null) return;
        youtubeOnly.remove(id);
        failedAt.remove(id);
        rowsRefused.remove(id);
        // protocol.md 8.1.7: its remembered answers and kept files go, so it is found and fetched afresh
        String[] info = asked.get(id);
        java.util.Set<String> rows = rowsTried.get(id);
        java.util.List<String> keys = new ArrayList<>();
        java.util.List<String> ids = new ArrayList<>();
        if (rows != null) for (String r : rows) {
            String[] hr = r.split("\t", 2);
            ids.add(hr[1]);
            keys.add(StreamCache.key(hr[0], hr[1] + "_"));
        }
        int answers = client().forgetSong(info == null ? null : info[0], ids);
        int files = ctx == null || keys.isEmpty() ? 0 : StreamCache.drop(ctx, keys);
        Prepared p = ready.get(id);
        boolean playing = p != null && app.ayham.extension.music.automix.AddonDirect.inUse(id);
        if (p != null && !playing) {
            ready.remove(id);
            deleteFiles(p);
        }
        Log.i(TAG, id + ": upgrade asked (" + answers + " remembered answers and " + files + " kept files dropped)"
                + (playing ? "; the playing copy stays until a new one is ready" : ""));
        if (playing) pass(id, new Pass(p, -1, false));
        else if (info != null) request(ctx, id, info[0], info[1], "1".equals(info[2]), id.equals(current));
    }

    /**
     * A second look for a song whose copy plays: "Upgrade quality" (8.1.7, any copy) or the lossless
     * pass (8.2.1: better than the playing one, its row left out). The playing copy stays in ready
     * until a new one is; it is then kept here until our player leaves it (retire).
     */
    static final class Pass {
        final Prepared old;
        final int minRank;
        final boolean leaveOut;
        /** 8.2.1, after a cached copy: only the addons ranked above the one it came from are asked. */
        final boolean aboveOnly;

        Pass(Prepared old, int minRank, boolean leaveOut) {
            this(old, minRank, leaveOut, false);
        }

        Pass(Prepared old, int minRank, boolean leaveOut, boolean aboveOnly) {
            this.old = old;
            this.minRank = minRank;
            this.leaveOut = leaveOut;
            this.aboveOnly = aboveOnly;
        }

        /** The same pass for the copy playing now (an earlier pass replaced the one it was asked for). */
        Pass on(Prepared now) {
            return now == null || now == old ? this : new Pass(now, minRank, leaveOut, aboveOnly);
        }

        /** Why this answer can't replace the playing copy, or null. */
        String refuse(AddonClient.Opened o) {
            if (leaveOut && old.rowId != null && o.row != null && old.rowId.equals(o.row.id) && old.host != null && old.host.equals(o.addon.host))
                return "the playing copy";
            if (minRank >= 0 && Pick.qualityRank(o.stream) < minRank) return "not better than the playing copy";
            return null;
        }
    }

    private static final Map<String, Pass> passes = new HashMap<>();
    /**
     * Copies replaced while our player was on them: released when it leaves them (retire). A list:
     * a second pass before the player moved would otherwise drop the first copy unreleased.
     */
    private static final Map<String, List<Prepared>> replaced = new HashMap<>();
    /** Songs whose lossless pass ran (once per song). */
    private static final java.util.Set<String> passDone = new java.util.HashSet<>();

    private static synchronized void pass(String id, Pass ps) {
        if (ctx == null || !asked.containsKey(id)) return;
        passes.put(id, ps);
        queue.remove(id);
        if (id.equals(current)) queue.addFirst(id);
        else queue.addLast(id);
        if (worker == null) {
            worker = new Thread(AddonPrep::work, "addon-prep");
            worker.start();
        }
        AddonPrep.class.notifyAll();
    }

    /**
     * Our player is on this copy (AddonDirect): one pass when Pick.upgradeWanted asks for it
     * (protocol.md 8.2.1): a lossy one, every addon again for lossless or better, its row left out;
     * a cached one under the tier asked, only the addons ranked above it, for better. Once per song.
     */
    public static synchronized void playing(Prepared p) {
        if (p == null || p.saved || p.atmos || p.rank < 0 || passes.containsKey(p.id) || p.id.equals(working)) return;
        Pick.Upgrade u = Pick.upgradeWanted(p.rank, p.tier != null ? p.tier : Pick.LOSSLESS, p.cached);
        if (u == null || !passDone.add(p.id)) return;
        if (passDone.size() > 200) passDone.clear();
        Log.i(TAG, p.id + ": " + (u.aboveOnly ? "a cached copy under the tier asked" : "a lossy copy") + " plays (" + p.addon + ", " + p.codec + "): one pass for "
                + (u.aboveOnly ? "better, from the addons ranked above it" : "lossless"));
        pass(p.id, new Pass(p, u.minRank, true, u.aboveOnly));
    }

    /** Our player left a copy a better one replaced: its stream and files go. */
    public static synchronized void retire(Prepared old) {
        List<Prepared> l = old == null ? null : replaced.get(old.id);
        if (l == null || !l.contains(old)) return;
        // the player is on the ready copy now: every copy replaced before it goes
        replaced.remove(old.id);
        for (Prepared x : l) deleteFiles(x);
    }

    /** The rows tried for a song (host, a tab, rowId), for "Upgrade quality". */
    private static final Map<String, java.util.Set<String>> rowsTried = new java.util.concurrent.ConcurrentHashMap<>();
    /**
     * The rows (the addon's base, a tab, rowId; in memory only, never logged: the base holds the
     * key) the fit or the fetch refused for a song (protocol.md 8.1.4: per row and per song): not
     * opened again for it, the lossless pass included; "Upgrade quality" clears them (extension
     * audit M13).
     */
    private static final Map<String, java.util.Set<String>> rowsRefused = new java.util.concurrent.ConcurrentHashMap<>();

    private static void refusedRow(String id, AddonClient.Opened o) {
        if (o.row == null || o.row.id == null) return;
        if (rowsRefused.size() > 200 && !rowsRefused.containsKey(id)) rowsRefused.clear();
        rowsRefused.computeIfAbsent(id, k -> java.util.concurrent.ConcurrentHashMap.newKeySet()).add(o.addon.base + "\t" + o.row.id);
    }

    public static boolean youtubeChosen(String id) {
        return id != null && youtubeOnly.contains(id);
    }

    public static synchronized boolean failed(String id) {
        if (id != null && youtubeOnly.contains(id)) return true;
        Long at = failedAt.get(id);
        return at != null && SystemClock.elapsedRealtime() - at < RETRY_MS;
    }

    /** Playback gave up on it (the file stalled or errored): not played from the addon again soon. */
    public static synchronized void dropped(String id, String why) {
        Prepared p = ready.remove(id);
        // its file deleted under it (a storage cleanup, a file manager): searched and opened once
        // more on the next tick, not YouTube's audio for RETRY_MS (the PC's f8b8b96); a second
        // loss of the same song is a failure as any other
        if (p != null && gone(p) && lostOnce.add(id)) {
            Log.w(TAG, "dropped " + id + ": its file is gone (" + why + "); searched again");
            if (p.saved) deleteQuietly(p.wav);
            else deleteFiles(p);
            return;
        }
        if (p != null && p.saved) {
            // a downloaded file stays (only this play falls back to YouTube)
            failedAt.put(id, SystemClock.elapsedRealtime());
            Log.w(TAG, "dropped downloaded " + id + " for now: " + why);
            deleteQuietly(p.wav);   // an Atmos download's decode, in the cache: made again on its next load
            return;
        }
        failedAt.put(id, SystemClock.elapsedRealtime());
        Log.w(TAG, "dropped " + id + ": " + why);
        if (p != null) deleteFiles(p);
    }

    /** Songs whose copy was lost once (dropped): the next loss is a failure. */
    private static final java.util.Set<String> lostOnce = new java.util.HashSet<>();

    /** The copy a player reads is gone: a streamed row's bytes, or the file itself. */
    static boolean gone(Prepared p) {
        if (p.stream != null) return p.stream.lost();
        // an Atmos copy plays its decoded wav: that gone (the cache cleaned) is decoded again once
        if (p.wav != null && (!p.wav.isFile() || p.wav.length() == 0)) return true;
        return p.file == null || !p.file.isFile() || p.file.length() == 0;
    }

    /**
     * Asks for a song. now: the playing song (goes first). Title and artist from YT's queue;
     * isVideo when it is a music video (looser length match).
     */
    public static synchronized void request(Context c, String id, String title, String artist, boolean isVideo, boolean now) {
        if (c == null || id == null || title == null || artist == null || !AddonSettings.on()) return;
        ctx = c.getApplicationContext();
        if (now) current = id;
        else upNext = id;
        if (ready.containsKey(id) || id.equals(working) || failed(id)) return;
        asked.put(id, new String[]{title, artist, isVideo ? "1" : "0"});
        if (queue.contains(id)) {
            if (now) {
                queue.remove(id);
                queue.addFirst(id);
            }
        } else if (now) {
            queue.addFirst(id);
        } else {
            queue.addLast(id);
        }
        while (queue.size() > 3) queue.pollLast();
        if (worker == null) {
            worker = new Thread(AddonPrep::work, "addon-prep");
            worker.start();
        }
        AddonPrep.class.notifyAll();
    }

    /** Songs whose searches ran ahead (findAhead), once each. */
    private static final java.util.Set<String> foundAhead = java.util.concurrent.ConcurrentHashMap.newKeySet();

    /**
     * The read-ahead (protocol.md 8.1.3): the next song's searches as soon as the queue shows it,
     * no /stream call (its answers wait in the client's cache); its OPEN, fetch and fit start 25 s
     * before the transition (request).
     */
    public static void findAhead(Context c, String id, String title, String artist, boolean isVideo) {
        if (c == null || id == null || title == null || artist == null || !AddonSettings.on()) return;
        if (get(id) != null || failed(id)) return;   // ready is read under the lock
        if (foundAhead.size() > 64) foundAhead.clear();
        if (!foundAhead.add(id)) return;
        final Context app = c.getApplicationContext();
        Thread th = new Thread(() -> {
            try {
                TrackMatcher.Target t = new TrackMatcher.Target();
                t.title = title;
                t.artist = artist;
                t.isVideo = isVideo;
                List<AddonClient.Addon> addons = new ArrayList<>();
                for (String l : AddonSettings.links(app)) addons.add(new AddonClient.Addon(l));
                AddonClient.Options opt = new AddonClient.Options();
                opt.atmos = AddonSettings.atmos();
                long t0 = SystemClock.elapsedRealtime();
                AddonClient.FindResult f = client().find(t, addons, opt);
                Log.i(TAG, id + ": searched ahead: " + f.found.size() + " addons have it (" + (SystemClock.elapsedRealtime() - t0) + " ms); its /stream waits for the last 25 s");
            } catch (Throwable e) {
                Log.w(TAG, id + ": search ahead failed: " + Protocol.scrub(String.valueOf(e)));
            }
        }, "addon-find-ahead");
        th.setPriority(Thread.MIN_PRIORITY);
        th.start();
    }

    private static synchronized AddonClient client() {
        if (client == null) client = AddonClient.create(line -> Log.i(TAG, Protocol.scrub(line)));
        return client;
    }

    private static void work() {
        try {
            workLoop();
        } finally {
            // a throw past the loop's own catches ends this thread: the next request starts another
            synchronized (AddonPrep.class) {
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
            Pass ps;
            synchronized (AddonPrep.class) {
                while (queue.isEmpty()) {
                    try {
                        AddonPrep.class.wait();
                    } catch (InterruptedException e) {
                        return;
                    }
                }
                id = queue.pollFirst();
                info = asked.get(id);
                // taken with its song: a pass asked while this one runs ("Upgrade quality" during the
                // lossless pass) stays in passes for its own turn, and isn't the one handled below
                ps = passes.remove(id);
                if (info == null || (ready.containsKey(id) && ps == null) || !AddonSettings.on()) continue;
                if (ps != null) ps = ps.on(ready.get(id));
                working = id;
            }
            // the start's sweep of an earlier run's files (clearCache) ends before this song writes any
            awaitCleared();
            long t0 = SystemClock.elapsedRealtime();
            Prepared p = null;
            String why;
            boolean dropped = false, limited = false, decksDue = false;
            try {
                if (AddonDownloads.has(ctx, id)) p = AddonDownloads.load(ctx, id);
                else {
                    p = prepare(ctx, id, info[0], info[1], "1".equals(info[2]), null, ps);
                    // a streamed song has no file to write deck audio from: a mix takes YouTube's
                    decksDue = p != null && p.stream == null;
                }
                why = p == null ? "no addon has a file that fits" : null;
                if (p == null && stale()) throw new Stale();
                if (p != null && p.atmos && !p.saved && !AddonSettings.atmos()) {
                    // the Dolby Atmos switch went off while it was prepared: asked again, in stereo
                    deleteFiles(p);
                    p = null;
                    throw new Stale();
                }
            } catch (Stale t) {
                // skipped past: the playing song goes first; this one is asked again if it comes back
                why = t.getMessage();
                dropped = true;
            } catch (Limited t) {
                why = t.getMessage() + ": tried again in " + LIMIT_RETRY_MS / 1000 + " s";
                limited = true;
            } catch (Throwable t) {
                why = Protocol.scrub(String.valueOf(t));
                Log.w(TAG, "prepare " + id + " failed: " + why);
            }
            if (ps != null) {
                synchronized (AddonPrep.class) {
                    working = null;
                    if (p != null && ready.get(id) == ps.old) {
                        ready.put(id, p);
                        if (app.ayham.extension.music.automix.AddonDirect.inUse(id)) replaced.computeIfAbsent(id, k -> new ArrayList<>()).add(ps.old);
                        else deleteFiles(ps.old);
                    } else if (p != null) {
                        deleteFiles(p);   // the song went meanwhile
                        p = null;
                        why = "the playing copy went meanwhile";
                    }
                }
                Log.i(TAG, id + ": " + (ps.minRank >= 0 ? "lossless pass" : "upgrade") + ": "
                        + (p != null ? "a new copy replaces the playing one: " + p : "nothing better (" + why + "); the playing copy stays")
                        + " in " + (SystemClock.elapsedRealtime() - t0) + " ms");
                continue;
            }
            synchronized (AddonPrep.class) {
                working = null;
                if (p != null && p.atmos && !p.saved && !AddonSettings.atmos()) {
                    deleteFiles(p);
                    p = null;
                    dropped = true;
                    why = "Dolby Atmos switched off";
                }
                if (p != null) {
                    ready.put(id, p);
                    // the eldest first, never one our player is on (its next seek reopens the file)
                    java.util.Iterator<Map.Entry<String, Prepared>> it = ready.entrySet().iterator();
                    while (ready.size() > KEEP && it.hasNext()) {
                        Map.Entry<String, Prepared> e = it.next();
                        if (app.ayham.extension.music.automix.AddonDirect.inUse(e.getKey())) continue;
                        it.remove();
                        deleteFiles(e.getValue());
                    }
                } else if (limited) {
                    failedAt.put(id, SystemClock.elapsedRealtime() - RETRY_MS + LIMIT_RETRY_MS);
                } else if (!dropped) {
                    failedAt.put(id, SystemClock.elapsedRealtime());
                } else if (!app.ayham.extension.music.automix.AddonDirect.inUse(id)) {
                    for (File x : filesOf(ctx, id)) deleteQuietly(x);
                }
            }
            Log.i(TAG, (p != null ? "ready: " + p : dropped ? "dropped " + id + ": " + why : "not from an addon: " + id + " (" + why + ")") + " in " + (SystemClock.elapsedRealtime() - t0) + " ms");
            // after the badge flips (it was ~45 s of the wait): a mix before it is done takes
            // YouTube's audio on its decks (Engine.build), as for any song without them
            if (decksDue && p != null && get(id) == p) {
                try {
                    app.ayham.extension.music.automix.AddonPcm.write(ctx, p);
                } catch (Throwable t) {
                    Log.w(TAG, "deck audio of " + id + " not written (a mix takes YouTube's): " + Protocol.scrub(String.valueOf(t)));
                }
            }
        }
    }

    /** The fetched files of a song not prepared (whatever their extension; Atmos: its WAV too). */
    private static File[] filesOf(Context c, String id) {
        File[] fs = dir(c).listFiles((d, n) -> n.startsWith(id + ".") && !n.endsWith(".part"));
        return fs == null ? new File[0] : fs;
    }

    private static void deleteQuietly(File f) {
        //noinspection ResultOfMethodCallIgnored
        if (f != null) f.delete();
    }

    private static void deleteFiles(Prepared p) {
        if (p == null) return;
        //noinspection ResultOfMethodCallIgnored
        if (!p.saved && p.file != null) p.file.delete();
        deleteQuietly(p.wav);
        if (p.stream != null) StreamCache.release(p.stream);
        app.ayham.extension.music.automix.AddonPcm.delete(ctx, p.id);
    }

    /** At start: files prepared by an earlier run are no longer known (kept only in memory), so they go. */
    public static void clearCache(Context c) {
        Thread t = new Thread(() -> {
            int n = 0;
            for (File d : new File[]{dir(c), new File(c.getCacheDir(), "addons/yt")}) {
                File[] fs = d.listFiles();
                if (fs != null) for (File f : fs) if (f.isFile() && f.delete()) n++;
            }
            File[] pcm = new File(c.getCacheDir(), "automix/pcm").listFiles();
            if (pcm != null) for (File f : pcm) {
                String name = f.getName();
                if ((name.endsWith(".ahead") || name.endsWith(".atail") || name.endsWith(".ahead.part") || name.endsWith(".atail.part")) && f.delete()) n++;
            }
            if (n > 0) Log.i(TAG, "cleared " + n + " addon files from an earlier run");
        }, "addon-clear");
        clearing = t;
        t.start();
    }

    /** The start's sweep (clearCache) while it runs: no prep or download writes a file before it ends. */
    private static volatile Thread clearing;

    /** Waits (on the prep or download thread, never the main one) until the start's sweep is done. */
    private static void awaitCleared() {
        Thread t = clearing;
        if (t == null || t == Thread.currentThread()) return;
        try {
            t.join(30_000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();   // kept for the caller to see
        }
    }

    static File dir(Context c) {
        File d = new File(c.getCacheDir(), "addons");
        //noinspection ResultOfMethodCallIgnored
        d.mkdirs();
        return d;
    }

    /**
     * The Dolby Atmos switch went off: Atmos files not downloaded and not playing go (the player ends
     * first), and their songs are asked again, in stereo.
     */
    public static synchronized void dropAtmos() {
        java.util.Iterator<Map.Entry<String, Prepared>> it = ready.entrySet().iterator();
        int n = 0;
        while (it.hasNext()) {
            Prepared p = it.next().getValue();
            if (!p.atmos || p.saved || app.ayham.extension.music.automix.AddonDirect.inUse(p.id)) continue;
            it.remove();
            deleteFiles(p);
            n++;
        }
        if (n > 0) Log.i(TAG, "Dolby Atmos off: " + n + " Atmos file(s) dropped, asked again in stereo");
    }

    /** Forgets a song held in memory (its download was deleted): its next play asks again. */
    public static synchronized void forget(String id) {
        Prepared p = ready.remove(id);
        if (p == null) return;
        app.ayham.extension.music.automix.AddonPcm.delete(ctx, p.id);
        // an Atmos download's decode: a player still on it keeps reading (the file is unlinked, not
        // emptied), and the next prepare of this id writes a new file rather than over it
        deleteQuietly(p.wav);
    }

    /** What a download asks of the fetch (AddonDownloads); null for playback. */
    static final class Download {
        String tier;
        File dir;
        /** A file already downloaded for the same ISRC (another upload of the song) at the same kind (Atmos or stereo): reused. */
        java.util.function.BiFunction<String, Boolean, File> byIsrc;
    }

    /** The song from the addons, fitted and levelled; null when none fits. */
    static final double DOWNLOAD_SLACK_SEC = 2.0;

    /** dl set: a download (allowDownloads addons, ±2 s, lossless at the tier asked, kept in dl.dir). */
    static Prepared prepare(Context c, String id, String title, String artist, boolean isVideo, Download dl) throws Exception {
        return prepare(c, id, title, artist, isVideo, dl, null);
    }

    /** pass set (playback only): a second look for the playing copy (Pass), taken off the queue with its song. */
    private static Prepared prepare(Context c, String id, String title, String artist, boolean isVideo, Download dl, Pass pass) throws Exception {
        // a queued song skipped before its turn: not even YouTube's copy is fetched
        if (stale()) throw new Stale();
        // the start's sweep of an earlier run's files must not take this one's (a download's thread too)
        awaitCleared();
        List<AddonClient.Addon> addons = addonsFor(c, pass);
        // 8.2.1: a cached copy from the first addon has none above it to ask
        if (pass != null && pass.aboveOnly && addons.isEmpty()) return null;
        // YouTube's side: everything is fitted to it. Decoded (12-15 s on the phone) while the addons
        // are asked; a file is fitted only once it is whole. The search goes by the container's length
        final long t0 = SystemClock.elapsedRealtime();
        final File yt = app.ayham.extension.music.automix.AddonPcm.youtubeFile(c, id);
        final OffsetFit.Side ytSide = new OffsetFit.Side();
        final YtDecode ytDecode = new YtDecode(id, yt, ytSide, t0);
        double known = containerSec(yt);
        ytDecode.knownSec = known;
        if (Double.isNaN(known)) ytDecode.run();   // no length in the container: the decode gives it
        else new Thread(ytDecode, "addon-prep-yt").start();
        Prepared got = null;
        if (dl == null) stage(id, ASKING, null);
        try {
            got = prepareFrom(c, id, title, artist, isVideo, dl, pass, addons, ytSide, ytDecode, Double.isNaN(known) ? ytSide.durationSec() : known);
            return got;
        } finally {
            if (dl == null) stageOver(id);
            // a streamed song's level envelope still comes from it (streamWindow)
            if (got == null || got.stream == null) ytDecode.cancelled = true;
        }
    }

    /** YouTube's copy decoded into the fit's side, on its own thread; done() waits for it. */
    private static final class YtDecode implements Runnable {
        final String id;
        final File yt;
        final OffsetFit.Side side;
        final long t0;
        volatile boolean cancelled;
        /** The container's length, read before the decode starts (it deletes a downloads copy when done). */
        volatile double knownSec = Double.NaN;
        private boolean finished;
        private Throwable failed;

        YtDecode(String id, File yt, OffsetFit.Side side, long t0) {
            this.id = id;
            this.yt = yt;
            this.side = side;
            this.t0 = t0;
        }

        @Override
        public void run() {
            final AudioDecode.ToFit ytFit = new AudioDecode.ToFit(side);
            Throwable err = null;
            try {
                AudioDecode.decode(yt, new AudioDecode.Sink() {
                    @Override
                    public void format(int rate, int channels) {
                        ytFit.format(rate);
                    }

                    @Override
                    public void block(float[][] planar, int frames) throws IOException {
                        if (cancelled) throw new Stale();
                        AddonPrep.waitWhileHeld();
                        ytFit.add(planar, frames);
                    }
                });
                ytFit.finish();
                Log.i(TAG, String.format(Locale.US, "%s: YouTube's copy decoded (%.1f s, %.2f LUFS) in %d ms", id, side.durationSec(), side.lufs(), SystemClock.elapsedRealtime() - t0));
            } catch (Throwable t) {
                err = t;
            } finally {
                // not kept (addons switched off during the download): nobody else needs it
                if (yt.getParentFile() != null && "dl".equals(yt.getParentFile().getName())) //noinspection ResultOfMethodCallIgnored
                    yt.delete();
            }
            synchronized (this) {
                failed = err;
                finished = true;
                notifyAll();
            }
        }

        /** Waits for the decode (the worker's skip still ends the wait); its failure is thrown here. */
        void done() throws Exception {
            synchronized (this) {
                while (!finished) {
                    if (stale()) throw new Stale();
                    wait(100);
                }
            }
            if (failed instanceof Exception) throw (Exception) failed;
            if (failed != null) throw new IOException(failed);
        }
    }

    /** The audio track's length in the container, in seconds; NaN when it doesn't say. */
    private static double containerSec(File f) {
        android.media.MediaExtractor ex = new android.media.MediaExtractor();
        try {
            ex.setDataSource(f.getPath());
            for (int i = 0; i < ex.getTrackCount(); i++) {
                android.media.MediaFormat m = ex.getTrackFormat(i);
                String mime = m.getString(android.media.MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/") && m.containsKey(android.media.MediaFormat.KEY_DURATION)) {
                    long us = m.getLong(android.media.MediaFormat.KEY_DURATION);
                    return us > 0 ? us / 1e6 : Double.NaN;
                }
            }
        } catch (Throwable ignored) {
        } finally {
            ex.release();
        }
        return Double.NaN;
    }

    /**
     * The addons to ask, in the user's order. A pass after a cached copy (8.2.1, aboveOnly): only
     * those ranked above the addon it came from.
     */
    private static List<AddonClient.Addon> addonsFor(Context c, Pass pass) {
        List<AddonClient.Addon> addons = new ArrayList<>();
        for (String l : AddonSettings.links(c)) {
            if (pass != null && pass.aboveOnly && pass.old.host != null && pass.old.host.equals(Protocol.redact(Protocol.baseOf(l)))) break;
            addons.add(new AddonClient.Addon(l));
        }
        return addons;
    }

    private static Prepared prepareFrom(Context c, String id, String title, String artist, boolean isVideo, Download dl, final Pass pass,
                                        List<AddonClient.Addon> addons, final OffsetFit.Side ytSide, final YtDecode ytDecode, double searchSec) throws Exception {
        TrackMatcher.Target t = new TrackMatcher.Target();
        t.title = title;
        t.artist = artist;
        t.durationSec = searchSec;
        t.isVideo = isVideo;
        AddonClient.Options opt = new AddonClient.Options();
        opt.slackSec = AddonSettings.slackSec();
        if (dl != null) {
            // a download keeps the file: its length must be YouTube's within 2 s (the user's slack is for playback)
            opt.slackSec = Math.min(opt.slackSec, DOWNLOAD_SLACK_SEC);
            opt.forDownload = true;
            opt.tier = dl.tier;
        }
        // Dolby Atmos: playback with the switch on prefers Atmos rows; an Atmos download takes only them
        opt.atmos = dl == null && AddonSettings.atmos();
        opt.atmosOnly = dl != null && Pick.DOLBY.equals(dl.tier);
        opt.atmosDecodes = Atmos::decodes;
        final Prepared[] got = new Prepared[1];
        // playback: an Atmos file that didn't fit, waiting for a stereo row's offset
        final Held[] held = dl == null ? new Held[1] : null;
        if (dl == null) opt.cancelled = AddonPrep::stale;
        if (dl == null) opt.refusedBefore = row -> {
            java.util.Set<String> r = rowsRefused.get(id);
            return r != null && r.contains(row);
        };
        opt.check = o -> {
            if (dl == null && stale()) return "no longer playing or next";
            if (o.row != null && o.row.id != null)
                rowsTried.computeIfAbsent(id, k -> java.util.concurrent.ConcurrentHashMap.newKeySet()).add(o.addon.host + "\t" + o.row.id);
            try {
                String notBetter = dl != null || pass == null ? null : pass.refuse(o);
                if (notBetter != null) return notBetter;
                String early = dl == null ? null : Fetch.statedRefusal(o.stream, dl.tier);
                if (early != null) return early;
                // the lossy floor (protocol.md 8.2.1): a lossy answer under 96 kbps over YouTube's
                // doesn't win the race (playback; a download has its own tier check)
                if (dl == null && o.stream != null && !o.stream.atmos) {
                    String floor = Pick.floorRefusal(o.stream, app.ayham.extension.music.features.AudioStream.kbps(c, id));
                    if (floor != null) return "under the lossy floor: " + floor;
                }
                // one Atmos file waits at a time: a second would take the same names (id.atmos.*)
                if (held != null && held[0] != null && o.stream != null && o.stream.atmos)
                    return "Atmos: another addon's Atmos file already waits for a stereo row";
                // YouTube's decode is waited for only where the fit compares (fit): the fetch and the
                // file's decode run beside it
                if (dl == null) stage(id, FETCHING, o.stream);
                Prepared p = fetchAndFit(c, id, o, ytDecode, opt.slackSec, dl, held);
                if (dl == null) stage(id, ASKING, null);   // a refused copy: the next row or lane is asked
                // a streamed song was fitted on a slice of YouTube's copy: its whole decode runs on
                // for the level envelope only, not waited for
                if (p.stream == null && p.score >= 0) ytDecode.done();
                if (p.score < 0) {
                    if (dl == null) refusedRow(id, o);
                    if (p.stream != null) StreamCache.release(p.stream);
                    if (p.file != null) //noinspection ResultOfMethodCallIgnored
                        p.file.delete();
                    deleteQuietly(p.wav);
                    return p.codec;   // the refusal, carried in codec
                }
                if (held != null && held[0] != null && !p.atmos) {
                    Prepared a = placeAtmos(id, held[0], p, ytSide, ytSide.lufs(), opt.slackSec);
                    held[0] = null;
                    if (a != null) {
                        deleteQuietly(p.file);
                        if (p.stream != null) StreamCache.release(p.stream);
                        p = a;
                    }
                }
                got[0] = p;
                return null;
            } catch (Throwable e) {
                // a fetch or decode that failed (not the song going): the row is refused for the song
                if (dl == null && !(e instanceof Stale)) refusedRow(id, o);
                if (dl == null && !app.ayham.extension.music.automix.AddonDirect.inUse(id)) {
                    Prepared keep = held != null && held[0] != null ? held[0].p : null;
                    File[] fs = dir(c).listFiles((d, n) -> n.startsWith(id + ".") && !n.endsWith(".part"));
                    if (fs != null) for (File x : fs) if (keep == null || !(x.equals(keep.file) || x.equals(keep.wav))) deleteQuietly(x);
                }
                return "fetch or decode failed: " + Protocol.scrub(String.valueOf(e));
            }
        };
        AddonClient.Opened o;
        try {
            // the race (protocol.md 8.1.4): every addon at once; the fit checks one answer at a time
            o = client().race(t, addons, opt);
        } finally {
            // an Atmos file no stereo row placed
            if (held != null && held[0] != null) {
                deleteQuietly(held[0].p.file);
                deleteQuietly(held[0].p.wav);
                held[0] = null;
            }
        }
        if (o.stream == null || got[0] == null) {
            boolean limit = false;
            if (o.tried != null) for (AddonClient.Tried x : o.tried) {
                Log.i(TAG, "  passed over: " + x.addon + " " + x.row + ": " + x.why);
                if (x.why != null && x.why.startsWith("stream limit")) limit = true;
            }
            if (limit && dl == null) throw new Limited();
            return null;
        }
        // its deck PCM: a download's when it is played (AddonDownloads.load), a prepared song's by
        // the worker once the song is ready (the player doesn't need it, only a mix does)
        return got[0];
    }

    private static Prepared fetchAndFit(Context c, String id, AddonClient.Opened o, YtDecode yt, double slack, Download dl,
                                        Held[] held) throws Exception {
        Protocol.Stream s = o.stream;
        String ext = s.atmos ? "m4a" : s.codec == null ? "audio" : s.codec.toLowerCase(Locale.ROOT).contains("flac") ? "flac"
                : s.codec.toLowerCase(Locale.ROOT).contains("alac") || s.codec.toLowerCase(Locale.ROOT).contains("aac") ? "m4a"
                : s.codec.toLowerCase(Locale.ROOT).contains("mp3") ? "mp3" : "audio";
        if (dl != null) {
            File f = null;
            File reuse = o.row == null || o.row.isrc == null || dl.byIsrc == null ? null : dl.byIsrc.apply(o.row.isrc, s.atmos);
            if (reuse != null && reuse.length() > 0) {
                f = reuse;
                Log.i(TAG, id + ": the same recording (ISRC) is downloaded already: " + f.getName() + " reused");
            } else if (!"file".equals(s.transport)) {
                Fetch.pace(o.addon.host);
                try {
                    f = fetchStream(o, s, dl.dir, id, Fetch.MAX_BYTES, Fetch.MAX_MS, null);
                } catch (StreamManifest.Refused e) {
                    return refusal(s.transport, e);
                }
                ext = f.getName().substring(f.getName().lastIndexOf('.') + 1);
            } else {
                f = Fetch.download(o, new File(dl.dir, id + "." + ext));
            }
            try {
                return checkAndFit(id, o, f, reuse, ext, yt, slack, dl);
            } catch (Throwable e) {
                // a fetched file that failed its check or fit has no record: nothing else would delete it
                if (f != reuse) deleteQuietly(f);
                throw e;
            }
        }
        // HLS and DASH: never through the audio cache (protocol.md 8.1.6.1); fetched whole into a file
        if (!"file".equals(s.transport)) return streamFileAndFit(c, id, o, s, yt, slack, held);
        // Dolby Atmos keeps the whole file: our own decode plays it (AtmosWav), and another mix
        // is placed by a stereo row's offset (placeAtmos)
        if (!s.atmos) return streamAndFit(c, id, o, s, yt);
        return fetchAndFitPlayback(c, id, o, s, ext, yt, slack, held);
    }

    /** Names of HLS and DASH files: a new copy never takes the name of one the player may still be on. */
    private static final java.util.concurrent.atomic.AtomicInteger streamFiles = new java.util.concurrent.atomic.AtomicInteger();

    /**
     * An HLS or DASH row (protocol.md 8.1.5): YT's player builds only progressive sources, so the
     * stream's audio is fetched whole into one local file (StreamManifest) and fitted as a whole file
     * is; the player plays it and the decks are written from it, as for an Atmos file.
     */
    private static Prepared streamFileAndFit(Context c, String id, AddonClient.Opened o, Protocol.Stream s, YtDecode yt,
                                             double slack, Held[] held) throws Exception {
        String name = (s.atmos ? id + ".atmos." : id + ".") + s.transport + streamFiles.incrementAndGet();
        File f;
        try {
            f = fetchStream(o, s, dir(c), name, 300L << 20, 120_000, () -> {
                if (stale()) throw new Stale();
            });
        } catch (StreamManifest.Refused e) {
            return refusal(s.transport, e);
        }
        Prepared p;
        try {
            p = fit(id, o, f, yt, slack, held);
        } catch (Throwable e) {
            // a fetched stream that failed its fit has no record: nothing else would delete it (up to 300 MB)
            deleteQuietly(f);
            throw e;
        }
        if (p.score >= 0 && !p.atmos) {
            p.rank = Pick.qualityRank(s);
            p.tier = o.addon.tier;
        }
        return p;
    }

    /** Resolves the row's playlist or manifest and fetches its audio into dir/name.ext. */
    private static File fetchStream(AddonClient.Opened o, Protocol.Stream s, File dir, String name, long maxBytes, long maxMs,
                                    StreamManifest.Cancel cancel) throws Exception {
        boolean local = client().allowsLocalHttp();
        StreamManifest.Plan plan = StreamManifest.resolve(s.url, StreamManifest.httpTexts(s.headers), local, s.atmos);
        StreamManifest.Got g = StreamManifest.fetch(plan, StreamManifest.httpBytes(s.headers, local), dir, name, maxBytes, maxMs, cancel);
        Log.i(TAG, String.format(Locale.US, "%s: %s's %s stream fetched (%d segments, %d KB) in %d ms", name, o.addon.name,
                s.transport.toUpperCase(Locale.ROOT), g.segments, g.file.length() / 1024, g.ms));
        return g.file;
    }

    /** A stream this phone doesn't play: refused like a bad fit, the next row opens (8.1.4). */
    private static Prepared refusal(String transport, StreamManifest.Refused e) {
        Prepared p = new Prepared();
        p.score = -1;
        String why = Protocol.scrub(e.getMessage());
        p.codec = why.startsWith("HLS") || why.startsWith("DASH") ? why : transport.toUpperCase(Locale.ROOT) + ": " + why;
        return p;
    }

    /** The audition window (BitChord): this many seconds of the addon's audio are read to fit it. */
    static final double WINDOW_SEC = OffsetFit.WINDOW_SEC;

    /**
     * Playback, streamed (BitChord; protocol.md §8): only a 12 s window of the addon's file is read,
     * at the playing song's position or at the start of the next one, and fitted to YouTube's audio
     * there (OffsetFit.window, offset-map.md Window check). The rest is read by the player as it
     * plays, through the same cache. Level: the window's RMS against YouTube's copy (streamWindow;
     * YouTube's loudnessDb is logged, not used). The mix decks take YouTube's audio
     * (no file to write them from).
     */
    private static Prepared streamAndFit(Context c, String id, AddonClient.Opened o, Protocol.Stream s, YtDecode yt) throws Exception {
        long t0 = SystemClock.elapsedRealtime();
        StreamCache.Entry e = StreamCache.open(c, StreamCache.rowKey(o.addon.host, o.row == null ? id : o.row.id, o.addon.tier, o.addon.quality, s.codec));
        boolean kept = false, refused = false;
        // its file was in the persistent cache already (a replay): 8.2.1's pass after a cached copy
        boolean wasCached = e.has(0, 1);
        try {
            e.source(s.url, s.headers);
            final AddonClient.Addon addon = o.addon;
            final Pick.Row row = o.row;
            if (row != null) e.refresh = en -> {
                Protocol.Stream ns = client().streamAgain(addon, row, false);
                if (ns == null || ns.url == null) return null;
                java.util.List<String> out = new java.util.ArrayList<>();
                out.add(ns.url);
                if (ns.headers != null) for (Map.Entry<String, String> h : ns.headers.entrySet()) {
                    out.add(h.getKey());
                    out.add(h.getValue());
                }
                return out.toArray(new String[0]);
            };
            double from = 0;
            if (id.equals(current)) {
                // the window starts at YouTube's position as the audition starts (offset-map.md, Window check)
                long pos = app.ayham.extension.music.automix.Automix.positionMs();
                if (pos > 0) from = pos / 1000.0;
            }
            Prepared p = streamWindow(id, o, s, e, yt, from);
            Log.i(TAG, String.format(Locale.US, "%s: %s's stream: %d KB read for the fit in %d ms", id, o.addon.name, e.fetched / 1024, SystemClock.elapsedRealtime() - t0));
            if (p.score >= 0) {
                p.stream = e;
                p.rank = Pick.qualityRank(s);
                p.cached = wasCached;
                p.tier = o.addon.tier;
                kept = true;
            }
            refused = p.score < 0;
            return p;
        } finally {
            if (!kept) StreamCache.release(e);
            // a refused row's cached file goes too (8.1.4; extension audit M12)
            if (refused) StreamCache.discard(c, e);
        }
    }

    private static Prepared streamWindow(String id, AddonClient.Opened o, Protocol.Stream s, StreamCache.Entry e, YtDecode yt, double from) throws Exception {
        final OffsetFit.Side side = new OffsetFit.Side();
        final AudioDecode.ToFit fit = new AudioDecode.ToFit(side);
        final AudioDecode.Range range = new AudioDecode.Range();
        final int[] fmt = new int[2];
        final boolean[] padded = new boolean[1];
        AudioDecode.decode(new StreamCache.Source(e), from, from + WINDOW_SEC, new AudioDecode.Sink() {
            @Override
            public void format(int rate, int channels) {
                fmt[0] = rate;
                fmt[1] = channels;
                fit.format(rate);
            }

            @Override
            public void block(float[][] planar, int frames) throws IOException {
                if (stale()) throw new Stale();
                if (!padded[0]) {
                    // the file before the window is not read: silence there, so the window keeps its time
                    padded[0] = true;
                    long n = Math.round(Math.max(0, range.firstSec) * OffsetFit.FIT_RATE);
                    float[] z = new float[8192];
                    for (long i = 0; i < n; i += z.length) side.add(z, 0, (int) Math.min(z.length, n - i));
                }
                fit.add(planar, frames);
            }
        }, range);
        fit.finish();
        fitting(id);
        // YouTube's copy only where the window can land (offset-map.md, Window check: the template
        // [p + 1, p + 11) over +-15 s): its whole decode took 16-21 s on the phone, this slice ~2 s
        double ytFrom = Math.max(0, from - OffsetFit.COARSE_LAG_SEC - 1), ytUntil = from + WINDOW_SEC + OffsetFit.COARSE_LAG_SEC + 1;
        OffsetFit.Side ytSide;
        long ty = SystemClock.elapsedRealtime();
        try {
            ytSide = sliceOf(yt.yt, ytFrom, ytUntil);
        } catch (Stale x) {
            throw x;
        } catch (Throwable t) {
            // the copy went (or doesn't seek): the whole decode, as before
            Log.w(TAG, id + ": YouTube's slice not decoded (" + t + "): its whole copy instead");
            yt.done();
            ytSide = yt.side;
        }
        Log.i(TAG, String.format(Locale.US, "%s: YouTube's %.1f-%.1f s decoded for the window in %d ms", id, ytFrom, ytUntil, SystemClock.elapsedRealtime() - ty));
        Prepared p = new Prepared();
        p.id = id;
        p.addon = o.addon.name;
        p.host = o.addon.host;
        p.rowId = o.row == null ? null : o.row.id;
        p.rate = fmt[0];
        p.channels = fmt[1];
        double known = yt.knownSec;
        p.ytDurationSec = Double.isNaN(known) ? ytSide.durationSec() : known;
        String bad = Fetch.mimeRefusal(s, range.mime);
        if (bad != null) {
            p.score = -1;
            p.codec = bad;
            return p;
        }
        double win = Math.max(0, range.firstSec), len = side.durationSec() - win;
        OffsetFit.Result r = OffsetFit.window(ytSide, side, win, len);
        Log.i(TAG, String.format(Locale.US, "%s: %s's window %.1f-%.1f s (%s) fitted: %s", id, o.addon.name, win, win + len, range.mime, r));
        if (r.none != null) {
            p.score = -1;
            p.codec = "does not fit YouTube's audio (" + r.none + ")";
            return p;
        }
        p.offsetSec = r.offsetSec;
        p.score = r.score;
        p.addonDurationSec = Double.isNaN(range.durationSec) ? p.ytDurationSec + r.offsetSec : range.durationSec;
        // level: YouTube's copy as it is heard, measured on the window against the same seconds of it.
        // Not YouTube's loudnessDb: YT Music's player plays its copy at volume 1, unnormalised (the
        // S21 FE, 2026-11-21: Esse Nao E Meu Fim stepped down 7.3 dB, its loudnessDb 7.49, as the
        // file took over), so a cut by it left every file that much under YouTube's copy
        double ldb = ytLoudnessDb(id);
        double measured = OffsetFit.windowGainDb(ytSide.rms(), side.rms(), r.offsetSec, win, win + len);
        p.gain = new OffsetFit.Gain();
        p.gain.wantDb = Double.isNaN(measured) ? 0 : measured;
        double gain = OffsetFit.windowLevelDb(measured);
        if (gain < p.gain.wantDb) p.gain.capped = "boost";
        p.gainDb = p.gain.gainDb = gain;
        // the level envelope wants the whole song: YouTube's full decode fills it when done (the mix
        // reads none until then, as for a song not analysed); the file sits gainDb under YouTube's
        final Prepared ready = p;
        final double offset = r.offsetSec, step = -gain;
        Thread envThread = new Thread(() -> {
            try {
                yt.done();
                ready.env = envFromYt(yt.side.rms(), offset, ready.addonDurationSec, step);
            } catch (Throwable t) {
                Log.i(TAG, id + ": no level envelope (" + t + ")");
            }
        }, "addon-env");
        envThread.setDaemon(true);
        envThread.start();
        p.codec = s.codec;
        Log.i(TAG, String.format(Locale.US, "%s: level: measured on the window %+.2f dB%s: %+.2f dB (YouTube's loudnessDb %.2f, not used)",
                id, measured, p.gain.capped != null ? " (" + p.gain.capped + ")" : "", p.gainDb, ldb));
        return p;
    }

    private static double ytLoudnessDb(String id) {
        Context c = ctx;
        return c == null ? Double.NaN : app.ayham.extension.music.features.AudioStream.loudnessDb(c, id);
    }

    /** YouTube's copy decoded from fromSec to untilSec into a fit side, silence before it (its time kept). */
    private static OffsetFit.Side sliceOf(File yt, double fromSec, double untilSec) throws IOException {
        final OffsetFit.Side side = new OffsetFit.Side();
        final AudioDecode.ToFit fit = new AudioDecode.ToFit(side);
        final AudioDecode.Range range = new AudioDecode.Range();
        final boolean[] padded = new boolean[1];
        AudioDecode.decode(yt, fromSec, untilSec, new AudioDecode.Sink() {
            @Override
            public void format(int rate, int channels) {
                fit.format(rate);
            }

            @Override
            public void block(float[][] planar, int frames) throws IOException {
                if (stale()) throw new Stale();
                if (!padded[0]) {
                    padded[0] = true;
                    long n = Math.round(Math.max(0, range.firstSec) * OffsetFit.FIT_RATE);
                    float[] z = new float[8192];
                    for (long i = 0; i < n; i += z.length) side.add(z, 0, (int) Math.min(z.length, n - i));
                }
                fit.add(planar, frames);
            }
        }, range);
        fit.finish();
        return side;
    }

    /** The file's level per ENV_HOP of its own time (Prepared.env), from YouTube's, shifted by the offset and the level step. */
    static float[] envFromYt(float[] ytRms, double offsetSec, double addonSec, double stepDb) {
        int n = (int) Math.max(0, Math.floor(addonSec / Envelope.HOP));
        float[] out = new float[n];
        int per = (int) Math.round(Envelope.HOP / OffsetFit.ENV_WIN_SEC);
        for (int i = 0; i < n; i++) {
            int j0 = (int) Math.round((i * Envelope.HOP - offsetSec) / OffsetFit.ENV_WIN_SEC);
            double sum = 0;
            int k = 0;
            for (int j = j0; j < j0 + per; j++) {
                if (j < 0 || j >= ytRms.length) continue;
                sum += (double) ytRms[j] * ytRms[j];
                k++;
            }
            out[i] = k == 0 || sum <= 0 ? -120f : (float) (10 * Math.log10(sum / k) + stepDb);
        }
        return out;
    }

    private static Prepared checkAndFit(String id, AddonClient.Opened o, File f, File reuse, String ext, YtDecode yt,
                                        double slack, Download dl) throws Exception {
        Protocol.Stream s = o.stream;
        {
            String bad = Fetch.formatRefusal(f, ext, dl.tier, s);
            if (bad != null) {
                if (f != reuse) deleteQuietly(f);
                Prepared p = new Prepared();
                p.score = -1;
                p.codec = bad;
                p.file = new File(dl.dir, id + ".none");
                return p;
            }
            Prepared p = fit(id, o, f, yt, slack, null);
            if (p.score < 0 && f == reuse) p.file = new File(dl.dir, id + ".none"); // the shared file stays
            p.saved = true;
            p.tier = dl.tier;
            p.isrc = o.row == null ? null : o.row.isrc;
            return p;
        }
    }

    private static Prepared fetchAndFitPlayback(Context c, String id, AddonClient.Opened o, Protocol.Stream s, String ext, YtDecode yt,
                                                double slack, Held[] held) throws Exception {
        // an Atmos file can wait beside a stereo one of the same extension (placeAtmos)
        String name = s.atmos ? id + ".atmos." + ext : id + "." + ext;
        File f = new File(dir(c), name), part = new File(dir(c), name + ".part");
        long t0 = SystemClock.elapsedRealtime();
        Protocol.Request q = Protocol.audio(s.url, s.headers, null);
        HttpURLConnection h = HttpTransport.open(q);
        h.setReadTimeout(30_000);
        h = HttpTransport.follow(h, q);   // each redirect checked before it is asked (audit B2-04)
        boolean done = false;
        try (InputStream in = h.getInputStream(); OutputStream out = new FileOutputStream(part)) {
            int code = h.getResponseCode();
            if (code != 200 && code != 206) throw new IOException("audio: HTTP " + code);
            byte[] b = new byte[1 << 16];
            long total = 0, until = t0 + 120_000;
            for (int n; (n = in.read(b)) > 0; ) {
                out.write(b, 0, n);
                total += n;
                if (total > 300L << 20) throw new IOException("over 300 MB");
                if (SystemClock.elapsedRealtime() > until) throw new IOException("download over 120 s");
                if (stale()) throw new Stale();
            }
            done = true;
        } finally {
            h.disconnect();
            if (!done) //noinspection ResultOfMethodCallIgnored
                part.delete();
        }
        if (!part.renameTo(f)) throw new IOException("could not keep the file");
        Log.i(TAG, String.format(Locale.US, "%s: %s's file fetched (%d KB) in %d ms", id, o.addon.name, f.length() / 1024, SystemClock.elapsedRealtime() - t0));
        return fit(id, o, f, yt, slack, held);
    }

    /** An Atmos file decoded but not fitted: placed by the next stereo row that fits (placeAtmos). */
    static final class Held {
        final Prepared p;
        final OffsetFit.Side side;
        final OffsetFit.PeakMeter peaks;

        Held(Prepared p, OffsetFit.Side side, OffsetFit.PeakMeter peaks) {
            this.p = p;
            this.side = side;
            this.peaks = peaks;
        }
    }

    /**
     * The Atmos mix differs from YouTube's (another mix, not another recording), so its own fit scores
     * low. The stereo file that fit is the same song on YouTube's clock: the Atmos file is placed by its
     * offset (OffsetFit.guided) and levelled by its own loudness. null (the stereo one plays) when its
     * length doesn't fit there.
     */
    static Prepared placeAtmos(String id, Held h, Prepared stereo, OffsetFit.Side ytSide, double ytLufs, double slack) {
        Prepared p = h.p;
        OffsetFit.Result r = OffsetFit.guided(ytSide, h.side, stereo.offsetSec, slack);
        Log.i(TAG, String.format(Locale.US, "%s: %s's Atmos placed by %s's offset %+.4f s: %s", id, p.addon, stereo.addon, stereo.offsetSec, r));
        if (r.none != null) {
            Log.i(TAG, id + ": Atmos passed over (" + r.none + "): " + stereo.addon + "'s stereo plays");
            deleteQuietly(p.file);
            deleteQuietly(p.wav);
            return null;
        }
        p.offsetSec = r.offsetSec;
        p.score = stereo.score;
        p.gain = OffsetFit.sourceGainDb(ytLufs, h.side.lufs(), h.peaks);
        p.gainDb = p.gain.gainDb;
        p.atmos = true;
        Log.i(TAG, String.format(Locale.US, "%s: level: YouTube %.2f LUFS, Atmos %.2f LUFS: %s", id, ytLufs, h.side.lufs(), p.gain));
        try {
            playOwnDecode(p, ytLufs);
        } catch (Throwable t) {
            Log.w(TAG, id + ": Atmos WAV failed: " + stereo.addon + "'s stereo plays", t);
            deleteQuietly(p.file);
            deleteQuietly(p.wav);
            return null;
        }
        return p;
    }

    /**
     * Dolby Atmos: the gain into the WAV of our decode, which is then the file played (AtmosWav):
     * the whole way to YouTube's loudness (up to +14 dB) under the limiter, then measured.
     */
    static void playOwnDecode(Prepared p, double ytLufs) throws Exception {
        if (p.wav == null) return;
        long t0 = SystemClock.elapsedRealtime();
        double db = AtmosWav.boostDb(p.gainDb, p.gain == null ? Double.NaN : p.gain.wantDb);
        AtmosWav.Limited lim = AtmosWav.scale(p.wav, db);
        if (!p.saved) deleteQuietly(p.file);
        p.file = p.wav;
        p.bakedDb = db;
        p.gainDb = 0;
        // what it comes out at, measured the way YouTube's copy was (to compare)
        final OffsetFit.Side after = new OffsetFit.Side();
        final AudioDecode.ToFit meter = new AudioDecode.ToFit(after);
        AudioDecode.decode(p.wav, new AudioDecode.Sink() {
            @Override
            public void format(int rate, int channels) {
                meter.format(rate);
            }

            @Override
            public void block(float[][] planar, int frames) throws IOException {
                meter.add(planar, frames);
            }
        });
        meter.finish();
        Log.i(TAG, String.format(Locale.US, "%s: Dolby Atmos plays from our decode (%d KB WAV, %s; now %.2f LUFS, YouTube %.2f, %d ms)", p.id,
                p.wav.length() / 1024, lim, after.lufs(), ytLufs, SystemClock.elapsedRealtime() - t0));
    }

    /** Decodes the file and fits it to YouTube's audio: a score under 0 (with why in codec) when it doesn't fit. */
    static Prepared fit(String id, AddonClient.Opened o, File f, YtDecode yt, double slack, Held[] held) throws Exception {
        Protocol.Stream s = o.stream;
        long t1 = SystemClock.elapsedRealtime();
        final OffsetFit.Side side = new OffsetFit.Side();
        final AudioDecode.ToFit fit = new AudioDecode.ToFit(side);
        final OffsetFit.PeakMeter[] peaks = new OffsetFit.PeakMeter[1];
        final int[] fmt = new int[2];
        final Envelope env = new Envelope();
        // playback of Dolby Atmos: our decode is kept as a WAV, which is what plays (AtmosWav)
        final AtmosWav.Writer wav = s.atmos && held != null ? new AtmosWav.Writer(new File(f.getParentFile(), id + ".atmos.wav")) : null;
        try {
            AudioDecode.decode(f, new AudioDecode.Sink() {
                @Override
                public void format(int rate, int channels) throws IOException {
                    fmt[0] = rate;
                    fmt[1] = channels;
                    fit.format(rate);
                    peaks[0] = new OffsetFit.PeakMeter(channels);
                    env.format(rate);
                    if (wav != null) wav.format(rate, channels);
                }

                @Override
                public void block(float[][] planar, int frames) throws IOException {
                    AddonPrep.waitWhileHeld();
                    fit.add(planar, frames);
                    env.add(planar, frames);
                    for (int ch = 0; ch < planar.length; ch++) peaks[0].add(ch, planar[ch], 0, frames);
                    if (wav != null) wav.add(planar, frames);
                }
            });
            if (wav != null) wav.finish();
        } catch (Throwable t) {
            if (wav != null) wav.abort();
            throw t;
        }
        fit.finish();
        fitting(id);
        yt.done();
        final OffsetFit.Side ytSide = yt.side;
        final double ytDur = ytSide.durationSec(), ytLufs = ytSide.lufs();
        OffsetFit.Result r = OffsetFit.fit(ytSide, side, slack);
        Prepared p = new Prepared();
        p.id = id;
        p.addon = o.addon.name;
        p.host = o.addon.host;
        p.rowId = o.row == null ? null : o.row.id;
        p.file = f;
        p.rate = fmt[0];
        p.channels = fmt[1];
        p.ytDurationSec = ytDur;
        p.addonDurationSec = side.durationSec();
        p.env = env.done();
        p.wav = wav == null ? null : wav.file();
        Log.i(TAG, String.format(Locale.US, "%s: %s's file decoded and fitted in %d ms: %s", id, o.addon.name, SystemClock.elapsedRealtime() - t1, r));
        if (s.atmos && fmt[1] > 2) {
            // the mix decks write 2 channels: a decoder that hands out 5.1 or more would lose the centre
            p.score = -1;
            p.codec = "Atmos decoded to " + fmt[1] + " channels (2 needed)";
            deleteQuietly(p.wav);
            p.wav = null;
            return p;
        }
        if (r.none != null && s.atmos && held != null && held[0] == null && !"silent".equals(r.none)) {
            // another mix: kept for a stereo row of this song to place (placeAtmos)
            p.codec = s.codec;
            held[0] = new Held(p, side, peaks[0]);
            Prepared refusal = new Prepared();
            refusal.score = -1;
            refusal.codec = "Atmos: its own fit found " + r.none + " (another mix): kept for a stereo row's offset";
            return refusal;
        }
        if (r.none != null) {
            p.score = -1;
            p.codec = "does not fit YouTube's audio (" + r.none + ")";
            deleteQuietly(p.wav);
            p.wav = null;
            return p;
        }
        p.offsetSec = r.offsetSec;
        p.score = r.score;
        p.gain = OffsetFit.sourceGainDb(ytLufs, side.lufs(), peaks[0]);
        p.gainDb = p.gain.gainDb;
        p.codec = s.codec;
        p.atmos = s.atmos;
        Log.i(TAG, String.format(Locale.US, "%s: level: YouTube %.2f LUFS, file %.2f LUFS: %s", id, ytLufs, side.lufs(), p.gain));
        if (p.wav != null) {
            try {
                playOwnDecode(p, ytLufs);
            } catch (Throwable t) {
                deleteQuietly(p.wav);
                p.wav = null;
                throw t;
            }
        }
        return p;
    }
}
