package nl.johninnl.gboard;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.inputmethodservice.InputMethodService;
import android.media.MediaRecorder;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.inputmethod.InputConnection;

import com.k2fsa.sherpa.onnx.Vad;

import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Gboard's speech recognizer backed by Parakeet.
 *
 * <p>The patch makes this class implement Gboard's recognizer interface and returns it from
 * Gboard's recognizer factory whenever Parakeet is switched on and installed, so the mic
 * key, its listening animation, text insertion and spacing all stay Gboard's own. Each
 * instance serves one voice session. Utterances are cut at pauses; every utterance is shown
 * live while it is spoken and committed when it ends, in whichever language it was spoken.
 *
 * <p>The {@code cb*} methods are placeholders: the patch replaces their bodies with calls
 * into Gboard's callback interface, whose names change between Gboard builds.
 */
public final class ParakeetRecognizer {
    private static final String TAG = "MorpheParakeet";
    private static final int PARTIAL_EVERY_WINDOWS = 25;

    static final int ERROR_AUDIO = 0;
    static final int ERROR_NO_SPEECH = 1;
    static final int ERROR_OTHER = 2;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile WeakReference<InputMethodService> keyboard = new WeakReference<>(null);

    /** Called by the patch when Gboard's keyboard service is created. */
    public static void attachService(InputMethodService service) {
        keyboard = new WeakReference<>(service);
    }

    /** Set when the native runtime could not load; Gboard's own voice typing then stays in use. */
    private static volatile boolean runtimeBroken;

    private final Context context;
    private final ExecutorService decoder = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "MorpheParakeetDecode");
        thread.setPriority(Thread.NORM_PRIORITY + 1);
        return thread;
    });
    private final AtomicBoolean started = new AtomicBoolean();
    private final AtomicBoolean stopListeningSent = new AtomicBoolean();
    private final AtomicBoolean finished = new AtomicBoolean();
    private volatile boolean listening;
    private volatile boolean cancelled;
    private volatile Object callback;
    private volatile int utterance;
    private volatile boolean decodePending;
    private volatile String lastPartial;
    /** Utterances committed this session; Gboard joins results as they come, so later ones bring a space. */
    private int committed;

    private ParakeetRecognizer(Context context) {
        this.context = context;
    }

    /** Called from Gboard's recognizer factory; null keeps Gboard's own recognizer. */
    public static ParakeetRecognizer create(Context context) {
        try {
            if (context == null || runtimeBroken || !ParakeetStore.active(context)) return null;
            if (context.checkSelfPermission(Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED) {
                return null;
            }
            Context app = context.getApplicationContext();
            return new ParakeetRecognizer(app != null ? app : context);
        } catch (Throwable t) {
            Log.w(TAG, "Parakeet unavailable, using Gboard voice typing", t);
            return null;
        }
    }

    // ---- Gboard recognizer interface, wired by the patch ----

    public void start(Object callback) {
        if (!started.compareAndSet(false, true)) return;
        this.callback = callback;
        listening = true;
        Thread capture = new Thread(this::capture, "MorpheParakeetMic");
        capture.setPriority(Thread.MAX_PRIORITY);
        capture.start();
    }

    /** The user closed the microphone: finish the current utterance, then end the session. */
    public void stopListening() {
        listening = false;
    }

    /** Gboard cancelled the session: stop without delivering anything further. */
    public void stopRecognition() {
        cancelled = true;
        listening = false;
        decoder.shutdownNow();
    }

    public void shutdown() {
        stopRecognition();
    }

    /** Gboard can resend a failed batch request; Parakeet has nothing to resend. */
    public void retry(Object callback) {
        cbStopRecognition(callback);
    }

    // ---- Session ----

    private void capture() {
        Object cb = callback;
        AudioRecord record = null;
        Vad vad = null;
        Endpointer endpointer = new Endpointer();
        FloatBuffer current = new FloatBuffer();
        float[][] preroll = new float[Endpointer.PREROLL_WINDOWS][];
        int prerollNext = 0;
        int sincePartial = 0;
        boolean noSpeech = false;
        try {
            try {
                vad = ParakeetEngine.createVad(context);
            } catch (Throwable t) {
                if (t instanceof UnsatisfiedLinkError || t instanceof NoClassDefFoundError) runtimeBroken = true;
                Log.w(TAG, "Speech detection unavailable", t);
                fail(cb, ERROR_OTHER);
                return;
            }
            int minimum = AudioRecord.getMinBufferSize(ParakeetEngine.SAMPLE_RATE,
                    AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT);
            record = new AudioRecord(MediaRecorder.AudioSource.VOICE_RECOGNITION, ParakeetEngine.SAMPLE_RATE,
                    AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT,
                    Math.max(minimum, ParakeetEngine.SAMPLE_RATE / 2 * 2));
            if (record.getState() != AudioRecord.STATE_INITIALIZED) throw new IllegalStateException("microphone");
            record.startRecording();
            if (record.getRecordingState() != AudioRecord.RECORDSTATE_RECORDING) {
                throw new IllegalStateException("microphone busy");
            }
            decoder.execute(() -> ParakeetEngine.warm(context));
            ParakeetDictionary.onSessionStart(context);
            // Like Gboard's own engines: open the keyboard's dictation session, then listen.
            cbReady(cb);
            cbListening(cb);

            short[] pcm = new short[Endpointer.WINDOW_SAMPLES];
            int windows = 0;
            while (listening && !cancelled) {
                int read = readFully(record, pcm);
                if (read < pcm.length) throw new IllegalStateException("microphone read " + read);
                float[] window = new float[read];
                for (int i = 0; i < read; i++) window[i] = pcm[i] / 32768f;
                preroll[prerollNext] = window;
                prerollNext = (prerollNext + 1) % preroll.length;

                int event = endpointer.push(vad.compute(window), Endpointer.levelDb(pcm, read));
                if (++windows % 3 == 0) cbLevel(cb, endpointer.meter());
                if (event == Endpointer.UTTERANCE_START) {
                    // Like Gboard's own on-device engine: start of speech for every utterance.
                    cbSpeech(cb);
                    current.clear();
                    for (int i = 0; i < preroll.length; i++) {
                        float[] previous = preroll[(prerollNext + i) % preroll.length];
                        if (previous != null) current.append(previous);
                    }
                    sincePartial = 0;
                } else if (event == Endpointer.UTTERANCE_END) {
                    current.append(window);
                    cbListening(cb);
                    finishUtterance(cb, current.copy());
                    current.clear();
                } else if (event == Endpointer.UTTERANCE_DROPPED) {
                    cbListening(cb);
                    dropUtterance();
                    current.clear();
                } else if (event == Endpointer.SESSION_END) {
                    break;
                } else if (event == Endpointer.NO_SPEECH) {
                    noSpeech = true;
                    break;
                } else if (endpointer.inUtterance()) {
                    current.append(window);
                    if (++sincePartial >= PARTIAL_EVERY_WINDOWS && !decodePending && endpointer.utteranceHasSpeech()) {
                        sincePartial = 0;
                        partial(cb, current.copy());
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Microphone failed", t);
            release(record);
            if (vad != null) vad.release();
            fail(cb, ERROR_AUDIO);
            return;
        }
        release(record);
        vad.release();
        if (cancelled) return;
        if (endpointer.utteranceHasSpeech() && current.size() > 0) finishUtterance(cb, current.copy());
        signalStopListening(cb);
        final boolean silent = noSpeech && !endpointer.heardSpeech();
        execute(() -> {
            if (cancelled || !finished.compareAndSet(false, true)) return;
            if (silent) {
                cbError(cb, ERROR_NO_SPEECH);
            } else {
                cbStopRecognition(cb);
            }
            decoder.shutdown();
        });
    }

    /** Too little speech to transcribe: forget it, including any text shown for it. */
    private void dropUtterance() {
        utterance++;
        final String shown = lastPartial;
        lastPartial = null;
        if (shown != null) Log.i(TAG, "Dropped a short utterance after showing a partial");
    }

    private void partial(Object cb, float[] audio) {
        final int id = utterance;
        decodePending = true;
        execute(() -> {
            try {
                if (cancelled || id != utterance) return;
                String text = ParakeetEngine.transcribe(context, audio, audio.length);
                if (!cancelled && id == utterance && !text.isEmpty()) {
                    lastPartial = text;
                    cbResult(cb, separated(text), false);
                }
            } catch (Throwable t) {
                decodeFailed(cb, t);
            } finally {
                decodePending = false;
            }
        });
    }

    private void finishUtterance(Object cb, float[] audio) {
        final int id = utterance;
        utterance = id + 1;
        execute(() -> {
            try {
                if (cancelled) return;
                String text = ParakeetEngine.transcribeFinal(context, audio, audio.length);
                String partial = lastPartial;
                lastPartial = null;
                if (text.isEmpty()) text = partial == null ? "" : partial;
                if (!cancelled && !text.isEmpty()) {
                    String sent = separated(text);
                    cbResult(cb, sent, true);
                    if (committed > 0) restoreCase(sent);
                    committed++;
                }
            } catch (Throwable t) {
                decodeFailed(cb, t);
            }
        });
        if (id == 0) Log.i(TAG, "First utterance " + audio.length * 1000L / ParakeetEngine.SAMPLE_RATE + " ms");
    }

    /**
     * Gboard lower-cases the first letter of every result after the first in a dictation. Put
     * the recognized capital back once Gboard has committed the text, but only when the text
     * before the cursor is exactly what was sent apart from that one letter.
     */
    static void restoreCase(String sent) {
        int letter = 0;
        while (letter < sent.length() && Character.isWhitespace(sent.charAt(letter))) letter++;
        if (letter >= sent.length()) return;
        int first = sent.codePointAt(letter);
        if (!Character.isUpperCase(first)) return;
        String lowered = sent.substring(0, letter) + new String(Character.toChars(Character.toLowerCase(first)))
                + sent.substring(letter + Character.charCount(first));
        if (lowered.length() != sent.length()) return;
        attempt(sent, lowered, 0);
    }

    private static void attempt(String sent, String lowered, int tries) {
        MAIN.postDelayed(() -> {
            InputMethodService service = keyboard.get();
            InputConnection connection = service == null ? null : service.getCurrentInputConnection();
            if (connection == null) return;
            CharSequence before = connection.getTextBeforeCursor(sent.length(), 0);
            String text = before == null ? "" : before.toString();
            if (text.equals(sent)) return;
            if (text.equals(lowered)) {
                connection.beginBatchEdit();
                connection.deleteSurroundingText(sent.length(), 0);
                connection.commitText(sent, 1);
                connection.endBatchEdit();
                return;
            }
            if (tries < 6) attempt(sent, lowered, tries + 1);
        }, tries == 0 ? 150 : 120);
    }

    /** Decoder thread only. */
    private String separated(String text) {
        return committed > 0 ? " " + text : text;
    }

    private void decodeFailed(Object cb, Throwable t) {
        Log.w(TAG, "Parakeet decoding failed", t);
        if (t instanceof UnsatisfiedLinkError || t instanceof NoClassDefFoundError) runtimeBroken = true;
        listening = false;
        fail(cb, ERROR_OTHER);
    }

    private void fail(Object cb, int kind) {
        if (cancelled || !finished.compareAndSet(false, true)) return;
        cancelled = true;
        cbError(cb, kind);
        decoder.shutdownNow();
    }

    private void signalStopListening(Object cb) {
        if (stopListeningSent.compareAndSet(false, true)) cbStopListening(cb);
    }

    private void execute(Runnable task) {
        try {
            decoder.execute(task);
        } catch (RuntimeException ignored) {
            // Shut down after cancellation; nothing more to deliver.
        }
    }

    private static int readFully(AudioRecord record, short[] buffer) {
        int offset = 0;
        while (offset < buffer.length) {
            int n = record.read(buffer, offset, buffer.length - offset);
            if (n <= 0) return offset > 0 ? offset : n;
            offset += n;
        }
        return offset;
    }

    private static void release(AudioRecord record) {
        if (record == null) return;
        try {
            if (record.getRecordingState() == AudioRecord.RECORDSTATE_RECORDING) record.stop();
        } catch (RuntimeException ignored) {
            // Already stopped.
        }
        record.release();
    }

    /** Growable float array for one utterance. */
    static final class FloatBuffer {
        private float[] data = new float[ParakeetEngine.SAMPLE_RATE * 4];
        private int size;

        void append(float[] samples) {
            if (size + samples.length > data.length) data = Arrays.copyOf(data, Math.max(data.length * 2, size + samples.length));
            System.arraycopy(samples, 0, data, size, samples.length);
            size += samples.length;
        }

        void clear() {
            size = 0;
        }

        int size() {
            return size;
        }

        float[] copy() {
            return Arrays.copyOf(data, size);
        }
    }

    // ---- Placeholders the patch replaces with Gboard callback calls ----

    static void cbReady(Object callback) {}

    static void cbListening(Object callback) {}

    static void cbSpeech(Object callback) {}

    static void cbLevel(Object callback, int level) {}

    static void cbResult(Object callback, String text, boolean isFinal) {}

    static void cbStopListening(Object callback) {}

    static void cbStopRecognition(Object callback) {}

    static void cbError(Object callback, int kind) {}
}
