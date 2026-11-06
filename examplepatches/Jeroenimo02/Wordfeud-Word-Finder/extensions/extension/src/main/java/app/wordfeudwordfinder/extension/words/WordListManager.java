package app.wordfeudwordfinder.extension.words;

import app.wordfeudwordfinder.extension.core.Storage;
import app.wordfeudwordfinder.extension.core.WfError;
import app.wordfeudwordfinder.extension.game.Ruleset;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Downloads, verifies, converts and stores word lists (spec section 6.2), and hands out the loaded graphs.
 *
 * <p>Files: {@code wordlists/<id>-v<version>.graph}. A ruleset has a valid local list when the file for the
 * version in the sources table exists; a lower version is re-downloaded and other versions are deleted after a
 * successful download.
 *
 * <p>Attempts: {@link #onRulesetsSeen} starts at most one background attempt per ruleset per session (a failure is
 * not retried automatically); {@link #ensureForOverlay} always makes a new attempt unless a download for that
 * ruleset is already running, in which case its callback is attached to that download. At most one download per
 * ruleset runs at a time.
 *
 * <p>Memory: at most one graph is kept loaded (the one most recently requested via {@link #getOrNull} or
 * {@link #ensureForOverlay}); a background attempt only checks that the current file exists and does not keep a
 * graph it downloads. Use a single-thread executor so that at most one graph is built at a time.
 *
 * <p>Threading: all disk and network work runs on the injected executor; {@link Callback} methods are invoked on
 * the executor thread (the UI layer posts them to the main thread), except the progress replayed to a callback that
 * attaches to a running download, which is reported on the calling thread. Exceptions thrown by callbacks are
 * swallowed.
 * {@link #getOrNull} may read from disk and should not be called on the main thread.
 */
public final class WordListManager {

    /** Result of {@link #ensureForOverlay}: any number of progress calls, then exactly one onReady or onError. */
    public interface Callback {
        /** Best-effort progress, 0..100, non-decreasing. */
        void onProgress(int pct);

        void onReady(WordGraph g);

        void onError(WfError e);
    }

    static final String DIR = "wordlists";
    private static final Pattern FILE = Pattern.compile("(\\d+)-v(\\d+)\\.graph(\\.tmp)?");

    // Progress stages (percent). The download itself fills 0..DOWNLOADED when the length is known.
    private static final int DOWNLOADED = 80;
    private static final int VERIFIED = 85;
    private static final int NORMALIZED = 90;
    private static final int BUILT = 95;

    private final Storage storage;
    private final HttpFetcher fetcher;
    private final Executor executor;
    private final Function<Integer, WordListSources.Source> sources;

    /** Reads a stored graph; replaceable by tests (e.g. to simulate OutOfMemoryError). */
    interface GraphReader {
        WordGraph read(InputStream in, long length) throws IOException;
    }

    volatile GraphReader reader = WordGraph::read;

    // Guarded by this. The single loaded graph (null when none).
    private Loaded loaded;
    private final Set<Integer> backgroundTried = new HashSet<>();
    private final Map<Integer, Job> running = new HashMap<>();

    private static final class Loaded {
        final int id;
        final int version;
        final WordGraph graph;

        Loaded(int id, int version, WordGraph graph) {
            this.id = id;
            this.version = version;
            this.graph = graph;
        }
    }

    /** One running download; callbacks attach to it. Fields guarded by the manager's monitor. */
    private static final class Job {
        final List<Callback> callbacks = new ArrayList<>();
        int lastPct = -1;
    }

    /** Outcome of reading the current file from disk. */
    private enum LoadStatus { OK, MISSING, OUT_OF_MEMORY }

    private static final class LoadResult {
        final LoadStatus status;
        final WordGraph graph;

        LoadResult(LoadStatus status, WordGraph graph) {
            this.status = status;
            this.graph = graph;
        }
    }

    public WordListManager(Storage storage, HttpFetcher fetcher, Executor executor) {
        this(storage, fetcher, executor, WordListSources::get);
    }

    /** With an injectable sources table (tests). */
    public WordListManager(Storage storage, HttpFetcher fetcher, Executor executor,
                           Function<Integer, WordListSources.Source> sources) {
        this.storage = storage;
        this.fetcher = fetcher;
        this.executor = executor;
        this.sources = sources;
    }

    /**
     * Starts a background download for every ruleset in {@code ids} that has a source, has no valid local list,
     * and has not had a background attempt in this session yet. Cheap: does no IO on the calling thread.
     */
    public void onRulesetsSeen(Set<Integer> ids, Function<Integer, Ruleset> rulesets) {
        if (ids == null) return;
        for (Integer id : ids) {
            if (id == null) continue;
            WordListSources.Source src = sources.apply(id);
            Job job;
            synchronized (this) {
                if (!backgroundTried.add(id)) continue;
                if (src == null || running.containsKey(id)) continue;
                if (isLoaded(id, src.version)) continue;
                job = new Job();
                running.put(id, job);
            }
            Ruleset rs = rulesets == null ? null : rulesets.apply(id);
            submit(id, rs, src, job);
        }
    }

    /**
     * Makes the list for {@code id} available for the overlay: reports onReady with the graph (loaded from memory
     * or disk, or freshly downloaded), or onError with WL-NONE / WL-NET / WL-HTTP-n / WL-HASH / WL-DISK, or
     * GS-DATA when the ruleset is unknown so no alphabet is available.
     */
    public void ensureForOverlay(int id, Ruleset rs, Callback cb) {
        WordListSources.Source src = sources.apply(id);
        if (src == null) {
            executor.execute(() -> deliverError(cb, WfError.wlNone()));
            return;
        }
        Job job;
        WordGraph ready = null;
        int replay = -1;
        synchronized (this) {
            if (isLoaded(id, src.version)) {
                ready = loaded.graph;
                job = null;
            } else {
                Job existing = running.get(id);
                if (existing != null) {
                    existing.callbacks.add(cb);
                    replay = existing.lastPct;
                    job = null;
                } else {
                    job = new Job();
                    job.callbacks.add(cb);
                    running.put(id, job);
                    backgroundTried.add(id); // an overlay attempt also counts as this session's background attempt
                }
            }
        }
        if (job == null && ready == null) {
            // Attached to a running download: report its progress so far right away (on this thread, since the
            // executor may be busy with that download). Best effort: in a race this can arrive after a later
            // progress value or after onReady; the UI ignores progress once a result is shown.
            if (replay >= 0) {
                try {
                    cb.onProgress(replay);
                } catch (RuntimeException ignored) {
                    // callbacks never break the manager
                }
            }
            return;
        }
        if (job == null) {
            WordGraph g = ready;
            executor.execute(() -> deliverReady(cb, g));
            return;
        }
        submit(id, rs, src, job);
    }

    /**
     * The graph for {@code id} when the current version is in memory or on disk, else null. The returned graph
     * becomes the one loaded graph (any other is released). A file that cannot be parsed is deleted (it will be
     * downloaded again); a file that does not fit in memory is kept. May read from disk.
     */
    public WordGraph getOrNull(int id) {
        WordListSources.Source src = sources.apply(id);
        if (src == null) return null;
        return load(id, src).graph;
    }

    private LoadResult load(int id, WordListSources.Source src) {
        synchronized (this) {
            if (isLoaded(id, src.version)) return new LoadResult(LoadStatus.OK, loaded.graph);
        }
        File f = file(id, src.version);
        if (!f.isFile()) return new LoadResult(LoadStatus.MISSING, null);
        WordGraph g;
        synchronized (this) {
            // Release the previous graph before reading the next one, so two are never resident at once.
            loaded = null;
        }
        try (InputStream in = new FileInputStream(f)) {
            g = reader.read(in, f.length());
        } catch (IOException | RuntimeException e) {
            f.delete(); // corrupt or foreign file
            return new LoadResult(LoadStatus.MISSING, null);
        } catch (OutOfMemoryError e) {
            return new LoadResult(LoadStatus.OUT_OF_MEMORY, null); // the file may be fine: keep it
        }
        return new LoadResult(LoadStatus.OK, keep(id, src.version, g));
    }

    /** Makes {@code g} the loaded graph unless the same version is already loaded; returns the loaded one. */
    private synchronized WordGraph keep(int id, int version, WordGraph g) {
        if (isLoaded(id, version)) return loaded.graph; // a concurrent load won
        loaded = new Loaded(id, version, g);
        return g;
    }

    private boolean isLoaded(int id, int version) {
        return loaded != null && loaded.id == id && loaded.version == version;
    }

    // ------------------------------------------------------------------ job

    private void submit(int id, Ruleset rs, WordListSources.Source src, Job job) {
        try {
            executor.execute(() -> run(id, rs, src, job));
        } catch (RuntimeException e) {
            // e.g. a rejected execution: never leave the job registered
            finish(id, src, job, null, WfError.wlNet());
        }
    }

    private void run(int id, Ruleset rs, WordListSources.Source src, Job job) {
        WordGraph g = null;
        WfError err = null;
        boolean present = false;
        try {
            if (file(id, src.version).isFile()) {
                if (!hasCallbacks(job)) {
                    // Background attempt: a valid local list exists; it is loaded lazily when needed. A callback
                    // that attaches meanwhile gets it loaded in finish().
                    present = true;
                } else {
                    LoadResult r = load(id, src);
                    if (r.status == LoadStatus.OUT_OF_MEMORY) throw WfError.wlDisk();
                    g = r.graph; // null when the file was corrupt (and is now deleted)
                }
            }
            if (g == null && !present) g = download(id, rs, src, job);
        } catch (WfError e) {
            err = e;
        } catch (RuntimeException | OutOfMemoryError e) {
            // Unexpected failure while preparing the list locally (e.g. too little memory for the graph).
            err = WfError.wlDisk();
        }
        finish(id, src, job, g, err);
    }

    private WordGraph download(int id, Ruleset rs, WordListSources.Source src, Job job) throws WfError {
        if (rs == null) throw WfError.gsData("ruleset " + id + " unknown");
        Charset cs;
        try {
            cs = Charset.forName(src.charset);
        } catch (RuntimeException e) {
            throw WfError.wlNone(); // broken table entry: no usable list
        }
        progress(job, 0);
        byte[] raw = fetcher.fetch(src.url, (read, total) -> {
            if (total > 0) progress(job, (int) Math.min(DOWNLOADED, read * DOWNLOADED / total));
        });
        progress(job, DOWNLOADED);
        if (raw == null || !sha256Hex(raw).equals(src.sha256.toLowerCase(Locale.ROOT))) throw WfError.wlHash();
        progress(job, VERIFIED);
        // Our lists are sorted and unique, so the graph is built word by word without holding the list in memory.
        // A list that turns out unsorted for the patch (Spanish: digraph tiles become chars that sort differently)
        // is read again into memory, sorted and built.
        Set<String> alphabet = alphabet(rs);
        WordGraph g;
        try {
            WordGraph.Builder b = new WordGraph.Builder();
            WordListNormalizer.each(open(raw, src), cs, alphabet, b::add);
            progress(job, NORMALIZED);
            g = b.finish();
        } catch (IllegalArgumentException unsorted) {
            List<String> words;
            try {
                words = WordListNormalizer.normalize(open(raw, src), cs, alphabet);
            } catch (IOException e) {
                throw WfError.wlHash();
            }
            progress(job, NORMALIZED);
            g = WordGraph.build(words);
        } catch (IOException e) {
            throw WfError.wlHash(); // a corrupt gzip stream (the SHA-256 matched, so not expected)
        }
        raw = null;
        progress(job, BUILT);
        store(id, src.version, g);
        deleteOtherVersions(id, src.version);
        return g;
    }

    private static java.io.InputStream open(byte[] raw, WordListSources.Source src) throws IOException {
        java.io.InputStream in = new ByteArrayInputStream(raw);
        return src.gzip() ? new java.util.zip.GZIPInputStream(in, 1 << 16) : in;
    }

    private synchronized boolean hasCallbacks(Job job) {
        return !job.callbacks.isEmpty();
    }

    /**
     * Ends the job and notifies its callbacks. {@code g == null && err == null} means a background check found the
     * current file; a callback that attached meanwhile then gets the graph loaded from disk.
     */
    private void finish(int id, WordListSources.Source src, Job job, WordGraph g, WfError err) {
        List<Callback> cbs;
        synchronized (this) {
            if (running.get(id) == job) running.remove(id);
            cbs = new ArrayList<>(job.callbacks);
        }
        if (cbs.isEmpty()) return; // background only: do not keep the graph in memory
        if (err == null) {
            if (g != null) {
                g = keep(id, src.version, g);
            } else {
                g = load(id, src).graph;
                if (g == null) err = WfError.wlDisk();
            }
        }
        for (Callback cb : cbs) {
            if (err != null) deliverError(cb, err);
            else deliverReady(cb, g);
        }
    }

    private void progress(Job job, int pct) {
        List<Callback> cbs;
        synchronized (this) {
            if (pct <= job.lastPct) return;
            job.lastPct = pct;
            cbs = new ArrayList<>(job.callbacks);
        }
        for (Callback cb : cbs) {
            try {
                cb.onProgress(pct);
            } catch (RuntimeException ignored) {
                // callbacks never break the download
            }
        }
    }

    private static void deliverReady(Callback cb, WordGraph g) {
        try {
            cb.onReady(g);
        } catch (RuntimeException ignored) {
            // callbacks never break the manager
        }
    }

    private static void deliverError(Callback cb, WfError e) {
        try {
            cb.onError(e);
        } catch (RuntimeException ignored) {
            // callbacks never break the manager
        }
    }

    // ------------------------------------------------------------------ disk

    private File dir() {
        return storage.dir(DIR);
    }

    private File file(int id, int version) {
        return new File(dir(), id + "-v" + version + ".graph");
    }

    /** Writes {@code <file>.tmp} and renames it over the target; on any failure no file is left: WL-DISK. */
    private void store(int id, int version, WordGraph g) throws WfError {
        File target = file(id, version);
        File tmp = new File(target.getPath() + ".tmp");
        try {
            try (FileOutputStream out = new FileOutputStream(tmp)) {
                g.write(out);
                out.getFD().sync();
            }
            if (!tmp.renameTo(target)) {
                target.delete();
                if (!tmp.renameTo(target)) throw new IOException("rename failed");
            }
        } catch (IOException | RuntimeException e) {
            tmp.delete();
            throw WfError.wlDisk();
        }
    }

    /** Deletes the files (and leftover temp files) of every other version of {@code id}. */
    private void deleteOtherVersions(int id, int version) {
        File[] files = dir().listFiles();
        if (files == null) return;
        for (File f : files) {
            Matcher m = FILE.matcher(f.getName());
            if (!m.matches()) continue;
            try {
                if (Integer.parseInt(m.group(1)) != id) continue;
                if (Integer.parseInt(m.group(2)) == version && m.group(3) == null) continue;
            } catch (NumberFormatException e) {
                continue;
            }
            f.delete();
        }
    }

    // ------------------------------------------------------------------ helpers

    /** The ruleset's tile letters, upper case, without the blank keys ("?" / "*"). */
    static Set<String> alphabet(Ruleset rs) {
        Set<String> out = new HashSet<>();
        for (String k : rs.getTilePoints().keySet()) {
            if (k == null || k.isEmpty() || "?".equals(k) || "*".equals(k)) continue;
            out.add(k.toUpperCase(Locale.ROOT));
        }
        return out;
    }

    private static String sha256Hex(byte[] b) {
        byte[] d;
        try {
            d = MessageDigest.getInstance("SHA-256").digest(b);
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException(e);
        }
        char[] hex = "0123456789abcdef".toCharArray();
        StringBuilder sb = new StringBuilder(d.length * 2);
        for (byte x : d) sb.append(hex[(x >> 4) & 15]).append(hex[x & 15]);
        return sb.toString();
    }
}
