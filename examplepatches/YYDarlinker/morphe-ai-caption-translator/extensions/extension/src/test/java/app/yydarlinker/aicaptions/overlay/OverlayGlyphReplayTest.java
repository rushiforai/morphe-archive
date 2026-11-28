package app.yydarlinker.aicaptions.overlay;

import static org.junit.Assert.*;

import android.view.Choreographer;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.Queue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.*;
import org.robolectric.shadow.api.Shadow;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, shadows = OverlayGlyphReplayTest.Frames.class)
public class OverlayGlyphReplayTest {
    @Implements(Choreographer.class)
    public static class Frames {
        static final Choreographer clock = Shadow.newInstanceOf(Choreographer.class);
        static final Queue<Choreographer.FrameCallback> pending = new ArrayDeque<>();
        static int posts;

        @Implementation protected static Choreographer getInstance() {
            return clock;
        }

        @Implementation protected void postFrameCallback(Choreographer.FrameCallback callback) {
            posts++;
            pending.add(callback);
        }
    }

    @Test public void capturedOverlayAnimationPreservesPaintedSizeAndFrameRequests() throws Exception {
        String trace;
        try (InputStream in = getClass().getResourceAsStream("/glyph-transition-v1.tsv")) {
            assertNotNull(in);
            trace = new String(in.readAllBytes(), StandardCharsets.UTF_8);
        }
        String[] lines = trace.split("\\R");
        assertTrue(lines.length > 80);
        String previous = "";
        try {
            for (int row = 1; row < lines.length; row++) {
                String[] step = lines[row].split("\t");
                if (!previous.equals(step[0])) {
                    CaptionOverlay.resetGlyphForTests();
                    Frames.pending.clear();
                    Frames.posts = 0;
                    previous = step[0];
                }
                String needs = "-";
                switch (step[1]) {
                    case "N": CaptionOverlay.noteGlyphTargetForTests(Float.parseFloat(step[2])); break;
                    case "A": needs = Boolean.toString(CaptionOverlay.advanceDisplayedGlyph(Long.parseLong(step[2]))); break;
                    case "F":
                        Choreographer.FrameCallback frame = Frames.pending.poll();
                        if (frame != null) frame.doFrame(Long.parseLong(step[2]));
                        break;
                    case "R": CaptionOverlay.resetGlyphForTests(); break;
                    case "S": CaptionOverlay.settleDisplayedGlyphForTests(); break;
                    default: throw new AssertionError(lines[row]);
                }
                String label = "glyph replay row " + row + " " + step[0];
                assertEquals(label, step[3], Integer.toHexString(Float.floatToIntBits(CaptionOverlay.displayedGlyphPx())));
                assertEquals(label, step[4], needs);
                assertEquals(label, Integer.parseInt(step[6]), Frames.posts);
                assertEquals(label, Integer.parseInt(step[7]), Frames.pending.size());
            }
        } finally {
            CaptionOverlay.resetGlyphForTests();
            Frames.pending.clear();
        }
    }
}
