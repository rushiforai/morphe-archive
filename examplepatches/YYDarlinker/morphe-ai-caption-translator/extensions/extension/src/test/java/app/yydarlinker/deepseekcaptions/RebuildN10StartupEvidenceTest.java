package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.regex.*;
import org.json.JSONObject;
import org.junit.Test;

/** Locks the N10 startup scoreboard to the frozen device timestamps. */
public class RebuildN10StartupEvidenceTest {
  private static Path root() {
    Path p = Path.of("").toAbsolutePath();
    while (p != null && !Files.exists(p.resolve("scoreboard/results/n10-startup.json"))) p = p.getParent();
    assertNotNull("workspace scoreboard missing", p);
    return p;
  }

  private static String sha256(byte[] bytes) throws Exception {
    byte[] hash = MessageDigest.getInstance("SHA-256").digest(bytes);
    StringBuilder out = new StringBuilder();
    for (byte b : hash) out.append(String.format("%02x", b & 255));
    return out.toString();
  }

  private static long timestamp(String history, String kind, String detail) {
    Pattern pattern = Pattern.compile("(?m)^(\\d+) \\| " + Pattern.quote(kind) + " \\| .*"
        + Pattern.quote(detail) + ".*$");
    Matcher match = pattern.matcher(history);
    assertTrue("missing " + kind + " / " + detail, match.find());
    return Long.parseLong(match.group(1));
  }

  @Test public void frozenStartupAndPolicyFloorStayInSync() throws Exception {
    Path workspace = root();
    byte[] diagnostic = Files.readAllBytes(workspace.resolve("caption-diagnostics-1.3.5-20260929-155802.txt"));
    JSONObject mirror = new JSONObject(new String(Files.readAllBytes(
        workspace.resolve("scoreboard/results/n10-startup.json")), StandardCharsets.UTF_8));
    assertEquals(sha256(diagnostic), mirror.getJSONObject("input_sha256").getString("diagnostics"));

    String trace = new String(diagnostic, StandardCharsets.UTF_8);
    int start = trace.indexOf("[Extended history: chronological; last 24h; up to 8 MiB per channel]");
    int end = trace.indexOf("[Extended quality evidence; captured only while debug enabled]");
    assertTrue(start >= 0 && end > start);
    String history = trace.substring(start, end);
    long anchor = timestamp(history, "REBUILD_PRESENTED", "mode=status;width=1121;sp=12.038095;lines=1;pagination_unresolved=true;text=字幕准备中…");
    long rawSource = timestamp(history, "SOURCE_OK", "原始字幕 158900 bytes");
    long ready = timestamp(history, "REBUILD_SOURCE_READY", "words=9684;");
    long first = timestamp(history, "REBUILD_PRESENTED", "id=1:0:2:98-126;mode=caption;");
    JSONObject frozen = mirror.getJSONObject("frozen");
    assertEquals(anchor, mirror.getJSONObject("anchor").getLong("at"));
    assertEquals(ready, frozen.getLong("source_ready_at"));
    assertEquals(first, frozen.getLong("first_content_at"));
    assertEquals(12094, frozen.getInt("source_ready_ms"));
    assertEquals(29640, frozen.getInt("first_content_ms"));
    assertEquals(ready - anchor, frozen.getLong("source_ready_ms"));
    assertEquals(first - anchor, frozen.getLong("first_content_ms"));
    assertEquals("1:0:2:98-126", frozen.getString("first_content_id"));

    JSONObject policy = mirror.getJSONObject("policy_mirror");
    assertEquals(frozen.getInt("source_ready_ms"), policy.getInt("source_ready_ms"));
    assertEquals(rawSource, policy.getLong("raw_source_available_at"));
    assertEquals(10730, policy.getInt("raw_source_available_ms"));
    assertEquals(rawSource - anchor, policy.getLong("first_content_ms"));
    assertEquals("earliest_raw_source_eligible_floor", policy.getString("timing_kind"));
    assertFalse(policy.getBoolean("device_presented_verified"));
  }
}
