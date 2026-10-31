/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.AudioTrack;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.function.LongSupplier;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CallRecorderTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Ten milliseconds of one side at 48 kHz, WebRTC's block. */
    private static final int BLOCK = CallMixer.RATE / 100;
    private static final long CALL_STARTED = new GregorianCalendar(2026, Calendar.OCTOBER, 30, 21, 15, 30).getTimeInMillis();
    private static final String FOLDER = "Recordings/Telegram calls";

    /** An encoder that keeps the samples, writes them out on finish and can be told to fail. */
    private final class FakeOutput implements CallRecorder.Output {
        final File file;
        final List<Short> samples = new ArrayList<>();
        boolean abandoned;
        boolean finished;

        FakeOutput(File file) {
            this.file = file;
        }

        @Override public void write(short[] block, int count) throws IOException {
            if (failWrites) throw new IOException("encoder stopped");
            for (int i = 0; i < count; i++) samples.add(block[i]);
        }

        @Override public File finish() throws IOException {
            finished = true;
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(new byte[]{1, 2, 3});
            }
            return file;
        }

        @Override public void abandon() {
            abandoned = true;
            file.delete();
        }
    }

    private CallRecorder.Outputs realOutputs;
    private CallRecorder.Saver realSaver;
    private LongSupplier realClock;
    private LongSupplier realWall;
    private boolean realManual;

    private long now;
    private long wallNow;
    private boolean failWrites;
    private boolean failSaves;
    private final List<FakeOutput> opened = new ArrayList<>();
    private final List<String> savedNames = new ArrayList<>();
    private final List<Boolean> savedFileThere = new ArrayList<>();
    private final List<AudioTrack> tracks = new ArrayList<>();
    private final List<AudioRecord> records = new ArrayList<>();

    @Before public void setUp() {
        realOutputs = CallRecorder.outputs;
        realSaver = CallRecorder.saver;
        realClock = CallRecorder.clock;
        realWall = CallRecorder.wall;
        realManual = CallRecorder.manual;
        now = 10_000;
        wallNow = CALL_STARTED;
        CallRecorder.manual = true;
        CallRecorder.clock = () -> now;
        CallRecorder.wall = () -> wallNow;
        CallRecorder.outputs = file -> {
            FakeOutput output = new FakeOutput(file);
            opened.add(output);
            return output;
        };
        CallRecorder.saver = (Context context, File file, String name) -> {
            if (failSaves) throw new IOException("storage full");
            savedNames.add(name);
            savedFileThere.add(file.isFile());
            return FOLDER;
        };
        CallRecorder.resetForTests();
        Settings.RECORD_CALLS.resetToDefault();
        Settings.RECORD_CALL_BUTTON.resetToDefault();
        HookStatus.clear();
        ShadowToast.reset();
    }

    @After public void tearDown() {
        CallRecorder.resetForTests();
        CallRecorder.outputs = realOutputs;
        CallRecorder.saver = realSaver;
        CallRecorder.clock = realClock;
        CallRecorder.wall = realWall;
        CallRecorder.manual = realManual;
        for (AudioTrack track : tracks) track.release();
        for (AudioRecord record : records) record.release();
        Settings.RECORD_CALLS.resetToDefault();
        Settings.RECORD_CALL_BUTTON.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    private AudioTrack track(int rate) {
        AudioTrack track = CallRecorderForTests.track(rate);
        tracks.add(track);
        return track;
    }

    private AudioRecord record(int rate, int channels) {
        AudioRecord record = CallRecorderForTests.record(rate, channels);
        records.add(record);
        return record;
    }

    /** [count] samples of [value], 16-bit little-endian, the way WebRTC fills its buffers. */
    private static ByteBuffer pcm(int count, int value) {
        ByteBuffer buffer = ByteBuffer.allocateDirect(count * 2).order(ByteOrder.LITTLE_ENDIAN);
        for (int i = 0; i < count; i++) buffer.putShort((short) value);
        buffer.clear();
        return buffer;
    }

    private static ByteBuffer bytes(int... values) {
        ByteBuffer buffer = ByteBuffer.allocate(values.length);
        for (int value : values) buffer.put((byte) value);
        buffer.clear();
        return buffer;
    }

    /** [blocks] ten-millisecond blocks of the other side through the newer engine, ten milliseconds apart. */
    private void play(AudioTrack track, int blocks, int value) {
        for (int i = 0; i < blocks; i++) {
            CallRecorder.modernPlayed(track, pcm(BLOCK, value), BLOCK * 2);
            now += 10;
        }
    }

    /** Lets the call go quiet long enough to end, and shows what it toasted. */
    private String hangUp() {
        CallRecorder.drainForTests(now + CallRecorder.IDLE_MS);
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    private static void assertCounted(String what, int count) {
        String report = report();
        assertTrue(report, report.contains(what + " " + count));
    }

    @Test public void offByDefaultSoACallIsNeitherCopiedNorCounted() {
        assertFalse(Settings.RECORD_CALLS.get());
        AudioTrack track = track(CallMixer.RATE);
        CallRecorder.modernPlayed(track, pcm(BLOCK, 5), BLOCK * 2);
        CallRecorder.legacyRecorded(record(CallMixer.RATE, 1), pcm(BLOCK, 5), BLOCK * 2);
        assertTrue(CallRecorder.QUEUE.isEmpty());
        for (String taken : CallRecorder.TAKEN) assertFalse(report(), report().contains(taken));
        assertNull(hangUp());
        assertTrue(opened.isEmpty());
    }

    @Test public void eachEngineAndSideCountsItsOwnBlocksWithTheFormatItRanAt() {
        Settings.RECORD_CALLS.save(true);
        CallRecorder.modernRecorded(record(16000, 2), pcm(BLOCK, 1), 640);
        CallRecorder.modernPlayed(track(CallMixer.RATE), pcm(BLOCK, 2), BLOCK * 2);
        CallRecorder.legacyRecorded(record(CallMixer.RATE, 1), pcm(BLOCK, 3), BLOCK * 2);
        CallRecorder.legacyPlayed(track(CallMixer.RATE), pcm(BLOCK, 4), BLOCK * 2);
        for (String taken : CallRecorder.TAKEN) assertCounted(taken, 1);

        CallRecorder.Block[] blocks = CallRecorder.QUEUE.toArray(new CallRecorder.Block[0]);
        assertEquals(4, blocks.length);
        assertEquals(CallRecorder.NEWER_MIC, blocks[0].source);
        assertEquals(16000, blocks[0].rate);
        assertEquals(2, blocks[0].channels);
        assertEquals(640, blocks[0].pcm.length);
        assertTrue(blocks[0].mic());
        assertEquals(CallRecorder.NEWER_SPEAKER, blocks[1].source);
        assertFalse(blocks[1].mic());
        assertEquals(CallRecorder.OLDER_MIC, blocks[2].source);
        assertEquals(1, blocks[2].channels);
        assertEquals(CallRecorder.OLDER_SPEAKER, blocks[3].source);
        assertEquals(now, blocks[3].at);
    }

    @Test public void theMicrophoneIsReadFromTheStartOfItsBufferAndTheBufferIsLeftWhereItWas() {
        Settings.RECORD_CALLS.save(true);
        ByteBuffer buffer = bytes(1, 2, 3, 4, 5, 6, 7, 8);
        buffer.position(6);
        CallRecorder.modernRecorded(record(CallMixer.RATE, 1), buffer, 4);
        assertArrayEquals(new byte[]{1, 2, 3, 4}, CallRecorder.QUEUE.peek().pcm);
        assertEquals(6, buffer.position());
        assertEquals(8, buffer.limit());
    }

    @Test public void theOtherSideIsReadFromWhereTheSpeakerWillPlayIt() {
        Settings.RECORD_CALLS.save(true);
        ByteBuffer buffer = bytes(1, 2, 3, 4, 5, 6, 7, 8);
        buffer.position(2);
        CallRecorder.legacyPlayed(track(CallMixer.RATE), buffer, 4);
        assertArrayEquals(new byte[]{3, 4, 5, 6}, CallRecorder.QUEUE.poll().pcm);
        assertEquals(2, buffer.position());

        // A length past the buffer's end takes what's there, and nothing to read queues nothing.
        CallRecorder.legacyPlayed(track(CallMixer.RATE), buffer, 100);
        assertEquals(6, CallRecorder.QUEUE.poll().pcm.length);
        CallRecorder.legacyPlayed(track(CallMixer.RATE), buffer, 0);
        CallRecorder.legacyPlayed(null, buffer, 4);
        CallRecorder.legacyRecorded(record(CallMixer.RATE, 1), null, 4);
        assertTrue(CallRecorder.QUEUE.isEmpty());
        assertFalse(report(), report().contains("threw"));
    }

    @Test public void aFullQueueDropsTheBlockAndCountsItInsteadOfHoldingUpTheCall() {
        Settings.RECORD_CALLS.save(true);
        AudioTrack track = track(CallMixer.RATE);
        for (int i = 0; i <= CallRecorder.QUEUE_SIZE; i++) {
            CallRecorder.modernPlayed(track, pcm(BLOCK, 1), BLOCK * 2);
        }
        assertEquals(CallRecorder.QUEUE_SIZE, CallRecorder.QUEUE.size());
        assertCounted(CallRecorder.TAKEN[CallRecorder.NEWER_SPEAKER], CallRecorder.QUEUE_SIZE);
        assertCounted(CallRecorder.DROPPED, 1);
    }

    @Test public void audioThatIsNotSixteenBitIsCountedAndLeftOut() {
        ByteBuffer block = pcm(BLOCK, 1);
        CallRecorder.take(CallRecorder.NEWER_MIC, CallMixer.RATE, 1, AudioFormat.ENCODING_PCM_FLOAT, block, BLOCK * 2);
        CallRecorder.take(CallRecorder.NEWER_MIC, CallMixer.RATE, 1, AudioFormat.ENCODING_PCM_8BIT, block, BLOCK * 2);
        CallRecorder.take(CallRecorder.NEWER_MIC, 0, 1, AudioFormat.ENCODING_PCM_16BIT, block, BLOCK * 2);
        CallRecorder.take(CallRecorder.NEWER_MIC, CallMixer.RATE, 0, AudioFormat.ENCODING_PCM_16BIT, block, BLOCK * 2);
        assertTrue(CallRecorder.QUEUE.isEmpty());
        assertCounted(CallRecorder.UNREADABLE, 4);
        CallRecorder.take(CallRecorder.NEWER_MIC, CallMixer.RATE, 1, AudioFormat.ENCODING_DEFAULT, block, BLOCK * 2);
        assertEquals("the default encoding is 16-bit", 1, CallRecorder.QUEUE.size());
    }

    @Test public void aCallIsSavedUnderTheTimeItBeganOnceItHasBeenQuietForThreeSeconds() {
        Settings.RECORD_CALLS.save(true);
        AudioTrack track = track(CallMixer.RATE);
        AudioRecord mic = record(CallMixer.RATE, 1);
        for (int i = 0; i < 101; i++) {
            CallRecorder.modernRecorded(mic, pcm(BLOCK, 10), BLOCK * 2);
            CallRecorder.modernPlayed(track, pcm(BLOCK, 1000), BLOCK * 2);
            now += 10;
        }
        long lastBlock = now - 10;
        CallRecorder.drainForTests(lastBlock + CallRecorder.IDLE_MS - 1);
        assertTrue("still within the quiet time", CallRecorder.WRITER.active());
        assertTrue(savedNames.isEmpty());

        assertEquals("Call saved to " + L10n.isolate(FOLDER), hangUp());
        assertFalse(CallRecorder.WRITER.active());
        assertEquals(Arrays.asList("Telegram call 2026-10-30 21-15.m4a"), savedNames);
        assertEquals(Arrays.asList(true), savedFileThere);
        assertCounted(CallRecorder.SAVED, 1);
        FakeOutput output = opened.get(0);
        assertTrue(output.finished);
        assertFalse(output.abandoned);
        assertFalse("the copy in Telegram's cache is gone", output.file.exists());
        assertEquals(new File(RuntimeEnvironment.getApplication().getCacheDir(), CallRecordings.SCRATCH),
                output.file.getParentFile());
        // The microphone joins once primed, and what's left of it goes out at the end.
        assertEquals(104 * BLOCK, output.samples.size());
        assertEquals("the other side alone", 1000, (int) output.samples.get(0));
        assertEquals("both sides", 1010, (int) output.samples.get(101 * BLOCK - 1));
        assertEquals("what was left of the microphone", 10, (int) output.samples.get(output.samples.size() - 1));
    }

    @Test public void aCallUnderASecondIsntKeptOrAnnounced() {
        Settings.RECORD_CALLS.save(true);
        play(track(CallMixer.RATE), 99, 1000);
        assertNull(hangUp());
        assertTrue(savedNames.isEmpty());
        assertCounted(CallRecorder.TOO_SHORT, 1);
        assertTrue(opened.get(0).abandoned);
        assertFalse(opened.get(0).file.exists());
        assertFalse(report(), report().contains(CallRecorder.FAILED));
    }

    @Test public void aRecordingThatCantBeSavedSaysSoAndLeavesNothingBehind() {
        Settings.RECORD_CALLS.save(true);
        failSaves = true;
        play(track(CallMixer.RATE), 101, 1000);
        assertEquals("Couldn't save the call recording.", hangUp());
        assertCounted(CallRecorder.FAILED, 1);
        assertTrue(report(), report().contains("call recording save"));
        assertFalse(opened.get(0).file.exists());
        assertFalse(report(), report().contains(CallRecorder.SAVED));
    }

    @Test public void anEncoderThatFailsMidCallDropsTheRestOfThatCallAndSaysSoAtTheEnd() {
        Settings.RECORD_CALLS.save(true);
        AudioTrack track = track(CallMixer.RATE);
        play(track, 3, 1000);
        CallRecorder.drainForTests(now);
        failWrites = true;
        play(track, 200, 1000);
        CallRecorder.drainForTests(now);
        FakeOutput output = opened.get(0);
        assertTrue(output.abandoned);
        assertEquals(3 * BLOCK, output.samples.size());
        assertTrue("the call is still on, so its end is still awaited", CallRecorder.WRITER.active());

        assertEquals("Couldn't save the call recording.", hangUp());
        assertCounted(CallRecorder.FAILED, 1);
        assertTrue(report(), report().contains("call recording encode"));
        assertEquals("one output for the whole call", 1, opened.size());
    }

    @Test public void eachSideFollowsOneEngineSoNothingIsMixedInTwice() {
        Settings.RECORD_CALLS.save(true);
        AudioTrack newer = track(CallMixer.RATE);
        AudioTrack older = track(CallMixer.RATE);
        for (int i = 0; i < 10; i++) {
            CallRecorder.modernPlayed(newer, pcm(BLOCK, 100), BLOCK * 2);
            CallRecorder.legacyPlayed(older, pcm(BLOCK, 200), BLOCK * 2);
            now += 10;
        }
        CallRecorder.drainForTests(now);
        List<Short> samples = opened.get(0).samples;
        assertEquals(10 * BLOCK, samples.size());
        for (short sample : samples) assertEquals(100, sample);

        // The older engine is followed once the newer one has been quiet for half a second.
        now += CallRecorder.SWITCH_MS - 100;
        CallRecorder.legacyPlayed(older, pcm(BLOCK, 200), BLOCK * 2);
        CallRecorder.drainForTests(now);
        assertEquals("not quiet long enough yet", 10 * BLOCK, samples.size());
        now += 100;
        CallRecorder.legacyPlayed(older, pcm(BLOCK, 200), BLOCK * 2);
        CallRecorder.drainForTests(now);
        assertEquals(11 * BLOCK, samples.size());
        assertEquals(200, (int) samples.get(samples.size() - 1));
    }

    @Test public void turningTheSwitchOffMidCallStopsCopyingAndKeepsWhatWasRecorded() {
        Settings.RECORD_CALLS.save(true);
        AudioTrack track = track(CallMixer.RATE);
        play(track, 101, 1000);
        Settings.RECORD_CALLS.save(false);
        play(track, 50, 1000);
        assertEquals(101, CallRecorder.QUEUE.size());
        assertEquals("Call saved to " + L10n.isolate(FOLDER), hangUp());
        assertEquals(101 * BLOCK, opened.get(0).samples.size());
    }

    @Test public void theNextCallGetsAFileOfItsOwn() {
        Settings.RECORD_CALLS.save(true);
        AudioTrack track = track(CallMixer.RATE);
        play(track, 101, 1000);
        hangUp();
        now += 60_000;
        wallNow = CALL_STARTED + 2 * 60_000;
        play(track, 120, 1000);
        hangUp();
        assertEquals(Arrays.asList("Telegram call 2026-10-30 21-15.m4a", "Telegram call 2026-10-30 21-17.m4a"), savedNames);
        assertEquals(2, opened.size());
        assertEquals(120 * BLOCK, opened.get(1).samples.size());
        assertCounted(CallRecorder.SAVED, 2);
    }

    @Test public void aTapBeforeTheCallRecordsThatCallOnlyWithTheSwitchOff() {
        Settings.RECORD_CALL_BUTTON.save(true);
        CallRecorder.choose(true);
        assertTrue(CallRecorder.recordingThisCall());
        now += 20_000;
        AudioTrack track = track(CallMixer.RATE);
        play(track, 101, 1000);
        assertEquals(101, CallRecorder.QUEUE.size());
        assertEquals("Call saved to " + L10n.isolate(FOLDER), hangUp());
        assertEquals(101 * BLOCK, opened.get(0).samples.size());

        now += 60_000;
        assertFalse("the choice ended with its call", CallRecorder.recordingThisCall());
        play(track, 120, 1000);
        assertTrue(CallRecorder.QUEUE.isEmpty());
        assertEquals(1, opened.size());
    }

    @Test public void aTapMidCallStopsThatCallOnlyWithTheSwitchOn() {
        Settings.RECORD_CALLS.save(true);
        Settings.RECORD_CALL_BUTTON.save(true);
        AudioTrack track = track(CallMixer.RATE);
        play(track, 101, 1000);
        CallRecorder.choose(false);
        assertFalse(CallRecorder.recordingThisCall());
        play(track, 50, 1000);
        assertEquals(101, CallRecorder.QUEUE.size());
        assertEquals("Call saved to " + L10n.isolate(FOLDER), hangUp());

        now += 60_000;
        play(track, 120, 1000);
        assertEquals("the next call follows the switch again", 120, CallRecorder.QUEUE.size());
    }

    @Test public void aTapMidCallThatEndsRightAwayDoesNotReachTheNextCall() {
        Settings.RECORD_CALL_BUTTON.save(true);
        AudioTrack track = track(CallMixer.RATE);
        play(track, 101, 1000);
        // Tapped as the call hung up: no audio follows the tap, yet the choice still ends with that call.
        CallRecorder.choose(true);
        now += CallRecorder.IDLE_MS + 1_000;
        play(track, 120, 1000);
        assertTrue(CallRecorder.QUEUE.isEmpty());
    }

    @Test public void aTapNoCallAudioFollowsLapses() {
        Settings.RECORD_CALL_BUTTON.save(true);
        CallRecorder.choose(true);
        now += CallRecorder.UNANSWERED_MS - 1;
        assertTrue(CallRecorder.recordingThisCall());
        now += 1;
        assertFalse(CallRecorder.recordingThisCall());
        play(track(CallMixer.RATE), 10, 1000);
        assertTrue(CallRecorder.QUEUE.isEmpty());
    }

    @Test public void aTapTurnsWithItsSwitchAndWithPause() {
        Settings.RECORD_CALL_BUTTON.save(false);
        CallRecorder.choose(true);
        AudioTrack track = track(CallMixer.RATE);
        play(track, 10, 1000);
        assertTrue("the button's switch is off", CallRecorder.QUEUE.isEmpty());

        Settings.RECORD_CALL_BUTTON.save(true);
        play(track, 10, 1000);
        assertEquals(10, CallRecorder.QUEUE.size());
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        play(track, 10, 1000);
        assertEquals(10, CallRecorder.QUEUE.size());
        assertFalse(CallRecorder.recordingThisCall());
    }
}
