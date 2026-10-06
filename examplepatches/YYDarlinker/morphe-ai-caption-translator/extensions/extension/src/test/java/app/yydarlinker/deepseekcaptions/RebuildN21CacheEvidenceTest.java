package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.ContextWrapper;
import java.io.File;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** Read-only device evidence; production cache I/O is confined to a disposable directory. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class RebuildN21CacheEvidenceTest {
  @Rule public TemporaryFolder temporary = new TemporaryFolder();
  private Context context;

  @Before public void setup() throws Exception {
    context = diskContext(temporary.newFolder("n21-cache"));
    TokenCostAudit.clear(context);
  }

  private static Context diskContext(File root) {
    return new ContextWrapper(RuntimeEnvironment.getApplication()) {
      @Override public File getCacheDir() { return root; }
      @Override public Context getApplicationContext() { return this; }
    };
  }

  private JSONObject fixture() throws Exception {
    try (InputStream input = getClass().getResourceAsStream(
        "/n21/device-140013-cache-evidence.json")) {
      assertNotNull(input);
      JSONObject value = new JSONObject(new String(input.readAllBytes(), StandardCharsets.UTF_8));
      assertEquals("c6932c7eb4f415ec7d65b60bc1e5855610e2b24c5f0c1a8792f20b06325fdd99",
          value.getString("source_sha256"));
      assertEquals(16, value.getInt("recorded_quality_entries"));
      return value;
    }
  }

  private static DeepSeekConfig.Snapshot config(String url, String model, String prompt,
      String apiKey, int size, int opacity, boolean enabled) {
    return new DeepSeekConfig.Snapshot(enabled, url, model, prompt, size, opacity, apiKey);
  }

  private static DeepSeekConfig.Snapshot config() {
    // These are explicit offline replay settings; the device export omits its endpoint/API key.
    return config("https://offline.invalid/v1", "qwen3.8-flash", DeepSeekConfig.DEFAULT_PROMPT,
        "offline-fixture-key", 2, 70, true);
  }

  private static List<JSONObject> quality(JSONObject fixture) throws Exception {
    List<JSONObject> entries = new ArrayList<>();
    JSONArray raw = fixture.getJSONArray("quality");
    for (int i = 0; i < raw.length(); i++)
      entries.add(new JSONObject(raw.getJSONObject(i).getString("raw")));
    return entries;
  }

  private static RebuildSource source(JSONObject fixture) throws Exception {
    Map<Integer, RebuildSource.Word> words = new LinkedHashMap<>();
    for (JSONObject entry : quality(fixture)) {
      JSONObject request = new JSONObject(entry.getString("source"));
      JSONArray tokens = request.getJSONArray("owned_tokens");
      JSONArray times = request.getJSONArray("diagnostic_only_source_times");
      assertEquals(tokens.length(), times.length());
      for (int i = 0; i < tokens.length(); i++) {
        JSONArray token = tokens.getJSONArray(i), time = times.getJSONArray(i);
        int id = token.getInt(0);
        assertEquals(id, time.getInt(0));
        RebuildSource.Word word = new RebuildSource.Word(token.getString(1), time.getLong(1),
            time.getLong(2), time.getInt(3), RebuildSource.Precision.valueOf(time.getString(4)));
        RebuildSource.Word old = words.get(id);
        if (old == null) words.put(id, word);
        else {
          assertEquals(old.text, word.text);
          assertEquals(old.start, word.start);
          assertEquals(old.end, word.end);
          assertEquals(old.cue, word.cue);
          assertEquals(old.precision, word.precision);
        }
      }
    }
    assertEquals("Only observed words; do not fabricate the unobserved 900..9683 tail", 900,
        words.size());
    List<RebuildSource.Word> ordered = new ArrayList<>();
    for (int id = 0; id < words.size(); id++) {
      assertNotNull("missing recorded word " + id, words.get(id));
      ordered.add(words.get(id));
    }
    return new RebuildSource(ordered);
  }

  private static RebuildPlanner.Block block(JSONObject request, RebuildSource source) throws Exception {
    String[] fields = request.getString("block").substring(1).split("_");
    // Keep the device's explicit ranges. Planning a truncated source is not full-video evidence.
    return new RebuildPlanner.Block(Integer.parseInt(fields[0]), Integer.parseInt(fields[1]),
        Integer.parseInt(fields[2]), source);
  }

  private static Map<Integer, RebuildPlanner.Block> blocks(JSONObject fixture,
      RebuildSource source) throws Exception {
    Map<Integer, RebuildPlanner.Block> blocks = new LinkedHashMap<>();
    for (JSONObject entry : quality(fixture)) {
      RebuildPlanner.Block block = block(new JSONObject(entry.getString("source")), source);
      if (!blocks.containsKey(block.index)) blocks.put(block.index, block);
    }
    assertEquals(13, blocks.size());
    return blocks;
  }

  private static String history(JSONObject fixture, String stage, String selector) throws Exception {
    JSONArray history = fixture.getJSONArray("history");
    for (int i = 0; i < history.length(); i++) {
      String raw = history.getJSONObject(i).getString("raw");
      if (raw.contains(" | " + stage + " | ") && raw.contains(selector)) return raw;
    }
    fail("missing original trace: " + stage + " " + selector);
    return "";
  }

  private File cacheFile(String key, RebuildPlanner.Block block) {
    return new File(RebuildCache.directory(context), key + "-" + block.id() + ".json");
  }

  private void coldRead(JSONObject fixture, String key, RebuildSource source,
      RebuildPlanner.Block block, int lookup, String path, String originalTrace) throws Exception {
    File file = cacheFile(key, block);
    assertFalse("known disposable directory has no file before this lookup", file.exists());
    assertNull(RebuildCache.read(context, key, source, block));
    System.out.println("N21_LOOKUP=" + new JSONObject().put("audit_call", lookup)
        .put("path", path).put("key_scope", "partial_source_and_fixture_config_not_device")
        .put("identity", key).put("block", block.id()).put("filename", file.getName())
        .put("session", 1).put("miss_reason", "file_not_present")
        .put("changed_identity_fields", new JSONArray()).put("original_trace", originalTrace));
  }

  @Test public void chronologicalColdRunHasTwelveAuditCallsThirteenFileReads() throws Exception {
    JSONObject fixture = fixture();
    RebuildSource source = source(fixture);
    Map<Integer, RebuildPlanner.Block> blocks = blocks(fixture, source);
    String key = RebuildCache.identity(source, config(), "zh-Hans");
    String startup = history(fixture, "REBUILD_SOURCE_READY", "words=9684;");
    assertTrue(startup, startup.endsWith(";cache_hits=0"));
    boolean[] checked = new boolean[13];
    Map<Integer, RebuildProtocol.Plan> accepted = new LinkedHashMap<>();
    int reads = 0, auditCalls = 1, retries = 0;
    for (int index = 0; index < 2; index++) {
      coldRead(fixture, key, source, blocks.get(index), 1, "startup_focus_and_next", startup);
      checked[index] = true;
      reads++;
    }
    TokenCostAudit.recordUnitCacheOutcome(2, 0);
    int expectedRequest = 3;
    for (JSONObject entry : quality(fixture)) {
      int requestId = entry.getInt("request");
      assertEquals(expectedRequest++, requestId);
      assertTrue(entry.getString("settings"), entry.getString("settings").contains(";session=1;"));
      JSONObject request = new JSONObject(entry.getString("source"));
      RebuildPlanner.Block block = blocks.get(block(request, source).index);
      String requestTrace = history(fixture, "REBUILD_REQUEST", ";request=" + requestId + ";");
      assertTrue(requestTrace, requestTrace.contains(";block=" + block.id() + ";"));
      assertTrue(requestTrace, requestTrace.endsWith(";range=" + block.start + "-" + block.end));
      assertEquals(key, RebuildCache.identity(source, config(), "zh-Hans"));
      if (!checked[block.index]) {
        checked[block.index] = true;
        coldRead(fixture, key, source, block, ++auditCalls, "lazy_first_translation", requestTrace);
        reads++;
        TokenCostAudit.recordUnitCacheOutcome(1, 0);
      } else if (accepted.containsKey(block.index)) {
        retries++;
        assertTrue(block.index == 4 || block.index == 10);
        System.out.println("N21_RETRY_NO_LOOKUP=" + new JSONObject().put("request", requestId)
            .put("block", block.id()).put("identity", key).put("cache_checked", true)
            .put("original_trace", requestTrace));
      }
      RebuildProtocol.Plan candidate = RebuildProtocol.parseBound(entry.getString("response"),
          source, block);
      RebuildProtocol.Plan plan = RebuildReview.prefer(accepted.get(block.index), candidate, source);
      accepted.put(block.index, plan);
      String acceptedTrace = history(fixture, "REBUILD_EVENTS_ACCEPTED", ";request=" + requestId + ";");
      int risks = RebuildReview.score(plan.issues);
      assertTrue(acceptedTrace, acceptedTrace.contains(";review_risks=" + risks + ";"));
      assertEquals("write gate uses the same recorded accepted-plan risks", risks == 0,
          RebuildCache.write(context, key, block, plan));
      assertEquals(risks == 0, cacheFile(key, block).isFile());
    }
    assertEquals(19, expectedRequest);
    assertEquals(12, auditCalls);
    assertEquals(13, reads);
    assertEquals("b4 twice and b10 once", 3, retries);
    Field stateField = TokenCostAudit.class.getDeclaredField("memoryState");
    stateField.setAccessible(true);
    JSONObject audit = (JSONObject) stateField.get(null);
    JSONObject metrics = audit.getJSONObject("session").getJSONObject("metrics");
    assertEquals(12, metrics.getInt("unit_cache_lookups"));
    assertEquals(13, metrics.getInt("unit_cache_miss_units"));
    assertEquals(0, metrics.optLong("unit_cache_hit_units"));
    assertFalse(metrics.has("unit_cache_current_hits"));
    assertEquals("recording cache evidence sends no requests", 0,
        audit.getJSONObject("buckets").getJSONObject("all").optLong("attempts"));
    System.out.println("N21_AUDIT=" + metrics);
    assertEquals(12, RebuildCache.directory(context).listFiles((dir, name) -> name.endsWith(".json")).length);
    assertEquals(1, RebuildReview.score(accepted.get(4).issues));
    assertTrue(history(fixture, "REBUILD_SEEK", ";from=232761;to=0")
        .contains(" | REBUILD_SEEK | session=1;"));
  }

  @Test public void freshDiskReaderHitsRecordedRiskZeroAndCannotPersistRecordedRiskOne()
      throws Exception {
    JSONObject fixture = fixture();
    RebuildSource source = source(fixture);
    Map<Integer, RebuildPlanner.Block> blocks = blocks(fixture, source);
    List<JSONObject> entries = quality(fixture);
    String key = RebuildCache.identity(source, config(), "zh-Hans");
    RebuildProtocol.Plan riskZero = RebuildProtocol.parseBound(entries.get(0).getString("response"),
        source, blocks.get(0));
    RebuildProtocol.Plan riskOne = RebuildProtocol.parseBound(entries.get(5).getString("response"),
        source, blocks.get(4));
    assertEquals(8, entries.get(5).getInt("request"));
    assertEquals(0, RebuildReview.score(riskZero.issues));
    assertEquals(1, RebuildReview.score(riskOne.issues));
    assertTrue(RebuildCache.write(context, key, blocks.get(0), riskZero));
    assertFalse(RebuildCache.write(context, key, blocks.get(4), riskOne));
    RebuildSource reloadedSource = source(fixture);
    String newKey = RebuildCache.identity(reloadedSource, config(), "zh-Hans");
    assertNotSame(source, reloadedSource);
    assertEquals(key, newKey);
    Context freshReader = diskContext(context.getCacheDir());
    RebuildProtocol.Plan hit = RebuildCache.read(freshReader, newKey, reloadedSource, blocks.get(0));
    assertNotNull(hit);
    assertNotSame("hit is reparsed from disk", riskZero, hit);
    assertEquals(riskZero.json, hit.json);
    assertNull(RebuildCache.read(freshReader, newKey, reloadedSource, blocks.get(4)));
    assertFalse(cacheFile(newKey, blocks.get(4)).exists());
    System.out.println("N21_NEW_SOURCE_DISK_READER=" + new JSONObject().put("key", newKey)
        .put("key_scope", "partial_source_and_fixture_config_not_device")
        .put("risk_zero_hit", blocks.get(0).id()).put("risk_one_not_written", blocks.get(4).id())
        .put("memory_plan_reused", false));
  }

  @Test public void identityIncludesConfigAndEveryWordButExcludesKeyCueAndDisplaySettings()
      throws Exception {
    RebuildSource source = source(fixture());
    DeepSeekConfig.Snapshot original = config();
    String baseline = RebuildCache.identity(source, original, "zh-Hans");
    assertNotEquals(baseline, RebuildCache.identity(source,
        config(original.baseUrl + "/", original.model, original.prompt, original.apiKey, 2, 70, true), "zh-Hans"));
    assertNotEquals(baseline, RebuildCache.identity(source,
        config(original.baseUrl, original.model + "-changed", original.prompt, original.apiKey, 2, 70, true), "zh-Hans"));
    assertNotEquals(baseline, RebuildCache.identity(source,
        config(original.baseUrl, original.model, original.prompt + "changed", original.apiKey, 2, 70, true), "zh-Hans"));
    assertNotEquals(baseline, RebuildCache.identity(source, original, "ja"));
    assertEquals(baseline, RebuildCache.identity(source,
        config(original.baseUrl, original.model, original.prompt, "different-api-key", 4, 10, false), "zh-Hans"));
    int last = source.words.size() - 1;
    RebuildSource.Word word = source.words.get(last);
    List<RebuildSource.Word> changed = new ArrayList<>(source.words);
    changed.set(last, new RebuildSource.Word(word.text, word.start, word.end, word.cue + 1, word.precision));
    assertEquals(baseline, RebuildCache.identity(new RebuildSource(changed), original, "zh-Hans"));
    RebuildSource.Word[] differences = {
        new RebuildSource.Word(word.text + "changed", word.start, word.end, word.cue, word.precision),
        new RebuildSource.Word(word.text, word.start + 1, word.end, word.cue, word.precision),
        new RebuildSource.Word(word.text, word.start, word.end + 1, word.cue, word.precision),
        new RebuildSource.Word(word.text, word.start, word.end, word.cue, RebuildSource.Precision.ALIGNED)
    };
    for (RebuildSource.Word difference : differences) {
      changed.set(last, difference);
      assertNotEquals("a word outside b0 still changes b0's whole-source namespace", baseline,
          RebuildCache.identity(new RebuildSource(changed), original, "zh-Hans"));
    }
    System.out.println("N21_IDENTITY_FIELDS=protocol_version,base_url_raw,model_raw,user_prompt_raw,"
        + "target_language,prompt_sha256,all_word_start_end_precision_text;"
        + "excluded=api_key,cue,enabled,font_size,opacity;session_and_generation_have_no_inputs");
  }
}
