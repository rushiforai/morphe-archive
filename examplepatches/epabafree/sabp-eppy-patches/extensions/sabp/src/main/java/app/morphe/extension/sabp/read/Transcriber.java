package app.morphe.extension.sabp.read;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.Process;
import android.os.SystemClock;
import android.provider.DocumentsContract;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyDiag;

/**
 * Builds a timed transcript of an audiobook on the phone, a little at a time, in the background.
 *
 * <ul>
 *     <li>On battery it stays a few minutes ahead of where you're listening and then rests, using
 *     two threads at the lowest priority and pausing as long as it worked (about half of two
 *     cores, in short bursts).</li>
 *     <li>While charging it works through the whole book.</li>
 *     <li>It stops when the battery is low or the phone is warm.</li>
 * </ul>
 * Progress is saved after every 30-second window, so it carries on where it stopped. Transcripts
 * live in the app's private storage (the source for read-along); a copy is written as
 * "&lt;file&gt;.transcript.srt" next to each audio file.
 */
public final class Transcriber {
    public static final long WIN = 30_000, KEEP = 27_000;
    static final long AHEAD_ON_BATTERY = 10 * 60_000;

    public interface Listener {
        void onTranscriberChanged();
    }

    /** What the worker is doing, for display. */
    public enum State { OFF, NO_MODEL, WAITING, WORKING, AHEAD, PAUSED_BATTERY, PAUSED_HEAT, DONE, ERROR }

    private static Transcriber instance;
    private final Context app;
    private final SharedPreferences prefs;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final CopyOnWriteArrayList<Listener> listeners = new CopyOnWriteArrayList<>();
    private Thread worker;
    private volatile boolean stop;
    private volatile State state = State.OFF;
    private volatile String stateDetail = "";
    private volatile double speedRatio; // processing time / audio time, measured
    private Whisper whisper;
    private String whisperModel;
    private long whisperUsedAt;

    private Transcriber(Context c) {
        app = c.getApplicationContext();
        prefs = app.getSharedPreferences("eppy_asr", Context.MODE_PRIVATE);
        // Crash breaker: a window that was being transcribed when the process died is skipped;
        // after three such crashes within half an hour it switches itself off until turned on again.
        String crashed = prefs.getString("inFlight", null);
        if (crashed != null) {
            // Android also ends background apps on its own, so only deaths close together count.
            long now = System.currentTimeMillis();
            boolean recent = now - prefs.getLong("crashAt", 0) < 30 * 60_000L;
            int n = recent ? prefs.getInt("crashes", 0) + 1 : 1;
            prefs.edit().remove("inFlight").putInt("crashes", n).putLong("crashAt", now).putString("skip", crashed).commit();
            EppyDiag.error("transcribe", "process ended during " + crashed + " (" + n + ")");
        }
    }

    /**
     * A Java crash (recorded by EppyDiag) isn't the speech engine's fault: forget the window in
     * flight so it isn't skipped or counted against the engine.
     */
    public static void onJavaCrash(Context c) {
        try {
            c.getSharedPreferences("eppy_asr", Context.MODE_PRIVATE).edit().remove("inFlight").commit();
        } catch (Throwable ignored) {
        }
    }

    /** True when transcription stopped itself after crashes. */
    public boolean stoppedAfterCrash() {
        return prefs.getInt("crashes", 0) >= 3;
    }

    public void resetCrashes() {
        prefs.edit().remove("crashes").remove("skip").apply();
        ensureRunning();
        notifyChanged();
    }

    public static synchronized Transcriber get(Context c) {
        if (instance == null) instance = new Transcriber(c);
        return instance;
    }

    // ---- settings -------------------------------------------------------------------------------

    public boolean enabled(String folderUri) {
        return folderUri != null && prefs.getStringSet("books", new HashSet<>()).contains(folderUri);
    }

    public void setEnabled(String folderUri, boolean on) {
        Set<String> s = new HashSet<>(prefs.getStringSet("books", new HashSet<>()));
        if (on) {
            s.add(folderUri);
            prefs.edit().remove("crashes").apply();
        }
        else s.remove(folderUri);
        prefs.edit().putStringSet("books", s).apply();
        if (on) {
            ensureRunning();
            kick();
        }
        notifyChanged();
    }

    /** "Speed up": for a while, work like when charging (more threads, no rests, further ahead). */
    public void boost(long forMs) {
        prefs.edit().putLong("boostUntil", forMs > 0 ? System.currentTimeMillis() + forMs : 0).apply();
        kick();
        notifyChanged();
    }

    public boolean boosted() {
        return prefs.getLong("boostUntil", 0) > System.currentTimeMillis();
    }

    public long boostRemainingMs() {
        return Math.max(0, prefs.getLong("boostUntil", 0) - System.currentTimeMillis());
    }

    public ModelStore.Model model() {
        return ModelStore.byId(prefs.getString("model", ModelStore.BASE.id));
    }

    public void setModel(ModelStore.Model m) {
        prefs.edit().putString("model", m.id).apply();
    }

    /** Names and rare words from the paired book, to help Whisper spell them. */
    public void setPrompt(String folderUri, String prompt) {
        prefs.edit().putString("prompt:" + folderUri, prompt).apply();
    }

    String prompt(String folderUri) {
        return prefs.getString("prompt:" + folderUri, null);
    }

    public State state() {
        return state;
    }

    public String stateDetail() {
        return stateDetail;
    }

    /** Measured processing speed as "×N real time", or null before the first window. */
    public String speedLabel() {
        double r = speedRatio;
        return r > 0 ? String.format(Locale.US, "%.1f× real time", 1 / r) : null;
    }

    public void addListener(Listener l) {
        if (!listeners.contains(l)) listeners.add(l);
    }

    public void removeListener(Listener l) {
        listeners.remove(l);
    }

    private void notifyChanged() {
        main.post(() -> {
            for (Listener l : listeners) l.onTranscriberChanged();
        });
    }

    private void set(State s, String detail) {
        if (s != state || !detail.equals(stateDetail)) {
            state = s;
            stateDetail = detail;
            notifyChanged();
        }
    }

    // ---- model download (only when the user asks) ----------------------------------------------------

    private volatile float downloadProgress = -1;
    private volatile String downloadError;
    private volatile boolean downloadCancel;

    /** 0..1 while downloading, else -1. */
    public float downloadProgress() {
        return downloadProgress;
    }

    public String downloadError() {
        return downloadError;
    }

    public boolean modelReady() {
        return ModelStore.installed(app, model());
    }

    public void cancelDownload() {
        downloadCancel = true;
    }

    /** Downloads the chosen model in the background; {@code done} runs on the main thread. */
    public synchronized void downloadModel(Runnable done) {
        if (downloadProgress >= 0) return;
        downloadProgress = 0;
        downloadError = null;
        downloadCancel = false;
        notifyChanged();
        ModelStore.Model m = model();
        new Thread(() -> {
            String err = ModelStore.download(app, m, (d, total) -> {
                float pr = total > 0 ? d / (float) total : 0;
                if (pr - downloadProgress > 0.01f) {
                    downloadProgress = pr;
                    notifyChanged();
                }
                return !downloadCancel;
            });
            downloadProgress = -1;
            downloadError = "Cancelled".equals(err) ? null : err;
            notifyChanged();
            if (err == null) {
                ensureRunning();
                kick();
                if (done != null) main.post(done);
            }
        }, "eppy-model-download").start();
    }

    // ---- progress ---------------------------------------------------------------------------------

    /** {transcribed ms, total ms} over the book's files whose length is known. */
    public long[] progress(EppyBook b) {
        long done = 0, total = 0;
        for (EppyBook.FileItem f : b.files) {
            FileTranscript t = FileTranscript.load(dir(b.folderUri), f.name);
            long dur = t != null && t.durationMs > 0 ? t.durationMs : f.duration > 0 ? f.duration * 1000L : 0;
            total += dur;
            if (t != null) done += Math.min(dur, t.coveredMs());
        }
        return new long[]{done, total};
    }

    public FileTranscript transcript(String folderUri, String fileName) {
        return FileTranscript.load(dir(folderUri), fileName);
    }

    /** Deletes this book's transcript (private copy; .srt files in the book folder stay). */
    public void forget(String folderUri) {
        File d = dir(folderUri);
        File[] fs = d.listFiles();
        if (fs != null) for (File f : fs) f.delete();
        d.delete();
        notifyChanged();
    }

    File dir(String folderUri) {
        return new File(new File(app.getFilesDir(), "eppy_readalong/asr"), sha1(folderUri));
    }

    // ---- worker -----------------------------------------------------------------------------------

    /** Starts the background worker if any book has a transcript switched on. */
    public synchronized void ensureRunning() {
        if (worker != null && worker.isAlive()) return;
        if (prefs.getStringSet("books", new HashSet<>()).isEmpty() || stoppedAfterCrash()) return;
        stop = false;
        worker = new Thread(this::loop, "eppy-transcribe");
        worker.start();
    }

    private final Object wake = new Object();
    private boolean kicked;

    /** Wakes the worker now (e.g. the model finished downloading, or playback moved). */
    public void kick() {
        synchronized (wake) {
            kicked = true;
            wake.notifyAll();
        }
    }

    public synchronized void shutdown() {
        stop = true;
        Whisper.abort();
        if (worker != null) worker.interrupt();
    }

    private void loop() {
        Process.setThreadPriority(Process.THREAD_PRIORITY_LOWEST);
        long lastPos = -1;
        while (!stop) {
            long sleep = 15_000;
            try {
                sleep = step(lastPos);
                lastPos = currentPosMs();
            } catch (InterruptedException ie) {
                break;
            } catch (Throwable t) {
                EppyDiag.error("transcribe", t.toString());
                set(State.ERROR, t.getClass().getSimpleName() + ": " + t.getMessage());
                sleep = 60_000;
            }
            if (whisper != null && SystemClock.elapsedRealtime() - whisperUsedAt > 120_000) closeWhisper();
            try {
                synchronized (wake) {
                    if (!kicked) wake.wait(sleep);
                    kicked = false;
                }
            } catch (InterruptedException ie) {
                break;
            }
        }
        closeWhisper();
        set(State.OFF, "");
    }

    private long currentPosMs() {
        Object s = EppyBridge.getPlayerService();
        if (s == null) return -1;
        try {
            int p = EppyBridge.filePositionSeconds(s);
            return p < 0 ? -1 : p * 1000L;
        } catch (Throwable t) {
            return -1;
        }
    }

    /** One unit of work; returns how long to rest afterwards. */
    private long step(long lastPos) throws Exception {
        EppyBook b = EppyBook.current();
        if (b == null || !enabled(b.folderUri)) {
            set(State.WAITING, "Waiting for a book with read-along");
            return 20_000;
        }
        ModelStore.Model m = model();
        if (!ModelStore.installed(app, m)) {
            set(State.NO_MODEL, "The speech model isn't downloaded");
            return 60_000;
        }
        boolean charging = charging() || boosted();
        if (!charging && batteryLevel() < 20) {
            set(State.PAUSED_BATTERY, "Paused: battery below 20%");
            return 120_000;
        }
        if (hot()) {
            set(State.PAUSED_HEAT, "Paused while the phone is warm");
            return 120_000;
        }

        long pos = Math.max(0, currentPosMs());
        Target t = pick(b, pos, charging);
        if (t == null) {
            boolean all = progressDone(b);
            set(all ? State.DONE : State.AHEAD, all ? "The whole book is transcribed" : "Ahead of you; more while charging");
            return 30_000;
        }
        set(State.WORKING, t.file);
        long began = SystemClock.elapsedRealtime();
        boolean ok = window(b, t, m, charging ? Math.max(2, Math.min(4, Runtime.getRuntime().availableProcessors() / 2)) : 2);
        long took = SystemClock.elapsedRealtime() - began;
        if (!ok) return 30_000;
        return charging ? 200 : Math.max(500, took); // ~50% duty cycle on battery
    }

    private boolean progressDone(EppyBook b) {
        for (EppyBook.FileItem f : b.files) {
            FileTranscript t = FileTranscript.load(dir(b.folderUri), f.name);
            if (t == null || t.durationMs <= 0 || t.firstGap(0) >= 0) return false;
        }
        return !b.files.isEmpty();
    }

    private static final class Target {
        String file;
        long from;
        FileTranscript ft;
    }

    private Target pick(EppyBook b, long pos, boolean charging) {
        File d = dir(b.folderUri);
        // 1. Ahead of the listener in the current file.
        if (b.currentFile != null) {
            FileTranscript ft = loadOrNew(b, d, b.currentFile);
            if (ft != null) {
                long gap = ft.firstGap(pos);
                if (gap >= 0 && (charging || gap - pos < AHEAD_ON_BATTERY)) return target(b.currentFile, gap, ft);
                // Near the end of this file: start the next one too.
                if (gap < 0 && ft.durationMs - pos < AHEAD_ON_BATTERY) {
                    int idx = indexOf(b, b.currentFile);
                    if (idx >= 0 && idx + 1 < b.files.size()) {
                        String next = b.files.get(idx + 1).name;
                        FileTranscript nf = loadOrNew(b, d, next);
                        long budget = AHEAD_ON_BATTERY - (ft.durationMs - pos);
                        long ng = nf != null ? nf.firstGap(0) : -1;
                        if (ng >= 0 && (charging || ng < budget)) return target(next, ng, nf);
                    }
                }
            }
        }
        if (!charging) return null;
        // 2. While charging: the rest of the book, from the current file onwards, then the start.
        int start = Math.max(0, indexOf(b, b.currentFile));
        for (int k = 0; k < b.files.size(); k++) {
            String name = b.files.get((start + k) % b.files.size()).name;
            FileTranscript ft = loadOrNew(b, d, name);
            if (ft == null) continue;
            long gap = ft.firstGap(0);
            if (gap >= 0) return target(name, gap, ft);
        }
        return null;
    }

    private static Target target(String file, long from, FileTranscript ft) {
        Target t = new Target();
        t.file = file;
        t.from = from;
        t.ft = ft;
        return t;
    }

    private static int indexOf(EppyBook b, String name) {
        for (int i = 0; i < b.files.size(); i++) if (b.files.get(i).name.equals(name)) return i;
        return -1;
    }

    private FileTranscript loadOrNew(EppyBook b, File d, String name) {
        FileTranscript ft = FileTranscript.load(d, name);
        if (ft != null && ft.durationMs > 0) return ft;
        long dur = AudioDecoder.durationMs(app, SpeechSync.fileUri(b.folderUri, name));
        if (dur <= 0) return null;
        ft = new FileTranscript(name);
        ft.durationMs = dur;
        ft.save(d);
        return ft;
    }

    private boolean window(EppyBook b, Target t, ModelStore.Model m, int threads) throws Exception {
        FileTranscript ft = t.ft;
        long next = ft.nextCoveredStart(t.from);
        long end = Math.min(ft.durationMs, Math.min(next, t.from + WIN));
        if (end - t.from < 1500) { // a sliver between two done parts
            ft.cover(t.from, end);
            ft.save(dir(b.folderUri));
            return true;
        }
        Uri uri = SpeechSync.fileUri(b.folderUri, t.file);
        float[] pcm = AudioDecoder.decode(app, uri, t.from, end - t.from);
        boolean eof = end >= ft.durationMs || end >= next;
        if (pcm.length < AudioDecoder.RATE) { // nothing decodable here
            ft.cover(t.from, end);
            ft.save(dir(b.folderUri));
            return true;
        }
        String flight = b.folderUri + "|" + t.file + "|" + t.from;
        if (flight.equals(prefs.getString("skip", null))) { // crashed here last time: leave this window out
            prefs.edit().remove("skip").apply();
            ft.cover(t.from, end);
            ft.save(dir(b.folderUri));
            return true;
        }
        Whisper w = whisper(m);
        if (w == null) {
            set(State.ERROR, Whisper.available() ? "Couldn't open the speech model" : "The speech engine isn't in this build (" + Whisper.loadError() + ")");
            return false;
        }
        long began = SystemClock.elapsedRealtime();
        prefs.edit().putString("inFlight", flight).commit();
        String json = w.transcribe(pcm, threads, prompt(b.folderUri));
        prefs.edit().remove("inFlight").apply();
        whisperUsedAt = SystemClock.elapsedRealtime();
        if (json == null) return false;
        long audioMs = pcm.length * 1000L / AudioDecoder.RATE;
        double r = (whisperUsedAt - began) / (double) Math.max(1, audioMs);
        speedRatio = speedRatio > 0 ? speedRatio * 0.8 + r * 0.2 : r;

        long len = audioMs;
        List<FileTranscript.Seg> segs = parse(json, t.from);
        long coverTo;
        if (eof || len < WIN - 500) {
            coverTo = t.from + len;
        } else {
            // Drop a final segment that runs into the window edge (probably cut mid-sentence);
            // the next window starts at its beginning.
            FileTranscript.Seg last = segs.isEmpty() ? null : segs.get(segs.size() - 1);
            if (last != null && segs.size() > 1 && last.t1 > t.from + len - 1500) {
                segs.remove(segs.size() - 1);
                coverTo = last.t0;
            } else {
                coverTo = last != null ? Math.min(t.from + len, Math.max(last.t1, t.from + KEEP)) : t.from + len;
            }
            if (coverTo - t.from < 5000) coverTo = t.from + len;
        }
        ft.add(segs, t.from, coverTo);
        ft.save(dir(b.folderUri));
        ft.windows++;
        if (ft.firstGap(0) < 0 || ft.windows % 10 == 0) writeSrt(b, ft);
        notifyChanged();
        return true;
    }

    /** Parses jni.c's JSON into segments with words, shifting times by offset. Drops obvious hallucinations. */
    static List<FileTranscript.Seg> parse(String json, long offset) throws Exception {
        List<FileTranscript.Seg> out = new ArrayList<>();
        JSONArray arr = new JSONObject(json).getJSONArray("segments");
        String prevText = null;
        for (int i = 0; i < arr.length(); i++) {
            JSONObject o = arr.getJSONObject(i);
            String text = o.getString("text").trim();
            if (text.isEmpty() || text.equals(prevText)) continue;
            if (o.optDouble("nsp", 0) > 0.6 && text.length() < 12) continue;
            if (text.startsWith("[") && text.endsWith("]") || text.startsWith("(") && text.endsWith(")")) continue; // [Music]
            prevText = text;
            FileTranscript.Seg s = new FileTranscript.Seg();
            s.t0 = offset + o.getLong("t0");
            s.t1 = offset + o.getLong("t1");
            s.text = text;
            JSONArray toks = o.getJSONArray("tokens");
            StringBuilder word = null;
            long w0 = 0, w1 = 0;
            for (int k = 0; k < toks.length(); k++) {
                JSONArray tk = toks.getJSONArray(k);
                String piece = tk.getString(2);
                long a = offset + tk.getLong(0), z = offset + tk.getLong(1);
                boolean startsWord = piece.startsWith(" ") || word == null;
                if (startsWord && word != null && word.length() > 0) s.words.add(new FileTranscript.Word(w0, w1, word.toString()));
                if (startsWord) {
                    word = new StringBuilder(piece.trim());
                    w0 = a;
                } else {
                    word.append(piece);
                }
                w1 = z;
            }
            if (word != null && word.length() > 0) s.words.add(new FileTranscript.Word(w0, w1, word.toString()));
            out.add(s);
        }
        return out;
    }

    private Whisper whisper(ModelStore.Model m) {
        if (whisper != null && m.id.equals(whisperModel)) return whisper;
        closeWhisper();
        whisper = Whisper.open(ModelStore.file(app, m).getAbsolutePath());
        whisperModel = m.id;
        whisperUsedAt = SystemClock.elapsedRealtime();
        if (whisper != null) EppyDiag.log("transcribe", "engine " + Whisper.libraryName() + ", model " + m.id);
        return whisper;
    }

    private void closeWhisper() {
        if (whisper != null) whisper.close();
        whisper = null;
        whisperModel = null;
    }

    // ---- SRT copy in the book folder ----------------------------------------------------------------

    private void writeSrt(EppyBook b, FileTranscript ft) {
        try {
            String name = baseName(ft.name) + ".transcript.srt";
            byte[] data = ft.toSrt().getBytes(StandardCharsets.UTF_8);
            Uri folder = Uri.parse(b.folderUri);
            if ("file".equals(folder.getScheme()) || b.folderUri.startsWith("/")) {
                File f = new File(folder.getPath() != null ? folder.getPath() : b.folderUri, name);
                try (FileOutputStream out = new FileOutputStream(f)) {
                    out.write(data);
                }
                return;
            }
            Uri target = SpeechSync.fileUri(b.folderUri, name);
            boolean exists;
            try (android.database.Cursor cur = app.getContentResolver().query(target, new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID}, null, null, null)) {
                exists = cur != null && cur.moveToFirst();
            } catch (Throwable t) {
                exists = false;
            }
            if (!exists) {
                Uri dirDoc = DocumentsContract.buildDocumentUriUsingTree(folder, DocumentsContract.getDocumentId(folder));
                target = DocumentsContract.createDocument(app.getContentResolver(), dirDoc, "application/x-subrip", name);
                if (target == null) return;
            }
            try (OutputStream out = app.getContentResolver().openOutputStream(target, "wt")) {
                if (out != null) out.write(data);
            }
        } catch (Throwable t) {
            EppyDiag.error("transcribe", "srt write failed: " + t);
        }
    }

    static String baseName(String file) {
        int dot = file.lastIndexOf('.');
        return dot > 0 ? file.substring(0, dot) : file;
    }

    // ---- device state -------------------------------------------------------------------------------

    private boolean charging() {
        Intent i = app.registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
        int s = i != null ? i.getIntExtra(BatteryManager.EXTRA_STATUS, -1) : -1;
        return s == BatteryManager.BATTERY_STATUS_CHARGING || s == BatteryManager.BATTERY_STATUS_FULL;
    }

    private int batteryLevel() {
        Intent i = app.registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
        if (i == null) return 100;
        int l = i.getIntExtra(BatteryManager.EXTRA_LEVEL, -1), sc = i.getIntExtra(BatteryManager.EXTRA_SCALE, 100);
        return l < 0 ? 100 : l * 100 / Math.max(1, sc);
    }

    private boolean hot() {
        if (Build.VERSION.SDK_INT < 29) return false;
        PowerManager pm = (PowerManager) app.getSystemService(Context.POWER_SERVICE);
        return pm != null && pm.getCurrentThermalStatus() >= PowerManager.THERMAL_STATUS_MODERATE;
    }

    static String sha1(String s) {
        try {
            byte[] h = MessageDigest.getInstance("SHA-1").digest(s.getBytes(StandardCharsets.UTF_8));
            StringBuilder b = new StringBuilder();
            for (int i = 0; i < 10; i++) b.append(String.format("%02x", h[i]));
            return b.toString();
        } catch (Exception e) {
            return Integer.toHexString(s.hashCode());
        }
    }
}
