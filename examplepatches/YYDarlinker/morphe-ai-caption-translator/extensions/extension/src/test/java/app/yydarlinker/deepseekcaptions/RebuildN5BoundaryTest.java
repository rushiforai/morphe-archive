package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.util.List;
import org.junit.Test;

/** Frozen word/time replay for the two cross-request clauses. */
public class RebuildN5BoundaryTest {
  private static RebuildPlanner.Block containing(List<RebuildPlanner.Block> blocks, int word) {
    for (RebuildPlanner.Block b : blocks) if (b.from <= word && word <= b.to) return b;
    throw new AssertionError("missing source word " + word);
  }

  @Test public void rhetoricalQuestionAndIfStayInOneOwnedRequest() throws Exception {
    RebuildSource source = RebuildR26Test.source(RebuildR26Test.fixture());
    assertEquals("after all who cares how many nuclear aircraft carriers or stealth bombers the americans have if ivan's got 10 000 t-62s rusting in siberia somewhere",
        source.text(73, 97));
    List<RebuildPlanner.Block> blocks = RebuildPlanner.plan(source);
    RebuildPlanner.Block question = containing(blocks, 73);
    assertEquals("A04 request ends after the conditional completes", 97, question.to);
    assertEquals("A04 block start stays put", 25, question.from);
    assertTrue(question.end - question.start <= RebuildPlanner.MAX_SPAN);
  }

  @Test public void missileRangeAndTaiwanStayInOneOwnedRequest() throws Exception {
    RebuildSource source = RebuildR26Test.source(RebuildR26Test.fixture());
    assertEquals("come 2017 surface-to-air missiles based on mainland china could range out over taiwan itself",
        source.text(383, 396));
    List<RebuildPlanner.Block> blocks = RebuildPlanner.plan(source);
    RebuildPlanner.Block missile = containing(blocks, 383);
    assertEquals("A08 starts at the new 2017 proposition", 383, missile.from);
    assertTrue("A08 range out split at " + missile.to, missile.to >= 396);
    assertTrue(missile.end - missile.start <= RebuildPlanner.MAX_SPAN);
  }

  @Test public void movedCutsRetainGlobalOwnershipAndNearbyCases() throws Exception {
    RebuildSource source = RebuildR26Test.source(RebuildR26Test.fixture());
    List<RebuildPlanner.Block> blocks = RebuildPlanner.plan(source);
    int next = 0;
    for (RebuildPlanner.Block b : blocks) {
      assertEquals(next, b.from);
      assertTrue(b.to - b.from + 1 <= RebuildPlanner.MAX_WORDS);
      assertTrue(b.end - b.start <= RebuildPlanner.MAX_SPAN);
      assertTrue(source.text(b.from, b.to).length() <= RebuildPlanner.MAX_CHARS);
      next = b.to + 1;
    }
    assertEquals(source.words.size(), next);
    assertEquals("No extra requests for this captured playback", 31, blocks.size());
    assertEquals("A07 request boundary stays put", 313, containing(blocks, 243).to);
    assertEquals("A11 short-page boundary stays put", 628, containing(blocks, 622).to);
    assertEquals("A12 next request boundary stays put", 629, containing(blocks, 629).from);
  }
}
