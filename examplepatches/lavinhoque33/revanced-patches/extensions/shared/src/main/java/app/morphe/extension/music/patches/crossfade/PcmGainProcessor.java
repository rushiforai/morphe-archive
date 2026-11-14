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

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/**
 * Frame-based PCM gain independent of platform players and their normalization volume.
 *
 * <p>Gain/envelope commands and pause may be published from another thread. Processing and format
 * changes belong to one audio thread. Commands apply at the next input buffer, never halfway
 * through a frame. PCM bytes use native byte order, regardless of the input buffer's order.
 */
public final class PcmGainProcessor {
    public static final int ENCODING_PCM_16BIT = 2;
    public static final int ENCODING_PCM_FLOAT = 4;

    private static final ByteBuffer EMPTY_BUFFER = ByteBuffer.allocateDirect(0).order(ByteOrder.nativeOrder());
    private static final boolean LITTLE_ENDIAN = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN;

    private int sampleRate;
    private int channels;
    private int encoding;
    private int frameBytes;
    private ByteBuffer partialFrame;
    private ByteBuffer outputBuffer = EMPTY_BUFFER;
    private boolean outputReady;
    private boolean inputEnded;
    private float firstFrameGain = Float.NaN;
    private float firstNonzeroOutputGain = Float.NaN;
    private int lastAudibleFrame;

    private double currentGain = 1.0;
    private double targetGain = 1.0;
    private double startGain = 1.0;
    private double rampSeconds;
    private double elapsedSeconds;
    private int curveOrdinal = -1;
    private volatile boolean paused;

    // Protected by this monitor; publication never allocates a command object on the audio thread.
    private boolean commandPending;
    private float commandGain;
    private long commandRampFrames;
    private long commandDurationMilliseconds;
    private int commandCurve = -1;
    private boolean anchorPending;
    private float anchorGain;

    /**
     * Returns false for unsupported encodings or invalid formats, leaving the processor unconfigured.
     * A changed format discards pending PCM but retains the gain envelope. An identical format is a no-op.
     */
    public boolean configure(int sampleRate, int channels, int encoding) {
        int sampleBytes = encoding == ENCODING_PCM_16BIT ? 2 : encoding == ENCODING_PCM_FLOAT ? 4 : 0;
        if (sampleRate <= 0 || channels <= 0 || sampleBytes == 0 || channels > Integer.MAX_VALUE / sampleBytes) {
            clearFormat();
            return false;
        }
        if (this.sampleRate == sampleRate && this.channels == channels && this.encoding == encoding) {
            return true;
        }

        // Envelope time is output time, after native speed processing. Keep elapsed progress
        // when the output sample rate changes; only future frame durations use the new rate.
        this.sampleRate = sampleRate;
        this.channels = channels;
        this.encoding = encoding;
        frameBytes = channels * sampleBytes;
        partialFrame = ByteBuffer.allocate(frameBytes).order(ByteOrder.nativeOrder());
        flush();
        return true;
    }

    /**
     * Publishes a finite, nonnegative gain. PCM16 amplification saturates; float PCM is not clipped.
     *
     * <p>A ramp uses the current gain for its first frame and reaches the target after {@code rampFrames}
     * frames. Every channel in a frame uses the same gain. Zero frames sets an immediate anchor, which
     * is retained even when another ramp is published before the next input. Thus an incoming player
     * initialized with {@code setGain(0, 0)} cannot lose its first silent frame to an early fade command.
     */
    public synchronized void setGain(float gain, long rampFrames) {
        if (Float.isNaN(gain) || Float.isInfinite(gain) || gain < 0.0f || rampFrames < 0) {
            throw new IllegalArgumentException("Gain must be finite and nonnegative; ramp frames must be nonnegative");
        }

        if (rampFrames == 0) {
            anchorPending = true;
            anchorGain = gain;
        }
        commandGain = gain;
        commandRampFrames = rampFrames;
        commandCurve = -1;
        commandPending = true;
    }

    /** Publishes a complete output-time envelope. Curve ordinals match CrossfadeManager.FadeCurve. */
    public synchronized void setEnvelope(float gain, long durationMilliseconds, int curveOrdinal) {
        if (!Float.isFinite(gain) || gain < 0 || durationMilliseconds < 0
                || curveOrdinal < 0 || curveOrdinal > 3) {
            throw new IllegalArgumentException("Invalid PCM envelope");
        }
        boolean hadAnchor = anchorPending;
        float previousAnchor = anchorGain;
        setGain(gain, 0);
        // Preserve the initial zero even if an envelope is published before the first PCM.
        anchorPending = durationMilliseconds == 0 || hadAnchor;
        if (hadAnchor && durationMilliseconds != 0) anchorGain = previousAnchor;
        commandDurationMilliseconds = durationMilliseconds;
        commandCurve = curveOrdinal;
    }

    public void pause(boolean paused) {
        this.paused = paused;
    }

    public synchronized float gain() {
        return anchorPending ? anchorGain : (float) currentGain;
    }

    /**
     * Consumes every input byte once, retaining incomplete frames until more bytes arrive.
     * The previously returned output must be drained first. Storage grows only when input capacity
     * exceeds the reusable output's capacity, including space for an existing partial frame.
     */
    public void queueInput(ByteBuffer input) {
        if (frameBytes == 0) {
            throw new IllegalStateException("A supported PCM format must be configured first");
        }
        if (inputEnded) {
            throw new IllegalStateException("Input has ended; flush before queuing more PCM");
        }
        if (outputBuffer.hasRemaining()) {
            throw new IllegalStateException("Previous output has not been drained");
        }

        clearTelemetry();
        applyGainCommand();
        if (!input.hasRemaining()) {
            return;
        }
        ensureOutputCapacity(input.capacity());
        outputBuffer.clear();

        if (partialFrame.position() != 0) {
            while (input.hasRemaining() && partialFrame.hasRemaining()) {
                partialFrame.put(input.get());
            }
            if (!partialFrame.hasRemaining()) {
                partialFrame.flip();
                processFrames(partialFrame, 1);
                partialFrame.clear();
            }
        }

        processFrames(input, input.remaining() / frameBytes);
        partialFrame.put(input);
        outputBuffer.flip();
        outputReady = outputBuffer.hasRemaining();
    }

    /** Returns each output buffer once; its storage remains owned by the processor. */
    public ByteBuffer getOutput() {
        if (!outputReady) {
            return EMPTY_BUFFER;
        }
        outputReady = false;
        return outputBuffer;
    }

    /** Ends input and discards a trailing incomplete frame, which cannot form playable PCM. */
    public void queueEndOfStream() {
        inputEnded = true;
        if (partialFrame != null) {
            partialFrame.clear();
        }
    }

    public boolean isEnded() {
        return inputEnded && !outputBuffer.hasRemaining();
    }

    /** Gain actually used by the last queue's first complete frame, or NaN if it produced no frames. */
    public float firstFrameGain() {
        return firstFrameGain;
    }

    /** One-based final positive-gain frame in the last output, or zero for entirely zero-gain PCM. */
    public int lastAudibleFrame() {
        return lastAudibleFrame;
    }

    /** Gain of the last queue's first frame containing a nonzero output sample, or NaN if absent. */
    public float firstNonzeroOutputGain() {
        return firstNonzeroOutputGain;
    }

    public boolean hasNonzeroOutput() {
        return !Float.isNaN(firstNonzeroOutputGain);
    }

    /** Discards buffered PCM and EOS, retaining the format, gain envelope, and unpublished commands. */
    public void flush() {
        if (partialFrame != null) {
            partialFrame.clear();
        }
        outputBuffer.clear();
        outputBuffer.limit(0);
        outputReady = false;
        inputEnded = false;
        clearTelemetry();
    }

    /** Releases format/storage and restores the initial unity gain. */
    public void reset() {
        clearFormat();
        outputBuffer = EMPTY_BUFFER;
        synchronized (this) {
            currentGain = 1.0;
            targetGain = 1.0;
            startGain = 1.0;
            rampSeconds = 0;
            elapsedSeconds = 0;
            curveOrdinal = -1;
            paused = false;
            commandPending = false;
            anchorPending = false;
        }
    }

    private void clearFormat() {
        flush();
        sampleRate = 0;
        channels = 0;
        encoding = 0;
        frameBytes = 0;
        partialFrame = null;
    }

    private synchronized void applyGainCommand() {
        if (!commandPending) {
            return;
        }
        if (anchorPending) {
            currentGain = anchorGain;
            anchorPending = false;
        }
        targetGain = commandGain;
        startGain = currentGain;
        rampSeconds = commandCurve < 0
                ? sampleRate == 0 ? 0 : (double) commandRampFrames / sampleRate
                : commandDurationMilliseconds / 1000.0;
        elapsedSeconds = 0;
        curveOrdinal = commandCurve;
        if (rampSeconds == 0) currentGain = targetGain;
        commandPending = false;
    }

    private void ensureOutputCapacity(int inputCapacity) {
        long needed = ((long) inputCapacity + frameBytes - 1) / frameBytes * frameBytes;
        if (needed > Integer.MAX_VALUE) {
            throw new IllegalArgumentException("PCM buffer capacity exceeds supported output size");
        }
        if (outputBuffer.capacity() < needed) {
            outputBuffer = ByteBuffer.allocateDirect((int) needed).order(ByteOrder.nativeOrder());
        }
    }

    private void clearTelemetry() {
        firstFrameGain = Float.NaN;
        firstNonzeroOutputGain = Float.NaN;
        lastAudibleFrame = 0;
    }

    private void processFrames(ByteBuffer input, int frames) {
        if (frames == 0) {
            return;
        }
        if (Float.isNaN(firstFrameGain)) {
            firstFrameGain = (float) currentGain;
        }
        if (currentGain == 1.0 && rampSeconds == 0) {
            recordUnityOutput(input, frames);
            lastAudibleFrame = outputBuffer.position() / frameBytes + frames;
            int oldLimit = input.limit();
            input.limit(input.position() + frames * frameBytes);
            outputBuffer.put(input);
            input.limit(oldLimit);
            return;
        }

        int firstOutputFrame = outputBuffer.position() / frameBytes;
        for (int frame = 0; frame < frames; frame++) {
            if (currentGain > 0) lastAudibleFrame = firstOutputFrame + frame + 1;
            double gain = currentGain;
            for (int channel = 0; channel < channels; channel++) {
                if (encoding == ENCODING_PCM_16BIT) {
                    double scaled = readShort(input) * gain;
                    long sample = Math.round(scaled);
                    short output = (short) Math.max(Short.MIN_VALUE, Math.min(Short.MAX_VALUE, sample));
                    outputBuffer.putShort(output);
                    if (output != 0 && Float.isNaN(firstNonzeroOutputGain)) {
                        firstNonzeroOutputGain = (float) gain;
                    }
                } else {
                    float sample = Float.intBitsToFloat(readInt(input));
                    float output = gain == 0.0 ? 0.0f : (float) (sample * gain);
                    outputBuffer.putFloat(output);
                    if (output != 0.0f && Float.isNaN(firstNonzeroOutputGain)) {
                        firstNonzeroOutputGain = (float) gain;
                    }
                }
            }
            advanceEnvelope();
        }
    }

    private void advanceEnvelope() {
        if (paused || rampSeconds == 0) return;

        double frameSeconds = 1.0 / sampleRate;
        elapsedSeconds += frameSeconds;
        if (elapsedSeconds + frameSeconds * 0.5 >= rampSeconds) elapsedSeconds = rampSeconds;
        double progress = elapsedSeconds / rampSeconds;
        if (progress >= 1.0) {
            currentGain = targetGain;
            rampSeconds = 0;
            return;
        }
        double shaped;
        if (targetGain >= startGain) {
            shaped = curveOrdinal == 3 ? progress * progress * (3 - 2 * progress)
                    : curveOrdinal < 0 ? progress : Math.sin(progress * Math.PI / 2);
        } else {
            switch (curveOrdinal) {
                case 0: shaped = 1 - Math.cos(progress * Math.PI / 2); break;
                case 1: shaped = progress * progress * progress; break;
                case 2: shaped = 1 - (1 - progress) * (1 - progress); break;
                case 3: shaped = progress * progress * (3 - 2 * progress); break;
                default: shaped = progress; break;
            }
        }
        currentGain = startGain + (targetGain - startGain) * shaped;
    }

    private void recordUnityOutput(ByteBuffer input, int frames) {
        if (hasNonzeroOutput()) {
            return;
        }
        int end = input.position() + frames * frameBytes;
        int sampleBytes = encoding == ENCODING_PCM_16BIT ? 2 : 4;
        boolean reverse = input.order() != ByteOrder.nativeOrder();
        for (int index = input.position(); index < end; index += sampleBytes) {
            boolean nonzero;
            if (encoding == ENCODING_PCM_16BIT) {
                nonzero = input.getShort(index) != 0;
            } else {
                int bits = input.getInt(index);
                if (reverse) {
                    bits = Integer.reverseBytes(bits);
                }
                nonzero = (bits & 0x7FFFFFFF) != 0;
            }
            if (nonzero) {
                firstNonzeroOutputGain = 1.0f;
                return;
            }
        }
    }

    private static short readShort(ByteBuffer input) {
        // Typed reads respect a caller's byte order, which is unrelated to PCM's native order.
        int first = input.get() & 0xFF;
        int second = input.get() & 0xFF;
        return (short) (LITTLE_ENDIAN
                ? first | second << 8 : first << 8 | second);
    }

    private static int readInt(ByteBuffer input) {
        int first = input.get() & 0xFF;
        int second = input.get() & 0xFF;
        int third = input.get() & 0xFF;
        int fourth = input.get() & 0xFF;
        return LITTLE_ENDIAN
                ? first | second << 8 | third << 16 | fourth << 24
                : first << 24 | second << 16 | third << 8 | fourth;
    }
}
