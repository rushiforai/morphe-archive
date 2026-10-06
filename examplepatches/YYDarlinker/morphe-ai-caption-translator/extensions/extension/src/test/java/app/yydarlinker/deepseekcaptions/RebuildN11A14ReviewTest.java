package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

/** Frozen A14 subject ownership and failed repair, without a network request. */
public class RebuildN11A14ReviewTest {
  private static final String SOURCE = "foreign investment and the explosive economic growth that would follow deng reduced the share of gdp that was focused on the pla";

  @Test public void acceptedA14TranslationRemainsSemanticallyBlocked() {
    RebuildSource source = RebuildContractTest.source(SOURCE, 323);
    RebuildPlanner.Block block = RebuildContractTest.block(source);
    RebuildProtocol.Event event = new RebuildProtocol.Event(0, 21, 384639, 391744,
        "外资以及邓之后爆发的经济增长，降低了GDP中用于解放军的份额");
    List<RebuildReview.Issue> issues = RebuildReview.inspect(source, block,
        Collections.singletonList(event));
    assertEquals(1, RebuildReview.score(issues));
    assertEquals("possible_subject_attachment", issues.get(0).code);
    RebuildProtocol.Plan accepted = new RebuildProtocol.Plan(
        Collections.singletonList(event), "{}", issues);
    assertTrue(RebuildReview.semanticBlocked(accepted, event));
    assertTrue(RebuildReview.blocked(accepted, event));
    assertSame(event, accepted.at(384647));
    assertNull(accepted.at(391744));
  }

  @Test public void repairCannotEscapeByCuttingBetweenDengAndReduced() {
    RebuildSource source = RebuildContractTest.source(SOURCE, 323);
    RebuildPlanner.Block block = RebuildContractTest.block(source);
    RebuildProtocol.Event original = new RebuildProtocol.Event(0, 21, 384639, 391744,
        "外资以及邓之后爆发的经济增长，降低了GDP中用于解放军的份额");
    RebuildProtocol.Plan previous = new RebuildProtocol.Plan(
        Collections.singletonList(original), "{}",
        RebuildReview.inspect(source, block, Collections.singletonList(original)));
    assertEquals("deng", source.words.get(10).key);
    assertEquals("reduced", source.words.get(11).key);
    assertTrue(RebuildPlanner.protectedCut(source, 10));

    RebuildProtocol.Event first = new RebuildProtocol.Event(0, 10, 384639, 388000,
        "外国投资以及邓小平之后将随之而来的经济爆发式增长，");
    RebuildProtocol.Event second = new RebuildProtocol.Event(11, 21, 388000, 391744,
        "降低了GDP中用于解放军的份额，");
    List<RebuildProtocol.Event> events = Arrays.asList(first, second);
    List<RebuildReview.Issue> risks = RebuildReview.inspect(source, block, events);
    assertEquals(1, RebuildReview.score(risks));
    assertEquals("dependent_boundary", risks.get(0).code);
    RebuildProtocol.Plan candidate = new RebuildProtocol.Plan(events, "{}", risks);
    assertSame(previous, RebuildReview.prefer(previous, candidate));
    assertTrue(RebuildReview.shouldRepair(previous, 2, 1, 384647, 391744));
    assertFalse(RebuildReview.shouldRepair(previous, 3, 2, 384647, 391744));
  }
}
