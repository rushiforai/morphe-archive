package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.List;
import java.util.function.Predicate;
import org.junit.Test;

/** Frozen A10/A06 presentation scenarios; page capacity is injected, not remeasured offline. */
public class RebuildN3PaginationTest {
  private static final String A10 =
      "第一，中国的国防预算实际上比你以为的更大；这不是因为他们想隐瞒，而是因为会计标准不同，以及纳入和排除的项目不同。";
  private static final String A06 =
      "这就让人不禁要问：如果中国国防开支如此之少，那么这些隐形战斗机、航空母舰、高超音速导弹和反舰弹道导弹都从何而来？";

  @Test
  public void a10CapturedNarrowOverflowPagesWithinItsOwnWindow() {
    // Captured width=1121, sp=12.0, lines=3. The predicate stands in for a
    // two-line Android capacity measurement; it does not infer new font facts.
    Predicate<String> twoLineCapacity = text -> text.codePointCount(0, text.length()) <= 36;
    assertEquals(56, A10.codePointCount(0, A10.length()));
    assertFalse(twoLineCapacity.test(A10));

    List<RebuildPageLayout.Page> pages =
        RebuildPageLayout.plan(A10, 165680, 173023, twoLineCapacity);

    assertPages(pages, A10, 165680, 173023, twoLineCapacity);
    assertEquals("prefer four clause-sized pages inside A10 own window", 4, pages.size());
  }

  @Test
  public void a06UsesNormalSameWidthFontCapacityWithoutShrinking() {
    // Captured width=2025: A06 displayed at 20.4sp while normal pages used
    // 21.4sp. Inject capacity at the normal font, so a full-page fit is false.
    Predicate<String> normalFontTwoLineCapacity =
        text -> text.codePointCount(0, text.length()) <= 38;
    assertEquals(56, A06.codePointCount(0, A06.length()));
    assertFalse(normalFontTwoLineCapacity.test(A06));

    List<RebuildPageLayout.Page> pages =
        RebuildPageLayout.plan(A06, 65002, 76092, normalFontTwoLineCapacity);

    assertPages(pages, A06, 65002, 76092, normalFontTwoLineCapacity);
    assertEquals("the semantic seams now permit three shorter pages", 3, pages.size());
  }

  @Test
  public void pageCapAndReadableTimeFailClosedWithoutChangingText() {
    Predicate<String> tenCharacters = text -> text.codePointCount(0, text.length()) <= 10;
    String sixty = String.join("", java.util.Collections.nCopies(60, "字"));
    assertEquals(6, RebuildPageLayout.plan(sixty, 0, 10000, tenCharacters).size());
    assertTrue("insufficient owned time still fails closed",
        RebuildPageLayout.plan(sixty, 0, 5000, tenCharacters).isEmpty());
    assertTrue(RebuildPageLayout.plan(A10, 165680, 167180,
        text -> text.codePointCount(0, text.length()) <= 36).isEmpty());
    assertEquals("a fitting 886ms complete page is not rejected by a soft rate",
        1,RebuildPageLayout.plan("有没有应该纳入的内容？", 0, 886,
            text -> true).size());
    assertEquals("only the entire short source window can force the time exception",
        1, RebuildPageLayout.plan("短句。", 0, 886, text -> true).size());
  }

  @Test
  public void layoutReviewLeavesPresentationToMeasuredRenderer() {
    RebuildProtocol.Event event = new RebuildProtocol.Event(527, 556, 165680, 173023, A10);
    RebuildProtocol.Plan layoutOnly = new RebuildProtocol.Plan(
        java.util.Collections.singletonList(event), "{}",
        java.util.Collections.singletonList(new RebuildReview.Issue(
            527, 556, "layout_overflow", "old viewport", true)));
    assertFalse(RebuildReview.semanticBlocked(layoutOnly, event));
    RebuildProtocol.Plan semanticRisk = new RebuildProtocol.Plan(
        java.util.Collections.singletonList(event), "{}",
        java.util.Collections.singletonList(new RebuildReview.Issue(
            527, 556, "possible_polarity_change", "review", true)));
    assertTrue(RebuildReview.semanticBlocked(semanticRisk, event));
  }

  private static void assertPages(
      List<RebuildPageLayout.Page> pages,
      String original,
      long ownedStart,
      long ownedEnd,
      Predicate<String> fits) {
    assertNotNull(pages);
    assertTrue("must paginate", pages.size() > 1);
    assertTrue("nominal page cap follows the owned window",
        pages.size() <= (ownedEnd - ownedStart + 1199) / 1200);
    assertTrue("every actual page has a 1.2s slot",
        pages.size() * 1200L <= ownedEnd - ownedStart);
    StringBuilder joined = new StringBuilder();
    long cursor = ownedStart;
    for (RebuildPageLayout.Page page : pages) {
      assertNotNull(page.text);
      assertFalse(page.text.isEmpty());
      assertTrue("each page fits at the injected normal capacity", fits.test(page.text));
      assertEquals("no source time may be skipped or borrowed", cursor, page.start);
      assertTrue("hard readable minimum", page.end - page.start >= 1200);
      assertTrue("hard CPS", page.text.codePointCount(0, page.text.length()) * 1000L
          <= (page.end - page.start) * 8);
      if (page.end != ownedEnd)
        assertTrue("cut only after clause punctuation",
            "，。！？；：,!?;:".indexOf(page.text.codePointBefore(page.text.length())) >= 0);
      assertTrue("page must end inside the owned event", page.end <= ownedEnd);
      joined.append(page.text);
      cursor = page.end;
    }
    assertEquals(ownedEnd, cursor);
    assertEquals("translation is preserved byte-for-byte", original, joined.toString());
  }
}
