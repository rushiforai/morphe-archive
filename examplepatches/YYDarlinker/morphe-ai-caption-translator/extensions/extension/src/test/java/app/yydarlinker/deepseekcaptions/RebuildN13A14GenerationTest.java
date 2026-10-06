package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

/** Frozen source replay and local fake repair; no provider or network. */
public class RebuildN13A14GenerationTest {
  private static final String DIAGNOSTIC = "caption-diagnostics-1.3.5-20260929-155802.txt";

  private static Path rootFile(String name) {
    Path path = Path.of("").toAbsolutePath();
    for (int i = 0; i < 6 && path != null; i++, path = path.getParent()) {
      Path candidate = path.resolve(name);
      if (Files.isRegularFile(candidate)) return candidate;
    }
    throw new AssertionError("Missing tracked fixture " + name);
  }

  private static String frozenResponse(int request) throws Exception {
    for (String line : Files.readAllLines(rootFile(DIAGNOSTIC), StandardCharsets.UTF_8)) {
      if (!line.startsWith("{\"at\":")) continue;
      JSONObject row = new JSONObject(line);
      if (row.getInt("request") == request) return row.getString("response");
    }
    throw new AssertionError("Missing frozen request " + request);
  }

  private static RebuildPlanner.Block block(RebuildSource source) {
    return new RebuildPlanner.Block(17, 1219, 1299, source);
  }

  private static String correctedResponse(RebuildSource source) throws Exception {
    JSONObject root = new JSONObject(frozenResponse(21));
    JSONArray old = root.getJSONArray("events");
    JSONArray events = new JSONArray();
    events.put(new JSONObject().put("from", 1219).put("to", 1228)
        .put("source", source.text(1219, 1228))
        .put("text", "外资和随之而来的爆发性经济增长。"));
    events.put(new JSONObject().put("from", 1229).put("to", 1240)
        .put("source", source.text(1229, 1240))
        .put("text", "邓小平降低了GDP中用于解放军的份额。"));
    for (int i = 1; i < old.length(); i++) events.put(old.getJSONObject(i));
    root.put("events", events);
    return root.toString();
  }

  @Test public void frozenBlockRejectsSplitSubjectAndAcceptsThirdRoundCorrection() throws Exception {
    RebuildSource source = RebuildR28CapturedTest.source();
    assertEquals(9684, source.words.size());
    assertEquals("follow", source.words.get(1228).key);
    assertEquals("deng", source.words.get(1229).key);
    assertEquals("reduced", source.words.get(1230).key);
    assertFalse("no period in frozen source", RebuildSource.terminal(source.words.get(1228).text));
    assertFalse("no hard source break after follow", RebuildPlanner.boundary(source, 1228));
    RebuildPlanner.Block block = block(source);
    JSONObject payload = RebuildProtocol.payload(source, block, "zh-Hans", null);
    assertTrue("new clause is only a lexical hint",
        payload.getJSONArray("suggested_clause_starts").toString().contains("1229"));
    assertTrue("Deng/reduced dependency is only a soft hint",
        payload.getJSONArray("avoid_event_end_after").toString().contains("1229"));
    RebuildProtocol.Plan first = RebuildProtocol.parseBound(frozenResponse(21), source, block);
    RebuildProtocol.Plan split = RebuildProtocol.parseBound(frozenResponse(22), source, block);
    assertEquals("possible_subject_attachment", first.issues.get(0).code);
    assertEquals(1, RebuildReview.score(first.issues));
    assertTrue(RebuildReview.splitsFlaggedSubject(source, first, split));
    assertSame(first, RebuildReview.prefer(first, split, source));
    // A lower-risk but subject-splitting candidate must still be vetoed.
    List<RebuildReview.Issue> moreIssues = new ArrayList<>(first.issues);
    moreIssues.add(new RebuildReview.Issue(1241, 1264, "possible_equipment_term", "fake tie breaker", true));
    RebuildProtocol.Plan riskier = new RebuildProtocol.Plan(first.events, first.json, moreIssues);
    assertSame(split, RebuildReview.prefer(riskier, split));
    assertSame(riskier, RebuildReview.prefer(riskier, split, source));
    assertTrue(RebuildReview.shouldRepair(first, 2, 1, block.start, block.end));
    assertFalse(RebuildReview.shouldRepair(first, 2, RebuildReview.MAX_SESSION_REPAIRS, block.start, block.end));
    assertFalse(RebuildReview.shouldRepair(first, 2, 1, block.end, block.end));
    assertFalse(RebuildReview.shouldRepair(first, 3, 2, block.start, block.end));

    RebuildProtocol.Plan corrected = RebuildProtocol.parseBound(correctedResponse(source), source, block);
    assertEquals(1219, corrected.events.get(0).from);
    assertEquals(1228, corrected.events.get(0).to);
    assertEquals(1229, corrected.events.get(1).from);
    assertEquals(1240, corrected.events.get(1).to);
    assertTrue(corrected.events.get(1).text.startsWith("邓小平降低"));
    assertEquals(0, RebuildReview.score(corrected.issues));
    assertFalse(RebuildReview.semanticBlocked(corrected, corrected.events.get(1)));
    assertSame(corrected, RebuildReview.prefer(first, corrected, source));
  }

  /** Optional live audit: keep the raw provider archive immutable and record parser findings separately. */
  @Test public void productionParserChecksOptionalLiveArchive() throws Exception {
    String path = System.getenv("MORPHE_N13_RESULT");
    if (path == null || path.isBlank()) return;
    Path raw = Path.of(path);
    byte[] bytes = Files.readAllBytes(raw);
    JSONObject archive = new JSONObject(new String(bytes, StandardCharsets.UTF_8));
    assertEquals("b17_1219_1299", archive.getString("block"));
    assertEquals(1, archive.getInt("api_attempts"));
    RebuildSource source = RebuildR28CapturedTest.source();
    RebuildProtocol.Plan plan = RebuildProtocol.parseBound(
        archive.getJSONObject("response").toString(), source, block(source));
    JSONObject audit = new JSONObject();
    audit.put("raw_archive", raw.getFileName().toString());
    byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
    StringBuilder hash = new StringBuilder();
    for (byte b : digest) hash.append(String.format("%02x", b & 255));
    audit.put("raw_sha256", hash.toString());
    audit.put("production_parser_verified", true);
    audit.put("review_risks", RebuildReview.score(plan.issues));
    org.json.JSONArray risks = new org.json.JSONArray();
    for (RebuildReview.Issue issue : plan.issues)
      if (issue.repair) risks.put(issue.code + ":" + issue.from + "-" + issue.to);
    audit.put("repair_issues", risks);
    RebuildProtocol.Event reduction = plan.at(source.words.get(1230).start);
    assertNotNull("reduced must belong to an event", reduction);
    boolean paired = reduction.from <= 1229 && reduction.to >= 1230;
    boolean correctActor = paired && reduction.text.matches("(?s).*邓小平.{0,6}降低.*")
        && !reduction.text.matches("(?s).*邓小平之后[^。！？]*降低.*");
    boolean safe = !RebuildReview.semanticBlocked(plan, reduction);
    audit.put("subject_predicate_same_event", paired);
    audit.put("deng_as_reduction_subject", correctActor);
    audit.put("semantic_blocked", !safe);
    audit.put("success_criterion_met", paired && correctActor && safe
        && RebuildReview.score(plan.issues) == 0);
    String target = System.getenv("MORPHE_N13_VERDICT");
    if (target != null && !target.isBlank())
      Files.write(Path.of(target), (audit.toString(2) + "\n").getBytes(StandardCharsets.UTF_8));
    System.out.println("N13_PRODUCTION_PARSE=" + audit);
  }
}
