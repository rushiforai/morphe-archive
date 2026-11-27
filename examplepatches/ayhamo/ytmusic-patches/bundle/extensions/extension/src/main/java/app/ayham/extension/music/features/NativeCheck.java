package app.ayham.extension.music.features;

import android.content.Context;
import android.media.AudioFormat;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import com.music.bitchord.playback.smart.MelSpectrogram;
import com.music.bitchord.playback.smart.TrackFeatures;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.Collections;
import java.util.Map;

import ai.onnxruntime.NodeInfo;
import ai.onnxruntime.OnnxTensor;
import ai.onnxruntime.OrtEnvironment;
import ai.onnxruntime.OrtSession;

/**
 * Developer check of the native libraries (PLAN.md items 4 and 5). Runs once per process when spike.properties
 * has batchB=1:
 * <ol>
 * <li>next track id from YT's queue (through Morphe's Jam bridge)</li>
 * <li>download it with Morphe's stream resolver and range requests</li>
 * <li>decode to mono float PCM with MediaCodec</li>
 * <li>BitChord's native analyser on it</li>
 * <li>both ONNX models (the APK's assets/automix) load; Beat This! runs on one chunk of the track</li>
 * </ol>
 */
final class NativeCheck {
    private static final String TAG = "AyhamNativeCheck";
    private static boolean started;

    private NativeCheck() {
    }

    static void start(Context ctx, String forcedVideoId) {
        if (started) return;
        started = true;
        Log.i(TAG, "batch B start");
        new Thread(() -> loadNative(ctx), "NativeCheck-native").start();
        if (forcedVideoId != null && !forcedVideoId.isEmpty()) {
            new Thread(() -> analyseTrack(ctx, forcedVideoId), "NativeCheck-track").start();
        } else {
            // Give YT time to set up its session and queue.
            new Handler(Looper.getMainLooper()).postDelayed(() -> findNextTrack(ctx), 8000);
        }
    }

    // ---- Item 4: native libraries + models ----

    private static volatile boolean nativeOk;

    private static void loadNative(Context ctx) {
        long t0 = System.nanoTime();
        try {
            System.loadLibrary("bitchord_analysis");
            nativeOk = true;
            Log.i(TAG, "libbitchord_analysis loaded from APK in " + ms(t0) + " ms; analysis rate="
                    + TrackFeatures.nativeSampleRate() + " mel rate=" + MelSpectrogram.nativeSampleRate()
                    + " mels=" + MelSpectrogram.nativeMelCount() + " hop=" + MelSpectrogram.nativeHop());
        } catch (Throwable t) {
            Log.e(TAG, "libbitchord_analysis load failed", t);
        }
        try {
            long t1 = System.nanoTime();
            OrtEnvironment env = OrtEnvironment.getEnvironment();
            Log.i(TAG, "ONNX Runtime ready in " + ms(t1) + " ms, version=" + env.getVersion());
            for (String name : new String[]{"beat_this_final0_q8.onnx", "vocals_umxhq_int8.onnx"}) {
                byte[] bytes;
                try {
                    bytes = model(ctx, name);
                } catch (IOException e) {
                    Log.w(TAG, "model missing: assets/automix/" + name, e);
                    continue;
                }
                long t2 = System.nanoTime();
                try (OrtSession session = env.createSession(bytes, new OrtSession.SessionOptions())) {
                    StringBuilder sb = new StringBuilder();
                    for (Map.Entry<String, NodeInfo> e : session.getInputInfo().entrySet()) {
                        sb.append(" in ").append(e.getKey()).append('=').append(e.getValue().getInfo());
                    }
                    for (Map.Entry<String, NodeInfo> e : session.getOutputInfo().entrySet()) {
                        sb.append(" out ").append(e.getKey()).append('=').append(e.getValue().getInfo());
                    }
                    Log.i(TAG, "model " + name + " loaded in " + ms(t2) + " ms:" + sb);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "ONNX Runtime failed", t);
        }
    }

    /** A model as NativeLibrariesPatch bundles it (assets/automix), read whole. */
    private static byte[] model(Context ctx, String name) throws IOException {
        try (InputStream in = ctx.getAssets().open("automix/" + name)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[1 << 16];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            return out.toByteArray();
        }
    }

    // ---- Item 5a: next track from YT's queue ----

    /**
     * YT's own queue, through the accessor Morphe's audio/video switch patch adds to it.
     * The media session queue has titles only (no video ids), so it cannot be used.
     */
    private static int queueTries;

    private static final String MORPHE_JAM_BRIDGE =
            "app.morphe.extension.music.patches.jam.YouTubeMusicBridge";

    private static void findNextTrack(Context ctx) {
        try {
            // The audio/video switch capture is not in this build; the Jam bridge's is.
            Class<?> bridge = Class.forName(MORPHE_JAM_BRIDGE);
            java.lang.reflect.Field f = bridge.getDeclaredField("queue");
            f.setAccessible(true);
            Object access = ((java.lang.ref.WeakReference<?>) f.get(null)).get();
            if (access == null) {
                if (++queueTries <= 24) {
                    if (queueTries == 1) Log.w(TAG, "Morphe queue accessor not captured yet, retrying");
                    new Handler(Looper.getMainLooper()).postDelayed(() -> findNextTrack(ctx), 5000);
                } else {
                    Log.e(TAG, "Morphe queue accessor never captured");
                }
                return;
            }
            Log.i(TAG, "Morphe Jam queue accessor captured after " + queueTries + " retries: "
                    + access.getClass().getName());
            Class<?> type = Class.forName(MORPHE_JAM_BRIDGE + "$QueueAccess");
            java.util.concurrent.Executor exec =
                    (java.util.concurrent.Executor) type.getMethod("patch_jamExecutor").invoke(access);
            // Morphe reads YT's queue on YT's own queue executor; do the same.
            exec.execute(() -> {
                try {
                    int current = (int) type.getMethod("patch_jamCurrent").invoke(access);
                    Object[] items = (Object[]) type.getMethod("patch_jamItems").invoke(access);
                    Method videoId = type.getMethod("patch_jamVideoId", Object.class);
                    Log.i(TAG, "YT queue via Morphe Jam bridge: " + (items == null ? null : items.length)
                            + " items, current index " + current);
                    String next = null;
                    for (int i = 0; items != null && i < items.length && i < current + 4; i++) {
                        String id = (String) videoId.invoke(access, items[i]);
                        if (i >= current - 1) Log.i(TAG, "queue[" + i + "] = " + id + (i == current ? " (current)" : ""));
                        if (i == current + 1) next = id;
                    }
                    if (next == null) {
                        Object[] auto = (Object[]) type.getMethod("patch_jamAutoplayItems").invoke(access);
                        Log.i(TAG, "autoplay lane: " + (auto == null ? null : auto.length) + " items");
                        if (auto != null && auto.length > 0) next = (String) videoId.invoke(access, auto[0]);
                    }
                    Log.i(TAG, "next track id=" + next);
                    String nextId = next;
                    if (nextId != null) new Thread(() -> analyseTrack(ctx, nextId), "NativeCheck-track").start();
                } catch (Throwable t) {
                    Log.e(TAG, "Morphe queue read failed", t);
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "Morphe queue read failed", t);
        }
    }

    // ---- Item 5b-d: download, decode, analyse ----

    private static void analyseTrack(Context ctx, String videoId) {
        try {
            long t0 = System.nanoTime();
            File audio = download(ctx, videoId);
            if (audio == null) return;
            Log.i(TAG, "downloaded " + videoId + ": " + audio.length() + " bytes in " + ms(t0) + " ms");

            long t1 = System.nanoTime();
            int[] rate = new int[1];
            float[] pcm = decodeMono(audio, rate);
            double duration = pcm.length / (double) rate[0];
            Log.i(TAG, "decoded " + pcm.length + " mono samples @" + rate[0] + " Hz ("
                    + String.format("%.1f", duration) + " s) in " + ms(t1) + " ms");

            for (int i = 0; i < 40 && !nativeOk; i++) Thread.sleep(250);
            if (!nativeOk) {
                Log.e(TAG, "native library not loaded, analysis skipped");
                return;
            }

            long t2 = System.nanoTime();
            double analysisRate = TrackFeatures.nativeSampleRate();
            float[] forAnalysis = TrackFeatures.nativeResample(pcm, rate[0], analysisRate);
            String json = TrackFeatures.nativeAnalyze(forAnalysis, analysisRate, duration);
            Log.i(TAG, "native analysis in " + ms(t2) + " ms: " + summary(json));

            runBeatModel(ctx, pcm, rate[0]);
            audio.delete();
        } catch (Throwable t) {
            Log.e(TAG, "analyseTrack failed", t);
        }
    }

    static File download(Context ctx, String videoId) throws Exception {
        return AudioStream.download(new File(ctx.getCacheDir(), "spike"), videoId);
    }

    private static void release(MediaExtractor extractor, MediaCodec codec) {
        if (codec != null) {
            try {
                codec.stop();
            } catch (Throwable ignored) {
            }
            codec.release();
        }
        extractor.release();
    }

    static float[] decodeMono(File file, int[] rateOut) throws Exception {
        MediaExtractor extractor = new MediaExtractor();
        MediaCodec[] held = new MediaCodec[1];
        try {
            return decodeMono(file, rateOut, extractor, held);
        } finally {
            release(extractor, held[0]);
        }
    }

private static float[] decodeMono(File file, int[] rateOut, MediaExtractor extractor, MediaCodec[] held) throws Exception {
        extractor.setDataSource(file.getPath());
        int track = -1;
        MediaFormat format = null;
        for (int i = 0; i < extractor.getTrackCount(); i++) {
            MediaFormat f = extractor.getTrackFormat(i);
            if (f.getString(MediaFormat.KEY_MIME).startsWith("audio/")) {
                track = i;
                format = f;
                break;
            }
        }
        if (track < 0) throw new IllegalStateException("no audio track");
        extractor.selectTrack(track);
        String mime = format.getString(MediaFormat.KEY_MIME);
        Log.i(TAG, "decoding " + mime + " " + format);

        MediaCodec codec = MediaCodec.createDecoderByType(mime);
        held[0] = codec;
        codec.configure(format, null, null, 0);
        codec.start();

        int channels = format.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
        int rate = format.getInteger(MediaFormat.KEY_SAMPLE_RATE);
        boolean floatPcm = false;
        float[] out = new float[1 << 20];
        int size = 0;
        MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
        boolean inputDone = false;
        while (true) {
            if (!inputDone) {
                int in = codec.dequeueInputBuffer(10_000);
                if (in >= 0) {
                    ByteBuffer buf = codec.getInputBuffer(in);
                    int n = extractor.readSampleData(buf, 0);
                    if (n < 0) {
                        codec.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                        inputDone = true;
                    } else {
                        codec.queueInputBuffer(in, 0, n, extractor.getSampleTime(), 0);
                        extractor.advance();
                    }
                }
            }
            int outIndex = codec.dequeueOutputBuffer(info, 10_000);
            if (outIndex == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                MediaFormat of = codec.getOutputFormat();
                channels = of.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                rate = of.getInteger(MediaFormat.KEY_SAMPLE_RATE);
                floatPcm = of.containsKey(MediaFormat.KEY_PCM_ENCODING)
                        && of.getInteger(MediaFormat.KEY_PCM_ENCODING) == AudioFormat.ENCODING_PCM_FLOAT;
            } else if (outIndex >= 0) {
                ByteBuffer buf = codec.getOutputBuffer(outIndex).order(ByteOrder.nativeOrder());
                buf.position(info.offset).limit(info.offset + info.size);
                int frames = info.size / (channels * (floatPcm ? 4 : 2));
                if (size + frames > out.length) {
                    float[] bigger = new float[Math.max(out.length * 2, size + frames)];
                    System.arraycopy(out, 0, bigger, 0, size);
                    out = bigger;
                }
                for (int f = 0; f < frames; f++) {
                    float sum = 0;
                    for (int ch = 0; ch < channels; ch++) {
                        sum += floatPcm ? buf.getFloat() : buf.getShort() / 32768f;
                    }
                    out[size++] = sum / channels;
                }
                codec.releaseOutputBuffer(outIndex, false);
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) break;
            }
        }
        rateOut[0] = rate;
        float[] result = new float[size];
        System.arraycopy(out, 0, result, 0, size);
        return result;
    }

    private static void runBeatModel(Context ctx, float[] pcm, int rate) {
        try {
            long t0 = System.nanoTime();
            double melRate = MelSpectrogram.nativeSampleRate();
            int mels = MelSpectrogram.nativeMelCount();
            float[] resampled = MelSpectrogram.nativeResample(pcm, rate, melRate);
            float[] spectrogram = MelSpectrogram.nativeCompute(resampled, melRate);
            int frames = spectrogram.length / mels;
            Log.i(TAG, "mel spectrogram " + frames + "x" + mels + " in " + ms(t0) + " ms");

            int length = Math.min(1500, frames);
            float[] chunk = new float[length * mels];
            System.arraycopy(spectrogram, 0, chunk, 0, chunk.length);
            OrtEnvironment env = OrtEnvironment.getEnvironment();
            long t1 = System.nanoTime();
            byte[] model = model(ctx, "beat_this_final0_q8.onnx");
            try (OrtSession session = env.createSession(model, new OrtSession.SessionOptions());
                 OnnxTensor tensor = OnnxTensor.createTensor(env, FloatBuffer.wrap(chunk),
                         new long[]{1, length, mels})) {
                String input = session.getInputNames().iterator().next();
                long t2 = System.nanoTime();
                try (OrtSession.Result result = session.run(Collections.singletonMap(input, tensor))) {
                    StringBuilder sb = new StringBuilder();
                    for (Map.Entry<String, ai.onnxruntime.OnnxValue> e : result) {
                        float[][] logits = ((float[][]) e.getValue().getValue());
                        int positive = 0;
                        for (float v : logits[0]) if (v > 0) positive++;
                        sb.append(' ').append(e.getKey()).append(": ").append(logits[0].length)
                                .append(" frames, ").append(positive).append(" above 0");
                    }
                    Log.i(TAG, "Beat This! on first " + length + " frames (" + (length / 50) + " s): load "
                            + (t2 - t1) / 1_000_000 + " ms, run " + ms(t2) + " ms;" + sb);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "beat model failed", t);
        }
    }

    private static String summary(String json) {
        StringBuilder sb = new StringBuilder();
        for (String key : new String[]{"duration", "bpm", "beatConfidence", "key", "keyConfidence",
                "mixInTime", "mixOutTime", "introEndTime", "outroStartTime"}) {
            int i = json.indexOf("\"" + key + "\":");
            if (i < 0) continue;
            int start = i + key.length() + 3;
            int end = start;
            while (end < json.length() && json.charAt(end) != ',' && json.charAt(end) != '}') end++;
            sb.append(key).append('=').append(json, start, end).append(' ');
        }
        return sb + "(" + json.length() + " chars)";
    }

    private static long ms(long start) {
        return (System.nanoTime() - start) / 1_000_000;
    }
}
