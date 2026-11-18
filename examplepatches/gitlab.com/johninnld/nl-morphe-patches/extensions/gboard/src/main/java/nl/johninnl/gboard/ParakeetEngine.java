package nl.johninnl.gboard;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;

import com.k2fsa.sherpa.onnx.FeatureConfig;
import com.k2fsa.sherpa.onnx.LibraryLoader;
import com.k2fsa.sherpa.onnx.OfflineModelConfig;
import com.k2fsa.sherpa.onnx.OfflineRecognizer;
import com.k2fsa.sherpa.onnx.OfflineRecognizerConfig;
import com.k2fsa.sherpa.onnx.OfflineStream;
import com.k2fsa.sherpa.onnx.OfflineTransducerModelConfig;
import com.k2fsa.sherpa.onnx.SileroVadModelConfig;
import com.k2fsa.sherpa.onnx.Vad;
import com.k2fsa.sherpa.onnx.VadModelConfig;

import java.io.File;

/**
 * Holds one loaded Parakeet recognizer. Loading costs about a second and several hundred
 * MB, so it is kept between dictations and released after a few idle minutes.
 */
final class ParakeetEngine {
    private static final String TAG = "MorpheParakeet";
    static final int SAMPLE_RATE = 16_000;
    private static final long IDLE_RELEASE_MS = 5 * 60_000L;

    private static final Object LOCK = new Object();
    /** Beam width for decoding with the voice correction list; wider beams did not find more words. */
    private static final int ACTIVE_PATHS = 4;

    private static OfflineRecognizer recognizer;
    private static String loadedModel;
    /** The list the recognizer was loaded for; null when it decodes greedily without one. */
    private static ParakeetDictionary.Prepared loadedDictionary;
    private static volatile boolean libraryLoaded;
    private static Handler releaser;
    private static final Runnable RELEASE = ParakeetEngine::release;

    private ParakeetEngine() {}

    /** Decodes a live partial of 16 kHz mono samples, without the voice correction list. */
    static String transcribe(Context context, float[] samples, int count) {
        synchronized (LOCK) {
            cancelRelease();
            try {
                return decode(load(context, false), audio(samples, count), "");
            } finally {
                scheduleRelease();
            }
        }
    }

    /**
     * Decodes a finished utterance. With the voice correction list this boosts its entries,
     * looks for sound-alike misspellings and keeps a correction only when a second decode with
     * just that entry boosted writes it too.
     */
    static String transcribeFinal(Context context, float[] samples, int count) {
        synchronized (LOCK) {
            cancelRelease();
            try {
                final OfflineRecognizer active = load(context, false);
                final float[] audio = audio(samples, count);
                ParakeetDictionary.Prepared list = loadedDictionary;
                if (list == null || list.dictionary.isEmpty()) return decode(active, audio, "");
                long start = System.nanoTime();
                DictionaryDecoder.Result result = DictionaryDecoder.transcribe(
                        hotwords -> decode(active, audio, hotwords), list.dictionary);
                Log.i(TAG, "Final decode with the voice correction list: " + result.proposed.size() + " sound-alike, "
                        + result.accepted.size() + " confirmed, " + (System.nanoTime() - start) / 1_000_000 + " ms");
                return result.text;
            } finally {
                scheduleRelease();
            }
        }
    }

    private static float[] audio(float[] samples, int count) {
        return count == samples.length ? samples : java.util.Arrays.copyOf(samples, count);
    }

    private static String decode(OfflineRecognizer active, float[] audio, String hotwords) {
        OfflineStream stream = hotwords.isEmpty() ? active.createStream() : active.createStream(hotwords);
        try {
            stream.acceptWaveform(audio, SAMPLE_RATE);
            active.decode(stream);
            String text = active.getResult(stream).getText();
            return text == null ? "" : text.trim();
        } finally {
            stream.release();
        }
    }

    /**
     * Loads the model ahead of the first utterance so speaking does not wait for it, and reloads it
     * when the voice correction list changed since the last session.
     */
    static void warm(Context context) {
        synchronized (LOCK) {
            cancelRelease();
            try {
                load(context, true);
            } catch (RuntimeException | UnsatisfiedLinkError e) {
                Log.w(TAG, "Preloading Parakeet failed", e);
            } finally {
                scheduleRelease();
            }
        }
    }

    /**
     * The loaded recognizer for the selected model. Only {@code refresh} (at session start) reads
     * the voice correction list again and reloads for a changed list, so a session never pauses.
     */
    private static OfflineRecognizer load(Context context, boolean refresh) {
        ParakeetCatalog.Model model = ParakeetStore.selectedModel(context);
        ParakeetDictionary.Prepared list = refresh || recognizer == null ? ParakeetDictionary.prepare(context) : loadedDictionary;
        if (list != null && list.dictionary.isEmpty()) list = null;
        if (recognizer != null && model.id.equals(loadedModel) && sameVocab(list, loadedDictionary)) {
            loadedDictionary = list;
            return recognizer;
        }
        releaseRecognizer();
        ensureLibrary(context);
        File dir = ParakeetStore.modelDir(context, model);
        OfflineTransducerModelConfig transducer = OfflineTransducerModelConfig.builder()
                .setEncoder(new File(dir, ParakeetCatalog.ENCODER).getPath())
                .setDecoder(new File(dir, ParakeetCatalog.DECODER).getPath())
                .setJoiner(new File(dir, ParakeetCatalog.JOINER).getPath())
                .build();
        OfflineModelConfig.Builder modelConfig = OfflineModelConfig.builder()
                .setTransducer(transducer)
                .setTokens(new File(dir, ParakeetCatalog.TOKENS).getPath())
                .setModelType("nemo_transducer")
                .setNumThreads(threads());
        // sherpa-onnx builds its decoder once per recognizer, so a list means beam search for
        // every decode; partials still decode without hotwords.
        if (list != null) modelConfig.setModelingUnit("bpe").setBpeVocab(list.vocab.getPath());
        OfflineRecognizerConfig.Builder config = OfflineRecognizerConfig.builder()
                .setFeatureConfig(FeatureConfig.builder().setSampleRate(SAMPLE_RATE).setFeatureDim(80).build())
                .setOfflineModelConfig(modelConfig.setDebug(false).build())
                .setDecodingMethod(list == null ? "greedy_search" : "modified_beam_search");
        if (list != null) config.setMaxActivePaths(ACTIVE_PATHS).setHotwordsScore(CorrectionDictionary.BOOST);
        long start = System.nanoTime();
        recognizer = new OfflineRecognizer(config.build());
        loadedModel = model.id;
        loadedDictionary = list;
        Log.i(TAG, "Loaded " + model.id + (list == null ? "" : " with the voice correction list") + " in "
                + (System.nanoTime() - start) / 1_000_000 + " ms");
        return recognizer;
    }

    private static boolean sameVocab(ParakeetDictionary.Prepared a, ParakeetDictionary.Prepared b) {
        if (a == null || b == null) return a == b;
        return a.vocab.equals(b.vocab);
    }

    /** Loads the verified runtime once, instead of sherpa-onnx's own library search. */
    static void ensureLibrary(Context context) {
        synchronized (ParakeetEngine.class) {
            if (libraryLoaded) return;
            LibraryLoader.setAutoLoadEnabled(false);
            File library = ParakeetStore.runtimeLibrary(context);
            if (!ParakeetStore.sealLibrary(library)) Log.w(TAG, "Could not make the speech runtime read-only");
            System.load(library.getPath());
            libraryLoaded = true;
        }
    }

    /** A Silero VAD for one voice session, scoring 512-sample windows at 16 kHz. */
    static Vad createVad(Context context) {
        ensureLibrary(context);
        SileroVadModelConfig silero = SileroVadModelConfig.builder()
                .setModel(ParakeetStore.vadModel(context).getPath())
                .setWindowSize(Endpointer.WINDOW_SAMPLES)
                .build();
        return new Vad(VadModelConfig.builder()
                .setSileroVadModelConfig(silero)
                .setSampleRate(SAMPLE_RATE)
                .setNumThreads(1)
                .setDebug(false)
                .build());
    }

    /** Big-core count on typical phones; never more than four, never fewer than two. */
    static int threads() {
        int cores = Runtime.getRuntime().availableProcessors();
        return Math.max(2, Math.min(4, cores / 2));
    }

    static void release() {
        synchronized (LOCK) {
            releaseLocked();
        }
    }

    private static void releaseLocked() {
        releaseRecognizer();
        ParakeetDictionary.release();
    }

    private static void releaseRecognizer() {
        if (recognizer != null) {
            recognizer.release();
            recognizer = null;
            loadedModel = null;
            loadedDictionary = null;
        }
    }

    private static Handler releaser() {
        if (releaser == null) {
            HandlerThread thread = new HandlerThread("MorpheParakeetIdle");
            thread.start();
            releaser = new Handler(thread.getLooper());
        }
        return releaser;
    }

    private static void cancelRelease() {
        releaser().removeCallbacks(RELEASE);
    }

    private static void scheduleRelease() {
        releaser().postDelayed(RELEASE, IDLE_RELEASE_MS);
    }
}
