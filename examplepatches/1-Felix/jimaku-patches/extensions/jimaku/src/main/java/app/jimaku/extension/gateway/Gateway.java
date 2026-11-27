package app.jimaku.extension.gateway;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.regex.Pattern;

import app.jimaku.extension.BuildConfig;
import app.jimaku.extension.Languages;
import app.jimaku.extension.jobs.JobKind;
import app.jimaku.extension.jobs.JobState;
import app.jimaku.extension.subtitles.Line;

/**
 * Jimaku's gateway, as the extension's {@code lib/gateway.ts} calls it, with the same checks on
 * each answer. Reads of the shared cache are anonymous: a request names the video and the
 * language, and carries no cookie, no credentials and no account data. Making subtitles needs an
 * install, created on first need; only those requests carry its secret. Calls block; run them off
 * the main thread.
 */
public final class Gateway implements Reads, Writes, Accounts {
    public static final String ORIGIN = "https://api.jimaku.app";
    private static final int TIMEOUT_MILLIS = 15_000;
    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{11}");
    private static final String JSON = "application/json";
    private static final Pattern LINK_CODE = Pattern.compile("[A-Za-z0-9_-]{32,64}");
    private static final Pattern SESSION = Pattern.compile("cs_(?:test_|live_)?[A-Za-z0-9]{1,240}");
    private static final Pattern PAYMENT_INTENT = Pattern.compile("pi_[A-Za-z0-9_]{1,240}");

    private final String origin;
    private final String userAgent;
    private final int timeoutMillis;
    private final InstallStore installs;
    /** The install being created, which concurrent callers share. */
    private CompletableFuture<Install> creating;

    public Gateway(InstallStore installs) {
        this(ORIGIN, userAgent(), TIMEOUT_MILLIS, installs);
    }

    Gateway(String origin, String userAgent, int timeoutMillis, InstallStore installs) {
        this.origin = origin;
        this.userAgent = userAgent;
        this.timeoutMillis = timeoutMillis;
        this.installs = installs;
    }

    /** Names only Jimaku and the bundle's version, not the phone. */
    public static String userAgent() {
        return "Jimaku-Android/" + BuildConfig.BUNDLE_VERSION;
    }

    public static boolean isVideoId(String value) {
        return value != null && VIDEO_ID.matcher(value).matches();
    }

    /** What the shared cache holds for {@code video}, or null when it holds nothing. */
    @Override
    public Lookup lookup(String video, Cancellation cancellation) throws GatewayException {
        return lookup(video, false, cancellation);
    }

    /**
     * Past the edge cache: the gateway never stores an answer under {@code ?fresh}, while an
     * Authorization header would still be answered from it.
     */
    @Override
    public Lookup freshLookup(String video, Cancellation cancellation) throws GatewayException {
        return lookup(video, true, cancellation);
    }

    private Lookup lookup(String video, boolean fresh, Cancellation cancellation) throws GatewayException {
        if (!isVideoId(video)) throw new GatewayException("bad_video");
        Http.Response response = send(get("/videos/" + video + (fresh ? "?fresh=1" : "")), cancellation);
        if (response.status == 404) return null;
        if (!response.ok()) throw refusal(response);
        JSONObject answer = object(response);
        Object original = answer.opt("original");
        Object translations = answer.opt("translations");
        if (!(original instanceof String) || !Languages.isLanguageCode((String) original)
                || !(translations instanceof JSONArray)) {
            throw new GatewayException("bad_answer");
        }
        JSONArray list = (JSONArray) translations;
        List<String> langs = new ArrayList<>();
        for (int i = 0; i < list.length(); i++) {
            Object lang = list.opt(i);
            if (lang instanceof String && Languages.isLanguageCode((String) lang)) langs.add((String) lang);
        }
        return new Lookup((String) original, langs, Boolean.TRUE.equals(answer.opt("mixed")));
    }

    /** The lines of {@code video}'s subtitles in {@code lang}. */
    @Override
    public List<Line> document(String video, String lang, Cancellation cancellation) throws GatewayException {
        if (!isVideoId(video)) throw new GatewayException("bad_video");
        if (!Languages.isLanguageCode(lang)) throw new GatewayException("bad_language");
        return documentLines(send(get("/videos/" + video + "/" + lang), cancellation));
    }

    /** The transcript as said, the video's original caption, also where it is in two languages. */
    @Override
    public List<Line> original(String video, Cancellation cancellation) throws GatewayException {
        if (!isVideoId(video)) throw new GatewayException("bad_video");
        return documentLines(send(get("/videos/" + video + "/original"), cancellation));
    }

    @Override
    public StartedJob start(StartRequest request, Cancellation cancellation) throws GatewayException {
        if (!isVideoId(request.video)) throw new GatewayException("bad_video");
        StringBuilder query = new StringBuilder("/jobs?video=").append(form(request.video))
                .append("&lang=").append(form(request.lang))
                .append("&method=").append(form(request.method))
                .append("&duration=").append(Math.max(1, Math.round(request.duration)));
        if (request.source != null) query.append("&source=").append(form(request.source));
        byte[] body = request.body != null ? request.body.getBytes(StandardCharsets.UTF_8) : null;
        Http.Response response = authed(Http.Request.post(uri(query.toString()), JSON, body), cancellation);
        if (!response.ok()) throw refusal(response);
        JSONObject answer = object(response);
        Object job = answer.opt("job");
        JobKind kind = kindOf(answer.opt("kind"));
        JobState state = stateOf(answer.opt("state"));
        if (!(job instanceof String) || kind == null || state == null) throw new GatewayException("bad_answer");
        return new StartedJob((String) job, kind, state, numberOrNull(answer.opt("percent")), Boolean.TRUE.equals(answer.opt("joined")));
    }

    @Override
    public JobStatus job(String id, Cancellation cancellation) throws GatewayException {
        Http.Response response = authed(get("/jobs/" + segment(id)), cancellation);
        if (!response.ok()) throw refusal(response);
        JSONObject answer = object(response);
        Object job = answer.opt("job"), video = answer.opt("video"), lang = answer.opt("lang"), reason = answer.opt("reason");
        JobKind kind = kindOf(answer.opt("kind"));
        JobState state = stateOf(answer.opt("state"));
        if (!(job instanceof String) || !(video instanceof String) || kind == null || !(lang instanceof String) || state == null) {
            throw new GatewayException("bad_answer");
        }
        return new JobStatus((String) job, (String) video, kind, (String) lang, state, numberOrNull(answer.opt("percent")),
                reason instanceof String ? (String) reason : null);
    }

    @Override
    public StoppedJob stop(String id, Cancellation cancellation) throws GatewayException {
        Http.Response response = authed(Http.Request.post(uri("/jobs/" + segment(id) + "/stop"), null, null), cancellation);
        if (!response.ok()) throw refusal(response);
        JSONObject answer = object(response);
        Double refunded = numberOrNull(answer.opt("refunded"));
        // As in the extension: kept is there, and either null or the transcript.
        Object kept = answer.has("kept") ? answer.opt("kept") : null;
        if (refunded == null || (kept != JSONObject.NULL && !"transcript".equals(kept))) throw new GatewayException("bad_answer");
        return new StoppedJob(refunded, "transcript".equals(kept));
    }

    @Override
    public List<Line> partial(String id, Cancellation cancellation) throws GatewayException {
        Http.Response response = authed(get("/jobs/" + segment(id) + "/partial"), cancellation);
        if (response.status == 404) return Collections.emptyList();
        return documentLines(response);
    }

    @Override
    public CaptionResult result(String id, Cancellation cancellation) throws GatewayException {
        Http.Response response = authed(get("/jobs/" + segment(id) + "/result"), cancellation);
        if (!response.ok()) throw refusal(response);
        JSONObject answer = object(response);
        List<Line> lines = lines(answer.opt("lines"));
        Object original = answer.opt("original");
        if (original == null || original == JSONObject.NULL) return new CaptionResult(lines, null, null);
        JSONObject from = original instanceof JSONObject ? (JSONObject) original : new JSONObject();
        Object lang = from.opt("lang");
        if (!(lang instanceof String) || !Languages.isLanguageCode((String) lang)) throw new GatewayException("bad_answer");
        return new CaptionResult(lines, (String) lang, lines(from.opt("lines")));
    }

    @Override
    public Me me(Cancellation cancellation) throws GatewayException {
        Http.Request request = get("/me");
        Http.Response response = installs.load() != null ? authed(request, cancellation) : send(request, cancellation);
        if (!response.ok()) throw refusal(response);
        return Me.read(object(response));
    }

    @Override
    public String linkCode(Cancellation cancellation) throws GatewayException {
        Http.Response response = authed(Http.Request.post(uri("/account/link-codes"), null, null), cancellation);
        if (!response.ok()) throw refusal(response);
        Object code = object(response).opt("code");
        if (!(code instanceof String) || !LINK_CODE.matcher((String) code).matches()) throw new GatewayException("bad_answer");
        return (String) code;
    }

    @Override
    public double claim(String accountId, Cancellation cancellation) throws GatewayException {
        byte[] body = ("{\"accountId\":" + JSONObject.quote(accountId) + "}").getBytes(StandardCharsets.UTF_8);
        Http.Response response = authed(Http.Request.post(uri("/claim"), JSON, body), cancellation);
        if (!response.ok()) throw refusal(response);
        JSONObject answer = object(response);
        Object balance = answer.opt("balance"), claimed = answer.opt("accountId");
        if (!isSafeInteger(balance) || !(claimed instanceof String) || ((String) claimed).isEmpty()
                || !Boolean.TRUE.equals(answer.opt("granted"))) {
            throw new GatewayException("bad_answer");
        }
        if (!claimed.equals(accountId)) throw new GatewayException("account_changed");
        return ((Number) balance).doubleValue();
    }

    /** An amount the gateway sells: €1 to €100 in whole euros. */
    public static boolean isPurchaseAmount(int cents) {
        return cents >= 100 && cents <= 10_000 && cents % 100 == 0;
    }

    public static boolean isPurchaseSession(String value) {
        return value != null && SESSION.matcher(value).matches();
    }

    @Override
    public Checkout checkout(int cents, Cancellation cancellation) throws GatewayException {
        if (!isPurchaseAmount(cents)) throw new GatewayException("invalid_amount");
        byte[] body = ("{\"cents\":" + cents + ",\"from\":\"app\"}").getBytes(StandardCharsets.UTF_8);
        Http.Response response = authed(Http.Request.post(uri("/checkout"), JSON, body), cancellation);
        if (!response.ok()) throw refusal(response);
        JSONObject answer = object(response);
        Object url = answer.opt("url"), session = answer.opt("session");
        if (!(url instanceof String) || !(session instanceof String) || !isPurchaseSession((String) session)) {
            throw new GatewayException("bad_answer");
        }
        URI page;
        try {
            page = new URI((String) url);
        } catch (java.net.URISyntaxException e) {
            throw new GatewayException("bad_answer", e);
        }
        // Only Stripe's own page, as the extension's readCheckout has it.
        if (!"https".equals(page.getScheme()) || !"checkout.stripe.com".equals(page.getHost()) || page.getPort() != -1
                || page.getRawUserInfo() != null) {
            throw new GatewayException("bad_answer");
        }
        return new Checkout(page.toString(), (String) session);
    }

    @Override
    public Purchase confirm(String session, Cancellation cancellation) throws GatewayException {
        if (!isPurchaseSession(session)) throw new GatewayException("invalid_session");
        Http.Response response = authed(Http.Request.post(uri("/purchases/" + segment(session) + "/confirm"), null, null), cancellation);
        if (!response.ok()) throw refusal(response);
        JSONObject answer = object(response);
        Double balance = numberOrNull(answer.opt("balance")), minutes = numberOrNull(answer.opt("minutes"));
        Object intent = answer.opt("paymentIntent");
        if (balance == null || minutes == null || minutes != Math.rint(minutes) || minutes <= 0 || numberOrNull(answer.opt("paidAt")) == null
                || !(intent instanceof String) || !PAYMENT_INTENT.matcher((String) intent).matches()) {
            throw new GatewayException("bad_answer");
        }
        return new Purchase(balance, minutes.longValue());
    }

    @Override
    public Me unlink(Cancellation cancellation) throws GatewayException {
        Http.Response response = authed(Http.Request.post(uri("/account/unlink"), null, null), cancellation);
        if (!response.ok()) throw refusal(response);
        return Me.read(object(response));
    }

    private static boolean isSafeInteger(Object value) {
        if (!(value instanceof Number)) return false;
        double number = ((Number) value).doubleValue();
        return Math.abs(number) <= 9007199254740991.0 && number == Math.rint(number);
    }

    /** The install, created the first time something needs one. Concurrent callers share one creation. */
    private Install install() throws GatewayException {
        CompletableFuture<Install> shared;
        boolean mine = false;
        synchronized (this) {
            Install stored = installs.load();
            if (stored != null) return stored;
            if (creating == null) {
                creating = new CompletableFuture<>();
                mine = true;
            }
            shared = creating;
        }
        if (mine) {
            try {
                shared.complete(create());
            } catch (GatewayException | RuntimeException e) {
                shared.completeExceptionally(e);
            } finally {
                synchronized (this) {
                    creating = null;
                }
            }
        }
        try {
            return shared.get();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new GatewayException("cancelled", e);
        } catch (ExecutionException e) {
            Throwable cause = e.getCause();
            if (cause instanceof GatewayException) throw (GatewayException) cause;
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            throw new GatewayException("internal", cause);
        }
    }

    /** A new install. No video's leaving cancels it: other requests may be waiting on it. */
    private Install create() throws GatewayException {
        Http.Response response = send(Http.Request.post(uri("/installs"), null, null), new Cancellation());
        if (!response.ok()) throw refusal(response);
        JSONObject answer = object(response);
        Object install = answer.opt("install"), secret = answer.opt("secret");
        if (!(install instanceof String) || !(secret instanceof String)) throw new GatewayException("bad_answer");
        Install created = new Install((String) install, (String) secret);
        synchronized (this) {
            installs.save(created);
        }
        return created;
    }

    /** A request on behalf of the install. A secret the gateway no longer knows is dropped and replaced once. */
    private Http.Response authed(Http.Request request, Cancellation cancellation) throws GatewayException {
        for (boolean retried = false; ; retried = true) {
            Install used = install();
            Http.Response response = send(request.with("Authorization", "Bearer " + used.secret), cancellation);
            if (response.status != 401 || retried || !"unknown_install".equals(refusal(response).code)) return response;
            synchronized (this) {
                // Another request may have replaced it already; that one stays.
                Install now = installs.load();
                if (now != null && now.secret.equals(used.secret)) installs.save(null);
            }
        }
    }

    /** The lines of a subtitle document; the document carries more, which Jimaku doesn't need. */
    private static List<Line> documentLines(Http.Response response) throws GatewayException {
        if (!response.ok()) throw refusal(response);
        return lines(object(response).opt("lines"));
    }

    private static List<Line> lines(Object lines) throws GatewayException {
        if (!(lines instanceof JSONArray)) throw new GatewayException("bad_answer");
        JSONArray list = (JSONArray) lines;
        List<Line> result = new ArrayList<>(list.length());
        for (int i = 0; i < list.length(); i++) {
            Object item = list.opt(i);
            if (!(item instanceof JSONObject)) throw new GatewayException("bad_answer");
            JSONObject line = (JSONObject) item;
            Object start = line.opt("start");
            Object end = line.opt("end");
            Object text = line.opt("text");
            if (!(start instanceof Number) || !(end instanceof Number) || !(text instanceof String)) {
                throw new GatewayException("bad_answer");
            }
            result.add(new Line(((Number) start).doubleValue(), ((Number) end).doubleValue(), (String) text));
        }
        return result;
    }

    private static JobKind kindOf(Object value) {
        return value instanceof String ? JobKind.of((String) value) : null;
    }

    private static JobState stateOf(Object value) {
        return value instanceof String ? JobState.of((String) value) : null;
    }

    private static Double numberOrNull(Object value) {
        if (!(value instanceof Number)) return null;
        double number = ((Number) value).doubleValue();
        return Double.isFinite(number) ? number : null;
    }

    private Http.Request get(String path) {
        return Http.Request.get(uri(path));
    }

    private URI uri(String path) {
        return URI.create(origin + path);
    }

    /** A query value, encoded as the extension's URLSearchParams encodes it. */
    private static String form(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    /** A path segment, encoded as encodeURIComponent encodes it. */
    private static String segment(String value) {
        StringBuilder out = new StringBuilder();
        for (byte b : value.getBytes(StandardCharsets.UTF_8)) {
            char c = (char) (b & 0xff);
            boolean plain = (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || "-_.!~*'()".indexOf(c) >= 0;
            if (plain) out.append(c);
            else out.append('%').append(String.format("%02X", b & 0xff));
        }
        return out.toString();
    }

    private Http.Response send(Http.Request request, Cancellation cancellation) throws GatewayException {
        try {
            return Http.send(request, userAgent, timeoutMillis, cancellation);
        } catch (Cancellation.CancelledException e) {
            throw new GatewayException("cancelled", e);
        } catch (IOException e) {
            throw new GatewayException(cancellation.isCancelled() ? "cancelled" : "offline", e);
        }
    }

    /** The answer's JSON object; an empty one when it holds something else, as the extension's record() does. */
    private static JSONObject object(Http.Response response) throws GatewayException {
        Object value;
        try {
            value = new JSONTokener(response.text()).nextValue();
        } catch (JSONException e) {
            throw new GatewayException(response.ok() ? "bad_answer" : "http_" + response.status, e);
        }
        return value instanceof JSONObject ? (JSONObject) value : new JSONObject();
    }

    /** The gateway's own error code where its answer has one, with what came with it. */
    private static GatewayException refusal(Http.Response response) {
        try {
            JSONObject answer = object(response);
            Object error = answer.opt("error");
            if (error instanceof String) return new GatewayException((String) error, extra(answer));
        } catch (GatewayException ignored) {
            // No readable answer: fall back to the status.
        }
        return new GatewayException("http_" + response.status);
    }

    /** Everything an error answer carries besides its code, such as the running job's video for busy. */
    private static Map<String, Object> extra(JSONObject answer) {
        Map<String, Object> extra = new HashMap<>();
        for (Iterator<String> keys = answer.keys(); keys.hasNext(); ) {
            String key = keys.next();
            if (!key.equals("error")) extra.put(key, answer.opt(key));
        }
        return extra;
    }
}
