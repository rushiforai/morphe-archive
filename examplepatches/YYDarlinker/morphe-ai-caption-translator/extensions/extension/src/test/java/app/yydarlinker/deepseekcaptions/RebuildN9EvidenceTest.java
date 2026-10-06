package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.*;
import org.json.*;
import org.junit.Test;

/** Locks the additive A13/A14 device trace and its offline mirror without an API call. */
public class RebuildN9EvidenceTest {
  private static Path root() {
    Path p=Path.of("").toAbsolutePath();
    while(p!=null && !Files.exists(p.resolve("scoreboard/results/n9-evidence.json")))p=p.getParent();
    assertNotNull("workspace scoreboard missing",p);
    return p;
  }
  private static String sha256(byte[] bytes)throws Exception {
    byte[] hash=MessageDigest.getInstance("SHA-256").digest(bytes);
    StringBuilder out=new StringBuilder();
    for(byte b:hash)out.append(String.format("%02x",b&255));
    return out.toString();
  }
  @Test public void newDeviceTraceAndScoreboardStayInSync()throws Exception {
    Path root=root();
    byte[] diagnostic=Files.readAllBytes(root.resolve("caption-diagnostics-1.3.5-20260929-155802.txt"));
    JSONObject mirror=new JSONObject(new String(Files.readAllBytes(root.resolve("scoreboard/results/n9-evidence.json")),StandardCharsets.UTF_8));
    assertEquals(sha256(diagnostic),mirror.getJSONObject("input_sha256").getString("diagnostics"));
    assertEquals(82521,mirror.getJSONObject("frozen_token_audit").getInt("total_tokens"));
    JSONObject cases=mirror.getJSONObject("cases");
    Set<String> names=new HashSet<>();cases.keys().forEachRemaining(names::add);
    assertEquals(new HashSet<>(Arrays.asList("A13","A14")),names);
    JSONObject a13=cases.getJSONObject("A13"),a14=cases.getJSONObject("A14");
    assertEquals(21789,a13.getJSONObject("frozen").getInt("blackout_duration_ms"));
    assertEquals(7101,a14.getJSONObject("frozen").getInt("blackout_duration_ms"));
    assertEquals(0,a13.getJSONObject("policy_mirror").getInt("status_only_ms_in_owned_window"));
    assertEquals(0,a14.getJSONObject("policy_mirror").getInt("status_only_ms_in_owned_window"));
    assertTrue(a13.getJSONObject("policy_mirror").getBoolean("no_future_source_at_7160"));
    assertEquals("source_cue",a13.getJSONObject("policy_mirror").getJSONObject("decision_at_blackout_onset").getString("decision"));
    assertEquals("event_source",a14.getJSONObject("policy_mirror").getJSONObject("decision_at_blackout_onset").getString("decision"));
    JSONObject adjudication=a14.getJSONObject("review_adjudication");
    assertEquals("keep_semantic_block",adjudication.getString("decision"));
    assertEquals("possible_subject_attachment",adjudication.getString("risk"));
    assertEquals("dependent_boundary",adjudication.getString("repair_candidate_risk"));
    assertFalse(adjudication.getBoolean("accepted_translation_displayable"));
    assertEquals(0,adjudication.getInt("new_live_requests"));
    assertEquals(0,adjudication.getInt("new_live_tokens"));
    assertEquals("未验证",a13.getString("status"));
    assertEquals("真风险已裁决；新版真机待验",a14.getString("status"));
    JSONObject old=new JSONObject(new String(Files.readAllBytes(root.resolve("scoreboard/results/frozen-baseline.json")),StandardCharsets.UTF_8));
    assertEquals(12,old.getJSONObject("cases").length());
    for(int i=1;i<=12;i++)assertTrue(old.getJSONObject("cases").has(String.format("A%02d",i)));
  }
}
