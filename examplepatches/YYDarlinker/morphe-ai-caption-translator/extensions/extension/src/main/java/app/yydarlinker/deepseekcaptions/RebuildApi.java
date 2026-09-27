package app.yydarlinker.deepseekcaptions;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** One logical translation attempt, with at most one remembered optional-parameter negotiation. */
final class RebuildApi {
  static final class Failure extends Exception {
    final String code;
    final boolean configuration;
    final long delay;

    Failure(String c, boolean stop, long d) {
      super(c);
      code = c;
      configuration = stop;
      delay = d;
    }
  }

  private static final Set<String> portable = Collections.synchronizedSet(new HashSet<>());
  private static final Set<String> negotiated = Collections.synchronizedSet(new HashSet<>());

  private static final Map<String, String> blocked = new ConcurrentHashMap<>();

  static void reset() {
    blocked.clear();
    portable.clear();
    negotiated.clear();
  }

  static RebuildProtocol.Plan translate(
      RebuildSource s,
      RebuildPlanner.Block b,
      DeepSeekConfig.Snapshot cfg,
      String lang,
      DeepSeekApiClient.RequestControl control,
      boolean priority,
      String repair)
      throws Exception {
    JSONObject payload = RebuildProtocol.payload(s, b, lang, repair);
    CaptionOverlay.LayoutBudget layout = CaptionOverlay.budget();
    if (layout != null)
      payload.put(
          "display_hint",
          new JSONObject()
              .put("max_lines", 2)
              .put("approx_cjk_columns_per_line", layout.preferredColumns())
              .put("minimum_size_columns_per_line",layout.approximateColumns())
              .put(
                  "note",
                  "budget at preferred user font; split only at coherent source clauses, never summarize; minimum_size_columns is emergency capacity, not the target; source IDs determine timing"));
    String prompt =
        RebuildProtocol.PROMPT
            + RebuildProtocol.FIDELITY_PROMPT
            + " Target language: "
            + lang
            + ". User translation preferences: "
            + cfg.prompt;
    JSONObject request =
        ProviderRequestPolicy.request(
            cfg,
            prompt,
            payload,
            Math.min(3072, Math.max(1000, s.text(b.from, b.to).length() * 2 + 600)));
    // Replace the legacy schema; the provider adapter is authentication/transport policy only.
    JSONObject rf = request.optJSONObject("response_format");
    if (rf != null && "json_schema".equals(rf.optString("type")))
      request.put("response_format", RebuildProtocol.schema());
    String identity = RebuildCache.hash(cfg.baseUrl + "\n" + cfg.model + "\n" + cfg.apiKey);
    if (blocked.containsKey(identity)) throw new Failure(blocked.get(identity), true, 0);
    if (portable.contains(identity)) ProviderRequestPolicy.removeOptional(request);
    long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(priority ? 10000 : 16000);
    TokenCostAudit.Request audit =
        TokenCostAudit.beginUnitBatch(
            cfg,
            priority,
            1,
            (payload.optString("context_before").isEmpty() ? 0 : 1)
                + (payload.optString("context_after").isEmpty() ? 0 : 1),
            s.text(b.from, b.to).length(),
            payload.optString("context_before").length()
                + payload.optString("context_after").length(),
            RebuildProtocol.VERSION);
    for (int round = 0; round < 2; round++) {
      RawCaptionSource.checkActive(control);
      String body = request.toString();
      int attempt =
          TokenCostAudit.beginAttempt(audit, body.getBytes(StandardCharsets.UTF_8).length);
      trace(control,"REBUILD_HTTP_BEGIN","attempt="+attempt+";negotiation_round="+round);
      try {
        Response response = send(cfg, body, control, deadline);
        trace(control,"REBUILD_HTTP_RESPONSE","attempt="+attempt+";status="+response.status);
        if (response.status == 400 || response.status == 422) {
          String category = ProviderRequestPolicy.reason(response.body);
          boolean optional = category.contains("unsupported");
          boolean allowance = false;
          if (round == 0 && optional)
            synchronized (negotiated) {
              if (negotiated.size() > 128) {
                negotiated.clear();
                portable.clear();
              }
              allowance = negotiated.add(identity);
            }
          if (allowance && ProviderRequestPolicy.removeOptional(request, category)) {
            portable.add(identity);
            TokenCostAudit.recordFailure(audit, attempt, "http_" + response.status);
            continue;
          }
          if (round == 0 && optional && portable.contains(identity))
            throw new Failure("negotiation_pending", false, 1200);
          throw new Failure("configuration_" + category, true, 0);
        }
        if (response.status < 200 || response.status >= 300)
          throw new Failure(
              "http_" + response.status,
              response.status == 401 || response.status == 403 || response.status == 404,
              response.retryAfter);
        JSONObject root = new JSONObject(response.body);
        TokenCostAudit.recordResponse(audit, attempt, root);
        JSONObject choice = root.getJSONArray("choices").getJSONObject(0);
        String finish = choice.optString("finish_reason");
        String content = choice.getJSONObject("message").optString("content", "");
        if (control != null)
          control.onQualityEvidence(
              payload,
              content,
              "protocol="
                  + RebuildProtocol.VERSION
                  + ";model="
                  + root.optString("model", cfg.model)
                  + ";prompt_hash="
                  + RebuildCache.hash(prompt));
        if ("length".equals(finish)) throw new RebuildProtocol.Invalid("output_truncated");
        if ("content_filter".equals(finish)) throw new Failure("content_filter", false, 0);
        RebuildProtocol.Plan plan = RebuildProtocol.parseBound(content, s, b);
        if(plan.reboundEvents>0)trace(control,"REBUILD_SOURCE_REBOUND",
            "block="+b.index+";events_rebound="+plan.reboundEvents+";rule=exact_owned_source_v1");
        // The player may have changed shape while this network request was in flight.
        CaptionOverlay.LayoutBudget latest=CaptionOverlay.budget();
        if(latest==null)latest=layout;
        plan = RebuildReview.withLayoutReview(plan,s,latest == null ? null : latest::fits);
        TokenCostAudit.recordUnitQualityOutcome(audit, 1, 0, 0);
        TokenCostAudit.recordUnitBatchOutcome(audit, 1);
        return plan;
      } catch (RebuildProtocol.Invalid invalid) {
        TokenCostAudit.recordUnitQualityOutcome(audit, 0, 1, 1);
        throw invalid;
      } catch (Exception error) {
        trace(control,"REBUILD_HTTP_FAILURE","attempt="+attempt+";reason="+(error instanceof Failure ? ((Failure)error).code : error.getClass().getSimpleName()));
        if (error instanceof Failure && ((Failure) error).configuration) {
          if (blocked.size() > 128) blocked.clear();
          blocked.put(identity, ((Failure) error).code);
        }
        TokenCostAudit.recordFailure(
            audit,
            attempt,
            error instanceof Failure ? ((Failure) error).code : error.getClass().getSimpleName());
        throw error;
      }
    }
    throw new Failure("negotiation_exhausted", true, 0);
  }

  private static void trace(DeepSeekApiClient.RequestControl control,String stage,String detail) {
    if(control instanceof RebuildController.Job)((RebuildController.Job)control).trace(stage,detail);
  }

  private static final class Response {
    final int status;
    final String body;
    final long retryAfter;

    Response(int c, String b, long r) {
      status = c;
      body = b;
      retryAfter = r;
    }
  }

  private static Response send(
      DeepSeekConfig.Snapshot cfg,
      String body,
      DeepSeekApiClient.RequestControl control,
      long deadline)
      throws Exception {
    HttpURLConnection c =
        (HttpURLConnection) new URL(ProviderEndpoint.chat(cfg.baseUrl)).openConnection();
    try (NetworkDeadline guard = new NetworkDeadline(c, deadline)) {
      if (control != null) control.onConnection(c);
      RawCaptionSource.checkActive(control);
      c.setRequestMethod("POST");
      c.setDoOutput(true);
      c.setUseCaches(false);
      c.setInstanceFollowRedirects(false);
      c.setConnectTimeout(Math.min(4000, RawCaptionSource.remaining(deadline)));
      c.setReadTimeout(RawCaptionSource.remaining(deadline));
      ProviderEndpoint.authenticate(c, cfg.baseUrl, cfg.apiKey);
      c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
      c.setRequestProperty("Accept", "application/json");
      byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
      c.setFixedLengthStreamingMode(bytes.length);
      try (OutputStream out = c.getOutputStream()) {
        out.write(bytes);
      }
      if (control != null) control.onRequestBodySent();
      RawCaptionSource.checkActive(control);
      c.setReadTimeout(RawCaptionSource.remaining(deadline));
      int code = c.getResponseCode();
      ByteArrayOutputStream out = new ByteArrayOutputStream();
      InputStream stream = code >= 400 ? c.getErrorStream() : c.getInputStream();
      if (stream != null)
        try (InputStream in = stream) {
          byte[] buf = new byte[4096];
          while (true) {
            RawCaptionSource.checkActive(control);
            c.setReadTimeout(RawCaptionSource.remaining(deadline));
            int n = in.read(buf);
            if (n < 0) break;
            if (out.size() + n > 2 * 1024 * 1024) throw new IOException("response_too_large");
            out.write(buf, 0, n);
          }
        }
      long retry = 0;
      try {
        retry = Math.min(120, Math.max(0, Long.parseLong(c.getHeaderField("Retry-After")))) * 1000;
      } catch (Exception ignored) {
      }
      return new Response(code, new String(out.toByteArray(), StandardCharsets.UTF_8), retry);
    } finally {
      c.disconnect();
      if (control != null) control.onConnection(null);
    }
  }

  static String test(DeepSeekConfig.Snapshot cfg) throws Exception {
    reset();
    List<RebuildSource.Word> words = new ArrayList<>();
    String[] text = {"This", "is", "a", "subtitle", "test."};
    for (int i = 0; i < text.length; i++)
      words.add(
          new RebuildSource.Word(
              text[i], i * 600, (i + 1) * 600, 0, RebuildSource.Precision.NATIVE));
    RebuildSource s = new RebuildSource(words);
    RebuildPlanner.Block b = RebuildPlanner.plan(s).get(0);
    RebuildProtocol.Plan p = translate(s, b, cfg, "zh-Hans", null, true, "");
    StringBuilder out = new StringBuilder();
    for (RebuildProtocol.Event e : p.events) out.append(e.text);
    return out.toString();
  }
}
