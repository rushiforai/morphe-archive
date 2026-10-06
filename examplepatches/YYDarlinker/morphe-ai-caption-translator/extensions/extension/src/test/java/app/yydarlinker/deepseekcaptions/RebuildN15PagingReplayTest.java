package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.*;
import java.util.function.Predicate;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import org.json.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

/** Offline replay on fixed N13 word ownership and captured accepted Chinese events. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class RebuildN15PagingReplayTest {
  static final int HISTORICAL_WIDTH=1121;
  static final int WIDTH=System.getenv("MORPHE_N15_WIDTH_PX")==null
      ? HISTORICAL_WIDTH : Integer.parseInt(System.getenv("MORPHE_N15_WIDTH_PX"));
  static final float HISTORICAL_EM_PX=System.getenv("MORPHE_N15_FONT_PX")==null
      ? HISTORICAL_WIDTH/24f : Float.parseFloat(System.getenv("MORPHE_N15_FONT_PX"));
  static final Float GLYPH_HEIGHT_PX=System.getenv("MORPHE_N15_GLYPH_HEIGHT_PX")==null
      ? null : Float.parseFloat(System.getenv("MORPHE_N15_GLYPH_HEIGHT_PX"));

  static TextPaint replayPaint() {
    assertTrue("proxy viewport must have a positive width", WIDTH>0);
    TextPaint paint=new TextPaint(Paint.ANTI_ALIAS_FLAG);
    paint.setTypeface(Typeface.DEFAULT);
    // FONT_PX remains the historical em proxy. A glyph target uses the runtime font solver.
    float textSize=GLYPH_HEIGHT_PX==null ? HISTORICAL_EM_PX
        : SubtitleStyleMetrics.textSizePxForGlyphHeight(paint,GLYPH_HEIGHT_PX);
    assertTrue("proxy text size must be finite and positive",
        Float.isFinite(textSize) && textSize>0);
    if(GLYPH_HEIGHT_PX!=null)
      assertTrue("proxy glyph target must be finite and positive",
          Float.isFinite(GLYPH_HEIGHT_PX) && GLYPH_HEIGHT_PX>0);
    paint.setTextSize(textSize);
    return paint;
  }

  static int lines(String value,TextPaint paint) {
    return StaticLayout.Builder.obtain(value,0,value.length(),paint,WIDTH)
        .setIncludePad(false).setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED)
        .setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE).build().getLineCount();
  }
  @Test public void replayCapturedEvents() throws Exception {
    String output=System.getenv("MORPHE_N15_LAYOUT_EXPORT");
    TextPaint paint=replayPaint();

    String corpus;
    try(InputStream in=getClass().getResourceAsStream("/r29/captured-events.json")) {
      assertNotNull(in); corpus=new String(in.readAllBytes(),StandardCharsets.UTF_8);
    }
    JSONObject root=new JSONObject(corpus);
    JSONArray result=new JSONArray(),blankFailureDisplays=new JSONArray(),blocks=root.getJSONArray("blocks");
    JSONArray words=root.getJSONArray("source_word_times");
    assertEquals(9684,words.length());
    assertEquals(124,blocks.length());
    assertEquals("d841cf104e07cb2330f3143c538981979f8ba062dc6582c322f6dc8460ad0379",
        root.getString("prompt_sha256"));
    Predicate<String> fitsTwo=s->lines(s,paint)<=2;
    Predicate<String> fitsOne=s->lines(s,paint)<=1;
    int count=0, nextWord=0, chineseWords=0, fallbackWords=0;
    for(int i=0;i<blocks.length();i++) {
      JSONObject block=blocks.getJSONObject(i);
      assertEquals("contiguous N13 block ownership",nextWord,block.getInt("from"));
      JSONArray owned=block.getJSONArray("owned_tokens");
      assertEquals(block.getInt("to")-nextWord+1,owned.length());
      for(int k=0;k<owned.length();k++) {
        JSONArray token=owned.getJSONArray(k), word=words.getJSONArray(nextWord+k);
        assertEquals(nextWord+k,token.getInt(0));
        assertEquals(nextWord+k,word.getInt(0));
        assertEquals(token.getString(1),word.getString(1));
      }
      nextWord=block.getInt("to")+1;
      if(!"accepted".equals(block.getString("status"))) {
        assertEquals("documented failed source ownership", "final-fail",block.getString("status"));
        JSONArray fallback=block.getJSONArray("fallback_events");
        int cursor=block.getInt("from");
        for(int cue=0;cue<fallback.length();cue++) {
          JSONObject part=fallback.getJSONObject(cue);
          assertEquals("cue provenance covers each failed word once",cursor,part.getInt("from"));
          assertTrue(part.getInt("to")>=cursor && part.getInt("to")<=block.getInt("to"));
          assertEquals(words.getJSONArray(cursor).getInt(2),part.getLong("start"));
          assertEquals(words.getJSONArray(part.getInt("to")).getInt(3),part.getLong("end"));
          for(int word=cursor;word<=part.getInt("to");word++)
            assertEquals(part.getInt("source_cue_id"),words.getJSONArray(word).getInt(4));
          // N20 projects final failures as blank without changing the frozen source provenance.
          blankFailureDisplays.put(new JSONObject().put("block",i)
              .put("from",part.getInt("from")).put("to",part.getInt("to"))
              .put("source_cue_id",part.getInt("source_cue_id"))
              .put("start",part.getLong("start")).put("end",part.getLong("end"))
              .put("mode","caption").put("reason","failed").put("text",""));
          cursor=part.getInt("to")+1;
        }
        assertEquals(block.getInt("to")+1,cursor);
        fallbackWords+=owned.length();
        continue;
      }
      chineseWords+=owned.length();
      JSONArray events=block.getJSONArray("events");
      for(int j=0;j<events.length();j++) {
        JSONObject e=events.getJSONObject(j);
        String text=e.getString("text");
        if(text.isEmpty())continue;
        long start=e.getLong("start"),end=e.getLong("end");
        List<RebuildPageLayout.Page> pages=RebuildPageLayout.plan(text,start,end,fitsTwo,fitsOne);
        assertFalse("N15r accepted event must remain displayable: "
            +e.getInt("from")+"-"+e.getInt("to"),pages.isEmpty());
        JSONObject row=new JSONObject().put("block",i).put("from",e.getInt("from"))
            .put("to",e.getInt("to")).put("start",start).put("end",end)
            .put("text",text).put("event_lines",lines(text,paint))
            .put("display_half_cells",RebuildPageLayout.displayHalfCells(text));
        JSONArray outputPages=new JSONArray();
        for(RebuildPageLayout.Page page:pages)
          outputPages.put(new JSONObject().put("text",page.text).put("start",page.start)
              .put("end",page.end).put("lines",lines(page.text,paint))
              .put("display_half_cells",RebuildPageLayout.displayHalfCells(page.text))
              .put("code_points",page.text.codePointCount(0,page.text.length())));
        // Every translated page is bounded by its original event, even when a style goal loses.
        if (!pages.isEmpty()) {
          StringBuilder joined=new StringBuilder();
          long at=start;
          for(RebuildPageLayout.Page page:pages) {
            if (RebuildPageLayout.displayHalfCells(text)>=16)
              assertTrue("no page below eight CJK display cells: "
                  +e.getInt("from")+"-"+e.getInt("to"),
                  RebuildPageLayout.displayHalfCells(page.text)>=16);
            assertEquals(at,page.start);
            assertTrue(page.end>page.start);
            assertTrue(page.end-page.start>=RebuildPageLayout.MIN_PAGE_MS ||
                end-start<RebuildPageLayout.MIN_PAGE_MS && pages.size()==1);
            assertTrue(page.text.codePointCount(0,page.text.length())*1000L
                <=RebuildPageLayout.MAX_CPS*(page.end-page.start));
            assertTrue(lines(page.text,paint)<=2);
            joined.append(page.text);
            at=page.end;
          }
          assertEquals(end,at);
          assertEquals(text,joined.toString());
          assertTrue(pages.size()*RebuildPageLayout.MIN_PAGE_MS<=end-start ||
              end-start<RebuildPageLayout.MIN_PAGE_MS && pages.size()==1);
        }
        row.put("pages",outputPages).put("fallback",pages.isEmpty());
        result.put(row);count++;
      }
    }
    if(output!=null) {
      Path file=Path.of(output);
      if(file.getParent()!=null)Files.createDirectories(file.getParent());
      Paint.FontMetrics metrics=paint.getFontMetrics();
      JSONObject constraints=new JSONObject().put("max_lines",2)
          .put("minimum_page_ms",RebuildPageLayout.MIN_PAGE_MS)
          .put("max_cps",RebuildPageLayout.MAX_CPS).put("minimum_display_half_cells",16);
      Files.write(file,(new JSONObject().put("events",result)
        .put("event_count",count).put("test_lines_100_han",lines(String.join("",Collections.nCopies(100,"中")),paint))
        .put("viewport_width_px",WIDTH)
        .put("preferred_font_px",paint.getTextSize())
        .put("text_size_em_px",paint.getTextSize())
        .put("glyph_height_target_px",GLYPH_HEIGHT_PX==null ? JSONObject.NULL : GLYPH_HEIGHT_PX)
        .put("glyph_height_measured_px",SubtitleStyleMetrics.measuredGlyphHeightPx(paint))
        .put("font_metrics_height_px",SubtitleStyleMetrics.fontMetricsHeightPx(paint))
        .put("font_metrics_top_bottom_px",metrics.bottom-metrics.top)
        .put("font_input_unit",GLYPH_HEIGHT_PX==null ? "historical_em_px" : "glyph_height_px")
        .put("glyph_measurement","mean getTextBounds height of 经 and 频; runtime solver")
        .put("corpus_sha256",HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256")
            .digest(corpus.getBytes(StandardCharsets.UTF_8))))
        .put("prompt_sha256",root.getString("prompt_sha256"))
        .put("accepted_chinese_word_ids",chineseWords)
        .put("documented_original_fallback_word_ids",fallbackWords)
        .put("current_failure_blank_word_ids",fallbackWords)
        .put("current_failure_displays",blankFailureDisplays)
        .put("hard_constraints",constraints).put("api_calls",0).put("api_tokens",0)
        .put("measurement","Robolectric SDK28 StaticLayout proxy; not a phone measurement")
        .toString(2)+"\n").getBytes(StandardCharsets.UTF_8));
    }
    assertEquals(9684,nextWord);
    assertEquals(9576,chineseWords);
    assertEquals(108,fallbackWords);
    int blankWords=0;
    for(int i=0;i<blankFailureDisplays.length();i++) {
      JSONObject blank=blankFailureDisplays.getJSONObject(i);
      assertEquals("",blank.getString("text"));
      assertEquals("caption",blank.getString("mode"));
      assertEquals(words.getJSONArray(blank.getInt("from")).getLong(2),blank.getLong("start"));
      assertEquals(words.getJSONArray(blank.getInt("to")).getLong(3),blank.getLong("end"));
      blankWords+=blank.getInt("to")-blank.getInt("from")+1;
    }
    assertEquals("all historical failure word ownership now projects to blank",108,blankWords);
    assertEquals("captured accepted Chinese events",540,count);
    assertTrue("StaticLayout native graphics must actually wrap",
        lines(String.join("",Collections.nCopies(100,"中")),paint)>=(GLYPH_HEIGHT_PX==null ? 5 : 3));
  }
}
