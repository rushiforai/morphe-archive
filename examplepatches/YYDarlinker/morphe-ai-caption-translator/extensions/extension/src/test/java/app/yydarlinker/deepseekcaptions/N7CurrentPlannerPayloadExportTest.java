package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

/** Rebuild the bounded live replay input with the current production planner and payload code. */
public class N7CurrentPlannerPayloadExportTest {
  private static final int CAPTURED_WORDS = 687;
  // Frozen 1.3.5 block identities and layout budget. The tracked r26 fixture has
  // source words/times only; it has no display_hint or source_order fields.
  private static final int[][] FROZEN_RANGES = {{0, 24}, {25, 87}, {88, 180}, {181, 242},
      {243, 313}, {314, 392}, {393, 474}, {475, 571}, {572, 628}, {629, 686}};
  private static final int[] FROZEN_PREFERRED_COLUMNS = {26, 26, 27, 27, 27, 27, 27, 27, 27, 26};
  private static final int[] FROZEN_MINIMUM_COLUMNS = {26, 26, 48, 48, 48, 48, 48, 48, 48, 26};
  private static final String DISPLAY_NOTE = "budget at preferred user font; split only at coherent"
      + " source clauses, never summarize; minimum_size_columns is emergency capacity,"
      + " not the target; source IDs determine timing";

  private static String runtimePromptSha256() throws Exception {
    String prompt = RebuildProtocol.PROMPT + RebuildProtocol.FIDELITY_PROMPT
        + " Target language: zh-Hans. User translation preferences: "
        + DeepSeekConfig.DEFAULT_PROMPT;
    byte[] digest = MessageDigest.getInstance("SHA-256")
        .digest(prompt.getBytes(StandardCharsets.UTF_8));
    StringBuilder hex = new StringBuilder(digest.length * 2);
    for (byte value : digest) hex.append(String.format("%02x", value & 0xff));
    return hex.toString();
  }

  @Test public void exportCurrentPlannerPayloadsIfRequested() throws Exception {
    JSONArray captured = RebuildR26Test.fixture();
    RebuildSource full = RebuildR26Test.source(captured);
    assertTrue(full.words.size() > CAPTURED_WORDS);
    RebuildSource source = new RebuildSource(new ArrayList<>(full.words.subList(0, CAPTURED_WORDS)));
    boolean[] observed = new boolean[CAPTURED_WORDS];
    // The tracked r26 fixture supplies the same word/time evidence as the bounded
    // frozen replay, even though its historical request cuts were different.
    for (int i = 0; i < captured.length(); i++) {
      JSONObject row = captured.getJSONObject(i).getJSONObject("source");
      JSONArray tokens = row.getJSONArray("owned_tokens");
      JSONArray times = row.getJSONArray("diagnostic_only_source_times");
      assertEquals(tokens.length(), times.length());
      for (int j = 0; j < tokens.length(); j++) {
        JSONArray token = tokens.getJSONArray(j), timing = times.getJSONArray(j);
        int id = token.getInt(0);
        if (id >= CAPTURED_WORDS) continue;
        RebuildSource.Word word = source.words.get(id);
        assertEquals(id, timing.getInt(0));
        assertEquals(token.getString(1), word.text);
        assertEquals(timing.getLong(1), word.start);
        assertEquals(timing.getLong(2), word.end);
        assertEquals(timing.getInt(3), word.cue);
        observed[id] = true;
      }
    }
    for (int i = 0; i < observed.length; i++) assertTrue("fixture missing source word " + i, observed[i]);

    List<RebuildPlanner.Block> blocks = RebuildPlanner.plan(source);
    assertEquals("bounded 0–686 replay request count", 10, blocks.size());
    int[][] expected = {{0, 24}, {25, 97}, {98, 180}, {181, 242}, {243, 313},
        {314, 382}, {383, 474}, {475, 571}, {572, 628}, {629, 686}};
    JSONArray outputBlocks = new JSONArray(), oldBlocks = new JSONArray();
    int next = 0;
    for (int i = 0; i < blocks.size(); i++) {
      RebuildPlanner.Block block = blocks.get(i);
      assertEquals("contiguous global source ownership", next, block.from);
      assertEquals(expected[i][0], block.from);
      assertEquals(expected[i][1], block.to);
      assertTrue(block.to - block.from + 1 <= RebuildPlanner.MAX_WORDS);
      assertTrue(block.end - block.start <= RebuildPlanner.MAX_SPAN);
      assertTrue(source.text(block.from, block.to).length() <= RebuildPlanner.MAX_CHARS);

      JSONObject payload = RebuildProtocol.payload(source, block, "zh-Hans", null);
      payload.put("source_order", "cue_order_reconstructed");
      payload.put("display_hint", new JSONObject()
          .put("max_lines", 2)
          .put("approx_cjk_columns_per_line", FROZEN_PREFERRED_COLUMNS[i])
          .put("minimum_size_columns_per_line", FROZEN_MINIMUM_COLUMNS[i])
          .put("note", DISPLAY_NOTE));
      assertEquals(block.id(), payload.getString("block"));
      assertEquals(source.text(block.from, block.to), payload.getString("source_text"));
      assertEquals(block.to - block.from + 1, payload.getJSONArray("owned_tokens").length());
      assertEquals(block.end - block.start, payload.getLong("duration_ms"));
      assertEquals("estimated", payload.getString("timing"));
      assertFalse(payload.has("repair"));
      outputBlocks.put(payload);

      oldBlocks.put(new JSONObject().put("block", "b" + i + "_" + FROZEN_RANGES[i][0]
              + "_" + FROZEN_RANGES[i][1])
          .put("from", FROZEN_RANGES[i][0])
          .put("to", FROZEN_RANGES[i][1]));
      next = block.to + 1;
    }
    assertEquals(CAPTURED_WORDS, next);
    assertTrue("A04 question and condition share block 1", blocks.get(1).to >= 97);
    assertTrue("A08 range clause begins in block 6", blocks.get(6).from <= 383);
    assertTrue("A08 range clause stays in block 6", blocks.get(6).to >= 396);

    String export = System.getenv("MORPHE_N7_PAYLOAD_EXPORT");
    if (export != null && !export.isBlank()) {
      Path target = Path.of(export).toAbsolutePath();
      Path parent = target.getParent();
      if (parent != null) Files.createDirectories(parent);
      JSONObject artifact = new JSONObject()
          .put("layer", "current_planner_payloads_for_bounded_live_replay")
          .put("source_ids", new JSONArray().put(0).put(CAPTURED_WORDS - 1))
          .put("block_count", blocks.size())
          .put("runtime_prompt_sha256", runtimePromptSha256())
          .put("old_blocks", oldBlocks)
          .put("blocks", outputBlocks);
      Files.write(target, (artifact.toString(2) + "\n").getBytes(StandardCharsets.UTF_8));
      System.out.println("N7_CURRENT_PAYLOAD_EXPORT=" + target);
    }
  }
}
