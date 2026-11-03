package app.proxma.simosa;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.util.Log;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * The Simosa daily check-in: three-tier token (the app's cached auth token, our stored refresh
 * token, then a new session from the app's main login via {@link AppAuth}), 419/401 retry, 409
 * day-gate, JSON {@code data}-wrapper fallback. A renewed token goes back into the app's cache, so
 * the cache and this class never hold different refresh tokens.
 *
 * <p>Run from {@link DailyCheckinWorker#doWork()} on WorkManager's background thread, so this class
 * may block and may do network I/O.
 *
 * <p>What it persists, and where:
 *
 * <ul>
 *   <li><b>Day latch</b> — none of its own. It asks {@link AutoClaim}, whose latch is per account
 *       and per Asia/Karachi day ({@code proxma_claim_<account>_<yyyyMMdd>}, bit 2 = check-in). The
 *       old global {@code checkin_day} counter is gone: it belonged to the whole install, so it
 *       suppressed a second account's check-in.
 *   <li><b>Refresh token / uuid</b> — prefs {@code proxma_simosa} under {@code proxma_token_<account>},
 *       one blob per account, and every other account's blob is dropped when we write. The old
 *       {@code simosa_refresh_token}/{@code simosa_uuid} pair was install-global and survived a
 *       sign-out; those keys are deleted on first run.
 * </ul>
 *
 * <p>The app types it reaches for ({@code NetworkCacheManager},
 * {@code DailyRewardAuthTokenResponse}, {@code K8.X}) are accessed by reflection so a rename cannot
 * break the patch, and every reflection failure falls through to the next tier.
 */
public final class BackgroundCheckin {

    private static final String TAG = "PROXMA_CLAIM";

    /** Preferences older builds wrote install-globally; now only touched to clean them up. */
    private static final String LEGACY_PREFS = "proxma_claim";
    private static final String PREFS = "proxma_simosa";

    private static final String KEY_TOKEN_PREFIX = "proxma_token_";
    private static final String KEY_LEGACY_CLEARED = "proxma_legacy_cleared";

    private static final String CHECKIN_URL = "https://api-prod-dailycheckin.simosa.app/checkin";
    private static final String REFRESH_URL = "https://api-prod-dailycheckin.simosa.app/auth/refresh";
    private static final int TIMEOUT_MS = 15000;

    /** Outcome of the last run, read by {@link WorkerNotify}. */
    static String sSession = "none";
    static String sCheckin = "n/a";
    static String sLastBearer = null;

    /** Resolved once from PackageInfo; the check-in API keys its build header on it. */
    private static String sAppBuild;

    private BackgroundCheckin() {}

    /** @return true if settled (success, already-done, or permanent skip); false if transient failure (retry-worthy). */
    public static boolean doCheckIn(Context context) {
        sSession = "none";
        sCheckin = "n/a";
        MilestoneClaim.sResult = "n/a";
        try {
            return doCheckInInner(context);
        } catch (Throwable t) {
            log("CHECKIN_ERR " + t);
            return false;
        }
    }

    public static String getSession() {
        return sSession;
    }

    public static String getCheckin() {
        return sCheckin;
    }

    public static String getLastBearer() {
        return sLastBearer;
    }

    private static boolean doCheckInInner(Context context) throws Exception {
        if (context == null) {
            log("CHECKIN_ERR no_context");
            return true; // no point retrying
        }
        dropLegacyPrefs(context);

        // One attempt per account per day, on AutoClaim's latch — including its "no account" skip.
        String skip = AutoClaim.check(context, "checkin");
        if (skip != null) {
            log("CHECKIN_SKIP " + skip);
            sCheckin = skip;
            // Latched = already done today. Still try milestone (it has its own latch).
            String bearer = acquireBearer(context);
            if (bearer != null) {
                MilestoneClaim.tryClaimMilestone(context, bearer);
            }
            return true; // settled
        }

        String account = AccountScope.id(context);
        if (account == null) {
            log("CHECKIN_SKIP no-account");
            sCheckin = "skip no-account";
            return true; // no account = permanent, don't retry
        }

        log("CHECKIN_START");

        String bearer = acquireBearer(context);
        if (bearer == null) {
            sCheckin = "no session: " + truncate(AppAuth.sFailure);
            return false; // the main login may be dead (needs a sign-in) or the server may be down
        }
        boolean fromCache = "cached".equals(sSession);

        HttpResult result = httpPost(context, CHECKIN_URL, "{}", bearer);
        if (checkedIn(context, result)) {
            MilestoneClaim.tryClaimMilestone(context, bearer);
            return true;
        }

        // A stale cached token answers 401/419 "expired": refresh once and replay.
        if (fromCache && (result.code == 401 || result.code == 419)) {
            log("CHECKIN_TOKEN_EXPIRED retrying via refresh");
            String fresh = renew(context, account);
            if (fresh != null) {
                HttpResult retried = httpPost(context, CHECKIN_URL, "{}", fresh);
                if (checkedIn(context, retried)) {
                    MilestoneClaim.tryClaimMilestone(context, fresh);
                    return true;
                }
                result = retried;
            }
        }

        // 409 "already checked in today" is settled: latch it so the day is not retried.
        if (result.code == 409) {
            AutoClaim.latch(context, "checkin");
            log("CHECKIN_ALREADY_DONE");
            sCheckin = "already done";
            MilestoneClaim.tryClaimMilestone(context, bearer);
            return true;
        }

        log("CHECKIN_FAIL " + result.code + " " + truncate(result.body));
        sCheckin = "fail";
        return false; // transient failure, retry-worthy
    }

    /** Acquire a bearer token via cache (tier 1), refresh (tier 2) or main login (tier 3). Sets sSession/sLastBearer. */
    static String acquireBearer(Context context) {
        String account = AccountScope.id(context);
        if (account == null) return null;

        String bearer = null;
        boolean fromCache = false;

        // Tier 1: cached auth token
        try {
            Object cached = AppAuth.readCache(context);
            if (cached != null) {
                String refreshToken = invoke(cached, "getRefresh_token");
                String uuid = invoke(cached, "getUuid");
                if (refreshToken != null && !refreshToken.isEmpty()
                    && uuid != null && !uuid.isEmpty()) {
                    saveToken(context, account, refreshToken, uuid);
                }
                String accessToken = invoke(cached, "resolveAccessToken");
                if (accessToken != null && !accessToken.isEmpty()) {
                    bearer = "Bearer " + accessToken;
                    fromCache = true;
                }
            }
        } catch (Throwable t) {
            log("CHECKIN_CACHE_ERR " + t);
        }

        if (fromCache) {
            sSession = "cached";
            sLastBearer = bearer;
            return bearer;
        }
        return renew(context, account);
    }

    /** Force a renewal, bypassing the app cache. Used by MilestoneClaim on 419. */
    static String refreshBearer(Context context) {
        String account = AccountScope.id(context);
        if (account == null) return null;
        return renew(context, account);
    }

    /**
     * The app's order: refresh, and when the refresh token is missing or refused, a new session from
     * the main login. Sets sSession/sLastBearer on success.
     */
    private static String renew(Context context, String account) {
        String bearer = tryRefresh(context, account);
        if (bearer != null) {
            sSession = "refreshed";
        } else {
            bearer = mint(context, account);
            if (bearer != null) {
                sSession = "new session";
            }
        }
        if (bearer != null) {
            sLastBearer = bearer;
        }
        return bearer;
    }

    private static String mint(Context context, String account) {
        Object response = AppAuth.mint(context);
        if (response == null) {
            log("CHECKIN_MINT_FAIL " + truncate(AppAuth.sFailure));
            return null;
        }
        String accessToken = invoke(response, "resolveAccessToken");
        if (accessToken == null || accessToken.isEmpty()) {
            AppAuth.sFailure = "no access token";
            log("CHECKIN_MINT_FAIL no_access_token");
            return null;
        }
        String refreshToken = invoke(response, "getRefresh_token");
        String uuid = invoke(response, "getUuid");
        if (refreshToken != null && !refreshToken.isEmpty() && uuid != null && !uuid.isEmpty()) {
            saveToken(context, account, refreshToken, uuid);
        }
        AppAuth.writeCache(context, response);
        log("CHECKIN_MINTED");
        return "Bearer " + accessToken;
    }

    /** Latch and report a 2xx check-in. Returns true when the run is finished. */
    private static boolean checkedIn(Context context, HttpResult result) {
        if (result.code < 200 || result.code >= 300) {
            return false;
        }
        AutoClaim.latch(context, "checkin");
        log("CHECKIN_OK " + result.code + " " + truncate(result.body));
        MilestoneClaim.noteCheckin(result.body);
        sCheckin = "done";
        return true;
    }

    // --- token store (ours, per account) ---

    private static void saveToken(Context context, String account, String refreshToken, String uuid) {
        try {
            JSONObject blob = new JSONObject();
            blob.put("refresh_token", refreshToken);
            blob.put("uuid", uuid);

            SharedPreferences preferences = context.getSharedPreferences(PREFS, 0);
            SharedPreferences.Editor editor = preferences.edit();
            for (String key : preferences.getAll().keySet()) {
                if (key.startsWith(KEY_TOKEN_PREFIX) && !key.equals(KEY_TOKEN_PREFIX + account)) {
                    editor.remove(key);
                }
            }
            editor.putString(KEY_TOKEN_PREFIX + account, blob.toString());
            // commit, not apply: a rotated token the system kills us before writing is gone for good
            editor.commit();
        } catch (Throwable t) {
            log("CHECKIN_TOKEN_SAVE_ERR " + t);
        }
    }

    /** {@code {refreshToken, uuid}} for this account, or null when nothing usable is stored. */
    private static String[] loadToken(Context context, String account) {
        try {
            SharedPreferences preferences = context.getSharedPreferences(PREFS, 0);
            String raw = preferences.getString(KEY_TOKEN_PREFIX + account, null);
            if (raw == null) {
                return null;
            }
            JSONObject blob = new JSONObject(raw);
            String refreshToken = blob.optString("refresh_token", null);
            String uuid = blob.optString("uuid", null);
            if (refreshToken == null || refreshToken.isEmpty() || uuid == null || uuid.isEmpty()) {
                return null;
            }
            return new String[] { refreshToken, uuid };
        } catch (Throwable t) {
            return null;
        }
    }

    private static String tryRefresh(Context context, String account) {
        String[] token = loadToken(context, account);
        if (token == null) {
            log("CHECKIN_NO_TOKEN no_refresh");
            return null;
        }

        try {
            JSONObject body = new JSONObject();
            body.put("refresh_token", token[0]);
            body.put("uuid", token[1]);

            HttpResult result = httpPost(context, REFRESH_URL, body.toString(), null);
            if (result.code < 200 || result.code >= 300) {
                log("CHECKIN_REFRESH_FAIL " + result.code + " " + truncate(result.body));
                return null;
            }

            JSONObject root = new JSONObject(result.body);
            JSONObject data = root.optJSONObject("data");
            if (data == null) {
                data = root;
            }

            String accessToken = data.optString("access_token", null);
            if (accessToken == null || accessToken.isEmpty()) {
                log("CHECKIN_REFRESH_FAIL no_access_token");
                return null;
            }

            String rotated = data.optString("refresh_token", null);
            String newRefresh = rotated == null || rotated.isEmpty() ? token[0] : rotated;
            String newUuid = data.optString("uuid", null);
            if (newUuid == null || newUuid.isEmpty()) {
                newUuid = token[1];
            }
            if (rotated != null && !rotated.isEmpty()) {
                saveToken(context, account, newRefresh, newUuid);
            }
            Object response = AppAuth.newResponse(accessToken, newRefresh, data.optString("token_type", null),
                data.has("expires_in") ? Integer.valueOf(data.optInt("expires_in")) : null, newUuid);
            if (response != null) {
                AppAuth.writeCache(context, response);
            }

            log("CHECKIN_REFRESHED");
            return "Bearer " + accessToken;
        } catch (Throwable t) {
            log("CHECKIN_REFRESH_FAIL " + t);
            return null;
        }
    }

    /** Deletes the install-global keys older builds wrote; once per install. */
    private static void dropLegacyPrefs(Context context) {
        try {
            SharedPreferences current = context.getSharedPreferences(PREFS, 0);
            if (current.getBoolean(KEY_LEGACY_CLEARED, false)) {
                return;
            }
            context.getSharedPreferences(LEGACY_PREFS, 0).edit()
                .remove("simosa_refresh_token")
                .remove("simosa_uuid")
                .remove("checkin_day")
                .remove("claimed_day")
                .remove("att_day")
                .remove("att_n")
                .apply();
            current.edit().putBoolean(KEY_LEGACY_CLEARED, true).apply();
            log("CHECKIN_LEGACY_PREFS_CLEARED");
        } catch (Throwable t) {
            log("CHECKIN_LEGACY_PREFS_ERR " + t);
        }
    }

    // --- http ---

    private static final class HttpResult {
        final int code;
        final String body;

        HttpResult(int code, String body) {
            this.code = code;
            this.body = body;
        }
    }

    private static HttpResult httpPost(Context context, String url, String body, String auth)
        throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            String build = appBuild(context);
            if (build != null) {
                connection.setRequestProperty("x-app-build", build);
            }
            if (auth != null) {
                connection.setRequestProperty("Authorization", auth);
            }
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            connection.setDoOutput(true);

            OutputStream out = connection.getOutputStream();
            out.write(body.getBytes("UTF-8"));
            out.flush();
            out.close();

            int code = connection.getResponseCode();
            java.io.InputStream stream = (code >= 200 && code < 300)
                ? connection.getInputStream() : connection.getErrorStream();

            StringBuilder text = new StringBuilder();
            if (stream != null) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
                String line;
                while ((line = reader.readLine()) != null) {
                    text.append(line);
                }
                reader.close();
            }
            return new HttpResult(code, text.toString());
        } finally {
            connection.disconnect();
        }
    }

    /**
     * The build number the check-in API wants in {@code x-app-build}. This used to be the literal
     * "163"; reading it from PackageInfo keeps the header right on 3.3.4.2 and on later versions.
     */
    private static String appBuild(Context context) {
        if (sAppBuild != null) {
            return sAppBuild;
        }
        try {
            PackageInfo info = context.getPackageManager()
                .getPackageInfo(context.getPackageName(), 0);
            // getLongVersionCode() is API 28+; minSdk here is 23, so branch instead of crashing
            // into the catch and losing the header entirely.
            int code = android.os.Build.VERSION.SDK_INT >= 28
                ? (int) info.getLongVersionCode()
                : info.versionCode;
            if (code > 0) {
                sAppBuild = String.valueOf(code);
            }
        } catch (Throwable t) {
            log("CHECKIN_BUILD_ERR " + t);
        }
        return sAppBuild;
    }

    // --- helpers ---

    @SuppressWarnings("unchecked")
    private static <T> T invoke(Object target, String method) {
        try {
            return (T) target.getClass().getMethod(method).invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String truncate(String value) {
        if (value == null) {
            return "";
        }
        return value.length() > 200 ? value.substring(0, 200) : value;
    }

    static void log(String message) {
        Log.i(TAG, message);
        Trace.line(message);
    }
}
