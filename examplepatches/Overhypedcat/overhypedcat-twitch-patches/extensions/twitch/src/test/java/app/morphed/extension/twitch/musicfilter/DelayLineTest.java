package app.morphed.extension.twitch.musicfilter;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import app.morphed.extension.twitch.settings.PatchSettings;

/**
 * The renderer's delay line: every buffer comes back the same size, the sound exactly LATENCY behind, both through
 * the filter (switched off) and after a failure; the picture is shifted by the same amount.
 */
public class DelayLineTest {
    private static final int LATENCY = Canceller.DELAY + Canceller.HOP;

    @Before
    public void songRemovalOff() {
        PatchSettings.setForTest(true, false); // no stream watched: off
    }

    /** Stereo 16-bit PCM whose left sample at frame f is f (wrapping), right is -f. */
    private static ByteBuffer pcm(int firstFrame, int frames) {
        ByteBuffer buffer = ByteBuffer.allocate(frames * 4).order(ByteOrder.LITTLE_ENDIAN);
        for (int f = 0; f < frames; f++) {
            short value = (short) ((firstFrame + f) % 30000);
            buffer.putShort((short) value);
            buffer.putShort((short) -value);
        }
        buffer.flip();
        return buffer;
    }

    private static void assertDelayed(ByteBuffer out, int firstFrame, int frames) {
        ByteBuffer read = out.duplicate().order(ByteOrder.LITTLE_ENDIAN);
        for (int f = 0; f < frames; f++) {
            int source = firstFrame + f - LATENCY;
            short expected = source < 0 ? 0 : (short) (source % 30000);
            assertEquals("left at frame " + (firstFrame + f), expected, read.getShort(f * 4));
            assertEquals("right at frame " + (firstFrame + f), (short) -expected, read.getShort(f * 4 + 2));
        }
    }

    @Test
    public void theFilterKeepsSizeAndRunsExactlyLatencyBehind() {
        SongRemoval.Renderer state = new SongRemoval.Renderer(Canceller.RATE, 2);
        Object renderer = new Object(); // (no volume field: counts as heard)
        int at = 0;
        for (int frames : new int[]{1000, 333, 2048, 7, 4000}) {
            ByteBuffer out = SongRemoval.process(renderer, state, pcm(at, frames), frames * 4);
            assertEquals("same size", frames * 4, out.limit());
            assertDelayed(out, at, frames);
            at += frames;
        }
    }

    @Test
    public void afterAFailureTheSoundStaysLatencyBehind() {
        SongRemoval.Renderer state = new SongRemoval.Renderer(Canceller.RATE, 2);
        int at = 0;
        for (int frames : new int[]{1500, 64, 3000}) {
            ByteBuffer out = SongRemoval.delayed(state, pcm(at, frames), frames * 4);
            assertEquals(frames * 4, out.limit());
            assertDelayed(out, at, frames);
            at += frames;
        }
    }

    @Test
    public void thePictureIsShiftedByTheSameLatency() {
        assertEquals(LATENCY * 1_000_000L / Canceller.RATE, SongRemoval.LATENCY_US);
    }
}
