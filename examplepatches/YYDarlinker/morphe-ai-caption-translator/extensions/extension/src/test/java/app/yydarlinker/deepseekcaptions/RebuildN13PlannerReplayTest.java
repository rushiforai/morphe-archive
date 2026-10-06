package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

/** Full frozen-source cut replay. Set MORPHE_N13_PLANNER_EXPORT to save the report. */
public class RebuildN13PlannerReplayTest {
  // Captured with the checked-in pre-N13 planner from the frozen 9,684-word source.
  private static final int[] BASELINE_TO = {
      24, 97, 180, 242, 313, 382, 474, 571, 628, 686, 776, 850, 899, 956, 1042, 1118,
      1218, 1299, 1371, 1449, 1519, 1609, 1687, 1760, 1857, 1946, 2026, 2087, 2176,
      2261, 2326, 2423, 2488, 2550, 2618, 2702, 2774, 2860, 2918, 3005, 3103, 3196,
      3206, 3299, 3352, 3417, 3507, 3564, 3633, 3708, 3793, 3856, 3947, 4023, 4106,
      4186, 4273, 4360, 4445, 4535, 4622, 4709, 4789, 4873, 4956, 5056, 5139, 5205,
      5278, 5358, 5436, 5486, 5536, 5610, 5687, 5773, 5860, 5963, 6057, 6149, 6231,
      6323, 6395, 6472, 6552, 6628, 6725, 6798, 6840, 6928, 7013, 7087, 7182, 7258,
      7328, 7392, 7480, 7540, 7618, 7688, 7787, 7866, 7963, 8054, 8103, 8194, 8280,
      8379, 8452, 8560, 8648, 8733, 8822, 8892, 8964, 9037, 9114, 9196, 9223, 9299,
      9399, 9497, 9608, 9683};
  // Only these 30 identities appeared in the frozen N11 diagnostic. Its other 97 cuts were not logged.
  private static final int[][] FROZEN_OBSERVED_TO = {
      {0,24}, {1,97}, {2,180}, {3,242}, {4,313}, {5,382}, {6,474}, {7,571},
      {8,628}, {9,686}, {10,776}, {11,850}, {12,899}, {13,956}, {14,1042},
      {15,1118}, {16,1218}, {17,1299}, {18,1371}, {19,1449}, {20,1519},
      {21,1609}, {22,1687}, {23,1760}, {24,1857}, {25,1946}, {26,2020},
      {48,3633}, {49,3708}, {50,3793}};

  @Test public void replayFullFrozenSourceAndReportCutDrift() throws Exception {
    RebuildSource source = RebuildR28CapturedTest.source();
    assertEquals("frozen source word count", 9684, source.words.size());
    assertEquals("follow", source.words.get(1228).text);
    assertEquals("deng", source.words.get(1229).text);
    assertEquals("reduced", source.words.get(1230).text);

    List<RebuildPlanner.Block> blocks = RebuildPlanner.plan(source);
    assertTrue("planner must return at least one block", !blocks.isEmpty());
    JSONArray blockRows = new JSONArray(), changes = new JSONArray(), observedMismatch = new JSONArray();
    List<Integer> actualTo = new ArrayList<>();
    int next = 0;
    for (RebuildPlanner.Block block : blocks) {
      assertEquals("contiguous source ownership", next, block.from);
      assertTrue(block.to >= block.from);
      assertTrue(block.to - block.from < RebuildPlanner.MAX_WORDS);
      assertTrue(block.end - block.start <= RebuildPlanner.MAX_SPAN);
      assertTrue(source.text(block.from, block.to).length() <= RebuildPlanner.MAX_CHARS);
      actualTo.add(block.to);
      blockRows.put(new JSONObject().put("index", block.index).put("from", block.from)
          .put("to", block.to).put("id", block.id()));
      next = block.to + 1;
    }
    assertEquals(9684, next);
    for (int[] observed : FROZEN_OBSERVED_TO) {
      int index = observed[0], frozenTo = observed[1];
      int currentTo = index < blocks.size() ? blocks.get(index).to : -1;
      if (currentTo != frozenTo) observedMismatch.put(new JSONObject()
          .put("index", index).put("frozen_to", frozenTo).put("current_to", currentTo));
    }
    assertEquals("pre-N13 baseline block count", 124, BASELINE_TO.length);
    JSONArray removedCuts = new JSONArray(), addedCuts = new JSONArray();
    for (int i = 0; i < BASELINE_TO.length - 1; i++)
      if (!actualTo.contains(BASELINE_TO[i])) removedCuts.put(BASELINE_TO[i]);
    for (int i = 0; i < actualTo.size() - 1; i++) {
      int cut = actualTo.get(i);
      boolean present = false;
      for (int j = 0; j < BASELINE_TO.length - 1; j++)
        if (BASELINE_TO[j] == cut) { present = true; break; }
      if (!present) addedCuts.put(cut);
    }
    int baselineFrom = 0;
    for (int i = 0; i < BASELINE_TO.length; i++) {
      int baselineTo = BASELINE_TO[i];
      boolean affected = false;
      for (int j = 0; j < removedCuts.length(); j++)
        if (removedCuts.getInt(j) == baselineTo) affected = true;
      for (int j = 0; j < addedCuts.length(); j++) {
        int cut = addedCuts.getInt(j);
        if (baselineFrom <= cut && cut < baselineTo) affected = true;
      }
      if (affected) changes.put(new JSONObject().put("baseline_index", i)
          .put("baseline_from", baselineFrom).put("baseline_to", baselineTo));
      baselineFrom = baselineTo + 1;
    }
    JSONObject report = new JSONObject()
        .put("source", "r28/original.srt plus frozen captured word timings")
        .put("source_words", source.words.size())
        .put("baseline", "checked-in pre-N13 planner on frozen source")
        .put("diagnostic_recorded_block_count", 127)
        .put("diagnostic_full_boundary_list_available", false)
        .put("diagnostic_observed_block_count", FROZEN_OBSERVED_TO.length)
        .put("diagnostic_observed_mismatches", observedMismatch)
        .put("baseline_block_count", BASELINE_TO.length)
        .put("current_block_count", blocks.size())
        .put("shifted_blocks", changes.length())
        .put("shifted_boundary_list", changes)
        .put("removed_baseline_cuts", removedCuts)
        .put("added_current_cuts", addedCuts)
        .put("current_blocks", blockRows);
    String export = System.getenv("MORPHE_N13_PLANNER_EXPORT");
    if (export != null && !export.isBlank()) {
      Path target = Path.of(export).toAbsolutePath();
      if (target.getParent() != null) Files.createDirectories(target.getParent());
      Files.write(target, (report.toString(2) + "\n").getBytes(StandardCharsets.UTF_8));
      System.out.println("N13_PLANNER_STABILITY=" + target);
    }
    assertTrue("N13 stop line: more than five planner blocks shifted: " + changes,
        changes.length() <= 5);
  }
}
