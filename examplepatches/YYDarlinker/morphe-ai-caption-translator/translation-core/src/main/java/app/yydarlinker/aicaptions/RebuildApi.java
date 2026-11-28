package app.yydarlinker.aicaptions;

import org.json.*;
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
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

/** One logical translation attempt, with at most one remembered optional-parameter negotiation. */
public final class RebuildApi {
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

        final RebuildRequestObserver.FailureCategory category;

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
    static RebuildRequestObserver.FailureCategory transportCategory(
            Exception cause, String phase, NetworkDeadline guard, boolean cancelled) {
        if (cancelled) return RebuildRequestObserver.FailureCategory.CANCELLED;
        if (guard != null && guard.timerFired())
            return RebuildRequestObserver.FailureCategory.DEADLINE_EXPIRED;
        if (cause instanceof SocketTimeoutException)
            return "connect".equals(phase)
                    ? RebuildRequestObserver.FailureCategory.CONNECT_TIMEOUT
                    : RebuildRequestObserver.FailureCategory.READ_TIMEOUT;
        return RebuildRequestObserver.FailureCategory.NETWORK_IO;
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
                + RebuildApi.SENTENCE
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
                            + RebuildApi.SENTENCE
                            + " Source language: "
                            + context.sourceCode
                            + ". Target language: "
                            + context.targetCode
                            + ". User translation preferences: "
                            + context.preference(cfg);
        return block != null && block.authored
                ? base + RebuildApi.displayCueRule(block)
                : base;
    }

    static RebuildProtocol.Plan translate(
            RebuildSource s,
            RebuildPlanner.Block b,
            TranslationSettings cfg,
            String lang,
            CaptionApiClient.RequestControl control,
            boolean priority,
            String repair,
            CaptionLanguageContext context)
            throws Exception {
        JSONObject payload = RebuildProtocol.payload(s, b, lang, repair, context);
        CaptionPresentationBudget layout = TranslationOutput.budget();
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
        RebuildRequestObserver.Sink observer = RebuildRequestObserver.observer();
        observer.begin(cfg);
        int attempt = 0;
        for (int round = 0; round < 2; round++) {
            TranslationSourceAccess.checkActive(control);
            // Every actual POST, including negotiation and both stream fallback paths, enters
            // here. Admission is separate from finishSent permission to read the previous POST.
            if (control != null && !control.tryBeginAttempt()) throw new InterruptedException();
            String body = request.toString();
            observer.attempt();
            attempt++;
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
                    observer.failure(RebuildRequestObserver.FailureCategory.HTTP_CONFIG,
                            "http_" + response.status);
                    round--;
                    continue;
                }
                if (streaming && RebuildStream.cut(reader, request)) {
                    String reason = "stream_" + reader.error();
                    observer.failure(RebuildRequestObserver.failureCategory(reason), reason);
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
                        observer.failure(RebuildRequestObserver.FailureCategory.HTTP_CONFIG,
                                "http_" + response.status);
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
                observer.response(attempt, root);
                JSONObject choice = root.getJSONArray("choices").getJSONObject(0);
                String finish = choice.optString("finish_reason");
                String content = choice.getJSONObject("message").optString("content", "");
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
                return RebuildReview.withLayoutReview(plan, layout, context);
            } catch (RebuildProtocol.Invalid invalid) {
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
                RebuildRequestObserver.FailureCategory category =
                        transport != null
                                ? transport.category
                                : failure != null
                                        ? RebuildRequestObserver.FailureCategory.HTTP_CONFIG
                                        : RebuildRequestObserver.failureCategory(kind);
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
                observer.failure(category, reason);
                throw error;
            }
        }
        throw new Failure("negotiation_exhausted", true, 0);
    }

    private static void trace(
            CaptionApiClient.RequestControl control, String stage, String detail) {
        if (control instanceof RebuildController.Job)
            ((RebuildController.Job) control).trace(stage, detail);
    }

    private record Response(int status, String body, long retryAfter) {}

    private static Response send(
            TranslationSettings cfg,
            String body,
            CaptionApiClient.RequestControl control,
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

    public static String test(TranslationSettings cfg) throws Exception {
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

    /**
     * Appended only for a manually authored track. It does not replace {@link #SENTENCE}: the
     * translation quality instructions stay the same as an automatic track. It states that the
     * author's cue ranges are the preferred display boundaries, while a sentence that the author
     * cut in half may stay whole in one event: the display projection publishes such an event as
     * its own page instead of discarding it.
     */
    static String displayCueRule(RebuildPlanner.Block block) {
        return " Authored display groups are the preferred page boundaries. The display_cues field"
                + " lists each group's first-last owned token ids. Prefer keeping every event"
                + " inside one group, and use several natural events for a group when that keeps"
                + " the sentence intact. When the author's boundary cuts a sentence, a complete"
                + " sentence wins: an event may span the boundary. Cover every group's text.";
    }

    static final String SENTENCE =
            " Event sizing: one event is one complete clause or sentence that reads naturally on its"
                + " own. Local presentation handles line count and page size. Punctuate every event's text for its own"
                + " range: end with a full stop when that range ends a sentence, a comma when the"
                + " clause continues into the next event, and never drop the closing punctuation."
                + " A long source sentence may stay in one event, or be split only where each side"
                + " keeps its own subject and predicate. Never leave a prepositional phrase, a verb"
                + " and its object, a comparison such as 'more A than B', or a correlative pair on"
                + " opposite sides of an event boundary, and never shorten an event merely to make it"
                + " fit: shorter is only better when the meaning is still complete.";
}



/** Request lifecycle observer for offline fixtures and opt-in live test budgets. */
final class RebuildRequestObserver {
    enum FailureCategory {
        CANCELLED,
        DEADLINE_EXPIRED,
        CONNECT_TIMEOUT,
        READ_TIMEOUT,
        NETWORK_IO,
        HTTP_CONFIG,
        OTHER
    }

    interface Sink {
        default void begin(TranslationSettings config) {}

        default void attempt() {}

        default void response(int attempt, JSONObject reply) {}

        default void failure(FailureCategory category, String reason) {}
    }

    private static volatile Sink sink = new Sink() {};

    static void install(Sink value) {
        sink = java.util.Objects.requireNonNull(value);
    }

    static Sink observer() {
        return sink;
    }

    static FailureCategory failureCategory(String kind) {
        if (kind == null) return FailureCategory.OTHER;
        String s = kind.toLowerCase(java.util.Locale.ROOT);
        if (s.contains("cancel")) return FailureCategory.CANCELLED;
        if (s.contains("deadline_expired")) return FailureCategory.DEADLINE_EXPIRED;
        if (s.startsWith("http")) return FailureCategory.HTTP_CONFIG;
        if (s.contains("timeout"))
            return s.contains("connect")
                    ? FailureCategory.CONNECT_TIMEOUT
                    : FailureCategory.READ_TIMEOUT;
        if (s.contains("network") || s.contains("socket") || s.contains("interrupt"))
            return FailureCategory.NETWORK_IO;
        return FailureCategory.OTHER;
    }
}

/**
 * Portable default request: vendor-specific thinking parameters are never inferred from model
 * names.
 */
final class ProviderRequestPolicy {
    static JSONObject request(
            TranslationSettings config, String prompt, JSONObject payload, int limit)
            throws Exception {
        JSONObject r =
                new JSONObject()
                        .put("model", config.model)
                        .put("stream", false)
                        .put("max_tokens", Math.max(256, Math.min(3072, limit)))
                        .put(
                                "messages",
                                new JSONArray()
                                        .put(
                                                new JSONObject()
                                                        .put("role", "system")
                                                        .put(
                                                                "content",
                                                                "Return valid JSON only. "
                                                                        + prompt))
                                        .put(
                                                new JSONObject()
                                                        .put("role", "user")
                                                        .put("content", payload.toString())))
                        .put("response_format", new JSONObject().put("type", "json_object"));
        String host = ProviderEndpoint.host(config.baseUrl);
        if ("api.openai.com".equals(host)) {
            r.put("max_completion_tokens", r.getInt("max_tokens"));
            r.remove("max_tokens");
        }
        if ("api.minimax.io".equals(host) || "api.minimaxi.com".equals(host))
            r.put("reasoning_split", true);
        if ("api.deepseek.com".equals(host))
            r.put("thinking", new JSONObject().put("type", "disabled"));
        if (ProviderEndpoint.bailian(host)
                || "api.siliconflow.cn".equals(host)
                || "api.siliconflow.com".equals(host)) r.put("enable_thinking", false);
        if (ProviderEndpoint.bailian(host)
                && (config.model.equals("qwen3.8-flash")
                        || config.model.startsWith("qwen3.8-flash-"))) {
            r.put("response_format", RebuildProtocol.schema());
            // Copy-sensitive translation: no novelty/repetition incentive. Keep the provider's
            // temperature until controlled quality evaluation justifies changing it.
            r.put("presence_penalty", 0);
        }
        if ("api.anthropic.com".equals(host))
            r.remove(
                    "response_format"); // Compatibility API ignores it; prompt still requires JSON.
        if ("open.bigmodel.cn".equals(host) || ProviderEndpoint.ark(host))
            r.put("thinking", new JSONObject().put("type", "disabled"));
        // Unknown gateways keep the portable request. Never infer vendor fields from model IDs.
        return r;
    }

    /** The provider refused this request's text, not its form (Bailian: data_inspection_failed). */
    static final String INSPECTION_CODE = "content_filter";

    static boolean inspected(String body) {
        String text = body == null ? "" : body.toLowerCase(Locale.ROOT);
        return text.contains("data_inspection_failed") || text.contains("inappropriate content");
    }

    static String reason(String body) {
        String text = body == null ? "" : body.toLowerCase(Locale.ROOT);
        if (text.contains("json") && (text.contains("messages") || text.contains("prompt")))
            return "json_prompt_required";
        if (text.contains("response_format")
                || text.contains("json_object")
                || text.contains("json_schema")) return "response_format_unsupported";
        if (text.contains("presence_penalty")) return "presence_penalty_unsupported";
        if (text.contains("thinking")) return "thinking_unsupported";
        if (text.contains("model")) return "model_rejected";
        if (text.contains("token")) return "output_budget_rejected";
        return "invalid_request"; // Never expose raw provider text or credentials.
    }

    static boolean removeOptional(JSONObject request, String category) {
        boolean changed = false;
        if (category != null && category.contains("response_format")) {
            JSONObject format = request.optJSONObject("response_format");
            if (format != null && "json_schema".equals(format.optString("type"))) {
                try {
                    request.put("response_format", new JSONObject().put("type", "json_object"));
                } catch (JSONException impossible) {
                    throw new IllegalStateException(impossible);
                }
                return true;
            }
            changed = request.has("response_format");
            request.remove("response_format");
            return changed;
        }
        if (category != null && category.contains("presence_penalty")) {
            changed = request.has("presence_penalty");
            request.remove("presence_penalty");
            return changed;
        }
        if (category != null && category.contains("thinking")) {
            changed = request.has("thinking") || request.has("enable_thinking");
            request.remove("thinking");
            request.remove("enable_thinking");
            return changed;
        }
        return removeOptional(request);
    }

    static boolean removeOptional(JSONObject request) {
        boolean changed =
                request.has("thinking")
                        || request.has("enable_thinking")
                        || request.has("response_format");
        request.remove("thinking");
        request.remove("enable_thinking");
        request.remove("response_format");
        return changed; // Output budget is NEVER removed.
    }
}
