package app.hushmessenger.extension;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;

/**
 * Puts both sides of a call into one file (#105), mixed together or one side to a channel (#193). Each side hands
 * over its sound on Messenger's audio threads, at whatever rate and channel count the call uses. Sound is placed by when it arrived and the file is written against the
 * clock, so a side that goes quiet becomes silence and never shifts the other side. The header goes back in every few
 * seconds, so a crash still leaves a file that plays.
 */
final class CallMix {
    /** Wideband speech, about 115 MB an hour. */
    static final int RATE = 16000;
    static final int HEADER_BYTES = 44;
    /** The file runs this far behind the clock, so both sides have handed over the sound being written. */
    static final int LAG_MILLIS = 300;
    private static final int HEADER_EVERY = RATE * 5;
    /** What a WAV header can count. */
    static final long MOST_SAMPLES = (0xFFFFFFFFL - 36) / 2;
    private static final int CHUNK = RATE / 5;

    /**
     * Where the mixed sound goes. A WAV file is one of these and so is an Opus stream, which is how the format of the
     * file is a choice under the switch (#193). The mixing above it is the same either way.
     */
    interface Sink {
        /**
         * Writes 16 bit samples for the frames that begin [at] frames into the recording. A frame is one sample with
         * both sides mixed, or one from each side, by how many channels the sink was made with.
         */
        void write(long at, ByteBuffer samples) throws IOException;

        /** Everything due so far has been handed over. The next lot may be a few hundred milliseconds off. */
        default void pumped() throws IOException {
        }

        /** Everything has been handed over, so whatever is left to write goes in. */
        void finish() throws IOException;

        /** The most frames this can hold. */
        default long most() {
            return Long.MAX_VALUE;
        }

        /** Lets go of anything held, whether the recording finished or not. */
        default void release() {
        }
    }

    private final Sink sink;
    private final int channels;
    private final ByteBuffer samples;
    private final short[] mineChunk = new short[CHUNK];
    private final short[] theirsChunk = new short[CHUNK];
    private long written;

    final Side mine = new Side();
    final Side theirs = new Side();

    CallMix(FileChannel file) throws IOException {
        this(new Wav(file), 1);
    }

    CallMix(Sink sink) {
        this(sink, 1);
    }

    /** One channel puts both sides together, two gives each its own: you on the left, them on the right (#193). */
    CallMix(Sink sink, int channels) {
        this.sink = sink;
        this.channels = channels == 2 ? 2 : 1;
        this.samples = ByteBuffer.allocate(CHUNK * 2 * this.channels).order(ByteOrder.LITTLE_ENDIAN);
    }

    long written() {
        return written;
    }

    /** Lets go of whatever the file needed, for a recording that ended badly. */
    void release() {
        sink.release();
    }

    boolean full() {
        return written >= sink.most();
    }

    /** Whether either side has handed over any real sound. Time passing and muted frames only write silence. */
    boolean heard() {
        return mine.heard() || theirs.heard();
    }

    /** Writes everything that's due this long after the recording began. */
    void pump(long elapsedMillis) throws IOException {
        writeUpTo((elapsedMillis - LAG_MILLIS) * RATE / 1000);
    }

    /** Writes what's left and whatever closes the file off. */
    void finish(long elapsedMillis) throws IOException {
        writeUpTo(elapsedMillis * RATE / 1000);
        sink.finish();
    }

    private void writeUpTo(long due) throws IOException {
        due = Math.min(due, sink.most());
        while (written < due) {
            int count = (int) Math.min(due - written, CHUNK);
            mine.read(written, count, mineChunk);
            theirs.read(written, count, theirsChunk);
            samples.clear();
            for (int i = 0; i < count; i++) {
                if (channels == 2) {
                    samples.putShort(mineChunk[i]).putShort(theirsChunk[i]);
                } else {
                    samples.putShort((short) Math.max(Short.MIN_VALUE, Math.min(Short.MAX_VALUE, mineChunk[i] + theirsChunk[i])));
                }
            }
            samples.flip();
            sink.write(written, samples);
            written += count;
        }
        sink.pumped();
    }

    /** A plain WAV file, header and all. The header goes back in every few seconds, so a crash leaves one that plays. */
    static final class Wav implements Sink {
        private final FileChannel file;
        private final int channels;
        private long written;
        private long headerAt;

        Wav(FileChannel file) throws IOException {
            this(file, 1);
        }

        Wav(FileChannel file, int channels) throws IOException {
            this.file = file;
            this.channels = channels == 2 ? 2 : 1;
            writeHeader();
        }

        @Override public long most() {
            return MOST_SAMPLES / channels;
        }

        @Override public void write(long at, ByteBuffer samples) throws IOException {
            long into = HEADER_BYTES + at * 2 * channels;
            written = at + samples.remaining() / (2 * channels);
            while (samples.hasRemaining()) into += file.write(samples, into);
        }

        @Override public void pumped() throws IOException {
            if (written - headerAt >= HEADER_EVERY) writeHeader();
        }

        @Override public void finish() throws IOException {
            writeHeader();
        }

        private void writeHeader() throws IOException {
            long bytes = written * 2 * channels;
            ByteBuffer header = ByteBuffer.allocate(HEADER_BYTES).order(ByteOrder.LITTLE_ENDIAN);
            header.put(new byte[] {'R', 'I', 'F', 'F'}).putInt((int) (36 + bytes)).put(new byte[] {'W', 'A', 'V', 'E', 'f', 'm', 't', ' '});
            header.putInt(16).putShort((short) 1).putShort((short) channels).putInt(RATE).putInt(RATE * 2 * channels)
                .putShort((short) (2 * channels)).putShort((short) 16);
            header.put(new byte[] {'d', 'a', 't', 'a'}).putInt((int) bytes);
            header.flip();
            long at = 0;
            while (header.hasRemaining()) at += file.write(header, at);
            headerAt = written;
        }
    }

    /** One side of the call: mono at {@link #RATE} in a ring, by position in the file. */
    static final class Side {
        private static final int CAPACITY = RATE * 3;
        /** Sound arriving further than this from where it should fall moves there, leaving silence or replacing what's there. */
        private static final int SLACK = RATE / 10;

        private final short[] ring = new short[CAPACITY];
        private short[] converted = new short[RATE / 50];
        private short[] incoming = new short[RATE / 50];
        /** The next position to fill, or -1 before any sound. */
        private long tail = -1;
        private boolean heard;
        private int rate;
        private int boxSum, boxCount, carry;
        private int last;

        synchronized boolean heard() {
            return heard;
        }

        /**
         * Takes one frame from an audio thread's own buffer, which holds samples in the phone's byte order whatever the buffer
         * says. It's read by index on a copy of the buffer's state, since a mute leaves its position at the end.
         */
        synchronized void offer(ByteBuffer sound, int bytes, int channels, int frameRate, long elapsedMillis) {
            if (sound == null || bytes <= 0 || channels <= 0) return;
            ByteBuffer pcm = sound.duplicate().order(ByteOrder.nativeOrder());
            pcm.clear();
            int count = Math.min(bytes, pcm.capacity()) / 2;
            if (incoming.length < count) incoming = new short[count];
            for (int i = 0; i < count; i++) incoming[i] = pcm.getShort(i * 2);
            offer(incoming, count / channels, channels, frameRate, elapsedMillis);
        }

        /** Takes one frame of interleaved sound that has just arrived. Runs on Messenger's audio thread, so it does no I/O. */
        synchronized void offer(short[] sound, int frames, int channels, int frameRate, long elapsedMillis) {
            if (sound == null || frames <= 0 || channels <= 0 || frameRate <= 0) return;
            frames = Math.min(frames, sound.length / channels);
            if (frameRate != rate) {
                rate = frameRate;
                boxSum = boxCount = carry = 0;
            }
            int count = convert(sound, frames, channels);
            if (count == 0) return;
            long start = elapsedMillis * RATE / 1000 - count;
            if (tail < 0 || Math.abs(start - tail) > SLACK) move(Math.max(0, start));
            for (int i = 0; i < count; i++) {
                ring[(int) ((tail + i) % CAPACITY)] = converted[i];
                if (converted[i] != 0) heard = true;
            }
            tail += count;
        }

        private void move(long position) {
            if (tail >= 0) {
                long gap = Math.min(position - tail, CAPACITY);
                for (long i = 0; i < gap; i++) ring[(int) ((tail + i) % CAPACITY)] = 0;
            }
            tail = position;
        }

        /** Fills [out] with this side's sound from [position], with silence wherever it has none. */
        synchronized void read(long position, int count, short[] out) {
            for (int i = 0; i < count; i++) {
                long at = position + i;
                out[i] = tail >= 0 && at < tail && at >= tail - CAPACITY ? ring[(int) (at % CAPACITY)] : 0;
            }
        }

        private int convert(short[] sound, int frames, int channels) {
            int most = (int) ((long) frames * Math.max(RATE, rate) / rate) + 2;
            if (converted.length < most) converted = new short[most];
            int count = 0;
            for (int frame = 0; frame < frames; frame++) {
                int mono = 0;
                for (int channel = 0; channel < channels; channel++) mono += sound[frame * channels + channel];
                mono /= channels;
                if (rate >= RATE) {
                    // Averages the frames behind each output sample, which keeps most of the top end from folding back down.
                    boxSum += mono;
                    boxCount++;
                    carry += RATE;
                    if (carry >= rate) {
                        carry -= rate;
                        converted[count++] = (short) (boxSum / boxCount);
                        boxSum = boxCount = 0;
                    }
                } else {
                    while (carry < RATE) {
                        converted[count++] = (short) (last + (mono - last) * carry / RATE);
                        carry += rate;
                    }
                    carry -= RATE;
                    last = mono;
                }
            }
            return count;
        }
    }
}
