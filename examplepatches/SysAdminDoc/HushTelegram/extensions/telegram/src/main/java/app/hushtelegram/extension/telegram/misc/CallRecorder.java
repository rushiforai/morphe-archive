/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.AudioTrack;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.LongSupplier;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Records calls to a file on the phone when Record calls is on, or when the call screen's record
 * button ({@link CallRecordButton}) says so for one call. Telegram's calls run on one of
 * two WebRTC audio engines, a newer one and an older one, and each is hooked twice: where a block
 * the microphone recorded goes to WebRTC, and where a block of the other side goes to the speaker.
 *
 * <p>The hooks run on the engines' audio threads, so they only copy the block into a bounded
 * queue and go back. One background thread mixes both sides and encodes them (see
 * {@link CallMixer} and {@link CallAac}). A full queue drops the block and counts it rather than
 * hold up the call. A call's file is finished and saved once no audio has come for
 * {@link #IDLE_MS}, which is also what happens when the switch is turned off or HushTelegram is
 * paused mid-call: the part already recorded is kept.
 */
public final class CallRecorder {
    private CallRecorder() {}

    static final String FAMILY = FamilyNames.DISABLE_CALL_DEBUG;

    static final int NEWER_MIC = 0;
    static final int NEWER_SPEAKER = 1;
    static final int OLDER_MIC = 2;
    static final int OLDER_SPEAKER = 3;
    /** Each engine and side counts its own blocks, so a report shows which hooks heard the call. */
    static final String[] TAKEN = {
            "call microphone blocks, newer engine",
            "call speaker blocks, newer engine",
            "call microphone blocks, older engine",
            "call speaker blocks, older engine",
    };
    static final String DROPPED = "call audio blocks dropped";
    static final String UNREADABLE = "call audio blocks not 16-bit";
    static final String SAVED = "call recordings saved";
    static final String FAILED = "call recordings not saved";
    static final String TOO_SHORT = "call recordings under a second";

    /** About two and a half seconds of both sides at WebRTC's ten-millisecond blocks. */
    static final int QUEUE_SIZE = 512;
    /** A call's file closes after this long with no audio from either side. */
    static final long IDLE_MS = 3_000;
    /** A side follows another engine only once the one it follows has been quiet this long. */
    static final long SWITCH_MS = 500;
    /** Shorter recordings, a call that never connected, aren't kept. */
    static final long SHORTEST = CallMixer.RATE;
    /** A record button tap that no call audio follows, a call never answered, lapses after this long. */
    static final long UNANSWERED_MS = 120_000;
    private static final long NEVER = Long.MIN_VALUE;

    /** The encoder a call writes to: {@link CallAac} on a phone. */
    interface Output extends CallMixer.Sink {
        /** Ends the file and answers it. The output is released either way. */
        File finish() throws IOException;

        /** Releases the output and deletes its file. */
        void abandon();
    }

    interface Outputs {
        Output open(File file) throws IOException;
    }

    interface Saver {
        /** Puts the finished file in shared storage and answers the folder it went to. */
        String save(Context context, File file, String name) throws IOException;
    }

    static final ArrayBlockingQueue<Block> QUEUE = new ArrayBlockingQueue<>(QUEUE_SIZE);
    static final Writer WRITER = new Writer();
    private static final Object LOCK = new Object();
    private static volatile boolean started;
    /** The record button's choice for the call on screen, or null to follow Record calls. */
    private static final AtomicReference<Choice> CHOICE = new AtomicReference<>();
    /** When a block of call audio last reached a hook, recorded or not. */
    private static volatile long heardAt = NEVER;

    // Swapped by tests, which drive the writer themselves.
    static volatile boolean manual;
    static LongSupplier clock = SystemClock::elapsedRealtime;
    static LongSupplier wall = System::currentTimeMillis;
    static Outputs outputs = CallAac::new;
    static Saver saver = CallRecordings::save;

    /** The folder recordings go to on this phone, as a file manager shows it, for the switch's description. */
    public static String folder() {
        return CallRecordings.folder();
    }

    /** The newer engine's microphone block, before WebRTC takes it. [bytes] were read from the start of [buffer]. */
    public static void modernRecorded(@Nullable AudioRecord record, @Nullable ByteBuffer buffer, int bytes) {
        if (taking()) recorded(NEWER_MIC, record, buffer, bytes);
    }

    /** The older engine's microphone block, after any mute or device audio has been put in it. */
    public static void legacyRecorded(@Nullable AudioRecord record, @Nullable ByteBuffer buffer, int bytes) {
        if (taking()) recorded(OLDER_MIC, record, buffer, bytes);
    }

    /** The newer engine's speaker block, before AudioTrack plays it from the buffer's position. */
    public static void modernPlayed(@Nullable AudioTrack track, @Nullable ByteBuffer buffer, int bytes) {
        if (taking()) played(NEWER_SPEAKER, track, buffer, bytes);
    }

    /** The older engine's speaker block. */
    public static void legacyPlayed(@Nullable AudioTrack track, @Nullable ByteBuffer buffer, int bytes) {
        if (taking()) played(OLDER_SPEAKER, track, buffer, bytes);
    }

    /**
     * Whether this block is copied: the record button's choice for the call if one was made,
     * otherwise the switch. Paused or before the settings are ready, no audio is copied.
     */
    static boolean taking() {
        HookStatus.invoked(FAMILY);
        try {
            if (!Utils.settingsReady()) return false;
            long now = clock.getAsLong();
            boolean taken = recording(now);
            heardAt = now;
            return taken;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "record calls switch read", failure);
            return false;
        }
    }

    /**
     * The record button's tap: record the call on screen, or stop recording it, whatever Record
     * calls says. The choice lasts until that call's audio has been quiet for {@link #IDLE_MS},
     * or {@link #UNANSWERED_MS} when no call audio ever follows it.
     */
    public static void choose(boolean record) {
        long now = clock.getAsLong();
        long heard = heardAt;
        // Mid-call the choice belongs to the audio already flowing, so it ends with that call.
        CHOICE.set(new Choice(record, heard != NEVER && now - heard < IDLE_MS ? heard : now));
    }

    /** Whether the call on screen is being recorded, as its record button shows it. */
    public static boolean recordingThisCall() {
        try {
            return Utils.settingsReady() && recording(clock.getAsLong());
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "record button state", failure);
            return false;
        }
    }

    private static boolean recording(long now) {
        Choice chosen = choice(now);
        if (chosen != null && Settings.RECORD_CALL_BUTTON.get()) return chosen.record;
        return Settings.RECORD_CALLS.get();
    }

    /** The choice still in force at [now], dropping one whose call is over. */
    @Nullable
    private static Choice choice(long now) {
        Choice chosen = CHOICE.get();
        if (chosen == null) return null;
        long heard = heardAt;
        boolean over = heard != NEVER && heard >= chosen.at ? now - heard >= IDLE_MS : now - chosen.at >= UNANSWERED_MS;
        if (!over) return chosen;
        // Only this choice: a tap that landed meanwhile stays.
        CHOICE.compareAndSet(chosen, null);
        return null;
    }

    private static final class Choice {
        final boolean record;
        final long at;

        Choice(boolean record, long at) {
            this.record = record;
            this.at = at;
        }
    }

    private static void recorded(int source, @Nullable AudioRecord record, @Nullable ByteBuffer buffer, int bytes) {
        try {
            if (record == null || buffer == null) return;
            // WebRTC reads the block from the start of the buffer whatever its position says.
            ByteBuffer view = buffer.duplicate();
            view.clear();
            take(source, record.getSampleRate(), record.getChannelCount(), record.getAudioFormat(), view, bytes);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "call microphone copy", failure);
        }
    }

    private static void played(int source, @Nullable AudioTrack track, @Nullable ByteBuffer buffer, int bytes) {
        try {
            if (track == null || buffer == null) return;
            take(source, track.getSampleRate(), track.getChannelCount(), track.getAudioFormat(), buffer.duplicate(), bytes);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "call speaker copy", failure);
        }
    }

    /** Copies up to [bytes] from [view]'s position into the queue. The engine's own buffer isn't moved. */
    static void take(int source, int rate, int channels, int encoding, ByteBuffer view, int bytes) {
        if ((encoding != AudioFormat.ENCODING_PCM_16BIT && encoding != AudioFormat.ENCODING_DEFAULT)
                || rate <= 0 || channels <= 0) {
            HookStatus.counted(FAMILY, UNREADABLE);
            return;
        }
        int length = Math.min(bytes, view.remaining());
        if (length <= 0) return;
        byte[] pcm = new byte[length];
        view.get(pcm);
        if (!QUEUE.offer(new Block(source, rate, channels, pcm, clock.getAsLong()))) {
            HookStatus.counted(FAMILY, DROPPED);
            return;
        }
        HookStatus.counted(FAMILY, TAKEN[source]);
        start();
    }

    private static void start() {
        if (started || manual) return;
        synchronized (LOCK) {
            if (started) return;
            Thread thread = new Thread(CallRecorder::run, "HushTelegram call recorder");
            thread.setDaemon(true);
            thread.start();
            started = true;
        }
    }

    /** The writer's thread: blocks with no call, wakes every quarter second during one to notice its end. */
    private static void run() {
        while (true) {
            try {
                Block block = WRITER.active() ? QUEUE.poll(250, TimeUnit.MILLISECONDS) : QUEUE.take();
                WRITER.step(block, clock.getAsLong());
            } catch (InterruptedException stop) {
                WRITER.step(null, Long.MAX_VALUE);
                synchronized (LOCK) {
                    started = false;
                }
                return;
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, "call recorder", failure);
            }
        }
    }

    /** One copied block: which engine and side, its format, and when it was taken. */
    static final class Block {
        final int source;
        final int rate;
        final int channels;
        final byte[] pcm;
        final long at;

        Block(int source, int rate, int channels, byte[] pcm, long at) {
            this.source = source;
            this.rate = rate;
            this.channels = channels;
            this.pcm = pcm;
            this.at = at;
        }

        boolean mic() {
            return source == NEWER_MIC || source == OLDER_MIC;
        }
    }

    /**
     * The call being recorded, touched only by the writer's thread (or a test in its place). A
     * call opens with its first block, and each side follows the first engine it hears from, so a
     * phone where both engines run never mixes one side in twice.
     */
    static final class Writer {
        private boolean active;
        private boolean failed;
        private long began;
        private long last;
        private int micSource;
        private int speakerSource;
        private long micAt;
        private long speakerAt;
        @Nullable private File file;
        @Nullable private Output output;
        @Nullable private CallMixer mixer;

        boolean active() {
            return active;
        }

        /** Takes [block] if there is one, then ends the call if it has been quiet since [now] - {@link #IDLE_MS}. */
        void step(@Nullable Block block, long now) {
            if (block != null) take(block);
            if (active && now - last >= IDLE_MS) end();
        }

        private void take(Block block) {
            if (!active) begin(block.at);
            last = Math.max(last, block.at);
            if (failed || !follows(block)) return;
            try {
                if (block.mic()) {
                    mixer.mic(block.pcm, block.pcm.length, block.rate, block.channels);
                } else {
                    mixer.speaker(block.pcm, block.pcm.length, block.rate, block.channels);
                }
            } catch (Throwable failure) {
                fail("call recording encode", failure);
            }
        }

        private boolean follows(Block block) {
            boolean mic = block.mic();
            int followed = mic ? micSource : speakerSource;
            long heard = mic ? micAt : speakerAt;
            if (followed >= 0 && followed != block.source && block.at - heard < SWITCH_MS) return false;
            if (mic) {
                micSource = block.source;
                micAt = block.at;
            } else {
                speakerSource = block.source;
                speakerAt = block.at;
            }
            return true;
        }

        private void begin(long at) {
            active = true;
            failed = false;
            last = at;
            micSource = -1;
            speakerSource = -1;
            began = wall.getAsLong();
            try {
                Context context = Utils.getContext();
                if (context == null) throw new IOException("No context to record the call in");
                file = CallRecordings.scratch(context, began);
                Output opened = outputs.open(file);
                output = opened;
                mixer = new CallMixer(opened);
            } catch (Throwable failure) {
                fail("call recording start", failure);
            }
        }

        private void fail(String step, Throwable failure) {
            HookStatus.threw(FAMILY, step, failure);
            failed = true;
            drop();
        }

        /** Lets go of the output and its file without saving. */
        private void drop() {
            Output open = output;
            output = null;
            mixer = null;
            if (open != null) open.abandon();
            if (file != null && !file.delete() && file.exists()) file.deleteOnExit();
            file = null;
        }

        private void end() {
            active = false;
            if (failed || output == null || mixer == null) {
                drop();
                HookStatus.counted(FAMILY, FAILED);
                Utils.showToastShort(L10n.t("Couldn't save the call recording."));
                return;
            }
            File finished = null;
            try {
                mixer.flush();
                if (mixer.written() < SHORTEST) {
                    drop();
                    HookStatus.counted(FAMILY, TOO_SHORT);
                    return;
                }
                Output open = output;
                output = null;
                mixer = null;
                finished = open.finish();
                Context context = Utils.getContext();
                if (context == null) throw new IOException("No context to save the call in");
                String folder = saver.save(context, finished, CallRecordings.name(began));
                HookStatus.counted(FAMILY, SAVED);
                Utils.showToastShort(L10n.f("Call saved to %1$s", L10n.isolate(folder)));
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, "call recording save", failure);
                drop();
                HookStatus.counted(FAMILY, FAILED);
                Utils.showToastShort(L10n.t("Couldn't save the call recording."));
            } finally {
                if (finished != null && !finished.delete() && finished.exists()) finished.deleteOnExit();
                file = null;
            }
        }

        /** Drops whatever call is open, for a test's clean start. */
        void reset() {
            drop();
            active = false;
            failed = false;
        }
    }

    /** Runs every queued block through the writer, then its end check at [now]. */
    static void drainForTests(long now) {
        for (Block block; (block = QUEUE.poll()) != null; ) WRITER.step(block, block.at);
        WRITER.step(null, now);
    }

    static void resetForTests() {
        QUEUE.clear();
        WRITER.reset();
        CHOICE.set(null);
        heardAt = NEVER;
    }
}
