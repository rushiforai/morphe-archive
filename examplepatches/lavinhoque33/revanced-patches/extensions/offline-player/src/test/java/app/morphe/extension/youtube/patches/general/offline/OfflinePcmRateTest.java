/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import rvx.offline.pcm.androidx.media3.common.C;
import rvx.offline.pcm.androidx.media3.common.PlaybackParameters;
import rvx.offline.pcm.androidx.media3.common.audio.AudioProcessor;
import rvx.offline.pcm.androidx.media3.common.audio.SonicAudioProcessor;
import rvx.offline.pcm.androidx.media3.exoplayer.audio.DefaultAudioSink;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, manifest = Config.NONE)
public class OfflinePcmRateTest {
    private static final int SAMPLE_RATE = 48_000;
    private static final int TONE_HZ = 200;
    private static final float[] RATES = {0.05f, 1.4f, 1.5f, 2.5f, 8f};

    @Test
    public void softwareSinkDoesNotClampCustomRatesOrChangePitch() {
        DefaultAudioSink sink = new DefaultAudioSink.Builder()
                .setEnableAudioOutputPlaybackParameters(false)
                .build();

        for (float rate : RATES) {
            sink.setPlaybackParameters(new PlaybackParameters(rate, 1f));
            assertEquals(rate, sink.getPlaybackParameters().speed, 0f);
            assertEquals(1f, sink.getPlaybackParameters().pitch, 0f);
        }
    }

    @Test
    public void stretchProducesAudibleUnshiftedPcmForTheRequestedDuration() throws Exception {
        for (float rate : RATES) {
            SonicAudioProcessor processor = new SonicAudioProcessor();
            processor.setSpeed(rate);
            processor.setPitch(1f);
            processor.configure(new AudioProcessor.AudioFormat(SAMPLE_RATE, 1, C.ENCODING_PCM_16BIT));
            processor.flush(AudioProcessor.StreamMetadata.DEFAULT);
            processor.queueInput(oneSecondOfTone());
            processor.queueEndOfStream();

            int frames = 0;
            int peakAmplitude = 0;
            int positiveCrossings = 0;
            short previous = 0;
            while (!processor.isEnded()) {
                ByteBuffer output = processor.getOutput().order(ByteOrder.nativeOrder());
                while (output.remaining() >= Short.BYTES) {
                    short sample = output.getShort();
                    if (previous <= 0 && sample > 0) positiveCrossings++;
                    peakAmplitude = Math.max(peakAmplitude, Math.abs(sample));
                    previous = sample;
                    frames++;
                }
            }

            assertEquals("media time / playout time, rate " + rate, rate, SAMPLE_RATE / (double) frames, rate * 0.03);
            assertTrue("audio was muted at rate " + rate, peakAmplitude > 10_000);
            assertEquals("tone pitch, rate " + rate, TONE_HZ, positiveCrossings * (double) SAMPLE_RATE / frames, 15);
        }
    }

    private static ByteBuffer oneSecondOfTone() {
        ByteBuffer input = ByteBuffer.allocateDirect(SAMPLE_RATE * Short.BYTES).order(ByteOrder.nativeOrder());
        for (int frame = 0; frame < SAMPLE_RATE; frame++) {
            input.putShort((short) (16_000 * Math.sin(2 * Math.PI * frame * TONE_HZ / SAMPLE_RATE)));
        }
        input.flip();
        return input;
    }
}
