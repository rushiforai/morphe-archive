package app.danielthemaniel.patches.memoryeditor.extension;

import android.os.SystemClock;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Search engine. Results live on disk (cache/memeditor/results.bin: addr, bits^KEY pairs), so
 * millions of hits cost no RAM. An unknown-value first scan dumps the selected regions to
 * snapshot.bin and the first refine compares against that.
 *
 * All work runs on one background thread. The UI polls {@link #status} / {@link #generation}.
 */
@SuppressWarnings("try")
final class Scanner {

    enum Mode {
        EQUAL("Equal to value", true),
        NOT_EQUAL("Not equal to value", true),
        GREATER("Greater than value", true),
        LESS("Less than value", true),
        CHANGED("Changed", false),
        UNCHANGED("Unchanged", false),
        INCREASED("Increased", false),
        DECREASED("Decreased", false);

        final String label;
        final boolean needsValue;

        Mode(String label, boolean needsValue) {
            this.label = label;
            this.needsValue = needsValue;
        }

        static String[] labels() {
            Mode[] v = values();
            String[] out = new String[v.length];
            for (int i = 0; i < v.length; i++) out[i] = v[i].label;
            return out;
        }
    }

    enum State { EMPTY, SNAPSHOT, RESULTS }

    static final class Hit {
        final long addr;
        final long xPrev;      // value at scan time, ^ KEY
        volatile long xCur;    // last refreshed value, ^ KEY
        String tag;            // region code, filled lazily by the UI

        Hit(long addr, long bits) {
            this.addr = addr;
            this.xPrev = bits ^ MemIO.KEY;
            this.xCur = xPrev;
        }
    }

    static final int PREVIEW_MAX = 500;
    private static final int CHUNK = 1 << 20;
    private static final int WINDOW = 1 << 16;

    private final File dir, resultsFile, tmpFile, snapFile;
    private final ByteBuffer bufA, bufB, bufW;
    private final ExecutorService exec = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "memeditor-scan");
        t.setDaemon(true);
        return t;
    });
    private final List<long[]> snapIndex = new ArrayList<>(); // {addr, len}, in file order

    volatile State state = State.EMPTY;
    volatile ValueType type = ValueType.DWORD;
    volatile long count;
    volatile List<Hit> preview = Collections.emptyList();
    volatile String status = "Ready. Enter a value and tap New scan.";
    volatile int generation;
    volatile boolean busy;
    private volatile boolean cancel;
    private long lastProgress;

    Scanner(File dir) throws IOException {
        this.dir = dir;
        resultsFile = new File(dir, "results.bin");
        tmpFile = new File(dir, "results.tmp");
        snapFile = new File(dir, "snapshot.bin");
        bufA = MemIO.scratch(dir, "scan-a", CHUNK);
        bufB = MemIO.scratch(dir, "scan-b", CHUNK);
        bufW = MemIO.scratch(dir, "scan-w", WINDOW);
        deleteFiles(); // stale results from a previous launch point at dead addresses
    }

    // ---- public API (UI thread) ----------------------------------------------------------

    void newScan(ValueType t, Set<MemMaps.Category> cats, Mode mode, String value) {
        submit(() -> doNewScan(t, cats, mode, value));
    }

    void refine(Mode mode, String value) {
        submit(() -> doRefine(mode, value));
    }

    void setAll(String value) {
        submit(() -> doSetAll(value));
    }

    void reset() {
        submit(this::doReset);
    }

    void cancel() {
        cancel = true;
    }

    private interface Task {
        void run() throws Exception;
    }

    private void submit(Task task) {
        if (busy) {
            status = "Still working… (Cancel to stop)";
            return;
        }
        busy = true;
        cancel = false;
        exec.execute(() -> {
            try {
                task.run();
            } catch (NumberFormatException e) {
                status = "Not a valid " + type.label + " value.";
            } catch (Throwable e) {
                status = "Error: " + e;
            } finally {
                busy = false;
                generation++;
            }
        });
    }

    // ---- tasks (scan thread) -------------------------------------------------------------

    private void doReset() {
        deleteFiles();
        snapIndex.clear();
        state = State.EMPTY;
        count = 0;
        preview = Collections.emptyList();
        status = "Ready. Enter a value and tap New scan.";
    }

    private void doNewScan(ValueType t, Set<MemMaps.Category> cats, Mode mode, String value) throws IOException {
        String v = value.trim();
        long target = 0;
        if (!v.isEmpty()) {
            if (!mode.needsValue) {
                status = "\"" + mode.label + "\" needs a previous scan. Use Equal for a first scan, "
                        + "or leave the value empty for an unknown-value scan.";
                return;
            }
            target = t.parse(v); // validate before throwing away the old results
        }
        doReset();
        type = t;

        List<MemMaps.Region> regions = new ArrayList<>();
        long total = 0;
        for (MemMaps.Region r : MemMaps.read()) {
            if (r.scannable() && cats.contains(r.cat)) {
                regions.add(r);
                total += r.size();
            }
        }
        if (regions.isEmpty()) {
            status = "No memory regions selected.";
            return;
        }
        if (v.isEmpty()) {
            snapshot(regions, total);
            return;
        }

        long t0 = SystemClock.uptimeMillis();
        int size = t.size;
        long done = 0;
        boolean finished = false;
        ResultWriter w = new ResultWriter(tmpFile);
        try (ResultWriter ignored = w) {
            scan:
            for (MemMaps.Region r : regions) {
                for (long a = r.start; a < r.end; a += CHUNK) {
                    if (cancel) break scan;
                    int len = (int) Math.min(CHUNK, r.end - a);
                    MemIO.window(bufA, len);
                    int n = MemIO.read(a, bufA);
                    for (int off = 0; off + size <= n; off += size) {
                        long cur = t.get(bufA, off);
                        if (match(mode, t, cur, cur, target)) w.add(a + off, cur);
                    }
                    done += len;
                    progress("Scanning", done, total, w.n);
                }
            }
            finished = !cancel;
        }
        if (finished) commit(w, t0);
        else {
            //noinspection ResultOfMethodCallIgnored
            tmpFile.delete();
            status = "Cancelled.";
        }
    }

    private void snapshot(List<MemMaps.Region> regions, long total) throws IOException {
        long free = dir.getUsableSpace();
        if (total + (256L << 20) > free) {
            status = "An unknown-value scan needs ~" + mb(total) + " of storage but only " + mb(free)
                    + " is free. Untick some regions (Java heap is usually the biggest).";
            return;
        }
        long t0 = SystemClock.uptimeMillis();
        long done = 0, bytes = 0;
        try (FileChannel out = new FileOutputStream(snapFile).getChannel()) {
            for (MemMaps.Region r : regions) {
                for (long a = r.start; a < r.end; a += CHUNK) {
                    if (cancel) {
                        doReset(); // unlinks the snapshot; the channel closes on return
                        status = "Cancelled.";
                        return;
                    }
                    int len = (int) Math.min(CHUNK, r.end - a);
                    MemIO.window(bufA, len);
                    int n = MemIO.read(a, bufA) & ~7;
                    if (n > 0) {
                        MemIO.range(bufA, 0, n);
                        while (bufA.hasRemaining()) out.write(bufA);
                        snapIndex.add(new long[] { a, n });
                        bytes += n;
                    }
                    done += len;
                    progress("Snapshotting", done, total, -1);
                }
            }
        }
        state = State.SNAPSHOT;
        count = bytes / type.size;
        status = String.format(Locale.US, "Snapshot of %s taken (%.1fs). Change the value in-game, "
                + "then Refine with Changed / Increased / Decreased…", mb(bytes), secs(t0));
    }

    private void doRefine(Mode mode, String value) throws IOException {
        if (state == State.EMPTY) {
            status = "Run a New scan first.";
            return;
        }
        long target = 0;
        if (mode.needsValue) {
            if (value.trim().isEmpty()) {
                status = "\"" + mode.label + "\" needs a value.";
                return;
            }
            target = type.parse(value);
        }
        if (state == State.SNAPSHOT) refineSnapshot(mode, target);
        else refineResults(mode, target);
    }

    private void refineSnapshot(Mode mode, long target) throws IOException {
        ValueType t = type;
        int size = t.size;
        long total = 0, done = 0;
        for (long[] e : snapIndex) total += e[1];
        long t0 = SystemClock.uptimeMillis();
        boolean finished = false;
        ResultWriter w = new ResultWriter(tmpFile);
        try (FileChannel in = new FileInputStream(snapFile).getChannel(); ResultWriter ignored = w) {
            scan:
            for (long[] e : snapIndex) {
                if (cancel) break scan;
                long a = e[0];
                int len = (int) e[1];
                MemIO.window(bufB, len);
                while (bufB.hasRemaining()) {
                    if (in.read(bufB) < 0) break;
                }
                MemIO.window(bufA, len);
                int n = MemIO.read(a, bufA);
                for (int off = 0; off + size <= n; off += size) {
                    long cur = t.get(bufA, off);
                    if (match(mode, t, cur, t.get(bufB, off), target)) w.add(a + off, cur);
                }
                done += len;
                progress("Refining", done, total, w.n);
            }
            finished = !cancel;
        }
        if (finished) {
            //noinspection ResultOfMethodCallIgnored
            snapFile.delete();
            snapIndex.clear();
            commit(w, t0);
        } else {
            //noinspection ResultOfMethodCallIgnored
            tmpFile.delete();
            status = "Cancelled (snapshot kept).";
        }
    }

    private void refineResults(Mode mode, long target) throws IOException {
        ValueType t = type;
        int size = t.size;
        long n0 = count;
        long t0 = SystemClock.uptimeMillis();
        boolean finished = false;
        ResultWriter w = new ResultWriter(tmpFile);
        try (DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(resultsFile), 1 << 16));
             ResultWriter ignored = w) {
            // Results are sorted by address, so read memory in 64 KB windows, not per value.
            long wStart = 0;
            int wLen = 0;
            for (long i = 0; i < n0; i++) {
                if ((i & 0xFFF) == 0) {
                    if (cancel) break;
                    progress("Refining", i, n0, w.n);
                }
                long addr = in.readLong();
                long prev = in.readLong() ^ MemIO.KEY;
                if (addr < wStart || addr + size > wStart + wLen) {
                    MemIO.window(bufW, WINDOW);
                    wStart = addr;
                    wLen = MemIO.read(addr, bufW);
                }
                if (addr + size > wStart + wLen) continue; // unmapped now: drop it
                long cur = t.get(bufW, (int) (addr - wStart));
                if (match(mode, t, cur, prev, target)) w.add(addr, cur);
            }
            finished = !cancel;
        }
        if (finished) commit(w, t0);
        else {
            //noinspection ResultOfMethodCallIgnored
            tmpFile.delete();
            status = "Cancelled (results kept).";
        }
    }

    private void doSetAll(String value) throws IOException {
        if (state != State.RESULTS) {
            status = "No results to edit.";
            return;
        }
        ValueType t = type;
        long bits = t.parse(value);
        long ok = 0, failed = 0;
        try (DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(resultsFile), 1 << 16))) {
            for (long i = 0; i < count; i++) {
                if (cancel) break;
                long addr = in.readLong();
                in.readLong();
                if (MemIO.write(addr, t, bits)) ok++;
                else failed++;
            }
        }
        status = String.format(Locale.US, "Wrote %,d value%s%s.", ok, ok == 1 ? "" : "s",
                failed > 0 ? String.format(Locale.US, " (%,d failed)", failed) : "");
    }

    // ---- helpers -------------------------------------------------------------------------

    static boolean match(Mode m, ValueType t, long cur, long prev, long target) {
        switch (m) {
            case EQUAL: return t.eq(cur, target);
            case NOT_EQUAL: return !t.eq(cur, target);
            case GREATER: return t.cmp(cur, target) > 0;
            case LESS: return t.cmp(cur, target) < 0;
            case CHANGED: return cur != prev;
            case UNCHANGED: return cur == prev;
            case INCREASED: return t.cmp(cur, prev) > 0;
            case DECREASED: return t.cmp(cur, prev) < 0;
            default: return false;
        }
    }

    private void commit(ResultWriter w, long t0) {
        //noinspection ResultOfMethodCallIgnored
        resultsFile.delete();
        //noinspection ResultOfMethodCallIgnored
        tmpFile.renameTo(resultsFile);
        count = w.n;
        preview = w.preview;
        state = State.RESULTS;
        status = String.format(Locale.US, "%,d result%s · %s · %.1fs", count, count == 1 ? "" : "s",
                type.label, secs(t0));
    }

    private void progress(String verb, long done, long total, long hits) {
        long now = SystemClock.uptimeMillis();
        if (now - lastProgress < 200) return;
        lastProgress = now;
        long pct = total <= 0 ? 100 : done * 100 / total;
        status = hits < 0
                ? String.format(Locale.US, "%s… %d%%", verb, pct)
                : String.format(Locale.US, "%s… %d%% (%,d hits)", verb, pct, hits);
    }

    private void deleteFiles() {
        //noinspection ResultOfMethodCallIgnored
        resultsFile.delete();
        //noinspection ResultOfMethodCallIgnored
        tmpFile.delete();
        //noinspection ResultOfMethodCallIgnored
        snapFile.delete();
    }

    private static double secs(long t0) {
        return (SystemClock.uptimeMillis() - t0) / 1000.0;
    }

    static String mb(long bytes) {
        return bytes >= (1L << 30)
                ? String.format(Locale.US, "%.1f GB", bytes / (double) (1L << 30))
                : String.format(Locale.US, "%d MB", bytes >> 20);
    }

    private static final class ResultWriter implements Closeable {
        final DataOutputStream out;
        final ArrayList<Hit> preview = new ArrayList<>();
        long n;

        ResultWriter(File f) throws IOException {
            out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(f), 1 << 16));
        }

        void add(long addr, long bits) throws IOException {
            out.writeLong(addr);
            out.writeLong(bits ^ MemIO.KEY);
            if (preview.size() < PREVIEW_MAX) preview.add(new Hit(addr, bits));
            n++;
        }

        @Override
        public void close() throws IOException {
            out.close();
        }
    }
}
