package app.yydarlinker.aicaptions.overlay;

import static org.junit.Assert.*;

import android.graphics.Rect;
import android.os.Looper;
import android.view.View;
import android.widget.TextView;
import java.time.Duration;
import org.junit.Before;
import org.junit.Test;
import org.robolectric.Shadows;

public class ShortsCaptionViewportTest extends CaptionViewportFixture {
    static final String CAPTION = "Subtitles remain readable across the Shorts viewport.";

    @Before public void openShorts() {
        CaptionUiGeometryFixture.shorts = true;
        CaptionUiGeometryFixture.bounds = new Rect(390, 40, 874, 850);
    }

    @Test public void captionsCanUseTheSideBarsAboveComments() throws Exception {
        show(CAPTION, "en");
        assertTrue(anchor().getWidth() > CaptionUiGeometryFixture.bounds.width());
        assertCenter(WIDTH / 2f);
    }

    @Test public void captionMovesAboveCommentSheetAsTheVideoShrinks() throws Exception {
        show(CAPTION, "en");
        float before = anchor().getY();
        CaptionUiGeometryFixture.bounds = new Rect(450, 10, 814, 360);
        layout();
        assertTrue(anchor().getY() < before);
        assertTrue(anchor().getY() + anchor().getHeight() <= 360);
        assertCenter(WIDTH / 2f);
    }

    @Test public void changingShortsViewportKeepsTheCurrentCaption() throws Exception {
        TextView caption = show(CAPTION, "en");
        CharSequence before = caption.getText();
        CaptionUiGeometryFixture.bounds = new Rect(450, 10, 814, 360);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(180));
        layout();
        assertSame(caption, text());
        assertEquals(before, caption.getText());
        assertEquals(View.VISIBLE, anchor().getVisibility());
    }

    @Test public void refreshingAfterCommentsCloseRecentersInTheHost() throws Exception {
        show(CAPTION, "en");
        CaptionUiGeometryFixture.bounds = new Rect(0, 0, WIDTH, HEIGHT);
        CaptionOverlay.refreshSurface();
        layout();
        assertCenter(WIDTH / 2f);
        assertTrue(anchor().getY() + anchor().getHeight() <= HEIGHT);
    }
}
