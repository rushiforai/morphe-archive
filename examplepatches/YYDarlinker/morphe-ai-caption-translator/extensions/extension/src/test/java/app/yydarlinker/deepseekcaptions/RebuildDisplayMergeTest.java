package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class RebuildDisplayMergeTest {
  private static RebuildSource source() {
    List<RebuildSource.Word> words = new ArrayList<>();
    for (int i = 0; i <= 641; i++)
      words.add(new RebuildSource.Word("w" + i, i * 10L, i * 10L + 10, 0,
          RebuildSource.Precision.ESTIMATED));
    return new RebuildSource(words);
  }

  @Test
  public void a11LeadRemainsIndependentAndMayOfferOnlyAnOptionalUnionCandidate() {
    RebuildSource source = source();
    RebuildProtocol.Event lead =
        new RebuildProtocol.Event(622, 628, 194800, 196620, "我要问的问题是");
    RebuildProtocol.Event question =
        new RebuildProtocol.Event(629, 637, 196620, 198806, "预算是否全面？有没有遗漏？");

    assertTrue(RebuildDisplayMerge.isLead(lead));
    assertFalse(RebuildDisplayMerge.shouldDeferLead(source, lead, question, 196619));
    RebuildDisplayMerge.Merged merged = RebuildDisplayMerge.merge(source, lead, question);
    assertNotNull(merged);
    assertEquals(622, merged.from);
    assertEquals(637, merged.to);
    assertEquals(194800, merged.start);
    assertEquals(198806, merged.end);
    assertEquals("我要问的问题是预算是否全面？有没有遗漏？", merged.text);
    assertTrue(merged.cps() <= RebuildDisplayMerge.MAX_CPS);
    assertEquals(198806, question.end);
  }

  @Test
  public void a12ShortTailJoinsPreviousQuestionWithoutBorrowingFollowingTime() {
    RebuildSource source = source();
    RebuildProtocol.Event question =
        new RebuildProtocol.Event(629, 637, 196620, 198806, "预算是否全面？有没有遗漏？");
    RebuildProtocol.Event shortTail =
        new RebuildProtocol.Event(638, 641, 198806, 199692, "有没有应该纳入的内容？");

    assertTrue(RebuildDisplayMerge.isShort(shortTail));
    RebuildDisplayMerge.Merged merged = RebuildDisplayMerge.merge(source, question, shortTail);
    assertNotNull(merged);
    assertEquals(629, merged.from);
    assertEquals(641, merged.to);
    assertEquals(196620, merged.start);
    assertEquals(199692, merged.end);
    assertEquals("预算是否全面？有没有遗漏？有没有应该纳入的内容？", merged.text);
    assertTrue(merged.cps() <= RebuildDisplayMerge.MAX_CPS);
    assertEquals(shortTail.end, merged.end);
  }

  @Test
  public void longA06OrA10LikeWindowIsNotMergedWithAShortNeighbor() {
    RebuildSource source = source();
    RebuildProtocol.Event longEvent =
        new RebuildProtocol.Event(527, 556, 165680, 173023,
            "第一，中国的国防预算实际上比你以为的更大；这不是因为他们想隐瞒，而是因为会计标准不同，以及纳入和排除的项目不同。");
    RebuildProtocol.Event shortNeighbor =
        new RebuildProtocol.Event(557, 558, 173023, 173523, "下一句？");

    assertNull(RebuildDisplayMerge.merge(source, longEvent, shortNeighbor));
  }
}
