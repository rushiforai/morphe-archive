package app.yydarlinker.deepseekcaptions;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.NoRouteToHostException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

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

    static final class TransportFailure extends IOException {
        final String reason, phase;
        final long elapsedMs, remainingMs;

        /**
         * True when the connection was closed by our own stop/retire rather than by the network.
         */
        final boolean cancelled;

        final TranslationAudit.FailureCategory category;

        TransportFailure(
                Exception cause,
                String phase,
                long start,
                long deadline,
                NetworkDeadline guard,
                boolean intentional) {
            super(cause.getClass().getSimpleName(), cause);
            this.phase = phase;
            cancelled = intentional;
            category = transportCategory(cause, phase, guard, intentional);
            reason = intentional ? "cancelled" : transportReason(cause, phase, guard);
            elapsedMs = TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - start);
            long remaining =
                    guard != null
                            ? guard.remainingMs()
                            : Math.max(
                                    0, TimeUnit.NANOSECONDS.toMillis(deadline - System.nanoTime()));
            remainingMs = remaining;
        }
    }

    /**
     * Classifies a transport failure from the facts we actually have. The deadline's own timer flag
     * is consulted first, so a timer-fired disconnect is reported as an expiry instead of a socket
     * error; remaining time is never used to guess which side failed first.
     */
    static TranslationAudit.FailureCategory transportCategory(
            Exception cause, String phase, NetworkDeadline guard, boolean cancelled) {
        if (cancelled) return TranslationAudit.FailureCategory.CANCELLED;
        if (guard != null && guard.timerFired())
            return TranslationAudit.FailureCategory.DEADLINE_EXPIRED;
        if (cause instanceof SocketTimeoutException)
            return "connect".equals(phase)
                    ? TranslationAudit.FailureCategory.CONNECT_TIMEOUT
                    : TranslationAudit.FailureCategory.READ_TIMEOUT;
        return TranslationAudit.FailureCategory.NETWORK_IO;
    }

    static String transportReason(Exception error, String phase, NetworkDeadline guard) {
        if (error instanceof TransportFailure) return ((TransportFailure) error).reason;
        if (guard != null && guard.timerFired()) return "deadline_expired";
        if (error instanceof InterruptedIOException)
            return "connect".equals(phase)
                    ? "connection_establishment_timeout"
                    : "read_interrupted";
        if (error instanceof ConnectException
                || error instanceof UnknownHostException
                || error instanceof NoRouteToHostException)
            return "connection_establishment_failed";
        if (error instanceof SocketException) return "connection_socket_exception";
        return "connect".equals(phase) ? "connection_establishment_failed" : "read_interrupted";
    }

    private static final Set<String> portable = Collections.synchronizedSet(new HashSet<>());
    private static final Set<String> negotiated = Collections.synchronizedSet(new HashSet<>());

    private static final Map<String, String> blocked = new ConcurrentHashMap<>();

    static void reset() {
        RebuildStream.reset();
        blocked.clear();
        portable.clear();
        negotiated.clear();
    }

    static String prompt(TranslationSettings cfg, String lang) {
        return RebuildProtocol.PROMPT
                + RebuildProtocol.FIDELITY_PROMPT
                + RebuildGuidance.SENTENCE
                + " Target language: "
                + lang
                + ". User translation preferences: "
                + cfg.prompt;
    }

    static final String NEUTRAL_PROMPT = RebuildProtocol.PROMPT;
    static final String ENGLISH_DEPENDENCY_PROMPT =
            " The source is explicitly English. Keep modifier+noun, number+unit, verb+object and"
                + " dependent phrases together; use context to understand a continuation without"
                + " importing its words. Articles, auxiliaries and conjunctions are lexical hints,"
                + " not proven sentence boundaries.";

    static String prompt(TranslationSettings cfg, String lang, CaptionLanguageContext context) {
        return prompt(cfg, lang, context, null);
    }

    /**
     * The same quality instructions for automatic and authored sources. An authored block only
     * appends its fixed display-cue contract; it does not replace the sentence/quality guidance.
     */
    static String prompt(
            TranslationSettings cfg,
            String lang,
            CaptionLanguageContext context,
            RebuildPlanner.Block block) {
        String base;
        if (context.canApplyEnglishToChinese) base = prompt(cfg, lang);
        else
            base =
                    NEUTRAL_PROMPT
                            + (context.englishSource ? ENGLISH_DEPENDENCY_PROMPT : "")
                            + RebuildGuidance.SENTENCE
                            + " Source language: "
                            + context.sourceCode
                            + ". Target language: "
                            + context.targetCode
                            + ". User translation preferences: "
                            + context.preference(cfg);
        return block != null && block.authored
                ? base + RebuildGuidance.displayCueRule(block)
                : base;
    }

    static RebuildProtocol.Plan translate(
            RebuildSource s,
            RebuildPlanner.Block b,
            TranslationSettings cfg,
            String lang,
            DeepSeekApiClient.RequestControl control,
            boolean priority,
            String repair,
            CaptionLanguageContext context)
            throws Exception {
        JSONObject payload = RebuildProtocol.payload(s, b, lang, repair, context);
        TranslationBudget layout = TranslationOutput.budget();
        if (layout != null && context.canApplyEnglishToChinese)
            payload.put(
                    "display_hint",
                    new JSONObject()
                            .put("max_lines", 2)
                            .put("approx_cjk_columns_per_line", layout.preferredColumns())
                            .put("minimum_size_columns_per_line", layout.approximateColumns())
                            .put(
                                    "note",
                                    "budget at preferred user font; split only at coherent source"
                                        + " clauses, never summarize; minimum_size_columns is"
                                        + " emergency capacity, not the target; source IDs"
                                        + " determine timing"));
        if (layout != null && !context.canApplyEnglishToChinese)
            payload.put(
                    "display_hint",
                    new JSONObject()
                            .put("max_lines", 2)
                            .put("available_width_px", layout.width)
                            .put("profile_id", context.profile.id)
                            .put("direction", context.profile.direction)
                            .put("presentation_policy", "legacy_n26")
                            .put(
                                    "note",
                                    "Measured width only; reference counters do not control"
                                        + " pagination in this policy."));
        String prompt = prompt(cfg, lang, context, b);

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
        // Streamed replies are rebuilt into the same response; leading events may be shown early.
        boolean streaming = RebuildStream.wanted(cfg, identity);
        if (streaming) RebuildStream.enable(request);
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(priority ? 10000 : 16000);
        TranslationAudit.Request audit =
                TranslationAudit.beginUnitBatch(
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
            TranslationSourceAccess.checkActive(control);
            // Every actual POST, including negotiation and both stream fallback paths, enters
            // here. Admission is separate from finishSent permission to read the previous POST.
            if (control != null && !control.tryBeginAttempt()) throw new InterruptedException();
            String body = request.toString();
            int attempt =
                    TranslationAudit.beginAttempt(
                            audit, body.getBytes(StandardCharsets.UTF_8).length);
            trace(
                    control,
                    "REBUILD_HTTP_BEGIN",
                    "attempt=" + attempt + ";negotiation_round=" + round);
            RebuildStream.Reader reader =
                    streaming
                            ? new RebuildStream.Reader(
                                    RebuildStream.provisional(control, s, b, context))
                            : null;
            try {
                Response response = send(cfg, body, control, deadline, reader);
                trace(
                        control,
                        "REBUILD_POLICY_REQUEST",
                        context.diagnosticFields() + ";prompt_hash=" + RebuildCache.hash(prompt));
                trace(
                        control,
                        "REBUILD_HTTP_RESPONSE",
                        "attempt=" + attempt + ";status=" + response.status);
                if ((response.status == 400 || response.status == 422)
                        && ProviderRequestPolicy.inspected(response.body))
                    // Provider-side content inspection of this block's text: not a configuration
                    // problem, so
                    // neither streaming nor later blocks are affected.
                    throw new Failure(ProviderRequestPolicy.INSPECTION_CODE, false, 0);
                if (streaming && (response.status == 400 || response.status == 422)) {
                    // A refused streamed form falls back once without spending a negotiation round.
                    streaming = false;
                    RebuildStream.reject(request, identity);
                    TranslationAudit.recordFailure(
                            audit, attempt, RebuildStream.httpCode(response.status));
                    round--;
                    continue;
                }
                if (streaming && RebuildStream.cut(reader, request, audit, attempt)) {
                    // The provider cut the stream with an error event; the same request without
                    // streaming
                    // returns the complete reply, so ask once that way and keep streaming for later
                    // blocks.
                    streaming = false;
                    round--;
                    continue;
                }
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
                        TranslationAudit.recordFailure(audit, attempt, "http_" + response.status);
                        continue;
                    }
                    if (round == 0 && optional && portable.contains(identity))
                        throw new Failure("negotiation_pending", false, 1200);
                    throw new Failure("configuration_" + category, true, 0);
                }
                if (response.status < 200 || response.status >= 300)
                    throw new Failure(
                            "http_" + response.status,
                            response.status == 401
                                    || response.status == 403
                                    || response.status == 404,
                            response.retryAfter);
                JSONObject root =
                        reader != null && reader.streamed()
                                ? reader.response()
                                : new JSONObject(response.body);
                TranslationAudit.recordResponse(audit, attempt, root);
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
                RebuildProtocol.Plan plan = RebuildProtocol.parseBestEffort(content, s, b, context);
                if (plan.reboundEvents > 0)
                    trace(
                            control,
                            "REBUILD_SOURCE_REBOUND",
                            "block="
                                    + b.index
                                    + ";events_rebound="
                                    + plan.reboundEvents
                                    + ";rule=exact_owned_source_v1");
                plan = RebuildReview.withLayoutReview(plan, layout, context);
                TranslationAudit.recordUnitQualityOutcome(audit, 1, 0, 0);
                TranslationAudit.recordUnitBatchOutcome(audit, 1);
                return plan;
            } catch (RebuildProtocol.Invalid invalid) {
                TranslationAudit.recordUnitQualityOutcome(audit, 0, 1, 1);
                throw invalid;
            } catch (Exception error) {
                TransportFailure transport =
                        error instanceof TransportFailure ? (TransportFailure) error : null;
                Failure failure = error instanceof Failure ? (Failure) error : null;
                String kind = error.getClass().getSimpleName();
                String reason =
                        failure != null
                                ? failure.code
                                : transport != null ? transport.reason : kind;
                TranslationAudit.FailureCategory category =
                        transport != null
                                ? transport.category
                                : failure != null
                                        ? TranslationAudit.FailureCategory.HTTP_CONFIG
                                        : TranslationAudit.failureCategory(kind);
                trace(
                        control,
                        "REBUILD_HTTP_FAILURE",
                        "attempt="
                                + attempt
                                + ";reason="
                                + reason
                                + ";category="
                                + category.name()
                                + (transport != null
                                        ? ";phase="
                                                + transport.phase
                                                + ";elapsed_ms="
                                                + transport.elapsedMs
                                                + ";remaining_deadline_ms="
                                                + transport.remainingMs
                                        : ""));
                if (failure != null && failure.configuration) {
                    if (blocked.size() > 128) blocked.clear();
                    blocked.put(identity, failure.code);
                }
                TranslationAudit.recordFailure(audit, attempt, category, reason);
                throw error;
            }
        }
        throw new Failure("negotiation_exhausted", true, 0);
    }

    private static void trace(
            DeepSeekApiClient.RequestControl control, String stage, String detail) {
        if (control instanceof RebuildController.Job)
            ((RebuildController.Job) control).trace(stage, detail);
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
            TranslationSettings cfg,
            String body,
            DeepSeekApiClient.RequestControl control,
            long deadline,
            RebuildStream.Reader reader)
            throws Exception {
        long started = System.nanoTime();
        String phase = "connect";
        HttpURLConnection c =
                (HttpURLConnection) new URL(ProviderEndpoint.chat(cfg.baseUrl)).openConnection();
        // Declared outside the resource clause so the catch block can read the deadline's own timer
        // fact.
        NetworkDeadline guard = new NetworkDeadline(c, deadline);
        try (NetworkDeadline armed = guard) {
            if (control != null) control.onConnection(c);
            TranslationSourceAccess.checkActive(control);
            c.setRequestMethod("POST");
            c.setDoOutput(true);
            c.setUseCaches(false);
            c.setInstanceFollowRedirects(false);
            c.setConnectTimeout(Math.min(4000, TranslationSourceAccess.remaining(deadline)));
            c.setReadTimeout(TranslationSourceAccess.remaining(deadline));
            ProviderEndpoint.authenticate(c, cfg.baseUrl, cfg.apiKey);
            c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            c.setRequestProperty("Accept", "application/json");
            byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
            c.setFixedLengthStreamingMode(bytes.length);
            try (OutputStream out = c.getOutputStream()) {
                out.write(bytes);
            }
            phase = "read";
            if (control != null) control.onRequestBodySent();
            TranslationSourceAccess.checkActive(control);
            c.setReadTimeout(TranslationSourceAccess.remaining(deadline));
            int code = c.getResponseCode();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            InputStream stream = code >= 400 ? c.getErrorStream() : c.getInputStream();
            if (stream != null)
                try (InputStream in = stream) {
                    byte[] buf = new byte[4096];
                    while (true) {
                        TranslationSourceAccess.checkActive(control);
                        c.setReadTimeout(TranslationSourceAccess.remaining(deadline));
                        int n = in.read(buf);
                        if (n < 0) break;
                        if (out.size() + n > 2 * 1024 * 1024)
                            throw new IOException("response_too_large");
                        out.write(buf, 0, n);
                        if (reader != null && code < 400) reader.feed(buf, 0, n);
                    }
                }
            // HTTP dates use wall time; the controller converts this delay to elapsed time.
            long retry =
                    RetryAfter.delayMs(c.getHeaderField("Retry-After"), System.currentTimeMillis());
            return new Response(code, new String(out.toByteArray(), StandardCharsets.UTF_8), retry);
        } catch (IOException failure) {
            // Do not reinterpret transport failures as semantic or structural repair errors. A
            // connection
            // this controller itself stopped or retired is an intentional cancellation, not a wire
            // fault;
            // a real deadline expiry is reported from the deadline's own timer fact.
            boolean intentional = false;
            try {
                TranslationSourceAccess.checkActive(control);
            } catch (Exception cancelled) {
                intentional = true;
            }
            throw new TransportFailure(failure, phase, started, deadline, guard, intentional);
        } finally {
            c.disconnect();
            if (control != null) control.onConnection(null);
        }
    }

    static String test(TranslationSettings cfg) throws Exception {
        reset();
        List<RebuildSource.Word> words = new ArrayList<>();
        String[] text = {"This", "is", "a", "subtitle", "test."};
        for (int i = 0; i < text.length; i++)
            words.add(
                    new RebuildSource.Word(
                            text[i], i * 600, (i + 1) * 600, 0, RebuildSource.Precision.NATIVE));
        RebuildSource s = new RebuildSource(words);
        CaptionLanguageContext context = CaptionLanguageContext.explicit("en", "zh-Hans");
        RebuildPlanner.Block b = RebuildPlanner.plan(s, context).get(0);
        RebuildProtocol.Plan p = translate(s, b, cfg, "zh-Hans", null, true, "", context);
        StringBuilder out = new StringBuilder();
        for (RebuildProtocol.Event e : p.events) out.append(e.text);
        return out.toString();
    }
}
