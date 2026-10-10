package app.nogoogle.gboard.voice;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.inputmethodservice.InputMethodService;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.view.inputmethod.InputMethodSubtype;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import app.nogoogle.gboard.NoGoogleSettings;
import app.nogoogle.gboard.ModMenuActivity;
import app.nogoogle.gboard.translate.LocalTranslate;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.Locale;

/**
 * Offline voice typing with whisper.cpp instead of Gboard's (Google) voice input. Recording starts
 * at the tap while the model loads; phrases cut at pauses are transcribed in the background with
 * the text before them as context, and the transcript is typed after Done (or a long silence).
 * ACFT models encode only the recorded audio plus 128 frames; others get Whisper's full 30 s
 * window, without which they repeat themselves.
 */
@SuppressWarnings("unused")
public final class VoiceController {
    private static final String TAG = "NoGoogleVoice";
    private static final int RATE = 16000;
    private static final int MAX_SECONDS = 300;
    private static final int ACFT_PAD = 128;           // frames (50/s), as published for ACFT
    private static final int PAUSE_MS = 2000;          // keep within-sentence breathing pauses in context
    private static final int MIN_PHRASE_MS = 3000;     // ...once it has this much speech (fewer fragments)
    private static final int LONG_PAUSE_MS = 2500;     // a longer silence ends any phrase
    private static final int MAX_PHRASE_MS = 25000;    // leave room inside Whisper's 30 s window
    private static final int AUTO_STOP_MS = 4000;      // silence after speech that finishes the session
    private static final float VAD_ON = 0.5f;          // Silero speech probability hysteresis
    private static final float VAD_OFF = 0.35f;
    private static final long UNLOAD_AFTER_MS = 3 * 60_000;
    private static final long PROGRESS_EVERY_MS = 200;

    private static WeakReference<InputMethodService> imeRef = new WeakReference<>(null);
    private static VoiceController active;

    // The loaded model is kept across sessions (loading it takes seconds) and freed after a few
    // idle minutes.
    private static final Object MODEL_LOCK = new Object();
    private static final Object HANDLE_LOCK = new Object(); // abort vs handle replacement/free
    private static final Handler IDLE = new Handler(Looper.getMainLooper());
    private static final Runnable UNLOAD = VoiceController::releaseModels;
    private static String loadedPath;
    private static volatile long loadedHandle;
    // Transcription time / audio time, measured on this phone; drives the progress estimate.
    private static volatile float speed = 0.8f;

    private final InputMethodService ime;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final String language;
    private final File model;
    private final boolean debug = debugEnabled(); // logs phrases, keeps session audio

    private volatile boolean recording;
    private volatile boolean cancelled;
    private volatile boolean finishing;   // Done was tapped: the panel shows progress
    private volatile boolean modelReady;
    private PopupWindow popup;
    private TextView status;
    private ProgressBar level;

    // Recorded audio. The recorder appends; the worker reads [committed, total).
    private final Object audioLock = new Object();
    private float[] audio = new float[RATE * 30];
    private int total;
    private int pendingCut;          // phrase boundary chosen by the recorder (sample index)
    private boolean speechSinceCut;  // the recorder heard speech after pendingCut
    private boolean recorderDone;    // the recorder has stopped and appended its last audio
    private volatile int committed;  // worker: audio before this index is transcribed
    private volatile int phraseFrom;  // the phrase being transcribed now, for the progress estimate
    private volatile int phraseTo;
    private volatile long phraseStart; // 0 when no phrase is being transcribed

    private final StringBuilder context = new StringBuilder();    // text before the cursor + transcript
    private final StringBuilder transcript = new StringBuilder(); // typed when the session ends

    private VoiceController(InputMethodService ime, File model) {
        this.ime = ime;
        this.language = currentLanguage(ime);
        this.model = model;
    }

    /** Patched into the InputMethodService subclass's onCreate(). */
    public static void attach(InputMethodService service) {
        imeRef = new WeakReference<>(service);
        NoGoogleSettings.prefs();
        LocalTranslate.prewarm();
    }

    /**
     * Patched into VoiceInputHandler's LAUNCH_VOICE_IME branch (mic key / voice access point).
     * @return true when handled here (Gboard's own voice input is skipped).
     */
    public static boolean onLaunchVoice(Object data) {
        if (!"whisper".equals(NoGoogleSettings.str(NoGoogleSettings.VOICE_ENGINE))) return false;
        // Gboard auto-starts voice input in some fields; never open the mic without a tap.
        if ("auto start voice".equals(data)) return true;
        InputMethodService ime = imeRef.get();
        if (ime == null) return false;
        new Handler(Looper.getMainLooper()).post(() -> toggle(ime));
        return true;
    }

    private static void toggle(InputMethodService ime) {
        if (active != null) {
            active.stop();
            return;
        }
        if (ime.checkSelfPermission(Manifest.permission.RECORD_AUDIO)
                != PackageManager.PERMISSION_GRANTED) {
            Toast.makeText(ime, "Allow microphone access for offline voice typing",
                    Toast.LENGTH_LONG).show();
            Intent i = new Intent(ime, ModMenuActivity.class)
                    .putExtra(ModMenuActivity.EXTRA_REQUEST_MIC, true)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ime.startActivity(i);
            return;
        }
        File model = Models.mainModel();
        if (model == null) {
            ModMenuActivity.openModels(ime, "Voice typing needs the Whisper model. Download it here.");
            return;
        }
        VoiceController c = new VoiceController(ime, model);
        active = c;
        c.start();
    }

    /** Called when the keyboard hides; stop listening. */
    public static void onFinishInputView() {
        VoiceController c = active;
        if (c != null) c.cancel();
    }

    private void start() {
        IDLE.removeCallbacks(UNLOAD);
        InputConnection ic = ime.getCurrentInputConnection();
        CharSequence before = ic == null ? null : ic.getTextBeforeCursor(200, 0);
        if (before != null) context.append(before);
        showPanel();
        recording = true;
        new Thread(this::record, "nogoogle-voice-rec").start();
        new Thread(this::work, "nogoogle-voice").start();
    }

    private void stop() {
        if (!recording) return;
        recording = false;
        finishing = true;
        main.post(progress);
    }

    private final Runnable progress = this::showProgress;

    /** After Done: the share of the recording transcribed so far (estimated within a phrase). */
    private void showProgress() {
        if (popup == null || cancelled) return;
        if (!modelReady) {
            status.setText("Loading the voice model…");
            level.setProgress(0);
        } else {
            int p = percentDone();
            status.setText("Transcribing… " + p + "%");
            level.setProgress(p);
        }
        main.postDelayed(progress, PROGRESS_EVERY_MS);
    }

    private int percentDone() {
        int all;
        synchronized (audioLock) {
            all = total;
        }
        if (all <= 0) return 0;
        double done = committed;
        long start = phraseStart;
        int from = phraseFrom, to = phraseTo;
        if (start > 0 && to > from) {
            double expectedMs = (to - from) * 1000.0 / RATE * speed;
            double part = Math.min(0.95, (SystemClock.elapsedRealtime() - start) / Math.max(1.0, expectedMs));
            done = from + part * (to - from);
        }
        return (int) Math.max(0, Math.min(99, done * 100 / all));
    }

    private void cancel() {
        cancelled = true;
        recording = false;
        synchronized (audioLock) {
            audioLock.notifyAll();
        }
        // Never wait for model loading or inference on the main thread.
        synchronized (HANDLE_LOCK) {
            if (loadedHandle != 0) NativeEngine.whisperAbort(loadedHandle);
        }
        // Retain active until both threads stop; a new session must not reset their abort flags.
        main.post(this::dismissPanel);
    }

    private void dismissPanel() {
        if (popup != null) {
            try {
                popup.dismiss();
            } catch (Throwable ignored) {
            }
            popup = null;
        }
    }

    private void finish() {
        dismissPanel();
        if (active != this) return;
        active = null;
        IDLE.removeCallbacks(UNLOAD);
        IDLE.postDelayed(UNLOAD, UNLOAD_AFTER_MS);
    }

    private void record() {
        AudioRecord rec = null;
        InputStream testInput = null;
        long vad = 0;
        try {
            File testWav = debug ? new File(NoGoogleSettings.modelsDir().getParentFile(), "voice-test.wav") : null;
            if (testWav != null && testWav.isFile()) {
                // Debug: a 16 kHz mono 16-bit WAV played in real time instead of the microphone.
                testInput = new BufferedInputStream(new FileInputStream(testWav));
                if (testInput.skip(44) != 44) throw new IOException("short test wav");
                Log.i(TAG, "reading " + testWav + " instead of the microphone");
            } else {
                int min = AudioRecord.getMinBufferSize(RATE, AudioFormat.CHANNEL_IN_MONO,
                        AudioFormat.ENCODING_PCM_16BIT);
                rec = new AudioRecord(MediaRecorder.AudioSource.VOICE_RECOGNITION, RATE,
                        AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT,
                        Math.max(min, RATE * 2 * 4)); // 4 s of slack while the model loads
                rec.startRecording();
            }
            File vadModel = Models.vadModel();
            if (vadModel != null && NativeEngine.load()) vad = NativeEngine.vadInit(vadModel.getAbsolutePath());

            final int chunkLen = RATE / 10; // 100 ms
            short[] chunk = new short[chunkLen];
            byte[] raw = new byte[chunkLen * 2];
            float[] vadPending = new float[chunkLen + 512];
            int vadLen = 0;
            boolean vadSpeech = false;
            float[] recentScore = new float[30]; // last 3 s: speech probability (or level)
            int[] recentEnd = new int[30];
            int recentPos = 0;
            boolean autoStop = NoGoogleSettings.bool(NoGoogleSettings.VOICE_AUTO_STOP);
            float noiseFloor = 0.01f;
            boolean heardEver = false;
            int lastCut = 0;
            int firstVoice = -1;   // first speech sample since lastCut
            int lastVoice = 0;     // last speech sample
            long started = SystemClock.elapsedRealtime();
            long nextChunkAt = started;

            while (recording && !cancelled) {
                int n;
                if (testInput != null) {
                    long wait = nextChunkAt - SystemClock.elapsedRealtime();
                    if (wait > 0) Thread.sleep(wait);
                    nextChunkAt += 100;
                    int got = 0;
                    while (got < raw.length) {
                        int r = testInput.read(raw, got, raw.length - got);
                        if (r < 0) break;
                        got += r;
                    }
                    n = chunkLen; // silence after the end of the file
                    for (int i = 0; i < n; i++) {
                        chunk[i] = 2 * i + 1 < got ? (short) ((raw[2 * i] & 0xff) | (raw[2 * i + 1] << 8)) : 0;
                    }
                } else {
                    n = rec.read(chunk, 0, chunkLen);
                    if (n <= 0) continue;
                }
                double sum = 0;
                int end;
                synchronized (audioLock) {
                    if (total + n > audio.length) {
                        if (audio.length >= RATE * MAX_SECONDS) break;
                        float[] grown = new float[Math.min(audio.length * 2, RATE * MAX_SECONDS)];
                        System.arraycopy(audio, 0, grown, 0, total);
                        audio = grown;
                    }
                    for (int i = 0; i < n; i++) {
                        float s = chunk[i] / 32768f;
                        audio[total++] = s;
                        sum += s * s;
                    }
                    end = total;
                }
                float rms = (float) Math.sqrt(sum / n);
                setLevel(rms);

                // Speech or not: Silero VAD when installed (copes with noise), else a level gate.
                boolean speech;
                float score;
                if (vad != 0) {
                    for (int i = 0; i < n; i++) vadPending[vadLen++] = chunk[i] / 32768f;
                    int whole = vadLen / 512 * 512;
                    float[] probs = NativeEngine.vadProbs(vad, Arrays.copyOf(vadPending, whole));
                    System.arraycopy(vadPending, whole, vadPending, 0, vadLen - whole);
                    vadLen -= whole;
                    speech = vadSpeech;
                    score = 0;
                    if (probs != null) {
                        for (float p : probs) {
                            if (vadSpeech ? p < VAD_OFF : p >= VAD_ON) vadSpeech = !vadSpeech;
                            speech |= vadSpeech;
                            score = Math.max(score, p);
                        }
                    }
                } else {
                    speech = rms > Math.max(0.02f, noiseFloor * 3);
                    if (!speech) noiseFloor = noiseFloor * 0.95f + rms * 0.05f;
                    score = rms;
                }
                recentScore[recentPos] = score;
                recentEnd[recentPos] = end;
                recentPos = (recentPos + 1) % recentScore.length;

                if (speech) {
                    heardEver = true;
                    if (firstVoice < 0) firstVoice = end - n;
                    lastVoice = end;
                    synchronized (audioLock) {
                        speechSinceCut = true;
                    }
                }
                int silenceMs = (end - lastVoice) * 1000 / RATE;
                int spokenMs = firstVoice < 0 ? 0 : (lastVoice - firstVoice) * 1000 / RATE;

                int cut = -1;
                if (firstVoice >= 0 && (silenceMs >= PAUSE_MS && spokenMs >= MIN_PHRASE_MS
                        || silenceMs >= LONG_PAUSE_MS)) {
                    cut = end;
                } else if ((end - lastCut) * 1000L / RATE >= MAX_PHRASE_MS) {
                    int q = 0; // least speech-like moment of the last 3 s
                    for (int i = 1; i < recentScore.length; i++) if (recentScore[i] < recentScore[q]) q = i;
                    cut = recentEnd[q] > lastCut ? recentEnd[q] : end;
                }
                if (cut > 0) {
                    if (debug) {
                        Log.i(TAG, String.format(Locale.ROOT, "cut at %.2fs (spoken %d ms, silence %d ms, vad %s)",
                                cut / (float) RATE, spokenMs, silenceMs, vad != 0));
                    }
                    lastCut = cut;
                    firstVoice = lastVoice > cut ? cut : -1;
                    synchronized (audioLock) {
                        pendingCut = cut;
                        speechSinceCut = lastVoice > cut;
                        audioLock.notifyAll();
                    }
                }

                if (autoStop) {
                    if (heardEver && silenceMs > AUTO_STOP_MS) break;
                    if (!heardEver && SystemClock.elapsedRealtime() - started > 8000) break;
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "recording failed", t);
            fail("Microphone error: " + t.getMessage());
        } finally {
            if (recording) stop(); // auto-stop / limit reached: show "Transcribing…"
            recording = false;
            if (rec != null) {
                try {
                    rec.stop();
                } catch (Throwable ignored) {
                }
                rec.release();
            }
            if (testInput != null) {
                try {
                    testInput.close();
                } catch (IOException ignored) {
                }
            }
            if (vad != 0) NativeEngine.vadFree(vad);
            synchronized (audioLock) {
                recorderDone = true;
                audioLock.notifyAll();
            }
        }
    }

    private void work() {
        try {
            // Recording is already running: the model loads while the user talks.
            long t0 = SystemClock.elapsedRealtime();
            if (!NativeEngine.load()) {
                fail("Offline voice engine missing from this build");
                cancel();
                return;
            }
            if (ensureLoaded(model) == 0) {
                fail("Could not load " + model.getName());
                cancel();
                return;
            }
            if (debug) Log.i(TAG, "model ready in " + (SystemClock.elapsedRealtime() - t0) + " ms");
            modelReady = true;
            NativeEngine.whisperResetAbort(loadedHandle);
            while (!cancelled) {
                int cut;
                boolean stillRecording;
                boolean speech;
                int end;
                synchronized (audioLock) {
                    if (pendingCut <= committed && recording) audioLock.wait(120);
                    cut = pendingCut;
                    stillRecording = recording;
                    speech = speechSinceCut;
                    end = total;
                }
                if (cancelled) break;
                if (cut > committed) {
                    transcribe(committed, cut);
                    committed = cut;
                    continue;
                }
                if (!stillRecording) {
                    synchronized (audioLock) { // let the recorder append its last chunk
                        while (!recorderDone && !cancelled) audioLock.wait(50);
                        end = total;
                        speech = speechSinceCut;
                        if (pendingCut > committed) continue;
                    }
                    if (speech && end - committed > RATE / 3) transcribe(committed, end);
                    break;
                }
            }
            String text = transcript.toString();
            if (!cancelled && !text.isEmpty()) main.post(() -> {
                if (!cancelled) type(text); // cancel() runs on this thread too
            });
        } catch (Throwable t) {
            Log.e(TAG, "voice session failed", t);
            fail("Voice typing failed: " + t.getMessage());
        } finally {
            // Also drain the recorder on cancellation or an inference/load failure.
            recording = false;
            boolean interrupted = false;
            synchronized (audioLock) {
                while (!recorderDone) {
                    try {
                        audioLock.wait();
                    } catch (InterruptedException e) {
                        interrupted = true;
                    }
                }
            }
            if (interrupted) Thread.currentThread().interrupt();
            dumpAudio();
            main.post(this::finish);
        }
    }

    /** Development aid: an empty file "voice-debug" next to models/ turns on phrase logs and audio dumps. */
    private static boolean debugEnabled() {
        File models = NoGoogleSettings.modelsDir();
        return models != null && new File(models.getParentFile(), "voice-debug").exists();
    }

    private void dumpAudio() {
        if (!debug) return;
        File models = NoGoogleSettings.modelsDir();
        File out = new File(models.getParentFile(), "voice-" + System.currentTimeMillis() + ".wav");
        int n;
        short[] pcm;
        synchronized (audioLock) {
            n = total;
            pcm = new short[n];
            for (int i = 0; i < n; i++) pcm[i] = (short) Math.max(-32768, Math.min(32767, audio[i] * 32768f));
        }
        try (java.io.DataOutputStream o = new java.io.DataOutputStream(new java.io.FileOutputStream(out))) {
            java.nio.ByteBuffer b = java.nio.ByteBuffer.allocate(44 + 2 * n).order(java.nio.ByteOrder.LITTLE_ENDIAN);
            b.put("RIFF".getBytes()).putInt(36 + 2 * n).put("WAVEfmt ".getBytes()).putInt(16)
                    .putShort((short) 1).putShort((short) 1).putInt(RATE).putInt(RATE * 2)
                    .putShort((short) 2).putShort((short) 16).put("data".getBytes()).putInt(2 * n);
            for (short v : pcm) b.putShort(v);
            o.write(b.array());
            Log.i(TAG, "session audio saved to " + out);
        } catch (Throwable t) {
            Log.w(TAG, "could not save session audio", t);
        }
    }

    private float[] slice(int from, int to) {
        synchronized (audioLock) {
            float[] out = new float[to - from];
            System.arraycopy(audio, from, out, 0, to - from);
            return out;
        }
    }

    private void transcribe(int from, int to) {
        if (to - from < RATE / 3) return;
        long t0 = SystemClock.elapsedRealtime();
        phraseFrom = from;
        phraseTo = to;
        phraseStart = t0;
        String text = NativeEngine.whisperTranscribe(loadedHandle, slice(from, to), language,
                threads(), 5, false, prompt(), ctxPad(model));
        long took = SystemClock.elapsedRealtime() - t0;
        phraseStart = 0;
        if (text != null && to - from > RATE) speed = 0.7f * speed + 0.3f * took / ((to - from) * 1000f / RATE);
        if (cancelled || text == null) return;
        String t = clean(text);
        if (debug) {
            Log.i(TAG, String.format(Locale.ROOT, "phrase %.2f-%.2fs in %d ms: %s", from / (float) RATE,
                    to / (float) RATE, took, t));
        }
        if (t.isEmpty() || isNoise(t)) return;
        String sep = spaceless() ? "" : " ";
        context.append(context.length() == 0 ? "" : sep).append(t);
        transcript.append(transcript.length() == 0 ? "" : sep).append(t);
    }

    /** The last words before the phrase, as Whisper's prompt (keeps casing and spelling consistent). */
    private String prompt() {
        int start = Math.max(0, context.length() - 160);
        String p = context.substring(start).trim();
        int space = p.indexOf(' ');
        if (start > 0 && space > 0) p = p.substring(space + 1); // start on a word boundary
        return p.isEmpty() ? null : p;
    }

    private static int ctxPad(File model) {
        return Models.isAcft(model) ? ACFT_PAD : -1;
    }

    /** Drops Whisper's non-speech annotations: [Music], (applause), *laughs*, ♪. */
    private static String clean(String text) {
        return text.replaceAll("\\[[^\\]]*\\]|\\([^)]*\\)|\\*[^*]*\\*|[♪♫♬]", " ")
                .replaceAll("\\s+", " ").trim();
    }

    /** Whisper hallucinations on silence. */
    private static boolean isNoise(String t) {
        String s = t.replaceAll("[\\p{Punct}\\s]", "").toLowerCase(Locale.ROOT);
        return s.isEmpty() || s.equals("blankaudio") || s.equals("music") || s.equals("silence");
    }

    private void type(String text) {
        InputConnection ic = ime.getCurrentInputConnection();
        if (ic == null) return;
        ic.commitText(withLeadingSpace(ic, text), 1);
    }

    /** Languages written without spaces between words. */
    private boolean spaceless() {
        switch (language) {
            case "ja":
            case "zh":
            case "yue":
            case "th":
            case "lo":
            case "my":
            case "km":
            case "bo":
                return true;
            default:
                return false;
        }
    }

    private String withLeadingSpace(InputConnection ic, String text) {
        if (spaceless()) return text;
        CharSequence before = ic.getTextBeforeCursor(1, 0);
        if (before != null && before.length() > 0 && !Character.isWhitespace(before.charAt(0))) {
            return " " + text;
        }
        return text;
    }

    private static long ensureLoaded(File model) {
        synchronized (MODEL_LOCK) {
            String path = model.getAbsolutePath();
            if (path.equals(loadedPath) && loadedHandle != 0) return loadedHandle;
            freeHandle();
            // CPU only: the Mali GPU via Vulkan measured 8-13x slower than the CPU.
            long h = NativeEngine.whisperInit(path, false);
            synchronized (HANDLE_LOCK) { loadedHandle = h; }
            loadedPath = loadedHandle != 0 ? path : null;
            return loadedHandle;
        }
    }

    /** Caller holds MODEL_LOCK, with no session using the handle. */
    private static void freeHandle() {
        long h;
        synchronized (HANDLE_LOCK) {
            h = loadedHandle;
            loadedHandle = 0;
        }
        if (h != 0) NativeEngine.whisperFree(h);
    }

    /** Frees the loaded model (idle timeout / mod menu). */
    public static void releaseModels() {
        if (active != null) return;
        synchronized (MODEL_LOCK) {
            freeHandle();
            loadedPath = null;
        }
    }

    private static int threads() {
        return Math.max(1, NoGoogleSettings.integer(NoGoogleSettings.VOICE_THREADS));
    }

    /** Whisper language code for the active keyboard language ("" = auto-detect). */
    private static String currentLanguage(Context context) {
        try {
            InputMethodManager imm = context.getSystemService(InputMethodManager.class);
            InputMethodSubtype st = imm.getCurrentInputMethodSubtype();
            String tag = st == null ? "" : st.getLanguageTag();
            if (tag == null || tag.isEmpty()) tag = st == null ? "" : st.getLocale();
            String lang = tag.replace('_', '-').split("-")[0].toLowerCase(Locale.ROOT);
            switch (lang) {
                case "iw": return "he";
                case "in": return "id";
                case "ji": return "yi";
                case "fil": return "tl";
                case "nb":
                case "nn": return "no";
                default: return lang.length() == 2 || lang.length() == 3 ? lang : "";
            }
        } catch (Throwable t) {
            return "";
        }
    }

    private String label() {
        String lang = language.isEmpty() ? "auto" : new Locale(language).getDisplayLanguage();
        return "Listening · " + lang + ". Tap Done when finished";
    }

    private void setLevel(float rms) {
        int v = (int) Math.min(100, rms * 400);
        main.post(() -> {
            if (level != null && !finishing) level.setProgress(v);
        });
    }

    private void fail(String message) {
        main.post(() -> Toast.makeText(ime, message, Toast.LENGTH_LONG).show());
    }

    private int dp(float v) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v,
                ime.getResources().getDisplayMetrics());
    }

    /**
     * Top of the keyboard's visible area in the keyboard window's coordinates (which is what the
     * panel's position is relative to), or -1 when unknown.
     */
    private int keyboardTop(View decor) {
        try {
            InputMethodService.Insets insets = new InputMethodService.Insets();
            ime.onComputeInsets(insets);
            int top = insets.visibleTopInsets;
            return top > 0 && top < decor.getHeight() ? top : -1;
        } catch (Throwable t) {
            return -1;
        }
    }

    private void showPanel() {
        try {
            View decor = ime.getWindow().getWindow().getDecorView();
            boolean dark = (ime.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            int bg = dark ? 0xF0202124 : 0xF0F1F3F4;
            int fg = dark ? Color.WHITE : 0xFF202124;

            LinearLayout root = new LinearLayout(ime);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setPadding(dp(16), dp(12), dp(16), dp(12));
            GradientDrawable shape = new GradientDrawable();
            shape.setColor(bg);
            shape.setCornerRadius(dp(16));
            root.setBackground(shape);

            status = new TextView(ime);
            status.setTextColor(fg);
            status.setTextSize(15);
            status.setText(label());
            root.addView(status);

            level = new ProgressBar(ime, null, android.R.attr.progressBarStyleHorizontal);
            level.setMax(100);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(6));
            lp.topMargin = dp(8);
            root.addView(level, lp);

            LinearLayout buttons = new LinearLayout(ime);
            buttons.setGravity(Gravity.END);
            Button cancel = new Button(ime, null, android.R.attr.borderlessButtonStyle);
            cancel.setText("Cancel");
            cancel.setTextColor(fg);
            cancel.setOnClickListener(v -> cancel());
            Button done = new Button(ime, null, android.R.attr.borderlessButtonStyle);
            done.setText("Done");
            done.setTextColor(fg);
            done.setOnClickListener(v -> stop());
            buttons.addView(cancel);
            buttons.addView(done);
            root.addView(buttons);

            int width = decor.getWidth() - dp(16);
            popup = new PopupWindow(root, width, ViewGroup.LayoutParams.WRAP_CONTENT);
            popup.setClippingEnabled(false);
            int top = keyboardTop(decor);
            if (top > 0) { // above the keyboard, which stays visible
                root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                int y = Math.max(0, top - root.getMeasuredHeight() - dp(8));
                popup.showAtLocation(decor, Gravity.TOP | Gravity.CENTER_HORIZONTAL, 0, y);
            } else {
                popup.showAtLocation(decor, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL, 0, dp(8));
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not show voice panel", t);
            Toast.makeText(ime, "Listening… tap the mic again to stop", Toast.LENGTH_SHORT).show();
        }
    }
}
