package app.hushmessenger.extension;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;

/**
 * Mixes both sides of a call into one mono WAV (#105). Each side hands over its sound on Messenger's audio threads, at
 * whatever rate and channel count the call uses. Sound is placed by when it arrived and the file is written against the
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

    private final FileChannel file;
    private final ByteBuffer samples = ByteBuffer.allocate(CHUNK * 2).order(ByteOrder.LITTLE_ENDIAN);
    private final short[] mineChunk = new short[CHUNK];
    private final short[] theirsChunk = new short[CHUNK];
    private long written;
    private long headerAt;

    final Side mine = new Side();
    final Side theirs = new Side();

    CallMix(FileChannel file) throws IOException {
        this.file = file;
        writeHeader();
    }

    long written() {
        return written;
    }

    boolean full() {
        return written >= MOST_SAMPLES;
    }

    /** Whether either side has handed over any sound. Time passing alone only writes silence. */
    boolean heard() {
        return mine.heard() || theirs.heard();
    }

    /** Writes everything that's due this long after the recording began. */
    void pump(long elapsedMillis) throws IOException {
        writeUpTo((elapsedMillis - LAG_MILLIS) * RATE / 1000);
    }

    /** Writes what's left and the final header. */
    void finish(long elapsedMillis) throws IOException {
        writeUpTo(elapsedMillis * RATE / 1000);
        writeHeader();
    }

    private void writeUpTo(long due) throws IOException {
        due = Math.min(due, MOST_SAMPLES);
        while (written < due) {
            int count = (int) Math.min(due - written, CHUNK);
            mine.read(written, count, mineChunk);
            theirs.read(written, count, theirsChunk);
            samples.clear();
            for (int i = 0; i < count; i++) {
                samples.putShort((short) Math.max(Short.MIN_VALUE, Math.min(Short.MAX_VALUE, mineChunk[i] + theirsChunk[i])));
            }
            samples.flip();
            long at = HEADER_BYTES + written * 2;
            while (samples.hasRemaining()) at += file.write(samples, at);
            written += count;
        }
        if (written - headerAt >= HEADER_EVERY) writeHeader();
    }

    private void writeHeader() throws IOException {
        long bytes = written * 2;
        ByteBuffer header = ByteBuffer.allocate(HEADER_BYTES).order(ByteOrder.LITTLE_ENDIAN);
        header.put(new byte[] {'R', 'I', 'F', 'F'}).putInt((int) (36 + bytes)).put(new byte[] {'W', 'A', 'V', 'E', 'f', 'm', 't', ' '});
        header.putInt(16).putShort((short) 1).putShort((short) 1).putInt(RATE).putInt(RATE * 2).putShort((short) 2).putShort((short) 16);
        header.put(new byte[] {'d', 'a', 't', 'a'}).putInt((int) bytes);
        header.flip();
        long at = 0;
        while (header.hasRemaining()) at += file.write(header, at);
        headerAt = written;
    }

    /** One side of the call: mono at {@link #RATE} in a ring, by position in the file. */
    static final class Side {
        private static final int CAPACITY = RATE * 3;
        /** Sound arriving further than this from where it should fall moves there, leaving silence or replacing what's there. */
        private static final int SLACK = RATE / 10;

        private final short[] ring = new short[CAPACITY];
        private short[] converted = new short[RATE / 50];
        /** The next position to fill, or -1 before any sound. */
        private long tail = -1;
        private int rate;
        private int boxSum, boxCount, carry;
        private int last;

        synchronized boolean heard() {
            return tail >= 0;
        }

        /** Takes one frame of interleaved sound that has just arrived. Runs on Messenger's audio thread, so it does no I/O. */
        synchronized void offer(short[] sound, int frames, int channels, int frameRate, boolean muted, long elapsedMillis) {
            if (sound == null || frames <= 0 || channels <= 0 || frameRate <= 0) return;
            frames = Math.min(frames, sound.length / channels);
            if (frameRate != rate) {
                rate = frameRate;
                boxSum = boxCount = carry = 0;
            }
            int count = convert(sound, frames, channels, muted);
            if (count == 0) return;
            long start = elapsedMillis * RATE / 1000 - count;
            if (tail < 0 || Math.abs(start - tail) > SLACK) move(Math.max(0, start));
            for (int i = 0; i < count; i++) ring[(int) ((tail + i) % CAPACITY)] = converted[i];
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

        private int convert(short[] sound, int frames, int channels, boolean muted) {
            int most = (int) ((long) frames * Math.max(RATE, rate) / rate) + 2;
            if (converted.length < most) converted = new short[most];
            int count = 0;
            for (int frame = 0; frame < frames; frame++) {
                int mono = 0;
                if (!muted) {
                    for (int channel = 0; channel < channels; channel++) mono += sound[frame * channels + channel];
                    mono /= channels;
                }
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
