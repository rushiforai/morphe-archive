package app.morphed.extension.twitch.diag;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/** The detailed log's eyes: the video's stalls and freezes, the main thread's stack, the phone's CPU share. */
public class DiagnosticsTest {
    private static VideoTracker.Sample at(long ms, String state, long position, int dropped, int rendered) {
        return new VideoTracker.Sample(ms, state, "1080p60", position, position + 2_000, 4_000, 30_000_000,
                rendered + dropped, rendered, dropped, 60, 6_000_000);
    }

    private static List<String> run(VideoTracker tracker, VideoTracker.Sample... samples) {
        List<String> all = new ArrayList<>();
        for (VideoTracker.Sample s : samples) all.addAll(tracker.feed(s));
        return all;
    }

    @Test
    public void aStallIsLoggedWithHowLongItLasted() {
        List<String> lines = run(new VideoTracker(),
                at(0, "PLAYING", 0, 0, 0), at(500, "PLAYING", 500, 0, 30),
                at(1000, "BUFFERING", 1000, 0, 60), at(3500, "PLAYING", 1000, 0, 60));
        assertTrue(lines.toString(), lines.get(0).startsWith("Video: PLAYING 1080p60, buffer ahead 2.0 s, latency 4.0 s"));
        assertTrue(lines.toString(), lines.get(1).startsWith("Video: BUFFERING after 1.0 s PLAYING"));
        assertTrue(lines.toString(), lines.get(2).startsWith("Video: PLAYING after 2.5 s BUFFERING (a stall)"));
    }

    @Test
    public void aFrozenPictureWhilePlayingIsCaught() {
        List<String> lines = run(new VideoTracker(),
                at(0, "PLAYING", 0, 0, 0), at(500, "PLAYING", 500, 0, 30),
                at(1000, "PLAYING", 500, 0, 30), at(1500, "PLAYING", 500, 0, 30),
                at(4000, "PLAYING", 500, 0, 30), at(4500, "PLAYING", 900, 0, 50));
        assertEquals(lines.toString(), 3, lines.size());
        assertTrue(lines.get(1), lines.get(1).startsWith("Video: picture frozen while PLAYING (position 0.5 s not moving for 1.0 s)"));
        assertTrue(lines.get(2), lines.get(2).startsWith("Video: picture moving again after 4.0 s frozen"));
    }

    @Test
    public void droppedFrameBurstsAndQualityChangesAreLogged() {
        VideoTracker tracker = new VideoTracker();
        tracker.feed(at(0, "PLAYING", 0, 0, 0));
        List<String> lines = tracker.feed(at(500, "PLAYING", 500, 12, 18));
        assertTrue(lines.toString(), lines.get(0).startsWith("Video: 12 frames dropped in 0.5 s"));
        assertTrue("a few dropped frames are routine", tracker.feed(at(1000, "PLAYING", 1000, 14, 46)).isEmpty());
        List<String> changed = tracker.feed(new VideoTracker.Sample(1500, "PLAYING", "720p60", 1500, 3500, 4000, 0, 90, 76, 14, 60, 3_000_000));
        assertEquals("Video: quality 1080p60 -> 720p60", changed.get(0));
    }

    @Test
    public void everyTenSecondsASummary() {
        VideoTracker tracker = new VideoTracker();
        tracker.feed(at(0, "PLAYING", 0, 0, 0));
        List<String> lines = tracker.feed(at(10_000, "PLAYING", 10_000, 3, 597));
        assertEquals(1, lines.size());
        assertEquals("Video: PLAYING 1080p60, buffer ahead 2.0 s, latency 4.0 s, 60 fps shown, 3 dropped, 60 fps decoded, "
                + "video 6.0 Mbps, connection ~30 Mbps", lines.get(0));
    }

    @Test
    public void aNewStreamStartsAfresh() {
        VideoTracker tracker = new VideoTracker();
        tracker.feed(at(0, "PLAYING", 0, 0, 0));
        tracker.reset();
        assertTrue(tracker.feed(at(500, "READY", 0, 0, 0)).get(0).startsWith("Video: READY "));
    }

    @Test
    public void theMainThreadsStackIsShortAndReadable() {
        StackTraceElement[] frames = new StackTraceElement[12];
        for (int i = 0; i < frames.length; i++) frames[i] = new StackTraceElement("a.B" + i, "run", "B.java", i + 1);
        String stack = MainWatch.stack(frames);
        assertTrue(stack, stack.startsWith("a.B0.run:1 < a.B1.run:2"));
        assertEquals("ten frames at most", 10, stack.split(" < ").length);
        assertEquals("(no stack)", MainWatch.stack(new StackTraceElement[0]));
    }

    @Test
    public void theAppsCpuShareIsOfTheWholePhone() {
        assertEquals(25.0, Resources.cpuPercent(1000, 1000, 4), 0.01); // one core busy out of four
        assertEquals(100.0, Resources.cpuPercent(9000, 1000, 4), 0.01);
        assertEquals(0.0, Resources.cpuPercent(10, 0, 4), 0.01);
        assertEquals("SEVERE (slowed down)", Resources.thermal(3));
    }
}
