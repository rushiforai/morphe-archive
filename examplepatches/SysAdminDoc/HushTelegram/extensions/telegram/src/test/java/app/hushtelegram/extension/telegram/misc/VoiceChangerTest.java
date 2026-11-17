/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAudioRecord;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class VoiceChangerTest {
    private static final int RATE = 48000;
    private static final int TONE = 200;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        restore();
        PatchFamilyForTests.inBuild(PatchFamily.VOICE_ONE_AT_A_TIME);
        PatchFamilyForTests.installed(PatchFamily.Capability.VOICE_CHANGER);
    }

    @After public void restore() {
        PauseForTests.resume();
        PatchFamilyForTests.reset();
        PatchFamilyForTests.resetCapabilities();
        Settings.VOICE_CHANGER.resetToDefault();
        VoiceChanger.resetForTests();
        ShadowAudioRecord.clearSource();
        HookStatus.clear();
    }

    /** A second of a 200 Hz tone, run through [preset] in uneven chunks the way a recorder reads. */
    private static short[] changed(String preset) {
        VoiceChanger.Effect effect = VoiceChanger.Effect.of(preset, RATE);
        assertNotNull(preset, effect);
        short[] tone = tone(RATE);
        int[] chunks = {1920, 333, 2, 4096, 960};
        int at = 0;
        for (int i = 0; at < tone.length; i++) {
            int size = Math.min(chunks[i % chunks.length], tone.length - at);
            ByteBuffer chunk = buffer(tone, at, size);
            effect.apply(chunk, size * 2);
            read(chunk, tone, at, size);
            at += size;
        }
        return tone;
    }

    private static short[] tone(int samples) {
        short[] tone = new short[samples];
        for (int i = 0; i < samples; i++) tone[i] = (short) Math.round(8000 * Math.sin(2 * Math.PI * TONE * i / RATE));
        return tone;
    }

    private static ByteBuffer buffer(short[] from, int at, int size) {
        ByteBuffer buffer = ByteBuffer.allocateDirect(size * 2).order(ByteOrder.nativeOrder());
        for (int i = 0; i < size; i++) buffer.putShort(i * 2, from[at + i]);
        return buffer;
    }

    private static void read(ByteBuffer buffer, short[] into, int at, int size) {
        ByteBuffer pcm = buffer.duplicate().order(ByteOrder.nativeOrder());
        for (int i = 0; i < size; i++) into[at + i] = pcm.getShort(i * 2);
    }

    /** How strong [hz] is in the second half of [samples] (past the effect's start-up). */
    private static double power(short[] samples, double hz) {
        double coefficient = 2 * Math.cos(2 * Math.PI * hz / RATE), before = 0, last = 0;
        for (int i = samples.length / 2; i < samples.length; i++) {
            double now = samples[i] + coefficient * before - last;
            last = before;
            before = now;
        }
        return before * before + last * last - coefficient * before * last;
    }

    private static int loudest(short[] samples) {
        int best = 0;
        double most = -1;
        for (int hz = 60; hz <= 500; hz += 5) {
            double power = power(samples, hz);
            if (power > most) {
                most = power;
                best = hz;
            }
        }
        return best;
    }

    @Test public void eachVoiceMovesThePitchWhereItSays() {
        assertEquals(TONE * 1.7, loudest(changed(VoiceChanger.BABY)), 10);
        assertEquals(TONE * 1.35, loudest(changed(VoiceChanger.WOMAN)), 10);
        assertEquals(TONE * 0.75, loudest(changed(VoiceChanger.MAN)), 10);
        assertEquals(TONE * 0.6, loudest(changed(VoiceChanger.HORROR)), 10);
    }

    @Test public void theRobotSplitsTheVoiceAroundItsHum() {
        short[] robot = changed(VoiceChanger.ROBOT);
        double low = power(robot, TONE - 55), high = power(robot, TONE + 55), original = power(robot, TONE);
        assertTrue("low " + low + " vs " + original, low > 20 * original);
        assertTrue("high " + high + " vs " + original, high > 20 * original);
    }

    @Test public void theHorrorVoiceEchoes() {
        VoiceChanger.Effect effect = VoiceChanger.Effect.of(VoiceChanger.HORROR, RATE);
        short[] click = new short[RATE / 2];
        click[0] = 10000;
        ByteBuffer buffer = buffer(click, 0, click.length);
        effect.apply(buffer, click.length * 2);
        read(buffer, click, 0, click.length);
        int echo = Math.round(0.16f * RATE);
        double around = 0, before = 0;
        for (int i = echo - 2000; i < echo + 2000; i++) around += Math.abs(click[i]);
        for (int i = echo - 6000; i < echo - 2000; i++) before += Math.abs(click[i]);
        assertTrue("echo " + around + " vs quiet " + before, around > 5 * before + 1000);
    }

    @Test public void chunkSizeDoesntChangeTheSound() {
        for (String preset : VoiceChanger.PRESETS) {
            if (preset.isEmpty()) continue;
            short[] whole = tone(RATE / 4);
            ByteBuffer buffer = buffer(whole, 0, whole.length);
            VoiceChanger.Effect.of(preset, RATE).apply(buffer, whole.length * 2);
            read(buffer, whole, 0, whole.length);

            short[] pieces = tone(RATE / 4);
            VoiceChanger.Effect effect = VoiceChanger.Effect.of(preset, RATE);
            int at = 0;
            for (int size : new int[] {1, 999, 2, 5000, 3}) {
                ByteBuffer chunk = buffer(pieces, at, size);
                effect.apply(chunk, size * 2);
                read(chunk, pieces, at, size);
                at += size;
            }
            ByteBuffer rest = buffer(pieces, at, pieces.length - at);
            effect.apply(rest, (pieces.length - at) * 2);
            read(rest, pieces, at, pieces.length - at);
            assertArrayEquals(preset, whole, pieces);
        }
    }

    @Test public void onlyTheBytesReadChangeAndLoudPartsClipInsteadOfWrapping() {
        VoiceChanger.Effect robot = VoiceChanger.Effect.of(VoiceChanger.ROBOT, RATE);
        short[] loud = new short[RATE / 10];
        for (int i = 0; i < loud.length; i++) loud[i] = (short) (i % 2 == 0 ? Short.MAX_VALUE : Short.MIN_VALUE);
        ByteBuffer buffer = buffer(loud, 0, loud.length);
        robot.apply(buffer, 1000);
        short[] after = new short[loud.length];
        read(buffer, after, 0, loud.length);
        for (int i = 500; i < loud.length; i++) assertEquals("untouched past what was read, at " + i, loud[i], after[i]);
        for (int i = 0; i < 500; i++) {
            if (Math.abs(after[i]) > 30000) assertEquals("clipped, not wrapped, at " + i, Integer.signum(loud[i]), Integer.signum(after[i]));
        }
    }

    @Test public void offOrAnUnknownChoiceLeavesTheVoiceAlone() {
        assertNull(VoiceChanger.Effect.of(VoiceChanger.OFF, RATE));
        assertNull(VoiceChanger.Effect.of("chipmunk", RATE));
        assertNull(VoiceChanger.Effect.of(null, RATE));
        assertEquals(VoiceChanger.OFF, VoiceChanger.normalized("chipmunk"));
        assertEquals(VoiceChanger.MAN, VoiceChanger.normalized("man"));
        assertEquals("", Settings.VOICE_CHANGER.get());
        assertNull(VoiceChanger.effect(new Object(), AudioFormat.ENCODING_PCM_16BIT, 1, RATE));
    }

    @Test public void aRecordingKeepsTheVoiceItStartedWith() {
        Object first = new Object(), second = new Object();
        Settings.VOICE_CHANGER.save(VoiceChanger.BABY);
        VoiceChanger.Effect baby = VoiceChanger.effect(first, AudioFormat.ENCODING_PCM_16BIT, 1, RATE);
        assertNotNull(baby);
        Settings.VOICE_CHANGER.save(VoiceChanger.OFF);
        assertSame(baby, VoiceChanger.effect(first, AudioFormat.ENCODING_PCM_16BIT, 1, RATE));
        assertNull(VoiceChanger.effect(second, AudioFormat.ENCODING_PCM_16BIT, 1, RATE));

        Settings.VOICE_CHANGER.save(VoiceChanger.ROBOT);
        assertNull("still as it started", VoiceChanger.effect(second, AudioFormat.ENCODING_PCM_16BIT, 1, RATE));
        VoiceChanger.Effect robot = VoiceChanger.effect(new Object(), AudioFormat.ENCODING_PCM_16BIT, 1, RATE);
        assertNotNull(robot);
        assertNotSame(baby, robot);
    }

    @Test public void onlySixteenBitMonoIsChanged() {
        Settings.VOICE_CHANGER.save(VoiceChanger.WOMAN);
        assertNull(VoiceChanger.effect(new Object(), AudioFormat.ENCODING_PCM_8BIT, 1, RATE));
        assertNull(VoiceChanger.effect(new Object(), AudioFormat.ENCODING_PCM_FLOAT, 1, RATE));
        assertNull(VoiceChanger.effect(new Object(), AudioFormat.ENCODING_PCM_16BIT, 2, RATE));
        assertNotNull(VoiceChanger.effect(new Object(), AudioFormat.ENCODING_PCM_16BIT, 1, 16000));
    }

    @Test public void pausedOrNotInTheBuildRecordsAsIs() {
        Settings.VOICE_CHANGER.save(VoiceChanger.MAN);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertNull(VoiceChanger.effect(new Object(), AudioFormat.ENCODING_PCM_16BIT, 1, RATE));
        PauseForTests.resume();
        PatchFamilyForTests.installed();
        assertNull(VoiceChanger.effect(new Object(), AudioFormat.ENCODING_PCM_16BIT, 1, RATE));
        PatchFamilyForTests.installed(PatchFamily.Capability.VOICE_CHANGER);
        assertNotNull(VoiceChanger.effect(new Object(), AudioFormat.ENCODING_PCM_16BIT, 1, RATE));
    }

    @Test public void telegramsReadComesBackChangedWithTheSameCount() {
        short[] tone = tone(RATE / 2);
        int[] next = {0};
        ShadowAudioRecord.setSource(new ShadowAudioRecord.AudioRecordSource() {
            @Override public int readInDirectBuffer(ByteBuffer buffer, int size, boolean blocking) {
                ByteBuffer pcm = buffer.duplicate().order(ByteOrder.nativeOrder());
                int samples = Math.min(size / 2, tone.length - next[0]);
                for (int i = 0; i < samples; i++) pcm.putShort(i * 2, tone[next[0] + i]);
                next[0] += samples;
                return samples * 2;
            }
        });
        Settings.VOICE_CHANGER.save(VoiceChanger.MAN);
        AudioRecord record = new AudioRecord(MediaRecorder.AudioSource.MIC, RATE,
                AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT, 4096);
        short[] heard = new short[tone.length];
        int at = 0;
        while (at < heard.length) {
            ByteBuffer buffer = ByteBuffer.allocateDirect(2048).order(ByteOrder.nativeOrder());
            int read = VoiceChanger.read(record, buffer, 2048);
            assertEquals(Math.min(2048, (heard.length - at) * 2), read);
            read(buffer, heard, at, read / 2);
            at += read / 2;
        }
        record.release();
        int peak = loudest(heard);
        assertEquals(TONE * 0.75, peak, 10);
        assertTrue(String.join("\n", HookStatus.report()), String.join("\n", HookStatus.report()).contains("voice changer man"));
    }

    @Test public void aFailedReadIsPassedBackUntouched() {
        ShadowAudioRecord.setSource(new ShadowAudioRecord.AudioRecordSource() {
            @Override public int readInDirectBuffer(ByteBuffer buffer, int size, boolean blocking) {
                return AudioRecord.ERROR_DEAD_OBJECT;
            }
        });
        Settings.VOICE_CHANGER.save(VoiceChanger.ROBOT);
        AudioRecord record = new AudioRecord(MediaRecorder.AudioSource.MIC, RATE,
                AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT, 4096);
        assertEquals(AudioRecord.ERROR_DEAD_OBJECT, VoiceChanger.read(record, ByteBuffer.allocateDirect(64), 64));
        record.release();
    }
}
