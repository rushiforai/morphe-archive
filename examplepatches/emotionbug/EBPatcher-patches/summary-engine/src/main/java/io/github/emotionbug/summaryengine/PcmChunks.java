package io.github.emotionbug.summaryengine;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/** One bounded mono WAV per input channel; never downmix or infer speaker identities. */
final class PcmChunks implements AutoCloseable {
    interface Consumer { void accept(File wav, long index, int channel, int channels) throws Exception; }
    interface Cancellation { void check(); }
    static final int RATE = 16000;
    // One full Whisper audio window; no overlapping text or cross-channel decoder context.
    static final int CHUNK_SECONDS = 30;
    private final Sink[] sinks;
    private final int sourceRate;
    private final double[] sums, samples;
    private final Cancellation cancelled;
    private int filled;
    private boolean finished;

    PcmChunks(File directory, int sourceRate, int channels, Cancellation cancelled, Consumer consumer) throws IOException {
        if (sourceRate < 8000 || sourceRate > 192000 || channels < 1 || channels > 8)
            throw new IOException("Unsupported decoded sample rate/channel count: " + sourceRate + "/" + channels);
        this.sourceRate = sourceRate;
        this.cancelled = cancelled;
        sinks = new Sink[channels];
        sums = new double[channels];
        samples = new double[channels];
        try {
            for (int channel = 0; channel < channels; channel++)
                sinks[channel] = new Sink(directory, channel, consumer);
        } catch (IOException failure) {
            try { close(); } catch (IOException cleanup) { failure.addSuppressed(cleanup); }
            throw failure;
        }
    }

    void add(ByteBuffer pcm, boolean floating) throws Exception {
        if (finished) throw new IllegalStateException("PCM stream is already finished");
        int bytes = floating ? 4 : 2;
        if (pcm.remaining() % (bytes * sinks.length) != 0)
            throw new IOException("Decoder returned an incomplete PCM frame");
        pcm.order(ByteOrder.LITTLE_ENDIAN);
        int frames = 0;
        while (pcm.hasRemaining()) {
            if ((frames++ & 1023) == 0) cancelled.check();
            for (int channel = 0; channel < sinks.length; channel++) {
                double sample = floating ? pcm.getFloat() : pcm.getShort() / 32768.0;
                if (Double.isNaN(sample) || Double.isInfinite(sample)) throw new IOException("Invalid decoded PCM sample");
                samples[channel] = sample;
            }
            int remaining = RATE;
            // Each channel uses exactly the same resampling clock and chunk boundaries.
            while (remaining > 0) {
                int weight = Math.min(remaining, sourceRate - filled);
                for (int channel = 0; channel < sinks.length; channel++) sums[channel] += samples[channel] * weight;
                filled += weight;
                remaining -= weight;
                if (filled == sourceRate) emitSample();
            }
        }
    }

    private void emitSample() throws Exception {
        for (int channel = 0; channel < sinks.length; channel++) {
            sinks[channel].sample(sums[channel] / filled);
            sums[channel] = 0;
        }
        filled = 0;
    }

    void finish() throws Exception {
        if (finished) throw new IllegalStateException("PCM stream is already finished");
        if (filled > 0) emitSample();
        for (Sink sink : sinks) {
            sink.emit();
            if (sink.chunks == 0) throw new IOException("Recording decoded to no audio samples");
        }
        finished = true;
    }

    @Override public void close() throws IOException {
        IOException failure = null;
        for (Sink sink : sinks) if (sink != null) {
            try { sink.close(); }
            catch (IOException error) {
                if (failure == null) failure = error; else failure.addSuppressed(error);
            }
        }
        if (failure != null) throw failure;
    }

    private final class Sink implements AutoCloseable {
        final File file;
        final int channel;
        final Consumer consumer;
        final byte[] buffer = new byte[8192];
        final ByteBuffer header = ByteBuffer.allocate(44).order(ByteOrder.LITTLE_ENDIAN);
        final RandomAccessFile output;
        int used, samples;
        long chunks;

        Sink(File directory, int channel, Consumer consumer) throws IOException {
            file = File.createTempFile("audio-" + channel + "-", ".wav", directory);
            this.channel = channel;
            this.consumer = consumer;
            RandomAccessFile opened = null;
            try {
                opened = new RandomAccessFile(file, "rw");
                opened.seek(44);
                output = opened;
            } catch (IOException failure) {
                if (opened != null) try { opened.close(); } catch (IOException cleanup) { failure.addSuppressed(cleanup); }
                if (!file.delete()) failure.addSuppressed(new IOException("Could not remove temporary decoded audio"));
                throw failure;
            }
        }

        void sample(double value) throws Exception {
            int pcm = (int) Math.round(Math.max(-1.0, Math.min(1.0, value)) * 32767.0);
            buffer[used++] = (byte) pcm;
            buffer[used++] = (byte) (pcm >> 8);
            samples++;
            if (used == buffer.length) flush();
            if (samples == RATE * CHUNK_SECONDS) emit();
        }

        void flush() throws IOException { output.write(buffer, 0, used); used = 0; }

        void emit() throws Exception {
            if (samples == 0) return;
            cancelled.check();
            flush();
            output.seek(0);
            header.clear();
            header.putInt(0x46464952).putInt(36 + samples * 2).putInt(0x45564157);
            header.putInt(0x20746d66).putInt(16).putShort((short) 1).putShort((short) 1);
            header.putInt(RATE).putInt(RATE * 2).putShort((short) 2).putShort((short) 16);
            header.putInt(0x61746164).putInt(samples * 2);
            output.write(header.array());
            consumer.accept(file, chunks, channel, sinks.length);
            chunks++;
            output.setLength(44);
            output.seek(44);
            samples = 0;
        }

        @Override public void close() throws IOException {
            try { output.close(); }
            finally { if (file.exists() && !file.delete()) throw new IOException("Could not remove temporary decoded audio"); }
        }
    }
}
