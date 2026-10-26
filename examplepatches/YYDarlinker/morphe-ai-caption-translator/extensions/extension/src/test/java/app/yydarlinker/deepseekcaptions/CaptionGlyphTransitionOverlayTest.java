package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.view.Choreographer;
import java.lang.reflect.Field;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.*;

/** Captures actual Overlay scheduling, including callbacks left queued by reset/settle. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, shadows = CaptionGlyphTransitionOverlayTest.Frames.class)
public class CaptionGlyphTransitionOverlayTest {
    @Implements(Choreographer.class)
    public static class Frames {
        // Avoid reusing the thread-local Choreographer created under another test's shadow map.
        private static final Choreographer clock =
                org.robolectric.shadow.api.Shadow.newInstanceOf(Choreographer.class);
        static final List<Choreographer.FrameCallback> queue = new ArrayList<>();
        static int posts;
        @Implementation protected static Choreographer getInstance() { return clock; }
        @Implementation protected void postFrameCallback(Choreographer.FrameCallback callback) {
            posts++;
            queue.add(callback);
        }
    }

    @Test public void frozenOldOverlaySequences() throws Exception {
        List<String> events = GlyphTransitionFixture.lines();
        List<String> trace = new ArrayList<>();
        trace.add("case\top\tinput\tbits\tadvanceNeedsFrame\tscheduled\tposts\tqueued");
        String previous = "";
        Field scheduled = CaptionOverlay.class.getDeclaredField("glyphFrameScheduled");
        scheduled.setAccessible(true);
        for (String line : events.subList(1, events.size())) {
            String[] e = line.split("\t");
            String event = String.join("\t", e[0], e[1], e[2]);
            if (!e[0].equals(previous)) {
                CaptionOverlay.resetGlyphForTests();
                Frames.queue.clear(); Frames.posts = 0; previous = e[0];
            }
            String needs = "-";
            switch (e[1]) {
                case "N": CaptionOverlay.noteGlyphTargetForTests(Float.parseFloat(e[2])); break;
                case "A": needs = Boolean.toString(CaptionOverlay.advanceDisplayedGlyph(Long.parseLong(e[2]))); break;
                case "F":
                    if (!Frames.queue.isEmpty()) Frames.queue.remove(0).doFrame(Long.parseLong(e[2]));
                    break;
                case "R": CaptionOverlay.resetGlyphForTests(); break;
                case "S": CaptionOverlay.settleDisplayedGlyphForTests(); break;
                default: throw new AssertionError(line);
            }
            trace.add(event + "\t" + Integer.toHexString(Float.floatToIntBits(CaptionOverlay.displayedGlyphPx()))
                    + "\t" + needs + "\t" + scheduled.getBoolean(null) + "\t" + Frames.posts + "\t" + Frames.queue.size());
            assertEquals("actual Overlay event: " + event, line, trace.get(trace.size() - 1));
        }
        assertEquals(events, trace);
        assertTrue(trace.size() > 80);
        CaptionOverlay.resetGlyphForTests(); Frames.queue.clear();
    }
}
