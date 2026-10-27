package app.proxma.simosa;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Claims milestone level rewards (day 10/20/30 ...) that the app grants on a level-up.
 *
 * <p>The app claims a level only from its check-in result handler, when the new
 * {@code progress.current_level} is above the one before the check-in. When our worker does the
 * check-in that handler never runs, so the claim has to be made here.
 *
 * <p>The claim goes through the app's own {@code DailyRewardAuthTokenRepo.claimCheckIn}, which
 * wraps the request in the signed MSA envelope (customer headers, timestamp, request config) and
 * maps the gateway's result code to {@code ApiResources.Success/Failure}. A level is recorded as
 * done only on Success, or after {@link #MAX_ATTEMPTS} definitive failures.
 *
 * <p>Prefs {@code proxma_simosa}, per account: {@code proxma_milestone_done_<acct>} (claimed or
 * given-up levels, comma separated), {@code proxma_milestone_try_<acct>_<level>} (failed attempts),
 * {@code proxma_milestone_dry_<acct>} (day of the last dry run). The old
 * {@code proxma_milestone_<acct>} int was written on any HTTP 2xx of an unsigned request, so the
 * level it names is retried once.
 */
public final class MilestoneClaim {

    private static final String TAG = "PROXMA_CLAIM";
    private static final String PREFS = "proxma_simosa";
    private static final String KEY_LEGACY_PREFIX = "proxma_milestone_";
    private static final String KEY_DONE_PREFIX = "proxma_milestone_done_";
    private static final String KEY_TRY_PREFIX = "proxma_milestone_try_";
    private static final String KEY_DRY_PREFIX = "proxma_milestone_dry_";

    private static final String STATE_URL = "https://api-prod-dailycheckin.simosa.app/checkin/state";
    private static final String LEVELS_URL = "https://api-prod-dailycheckin.simosa.app/levels";

    private static final String REMOTE_MODULES = "com.jazz.jazzworld.data.network.di.RemoteModules";
    private static final String CLAIM_REQUEST =
        "com.jazz.jazzworld.data.appmodels.dailyreward.request.DailyRewardClaimCheckInRequest";
    private static final String API_RESOURCES_KT =
        "com.jazz.jazzworld.data.network.genericapis.helper.ApiResourcesKt";

    private static final int TIMEOUT_MS = 15000;
    private static final int CLAIM_TIMEOUT_S = 45;
    private static final int MAX_ATTEMPTS = 3;

    static String sResult = "n/a";

    private MilestoneClaim() {}

    public static String getResult() { return sResult; }

    public static void tryClaimMilestone(Context context, String bearer) {
        sResult = "n/a";
        try {
            tryClaimInner(context, bearer);
        } catch (Throwable t) {
            log("MILESTONE_ERR " + t);
            sResult = "error: " + t.getMessage();
        }
    }

    private static void tryClaimInner(Context context, String bearer) throws Exception {
        String account = AccountScope.id(context);
        if (account == null) {
            log("MILESTONE_SKIP no-account");
            sResult = "skip no-account";
            return;
        }

        HttpResult stateRes = httpGet(STATE_URL, bearer);
        if (stateRes.code == 401 || stateRes.code == 419) {
            log("MILESTONE_TOKEN_EXPIRED " + stateRes.code + " refreshing");
            String fresh = BackgroundCheckin.refreshBearer(context);
            if (fresh != null) {
                bearer = fresh;
                stateRes = httpGet(STATE_URL, fresh);
            }
        }
        if (stateRes.code < 200 || stateRes.code >= 300) {
            log("MILESTONE_STATE_FAIL " + stateRes.code);
            sResult = "state fail " + stateRes.code;
            return;
        }
        JSONObject stateRoot = new JSONObject(stateRes.body);
        if (!stateRoot.optBoolean("success", false)) {
            log("MILESTONE_STATE_ERR " + truncate(stateRes.body));
            sResult = "state error";
            return;
        }
        JSONObject data = stateRoot.getJSONObject("data");
        JSONObject progress = data.optJSONObject("progress");
        int currentLevel = progress != null ? progress.optInt("current_level", 0) : 0;
        int nextLevel = progress != null ? progress.optInt("next_level", currentLevel + 1) : currentLevel + 1;
        int daysToNext = progress != null ? progress.optInt("days_to_next_level", -1) : -1;

        SharedPreferences prefs = context.getSharedPreferences(PREFS, 0);
        Set<Integer> done = loadDone(prefs, account, currentLevel);

        List<Integer> pending = new ArrayList<>();
        if (currentLevel > 0 && !done.contains(currentLevel)) {
            pending.add(currentLevel);
        }
        for (int level = 1; level < currentLevel; level++) {
            if (!done.contains(level)) {
                pending.add(level);
            }
        }

        if (pending.isEmpty()) {
            dryRunOncePerDay(context, prefs, account, bearer, currentLevel, nextLevel, daysToNext);
            return;
        }

        JSONArray levels = fetchLevels(bearer);
        if (levels == null) {
            return;
        }

        String today = today();
        StringBuilder summary = new StringBuilder(state(currentLevel, nextLevel, daysToNext)).append("; ");
        for (int level : pending) {
            String tryKey = KEY_TRY_PREFIX + account + "_" + level;
            String[] tried = prefs.getString(tryKey, "0:").split(":", 2);
            int attemptsSoFar = parseInt(tried[0]);
            if (tried.length > 1 && today.equals(tried[1])) {
                summary.append("L").append(level).append(" rejected today (")
                    .append(attemptsSoFar).append("/").append(MAX_ATTEMPTS).append("), retry tomorrow; ");
                continue;
            }
            ClaimValues values = valuesFor(levels, level);
            if (values == null) {
                log("MILESTONE_NO_REWARDS level=" + level);
                markDone(prefs, account, done, level);
                summary.append("L").append(level).append(" no rewards; ");
                continue;
            }
            log("MILESTONE_CLAIM level=" + level + " " + values);
            Outcome outcome = claimViaApp(context, values);
            log("MILESTONE_RESULT level=" + level + " " + outcome.kind + " " + outcome.detail);
            if (outcome.kind == Outcome.SUCCESS) {
                markDone(prefs, account, done, level);
                summary.append("claimed L").append(level).append("; ");
            } else if (outcome.kind == Outcome.REJECTED) {
                int attempts = attemptsSoFar + 1;
                prefs.edit().putString(tryKey, attempts + ":" + today).apply();
                if (attempts >= MAX_ATTEMPTS) {
                    markDone(prefs, account, done, level);
                    summary.append("L").append(level).append(" gave up: ").append(outcome.detail).append("; ");
                } else {
                    summary.append("L").append(level).append(" rejected ").append(attempts)
                        .append("/").append(MAX_ATTEMPTS).append(": ").append(outcome.detail).append("; ");
                }
            } else {
                summary.append("L").append(level).append(" will retry: ").append(outcome.detail).append("; ");
                break;
            }
        }
        sResult = summary.toString().trim();
    }

    private static String keysOf(JSONObject object) {
        StringBuilder sb = new StringBuilder();
        java.util.Iterator<String> it = object.keys();
        while (it.hasNext()) {
            if (sb.length() > 0) sb.append('|');
            sb.append(it.next());
        }
        return sb.toString();
    }

    /** True when the last run produced something worth showing, not just the level state. */
    public static boolean hasNews() {
        return !"n/a".equals(sResult) && !sResult.matches("L\\d+ next L\\d+( in -?\\d+d)?");
    }

    private static String state(int currentLevel, int nextLevel, int daysToNext) {
        return "L" + currentLevel + " next L" + nextLevel + (daysToNext >= 0 ? " in " + daysToNext + "d" : "");
    }

    private static int parseInt(String s) {
        try {
            return Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static Throwable unwrap(Throwable t) {
        while (t instanceof java.lang.reflect.InvocationTargetException && t.getCause() != null) {
            t = t.getCause();
        }
        return t;
    }

    private static void close(Object client) {
        if (client instanceof java.io.Closeable) {
            try {
                ((java.io.Closeable) client).close();
            } catch (Throwable ignored) {
                // best effort; the client is unreferenced afterwards anyway
            }
        }
    }

    /**
     * Levels already handled. First run on this version: everything below the current level is
     * assumed handled by the app, except the level the old build latched without a signed claim.
     */
    private static Set<Integer> loadDone(SharedPreferences prefs, String account, int currentLevel) {
        String doneKey = KEY_DONE_PREFIX + account;
        Set<Integer> done = new LinkedHashSet<>();
        String stored = prefs.getString(doneKey, null);
        if (stored != null) {
            for (String part : stored.split(",")) {
                try {
                    if (!part.isEmpty()) done.add(Integer.parseInt(part.trim()));
                } catch (NumberFormatException ignored) {
                    // skip a corrupt entry
                }
            }
            return done;
        }
        int legacy = prefs.getInt(KEY_LEGACY_PREFIX + account, 0);
        for (int level = 1; level < currentLevel; level++) {
            if (level != legacy) done.add(level);
        }
        prefs.edit().putString(doneKey, join(done)).apply();
        log("MILESTONE_MIGRATE current=" + currentLevel + " legacy=" + legacy + " done=" + join(done));
        return done;
    }

    private static void markDone(SharedPreferences prefs, String account, Set<Integer> done, int level) {
        done.add(level);
        prefs.edit()
            .putString(KEY_DONE_PREFIX + account, join(done))
            .remove(KEY_TRY_PREFIX + account + "_" + level)
            .apply();
    }

    private static String join(Set<Integer> levels) {
        StringBuilder sb = new StringBuilder();
        for (int level : levels) {
            if (sb.length() > 0) sb.append(',');
            sb.append(level);
        }
        return sb.toString();
    }

    private static JSONArray fetchLevels(String bearer) throws Exception {
        HttpResult res = httpGet(LEVELS_URL, bearer);
        if (res.code < 200 || res.code >= 300) {
            log("MILESTONE_LEVELS_FAIL " + res.code);
            sResult = "levels fail " + res.code;
            return null;
        }
        // {data: {levels: [...], badge: {...}}} (DailyRewardLevelsResponse); older shape: {data: [...]}
        JSONObject root = new JSONObject(res.body);
        Object data = root.opt("data");
        JSONArray levels = null;
        if (data instanceof JSONArray) {
            levels = (JSONArray) data;
        } else if (data instanceof JSONObject) {
            levels = ((JSONObject) data).optJSONArray("levels");
        }
        if (levels == null) {
            levels = root.optJSONArray("levels");
        }
        if (levels == null) {
            String keys = data instanceof JSONObject ? keysOf((JSONObject) data) : keysOf(root);
            log("MILESTONE_LEVELS_EMPTY keys=" + keys);
            sResult = "no levels data (keys=" + keys + ")";
        }
        return levels;
    }

    /** Mirrors the app's request builder: minutes vs MB/GB rewards, values as String.valueOf(Double). */
    private static ClaimValues valuesFor(JSONArray levels, int level) throws Exception {
        JSONObject target = null;
        for (int i = 0; i < levels.length(); i++) {
            JSONObject item = levels.getJSONObject(i);
            if (item.optInt("level", -1) == level) {
                target = item;
                break;
            }
        }
        if (target == null) return null;
        JSONArray rewards = target.optJSONArray("rewards");
        if (rewards == null || rewards.length() == 0) return null;

        ClaimValues values = new ClaimValues();
        for (int i = 0; i < rewards.length(); i++) {
            JSONObject reward = rewards.getJSONObject(i);
            String type = reward.optString("type", "");
            String lower = type.toLowerCase(Locale.US);
            String value = String.valueOf(reward.optDouble("value", 0));
            String validity = String.valueOf(reward.optInt("validity_days", 1));
            if (lower.contains("minutes") || lower.contains("mins")) {
                values.claimMints = value;
                values.mintExpiry = validity;
            } else if (lower.contains("mb") || lower.contains("gb")) {
                values.claimData = value;
                values.type = type;
                values.dataExpiry = validity;
            }
        }
        if (values.claimMints.isEmpty() && values.claimData.isEmpty()) return null;
        return values;
    }

    // --- The app's claim pipeline, by reflection ---

    private static Object newClaimRequest(ClaimValues v) throws Exception {
        return Class.forName(CLAIM_REQUEST)
            .getConstructor(String.class, String.class, String.class, String.class, String.class)
            .newInstance(v.claimMints, v.claimData, v.type, v.dataExpiry, v.mintExpiry);
    }

    /** {@code clientOut[0]} receives the Ktor client so the caller can close it. */
    private static Object claimRepo(Context context, Object[] clientOut) throws Exception {
        Class<?> modules = Class.forName(REMOTE_MODULES);
        Object instance = modules.getField("INSTANCE").get(null);
        Object client = method(modules, "provideHttpClient", 0).invoke(instance);
        clientOut[0] = client;
        Object ktor = method(modules, "provideCustomKtorRequest", 2).invoke(instance, context, client);
        return method(modules, "provideDailyRewardAuthTokenRepo", 1).invoke(instance, ktor);
    }

    /** {@code repo.claimCheckIn(request, cont)} returns a cold Flow; nothing is sent until collected. */
    private static Object claimFlow(Context context, Object request, Object continuation,
                                    Object[] clientOut) throws Exception {
        Object repo = claimRepo(context, clientOut);
        Method claim = null;
        for (Method m : repo.getClass().getMethods()) {
            if ("claimCheckIn".equals(m.getName()) && m.getParameterTypes().length == 2) {
                claim = m;
                break;
            }
        }
        if (claim == null) throw new NoSuchMethodException("claimCheckIn");
        return claim.invoke(repo, request, continuation);
    }

    private static Method collectMethod(Object flow) throws NoSuchMethodException {
        for (Method m : flow.getClass().getMethods()) {
            if ("collect".equals(m.getName()) && m.getParameterTypes().length == 2
                && m.getParameterTypes()[0].isInterface()) {
                return m;
            }
        }
        throw new NoSuchMethodException("Flow.collect on " + flow.getClass().getName());
    }

    private static Outcome claimViaApp(Context context, ClaimValues values) {
        Object[] client = new Object[1];
        try {
            final Object unit = unit();
            final AtomicReference<Object> last = new AtomicReference<>(null);
            final AtomicReference<Throwable> failure = new AtomicReference<>(null);
            final CountDownLatch finished = new CountDownLatch(1);
            // collect() completes with Unit; anything else handed to resumeWith is a failed Result.
            Object continuation = continuation(new Callback() {
                @Override public void done(Object result) {
                    if (result != unit) {
                        failure.set(resultException(result));
                    }
                    finished.countDown();
                }
            });

            Object flow = claimFlow(context, newClaimRequest(values), continuation, client);
            Method collect = collectMethod(flow);
            Object collector = Proxy.newProxyInstance(
                context.getClassLoader(),
                new Class<?>[] { collect.getParameterTypes()[0] },
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        String name = method.getName();
                        if ("emit".equals(name)) {
                            Object item = args != null && args.length > 0 ? args[0] : null;
                            if (item != null && !"Loading".equals(item.getClass().getSimpleName())) {
                                last.set(item);
                            }
                            return unit();
                        }
                        return objectMethod(proxy, method, args, "ProxmaClaimCollector");
                    }
                });

            // A collect() that finished without suspending returns Unit; anything else is the
            // suspension marker and the result arrives through resumeWith.
            Object ret = collect.invoke(flow, collector, continuation);
            if (ret == null || ret == unit) {
                finished.countDown();
            }
            if (!finished.await(CLAIM_TIMEOUT_S, TimeUnit.SECONDS)) {
                return new Outcome(Outcome.TRANSIENT, "timeout");
            }
            if (failure.get() != null) {
                return new Outcome(Outcome.TRANSIENT, "exception " + unwrap(failure.get()));
            }
            return judge(last.get());
        } catch (ClassNotFoundException | NoSuchMethodException | NoSuchFieldException e) {
            return new Outcome(Outcome.TRANSIENT, "reflect " + e);
        } catch (Throwable t) {
            return new Outcome(Outcome.TRANSIENT, "error " + unwrap(t));
        } finally {
            close(client[0]);
        }
    }

    private static Throwable resultException(Object result) {
        if (result instanceof Throwable) return (Throwable) result;
        if (result != null) {
            for (java.lang.reflect.Field f : result.getClass().getDeclaredFields()) {
                if (Throwable.class.isAssignableFrom(f.getType())) {
                    try {
                        f.setAccessible(true);
                        Object value = f.get(result);
                        if (value != null) return (Throwable) value;
                    } catch (Throwable ignored) {
                        // fall through to the generic wrapper
                    }
                }
            }
        }
        return new RuntimeException("flow failed: " + result);
    }

    /** The app treats ApiResources.Success as claimed; its repo already turned bad result codes into Failure. */
    private static Outcome judge(Object item) throws Exception {
        if (item == null) {
            return new Outcome(Outcome.TRANSIENT, "no result");
        }
        String kind = item.getClass().getSimpleName();
        if ("Success".equals(kind)) {
            Object body = item.getClass().getMethod("getData").invoke(item);
            String text = String.valueOf(body);
            String status = field(body, "getStatus");
            if (status != null && status.toLowerCase(Locale.US).matches(".*(fail|error|invalid).*")) {
                return new Outcome(Outcome.REJECTED, truncate(text));
            }
            return new Outcome(Outcome.SUCCESS, truncate(text));
        }
        if ("Failure".equals(kind)) {
            Object error = item.getClass().getMethod("getErrorState").invoke(item);
            String code = field(error, "getErrorCode");
            String message = field(error, "getErrorMessage");
            String detail = "code=" + code + " msg=" + truncate(message);
            // 1211 = no network / connection failure in the app's error mapping
            if ("1211".equals(code)) {
                return new Outcome(Outcome.TRANSIENT, detail);
            }
            return new Outcome(Outcome.REJECTED, detail);
        }
        return new Outcome(Outcome.TRANSIENT, "unexpected " + kind);
    }

    /**
     * Once a day while nothing is due: build the signed envelope for the next level without
     * sending it, and confirm the claim Flow can be obtained. The result shows in the worker
     * notification. Secrets are reported as present/absent only.
     */
    private static void dryRunOncePerDay(Context context, SharedPreferences prefs, String account,
                                         String bearer, int currentLevel, int nextLevel, int daysToNext) {
        String today = today();
        String dryKey = KEY_DRY_PREFIX + account;
        String head = state(currentLevel, nextLevel, daysToNext);
        if (today.equals(prefs.getString(dryKey, ""))) {
            sResult = head;
            return;
        }
        Object[] client = new Object[1];
        try {
            JSONArray levels = fetchLevels(bearer);
            if (levels == null) return;
            ClaimValues values = valuesFor(levels, nextLevel);
            if (values == null) {
                sResult = head + "; dry-run: no rewards listed";
                prefs.edit().putString(dryKey, today).apply();
                return;
            }
            Object request = newClaimRequest(values);
            Object envelope = Class.forName(API_RESOURCES_KT)
                .getMethod("addRequest", Class.forName(
                    "com.jazz.jazzworld.data.network.genericapis.helper.AbstractBaseRequest"),
                    Context.class, String.class)
                .invoke(null, request, context, String.valueOf(System.currentTimeMillis()));
            Object headers = envelope.getClass().getMethod("getRequestHeaders").invoke(envelope);
            String checks = "msisdn" + mark(field(headers, "getMsisdn"))
                + " token" + mark(field(headers, "getToken"))
                + " sig" + mark(field(envelope, "getRequestConfig"))
                + " body" + mark(field(envelope, "getRequestString"));

            Object flow = claimFlow(context, request, continuation(new Callback() {
                @Override public void done(Object result) {}
            }), client);
            collectMethod(flow);

            boolean ok = !checks.contains("missing");
            log("MILESTONE_DRYRUN level=" + nextLevel + " " + values + " " + checks + " flow=ok");
            sResult = head + "; dry-run " + (ok ? "ok" : "INCOMPLETE") + " (" + checks + ")";
            prefs.edit().putString(dryKey, today).apply();
        } catch (Throwable t) {
            Throwable cause = unwrap(t);
            log("MILESTONE_DRYRUN_ERR " + cause);
            sResult = head + "; dry-run error: " + cause;
        } finally {
            close(client[0]);
        }
    }

    private static String mark(String value) {
        return value != null && !value.isEmpty() && !"null".equals(value) ? "=ok" : "=missing";
    }

    // --- Kotlin interop without a Kotlin dependency ---

    private interface Callback {
        void done(Object result);
    }

    private static Object continuation(final Callback callback) throws Exception {
        Class<?> type = Class.forName("kotlin.coroutines.Continuation");
        final Object context = Class.forName("kotlin.coroutines.EmptyCoroutineContext")
            .getField("INSTANCE").get(null);
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[] { type },
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                    if ("getContext".equals(method.getName())) {
                        return context;
                    }
                    if ("resumeWith".equals(method.getName())) {
                        callback.done(args != null && args.length > 0 ? args[0] : null);
                        return null;
                    }
                    return objectMethod(proxy, method, args, "ProxmaContinuation");
                }
            });
    }

    private static Object unit() throws Exception {
        return Class.forName("kotlin.Unit").getField("INSTANCE").get(null);
    }

    private static Object objectMethod(Object proxy, Method method, Object[] args, String label) {
        String name = method.getName();
        if ("toString".equals(name)) return label;
        if ("hashCode".equals(name)) return System.identityHashCode(proxy);
        if ("equals".equals(name)) return args != null && args.length > 0 && proxy == args[0];
        return null;
    }

    private static Method method(Class<?> owner, String name, int params) throws NoSuchMethodException {
        for (Method m : owner.getMethods()) {
            if (name.equals(m.getName()) && m.getParameterTypes().length == params) {
                return m;
            }
        }
        throw new NoSuchMethodException(owner.getName() + "." + name);
    }

    private static String field(Object target, String getter) {
        if (target == null) return null;
        try {
            Object value = target.getClass().getMethod(getter).invoke(target);
            return value == null ? null : String.valueOf(value);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String today() {
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd", Locale.US);
        format.setTimeZone(TimeZone.getTimeZone("Asia/Karachi"));
        return format.format(new Date());
    }

    // --- Types and HTTP helpers ---

    private static final class ClaimValues {
        String claimMints = "";
        String claimData = "";
        String type = "";
        String dataExpiry = "";
        String mintExpiry = "";

        @Override public String toString() {
            return "data=" + claimData + " type=" + type + " mints=" + claimMints;
        }
    }

    private static final class Outcome {
        static final String SUCCESS = "success";
        static final String REJECTED = "rejected";
        static final String TRANSIENT = "transient";
        final String kind;
        final String detail;
        Outcome(String k, String d) { kind = k; detail = d; }
    }

    private static final class HttpResult {
        final int code;
        final String body;
        HttpResult(int c, String b) { code = c; body = b; }
    }

    private static HttpResult httpGet(String urlStr, String bearer) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        try {
            conn.setRequestMethod("GET");
            if (bearer != null) conn.setRequestProperty("Authorization", bearer);
            conn.setConnectTimeout(TIMEOUT_MS);
            conn.setReadTimeout(TIMEOUT_MS);
            int code = conn.getResponseCode();
            java.io.InputStream is = (code >= 200 && code < 300)
                ? conn.getInputStream() : conn.getErrorStream();
            return new HttpResult(code, readStream(is));
        } finally {
            conn.disconnect();
        }
    }

    private static String readStream(java.io.InputStream is) {
        if (is == null) return "";
        try {
            StringBuilder sb = new StringBuilder();
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String line;
            while ((line = br.readLine()) != null) sb.append(line);
            br.close();
            return sb.toString();
        } catch (Throwable t) {
            return "";
        }
    }

    private static String truncate(String s) {
        if (s == null) return "";
        return s.length() > 200 ? s.substring(0, 200) : s;
    }

    private static void log(String msg) {
        Log.i(TAG, msg);
    }
}
