package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.function.Predicate;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/** All observed first pages of two-page events in the 230749 device diagnostic. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class RebuildN17aDevicePagingReplayTest {
  private static int lines(String value, int width) {
    TextPaint paint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    paint.setTypeface(Typeface.DEFAULT);
    // Fixed replay proxy: 24 CJK columns, as in the N15r offline replay.
    paint.setTextSize(width / 24f);
    return StaticLayout.Builder.obtain(value, 0, value.length(), paint, width)
        .setIncludePad(false).setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED)
        .setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE).build().getLineCount();
  }

  @Test public void everyObservedTwoPageEventAvoidsShortNewPages() throws Exception {
    String source;
    try (InputStream in = getClass().getResourceAsStream("/r29/device-230749-two-page-events.json")) {
      assertNotNull(in);
      source = new String(in.readAllBytes(), StandardCharsets.UTF_8);
    }
    JSONObject fixture = new JSONObject(source);
    assertEquals("7d8ba59f053c2c848c47db6d76d87031ae1c25138548c2cb303d55e73f7d8965",
        fixture.getString("source_sha256"));
    JSONArray events = fixture.getJSONArray("events");
    assertEquals(45, fixture.getInt("event_count"));
    assertEquals(45, events.length());
    boolean sawA16 = false, sawA17Paging = false;
    for (int i = 0; i < events.length(); i++) {
      JSONObject event = events.getJSONObject(i);
      String original = event.getString("text");
      assertEquals(original, event.getString("old_page_1_text")
          + event.getString("old_page_2_text"));
      int width = event.getInt("width");
      Predicate<String> two = value -> lines(value, width) <= 2;
      Predicate<String> one = value -> lines(value, width) <= 1;
      long start = event.getLong("start"), end = event.getLong("end");
      List<RebuildPageLayout.Page> pages = RebuildPageLayout.plan(original, start, end, two, one);
      String label = event.getString("id") + " diagnostic L" + event.getInt("diagnostic_line_1");
      assertFalse(label, pages.isEmpty());
      if (label.contains("268-313")) {
        sawA16 = true;
        assertEquals(8, RebuildPageLayout.displayHalfCells(event.getString("old_page_1_text")));
      }
      if (label.contains("383-396")) {
        sawA17Paging = true;
        assertEquals(12, RebuildPageLayout.displayHalfCells(event.getString("old_page_1_text")));
      }
      StringBuilder joined = new StringBuilder();
      long at = start;
      for (RebuildPageLayout.Page page : pages) {
        if (RebuildPageLayout.displayHalfCells(original) >= 16)
          assertTrue(label + " short page " + page.text,
              RebuildPageLayout.displayHalfCells(page.text) >= 16);
        assertTrue(label + " >2 lines", two.test(page.text));
        assertTrue(label + " <1.2s", page.end - page.start >= 1200);
        assertTrue(label + " >8 CPS", page.text.codePointCount(0, page.text.length()) * 1000L
            <= 8L * (page.end - page.start));
        assertEquals(at, page.start);
        joined.append(page.text);
        at = page.end;
      }
      assertEquals(end, at);
      assertEquals(original, joined.toString());
    }
    assertTrue(sawA16);
    assertTrue(sawA17Paging);
  }
}
