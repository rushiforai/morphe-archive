package app.yydarlinker.aicaptions.overlay;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import org.junit.Test;
import org.robolectric.Robolectric;
import org.robolectric.Shadows;

public class CaptionViewportContractTest extends CaptionViewportFixture {
    @Test public void detailCaptionCentersOnAnOffsetVideo() throws Exception {
        show("Short caption", "en");
        assertCenter(560);
    }

    @Test public void fullscreenCaptionCentersOnVideoAfterAViewportChange() throws Exception {
        CaptionUiGeometryFixture.bounds = new Rect(163, 10, 1196, 600);
        CaptionOverlay.setPlayerType("WATCH_WHILE_FULLSCREEN");
        show("Texto breve", "es");
        assertCenter(679.5f);
    }

    @Test public void arabicTextAndRtlHostStillUseThePhysicalVideoCenter() throws Exception {
        host.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        TextView text = show("في 2026 العدد 42 و API 3.5!", "ar");
        assertEquals(View.TEXT_DIRECTION_RTL, text.getTextDirection());
        assertCenter(560);
    }

    @Test public void ltrTargetInRtlHostKeepsMixedTextAndPhysicalCenter() throws Exception {
        host.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
        TextView text = show("API 3.5, 42 videos — مرحبا!", "en");
        assertEquals(View.TEXT_DIRECTION_LTR, text.getTextDirection());
        assertTrue(text.getText().toString().contains("3.5"));
        assertCenter(560);
    }

    @Test public void shortCaptionUsesAnIndependentBoxInsideTheViewport() throws Exception {
        show("Hello", "en");
        assertTrue(anchor().getWidth() > 0);
        assertTrue(anchor().getWidth() <= CaptionUiGeometryFixture.bounds.width());
        assertNotSame(host, anchor());
        assertCenter(560);
    }

    @Test public void longCaptionStaysInsideTheVideoAndUsesAtMostTwoLines() throws Exception {
        TextView text = show("Subtitles remain centered in the video. ".repeat(16), "en");
        assertTrue(text.getLineCount() <= 2);
        assertTrue(anchor().getX() >= CaptionUiGeometryFixture.bounds.left);
        assertTrue(anchor().getX() + anchor().getWidth() <= CaptionUiGeometryFixture.bounds.right);
        assertCenter(560);
    }

    @Test public void oneLineCaptionDoesNotRetainTheHeightOfTwoLines() throws Exception {
        TextView two = show("First line\nSecond line", "en");
        assertEquals(2, two.getLineCount());
        int height = anchor().getHeight();
        TextView one = show("Hello", "en");
        assertEquals(1, one.getLineCount());
        assertTrue(anchor().getHeight() < height);
    }

    @Test public void captionBoxDrawsItsOwnRoundedBackground() throws Exception {
        TextView text = show("Caption", "en");
        Bitmap bitmap = Bitmap.createBitmap(text.getWidth(), text.getHeight(), Bitmap.Config.ARGB_8888);
        text.draw(new Canvas(bitmap));
        assertEquals(0, Color.alpha(bitmap.getPixel(0, 0)));
        assertTrue(Color.alpha(bitmap.getPixel(bitmap.getWidth() / 2, bitmap.getHeight() - 2)) > 0);
    }

    @Test public void clearHidesOnlyTheIndependentCaptionBox() throws Exception {
        TextView caption = show("Caption", "en");
        View playerContent = new View(activity);
        host.addView(playerContent, new FrameLayout.LayoutParams(200, 100));
        CaptionOverlay.clear();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertFalse(caption.isShown());
        assertEquals(View.VISIBLE, playerContent.getVisibility());
        assertSame(host, playerContent.getParent());
    }

    @Test public void replacingTheActivityRebindsToItsOwnCaptionBox() throws Exception {
        TextView old = show("Before replacement", "en");
        Activity previous = activity;
        try {
            attach(Robolectric.buildActivity(Activity.class).setup().visible().get());
            TextView replacement = show("After replacement", "en");
            assertNotSame(old, replacement);
            assertFalse(old.isShown());
            assertTrue(replacement.isShown());
        } finally {
            previous.finish();
        }
    }
}
