package arpit.morphe.extension.movieboxtv;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.util.Base64;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;
import java.util.UUID;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.FutureTask;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 * Replaces the TV play-info streams with the signed DASH streams of the mobile BFF.
 *
 * <p>The TV endpoint describes an episode with one progressive MP4 per label, often the same
 * low-resolution file for 480p and 720p and no 1080p/4K stream at all. The mobile endpoint returns
 * a signed DASH manifest whose representations really are 480p/720p/1080p/4K, and the TV player
 * already knows how to switch between tracks of one manifest.
 *
 * <p>The mobile request is signed exactly like the app's own gateway requests: the
 * {@code gateway_secret_online} manifest value, the original certificate build tag and the
 * logged-in user's token from MMKV. Streams are only replaced when the mobile answer contains a
 * signed manifest and is at least as good as what the TV endpoint offered; otherwise the original
 * streams stay untouched.
 */
public final class PlayInfo {

    private static final String TAG = "MB_PlayInfo";



    private static final String[] HOSTS = {
        "api6.aoneroom.com",
        "api4sg.aoneroom.com",
        "api5.aoneroom.com",
        "api4.aoneroom.com",
        "api3.aoneroom.com",
    };

    private static final String PLAY_PATH = "/wefeed-mobile-bff/subject-api/play-info/v2";

    private static final String LOGIN_PATH = "/wefeed-mobile-bff/user-api/visitor-login";

    /** The mobile endpoint only serves DASH to this playback version profile. */
    private static final int MOBILE_VERSION = 50020132;

    /** SHA-256 of the original MovieBox signing certificate (the build-tag seed). */
    private static final String CERT_SHA256 =
        "03d4b741632d136bc23e2de4c6adcdb7712f1980b619c183221801730bbd0410";

    private static final String JSON_TYPE = "application/json";

    private static final int TIMEOUT_MS = 6000;

    private static final long CACHE_TTL_MS = 10 * 60 * 1000L;

    private static final long FAILURE_TTL_MS = 60 * 1000L;

    private static final long TOKEN_TTL_MS = 5 * 60 * 1000L;

    private static final Random RANDOM = new Random();

    private static final Map<String, Decision> CACHE = new ConcurrentHashMap<>();

    private static final Pattern HEIGHT = Pattern.compile("height=\"(\\d+)\"");

    private static final Pattern RESOLUTION = Pattern.compile("(\\d{3,4})");

    private static volatile Constructor<?> streamInfoConstructor;

    private static volatile String gatewaySecret;

    private static volatile String cachedToken;

    private static volatile long tokenExpiresAt;

    private PlayInfo() {
    }

    /**
     * Returns the streams the player should use: the mobile DASH streams when they are available
     * and at least as good as the TV ones, otherwise the original list.
     */
    public static List<Object> rewriteStreams(
        List<Object> streams,
        List<Object> resources,
        String subjectId,
        int se,
        int ep
    ) {
        if (streams == null) {
            streams = new ArrayList<>();
        }
        if (subjectId == null || subjectId.isEmpty()) {
            Log.i(TAG, "rewriteStreams without subject, keeping TV streams");
            return streams;
        }
        Log.i(TAG, "rewriteStreams subject=" + subjectId + " se=" + se + " ep=" + ep
            + " tvStreams=" + streams.size() + " tvResources=" + (resources != null ? resources.size() : 0));
        String token = token();
        if (token == null) {
            Log.i(TAG, "no login token, keeping TV streams");
            return streams;
        }
        String key = cacheKey(subjectId, se, ep, token);
        Decision cached = cached(key);
        if (cached != null) {
            return cached.useMobile ? new ArrayList<>(cached.streams) : streams;
        }
        if (isMainThread()) {
            Log.i(TAG, "rewriteStreams on main thread, fetching with a short timeout");
        }

        int tvMax = maxResolution(streams, resources);
        int tvRealMax = realTvMax(streams, resources);
        boolean tvAdaptive = hasAdaptive(streams);
        MobileResult mobile = isMainThread()
            ? fetchOffMain(subjectId, se, ep, token)
            : fetchParallel(subjectId, se, ep, token, false);
        if (mobile == null || mobile.streams.isEmpty()) {
            store(key, Decision.keep(FAILURE_TTL_MS));
            Log.i(TAG, "mobile play-info unavailable, keeping TV streams (tvMax=" + tvMax + "P)");
            return streams;
        }
        if (tvAdaptive || tvRealMax > mobile.maxResolution) {
            store(key, Decision.keep(CACHE_TTL_MS));
            Log.i(TAG, "keeping TV streams: tvMax=" + tvMax + "P tvRealMax=" + tvRealMax
                + "P tvAdaptive=" + tvAdaptive + " mobileMax=" + mobile.maxResolution + "P");
            return streams;
        }
        store(key, Decision.mobile(mobile.streams, CACHE_TTL_MS));
        Log.i(TAG, "using mobile adaptive streams: max=" + mobile.maxResolution + "P count="
            + mobile.streams.size() + " (tvMax=" + tvMax + "P tvRealMax=" + tvRealMax + "P)");
        return new ArrayList<>(mobile.streams);
    }

    /** Drops the TV resources when the mobile DASH streams replaced them. */
    public static List<Object> rewriteResources(
        List<Object> resources,
        String subjectId,
        int se,
        int ep
    ) {
        if (resources == null) {
            resources = new ArrayList<>();
        }
        if (subjectId == null || subjectId.isEmpty()) {
            return resources;
        }
        String token = token();
        if (token == null) {
            return resources;
        }
        String key = cacheKey(subjectId, se, ep, token);
        Decision cached = cached(key);
        if (cached == null && !isMainThread()) {
            rewriteStreams(new ArrayList<>(), resources, subjectId, se, ep);
            cached = cached(key);
        }
        return (cached != null && cached.useMobile) ? new ArrayList<>() : resources;
    }

    /** Used by the seek-step patch to mark the stored preset as selected. */
    public static boolean isSelected(int storedSeconds, int presetSeconds) {
        return storedSeconds == presetSeconds;
    }

    /**
     * Adds one "Seek step" entry to the stock SPEED list. Selecting it opens the dedicated
     * preset screen, so seek options are not mixed with the speed multipliers.
     */
    public static List<Object> withSeekEntry(List<Object> options) {
        List<Object> result = new ArrayList<>();
        if (options != null) {
            result.addAll(options);
        }
        try {
            result.add(newOption("Seek step", "", false, -1));
        } catch (Throwable ex) {
            Log.w(TAG, "seek entry unavailable: " + ex.getMessage());
        }
        return result;
    }

    /** The five seek presets, with the stored step marked selected. */
    public static List<Object> seekChips() {
        List<Object> result = new ArrayList<>();
        int stored = seekStep();
        String[][] presets = {
            {"Seek 30s", "30"},
            {"Seek 1m", "60"},
            {"Seek 5m", "300"},
            {"Seek 10m", "600"},
            {"Seek 30m", "1800"},
        };
        try {
            for (String[] preset : presets) {
                int seconds = Integer.parseInt(preset[1]);
                result.add(newOption(preset[0], preset[1], stored == seconds, -1));
            }
        } catch (Throwable ex) {
            Log.w(TAG, "seek chips unavailable: " + ex.getMessage());
        }
        return result;
    }

    public static int seekStep() {
        int stored = 300;
        try {
            Class<?> mmkv = Class.forName("com.tencent.mmkv.MMKV");
            Object store = mmkv.getMethod("B", String.class).invoke(null, "tv_player_config");
            Object value = mmkv.getMethod("getInt", String.class, int.class)
                .invoke(store, "seek_step_seconds", 300);
            if (value instanceof Integer) {
                stored = (Integer) value;
            }
        } catch (Throwable ex) {
            Log.w(TAG, "seek step unreadable: " + ex.getMessage());
        }
        return Math.max(1, Math.min(3600, stored));
    }

    public static void storeSeekStep(int seconds) {
        int clamped = Math.max(1, Math.min(3600, seconds));
        try {
            Class<?> mmkv = Class.forName("com.tencent.mmkv.MMKV");
            Object store = mmkv.getMethod("B", String.class).invoke(null, "tv_player_config");
            mmkv.getMethod("p", String.class, int.class)
                .invoke(store, "seek_step_seconds", clamped);
        } catch (Throwable ex) {
            Log.w(TAG, "seek step write failed: " + ex.getMessage());
        }
    }

    private static Object newOption(String label, String value, boolean selected, int extra)
        throws ReflectiveOperationException {
        Class<?> option = Class.forName("com.transsion.tvplayer.p");
        Constructor<?> constructor = option.getConstructor(
            String.class,
            String.class,
            boolean.class,
            int.class,
            boolean.class,
            boolean.class
        );
        return constructor.newInstance(label, value, selected, extra, false, false);
    }

    private static MobileResult fetchOffMain(String subjectId, int se, int ep, String token) {
        FutureTask<MobileResult> task = new FutureTask<>(() -> fetchParallel(subjectId, se, ep, token, true));
        Thread worker = new Thread(task, "morphe-play-info");
        worker.setDaemon(true);
        worker.start();
        try {
            return task.get(8000, TimeUnit.MILLISECONDS);
        } catch (TimeoutException ex) {
            task.cancel(true);
            Log.w(TAG, "mobile play-info timed out on the UI path");
            return null;
        } catch (Exception ex) {
            Log.w(TAG, "mobile play-info worker failed: " + ex.getMessage());
            return null;
        }
    }

    /**
     * Queries every API host in parallel and keeps the best signed ladder. The TV network is much
     * slower than the phone's; a sequential host walk with a 2.5 s budget used to cancel the
     * request before any host answered, leaving the fake TV MP4 in place.
     */
    private static MobileResult fetchParallel(
        String subjectId,
        int se,
        int ep,
        String token,
        boolean shallow
    ) {
        boolean movieFallback = (se != 0 || ep != 0);
        BlockingQueue<MobileResult> answers = new LinkedBlockingQueue<>();
        for (String host : HOSTS) {
            startFetch(host, subjectId, se, ep, token, shallow, answers);
            if (movieFallback) {
                // Movies are exposed by the view model as season 1 episode 1, but the play-info
                // request that produced the TV streams used se=0&ep=0. Query both in parallel.
                startFetch(host, subjectId, 0, 0, token, shallow, answers);
            }
        }

        long deadline = System.currentTimeMillis() + 8000L;
        MobileResult requested = null;
        MobileResult zero = null;
        long graceDeadline = 0L;
        while (System.currentTimeMillis() < deadline) {
            long now = System.currentTimeMillis();
            long wait = (requested == null && zero == null)
                ? (deadline - now)
                : Math.min(2500L, deadline - now);
            MobileResult answer;
            try {
                answer = answers.poll(wait, TimeUnit.MILLISECONDS);
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
                break;
            }
            if (answer == null) {
                break;
            }
            boolean isRequested = (answer.se == se && answer.ep == ep);
            if (isRequested) {
                if (requested == null || answer.maxResolution > requested.maxResolution) {
                    requested = answer;
                }
            } else if (zero == null || answer.maxResolution > zero.maxResolution) {
                zero = answer;
            }
            MobileResult best = (requested != null) ? requested : zero;
            if (best != null && best.maxResolution >= 2160) {
                break;
            }
            if (graceDeadline == 0L) {
                graceDeadline = System.currentTimeMillis() + 2500L;
            } else if (System.currentTimeMillis() >= graceDeadline) {
                break;
            }
        }

        MobileResult best = (requested != null) ? requested : zero;
        if (best != null) {
            Log.i(TAG, "play-info winner: se=" + best.se + " ep=" + best.ep + " "
                + best.maxResolution + "P, streams=" + best.streams.size()
                + (requested == null ? " (movie fallback)" : ""));
        } else {
            Log.w(TAG, "every mobile play-info host failed within the budget");
        }
        return best;
    }

    private static void startFetch(
        String host,
        String subjectId,
        int se,
        int ep,
        String token,
        boolean shallow,
        BlockingQueue<MobileResult> answers
    ) {
        String path = PLAY_PATH + "?subjectId=" + encode(subjectId) + "&se=" + se + "&ep=" + ep;
        Thread worker = new Thread(
            () -> {
                MobileResult result = fetchOnHost(host, path, se, ep, token, shallow);
                if (result != null) {
                    answers.add(result);
                }
            },
            "morphe-play-info-" + host + "-" + se + "-" + ep
        );
        worker.setDaemon(true);
        worker.start();
    }

    private static MobileResult fetchOnHost(
        String host,
        String path,
        int se,
        int ep,
        String token,
        boolean shallow
    ) {
        long started = System.currentTimeMillis();
        try {
            String answer = request(host, "GET", path, null, token);
            long elapsed = System.currentTimeMillis() - started;
            if (answer == null) {
                Log.w(TAG, host + " no answer in " + elapsed + "ms");
                return null;
            }
            JSONObject root = new JSONObject(answer);
            int code = root.optInt("code", -1);
            if (code != 0) {
                Log.w(TAG, host + " code=" + code + " in " + elapsed + "ms: "
                    + answer.substring(0, Math.min(180, answer.length())));
                return null;
            }
            JSONObject data = root.optJSONObject("data");
            JSONArray streams = (data != null) ? data.optJSONArray("streams") : null;
            if (streams == null) {
                Log.w(TAG, host + " no streams in " + elapsed + "ms");
                return null;
            }
            List<Object> result = new ArrayList<>();
            int max = 0;
            for (int i = 0; i < streams.length(); i++) {
                JSONObject stream = streams.optJSONObject(i);
                if (stream == null) {
                    continue;
                }
                String cookie = stream.optString("signCookie", "");
                String url = stream.optString("url", "");
                String format;
                if (url.contains(".mpd")) {
                    format = "DASH";
                } else if (url.contains(".m3u8")) {
                    format = "HLS";
                } else {
                    continue;
                }
                if (cookie.isEmpty()) {
                    continue;
                }
                String resolutions = stream.optString("resolutions", "");
                String manifestResolutions = (!shallow && "DASH".equals(format))
                    ? manifestResolutions(url, cookie)
                    : null;
                if (manifestResolutions != null) {
                    resolutions = manifestResolutions;
                }
                Object info = streamInfo(stream, se, ep, resolutions, cookie, url, format);
                if (info == null) {
                    continue;
                }
                result.add(info);
                max = Math.max(max, parseResolution(resolutions));
            }
            if (result.isEmpty()) {
                Log.w(TAG, host + " no signed streams [se=" + se + " ep=" + ep + "] in "
                    + elapsed + "ms");
                return null;
            }
            Log.i(TAG, host + " [se=" + se + " ep=" + ep + "] -> " + max + "P in "
                + elapsed + "ms");
            return new MobileResult(result, max, se, ep);
        } catch (Throwable ex) {
            Log.w(TAG, host + " failed after " + (System.currentTimeMillis() - started)
                + "ms: " + ex.getClass().getSimpleName() + ": " + ex.getMessage());
            return null;
        }
    }

    /** Reads the real track heights from the manifest (the response's list can be incomplete). */
    private static String manifestResolutions(String url, String cookie) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Cookie", cookie);
            connection.setRequestProperty("User-Agent", "ExoPlayerLib/2.19.1");
            int code = connection.getResponseCode();
            if (code < 200 || code >= 300) {
                return null;
            }
            String body = readAll(connection.getInputStream());
            Matcher matcher = HEIGHT.matcher(body);
            TreeSet<Integer> heights = new TreeSet<>(Collections.reverseOrder());
            while (matcher.find()) {
                heights.add(Integer.parseInt(matcher.group(1)));
            }
            if (heights.isEmpty()) {
                return null;
            }
            StringBuilder builder = new StringBuilder();
            for (Integer height : heights) {
                if (builder.length() > 0) {
                    builder.append(',');
                }
                builder.append(height);
            }
            return builder.toString();
        } catch (Throwable ex) {
            Log.w(TAG, "manifest heights unavailable: " + ex.getMessage());
            return null;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static Object streamInfo(
        JSONObject stream,
        int se,
        int ep,
        String resolutions,
        String cookie,
        String url,
        String format
    ) {
        try {
            Constructor<?> constructor = streamInfoConstructor();
            Integer duration = stream.isNull("duration")
                ? null
                : Integer.valueOf(stream.optInt("duration"));
            String size = stream.isNull("size") ? null : stream.optString("size");
            String codec = stream.isNull("codecName") ? null : stream.optString("codecName");
            String id = stream.isNull("id") ? null : stream.optString("id");
            return constructor.newInstance(
                null,
                codec,
                resolutions,
                url,
                duration,
                null,
                null,
                Integer.valueOf(se),
                Integer.valueOf(ep),
                format,
                id,
                size,
                cookie
            );
        } catch (Throwable ex) {
            Log.w(TAG, "BffStreamInfo unavailable: " + ex.getMessage());
            return null;
        }
    }

    private static Constructor<?> streamInfoConstructor() throws ReflectiveOperationException {
        Constructor<?> cached = streamInfoConstructor;
        if (cached != null) {
            return cached;
        }
        Class<?> type = Class.forName("com.transsion.tvdata.bean.BffStreamInfo");
        for (Constructor<?> candidate : type.getConstructors()) {
            Class<?>[] parameters = candidate.getParameterTypes();
            if (parameters.length == 13
                && parameters[0] == Integer.class
                && parameters[1] == String.class
                && parameters[2] == String.class
                && parameters[3] == String.class
                && parameters[4] == Integer.class
                && parameters[9] == String.class
                && parameters[12] == String.class) {
                streamInfoConstructor = candidate;
                return candidate;
            }
        }
        throw new NoSuchMethodException("BffStreamInfo(13)");
    }

    private static String request(
        String host,
        String method,
        String path,
        String body,
        String token
    ) throws IOException {
        String secret = gatewaySecret();
        if (secret == null) {
            return null;
        }
        byte[] key = Base64.decode(secret, Base64.DEFAULT);
        long timestamp = System.currentTimeMillis();
        String tag = buildTag();

        JSONObject clientInfo = new JSONObject();
        try {
            clientInfo.put("device_id", UUID.randomUUID().toString().replace("-", ""));
            clientInfo.put("os_version", Build.VERSION.RELEASE);
            clientInfo.put("gaid", UUID.randomUUID().toString());
            clientInfo.put("package_name", packageName());
            clientInfo.put("version_code", MOBILE_VERSION);
            clientInfo.put("X-Client-Build", tag);
        } catch (JSONException ex) {
            throw new IOException(ex);
        }

        HttpURLConnection connection =
            (HttpURLConnection) new URL("https://" + host + path).openConnection();
        try {
            int timeout = isMainThread() ? 1800 : TIMEOUT_MS;
            connection.setConnectTimeout(timeout);
            connection.setReadTimeout(timeout);
            connection.setRequestMethod(method);
            connection.setRequestProperty("Accept", JSON_TYPE);
            connection.setRequestProperty("Content-Type", JSON_TYPE);
            connection.setRequestProperty("x-client-token", clientToken(timestamp));
            connection.setRequestProperty(
                "x-tr-signature",
                signature(key, method, path, body, timestamp)
            );
            connection.setRequestProperty("x-client-info", clientInfo.toString());
            connection.setRequestProperty("x-forwarded-for", "unknown");
            connection.setRequestProperty("X-Client-Build", tag);
            if (token != null) {
                connection.setRequestProperty("Authorization", "Bearer " + token);
            }
            if (body != null) {
                connection.setDoOutput(true);
                try (OutputStream out = connection.getOutputStream()) {
                    out.write(body.getBytes(StandardCharsets.UTF_8));
                }
            }
            int code = connection.getResponseCode();
            InputStream input = (code >= 200 && code < 300)
                ? connection.getInputStream()
                : connection.getErrorStream();
            String answer = (input != null) ? readAll(input) : "";
            if (code < 200 || code >= 300) {
                Log.w(TAG, "HTTP " + code + " from " + host + ": " + answer);
                return null;
            }
            return answer;
        } finally {
            connection.disconnect();
        }
    }

    private static String signature(
        byte[] key,
        String method,
        String pathAndQuery,
        String body,
        long timestamp
    ) throws IOException {
        byte[] bodyBytes = (body != null) ? body.getBytes(StandardCharsets.UTF_8) : null;
        String canonical = method + "\n"
            + JSON_TYPE + "\n"
            + JSON_TYPE + "\n"
            + ((bodyBytes != null) ? String.valueOf(bodyBytes.length) : "") + "\n"
            + timestamp + "\n"
            + ((bodyBytes != null) ? md5Hex(bodyBytes) : "") + "\n"
            + canonicalPath(pathAndQuery);
        try {
            Mac mac = Mac.getInstance("HmacMD5");
            mac.init(new SecretKeySpec(key, "HmacMD5"));
            byte[] digest = mac.doFinal(canonical.getBytes(StandardCharsets.UTF_8));
            return timestamp + "|2|" + Base64.encodeToString(digest, Base64.NO_WRAP);
        } catch (Exception ex) {
            throw new IOException(ex);
        }
    }

    private static String canonicalPath(String pathAndQuery) throws IOException {
        int question = pathAndQuery.indexOf('?');
        if (question < 0) {
            return pathAndQuery;
        }
        List<String[]> pairs = new ArrayList<>();
        for (String pair : pathAndQuery.substring(question + 1).split("&")) {
            if (pair.isEmpty()) {
                continue;
            }
            int equals = pair.indexOf('=');
            String name = (equals < 0) ? pair : pair.substring(0, equals);
            String value = (equals < 0) ? "" : pair.substring(equals + 1);
            pairs.add(new String[] {
                URLDecoder.decode(name, "UTF-8"),
                URLDecoder.decode(value, "UTF-8"),
            });
        }
        Collections.sort(pairs, new Comparator<String[]>() {
            @Override
            public int compare(String[] left, String[] right) {
                return left[0].compareTo(right[0]);
            }
        });
        StringBuilder builder = new StringBuilder(pathAndQuery.substring(0, question + 1));
        for (int i = 0; i < pairs.size(); i++) {
            if (i > 0) {
                builder.append('&');
            }
            builder.append(pairs.get(i)[0]).append('=').append(pairs.get(i)[1]);
        }
        return builder.toString();
    }

    private static String clientToken(long timestamp) throws IOException {
        try {
            String reversed = new StringBuilder(String.valueOf(timestamp)).reverse().toString();
            return timestamp + "," + md5Hex(reversed.getBytes(StandardCharsets.UTF_8));
        } catch (Exception ex) {
            throw new IOException(ex);
        }
    }

    private static String buildTag() {
        long now = System.currentTimeMillis();
        String stamp = String.format(
            Locale.ROOT,
            "%d%06d%d",
            now / 1000,
            (now % 1000) * 1000,
            RANDOM.nextInt(1000)
        );
        try {
            String seed = CERT_SHA256 + "oneroom" + stamp;
            return stamp + "." + md5Hex(seed.getBytes(StandardCharsets.UTF_8));
        } catch (Exception ex) {
            return stamp;
        }
    }

    private static String token() {
        long now = System.currentTimeMillis();
        String token = cachedToken;
        if (token != null && now < tokenExpiresAt) {
            return token;
        }
        token = loginToken();
        if (token == null && !isMainThread()) {
            token = visitorToken();
        }
        if (token != null) {
            cachedToken = token;
            tokenExpiresAt = now + TOKEN_TTL_MS;
        }
        return token;
    }

    private static String loginToken() {
        try {
            Class<?> mmkv = Class.forName("com.tencent.mmkv.MMKV");
            Object store = mmkv.getMethod("B", String.class).invoke(null, "kv_login");
            String loginUser = (String) mmkv
                .getMethod("getString", String.class, String.class)
                .invoke(store, "login_user", "");
            if (loginUser != null && !loginUser.isEmpty()) {
                String token = new JSONObject(loginUser).optString("token", "");
                if (!token.isEmpty()) {
                    return token;
                }
            }
        } catch (Throwable ex) {
            Log.w(TAG, "login token unavailable: " + ex.getMessage());
        }
        return null;
    }

    private static String visitorToken() {
        for (String host : HOSTS) {
            try {
                String answer = request(host, "POST", LOGIN_PATH, "{}", null);
                if (answer == null) {
                    continue;
                }
                JSONObject data = new JSONObject(answer).optJSONObject("data");
                String token = (data != null) ? data.optString("token", "") : "";
                if (!token.isEmpty()) {
                    return token;
                }
            } catch (Throwable ex) {
                Log.w(TAG, "visitor login failed on " + host + ": " + ex.getMessage());
            }
        }
        return null;
    }

    private static String gatewaySecret() {
        String cached = gatewaySecret;
        if (cached != null) {
            return cached;
        }
        Context context = context();
        if (context != null) {
            try {
                ApplicationInfo info = context.getPackageManager()
                    .getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA);
                Bundle metaData = info.metaData;
                String declared = (metaData != null)
                    ? metaData.getString("gateway_secret_online")
                    : null;
                if (declared != null && !declared.isEmpty()) {
                    gatewaySecret = declared;
                    return declared;
                }
            } catch (Throwable ex) {
                Log.w(TAG, "gateway secret unavailable: " + ex.getMessage());
            }
        }
        try {
            Class<?> sdk = Class.forName("com.transsion.api.gateway.GateWaySdk");
            Object secret = sdk.getMethod("getSecret").invoke(null);
            if (secret instanceof String && !((String) secret).isEmpty()) {
                gatewaySecret = (String) secret;
                return gatewaySecret;
            }
        } catch (Throwable ex) {
            Log.w(TAG, "gateway SDK secret unavailable: " + ex.getMessage());
        }
        return null;
    }

    private static Context context() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object application = activityThread.getMethod("currentApplication").invoke(null);
            if (application instanceof Context) {
                return (Context) application;
            }
        } catch (Throwable ignored) {
            // Fall through to the SDK context.
        }
        try {
            Class<?> contextUtils = Class.forName("com.transsion.api.gateway.utils.ContextUtils");
            Object context = contextUtils.getMethod("getContext").invoke(null);
            if (context instanceof Context) {
                return (Context) context;
            }
        } catch (Throwable ignored) {
            // No context available.
        }
        return null;
    }

    private static String packageName() {
        Context context = context();
        return (context != null) ? context.getPackageName() : "com.community.mbox.tv";
    }

    private static int maxResolution(List<Object> streams, List<Object> resources) {
        int max = 0;
        if (streams != null) {
            for (Object stream : streams) {
                max = Math.max(max, resolutionOf(stream));
            }
        }
        if (resources != null) {
            for (Object resource : resources) {
                max = Math.max(max, resolutionOf(resource));
            }
        }
        return max;
    }

    /**
     * The highest resolution the TV endpoint really has, not just the highest label. When several
     * labels share one URL (e.g. 480p/720p/1080p all point at the same MP4), only the lowest label
     * is real; the higher ones are the fake ones that made quality selection look broken.
     */
    private static int realTvMax(List<Object> streams, List<Object> resources) {
        Map<String, Set<Integer>> byUrl = new HashMap<>();
        int synthetic = 0;
        for (List<Object> items : Arrays.asList(streams, resources)) {
            if (items == null) {
                continue;
            }
            for (Object item : items) {
                String url = stringValue(item, "getUrl");
                String key = (url != null && !url.isEmpty()) ? url : ("item-" + (synthetic++));
                Set<Integer> values = byUrl.get(key);
                if (values == null) {
                    values = new HashSet<>();
                    byUrl.put(key, values);
                }
                addResolutions(values, stringValue(item, "getResolutions"));
                addResolutions(values, stringValue(item, "getResolution"));
            }
        }
        int realMax = 0;
        for (Set<Integer> values : byUrl.values()) {
            if (values.isEmpty()) {
                continue;
            }
            int real = (values.size() > 1)
                ? Collections.min(values)
                : values.iterator().next();
            realMax = Math.max(realMax, real);
        }
        return realMax;
    }

    private static void addResolutions(Set<Integer> target, String text) {
        if (text == null || text.isEmpty()) {
            return;
        }
        Matcher matcher = RESOLUTION.matcher(text);
        while (matcher.find()) {
            try {
                target.add(Integer.parseInt(matcher.group(1)));
            } catch (NumberFormatException ignored) {
                // Ignore malformed labels.
            }
        }
        if (text.toUpperCase(Locale.ROOT).contains("4K")) {
            target.add(2160);
        }
    }

    private static int resolutionOf(Object item) {
        int max = parseResolution(stringValue(item, "getResolution"));
        return Math.max(max, parseResolution(stringValue(item, "getResolutions")));
    }

    private static int parseResolution(String text) {
        if (text == null || text.isEmpty()) {
            return 0;
        }
        int max = 0;
        Matcher matcher = RESOLUTION.matcher(text);
        while (matcher.find()) {
            try {
                max = Math.max(max, Integer.parseInt(matcher.group(1)));
            } catch (NumberFormatException ignored) {
                // Ignore malformed labels.
            }
        }
        if (text.toUpperCase(Locale.ROOT).contains("4K")) {
            max = Math.max(max, 2160);
        }
        return max;
    }

    private static boolean hasAdaptive(List<Object> streams) {
        if (streams == null) {
            return false;
        }
        for (Object stream : streams) {
            String format = stringValue(stream, "getFormat");
            String cookie = stringValue(stream, "getSignCookie");
            String url = stringValue(stream, "getUrl");
            if ("DASH".equalsIgnoreCase(format) || "HLS".equalsIgnoreCase(format)) {
                return true;
            }
            if (cookie != null && !cookie.isEmpty() && url != null
                && (url.contains(".mpd") || url.contains(".m3u8"))) {
                return true;
            }
        }
        return false;
    }

    private static String stringValue(Object item, String methodName) {
        if (item == null) {
            return null;
        }
        try {
            Method method = item.getClass().getMethod(methodName);
            Object value = method.invoke(item);
            return (value instanceof String) ? (String) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Decision cached(String key) {
        Decision decision = CACHE.get(key);
        if (decision == null) {
            return null;
        }
        if (decision.expiresAt < System.currentTimeMillis()) {
            CACHE.remove(key);
            return null;
        }
        return decision;
    }

    private static void store(String key, Decision decision) {
        if (CACHE.size() > 32) {
            long now = System.currentTimeMillis();
            for (Map.Entry<String, Decision> entry : CACHE.entrySet()) {
                if (entry.getValue().expiresAt < now) {
                    CACHE.remove(entry.getKey());
                }
            }
        }
        CACHE.put(key, decision);
    }

    private static String cacheKey(String subjectId, int se, int ep, String token) {
        return subjectId + "/" + se + "/" + ep + "#" + token.hashCode();
    }

    private static boolean isMainThread() {
        Looper looper = Looper.myLooper();
        return looper != null && looper == Looper.getMainLooper();
    }

    private static String encode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (Exception ex) {
            return value;
        }
    }

    private static String md5Hex(byte[] data) {
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            byte[] hash = digest.digest(data);
            StringBuilder builder = new StringBuilder(hash.length * 2);
            for (byte value : hash) {
                builder.append(String.format(Locale.ROOT, "%02x", value & 0xff));
            }
            return builder.toString();
        } catch (Exception ex) {
            throw new IllegalStateException(ex);
        }
    }

    private static String readAll(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int count = input.read(buffer);
        while (count != -1) {
            output.write(buffer, 0, count);
            count = input.read(buffer);
        }
        return new String(output.toByteArray(), StandardCharsets.UTF_8);
    }

    private static final class MobileResult {

        final List<Object> streams;

        final int maxResolution;

        final int se;

        final int ep;

        MobileResult(List<Object> streams, int maxResolution, int se, int ep) {
            this.streams = streams;
            this.maxResolution = maxResolution;
            this.se = se;
            this.ep = ep;
        }
    }

    private static final class Decision {

        final boolean useMobile;

        final List<Object> streams;

        final long expiresAt;

        private Decision(boolean useMobile, List<Object> streams, long expiresAt) {
            this.useMobile = useMobile;
            this.streams = streams;
            this.expiresAt = expiresAt;
        }

        static Decision mobile(List<Object> streams, long ttlMs) {
            return new Decision(true, new ArrayList<>(streams), System.currentTimeMillis() + ttlMs);
        }

        static Decision keep(long ttlMs) {
            return new Decision(false, Collections.emptyList(), System.currentTimeMillis() + ttlMs);
        }
    }
}
