/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-13.
 * Written by lavinhoque33, 2026-11-12.
 */
package app.morphe.extension.music.patches.crossfade;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.media.AudioTrack;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Test;

/** Exercises native hook facts directly; Android stubs never supply simulated hardware progress. */
public class PcmFadeBridgeTest {
    private static final int FLOAT = PcmGainProcessor.ENCODING_PCM_FLOAT;
    private static final float EPSILON = 0.000001f;
    private final List<Object> players = new ArrayList<>();

    @After
    public void releasePlayers() {
        PcmFadeBridge.cancelPlayer();
        for (Object player : players) PcmFadeBridge.release(player);
    }

    @Test
    public void latestNegotiatedBranchIsAuthoritativeNotFactoryCreationOrder() {
        Object player = player();
        PcmFadeBridge.beginPlayer();
        Object first = PcmFadeBridge.create();
        Object second = PcmFadeBridge.create();
        Object third = PcmFadeBridge.create();
        PcmFadeBridge.endPlayer(player);
        assertTrue(PcmFadeBridge.hasProcessor(player));
        assertFalse(PcmFadeBridge.snapshot(player).negotiated);

        negotiate(first, new Object(), 4, 1);
        queue(first, 1, 1);
        PcmFadeBridge.Snapshot selected = PcmFadeBridge.snapshot(player);
        assertTrue(selected.supported);
        assertEquals(4, selected.sampleRate);
        assertEquals(2, selected.submittedFrames);

        negotiate(second, new Object(), 8, 2);
        queue(second, 1, 1, 1, 1, 1, 1);
        PcmFadeBridge.Snapshot replacement = PcmFadeBridge.snapshot(player);
        assertTrue(replacement.sinkGeneration > selected.sinkGeneration);
        assertEquals(8, replacement.sampleRate);
        assertEquals(3, replacement.submittedFrames);

        // An inactive native branch may still drain callbacks. It cannot take ownership back.
        queue(first, 1, 1);
        assertTrue(PcmFadeBridge.configure(third, 16, 1, FLOAT));
        assertEquals(replacement.sinkGeneration, PcmFadeBridge.snapshot(player).sinkGeneration);
        assertEquals(3, PcmFadeBridge.snapshot(player).submittedFrames);
    }

    @Test
    public void negotiationBeforeFactoryReturnSelectsLastNegotiatedBranch() {
        Object player = player();
        PcmFadeBridge.beginPlayer();
        Object first = PcmFadeBridge.create();
        Object second = PcmFadeBridge.create();
        negotiate(second, new Object(), 8, 1);
        negotiate(first, new Object(), 4, 1);
        PcmFadeBridge.endPlayer(player);

        assertTrue(PcmFadeBridge.snapshot(player).negotiated);
        assertEquals(4, PcmFadeBridge.snapshot(player).sampleRate);
        queue(second, 1, 1);
        assertEquals(0, PcmFadeBridge.snapshot(player).submittedFrames);
    }

    @Test
    public void encodedNegotiationOverridesPreviouslySupportedProcessor() {
        Object player = player();
        PcmFadeBridge.beginPlayer();
        Object pcm = PcmFadeBridge.create();
        Object encoded = PcmFadeBridge.create();
        PcmFadeBridge.endPlayer(player);
        Object pcmSink = new Object();
        Object pcmTrack = new Object();
        negotiate(pcm, pcmSink, 4, 1);
        queue(pcm, 1, 1);
        long oldGeneration = PcmFadeBridge.beginPlayed(pcm, pcmSink, pcmTrack);
        assertFalse(PcmFadeBridge.configure(encoded, 48000, 2, 5));
        PcmFadeBridge.sinkConfigured(encoded, new Object(), "audio/ac3");

        PcmFadeBridge.Snapshot unsupported = PcmFadeBridge.snapshot(player);
        assertTrue(unsupported.negotiated);
        assertFalse(unsupported.supported);
        assertEquals(0, unsupported.submittedFrames);
        assertEquals(-1, PcmFadeBridge.beginPlayed(pcm, pcmSink, pcmTrack));
        PcmFadeBridge.played(pcm, pcmTrack, 2, oldGeneration);
        queue(pcm, 1);
        assertEquals(unsupported.sinkGeneration, PcmFadeBridge.snapshot(player).sinkGeneration);
        assertFalse(PcmFadeBridge.snapshot(player).supported);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);
    }

    @Test
    public void submittedFramesNeverManufacturePlayedProgress() {
        Object player = player();
        Object token = bind(player);
        negotiate(token, new Object(), 4, 2);
        queue(token, 1, 1, 1, 1, 1, 1);

        PcmFadeBridge.Snapshot first = PcmFadeBridge.snapshot(player);
        assertEquals(3, first.submittedFrames);
        assertEquals(0, first.playedFrames);
        assertEquals(first.sinkGeneration, PcmFadeBridge.snapshot(player).sinkGeneration);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);
    }

    @Test
    public void nativePlayedFactsRequireMatchingGenerationTrackAndActiveSink() {
        Object player = player();
        Object token = bind(player);
        Object sink = new Object();
        Object track = new Object();
        negotiate(token, sink, 4, 1);
        queue(token, 1, 1, 1, 1);
        long generation = PcmFadeBridge.beginPlayed(token, sink, track);
        assertEquals(-1, PcmFadeBridge.beginPlayed(token, new Object(), track));
        PcmFadeBridge.played(token, new Object(), 3, generation);
        PcmFadeBridge.played(token, track, 3, generation - 1);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);

        // These are explicit facts at the native callback boundary, not an Android stub clock.
        PcmFadeBridge.played(token, track, 2, generation);
        PcmFadeBridge.Snapshot acknowledged = PcmFadeBridge.snapshot(player);
        assertEquals(2, acknowledged.playedFrames);
        PcmFadeBridge.played(token, track, 1, generation);
        assertEquals(2, PcmFadeBridge.snapshot(player).playedFrames);
        PcmFadeBridge.played(token, track, 100, generation);
        assertEquals(4, PcmFadeBridge.snapshot(player).playedFrames);
        assertEquals(2, acknowledged.playedFrames);
    }

    @Test
    public void nativeFlushStartsNewCountersRejectsOldFactsAndPreservesEnvelope() {
        Object player = player();
        Object token = bind(player);
        Object sink = new Object();
        Object track = new Object();
        negotiate(token, sink, 4, 1);
        PcmFadeBridge.setGain(player, 0, 0);
        PcmFadeBridge.setEnvelope(player, 1, 1000, 3);
        assertArrayEquals(new float[]{0, 0.15625f}, queue(token, 1, 1), EPSILON);
        long oldGeneration = PcmFadeBridge.beginPlayed(token, sink, track);
        PcmFadeBridge.played(token, track, 1, oldGeneration);
        PcmFadeBridge.Snapshot before = PcmFadeBridge.snapshot(player);

        PcmFadeBridge.sinkFlushed(token);
        PcmFadeBridge.flush(token);
        PcmFadeBridge.Snapshot flushed = PcmFadeBridge.snapshot(player);
        assertTrue(flushed.sinkGeneration > before.sinkGeneration);
        assertEquals(0, flushed.submittedFrames);
        assertEquals(0, flushed.playedFrames);
        assertEquals(0.5f, flushed.gain, EPSILON);
        PcmFadeBridge.played(token, track, 2, oldGeneration);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);

        assertArrayEquals(new float[]{0.5f, 0.84375f}, queue(token, 1, 1), EPSILON);
        Object replacementTrack = new Object();
        long generation = PcmFadeBridge.beginPlayed(token, sink, replacementTrack);
        PcmFadeBridge.played(token, track, 2, oldGeneration);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);
        PcmFadeBridge.played(token, replacementTrack, 2, generation);
        assertEquals(2, PcmFadeBridge.snapshot(player).playedFrames);
        assertEquals(1, PcmFadeBridge.snapshot(player).gain, EPSILON);
    }

    @Test
    public void processorFlushRebasesPlayedFramesWithoutReusingOldQueueAcknowledgements() {
        Object player = player();
        Object token = bind(player);
        Object sink = new Object();
        Object track = new Object();
        negotiate(token, sink, 4, 1);
        queue(token, 1, 1, 1, 1);
        long oldGeneration = PcmFadeBridge.beginPlayed(token, sink, track);
        PcmFadeBridge.played(token, track, 2, oldGeneration);
        PcmFadeBridge.flush(token);
        queue(token, 1, 1);
        long generation = PcmFadeBridge.beginPlayed(token, sink, track);
        assertTrue(generation > oldGeneration);

        PcmFadeBridge.played(token, track, 4, oldGeneration);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);
        PcmFadeBridge.played(token, track, 4, generation);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);
        PcmFadeBridge.played(token, track, 5, generation);
        assertEquals(1, PcmFadeBridge.snapshot(player).playedFrames);
        assertEquals(2, PcmFadeBridge.snapshot(player).submittedFrames);
    }

    @Test
    public void normalizationAndEnvelopeCommandsRemainIsolatedPerPlayer() {
        Object firstPlayer = player();
        Object secondPlayer = player();
        Object first = bind(firstPlayer);
        Object second = bind(secondPlayer);
        negotiate(first, new Object(), 4, 1);
        negotiate(second, new Object(), 4, 1);
        assertEquals(0.7f, PcmFadeBridge.volumeFor(firstPlayer, 0.7f), 0);
        assertEquals(0.25f, PcmFadeBridge.normalization(firstPlayer, 0.25f), 0);
        assertEquals(0.8f, PcmFadeBridge.normalization(secondPlayer, 0.8f), 0);
        PcmFadeBridge.setGain(firstPlayer, 0, 0);
        PcmFadeBridge.setEnvelope(firstPlayer, 1, 1000, 0);

        assertArrayEquals(new float[]{0}, queue(first, 1), 0);
        assertArrayEquals(new float[]{1}, queue(second, 1), 0);
        assertEquals(0.25f, PcmFadeBridge.volumeFor(firstPlayer, 1), 0);
        assertEquals(0.8f, PcmFadeBridge.volumeFor(secondPlayer, 1), 0);
        PcmFadeBridge.release(firstPlayer);
        assertEquals(0.6f, PcmFadeBridge.volumeFor(firstPlayer, 0.6f), 0);
        assertEquals(0.8f, PcmFadeBridge.volumeFor(secondPlayer, 1), 0);
        assertTrue(PcmFadeBridge.snapshot(secondPlayer).supported);
    }

    @Test
    public void deferredEnvelopePreservesFirstZeroBeforeFormatNegotiation() {
        Object player = player();
        Object token = bind(player);
        PcmFadeBridge.setGain(player, 0, 0);
        PcmFadeBridge.setEnvelope(player, 1, 1000, 0);
        negotiate(token, new Object(), 4, 2);

        float next = (float) Math.sin(Math.PI / 8);
        assertArrayEquals(new float[]{0, 0, next, next}, queue(token, 1, 1, 1, 1), EPSILON);
        assertEquals((float) Math.sin(Math.PI / 4), PcmFadeBridge.snapshot(player).gain, EPSILON);
        assertEquals(2, PcmFadeBridge.snapshot(player).submittedFrames);
    }

    @Test
    public void rateChangeRemapsRemainingCurveDurationAndPauseFreezesFutureFrames() {
        Object player = player();
        Object token = bind(player);
        negotiate(token, new Object(), 4, 1);
        PcmFadeBridge.setGain(player, 0, 0);
        PcmFadeBridge.setEnvelope(player, 1, 1000, 3);
        queue(token, 1, 1);
        PcmFadeBridge.Snapshot before = PcmFadeBridge.snapshot(player);
        assertEquals(0.5f, before.gain, EPSILON);

        assertTrue(PcmFadeBridge.configure(token, 8, 2, FLOAT));
        PcmFadeBridge.Snapshot changed = PcmFadeBridge.snapshot(player);
        assertTrue(changed.sinkGeneration > before.sinkGeneration);
        assertEquals(8, changed.sampleRate);
        assertEquals(0, changed.submittedFrames);
        assertEquals(0.5f, changed.gain, EPSILON);
        PcmFadeBridge.pause(player, true);
        assertArrayEquals(new float[]{0.5f, 0.5f, 0.5f, 0.5f}, queue(token, 1, 1, 1, 1), EPSILON);
        assertEquals(0.5f, PcmFadeBridge.snapshot(player).gain, EPSILON);

        PcmFadeBridge.pause(player, false);
        queue(token, 1, 1, 1, 1, 1, 1, 1, 1);
        assertEquals(1, PcmFadeBridge.snapshot(player).gain, EPSILON);
        assertEquals(6, PcmFadeBridge.snapshot(player).submittedFrames);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);
    }

    @Test
    public void allOutgoingCurveOrdinalsRetargetFromAppliedNotRequestedGain() {
        float[] halfway = {(float) Math.cos(Math.PI / 4), 0.875f, 0.25f, 0.5f};
        for (int curve = 0; curve < halfway.length; curve++) {
            Object player = player();
            Object token = bind(player);
            negotiate(token, new Object(), 4, 1);
            PcmFadeBridge.setEnvelope(player, 0, 1000, curve);
            assertEquals(1, PcmFadeBridge.snapshot(player).gain, 0);
            queue(token, 1, 1);
            assertEquals(halfway[curve], PcmFadeBridge.snapshot(player).gain, EPSILON);
            PcmFadeBridge.setEnvelope(player, 1, 1000, curve);
            assertArrayEquals(new float[]{halfway[curve]}, queue(token, 1), EPSILON);
        }
    }

    @Test
    public void eosWaitsForTransferredOutputAndDoesNotImplyHardwareDrain() {
        Object player = player();
        Object token = bind(player);
        negotiate(token, new Object(), 4, 1);
        PcmFadeBridge.queueInput(token, input(1, 1));
        PcmFadeBridge.queueEndOfStream(token);
        ByteBuffer transferred = PcmFadeBridge.getOutput(token);
        assertFalse(PcmFadeBridge.snapshot(player).ended);
        assertFalse(PcmFadeBridge.getOutput(token).hasRemaining());
        transferred.position(transferred.limit());

        assertTrue(PcmFadeBridge.snapshot(player).ended);
        assertEquals(2, PcmFadeBridge.snapshot(player).submittedFrames);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);
    }

    @Test
    public void releasedPlayerRejectsNativeFactsAndConstructionCancellationDoesNotBind() {
        Object player = player();
        Object token = bind(player);
        Object sink = new Object();
        Object track = new Object();
        negotiate(token, sink, 4, 1);
        queue(token, 1, 1);
        long generation = PcmFadeBridge.beginPlayed(token, sink, track);
        PcmFadeBridge.release(player);
        PcmFadeBridge.played(token, track, 2, generation);
        assertEquals(-1, PcmFadeBridge.beginPlayed(token, sink, track));
        assertFalse(PcmFadeBridge.hasProcessor(player));
        assertFalse(PcmFadeBridge.snapshot(player).negotiated);
        assertEquals(0, PcmFadeBridge.snapshot(player).playedFrames);

        Object cancelled = player();
        PcmFadeBridge.beginPlayer();
        Object detached = PcmFadeBridge.create();
        PcmFadeBridge.cancelPlayer();
        PcmFadeBridge.endPlayer(cancelled);
        negotiate(detached, new Object(), 4, 1);
        assertFalse(PcmFadeBridge.hasProcessor(cancelled));
        assertFalse(PcmFadeBridge.snapshot(cancelled).negotiated);
    }

    @Test
    public void audibleWatermarkUsesOutputFramesNotChannelsOrZeroGainSuffix() {
        Object player = player();
        Object token = bind(player);
        Object sink = new Object();
        Object track = new Object();
        negotiate(token, sink, 4, 2);
        PcmFadeBridge.setEnvelope(player, 0, 1000, 3);
        queue(token, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

        PcmFadeBridge.Snapshot complete = PcmFadeBridge.snapshot(player);
        assertEquals(6, complete.submittedFrames);
        assertEquals(4, complete.audibleFrames);
        assertEquals(0, complete.gain, EPSILON);
        long generation = PcmFadeBridge.beginPlayed(token, sink, track);
        PcmFadeBridge.played(token, track, 4, generation);
        queue(token, 1, 1, 1, 1);
        PcmFadeBridge.Snapshot drained = PcmFadeBridge.snapshot(player);
        assertEquals(8, drained.submittedFrames);
        assertEquals(4, drained.audibleFrames);
        assertEquals(4, drained.playedFrames);
        assertFalse(drained.stopped);
    }

    @Test
    public void eosBeforeEnvelopeEndsRetainsAudibleWatermarkUntilExplicitHardwareFacts() {
        Object player = player();
        Object token = bind(player);
        Object sink = new Object();
        Object track = new Object();
        negotiate(token, sink, 4, 1);
        PcmFadeBridge.setEnvelope(player, 0, 2000, 3);
        queue(token, 1, 1, 1, 1);
        PcmFadeBridge.queueEndOfStream(token);
        PcmFadeBridge.Snapshot ended = PcmFadeBridge.snapshot(player);
        assertTrue(ended.ended);
        assertEquals(0.5f, ended.gain, EPSILON);
        assertEquals(4, ended.audibleFrames);
        assertEquals(0, ended.playedFrames);
        PcmFadeBridge.setGain(player, 0, 0);
        assertEquals(4, PcmFadeBridge.snapshot(player).audibleFrames);

        long generation = PcmFadeBridge.beginPlayed(token, sink, track);
        PcmFadeBridge.played(token, track, 4, generation);
        assertEquals(4, PcmFadeBridge.snapshot(player).playedFrames);
    }

    @Test
    public void flushClearsAudibleWatermarkAndRejectsRetiredEpochAcknowledgement() {
        Object player = player();
        Object token = bind(player);
        Object sink = new Object();
        Object track = new Object();
        negotiate(token, sink, 4, 1);
        PcmFadeBridge.setEnvelope(player, 0, 1000, 3);
        queue(token, 1, 1, 1, 1, 1, 1);
        long generation = PcmFadeBridge.beginPlayed(token, sink, track);
        assertEquals(4, PcmFadeBridge.snapshot(player).audibleFrames);
        PcmFadeBridge.flush(token);
        queue(token, 1, 1);
        PcmFadeBridge.played(token, track, 6, generation);
        PcmFadeBridge.Snapshot flushed = PcmFadeBridge.snapshot(player);
        assertTrue(flushed.sinkGeneration > generation);
        assertEquals(0, flushed.audibleFrames);
        assertEquals(2, flushed.submittedFrames);
        assertEquals(0, flushed.playedFrames);
        assertEquals(0, flushed.gain, EPSILON);
    }

    @Test
    public void naturalEosStopPreservesServerTailButPauseOrExplicitStopCancelsIt() {
        assertFalse(PcmFadeBridge.playbackStopped(AudioTrack.PLAYSTATE_STOPPED, true));
        assertFalse(PcmFadeBridge.playbackStopped(AudioTrack.PLAYSTATE_PLAYING, true));
        assertFalse(PcmFadeBridge.playbackStopped(AudioTrack.PLAYSTATE_PLAYING, false));
        assertTrue(PcmFadeBridge.playbackStopped(AudioTrack.PLAYSTATE_STOPPED, false));
        assertTrue(PcmFadeBridge.playbackStopped(AudioTrack.PLAYSTATE_PAUSED, false));
        assertTrue(PcmFadeBridge.playbackStopped(AudioTrack.PLAYSTATE_PAUSED, true));
    }

    private Object player() {
        Object player = new Object();
        players.add(player);
        return player;
    }

    private static Object bind(Object player) {
        PcmFadeBridge.beginPlayer();
        Object token = PcmFadeBridge.create();
        PcmFadeBridge.endPlayer(player);
        return token;
    }

    private static void negotiate(Object token, Object sink, int rate, int channels) {
        assertTrue(PcmFadeBridge.configure(token, rate, channels, FLOAT));
        PcmFadeBridge.sinkConfigured(token, sink, "audio/raw");
    }

    private static ByteBuffer input(float... samples) {
        ByteBuffer input = ByteBuffer.allocate(samples.length * Float.BYTES).order(ByteOrder.nativeOrder());
        for (float sample : samples) input.putFloat(sample);
        input.flip();
        return input;
    }

    private static float[] queue(Object token, float... samples) {
        PcmFadeBridge.queueInput(token, input(samples));
        ByteBuffer output = PcmFadeBridge.getOutput(token);
        float[] values = new float[output.remaining() / Float.BYTES];
        for (int index = 0; index < values.length; index++) values[index] = output.getFloat();
        return values;
    }
}
