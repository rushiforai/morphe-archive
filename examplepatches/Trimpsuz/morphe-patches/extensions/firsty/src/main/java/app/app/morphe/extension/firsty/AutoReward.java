package app.morphe.extension.firsty;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.SystemClock;
import android.util.Base64;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

@SuppressWarnings("unused")
public class AutoReward {
    private static final String TAG = "AutoReward";
    private static final String BASE_URL = "https://mobile.firsty.app";
    private static final String FLUTTER_PREFS = "FlutterSharedPreferences";
    private static final String TOKEN_PREFS_KEY = "flutter.last_fb_secure_token_preferences_key";

    private static final AtomicBoolean STARTED = new AtomicBoolean(false);

    // Safety limit
    private static final int MAX_CLAIMS_PER_LAUNCH = 100;

    private static final long DELAY_MS = 200L;

    public static void bootstrap(Context context) {
        if (context == null) {
            return;
        }

        Context applicationContext = context.getApplicationContext();
        final Context appContext = applicationContext != null
                ? applicationContext
                : context;

        String processName = currentProcessName();
        if (processName != null && !appContext.getPackageName().equals(processName)) {
            Log.d(TAG, "Skipping non-main process " + processName);
            return;
        }

        if (!STARTED.compareAndSet(false, true)) {
            Log.d(TAG, "Auto-reward already started in this process");
            return;
        }

        Thread worker = new Thread(() -> {
            try {
                run(appContext);
            } catch (Throwable t) {
                Log.e(TAG, "Auto-reward failed", t);
            }
        }, "firsty-auto-reward");
        worker.setDaemon(true);
        worker.start();

        Log.i(TAG, "Auto-reward worker started");
    }

    private static void run(Context context) {
        PackageInfo packageInfo = readPackageInfo(context);
        String versionName = packageInfo.versionName != null ? packageInfo.versionName : "unknown";
        long versionCode = getVersionCode(packageInfo);

        Log.i(TAG, "Firsty " + versionName + " (" + versionCode + ") on " + deviceInfo());

        Credentials credentials = waitForCredentials(context, 25_000L);
        if (credentials == null) {
            Log.w(TAG, "No usable Firebase session/token found, aborting");
            return;
        }

        Log.i(TAG, "Firebase session ready, uid=" + mask(credentials.uid)
                + ", tokenExpiresIn=" + secondsUntil(credentials.expiresAt) + "s");

        int claimed = 0;
        String stopReason = "unknown";

        while (true) {
            if (claimed >= MAX_CLAIMS_PER_LAUNCH) {
                stopReason = "local safety cap of " + MAX_CLAIMS_PER_LAUNCH + " claims";
                break;
            }

            if (claimed > 0 && !sleepBetweenClaims()) {
                stopReason = "worker interrupted";
                break;
            }

            ClaimResult result = claimOnce(context, credentials, versionName, versionCode);
            credentials = result.credentials;

            if (result.claimed) {
                claimed++;
                Log.i(TAG, "Claimed " + claimed + " reward(s) this launch so far");
                continue;
            }

            stopReason = result.stopReason;
            break;
        }

        Log.i(TAG, "Auto-reward finished: claimed=" + claimed
                + " this launch, stopped because: " + stopReason);
    }

    private static ClaimResult claimOnce(
            Context context,
            Credentials credentials,
            String versionName,
            long versionCode
    ) {
        String uidPath = urlEncode(credentials.uid);
        RequestResult eligibility = request(
                "GET",
                "/api/mobile/advertisements/v2/" + uidPath + "/eligibility",
                credentials.token,
                versionName,
                versionCode,
                null
        );

        if (eligibility.code == 409) {
            Log.i(TAG, "Eligibility unavailable (cap/conflict): " + eligibility.summary());
            return ClaimResult.stopped("server-side eligibility limit: " + eligibility.summary(), credentials);
        }
        if (eligibility.code != 200) {
            Log.w(TAG, "Eligibility request failed: " + eligibility.summary());
            return ClaimResult.stopped("eligibility request failed: " + eligibility.summary(), credentials);
        }

        JSONObject eligibilityJson;
        try {
            eligibilityJson = new JSONObject(eligibility.body);
        } catch (Throwable t) {
            Log.w(TAG, "Eligibility response was not JSON: " + eligibility.summary());
            return ClaimResult.stopped("eligibility response was not JSON", credentials);
        }

        JSONArray adTypes = eligibilityJson.optJSONArray("availableAdTypes");
        boolean customAvailable = false;
        if (adTypes != null) {
            for (int i = 0; i < adTypes.length(); i++) {
                if ("custom".equals(adTypes.optString(i))) {
                    customAvailable = true;
                    break;
                }
            }
        }

        int remainingToday = eligibilityJson.optInt("remainingToday", -1);
        int currentBundles = eligibilityJson.optInt("currentDataBundles", -1);
        String reason = eligibilityJson.optString("reason", "");

        Log.i(TAG, "Eligibility: custom=" + customAvailable
                + ", remainingToday=" + remainingToday
                + ", currentDataBundles=" + currentBundles
                + (reason.isEmpty() ? "" : ", reason=" + reason));

        if (!customAvailable || remainingToday == 0) {
            Log.i(TAG, "No custom ad reward available");
            return ClaimResult.stopped("no custom ad reward available", credentials);
        }

        RequestResult custom = request(
                "POST",
                "/api/mobile/advertisements/v2/" + uidPath + "/custom",
                credentials.token,
                versionName,
                versionCode,
                null
        );

        if (custom.code != 200) {
            Log.w(TAG, "Custom ad issuance failed: " + custom.summary());
            return ClaimResult.stopped("custom ad issuance failed: " + custom.summary(), credentials);
        }

        String adId;
        try {
            adId = new JSONObject(custom.body).optString("adId", "");
        } catch (Throwable t) {
            Log.w(TAG, "Custom ad response was not JSON: " + custom.summary());
            return ClaimResult.stopped("custom ad response was not JSON", credentials);
        }

        if (adId.isEmpty()) {
            Log.w(TAG, "Custom ad response did not contain an adId: " + custom.summary());
            return ClaimResult.stopped("custom ad response did not contain an adId", credentials);
        }

        Log.i(TAG, "Issued custom ad " + adId);

        String appCheckToken = buildFallbackAppCheckToken(credentials.uid, versionName);
        RequestResult complete = request(
                "POST",
                "/api/mobile/advertisements/v2/" + uidPath + "/custom/" + urlEncode(adId) + "/complete",
                credentials.token,
                versionName,
                versionCode,
                appCheckToken
        );

        if (complete.code == 401 || complete.code == 403) {
            Log.w(TAG, "Completion rejected (" + complete.summary() + "); refreshing credentials and retrying");
            Credentials refreshed = obtainCredentials(context);
            if (refreshed != null) {
                credentials = refreshed;
                uidPath = urlEncode(credentials.uid);
                appCheckToken = buildFallbackAppCheckToken(credentials.uid, versionName);
                complete = request(
                        "POST",
                        "/api/mobile/advertisements/v2/" + uidPath + "/custom/" + urlEncode(adId) + "/complete",
                        credentials.token,
                        versionName,
                        versionCode,
                        appCheckToken
                );
            }
        }

        if (complete.code == 204 || complete.code == 200) {
            Log.i(TAG, "SUCCESS: ad " + adId + " completed (" + complete.summary() + ")");
            return ClaimResult.claimed(credentials);
        }

        if (complete.code == 409) {
            Log.i(TAG, "Reward not granted (conflict/cap): " + complete.summary());
            return ClaimResult.stopped("server-side limit reached: " + complete.summary(), credentials);
        }
        if (complete.code == 404) {
            Log.i(TAG, "Ad session not found or already completed: " + complete.summary());
            return ClaimResult.stopped("ad session not found or already completed", credentials);
        }

        Log.w(TAG, "Reward completion failed: " + complete.summary());
        return ClaimResult.stopped("completion failed: " + complete.summary(), credentials);
    }

    private static boolean sleepBetweenClaims() {
        try {
            Thread.sleep(DELAY_MS);
            return true;
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return false;
        }
    }

    // Credentials

    private static Credentials waitForCredentials(Context context, long timeoutMs) {
        long deadline = SystemClock.elapsedRealtime() + timeoutMs;
        boolean loggedWait = false;

        while (SystemClock.elapsedRealtime() < deadline) {
            Credentials credentials = obtainCredentials(context);
            if (credentials != null && !credentials.token.isEmpty()) {
                if (credentials.expiresAt == 0
                        || credentials.expiresAt > (System.currentTimeMillis() / 1000L) + 30L) {
                    return credentials;
                }
                if (!loggedWait) {
                    Log.i(TAG, "Firebase token is expired/expiring, waiting for a refresh");
                    loggedWait = true;
                }
            }

            try {
                Thread.sleep(2_000L);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return null;
            }
        }

        return null;
    }

    private static Credentials obtainCredentials(Context context) {
        // Try asking FirebaseAuth for a fresh ID token
        Credentials firebase = fromFirebaseAuth();
        if (firebase != null) {
            JwtInfo info = parseJwt(firebase.token);
            String uid = info.sub != null ? info.sub : firebase.uid;
            return new Credentials(uid, firebase.token, info.expiresAt);
        }

        // Get stored token as fallback
        String stored = readStoredToken(context);
        if (stored != null) {
            JwtInfo info = parseJwt(stored);
            if (info.sub != null) {
                return new Credentials(info.sub, stored, info.expiresAt);
            }
        }

        return null;
    }

    private static Credentials fromFirebaseAuth() {
        try {
            Class<?> authClass = Class.forName("com.google.firebase.auth.FirebaseAuth");
            Object auth = authClass.getMethod("getInstance").invoke(null);
            if (auth == null) {
                return null;
            }

            Object user = authClass.getMethod("getCurrentUser").invoke(auth);
            if (user == null) {
                return null;
            }

            Class<?> userClass = Class.forName("com.google.firebase.auth.FirebaseUser");
            String uid = (String) userClass.getMethod("getUid").invoke(user);
            Object tokenTask = userClass.getMethod("getIdToken", boolean.class).invoke(user, false);
            Object tokenResult = awaitTask(tokenTask, 20L);
            if (tokenResult == null) {
                return null;
            }

            Class<?> resultClass = Class.forName("com.google.firebase.auth.GetTokenResult");
            String token = (String) resultClass.getMethod("getToken").invoke(tokenResult);
            if (token == null || token.isEmpty()) {
                return null;
            }

            return new Credentials(uid, token, 0L);
        } catch (Throwable t) {
            Log.d(TAG, "FirebaseAuth token lookup unavailable: " + t);
            return null;
        }
    }

    private static Object awaitTask(Object task, long seconds) throws Exception {
        Class<?> taskClass = Class.forName("com.google.android.gms.tasks.Task");
        Class<?> tasksClass = Class.forName("com.google.android.gms.tasks.Tasks");
        Method await = tasksClass.getMethod("await", taskClass, long.class, TimeUnit.class);
        return await.invoke(null, task, seconds, TimeUnit.SECONDS);
    }

    private static String readStoredToken(Context context) {
        try {
            SharedPreferences prefs = context.getSharedPreferences(FLUTTER_PREFS, Context.MODE_PRIVATE);
            String token = prefs.getString(TOKEN_PREFS_KEY, null);
            if (token == null || token.isEmpty()) {
                return null;
            }
            return token;
        } catch (Throwable t) {
            Log.d(TAG, "Could not read Flutter shared preferences: " + t);
            return null;
        }
    }

    private static JwtInfo parseJwt(String token) {
        JwtInfo info = new JwtInfo();
        try {
            String[] parts = token.split("\\.");
            if (parts.length < 2) {
                return info;
            }

            byte[] decoded = Base64.decode(
                    parts[1],
                    Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING
            );
            JSONObject payload = new JSONObject(new String(decoded, StandardCharsets.UTF_8));
            info.sub = payload.optString("sub", null);
            info.expiresAt = payload.optLong("exp", 0L);
        } catch (Throwable t) {
            Log.d(TAG, "Could not decode ID token: " + t);
        }
        return info;
    }

    // App Check fallback token

    static String buildFallbackAppCheckToken(String uid, String versionName) {
        try {
            String hash = sha256Hex(uid.getBytes(StandardCharsets.UTF_8));
            String triple = hash + hash + hash;

            int lastDot = versionName.lastIndexOf('.');
            String lastSegment = lastDot >= 0 ? versionName.substring(lastDot + 1) : versionName;
            int start = lastSegment.length();
            if (start < 0 || start + 16 > triple.length()) {
                // Should not happen for a normal version string
                start = 0;
            }

            String raw = triple.substring(start, start + 16);
            String base = sha256Hex(raw.getBytes(StandardCharsets.US_ASCII));
            long minute = (System.currentTimeMillis() / 60_000L) % 60L;
            return base + minute;
        } catch (Throwable t) {
            throw new IllegalStateException("Could not derive App Check fallback token", t);
        }
    }

    private static String sha256Hex(byte[] data) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] bytes = digest.digest(data);
        char[] out = new char[bytes.length * 2];
        final char[] hex = "0123456789abcdef".toCharArray();
        for (int i = 0; i < bytes.length; i++) {
            int value = bytes[i] & 0xFF;
            out[i * 2] = hex[value >>> 4];
            out[i * 2 + 1] = hex[value & 0x0F];
        }
        return new String(out);
    }

    // HTTP

    private static RequestResult request(
            String method,
            String path,
            String bearerToken,
            String versionName,
            long versionCode,
            String appCheckToken
    ) {
        HttpURLConnection connection = null;
        try {
            URL url = new URL(BASE_URL + path);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod(method);
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            connection.setInstanceFollowRedirects(true);
            connection.setUseCaches(false);

            connection.setRequestProperty("Authorization", "Bearer " + bearerToken);
            connection.setRequestProperty("Accept", "application/json");
            connection.setRequestProperty("Accept-Encoding", "identity");
            connection.setRequestProperty("App-Version", versionName);
            connection.setRequestProperty("App-Build", String.valueOf(versionCode));
            connection.setRequestProperty("Device-Info", deviceInfo());
            connection.setRequestProperty("Platform", "Android");

            if (appCheckToken != null) {
                connection.setRequestProperty("X-Firebase-AppCheck", appCheckToken);
            }

            if ("POST".equals(method)) {
                connection.setDoOutput(true);
                // /custom and /complete are bodyless POSTs
                connection.setFixedLengthStreamingMode(0);
                try (OutputStream output = connection.getOutputStream()) {
                    output.flush();
                }
            }

            int code = connection.getResponseCode();
            InputStream stream = code >= 400 ? connection.getErrorStream() : connection.getInputStream();
            String body = readAll(stream);
            return new RequestResult(code, body);
        } catch (Throwable t) {
            return new RequestResult(-1, t.getClass().getSimpleName()
                    + (t.getMessage() != null ? ": " + t.getMessage() : ""));
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static String readAll(InputStream stream) {
        if (stream == null) {
            return "";
        }
        try (InputStream input = stream;
             ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096];
            int read;
            while ((read = input.read(buffer)) != -1) {
                output.write(buffer, 0, read);
            }
            return output.toString(StandardCharsets.UTF_8.name());
        } catch (Throwable t) {
            return "";
        }
    }

    // Android helpers

    private static PackageInfo readPackageInfo(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        } catch (PackageManager.NameNotFoundException e) {
            throw new IllegalStateException("Own package is not installed?", e);
        }
    }

    @SuppressWarnings("deprecation")
    private static long getVersionCode(PackageInfo packageInfo) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            return packageInfo.getLongVersionCode();
        }
        return packageInfo.versionCode;
    }

    private static String deviceInfo() {
        return Build.MODEL + ", " + Build.VERSION.RELEASE + " (" + Build.VERSION.SDK_INT + ")";
    }

    private static String currentProcessName() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            try {
                return Application.getProcessName();
            } catch (Throwable ignored) {
                // Fall through to /proc.
            }
        }

        try (FileReader reader = new FileReader("/proc/self/cmdline")) {
            StringBuilder name = new StringBuilder();
            int ch;
            while ((ch = reader.read()) > 0) {
                name.append((char) ch);
            }
            return name.length() > 0 ? name.toString() : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String urlEncode(String value) {
        try {
            return URLEncoder.encode(value, StandardCharsets.UTF_8.name());
        } catch (Throwable t) {
            return value;
        }
    }

    private static String mask(String value) {
        if (value == null || value.length() <= 8) {
            return String.valueOf(value);
        }
        return value.substring(0, 4) + "..." + value.substring(value.length() - 4);
    }

    private static long secondsUntil(long epochSeconds) {
        if (epochSeconds <= 0L) {
            return -1L;
        }
        return epochSeconds - (System.currentTimeMillis() / 1000L);
    }

    // Types

    private static final class ClaimResult {
        final boolean claimed;
        final String stopReason;
        final Credentials credentials;

        private ClaimResult(boolean claimed, String stopReason, Credentials credentials) {
            this.claimed = claimed;
            this.stopReason = stopReason;
            this.credentials = credentials;
        }

        static ClaimResult claimed(Credentials credentials) {
            return new ClaimResult(true, "", credentials);
        }

        static ClaimResult stopped(String reason, Credentials credentials) {
            return new ClaimResult(false, reason, credentials);
        }
    }

    private static final class Credentials {
        final String uid;
        final String token;
        final long expiresAt;

        Credentials(String uid, String token, long expiresAt) {
            this.uid = uid;
            this.token = token;
            this.expiresAt = expiresAt;
        }
    }

    private static final class JwtInfo {
        String sub;
        long expiresAt;
    }

    private static final class RequestResult {
        final int code;
        final String body;

        RequestResult(int code, String body) {
            this.code = code;
            this.body = body != null ? body : "";
        }

        String summary() {
            String trimmed = body.trim();
            if (trimmed.length() > 400) {
                trimmed = trimmed.substring(0, 400) + "...";
            }
            return "HTTP " + code + (trimmed.isEmpty() ? "" : " " + trimmed);
        }
    }
}
