package app.morphe.extension.sabp.read;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.OpenableColumns;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyDiag;
import app.morphe.extension.sabp.EppyPlayer;

/**
 * Read along for one audiobook: the paired EPUB/PDF, its text, and the alignment between audio
 * time and text, built in stages:
 * <ol>
 *     <li><b>Extract</b> text, headings and paragraphs (worker thread, cached).</li>
 *     <li><b>Prepare</b>: word index per paragraph and document sections.</li>
 *     <li><b>Chapter alignment</b>: audiobook chapter titles ↔ document headings. Needs no
 *     permission or network, and gives approximate positions across the whole book at once.</li>
 *     <li><b>Speech sampling</b> (optional, opt-in): short clips around where you are listening are
 *     transcribed on the device and located in a window around the current estimate.</li>
 *     <li><b>Persist</b> every accepted match immediately, tagged with the document and audiobook
 *     it belongs to, so stale results are discarded instead of misused.</li>
 * </ol>
 * Each stage runs off the main thread, is wrapped in a crash marker (see {@link EppyDiag}), can
 * be stopped, and reports a specific error instead of a generic one.
 */
public final class ReadAlong {
    public enum State {NONE, LOADING, READY, WORKING, ERROR}

    public interface Listener {
        void onReadAlongChanged();
    }

    private static final int ALIGN_VERSION = 4;
    private static ReadAlong instance;

    public static ReadAlong get(Context c) {
        if (instance == null) instance = new ReadAlong(c.getApplicationContext());
        return instance;
    }

    private final Context c;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Set<Listener> listeners = Collections.newSetFromMap(new WeakHashMap<>());
    private final ExecutorService worker = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "eppy-readalong");
        t.setPriority(Thread.MIN_PRIORITY);
        return t;
    });
    private final SpeechSync speech;

    private String folderUri;
    private String docUri;
    private String docName;
    private volatile BookText text;
    private final Alignment alignment = new Alignment();
    private State state = State.NONE;
    private String stage = "";
    private String message = "";
    private String errorTitle;
    private volatile boolean cancelled;
    private long lastAutoSync;
    private int failuresInRow;
    private int samplesTried, samplesAccepted, samplesRejected;
    private final ArrayList<Double> pendingSamples = new ArrayList<>();
    private String interruptedNotice;
    // Transcript matching (on-device transcript ↔ document).
    private java.util.Map<String, double[]> tsCache;
    private String tsCacheDoc;
    private int transcriptPassages;
    private boolean tsScheduled;
    private volatile int tsGeneration;

    private ReadAlong(Context c) {
        this.c = c;
        this.speech = new SpeechSync(c);
        Transcriber.get(c).addListener(() -> scheduleTranscriptSync(30_000));
        // Crash-loop breaker: if the process died during a read-along job last time, turn
        // automatic work off and tell the user, instead of repeating the same job at startup.
        EppyDiag.ensure(c);
        String job = EppyDiag.takeInterruptedJob();
        if (job != null && job.startsWith("readalong")) {
            prefs().edit().putBoolean("autoSync", false).apply();
            interruptedNotice = "Read along stopped unexpectedly last time (during " + job.substring(job.indexOf(':') + 1).trim()
                    + "). Automatic matching is now off; your pairing and position are kept. You can retry or remove the pairing.";
        }
    }

    private SharedPreferences prefs() {
        return c.getSharedPreferences("eppy_readalong", Context.MODE_PRIVATE);
    }

    public void addListener(Listener l) {
        listeners.add(l);
    }

    public void removeListener(Listener l) {
        listeners.remove(l);
    }

    private void changed() {
        main.post(() -> {
            for (Listener l : new ArrayList<>(listeners)) {
                try {
                    l.onReadAlongChanged();
                } catch (Throwable t) {
                    EppyDiag.log("readalong", "listener failed: " + t);
                }
            }
        });
    }

    public State state() {
        return state;
    }

    public String stage() {
        return stage;
    }

    public String message() {
        return message;
    }

    public String errorTitle() {
        return errorTitle;
    }

    public String interruptedNotice() {
        return interruptedNotice;
    }

    public void dismissInterruptedNotice() {
        interruptedNotice = null;
        changed();
    }

    public BookText text() {
        return text;
    }

    public Alignment alignment() {
        return alignment;
    }

    public String docName() {
        return docName;
    }

    public String docUri() {
        return docUri;
    }

    public int samplesAccepted() {
        return samplesAccepted;
    }

    // ---- speech engine availability --------------------------------------------------------

    /** Speech matching is compiled in (patch option) and the device can do it. */
    public boolean speechSupported() {
        return !"off".equals(app.morphe.extension.sabp.EppyTheme.configString(c, "eppy_speech", "on")) && SpeechSync.supported(c);
    }

    public boolean speechPermitted() {
        return c.checkSelfPermission(android.Manifest.permission.RECORD_AUDIO) == android.content.pm.PackageManager.PERMISSION_GRANTED;
    }

    /** Automatic speech sampling while listening. Off by default (it needs the mic permission). */
    public boolean autoSyncEnabled() {
        return prefs().getBoolean("autoSync", false);
    }

    public void setAutoSync(boolean on) {
        prefs().edit().putBoolean("autoSync", on).apply();
        failuresInRow = 0;
        if (on) interruptedNotice = null;
        changed();
    }

    private boolean canAutoMatch() {
        return autoSyncEnabled() && speechSupported() && speechPermitted();
    }

    // ---- pairing ------------------------------------------------------------------------------

    /** Switches to the given audiobook (no-op if it's already loaded). */
    public void openBook(String folder) {
        if (folder == null || folder.equals(folderUri)) return;
        cancel();
        folderUri = folder;
        text = null;
        alignment.clear(-1);
        docUri = prefs().getString("doc:" + folder, null);
        docName = prefs().getString("name:" + folder, null);
        failuresInRow = 0;
        samplesTried = samplesAccepted = samplesRejected = 0;
        transcriptPassages = 0;
        tsGeneration++;
        errorTitle = null;
        if (docUri == null) {
            set(State.NONE, "", "");
            return;
        }
        load(false);
    }

    public boolean hasDocument() {
        return docUri != null;
    }

    /** Pairs a picked EPUB/PDF with the current audiobook. */
    public void pair(Uri uri) {
        if (folderUri == null || !enabled()) return;
        cancel();
        // Never keep a persistent permission to the document: SABP crashes on any persisted
        // permission that isn't a folder (see DocStore). Read a private copy instead.
        String name = displayName(uri);
        Uri copy = DocStore.importCopy(c, uri, name);
        if (copy == null) {
            errorTitle = "Couldn't read that file";
            set(State.ERROR, "", "eppy couldn't copy the document. Check it opens in another app, or pick it again.");
            return;
        }
        if (docUri != null && !docUri.equals(copy.toString())) DocStore.deleteCopy(c, docUri);
        docUri = copy.toString();
        docName = name;
        prefs().edit().putString("doc:" + folderUri, docUri).putString("name:" + folderUri, docName).apply();
        anchorFile().delete();
        alignment.clear(-1);
        failuresInRow = 0;
        samplesTried = samplesAccepted = samplesRejected = 0;
        load(true);
    }

    /** Removes the pairing and its cached data. The audiobook and the document file are untouched. */
    public void unpair() {
        if (folderUri == null) return;
        cancel();
        if (docUri != null) {
            textCache(docUri).delete();
            DocStore.deleteCopy(c, docUri);
        }
        prefs().edit().remove("doc:" + folderUri).remove("name:" + folderUri).apply();
        anchorFile().delete();
        docUri = null;
        docName = null;
        text = null;
        errorTitle = null;
        alignment.clear(-1);
        interruptedNotice = null;
        set(State.NONE, "", "");
    }

    /** Re-reads the document and rebuilds alignment from scratch (keeps the pairing). */
    public void rebuild() {
        if (docUri == null) return;
        cancel();
        textCache(docUri).delete();
        anchorFile().delete();
        alignment.clear(-1);
        load(true);
    }

    /** Stops whatever is running and clears queued samples. */
    public void cancel() {
        cancelled = true;
        pendingSamples.clear();
        speech.cancel();
        if (state == State.WORKING) set(State.READY, "", "Stopped. Matches found so far are kept.");
    }

    private String displayName(Uri uri) {
        try (Cursor cur = c.getContentResolver().query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cur != null && cur.moveToFirst()) return cur.getString(0);
        } catch (Throwable ignored) {
        }
        return uri.getLastPathSegment();
    }

    private long docSize(Uri uri) {
        try (Cursor cur = c.getContentResolver().query(uri, new String[]{OpenableColumns.SIZE}, null, null, null)) {
            if (cur != null && cur.moveToFirst() && !cur.isNull(0)) return cur.getLong(0);
        } catch (Throwable ignored) {
        }
        return -1;
    }

    // ---- stage 1–3: extract, prepare, chapter alignment ------------------------------------------

    private void load(boolean fresh) {
        final String doc = docUri, name = docName, folder = folderUri;
        cancelled = false;
        errorTitle = null;
        set(State.LOADING, "Extracting text", fresh ? "Reading " + (name != null ? name : "the document") + "…" : "Opening text…");
        worker.execute(() -> {
            long t0 = SystemClock.elapsedRealtime();
            BookText t = null;
            String errTitle = null, err = null;
            File cache = textCache(doc);
            boolean marked = false;
            try {
                if (!fresh && cache.exists()) {
                    try {
                        t = BookText.fromJson(new JSONObject(read(cache)));
                    } catch (Throwable corrupt) {
                        EppyDiag.log("readalong", "text cache unreadable, rebuilding: " + corrupt.getClass().getSimpleName());
                        cache.delete();
                    }
                }
                if (t == null) {
                    EppyDiag.jobStart("readalong: extracting text");
                    marked = true;
                    t = DocExtractor.extract(c, Uri.parse(doc), name);
                    write(cache, t.toJson().toString());
                }
                if (marked) EppyDiag.jobEnd("readalong: extracting text", t.wordCount() + " words, " + t.paras.size() + " paragraphs, "
                        + t.sections().size() + " sections in " + (SystemClock.elapsedRealtime() - t0) + " ms");
            } catch (SecurityException se) {
                errTitle = "Lost access to the file";
                err = "Android no longer lets eppy read this document. Pair it again.";
                EppyDiag.jobEnd("readalong: extracting text", "SecurityException");
            } catch (OutOfMemoryError oom) {
                t = null;
                errTitle = "Low memory";
                err = "The document is too large to process with the memory available. Try an EPUB instead of a PDF, or close other apps and retry.";
                EppyDiag.jobEnd("readalong: extracting text", "OutOfMemoryError");
            } catch (Throwable e) {
                errTitle = "Text extraction failed";
                err = "The document may be encrypted (DRM), malformed, or unsupported. (" + e.getClass().getSimpleName() + ")";
                EppyDiag.jobEnd("readalong: extracting text", e.toString());
            }
            final BookText result = t;
            final String fErrTitle = errTitle, fErr = err;
            main.post(() -> {
                if (!folder.equals(folderUri)) return;
                if (result == null) {
                    errorTitle = fErrTitle;
                    set(State.ERROR, "", fErr);
                    return;
                }
                if (!result.pagesOnly && result.wordCount() < 200) {
                    errorTitle = result.pageCount > 0 ? "PDF contains scanned pages" : "Not enough text";
                    set(State.ERROR, "", result.pageCount > 0
                            ? "This PDF has almost no text layer. OCR is needed before text matching can work."
                            : "Only " + result.wordCount() + " words could be extracted from this document.");
                    return;
                }
                text = result;
                alignment.clear(-1);
                alignment.setBounds(Math.max(1, unitCount()), bookSeconds());
                if (!result.overlays.isEmpty()) alignment.setOverlays(result.overlays);
                restoreAnchors(doc);
                alignChapters();
                updateReadyMessage();
                transcriptPassages = 0;
                hintNames(result, folder);
                scheduleTranscriptSync(500);
            });
        });
    }

    private int unitCount() {
        BookText t = text;
        if (t == null) return 1;
        return t.pagesOnly ? t.paras.size() : t.wordCount();
    }

    /** Stage 3: chapter titles from the audiobook ↔ document headings (approximate anchors). */
    private void alignChapters() {
        final BookText t = text;
        EppyBook b = EppyPlayer.get(c).book();
        if (t == null || t.pagesOnly || b == null || b.chapters.size() < 2) return;
        final ArrayList<String> titles = new ArrayList<>();
        final ArrayList<Double> starts = new ArrayList<>();
        for (EppyBook.ChapterItem ch : b.chapters) {
            titles.add(ch.title != null ? ch.title : "");
            starts.add(ch.start >= 0 ? (double) ch.start : -1.0);
        }
        worker.execute(() -> {
            EppyDiag.jobStart("readalong: aligning chapters");
            List<ChapterAligner.Pair> pairs;
            try {
                pairs = ChapterAligner.align(titles, starts, t.sections());
            } catch (Throwable e) {
                EppyDiag.jobEnd("readalong: aligning chapters", e.toString());
                return;
            }
            EppyDiag.jobEnd("readalong: aligning chapters", pairs.size() + " of " + titles.size() + " audio chapters paired with "
                    + t.sections().size() + " document sections");
            main.post(() -> {
                if (text != t) return;
                int added = 0;
                for (ChapterAligner.Pair p : pairs) {
                    if (alignment.add(new Alignment.Anchor(p.seconds, p.word, Alignment.SRC_CHAPTER, p.score))) added++;
                }
                chapterPairs = added;
                updateReadyMessage();
            });
        });
    }

    private int chapterPairs;

    private void updateReadyMessage() {
        if (text == null) return;
        String msg;
        if (alignment.hasOverlay()) {
            msg = "Exact timings from the book's own narration data (EPUB Media Overlays).";
        } else {
            int speechN = alignment.anchorCount(Alignment.SRC_SPEECH), manualN = alignment.anchorCount(Alignment.SRC_MANUAL);
            StringBuilder b = new StringBuilder();
            if (chapterPairs > 0) b.append(chapterPairs).append(" chapters matched by title (approximate)");
            if (transcriptPassages > 0) b.append(b.length() > 0 ? " · " : "").append(transcriptPassages).append(transcriptPassages == 1 ? " passage" : " passages").append(" matched to the transcript");
            if (speechN > 0) b.append(b.length() > 0 ? " · " : "").append(speechN).append(speechN == 1 ? " passage" : " passages").append(" confirmed by listening");
            if (manualN > 0) b.append(b.length() > 0 ? " · " : "").append(manualN).append(" manual ").append(manualN == 1 ? "correction" : "corrections");
            if (b.length() == 0) b.append(text.pagesOnly ? "Following by page, estimated from the book length." : "Estimated from the book length. Long-press the paragraph you're hearing to sync it.");
            msg = b.toString();
        }
        set(State.READY, "", msg);
    }

    private double bookSeconds() {
        EppyBook b = EppyPlayer.get(c).book();
        return b != null && b.total > 0 ? b.total : 0;
    }

    private void set(State s, String stg, String msg) {
        state = s;
        stage = stg != null ? stg : "";
        message = msg != null ? msg : "";
        changed();
    }

    // ---- positions ------------------------------------------------------------------------------

    /** Unit index (word, or page for page-only PDFs) at a book time. */
    public int unitAt(double bookSeconds) {
        if (text == null) return 0;
        alignment.setBounds(unitCount(), bookSeconds());
        return alignment.wordAt(bookSeconds);
    }

    public double timeOfUnit(int unit) {
        return alignment.timeOf(unit);
    }

    public int levelAt(double bookSeconds) {
        return alignment.levelAt(bookSeconds);
    }

    /** "I'm hearing this now": manual correction, kept across restarts. */
    public boolean syncHere(int unit, double bookSeconds) {
        if (text == null || bookSeconds < 0) return false;
        boolean ok = alignment.add(new Alignment.Anchor(bookSeconds, unit, Alignment.SRC_MANUAL, 1f));
        if (ok) saveAnchors();
        updateReadyMessage();
        EppyDiag.log("readalong", "manual sync " + (ok ? "saved" : "rejected (conflicts with exact timings)"));
        return ok;
    }

    public void clearMatches() {
        alignment.clear(Alignment.SRC_SPEECH);
        alignment.clear(Alignment.SRC_MANUAL);
        saveAnchors();
        updateReadyMessage();
    }

    // ---- stage 4: speech sampling ---------------------------------------------------------------

    /** Called from the UI every second while visible: adds a fresh match every ~2 min of playback. */
    /** False when Read along is switched off in Diagnostics. */
    public boolean enabled() {
        return app.morphe.extension.sabp.EppyFlags.on(c, app.morphe.extension.sabp.EppyFlags.READ_ALONG);
    }

    public void tick(double bookSeconds, boolean playing) {
        if (!enabled()) return;
        if (text == null || text.pagesOnly || !playing || bookSeconds < 0 || state != State.READY) return;
        if (!canAutoMatch() || speech.isBusy() || failuresInRow >= 3) return;
        long now = SystemClock.elapsedRealtime();
        if (lastAutoSync == 0) lastAutoSync = now; // never start right at launch
        if (now - lastAutoSync < 120_000) return;
        lastAutoSync = now;
        pendingSamples.add(Math.max(0, bookSeconds - 12));
        runNextSample();
    }

    /** "Match now" around the current position (the user granted permission first). */
    public void matchNow(double bookSeconds) {
        if (text == null || bookSeconds < 0) return;
        if (!speechSupported()) {
            errorTitle = null;
            set(State.READY, "", "Speech recognition unavailable: this needs Android 13+ with an on-device speech model for the book's language. Long-press the paragraph you're hearing to sync instead.");
            return;
        }
        if (!speechPermitted()) {
            set(State.READY, "", "Matching by listening needs the microphone permission for Android's speech service.");
            return;
        }
        cancelled = false;
        failuresInRow = 0;
        pendingSamples.clear();
        // Current position first, then a little earlier and later for a local fix.
        pendingSamples.add(Math.max(0, bookSeconds - 12));
        pendingSamples.add(Math.max(0, bookSeconds - 150));
        pendingSamples.add(bookSeconds + 90);
        runNextSample();
    }

    private void runNextSample() {
        if (cancelled || speech.isBusy() || pendingSamples.isEmpty() || text == null) {
            if (pendingSamples.isEmpty() && state == State.WORKING) updateReadyMessage();
            return;
        }
        final double at = pendingSamples.remove(0);
        EppyBook b = EppyPlayer.get(c).book();
        if (b == null) return;
        Object[] loc = b.locate((int) at);
        if (loc == null) {
            errorTitle = null;
            set(State.READY, "", "The audiobook's file layout isn't known yet, so audio can't be sampled. Play for a moment and retry.");
            return;
        }
        final Uri audio;
        try {
            audio = SpeechSync.fileUri(b.folderUri, (String) loc[0]);
        } catch (Throwable t) {
            EppyDiag.log("readalong", "cannot build audio uri: " + t.getClass().getSimpleName());
            return;
        }
        samplesTried++;
        set(State.WORKING, "Analysing audio", "Sample " + samplesTried + ": transcribing 10 s on the device…");
        String lang = text.language != null && !text.language.isEmpty() ? text.language : null;
        final BookText t = text;
        speech.transcribe(audio, (Integer) loc[1], 10, lang, new SpeechSync.Callback() {
            @Override
            public void onTranscript(List<String> words) {
                if (cancelled || text != t) return;
                if (words.size() < 5) {
                    samplesRejected++;
                    failuresInRow++;
                    set(State.WORKING, "Matching passages", "Sample " + samplesTried + ": too few words heard (music, silence or credits?).");
                    main.postDelayed(ReadAlong.this::runNextSample, 400);
                    return;
                }
                set(State.WORKING, "Matching passages", "Sample " + samplesTried + ": looking for " + words.size() + " heard words in the text…");
                final int near = alignment.anchorCount(-1) > 0 ? alignment.wordAt(at) : -1;
                worker.execute(() -> {
                    EppyDiag.jobStart("readalong: matching text");
                    TextMatcher.Result r = null;
                    try {
                        r = TextMatcher.locate(t, words, near, 4000, () -> cancelled);
                        EppyDiag.jobEnd("readalong: matching text", r == null ? "no candidate" : String.format(
                                java.util.Locale.US, "conf %.2f hits %.2f ambiguous %s windows %d", r.confidence(), r.hitRatio, r.ambiguous, r.windowsSearched));
                    } catch (Throwable e) {
                        EppyDiag.jobEnd("readalong: matching text", e.toString());
                    }
                    final TextMatcher.Result fr = r;
                    main.post(() -> onMatched(t, at, words, fr));
                });
            }

            @Override
            public void onError(String reason) {
                samplesRejected++;
                failuresInRow++;
                errorTitle = null;
                set(State.READY, "", reason + (failuresInRow >= 3 ? " Automatic matching paused after 3 failures." : ""));
                if (failuresInRow < 3 && !pendingSamples.isEmpty()) main.postDelayed(ReadAlong.this::runNextSample, 1500);
            }
        });
    }

    private void onMatched(BookText t, double at, List<String> words, TextMatcher.Result r) {
        if (cancelled || text != t) return;
        String outcome;
        if (r == null) {
            samplesRejected++;
            failuresInRow++;
            outcome = "No matching passage found for what was heard. The narration may differ from this edition.";
        } else if (!r.acceptable()) {
            samplesRejected++;
            failuresInRow++;
            outcome = r.ambiguous ? "That phrase appears in more than one place. Kept the current position instead of guessing."
                    : "Match confidence too low (" + Math.round(r.confidence() * 100) + "%). Kept the current position.";
        } else if (!alignment.add(new Alignment.Anchor(at, r.word, Alignment.SRC_SPEECH, r.confidence()))) {
            samplesRejected++;
            outcome = "Found a match that contradicts confirmed positions. Ignored it.";
        } else {
            samplesAccepted++;
            failuresInRow = 0;
            saveAnchors();
            outcome = "Matched (" + Math.round(r.confidence() * 100) + "% confidence).";
        }
        set(State.WORKING, "Matching passages", "Sample " + samplesTried + ": " + outcome);
        if (pendingSamples.isEmpty()) {
            main.postDelayed(() -> {
                if (state == State.WORKING) {
                    updateReadyMessage();
                    message = message + " · Last sample: " + outcome;
                    changed();
                }
            }, 1200);
        } else {
            main.postDelayed(this::runNextSample, 600);
        }
    }

    // ---- stage 4b: the on-device transcript ---------------------------------------------------

    /** How many passages of the document are placed by the on-device transcript. */
    public int transcriptPassages() {
        return transcriptPassages;
    }

    /** Re-matches the transcript now (the Read tab calls this when it opens). */
    public void refreshTranscriptMatches() {
        scheduleTranscriptSync(300);
    }

    /** Gives the recogniser the book's names so it spells them as the book does. */
    private void hintNames(BookText t, String folder) {
        if (t.pagesOnly) return;
        worker.execute(() -> {
            try {
                String names = TranscriptSync.namesPrompt(t);
                if (names != null) Transcriber.get(c).setPrompt(folder, names);
            } catch (Throwable e) {
                EppyDiag.log("readalong", "names: " + e.getClass().getSimpleName());
            }
        });
    }

    /** Matches newly transcribed audio to the document, at most every {@code delayMs}. */
    private void scheduleTranscriptSync(long delayMs) {
        if (tsScheduled) return;
        tsScheduled = true;
        main.postDelayed(() -> {
            tsScheduled = false;
            syncTranscript();
        }, delayMs);
    }

    private void syncTranscript() {
        final BookText t = text;
        final String folder = folderUri, doc = docUri;
        if (t == null || t.pagesOnly || folder == null || doc == null) return;
        EppyBook b = EppyPlayer.get(c).book();
        if (b == null || !folder.equals(b.folderUri) || b.files.isEmpty()) {
            // The player isn't ready yet (e.g. just after the app started): try again shortly.
            scheduleTranscriptSync(3000);
            return;
        }
        Transcriber tr = Transcriber.get(c);
        if (!tr.enabled(folder)) return;
        final int gen = ++tsGeneration;
        worker.execute(() -> {
            try {
                File cf = new File(dir(), "tsync_" + Integer.toHexString((folder + "|" + doc).hashCode()) + ".json");
                if (tsCache == null || !doc.equals(tsCacheDoc)) {
                    tsCache = cf.exists() ? TranscriptSync.fromJson(new JSONObject(read(cf))) : new java.util.HashMap<>();
                    tsCacheDoc = doc;
                }
                int before = tsCache.size();
                List<Alignment.Anchor> chain = TranscriptSync.run(t, b, tr, tsCache, () -> gen != tsGeneration);
                if (chain == null) return;
                if (tsCache.size() != before) write(cf, TranscriptSync.toJson(tsCache).toString());
                main.post(() -> {
                    if (gen != tsGeneration || text != t) return;
                    transcriptPassages = alignment.setTranscriptChain(chain) / 2;
                    if (state == State.READY) updateReadyMessage();
                    else changed();
                });
            } catch (Throwable e) {
                EppyDiag.error("readalong", "transcript matching failed: " + e);
            }
        });
    }

    // ---- stage 5: storage -----------------------------------------------------------------------

    private File dir() {
        File d = new File(c.getFilesDir(), "eppy_readalong");
        d.mkdirs();
        return d;
    }

    private File textCache(String doc) {
        return new File(dir(), "text_" + Integer.toHexString(doc.hashCode()) + ".json");
    }

    private File anchorFile() {
        return new File(dir(), "anchors_" + Integer.toHexString(String.valueOf(folderUri).hashCode()) + ".json");
    }

    /** Anchors are only reused for the same document (URI + size) and the same audiobook length. */
    private void restoreAnchors(String doc) {
        File f = anchorFile();
        if (!f.exists()) return;
        try {
            JSONObject o = new JSONObject(read(f));
            long size = docSize(Uri.parse(doc));
            boolean sameDoc = doc.equals(o.optString("doc")) && (o.optLong("docSize", -1) == size || size < 0);
            boolean sameAudio = Math.abs(o.optDouble("bookSeconds", 0) - bookSeconds()) < 5 || bookSeconds() == 0;
            if (o.optInt("v") != ALIGN_VERSION && o.optInt("v") != 0 || !sameDoc || !sameAudio) {
                EppyDiag.log("readalong", "saved alignment discarded (document or audiobook changed)");
                f.delete();
                message = "Saved matches were for a different version of the document or audiobook and were discarded.";
                return;
            }
            alignment.fromJson(o.optJSONArray("anchors"));
        } catch (Throwable e) {
            EppyDiag.log("readalong", "saved alignment unreadable, removed: " + e.getClass().getSimpleName());
            f.delete();
        }
    }

    private void saveAnchors() {
        final String doc = docUri;
        final double total = bookSeconds();
        final org.json.JSONArray anchors = alignment.toJson();
        final File f = anchorFile();
        worker.execute(() -> {
            try {
                JSONObject o = new JSONObject();
                o.put("v", ALIGN_VERSION);
                o.put("doc", doc);
                o.put("docSize", doc != null ? docSize(Uri.parse(doc)) : -1);
                o.put("bookSeconds", total);
                o.put("anchors", anchors);
                write(f, o.toString());
            } catch (Throwable e) {
                EppyDiag.log("readalong", "saving matches failed: " + e.getClass().getSimpleName());
            }
        });
    }

    private static String read(File f) throws Exception {
        try (FileInputStream in = new FileInputStream(f)) {
            byte[] b = new byte[(int) f.length()];
            int off = 0;
            while (off < b.length) {
                int r = in.read(b, off, b.length - off);
                if (r < 0) break;
                off += r;
            }
            return new String(b, StandardCharsets.UTF_8);
        }
    }

    private static void write(File f, String s) throws Exception {
        File tmp = new File(f.getPath() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(tmp)) {
            out.write(s.getBytes(StandardCharsets.UTF_8));
        }
        if (!tmp.renameTo(f)) {
            f.delete();
            if (!tmp.renameTo(f)) throw new java.io.IOException("rename failed");
        }
    }
}
