/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-13.
 * Written by lavinhoque33, 2026-11-12.
 */
package app.morphe.extension.music.patches.crossfade;

import android.media.AudioTrack;
import android.os.Handler;
import android.os.Looper;

import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicLong;

import app.morphe.extension.shared.utils.Logger;

/** Native adapters contain only an opaque State; no reflection or logging runs in queueInput. */
@SuppressWarnings("unused")
public final class PcmFadeBridge {
    private static final ThreadLocal<List<State>> CONSTRUCTION = new ThreadLocal<>();
    private static final WeakHashMap<Object, Binding> PLAYERS = new WeakHashMap<>();
    private static final List<WeakReference<State>> STATES = new ArrayList<>();
    private static final Handler REPORTER = new Handler(Looper.getMainLooper());
    private static boolean reporting;
    private static long nextIdentity;
    private static final AtomicLong GENERATIONS = new AtomicLong();

    /** Allocated only by the main-thread owner, never by native/audio callbacks. */
    public static final class Snapshot {
        public final long sinkGeneration;
        public final long submittedFrames;
        public final long playedFrames;
        /** Exclusive end of the last positive-gain PCM frame, in this sink epoch's output frames. */
        public final long audibleFrames;
        public final int sampleRate;
        public final boolean negotiated;
        public final boolean supported;
        public final boolean ended;
        public final boolean stopped;
        public final float gain;

        private Snapshot(State state) {
            sinkGeneration = state == null ? 0 : state.generation;
            submittedFrames = state == null ? 0 : state.submitted;
            playedFrames = state == null ? 0 : state.played;
            audibleFrames = state == null ? 0 : state.audible;
            sampleRate = state == null ? 0 : state.sampleRate;
            negotiated = state != null && state.negotiated;
            supported = state != null && state.raw && state.active;
            ended = state != null && state.processor.isEnded() && !state.output.hasRemaining();
            stopped = state != null && state.stopped;
            gain = state == null ? 1 : state.processor.gain();
        }
    }

    public static Snapshot snapshot(Object player) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new IllegalStateException("PCM snapshots belong to the main-thread owner");
        }
        Binding binding;
        synchronized (PLAYERS) {
            binding = PLAYERS.get(player);
        }
        if (binding == null) return new Snapshot(null);
        while (true) {
            State state = binding.latest;
            if (state == null) return new Snapshot(null);
            synchronized (state) {
                if (binding.latest == state) {
                    sampleTrack(state);
                    return new Snapshot(state);
                }
            }
        }
    }

    /** Audio-session ownership comes from the same native track that supplies the played-frame head. */
    public static int sessionId(Object player) {
        Binding binding;
        synchronized (PLAYERS) {
            binding = PLAYERS.get(player);
        }
        State state = binding == null ? null : binding.latest;
        if (state == null) return 0;
        synchronized (state) {
            return state.retired || !(state.track instanceof AudioTrack)
                    ? 0 : ((AudioTrack) state.track).getAudioSessionId();
        }
    }

    private static final class Binding {
        final List<State> processors;
        volatile State latest;
        float normalization = 1.0f;
        boolean normalized;

        Binding(List<State> processors) {
            this.processors = processors;
        }
    }

    private static final class State {
        final PcmGainProcessor processor = new PcmGainProcessor();
        volatile Binding owner;
        Object sink;
        Object track;
        long generation = GENERATIONS.incrementAndGet();
        long submitted;
        long played;
        long audible;
        boolean stopped;
        long lastHead;
        long headWrap;
        long frameOrigin;
        boolean negotiated;
        boolean raw;
        final long identity;
        volatile int playerIdentity;
        volatile int sinkIdentity;
        volatile int sampleRate;
        volatile int channels;
        volatile int encoding;
        ByteBuffer output = EMPTY;
        volatile boolean active;
        volatile long buffers;
        boolean firstPending = true;
        volatile long firstBuffer;
        volatile float firstGain;
        volatile long firstNonzero;
        volatile long nonzeroEvents;
        volatile float firstNonzeroGain;
        long reportedFirst;
        long reportedNonzero;
        int reportedFormat;
        volatile boolean retired;
        boolean deferredGain;
        float requestedGain;
        long requestedRampMilliseconds;
        int requestedCurve = -1;

        State(long identity) {
            this.identity = identity;
        }
    }

    private PcmFadeBridge() {}

    /** Called around the stock factory, including its initial player creation. */
    public static void beginPlayer() {
        CONSTRUCTION.set(new ArrayList<>());
    }

    public static void cancelPlayer() {
        CONSTRUCTION.remove();
    }

    public static void endPlayer(Object player) {
        List<State> processors = CONSTRUCTION.get();
        CONSTRUCTION.remove();
        if (processors == null) return;
        Binding binding = new Binding(processors);
        synchronized (PLAYERS) {
            PLAYERS.put(player, binding);
        }
        for (State state : processors) {
            synchronized (state) {
                state.owner = binding;
                state.playerIdentity = System.identityHashCode(player);
                if (state.negotiated && (binding.latest == null
                        || state.generation > binding.latest.generation)) binding.latest = state;
            }
        }
        Logger.printInfo(() -> "CFPCM ATTACH player=" + System.identityHashCode(player)
                + " processors=" + processors.size());
    }

    public static Object create() {
        State state;
        synchronized (STATES) {
            state = new State(++nextIdentity);
            STATES.add(new WeakReference<>(state));
            if (!reporting) {
                reporting = true;
                REPORTER.postDelayed(PcmFadeBridge::report, 250);
            }
        }
        List<State> construction = CONSTRUCTION.get();
        if (construction != null) construction.add(state);
        return state;
    }

    public static boolean configure(Object token, int sampleRate, int channels, int encoding) {
        State state = (State) token;
        synchronized (state) {
            boolean changed = state.sampleRate != sampleRate
                    || state.channels != channels || state.encoding != encoding;
            state.active = state.processor.configure(sampleRate, channels, encoding);
            state.sampleRate = sampleRate;
            state.channels = channels;
            state.encoding = encoding;
            if (changed) {
                state.output = EMPTY;
                newGeneration(state, false);
                state.firstPending = true;
                state.buffers = 0;
                state.firstNonzero = 0;
            }
            if (state.active && state.deferredGain) {
                applyRequest(state);
                state.deferredGain = false;
            }
            return state.active;
        }
    }

    public static boolean isActive(Object token) {
        return ((State) token).active;
    }

    /** Successful native negotiation selects the authoritative branch, including encoded bypass. */
    public static void sinkConfigured(Object token, Object sink, String mime) {
        State state = (State) token;
        synchronized (state) {
            state.sink = sink;
            state.sinkIdentity = System.identityHashCode(sink);
            state.raw = "audio/raw".equals(mime);
            state.negotiated = true;
            newGeneration(state, false);
            if (state.owner != null) state.owner.latest = state;
        }
        pendingSink = sink;
        pendingMime = mime;
        sinkConfiguration++;
    }

    /** Captures an epoch before the direct hardware counter read; never samples a smoothed clock. */
    public static long beginPlayed(Object token, Object sink, Object track) {
        State state = (State) token;
        synchronized (state) {
            if (state.retired || state.sink != sink || state.owner == null || state.owner.latest != state) return -1;
            if (state.track != null && state.track != track) {
                state.generation = GENERATIONS.incrementAndGet();
                state.frameOrigin = 0;
                state.played = 0;
                state.lastHead = 0;
                state.headWrap = 0;
            }
            state.track = track;
            return state.generation;
        }
    }

    public static void played(Object token, Object track, int head, long generation) {
        State state = (State) token;
        synchronized (state) {
            if (state.retired || state.track != track || state.generation != generation
                    || state.owner == null || state.owner.latest != state) return;
            updatePlayed(state, head);
        }
    }

    /** Renderer position callbacks stop at EOS; the owner must still observe the final hardware drain. */
    private static void sampleTrack(State state) {
        if (state.retired || !(state.track instanceof AudioTrack)) return;

        AudioTrack track = (AudioTrack) state.track;
        boolean initialized = track.getState() == AudioTrack.STATE_INITIALIZED;
        state.stopped = !initialized || playbackStopped(track.getPlayState(), state.processor.isEnded());
        if (initialized) updatePlayed(state, track.getPlaybackHeadPosition());
    }

    static boolean playbackStopped(int playState, boolean ended) {
        // Streaming AudioTrack.stop at EOS still drains its server buffer. It is not cancellation.
        return playState == AudioTrack.PLAYSTATE_PAUSED || playState == AudioTrack.PLAYSTATE_STOPPED && !ended;
    }

    private static void updatePlayed(State state, int head) {
        long unsigned = head & 0xFFFFFFFFL;
        if (unsigned < state.lastHead) {
            // Only a genuine 32-bit wrap is accepted; a reset belongs to a new flush epoch.
            if (state.lastHead - unsigned < 0x80000000L) return;
            state.headWrap += 0x100000000L;
        }
        state.lastHead = unsigned;
        state.played = Math.max(state.played,
                Math.max(0, Math.min(state.submitted, state.headWrap + unsigned - state.frameOrigin)));
    }

    public static void sinkFlushed(Object token) {
        State state = (State) token;
        synchronized (state) {
            newGeneration(state, true);
        }
    }

    private static void newGeneration(State state, boolean resetTrack) {
        state.generation = GENERATIONS.incrementAndGet();
        state.frameOrigin = resetTrack ? 0 : state.frameOrigin + state.submitted;
        state.submitted = 0;
        state.played = 0;
        state.audible = 0;
        state.stopped = false;
        if (resetTrack) {
            state.lastHead = 0;
            state.headWrap = 0;
            state.track = null;
        }
    }

    private static volatile Object pendingSink;
    private static volatile String pendingMime;
    private static volatile long sinkConfiguration;
    private static long reportedSinkConfiguration;

    public static void queueInput(Object token, ByteBuffer input) {
        State state = (State) token;
        synchronized (state) {
            state.processor.queueInput(input);
            ByteBuffer output = state.processor.getOutput();
            // The native adapter obtains this same buffer through getOutput; keep the handoff in state.
            state.output = output;
            int sampleBytes = state.encoding == PcmGainProcessor.ENCODING_PCM_16BIT ? 2 : 4;
            if (state.channels > 0) {
                int audible = state.processor.lastAudibleFrame();
                if (audible > 0) state.audible = state.submitted + audible;
                state.submitted += output.remaining() / (state.channels * sampleBytes);
            }
            state.buffers++;
            float firstGain = state.processor.firstFrameGain();
            if (state.firstPending && !Float.isNaN(firstGain)) {
                state.firstPending = false;
                state.firstGain = firstGain;
                state.firstBuffer++;
            }
            if (state.firstNonzero == 0 && state.processor.hasNonzeroOutput()) {
                state.firstNonzeroGain = state.processor.firstNonzeroOutputGain();
                state.firstNonzero = state.buffers;
                state.nonzeroEvents++;
            }
        }
    }


    public static ByteBuffer getOutput(Object token) {
        State state = (State) token;
        synchronized (state) {
            ByteBuffer output = state.output;
            state.output = EMPTY;
            return output;
        }
    }

    private static final ByteBuffer EMPTY = ByteBuffer.allocateDirect(0);

    public static void queueEndOfStream(Object token) {
        State state = (State) token;
        synchronized (state) {
            state.processor.queueEndOfStream();
        }
    }

    public static boolean isEnded(Object token) {
        State state = (State) token;
        synchronized (state) {
            return !state.output.hasRemaining() && state.processor.isEnded();
        }
    }

    public static void flush(Object token) {
        State state = (State) token;
        synchronized (state) {
            state.processor.flush();
            state.output = EMPTY;
            state.buffers = 0;
            state.firstPending = true;
            state.firstNonzero = 0;
            newGeneration(state, false);
        }
    }

    public static void reset(Object token) {
        // A native sink reset must not resurrect an incoming or retired player's envelope.
        flush(token);
    }

    public static float normalization(Object player, float normalization) {
        synchronized (PLAYERS) {
            Binding binding = PLAYERS.get(player);
            if (binding != null) {
                binding.normalization = normalization;
                binding.normalized = true;
            }
        }
        return normalization;
    }

    public static float volumeFor(Object player, float fallback) {
        synchronized (PLAYERS) {
            Binding binding = PLAYERS.get(player);
            return binding == null || !binding.normalized ? fallback : binding.normalization;
        }
    }

    public static void setGain(Object player, float gain, long rampMilliseconds) {
        command(player, gain, rampMilliseconds, -1);
    }

    public static void setEnvelope(Object player, float target, long durationMilliseconds, int curveOrdinal) {
        if (curveOrdinal < 0 || curveOrdinal > 3) throw new IllegalArgumentException("Unknown PCM curve");
        command(player, target, durationMilliseconds, curveOrdinal);
    }

    private static void command(Object player, float gain, long milliseconds, int curve) {
        synchronized (PLAYERS) {
            Binding binding = PLAYERS.get(player);
            if (binding == null || binding.processors.isEmpty()) {
                throw new IllegalStateException("CFPCM player has no injected PCM processor");
            }
            for (State state : binding.processors) {
                synchronized (state) {
                    state.deferredGain = milliseconds > 0 && state.sampleRate <= 0;
                    state.requestedGain = gain;
                    state.requestedRampMilliseconds = milliseconds;
                    state.requestedCurve = curve;
                    if (!state.deferredGain) applyRequest(state);
                }
            }
        }
    }

    private static void applyRequest(State state) {
        if (state.requestedCurve >= 0) {
            state.processor.setEnvelope(state.requestedGain, state.requestedRampMilliseconds, state.requestedCurve);
        } else {
            state.processor.setGain(state.requestedGain,
                    state.sampleRate * state.requestedRampMilliseconds / 1000);
        }
    }

    /** Freezes future envelope frames; already submitted PCM is immutable and native pause holds its drain. */
    public static void pause(Object player, boolean paused) {
        synchronized (PLAYERS) {
            Binding binding = PLAYERS.get(player);
            if (binding == null) return;
            for (State state : binding.processors) state.processor.pause(paused);
        }
    }

    public static boolean hasProcessor(Object player) {
        synchronized (PLAYERS) {
            Binding binding = PLAYERS.get(player);
            return binding != null && !binding.processors.isEmpty();
        }
    }

    public static void release(Object player) {
        Binding binding;
        synchronized (PLAYERS) {
            binding = PLAYERS.remove(player);
        }
        if (binding != null) {
            synchronized (STATES) {
                for (State state : binding.processors) {
                    synchronized (state) {
                        state.retired = true;
                        state.generation = GENERATIONS.incrementAndGet();
                    }
                }
            }
        }
    }

    private static void report() {
        if (reportedSinkConfiguration != sinkConfiguration) {
            reportedSinkConfiguration = sinkConfiguration;
            Object sink = pendingSink;
            String mime = pendingMime;
            Logger.printInfo(() -> "CFPCM SINK sink=" + System.identityHashCode(sink)
                    + " mime=" + mime + " encoded=" + !"audio/raw".equals(mime));
        }
        synchronized (STATES) {
            for (int index = STATES.size() - 1; index >= 0; index--) {
                State state = STATES.get(index).get();
                if (state == null) {
                    STATES.remove(index);
                    continue;
                }
                int format = state.sampleRate ^ state.channels << 20 ^ state.encoding << 24;
                if (format != state.reportedFormat) {
                    state.reportedFormat = format;
                    Logger.printInfo(() -> "CFPCM FORMAT processor=" + state.identity
                            + " player=" + state.playerIdentity + " sink=" + state.sinkIdentity
                            + " rate=" + state.sampleRate
                            + " channels=" + state.channels + " encoding=" + state.encoding
                            + " active=" + state.active);
                }
                if (state.firstBuffer != state.reportedFirst) {
                    state.reportedFirst = state.firstBuffer;
                    Logger.printInfo(() -> "CFPCM FIRST processor=" + state.identity
                            + " player=" + state.playerIdentity + " sink=" + state.sinkIdentity
                            + " gain=" + state.firstGain);
                }
                if (state.nonzeroEvents != state.reportedNonzero) {
                    state.reportedNonzero = state.nonzeroEvents;
                    Logger.printInfo(() -> "CFPCM NONZERO processor=" + state.identity
                            + " player=" + state.playerIdentity + " sink=" + state.sinkIdentity
                            + " buffer=" + state.firstNonzero
                            + " gain=" + state.firstNonzeroGain);
                }
                if (state.retired) STATES.remove(index);
            }
            reporting = !STATES.isEmpty();
            if (reporting) REPORTER.postDelayed(PcmFadeBridge::report, 250);
        }
    }
}
