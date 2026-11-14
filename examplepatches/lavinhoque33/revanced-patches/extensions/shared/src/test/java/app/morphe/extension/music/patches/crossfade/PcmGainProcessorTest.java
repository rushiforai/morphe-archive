/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * Written by lavinhoque33, 2026-11-12
 * Modified by lavinhoque33, 2026-11-13.
 */

package app.morphe.extension.music.patches.crossfade;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.Test;

public class PcmGainProcessorTest {
    private static final float EPSILON = 0.000001f;
    private static final int PCM16 = PcmGainProcessor.ENCODING_PCM_16BIT;
    private static final int FLOAT = PcmGainProcessor.ENCODING_PCM_FLOAT;

    @Test
    public void defaultGainPreservesEveryPcm16Bit() {
        PcmGainProcessor processor = processor(1, PCM16);
        short[] samples = {Short.MIN_VALUE, -12345, -1, 0, 1, 12345, Short.MAX_VALUE};

        processor.queueInput(pcm16(samples));

        assertArrayEquals(samples, shorts(processor.getOutput()));
    }

    @Test
    public void unityPreservesFloatBitPatternsWithoutClippingOrCanonicalizingNan() {
        PcmGainProcessor processor = processor(1, FLOAT);
        int[] bits = {0, 0x80000000, 0x3F800000, 0xBF800000, 0x40000000, 0x7FC01234, 0x7F800000};
        ByteBuffer input = bytes(bits.length * 4);
        for (int value : bits) {
            input.putInt(value);
        }
        input.flip();
        processor.queueInput(input);
        ByteBuffer output = processor.getOutput();

        for (int value : bits) {
            assertEquals(value, output.getInt());
        }
        assertFalse(output.hasRemaining());
    }

    @Test
    public void pcm16AttenuatesPositiveAndNegativeSamplesWithRounding() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.setGain(0.5f, 0);
        processor.queueInput(pcm16(Short.MIN_VALUE, -3, -2, -1, 0, 1, 2, 3, Short.MAX_VALUE));

        assertArrayEquals(new short[]{-16384, -1, -1, 0, 0, 1, 1, 2, 16384}, shorts(processor.getOutput()));
    }

    @Test
    public void pcm16AmplificationSaturatesInsteadOfWrapping() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.setGain(4.0f, 0);
        processor.queueInput(pcm16(-32768, -10000, -1, 0, 1, 10000, 32767));

        assertArrayEquals(new short[]{-32768, -32768, -4, 0, 4, 32767, 32767}, shorts(processor.getOutput()));
    }

    @Test
    public void floatGainPreservesHeadroom() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(2.0f, 0);
        processor.queueInput(floats(-1.0f, -0.25f, 0.0f, 0.25f, 1.0f));

        assertArrayEquals(new float[]{-2.0f, -0.5f, 0.0f, 0.5f, 2.0f}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void zeroGainIsSilentEvenForNonfiniteFloatInput() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0.0f, 0);
        processor.queueInput(floats(Float.NaN, Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY, -1.0f));

        assertArrayEquals(new float[]{0, 0, 0, 0}, values(processor.getOutput()), 0.0f);
    }

    @Test
    public void incomingAnchorSurvivesFadePublishedBeforeFirstInput() {
        PcmGainProcessor processor = processor(2, PCM16);
        processor.setGain(0.0f, 0);
        processor.setGain(1.0f, 4);
        processor.queueInput(pcm16(1000, -1000, 1000, -1000, 1000, -1000, 1000, -1000, 1000, -1000));

        assertArrayEquals(new short[]{0, 0, 250, -250, 500, -500, 750, -750, 1000, -1000},
                shorts(processor.getOutput()));
    }

    @Test
    public void incomingAnchorCanBePublishedBeforeConfigure() {
        PcmGainProcessor processor = new PcmGainProcessor();
        processor.setGain(0.0f, 0);
        processor.setGain(1.0f, 1);
        assertTrue(processor.configure(48000, 1, FLOAT));
        processor.queueInput(floats(1, 1, 1));

        assertArrayEquals(new float[]{0, 1, 1}, values(processor.getOutput()), 0.0f);
    }

    @Test
    public void floatRampAdvancesOncePerSurroundFrameNotPerChannel() {
        PcmGainProcessor processor = processor(6, FLOAT);
        processor.setGain(0.0f, 0);
        processor.setGain(1.0f, 2);
        processor.queueInput(floats(1, -1, 0.5f, -0.5f, 0.25f, -0.25f,
                1, -1, 0.5f, -0.5f, 0.25f, -0.25f, 1, -1, 0.5f, -0.5f, 0.25f, -0.25f));

        assertArrayEquals(new float[]{0, 0, 0, 0, 0, 0,
                0.5f, -0.5f, 0.25f, -0.25f, 0.125f, -0.125f, 1, -1, 0.5f, -0.5f, 0.25f, -0.25f},
                values(processor.getOutput()), EPSILON);
    }

    @Test
    public void rampDownFinishesAtExactTargetAndHoldsIt() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0.0f, 3);
        processor.queueInput(floats(1, 1, 1, 1, 1));

        assertArrayEquals(new float[]{1, 2.0f / 3, 1.0f / 3, 0, 0}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void rampRetargetsFromTheNextUnplayedFrame() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0, 0);
        processor.setGain(1, 4);
        processor.queueInput(floats(1, 1));
        assertArrayEquals(new float[]{0, 0.25f}, values(processor.getOutput()), EPSILON);

        processor.setGain(0, 2);
        processor.queueInput(floats(1, 1, 1));
        assertArrayEquals(new float[]{0.5f, 0.25f, 0}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void latestUnappliedRampWinsButDoesNotLoseItsImmediateAnchor() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0.25f, 0);
        processor.setGain(1, 10);
        processor.setGain(0.75f, 2);
        processor.queueInput(floats(1, 1, 1));

        assertArrayEquals(new float[]{0.25f, 0.5f, 0.75f}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void immediateCommandCancelsAnExistingRamp() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0, 4);
        processor.queueInput(floats(1));
        values(processor.getOutput());
        processor.setGain(0.125f, 0);
        processor.queueInput(floats(1, 1, 1));

        assertArrayEquals(new float[]{0.125f, 0.125f, 0.125f}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void frameCountAcceptsLongDurationsWithoutTruncation() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0, 0);
        processor.setGain(1, (1L << 32) + 1);
        processor.queueInput(floats(1, 1));
        float[] output = values(processor.getOutput());

        assertEquals(0, output[0], 0.0f);
        assertTrue(output[1] > 0 && output[1] < 0.000001f);
    }

    @Test
    public void pcm16AcceptsEveryPossibleSplitWithinStereoFrames() {
        assertEverySplit(PCM16, pcm16(1234, -2345, 30000, -30000, 100, -100),
                pcm16(617, -1172, 15000, -15000, 50, -50));
    }

    @Test
    public void floatAcceptsEveryPossibleSplitWithinStereoFrames() {
        assertEverySplit(FLOAT, floats(1, -1, 0.75f, -0.75f, 0.25f, -0.25f),
                floats(0.5f, -0.5f, 0.375f, -0.375f, 0.125f, -0.125f));
    }

    @Test
    public void oneByteChunksPreserveRampProgressAcrossSplitFloatSamples() {
        PcmGainProcessor processor = processor(2, FLOAT);
        processor.setGain(0, 0);
        processor.setGain(1, 2);
        ByteBuffer input = floats(1, -1, 1, -1, 1, -1);
        ByteBuffer collected = bytes(input.remaining());
        while (input.hasRemaining()) {
            ByteBuffer chunk = bytes(1);
            chunk.put(input.get()).flip();
            processor.queueInput(chunk);
            assertEquals(chunk.limit(), chunk.position());
            collected.put(processor.getOutput());
        }
        collected.flip();

        assertArrayEquals(new float[]{0, 0, 0.5f, -0.5f, 1, -1}, values(collected), EPSILON);
    }

    @Test
    public void incompleteFramesAndEmptyInputDoNotAdvanceTheEnvelope() {
        PcmGainProcessor processor = processor(2, PCM16);
        processor.setGain(0, 0);
        processor.setGain(1, 2);
        ByteBuffer input = pcm16(1000, -1000, 1000, -1000, 1000, -1000);
        ByteBuffer first = input.duplicate();
        first.limit(3);
        processor.queueInput(first);
        assertFalse(processor.getOutput().hasRemaining());
        processor.queueInput(bytes(0));
        input.position(3);
        processor.queueInput(input);

        assertArrayEquals(new short[]{0, 0, 500, -500, 1000, -1000}, shorts(processor.getOutput()));
    }

    @Test
    public void gainCommandDuringSplitFrameAppliesToTheWholeCompletedFrame() {
        PcmGainProcessor processor = processor(2, PCM16);
        ByteBuffer input = pcm16(1000, -1000);
        ByteBuffer first = input.duplicate();
        first.limit(3);
        processor.queueInput(first);
        processor.setGain(0.5f, 0);
        input.position(3);
        processor.queueInput(input);

        assertArrayEquals(new short[]{500, -500}, shorts(processor.getOutput()));
    }

    @Test
    public void nativePcmOrderIsIndependentOfCallerByteOrder() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.setGain(0.5f, 0);
        ByteBuffer input = pcm16(12000, -12000).order(oppositeOrder());
        processor.queueInput(input);
        assertEquals(oppositeOrder(), input.order());
        assertArrayEquals(new short[]{6000, -6000}, shorts(processor.getOutput()));

        assertTrue(processor.configure(48000, 1, FLOAT));
        input = floats(0.5f, -0.5f).order(oppositeOrder());
        processor.queueInput(input);
        assertArrayEquals(new float[]{0.25f, -0.25f}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void respectsInputPositionLimitAndReadOnlyDirectSlices() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.setGain(0.5f, 0);
        ByteBuffer storage = ByteBuffer.allocateDirect(12).order(ByteOrder.nativeOrder());
        storage.putShort((short) 999).putShort((short) 1000).putShort((short) -1000).putShort((short) 999);
        storage.position(2).limit(6);
        ByteBuffer input = storage.slice().asReadOnlyBuffer();
        int limit = input.limit();
        processor.queueInput(input);

        assertEquals(limit, input.position());
        assertEquals(limit, input.limit());
        assertEquals(2, storage.position());
        assertArrayEquals(new short[]{500, -500}, shorts(processor.getOutput()));
    }

    @Test
    public void outputIsDirectNativeAndIsReturnedOnlyOnce() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.queueInput(pcm16(123));
        ByteBuffer output = processor.getOutput();

        assertTrue(output.isDirect());
        assertEquals(ByteOrder.nativeOrder(), output.order());
        assertFalse(processor.getOutput().hasRemaining());
        assertEquals(123, output.getShort());
        assertFalse(processor.getOutput().hasRemaining());
    }

    @Test
    public void rejectsNewInputUntilReturnedOutputIsFullyConsumed() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.queueInput(pcm16(10, 20));
        ByteBuffer output = processor.getOutput();
        output.getShort();
        ByteBuffer next = pcm16(30);
        assertThrows(IllegalStateException.class, () -> processor.queueInput(next));
        assertEquals(0, next.position());
        output.getShort();
        processor.queueInput(next);
        assertArrayEquals(new short[]{30}, shorts(processor.getOutput()));
    }

    @Test
    public void rejectsNewInputWhenOutputHasNotBeenRetrieved() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.queueInput(pcm16(1));
        ByteBuffer next = pcm16(2);

        assertThrows(IllegalStateException.class, () -> processor.queueInput(next));
        assertEquals(0, next.position());
        assertArrayEquals(new short[]{1}, shorts(processor.getOutput()));
    }

    @Test
    public void reusesDirectStorageAcrossBuffersAndEmptyInput() {
        PcmGainProcessor processor = processor(1, PCM16);
        ByteBuffer largeCapacity = bytes(128);
        largeCapacity.putShort((short) 100).flip();
        processor.queueInput(largeCapacity);
        ByteBuffer original = processor.getOutput();
        assertEquals(128, original.capacity());
        shorts(original);
        processor.queueInput(bytes(0));
        assertFalse(processor.getOutput().hasRemaining());
        processor.setGain(0.5f, 0);
        processor.queueInput(pcm16(200, 400));
        ByteBuffer reused = processor.getOutput();

        assertSame(original, reused);
        assertArrayEquals(new short[]{100, 200}, shorts(reused));
    }

    @Test
    public void growsStorageOnceForLargerCapacityThenReusesIt() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.queueInput(pcm16(1));
        ByteBuffer small = processor.getOutput();
        shorts(small);
        processor.queueInput(pcm16(2, 3, 4, 5));
        ByteBuffer large = processor.getOutput();
        assertNotSame(small, large);
        shorts(large);
        processor.queueInput(pcm16(6, 7));

        assertSame(large, processor.getOutput());
    }

    @Test
    public void outputCapacityAccountsForPartialFramePlusFullInputCapacity() {
        PcmGainProcessor processor = processor(2, PCM16);
        ByteBuffer input = pcm16(100, 200, 300, 400);
        ByteBuffer first = input.duplicate();
        first.limit(3);
        processor.queueInput(first);
        ByteBuffer next = bytes(5);
        input.position(3);
        next.put(input).flip();
        processor.queueInput(next);

        assertArrayEquals(new short[]{100, 200, 300, 400}, shorts(processor.getOutput()));
    }

    @Test
    public void endOfStreamWaitsForOutstandingOutput() {
        PcmGainProcessor processor = processor(1, PCM16);
        assertFalse(processor.isEnded());
        processor.queueInput(pcm16(1, 2));
        processor.queueEndOfStream();
        assertFalse(processor.isEnded());
        ByteBuffer output = processor.getOutput();
        output.getShort();
        assertFalse(processor.isEnded());
        output.getShort();

        assertTrue(processor.isEnded());
        assertFalse(processor.getOutput().hasRemaining());
    }

    @Test
    public void endOfStreamDiscardsIncompleteFrameWithoutInventingSamples() {
        PcmGainProcessor processor = processor(2, PCM16);
        processor.queueInput(flipped(bytes(3).put(new byte[]{1, 2, 3})));
        processor.queueEndOfStream();
        processor.queueEndOfStream();

        assertTrue(processor.isEnded());
        assertFalse(processor.getOutput().hasRemaining());
        assertThrows(IllegalStateException.class, () -> processor.queueInput(pcm16(1, 2)));
    }

    @Test
    public void flushDiscardsPartialAndOutstandingPcmAndClearsEos() {
        PcmGainProcessor processor = processor(2, PCM16);
        ByteBuffer input = bytes(7);
        input.putShort((short) 10).putShort((short) 20).put(new byte[]{1, 2, 3}).flip();
        processor.queueInput(input);
        processor.queueEndOfStream();
        processor.flush();
        assertFalse(processor.isEnded());
        assertFalse(processor.getOutput().hasRemaining());
        processor.queueInput(pcm16(30, 40));

        assertArrayEquals(new short[]{30, 40}, shorts(processor.getOutput()));
    }

    @Test
    public void flushPreservesRampProgressAndReusableStorage() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0, 0);
        processor.setGain(1, 4);
        processor.queueInput(floats(1, 1));
        ByteBuffer output = processor.getOutput();
        assertArrayEquals(new float[]{0, 0.25f}, values(output), EPSILON);
        processor.flush();
        processor.queueInput(floats(1, 1));
        assertSame(output, processor.getOutput());
        assertArrayEquals(new float[]{0.5f, 0.75f}, values(output), EPSILON);
    }

    @Test
    public void flushPreservesPublishedIncomingAnchorAndRamp() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0, 0);
        processor.setGain(1, 1);
        processor.flush();
        processor.queueInput(floats(1, 1));

        assertArrayEquals(new float[]{0, 1}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void identicalConfigurePreservesPartialFrameAndOutstandingOutput() {
        PcmGainProcessor processor = processor(2, PCM16);
        ByteBuffer input = bytes(7);
        input.putShort((short) 10).putShort((short) 20).put(new byte[]{1, 2, 3}).flip();
        processor.queueInput(input);
        assertTrue(processor.configure(48000, 2, PCM16));
        assertArrayEquals(new short[]{10, 20}, shorts(processor.getOutput()));
        processor.queueInput(flipped(bytes(1).put((byte) 4)));
        ByteBuffer expected = flipped(bytes(4).put(new byte[]{1, 2, 3, 4}));

        assertArrayEquals(shorts(expected), shorts(processor.getOutput()));
    }

    @Test
    public void formatChangeDiscardsOldBytesAndKeepsGainEnvelope() {
        PcmGainProcessor processor = processor(2, PCM16);
        processor.setGain(0.5f, 0);
        processor.queueInput(flipped(bytes(3).put(new byte[]{1, 2, 3})));
        assertTrue(processor.configure(44100, 1, FLOAT));
        processor.queueInput(floats(1, -1));

        assertArrayEquals(new float[]{0.5f, -0.5f}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void sampleRateChangeDiscardsOutputAndPartialBytes() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.queueInput(flipped(bytes(3).putShort((short) 10).put((byte) 99)));
        assertTrue(processor.configure(44100, 1, PCM16));
        assertFalse(processor.getOutput().hasRemaining());
        processor.queueInput(pcm16(20));

        assertArrayEquals(new short[]{20}, shorts(processor.getOutput()));
    }

    @Test
    public void channelChangeReframesOnlyNewInputAndPreservesRamp() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0, 0);
        processor.setGain(1, 2);
        processor.queueInput(floats(1));
        assertArrayEquals(new float[]{0}, values(processor.getOutput()), EPSILON);
        assertTrue(processor.configure(48000, 2, FLOAT));
        processor.queueInput(floats(1, -1, 1, -1));

        assertArrayEquals(new float[]{0.5f, -0.5f, 1, -1}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void unsupportedAndInvalidFormatsLeaveProcessorUnconfigured() {
        PcmGainProcessor processor = processor(1, PCM16);
        assertFalse(processor.configure(48000, 1, 5));
        assertThrows(IllegalStateException.class, () -> processor.queueInput(pcm16(1)));
        assertFalse(processor.configure(0, 1, PCM16));
        assertFalse(processor.configure(-1, 1, FLOAT));
        assertFalse(processor.configure(48000, 0, PCM16));
        assertFalse(processor.configure(48000, -1, FLOAT));
        assertFalse(processor.configure(48000, Integer.MAX_VALUE, FLOAT));
        assertTrue(processor.configure(48000, 1, PCM16));
        processor.queueInput(pcm16(123));

        assertArrayEquals(new short[]{123}, shorts(processor.getOutput()));
    }

    @Test
    public void resetClearsConfigurationCommandsEosAndGain() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.setGain(0.25f, 0);
        processor.queueInput(pcm16(1000));
        processor.setGain(0, 0);
        processor.setGain(1, 4);
        processor.queueEndOfStream();
        processor.reset();
        assertFalse(processor.isEnded());
        assertFalse(processor.getOutput().hasRemaining());
        assertThrows(IllegalStateException.class, () -> processor.queueInput(pcm16(1000)));
        assertTrue(processor.configure(48000, 1, PCM16));
        processor.queueInput(pcm16(1000, -1000));

        assertArrayEquals(new short[]{1000, -1000}, shorts(processor.getOutput()));
    }

    @Test
    public void rejectsInvalidGainCommandsWithoutOverwritingPublishedCommand() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0.5f, 0);
        assertThrows(IllegalArgumentException.class, () -> processor.setGain(Float.NaN, 0));
        assertThrows(IllegalArgumentException.class, () -> processor.setGain(Float.POSITIVE_INFINITY, 0));
        assertThrows(IllegalArgumentException.class, () -> processor.setGain(Float.NEGATIVE_INFINITY, 0));
        assertThrows(IllegalArgumentException.class, () -> processor.setGain(-0.1f, 0));
        assertThrows(IllegalArgumentException.class, () -> processor.setGain(1, -1));
        processor.queueInput(floats(1));

        assertArrayEquals(new float[]{0.5f}, values(processor.getOutput()), EPSILON);
    }

    @Test(timeout = 10000)
    public void appThreadPublishesInitialAnchorAndLaterRampToAudioThread() throws Exception {
        PcmGainProcessor processor = processor(2, FLOAT);
        CountDownLatch initialPublished = new CountDownLatch(1);
        CountDownLatch firstDrained = new CountDownLatch(1);
        CountDownLatch rampPublished = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread audio = new Thread(() -> {
            try {
                initialPublished.await();
                processor.queueInput(floats(1, -1));
                assertArrayEquals(new float[]{0, 0}, values(processor.getOutput()), EPSILON);
                firstDrained.countDown();
                rampPublished.await();
                processor.queueInput(floats(1, -1, 1, -1, 1, -1));
                assertArrayEquals(new float[]{0, 0, 0.5f, -0.5f, 1, -1},
                        values(processor.getOutput()), EPSILON);
            } catch (Throwable error) {
                failure.set(error);
                firstDrained.countDown();
            }
        }, "pcm-audio-test");
        audio.setDaemon(true);
        audio.start();
        processor.setGain(0, 0);
        initialPublished.countDown();
        try {
            firstDrained.await();
            processor.setGain(1, 2);
        } finally {
            rampPublished.countDown();
        }
        audio.join();
        if (failure.get() != null) {
            throw new AssertionError("Audio thread failed", failure.get());
        }
    }

    @Test(timeout = 10000)
    public void concurrentCommandsNeverSplitAFrameAcrossChannels() throws Exception {
        PcmGainProcessor processor = processor(2, FLOAT);
        CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread app = new Thread(() -> {
            try {
                start.await();
                for (int command = 0; command < 2000; command++) {
                    processor.setGain((command & 1) == 0 ? 0 : 1, command % 5);
                }
            } catch (Throwable error) {
                failure.set(error);
            }
        }, "pcm-command-test");
        app.setDaemon(true);
        app.start();
        ByteBuffer input = floats(1, 1, 1, 1, 1, 1, 1, 1);
        start.countDown();
        for (int buffer = 0; buffer < 2000; buffer++) {
            input.rewind();
            processor.queueInput(input);
            ByteBuffer output = processor.getOutput();
            while (output.hasRemaining()) {
                float left = output.getFloat();
                float right = output.getFloat();
                assertEquals(left, right, 0.0f);
                assertTrue(Float.isFinite(left));
                assertTrue(left >= 0 && left <= 1);
            }
        }
        app.join();
        if (failure.get() != null) {
            throw new AssertionError("Command thread failed", failure.get());
        }
    }

    private static void assertEverySplit(int encoding, ByteBuffer source, ByteBuffer expected) {
        byte[] expectedBytes = new byte[expected.remaining()];
        expected.get(expectedBytes);
        for (int split = 0; split <= source.limit(); split++) {
            PcmGainProcessor processor = processor(2, encoding);
            processor.setGain(0.5f, 0);
            ByteBuffer collected = bytes(source.limit());
            ByteBuffer first = source.duplicate();
            first.limit(split);
            processor.queueInput(first);
            assertEquals(split, first.position());
            collected.put(processor.getOutput());
            assertFalse(processor.getOutput().hasRemaining());
            ByteBuffer second = source.duplicate();
            second.position(split);
            processor.queueInput(second);
            assertEquals(second.limit(), second.position());
            collected.put(processor.getOutput());
            collected.flip();
            byte[] actual = new byte[collected.remaining()];
            collected.get(actual);
            assertArrayEquals("Split at byte " + split, expectedBytes, actual);
        }
    }

    @Test
    public void telemetryReportsActualFirstFrameAndFirstNonzeroFrameNotTarget() {
        PcmGainProcessor processor = processor(2, FLOAT);
        processor.setGain(0, 0);
        processor.setGain(1, 4);
        processor.queueInput(floats(1, -1, 0, 0, 1, -1, 1, -1));

        assertEquals(0, processor.firstFrameGain(), 0.0f);
        assertEquals(0.5f, processor.firstNonzeroOutputGain(), 0.0f);
        assertTrue(processor.hasNonzeroOutput());
        processor.setGain(0.125f, 0);
        processor.getOutput();
        assertEquals(0, processor.firstFrameGain(), 0.0f);
        assertEquals(0.5f, processor.firstNonzeroOutputGain(), 0.0f);
    }

    @Test
    public void telemetryUsesQuantizedPcm16OutputRatherThanNonzeroInput() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.setGain(0, 0);
        processor.setGain(1, 4);
        processor.queueInput(pcm16(1, 1, 1));

        assertEquals(0, processor.firstFrameGain(), 0.0f);
        assertEquals(0.5f, processor.firstNonzeroOutputGain(), 0.0f);
        assertArrayEquals(new short[]{0, 0, 1}, shorts(processor.getOutput()));
    }

    @Test
    public void telemetryDoesNotMistakeUnderflowedFloatForNonzeroOutput() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0.25f, 0);
        processor.queueInput(floats(Float.MIN_VALUE));

        assertEquals(0.25f, processor.firstFrameGain(), 0.0f);
        assertFalse(processor.hasNonzeroOutput());
        assertTrue(Float.isNaN(processor.firstNonzeroOutputGain()));
        assertArrayEquals(new float[]{0}, values(processor.getOutput()), 0.0f);
    }

    @Test
    public void telemetryIsAbsentUntilACompleteFrameAndResetsForEveryQueue() {
        PcmGainProcessor processor = processor(2, PCM16);
        assertTrue(Float.isNaN(processor.firstFrameGain()));
        assertTrue(Float.isNaN(processor.firstNonzeroOutputGain()));
        processor.queueInput(pcm16(100, 200));
        shorts(processor.getOutput());
        assertTrue(processor.hasNonzeroOutput());
        processor.queueInput(flipped(bytes(3).put(new byte[]{1, 2, 3})));
        assertTrue(Float.isNaN(processor.firstFrameGain()));
        assertTrue(Float.isNaN(processor.firstNonzeroOutputGain()));
        assertFalse(processor.hasNonzeroOutput());
        processor.queueInput(bytes(0));
        assertTrue(Float.isNaN(processor.firstFrameGain()));
        assertFalse(processor.hasNonzeroOutput());
    }

    @Test
    public void telemetryIncludesFramesAssembledFromPreviousPartialInput() {
        PcmGainProcessor processor = processor(2, PCM16);
        processor.setGain(0, 0);
        processor.setGain(1, 2);
        ByteBuffer source = pcm16(1000, -1000, 1000, -1000);
        ByteBuffer first = source.duplicate();
        first.limit(3);
        processor.queueInput(first);
        assertTrue(Float.isNaN(processor.firstFrameGain()));
        source.position(3);
        processor.queueInput(source);

        assertEquals(0, processor.firstFrameGain(), 0.0f);
        assertEquals(0.5f, processor.firstNonzeroOutputGain(), 0.0f);
        assertArrayEquals(new short[]{0, 0, 500, -500}, shorts(processor.getOutput()));
    }

    @Test
    public void unityTelemetryRecognizesSilentFloatSignBitsRegardlessOfByteOrder() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.queueInput(floats(0.0f, -0.0f).order(oppositeOrder()));
        assertEquals(1, processor.firstFrameGain(), 0.0f);
        assertFalse(processor.hasNonzeroOutput());
        values(processor.getOutput());
        processor.queueInput(floats(0.0f, Float.MIN_VALUE).order(oppositeOrder()));

        assertTrue(processor.hasNonzeroOutput());
        assertEquals(1, processor.firstNonzeroOutputGain(), 0.0f);
        assertArrayEquals(new float[]{0, Float.MIN_VALUE}, values(processor.getOutput()), 0.0f);
    }

    @Test
    public void unityTelemetryRecognizesSilentAndNonzeroPcm16Frames() {
        PcmGainProcessor processor = processor(2, PCM16);
        processor.queueInput(pcm16(0, 0, 0, 0).order(oppositeOrder()));
        assertEquals(1, processor.firstFrameGain(), 0.0f);
        assertFalse(processor.hasNonzeroOutput());
        shorts(processor.getOutput());
        processor.queueInput(pcm16(0, 0, 0, -1).order(oppositeOrder()));

        assertEquals(1, processor.firstNonzeroOutputGain(), 0.0f);
        assertTrue(processor.hasNonzeroOutput());
        assertArrayEquals(new short[]{0, 0, 0, -1}, shorts(processor.getOutput()));
    }

    @Test
    public void telemetryHasNoNonzeroFrameWhenGainIsZero() {
        PcmGainProcessor processor = processor(2, PCM16);
        processor.setGain(0, 0);
        processor.queueInput(pcm16(32767, -32768));

        assertEquals(0, processor.firstFrameGain(), 0.0f);
        assertTrue(Float.isNaN(processor.firstNonzeroOutputGain()));
        assertFalse(processor.hasNonzeroOutput());
    }

    @Test
    public void flushAndResetClearTelemetryButEosDoesNotRewriteLastQueue() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.queueInput(floats(1));
        processor.queueEndOfStream();
        assertEquals(1, processor.firstFrameGain(), 0.0f);
        assertTrue(processor.hasNonzeroOutput());
        processor.flush();
        assertTrue(Float.isNaN(processor.firstFrameGain()));
        assertFalse(processor.hasNonzeroOutput());
        processor.queueInput(floats(1));
        processor.reset();

        assertTrue(Float.isNaN(processor.firstFrameGain()));
        assertTrue(Float.isNaN(processor.firstNonzeroOutputGain()));
        assertFalse(processor.hasNonzeroOutput());
    }

    @Test
    public void bridgeCanHoldOutputUntilNativeConsumerDrainsIt() {
        PcmGainProcessor processor = processor(1, PCM16);
        processor.queueInput(pcm16(10, 20));
        ByteBuffer bridgeOutput = processor.getOutput();
        assertFalse(processor.getOutput().hasRemaining());
        ByteBuffer nativeOutput = bridgeOutput;
        ByteBuffer next = pcm16(30);
        assertThrows(IllegalStateException.class, () -> processor.queueInput(next));
        assertArrayEquals(new short[]{10, 20}, shorts(nativeOutput));
        processor.queueInput(next);

        assertArrayEquals(new short[]{30}, shorts(processor.getOutput()));
    }

    @Test
    public void completeEnvelopeKeepsInitialZeroAndUsesOutputFrameTime() {
        PcmGainProcessor processor = new PcmGainProcessor();
        processor.configure(4, 2, FLOAT);
        processor.setGain(0, 0);
        processor.setEnvelope(1, 1000, 0);
        processor.queueInput(floats(1, 1, 1, 1, 1, 1, 1, 1));

        float first = (float) Math.sin(Math.PI / 8);
        float second = (float) Math.sin(Math.PI / 4);
        float third = (float) Math.sin(3 * Math.PI / 8);
        assertArrayEquals(new float[]{0, 0, first, first, second, second, third, third},
                values(processor.getOutput()), EPSILON);
        assertEquals(1, processor.gain(), EPSILON);
    }

    @Test
    public void envelopePreservesProgressAcrossFlushRateChangePauseAndReplacement() {
        PcmGainProcessor processor = new PcmGainProcessor();
        processor.configure(4, 1, FLOAT);
        processor.setGain(0, 0);
        processor.setEnvelope(1, 1000, 3);
        processor.queueInput(floats(1, 1));
        values(processor.getOutput());
        assertEquals(0.5f, processor.gain(), EPSILON);

        processor.flush();
        processor.configure(8, 1, FLOAT);
        processor.pause(true);
        processor.queueInput(floats(1, 1));
        assertArrayEquals(new float[]{0.5f, 0.5f}, values(processor.getOutput()), EPSILON);
        assertEquals(0.5f, processor.gain(), EPSILON);

        processor.pause(false);
        processor.queueInput(floats(1, 1, 1, 1));
        values(processor.getOutput());
        assertEquals(1, processor.gain(), EPSILON);

        processor.setEnvelope(0, 1000, 2);
        processor.queueInput(floats(1, 1, 1, 1));
        values(processor.getOutput());
        assertEquals(0.25f, processor.gain(), EPSILON);
        processor.setEnvelope(1, 1000, 0);
        processor.queueInput(floats(1));
        assertArrayEquals(new float[]{0.25f}, values(processor.getOutput()), EPSILON);
    }

    @Test
    public void outgoingCurveOrdinalsMatchManagerAndReachExactZero() {
        float[] halfway = {(float) Math.cos(Math.PI / 4), 0.875f, 0.25f, 0.5f};
        for (int curve = 0; curve < halfway.length; curve++) {
            PcmGainProcessor processor = new PcmGainProcessor();
            processor.configure(4, 1, FLOAT);
            processor.setEnvelope(0, 1000, curve);
            processor.queueInput(floats(1, 1));
            values(processor.getOutput());
            assertEquals(halfway[curve], processor.gain(), EPSILON);

            processor.queueInput(floats(1, 1));
            values(processor.getOutput());
            assertEquals(0, processor.gain(), 0);
            processor.queueInput(floats(1));
            assertArrayEquals(new float[]{0}, values(processor.getOutput()), 0);
        }
    }

    @Test
    public void audibleFrameBoundaryExcludesSilentEnvelopeSuffixInBothEncodings() {
        for (int encoding : new int[]{PCM16, FLOAT}) {
            PcmGainProcessor processor = new PcmGainProcessor();
            assertTrue(processor.configure(4, 2, encoding));
            processor.setEnvelope(0, 1000, 3);
            processor.queueInput(encoding == FLOAT
                    ? floats(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
                    : pcm16(100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100));
            assertEquals(4, processor.lastAudibleFrame());
            assertEquals(0, processor.gain(), EPSILON);
            processor.flush();
            assertEquals(0, processor.lastAudibleFrame());
        }
    }

    @Test
    public void audibleFrameBoundaryIncludesSilentSourceSamplesWithPositiveGain() {
        PcmGainProcessor processor = processor(2, FLOAT);
        processor.queueInput(floats(0, 0, 0, 0, 0, 0));
        assertEquals(3, processor.lastAudibleFrame());
        assertFalse(processor.hasNonzeroOutput());
        values(processor.getOutput());
        processor.setGain(0, 0);
        processor.queueInput(floats(1, 1, 1, 1));
        assertEquals(0, processor.lastAudibleFrame());
    }

    @Test
    public void splitFrameFollowedByUnityFastPathKeepsOutputRelativeBoundary() {
        PcmGainProcessor processor = processor(1, FLOAT);
        processor.setGain(0, 0);
        processor.setGain(1, 1);
        ByteBuffer remaining = floats(1, 1);
        processor.queueInput(flipped(bytes(1).put(remaining.get())));
        assertEquals(0, processor.lastAudibleFrame());
        processor.getOutput();
        processor.queueInput(remaining);
        assertArrayEquals(new float[]{0, 1}, values(processor.getOutput()), EPSILON);
        assertEquals(2, processor.lastAudibleFrame());
    }

    private static PcmGainProcessor processor(int channels, int encoding) {
        PcmGainProcessor processor = new PcmGainProcessor();
        assertTrue(processor.configure(48000, channels, encoding));
        return processor;
    }

    private static ByteBuffer bytes(int capacity) {
        return ByteBuffer.allocate(capacity).order(ByteOrder.nativeOrder());
    }

    private static ByteBuffer flipped(ByteBuffer buffer) {
        buffer.flip();
        return buffer;
    }

    private static ByteBuffer pcm16(short... samples) {
        ByteBuffer buffer = bytes(samples.length * 2);
        for (short sample : samples) {
            buffer.putShort(sample);
        }
        return flipped(buffer);
    }

    private static ByteBuffer pcm16(int... samples) {
        ByteBuffer buffer = bytes(samples.length * 2);
        for (int sample : samples) {
            buffer.putShort((short) sample);
        }
        return flipped(buffer);
    }

    private static ByteBuffer floats(float... samples) {
        ByteBuffer buffer = bytes(samples.length * 4);
        for (float sample : samples) {
            buffer.putFloat(sample);
        }
        return flipped(buffer);
    }

    private static short[] shorts(ByteBuffer buffer) {
        short[] samples = new short[buffer.remaining() / 2];
        for (int index = 0; index < samples.length; index++) {
            samples[index] = buffer.getShort();
        }
        return samples;
    }

    private static float[] values(ByteBuffer buffer) {
        float[] samples = new float[buffer.remaining() / 4];
        for (int index = 0; index < samples.length; index++) {
            samples[index] = buffer.getFloat();
        }
        return samples;
    }

    private static ByteOrder oppositeOrder() {
        return ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN ? ByteOrder.BIG_ENDIAN : ByteOrder.LITTLE_ENDIAN;
    }
}
