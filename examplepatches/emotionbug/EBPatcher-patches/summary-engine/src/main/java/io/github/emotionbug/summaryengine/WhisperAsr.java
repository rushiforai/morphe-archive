package io.github.emotionbug.summaryengine;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.charset.CodingErrorAction;
import java.util.concurrent.CancellationException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;

/** Single-context Vulkan/CPU ASR. Cancellation never frees memory owned by an active native call. */
final class WhisperAsr implements AutoCloseable {
    static final String IDENTITY = "whisper-large-v3-turbo-q5_0-394221709cd5ad1f40c46e6031ca61bce88931e6e088c188294c6d5a55ffa7e2"
            + ":whisper.cpp-d1be6fde11ac6e0407606b4e42fe72d34add8037"
            + ":vulkan-auto-cpu4-fallback-init-fa-beam5-best5-ko-transcribe-no-context-temp0-inc0.2-entropy2.4-logprob-1-nospeech0.6-segments-v3";
    static final class Segment {
        final long startMs, endMs;
        final String text;

        Segment(long startMs, long endMs, String text) {
            this.startMs = startMs;
            this.endMs = endMs;
            this.text = text;
        }
    }

    /** Model-estimated positions, not verified word alignments or speaker identities. */
    static final class Result {
        final String text;
        final List<Segment> segments;

        Result(List<Segment> segments) {
            this.segments = Collections.unmodifiableList(new ArrayList<>(segments));
            StringBuilder joined = new StringBuilder();
            for (Segment segment : segments) joined.append(segment.text);
            text = joined.toString().trim();
        }

        static Result read(DataInputStream input, long durationMs) throws IOException {
            int count = input.readInt();
            if (count < 0 || count > 1024) throw new IOException("Invalid ASR segment count");
            List<Segment> segments = new ArrayList<>(count);
            int total = 0;
            long previous = 0;
            for (int i = 0; i < count; i++) {
                long start = input.readLong(), end = input.readLong();
                int length = input.readInt();
                if (start < previous || end < start || end > durationMs
                        || length < 0 || length > 12000 - total)
                    throw new IOException("Invalid ASR segment");
                byte[] bytes = new byte[length];
                input.readFully(bytes);
                String text = StandardCharsets.UTF_8.newDecoder()
                        .onMalformedInput(CodingErrorAction.REPORT)
                        .onUnmappableCharacter(CodingErrorAction.REPORT)
                        .decode(ByteBuffer.wrap(bytes)).toString();
                segments.add(new Segment(start, end, text));
                previous = start;
                total += length;
            }
            return new Result(segments);
        }

        void write(DataOutputStream output) throws IOException {
            output.writeInt(segments.size());
            for (Segment segment : segments) {
                byte[] bytes = segment.text.getBytes(StandardCharsets.UTF_8);
                output.writeLong(segment.startMs);
                output.writeLong(segment.endMs);
                output.writeInt(bytes.length);
                output.write(bytes);
            }
        }
    }

    static Result decode(byte[] bytes, long durationMs) throws IOException {
        try (DataInputStream input = new DataInputStream(new ByteArrayInputStream(bytes))) {
            Result result = Result.read(input, durationMs);
            if (input.read() != -1) throw new IOException("Trailing ASR result bytes");
            return result;
        }
    }
    private final Object operation = new Object();
    private final Object state = new Object();
    private final AtomicBoolean stopped = new AtomicBoolean();
    private final String modelPath;
    private final boolean useGpu;
    private WhisperPcm pcm;
    private ExecutorService worker;
    private long handle;
    private boolean gpu;
    private boolean initialized;

    WhisperAsr(String path, boolean useGpu) {
        modelPath = path;
        this.useGpu = useGpu;
    }

    Result transcribe(File wav, AtomicBoolean cancelled) throws Exception {
        synchronized (operation) {
            check(cancelled);
            // Handle replacement is allowed only after backend initialization has completed.
            synchronized (state) {
                check(cancelled);
                if (handle == 0) {
                    File model = new File(modelPath);
                    if (!model.isFile() || !model.canRead() || model.length() == 0)
                        throw new IOException("Download the pinned Whisper model from Settings before transcription");
                    android.util.Log.i("EBPatcherSummary", "stage=asr_backend requested=" + (useGpu ? "vulkan" : "cpu"));
                    if (useGpu) {
                        try {
                            System.loadLibrary("ebpatcher_whisper_vulkan");
                            gpu = true;
                            handle = Vulkan.create(model.getAbsolutePath());
                        } catch (UnsatisfiedLinkError unavailable) {
                            // The optional payload may depend on a missing/incompatible Vulkan loader.
                            // CPU symbols and all its ggml state belong to a separate library/class.
                            gpu = false;
                            android.util.Log.i("EBPatcherSummary", "stage=asr_backend fallback=vulkan_load_unavailable");
                        }
                    }
                    if (!gpu) {
                        System.loadLibrary("ebpatcher_whisper");
                        handle = Cpu.create(model.getAbsolutePath());
                    }
                    if (handle == 0) throw new IOException("Could not create Whisper ASR");
                    check(cancelled);
                }
                // Model loading stays in the worker, leaving cancellation responsive.
            }
            if (pcm == null) pcm = new WhisperPcm();
            int samples = pcm.read(wav, () -> check(cancelled));
            check(cancelled);
            if (worker == null)
                worker = Executors.newSingleThreadExecutor(r -> new Thread(() -> {
                    // Java thread startup need not retain the coordinator's Linux niceness.
                    android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND);
                    r.run();
                }, "Whisper-ASR"));
            Future<byte[]> result = worker.submit(() -> transcribeNative(samples, cancelled));
            boolean interrupted = false;
            try {
                while (true) {
                    if (stopped.get() || cancelled.get() || interrupted) cancel();
                    try {
                        byte[] bytes = result.get(100, TimeUnit.MILLISECONDS);
                        check(cancelled);
                        return decode(bytes, samples * 1000L / PcmChunks.RATE);
                    } catch (TimeoutException pending) {
                        // Poll only the cancellation flag, never interrupt or free a native call.
                    } catch (InterruptedException stop) {
                        interrupted = true; cancel();
                    } catch (ExecutionException failure) {
                        Throwable cause = failure.getCause();
                        if (cause instanceof Error) throw (Error) cause;
                        check(cancelled);
                        if (cause instanceof Exception) throw (Exception) cause;
                        throw new IOException("Whisper transcription failed", cause);
                    }
                }
            } finally {
                // Future completion is the lifetime barrier; nativeCancel is not completion.
                while (!result.isDone()) {
                    cancel();
                    try { result.get(); }
                    catch (InterruptedException stop) { interrupted = true; }
                    catch (ExecutionException finished) { break; }
                }
                if (interrupted) Thread.currentThread().interrupt();
            }
        }
    }

    private byte[] transcribeNative(int samples, AtomicBoolean cancelled) throws IOException {
        check(cancelled);
        if (!initialized) {
            boolean ready = gpu ? Vulkan.initialize(handle) : Cpu.initialize(handle);
            check(cancelled);
            if (!ready && gpu) {
                // Native initialization returned without starting inference. Release its model
                // before the one permitted CPU attempt; never retry a cancelled or failed decode.
                synchronized (state) {
                    check(cancelled);
                    Vulkan.close(handle);
                    handle = 0;
                    gpu = false;
                    android.util.Log.i("EBPatcherSummary", "stage=asr_backend fallback=vulkan_init_unavailable");
                    System.loadLibrary("ebpatcher_whisper");
                    check(cancelled);
                    handle = Cpu.create(modelPath);
                    if (handle == 0) throw new IOException("Could not create Whisper CPU ASR");
                }
                check(cancelled);
                ready = Cpu.initialize(handle);
                check(cancelled);
            }
            if (!ready) throw new IOException("Whisper model initialization failed");
            initialized = true;
            android.util.Log.i("EBPatcherSummary", "stage=asr_backend requested=" + (useGpu ? "vulkan" : "cpu")
                    + " selected=" + (gpu ? "vulkan" : "cpu"));
        }
        check(cancelled);
        return gpu ? Vulkan.transcribe(handle, pcm.data, samples) : Cpu.transcribe(handle, pcm.data, samples);
    }

    private void check(AtomicBoolean cancelled) {
        if (stopped.get() || cancelled.get() || Thread.currentThread().isInterrupted())
            throw new CancellationException("Whisper transcription was cancelled");
    }

    void cancel() {
        stopped.set(true);
        synchronized (state) {
            if (handle != 0) {
                if (gpu) Vulkan.cancel(handle); else Cpu.cancel(handle);
            }
        }
    }

    @Override public void close() {
        cancel();
        synchronized (operation) {
            synchronized (state) {
                if (handle != 0) {
                    if (gpu) Vulkan.close(handle); else Cpu.close(handle);
                    handle = 0;
                }
            }
            if (worker != null) worker.shutdown();
        }
    }

    // Distinct JNI names prevent an optionally loaded Vulkan payload from intercepting CPU calls.
    private static final class Cpu {
        static native long create(String path) throws IOException;
        static native boolean initialize(long handle) throws IOException;
        static native byte[] transcribe(long handle, ByteBuffer samples, int count) throws IOException;
        static native void cancel(long handle);
        static native void close(long handle);
    }

    private static final class Vulkan {
        static native long create(String path) throws IOException;
        static native boolean initialize(long handle) throws IOException;
        static native byte[] transcribe(long handle, ByteBuffer samples, int count) throws IOException;
        static native void cancel(long handle);
        static native void close(long handle);
    }
}
