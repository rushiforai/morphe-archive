package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;

/** Frozen A07 timing and accepted-content display policy. */
public class RebuildA07VisibilityTest {
  private static final String A07_TEXT =
      "然而，你会发现，有些人对俄罗斯每年胜利日阅兵时驾驶四辆T-14“阿玛塔”坦克驶过红场的印象，比对中国从无到有建造航母舰队的印象更深。";

  @Test
  public void acceptedA07ParagraphCanDisplayAtItsOwnedStart() {
    RebuildProtocol.Event event = new RebuildProtocol.Event(243, 280, 76092, 88640, A07_TEXT);
    RebuildProtocol.Plan accepted = new RebuildProtocol.Plan(
        Collections.singletonList(event), "{}", Arrays.asList(
            new RebuildReview.Issue(243, 280, "paragraph", "presentation advisory", true),
            new RebuildReview.Issue(243, 280, "dense_long_event_watch", "readability watch", false)));

    assertEquals(66, A07_TEXT.codePointCount(0, A07_TEXT.length()));
    assertEquals(12548, event.end - event.start);
    assertTrue("request 8 was accepted before A07 began", 70345 < event.start);
    assertNull(accepted.at(70345));
    assertSame(event, accepted.at(76106));
    assertFalse("an accepted paragraph advisory must not hide the whole event",
        RebuildReview.blocked(accepted, event));
    assertFalse("the onset is readable under the unchanged late gate",
        RebuildController.lateUnreadable(event, 76106));
    assertFalse("the frozen second attempt must not buy another request",
        RebuildReview.shouldRepair(accepted, 2, 1, 70345, 99736));
    assertTrue("the 983 ms tail alone remains too late for a first display",
        RebuildController.lateUnreadable(event, 87657));
    assertNull("source ownership must end at 88640 ms", accepted.at(88640));
  }

  @Test
  public void semanticRisksStillBlockButMeasuredOverflowIsAdvisory() {
    RebuildProtocol.Event event = new RebuildProtocol.Event(243, 280, 76092, 88640, A07_TEXT);
    for (String code : new String[] {
        "possible_polarity_change", "possible_arithmetic_misread",
        "possible_subject_attachment"}) {
      RebuildProtocol.Plan accepted = new RebuildProtocol.Plan(
          Collections.singletonList(event), "{}", Collections.singletonList(
              new RebuildReview.Issue(243, 280, code, "hard display risk", true)));
      assertTrue(code, RebuildReview.blocked(accepted, event));
    }
    RebuildProtocol.Plan layout=new RebuildProtocol.Plan(Collections.singletonList(event),"{}",Collections.singletonList(
        new RebuildReview.Issue(243,280,"layout_overflow","display observation",false)));
    assertFalse(RebuildReview.blocked(layout,event));assertEquals(0,RebuildReview.score(layout.issues));
  }
}
