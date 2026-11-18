package app.hushmessenger.extension;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class CallMixTest {
    private File file;
    private FileChannel channel;
    private CallMix mix;

    @Before public void open() throws IOException {
        file = File.createTempFile("call", ".wav");
        channel = FileChannel.open(file.toPath(), StandardOpenOption.READ, StandardOpenOption.WRITE);
        mix = new CallMix(channel);
    }

    @After public void close() throws IOException {
        channel.close();
        file.delete();
    }

    private static short[] filled(int samples, int... channels) {
        short[] sound = new short[samples * channels.length];
        for (int i = 0; i < sound.length; i++) sound[i] = (short) channels[i % channels.length];
        return sound;
    }

    private ByteBuffer bytes() throws IOException {
        return ByteBuffer.wrap(Files.readAllBytes(file.toPath())).order(ByteOrder.LITTLE_ENDIAN);
    }

    private short[] samples() throws IOException {
        ByteBuffer all = bytes();
        short[] samples = new short[(all.capacity() - CallMix.HEADER_BYTES) / 2];
        all.position(CallMix.HEADER_BYTES);
        all.asShortBuffer().get(samples);
        return samples;
    }

    private static String text(ByteBuffer all, int at) {
        return new String(all.array(), at, 4, StandardCharsets.US_ASCII);
    }

    @Test public void theHeaderDescribesMono16BitSpeech() throws IOException {
        ByteBuffer all = bytes();
        assertEquals(CallMix.HEADER_BYTES, all.capacity());
        assertEquals("RIFF", text(all, 0));
        assertEquals("WAVE", text(all, 8));
        assertEquals("fmt ", text(all, 12));
        assertEquals("data", text(all, 36));
        assertEquals(1, all.getShort(20));
        assertEquals(1, all.getShort(22));
        assertEquals(CallMix.RATE, all.getInt(24));
        assertEquals(CallMix.RATE * 2, all.getInt(28));
        assertEquals(2, all.getShort(32));
        assertEquals(16, all.getShort(34));
    }

    @Test public void finishingWritesEverythingAndCountsItInTheHeader() throws IOException {
        mix.finish(1000);
        assertEquals(CallMix.RATE, mix.written());
        ByteBuffer all = bytes();
        assertEquals(CallMix.HEADER_BYTES + CallMix.RATE * 2, all.capacity());
        assertEquals(CallMix.RATE * 2, all.getInt(40));
        assertEquals(36 + CallMix.RATE * 2, all.getInt(4));
    }

    @Test public void theFileRunsBehindTheClockUntilItFinishes() throws IOException {
        mix.pump(100);
        assertEquals(0, mix.written());
        mix.pump(1000);
        assertEquals((1000 - CallMix.LAG_MILLIS) * CallMix.RATE / 1000, mix.written());
    }

    @Test public void theHeaderGoesBackInEveryFewSecondsSoACrashLeavesAFileThatPlays() throws IOException {
        mix.pump(2000);
        assertEquals(0, bytes().getInt(40));
        mix.pump(6000);
        long bytes = mix.written() * 2;
        assertTrue(bytes > 0);
        assertEquals(bytes, bytes().getInt(40));
        assertEquals(CallMix.HEADER_BYTES + bytes, file.length());
    }

    @Test public void stereoAt48KhzComesDownToMonoAt16Khz() throws IOException {
        mix.mine.offer(filled(480, 1000, 3000), 480, 2, 48000, 10);
        mix.finish(10);
        short[] expected = new short[160];
        Arrays.fill(expected, (short) 2000);
        assertArrayEquals(expected, samples());
    }

    @Test public void soundAt8KhzComesUpTo16Khz() throws IOException {
        mix.theirs.offer(filled(80, 1000), 80, 1, 8000, 10);
        mix.finish(10);
        short[] out = samples();
        assertEquals(160, out.length);
        assertEquals(0, out[0]);
        assertEquals(500, out[1]);
        for (int i = 2; i < out.length; i++) assertEquals(1000, out[i]);
    }

    @Test public void aSideThatGoesQuietBecomesSilenceAndNothingShifts() throws IOException {
        mix.mine.offer(filled(160, 1000), 160, 1, 16000, 10);
        mix.mine.offer(filled(160, 2000), 160, 1, 16000, 1000);
        mix.finish(1000);
        short[] out = samples();
        assertEquals(CallMix.RATE, out.length);
        assertEquals(1000, out[0]);
        assertEquals(1000, out[159]);
        assertEquals(0, out[160]);
        assertEquals(0, out[CallMix.RATE - 161]);
        assertEquals(2000, out[CallMix.RATE - 160]);
        assertEquals(2000, out[CallMix.RATE - 1]);
    }

    @Test public void aSideThatStartsLateKeepsItsPlaceInTheCall() throws IOException {
        mix.mine.offer(filled(160, 1000), 160, 1, 16000, 10);
        mix.theirs.offer(filled(160, 500), 160, 1, 16000, 500);
        mix.finish(500);
        short[] out = samples();
        assertEquals(1000, out[0]);
        assertEquals(0, out[7839]);
        assertEquals(500, out[7840]);
        assertEquals(500, out[7999]);
    }

    @Test public void silentFramesDontCountAsHearingAnyone() throws IOException {
        mix.mine.offer(filled(160, 0), 160, 1, 16000, 10);
        mix.theirs.offer(filled(160, 0), 160, 1, 16000, 10);
        assertFalse(mix.heard());
        mix.theirs.offer(filled(160, 1), 160, 1, 16000, 20);
        assertTrue(mix.heard());
    }

    /** The way WebRTC makes its buffers: direct, in the phone's byte order, while the buffer itself still says big endian. */
    private static ByteBuffer webrtc(short[] sound) {
        ByteBuffer buffer = ByteBuffer.allocateDirect(sound.length * 2).order(ByteOrder.nativeOrder());
        for (int i = 0; i < sound.length; i++) buffer.putShort(i * 2, sound[i]);
        return buffer.order(ByteOrder.BIG_ENDIAN);
    }

    @Test public void anAudioThreadsBufferIsReadInThePhonesByteOrder() throws IOException {
        mix.mine.offer(webrtc(filled(160, 1000)), 320, 1, 16000, 10);
        mix.finish(10);
        short[] expected = new short[160];
        Arrays.fill(expected, (short) 1000);
        assertArrayEquals(expected, samples());
    }

    @Test public void anAudioThreadsBufferKeepsItsOwnPositionAndLimit() throws IOException {
        ByteBuffer buffer = webrtc(filled(160, 1000));
        buffer.position(40).limit(100);
        mix.mine.offer(buffer, 320, 1, 16000, 10);
        assertEquals(40, buffer.position());
        assertEquals(100, buffer.limit());
        assertEquals(ByteOrder.BIG_ENDIAN, buffer.order());
    }

    @Test public void aMuteLeavingThePositionAtTheEndLosesNothing() throws IOException {
        ByteBuffer buffer = webrtc(filled(160, 1000));
        buffer.position(buffer.capacity());
        mix.mine.offer(buffer, 320, 1, 16000, 10);
        mix.finish(10);
        assertEquals(1000, samples()[159]);
    }

    @Test public void aBufferAskedForMoreThanItHoldsOnlyGivesWhatItHolds() throws IOException {
        mix.mine.offer(webrtc(filled(80, 1000)), 320, 1, 16000, 5);
        mix.finish(5);
        assertEquals(80, samples().length);
        assertEquals(1000, samples()[79]);
    }

    @Test public void buffersThatCantBeUsedAreLeftOut() throws IOException {
        mix.mine.offer((ByteBuffer) null, 320, 1, 16000, 10);
        mix.mine.offer(webrtc(filled(160, 1000)), 0, 1, 16000, 10);
        mix.mine.offer(webrtc(filled(160, 1000)), -1, 1, 16000, 10);
        mix.mine.offer(webrtc(filled(160, 1000)), 320, 0, 16000, 10);
        mix.mine.offer(webrtc(filled(160, 1000)), 320, 1, 0, 10);
        assertFalse(mix.heard());
    }

    @Test public void twoLoudSidesClipInsteadOfWrappingAround() throws IOException {
        mix.mine.offer(filled(160, 30000), 160, 1, 16000, 10);
        mix.theirs.offer(filled(160, 30000), 160, 1, 16000, 10);
        mix.finish(10);
        assertEquals(Short.MAX_VALUE, samples()[0]);
    }

    @Test public void framesThatCantBeUsedAreLeftOut() throws IOException {
        mix.mine.offer((short[]) null, 160, 1, 16000, 10);
        mix.mine.offer(filled(160, 1000), 0, 1, 16000, 10);
        mix.mine.offer(filled(160, 1000), 160, 0, 16000, 10);
        mix.mine.offer(filled(160, 1000), 160, 1, 0, 10);
        mix.finish(10);
        assertArrayEquals(new short[160], samples());
    }

    @Test public void aFrameClaimingMoreThanItHoldsOnlyUsesWhatItHolds() throws IOException {
        mix.mine.offer(filled(80, 1000), 160, 1, 16000, 5);
        mix.finish(5);
        assertEquals(80, samples().length);
        assertEquals(1000, samples()[79]);
    }

    /** The format of the file is a sink's business, so the mixing hands the same sound to any of them (#193). */
    @Test public void aSinkOfItsOwnGetsTheSameSoundInOrder() throws IOException {
        Counted sink = new Counted();
        CallMix other = new CallMix(sink);
        other.mine.offer(filled(CallMix.RATE, 500), CallMix.RATE * 2, 1, CallMix.RATE, 1000);
        other.finish(1000);
        assertEquals(CallMix.RATE, other.written());
        assertEquals("Every sample reached the sink", CallMix.RATE, sink.samples);
        assertEquals("In one run from the start", 0L, sink.firstAt);
        assertTrue("More than one write", sink.writes > 1);
        assertTrue("Closed off once", sink.finished);
        assertEquals(500, sink.first);
    }

    /** A sink that can hold less than the clock asks for stops the recording there. */
    @Test public void aSinkWithLessRoomFillsUp() throws IOException {
        Counted sink = new Counted();
        sink.most = CallMix.RATE / 2;
        CallMix other = new CallMix(sink);
        assertFalse(other.full());
        other.finish(1000);
        assertEquals(CallMix.RATE / 2, other.written());
        assertTrue(other.full());
    }

    /** With a side on each channel the two voices stay apart: you on the left, them on the right (#193). */
    @Test public void aSideOnEachChannelKeepsTheVoicesApart() throws IOException {
        File two = File.createTempFile("sides", ".wav");
        try (FileChannel channel = FileChannel.open(two.toPath(), StandardOpenOption.READ, StandardOpenOption.WRITE)) {
            CallMix sides = new CallMix(new CallMix.Wav(channel, 2), 2);
            sides.mine.offer(filled(160, 1000), 160, 1, 16000, 10);
            sides.theirs.offer(filled(160, -400), 160, 1, 16000, 10);
            sides.finish(10);
            ByteBuffer all = ByteBuffer.wrap(Files.readAllBytes(two.toPath())).order(ByteOrder.LITTLE_ENDIAN);
            assertEquals(2, all.getShort(22));
            assertEquals(CallMix.RATE * 4, all.getInt(28));
            assertEquals(4, all.getShort(32));
            assertEquals(160 * 4, all.getInt(40));
            assertEquals(CallMix.HEADER_BYTES + 160 * 4, all.capacity());
            assertEquals(1000, all.getShort(CallMix.HEADER_BYTES));
            assertEquals(-400, all.getShort(CallMix.HEADER_BYTES + 2));
            assertEquals(1000, all.getShort(CallMix.HEADER_BYTES + 4));
            assertEquals(-400, all.getShort(CallMix.HEADER_BYTES + 6));
        } finally {
            two.delete();
        }
    }

    /** Two channels take twice the bytes, so a WAV's own count runs out after half as long. */
    @Test public void aSideOnEachChannelFillsTheFileTwiceAsFast() throws IOException {
        File two = File.createTempFile("sides", ".wav");
        try (FileChannel channel = FileChannel.open(two.toPath(), StandardOpenOption.READ, StandardOpenOption.WRITE)) {
            assertEquals(CallMix.MOST_SAMPLES / 2, new CallMix.Wav(channel, 2).most());
            assertEquals(CallMix.MOST_SAMPLES, new CallMix.Wav(channel, 1).most());
        } finally {
            two.delete();
        }
    }

    @Test public void releasingTheMixLetsTheSinkGo() {
        Counted sink = new Counted();
        new CallMix(sink).release();
        assertTrue(sink.released);
    }

    /** A sink that only counts what it's given. */
    private static final class Counted implements CallMix.Sink {
        long most = Long.MAX_VALUE;
        long samples;
        long firstAt = -1;
        int writes;
        short first;
        boolean finished, released;

        @Override public long most() {
            return most;
        }

        @Override public void write(long at, ByteBuffer written) {
            if (firstAt < 0) {
                firstAt = at;
                first = written.duplicate().order(ByteOrder.LITTLE_ENDIAN).getShort();
            }
            assertEquals("Writes follow one another", samples, at);
            samples += written.remaining() / 2;
            written.position(written.limit());
            writes++;
        }

        @Override public void finish() {
            finished = true;
        }

        @Override public void release() {
            released = true;
        }
    }
}
