package com.travianpatch.notifier;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Base64;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.core.app.NotificationCompat;
import androidx.work.Constraints;
import androidx.work.Data;
import androidx.work.ExistingWorkPolicy;
import androidx.work.NetworkType;
import androidx.work.OneTimeWorkRequest;
import androidx.work.WorkManager;
import androidx.work.Worker;
import androidx.work.WorkerParameters;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import okhttp3.Cookie;
import okhttp3.OkHttpClient;
import okhttp3.Request;

/**
 * One background check: resumes the game's own login session (see
 * TravianSession), polls for build/troop queues, and fires a local
 * notification for anything that finished since the last check.
 *
 * Runs on plain WorkManager (no foreground service, no persistent
 * notification): a chain of one-shot checks, each scheduling the next either
 * for just after the earliest known finish time or in 5 minutes, whichever is
 * sooner, so a completion is reported within seconds to a minute; plus a
 * periodic check every ~15 minutes (the platform minimum) that restarts the
 * chain if it ever stops. Android may still defer background work,
 * especially in deep sleep.
 *
 * Tracked queue state (village names, building ids) and a short-lived (~2 hour)
 * world token are persisted to this app's private SharedPreferences between
 * runs, since a fresh process may back each invocation. The token is the same
 * kind the game itself keeps in its own private storage; no password or
 * long-lived credential is ever stored.
 */
public class NotifierWorker extends Worker {

    private static final String TAG = "TravianNotifier";
    private static final String CHANNEL_ID = NotifierBootstrap.CHANNEL_ID;
    /** Also read by the Travian Tools screens. */
    static final String STATE_PREFS = "travian_notifier_state";
    /** The queue entries seen at the last check; also read by the Queues screen. */
    static final String STATE_KEY = "tracked_events";
    private static final long SESSION_SEED_TTL_MS = TimeUnit.DAYS.toMillis(3650);

    static final String NEXT_WORK_NAME = "travian-notifier-next";
    /** Separate unique-work name for the check the Travian Tools screen asks for, so it never replaces the chain. */
    static final String CHECK_NOW_WORK_NAME = "travian-notifier-now";
    /** State-prefs keys the Travian Tools screens read. */
    static final String KEY_HISTORY = "notification_history";
    static final String KEY_STATUS = "check_status";
    /** Villages with nothing building or training, as of the last check; read by the Alerts screen. */
    static final String KEY_IDLE_VILLAGES = "idle_villages";
    /** Villages the last poll saw (id, name, x, y); read by the Build order screen. */
    static final String KEY_VILLAGES = "known_villages";
    /** Real resource stock/production per village from the last poll; read by the Build order screen. */
    static final String KEY_VILLAGE_RESOURCES = "village_resources";
    /** The player's tribe, villages, building slots and queue from the last check (ownPlayer JSON text); read by the Build order screen. */
    static final String KEY_PLAYER_BUILDINGS = "player_buildings_json";
    /** When the soonest incoming attack lands (epoch ms, 0 = none), saved each check for the action guard. */
    static final String KEY_NEXT_ATTACK_AT = "next_attack_at";
    /** When the attack list was last read completely (epoch ms); older or missing pauses automatic actions. */
    static final String KEY_ATTACKS_KNOWN_AT = "attacks_known_at";
    private static final String KEY_RULES_CHECKED_AT = "building_rules_checked_at";
    /** "true"/"false" once read, absent until then; read by the Hub screen. */
    static final String KEY_GOLD_CLUB = "gold_club";
    private static final String KEY_GOLD_CLUB_LOGGED_AT = "gold_club_logged_at";
    private static final String KEY_GOLD_CLUB_ANSWERED = "gold_club_answered";
    private static final int PENDING_FLAGS = PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT;
    private static final String KEY_RETRIES = "retries";
    /** A finish time that passed this recently but is still listed means the server is lagging: recheck. */
    private static final long LAG_WINDOW_MS = 60_000L;
    /** Don't reuse a cached world token that expires within this margin. */
    private static final long TOKEN_MARGIN_MS = TimeUnit.MINUTES.toMillis(2);
    static final String KEY_WORLD_HOST = "world_host";
    static final String KEY_WORLD_TOKEN = "world_token";
    static final String KEY_WORLD_TOKEN_EXP = "world_token_exp";
    private static final String KEY_ANNOUNCED_ATTACKS = "announced_attacks";
    private static final String KEY_REMINDED_ATTACKS = "reminded_attacks";
    private static final String KEY_TRACKED_ARRIVALS = "tracked_arrivals";
    private static final String KEY_TRACKED_ATTACKS = "tracked_attacks";
    private static final String KEY_STORAGE_ALERTED = "storage_alerted";
    private static final String KEY_HERO_LOGGED = "hero_logged";
    private static final String KEY_HERO_STATE = "hero_state";
    /** If the game rejects the movements part of the poll query, skip it until this time (epoch ms). */
    private static final String KEY_MOVEMENTS_OFF_UNTIL = "movements_off_until";
    private static final String ATTACK_CHANNEL_ID = NotifierBootstrap.ATTACK_CHANNEL_ID;
    /** An event that disappears earlier than this before its finish time was cancelled or sped up. */
    private static final long EARLY_TOLERANCE_MS = 30_000L;

    // earliest upcoming finish seen during this run (epoch ms), and whether a just-passed one is still listed
    private long nextWakeMs = CheckPacing.NONE;
    /** The earliest attack reminder / troop escape moment seen during this run (epoch ms). */
    private long attackWakeMs = CheckPacing.NONE;
    /** This check's incoming attacks, set only when every village's attack list was read. */
    private List<AttackAlerts.Alert> completeAttacks;
    private boolean lagging = false;
    private int currentTribeId = -1; // tribe of the village being read, for logging trained unit ids
    // what this run saw, saved for the Travian Tools screen (-1 = not checked)
    private String statusNote = "OK";
    private int statBuilds = -1;
    private int statTrainings = -1;
    private int statAttacks = -1;
    private int statArrivals = -1;

    public NotifierWorker(@NonNull Context context, @NonNull WorkerParameters params) {
        super(context, params);
    }

    /** Serializes checks: the chained check and the periodic job can fire at the same moment. */
    private static final Object CHECK_LOCK = new Object();

    @NonNull
    @Override
    public Result doWork() {
        synchronized (CHECK_LOCK) {
            return runCheck();
        }
    }

    /** When the last check finished (epoch ms); a check right after it is skipped (CheckPacing.tooSoon). */
    private static final String KEY_LAST_CHECK_END = "last_check_end";
    /** When the last full sign-in (lobby → world) was made; at most one per SIGN_IN_GAP_MS. */
    private static final String KEY_LAST_SIGN_IN = "last_sign_in";
    /** Checks that failed in a row; each one waits longer (CheckPacing.failureDelayMs). */
    private static final String KEY_FAILURES = "check_failures";
    private static final long SIGN_IN_GAP_MS = TimeUnit.MINUTES.toMillis(30);
    /** Set on the chain's own requests (not on the 15-minute job or a screen's "check now"). */
    private static final String KEY_CHAINED = "chained";
    /** Set on the check a Travian Tools screen asks for. */
    private static final String KEY_ASKED_NOW = "asked_now";
    /** When the chain's next check is due (epoch ms). */
    private static final String KEY_NEXT_CHECK_AT = "next_check_at";

    private Result runCheck() {
        long start = System.currentTimeMillis();
        boolean chained = getInputData().getBoolean(KEY_CHAINED, false);
        boolean askedNow = getInputData().getBoolean(KEY_ASKED_NOW, false);
        if (!chained && CheckPacing.tooSoon(start, statePrefs().getLong(KEY_LAST_CHECK_END, 0))) {
            Log.i(TAG, "check skipped: the last one finished less than a minute ago");
            return Result.success();
        }
        if (!chained && !askedNow && CheckPacing.chainAlive(start, statePrefs().getLong(KEY_NEXT_CHECK_AT, 0))) {
            // The 15-minute safety job only restarts a chain that stopped; it isn't an extra check.
            Log.i(TAG, "safety check skipped: the next regular check is already scheduled");
            return Result.success();
        }
        if (GameScreen.busy(start)) {
            // The game is talking to its server itself; don't be a second client at the same moment.
            Log.i(TAG, "check skipped: the game is open");
            statusNote = "Paused while the game is open";
            scheduleAfter(Math.max(GameScreen.msUntilFree(start), CheckPacing.between(random, CheckPacing.AWAKE_MIN_MS,
                    CheckPacing.AWAKE_MAX_MS)));
            return Result.success();
        }
        quiet = ActionSender.quietNow(getApplicationContext());
        TravianSession.logKeyNamesOnce(getApplicationContext());
        try {
            Log.i(TAG, "check started" + (quiet ? " (quiet hours: alerts only)" : ""));
            String sessionCookie = TravianSession.readLobbySessionCookie(getApplicationContext());
            if (sessionCookie == null) {
                // Not logged in yet (e.g. a fresh install). Keep the chain alive with a cheap local-only
                // recheck so the first check after logging in happens within minutes, not at the next
                // ~15 minute safety job.
                Log.i(TAG, "no game session found (not logged into the game yet), will look again");
                statusNote = "Not logged in to the game yet";
                scheduleNextCheck();
                return Result.success();
            }

            // Fast path: reuse the world token cached from the last full sign-in. Only when it's missing,
            // expired or refused is the full sign-in redone, and never more than once per SIGN_IN_GAP_MS.
            SimpleCookieJar jar = new SimpleCookieJar();
            OkHttpClient http = TravianApi.newClient(jar);
            String gameworldHost = seedCachedWorldToken(jar);
            if (gameworldHost != null && !statePrefs().contains(KEY_OUR_CLAIMS)) {
                // Installs from before this version: the cached token came from this app's own sign-in.
                statePrefs().edit().putString(KEY_OUR_CLAIMS, GameLogin.claimNames(
                        statePrefs().getString(KEY_WORLD_TOKEN, null))).apply();
            }
            if (gameworldHost != null) {
                try {
                    poll(http, gameworldHost);
                    cacheWorldToken(jar, gameworldHost); // keeps a login the server renewed in its reply
                    return succeeded();
                } catch (AuthExpiredException e) {
                    Log.i(TAG, "cached world token was refused (" + e.getMessage() + "), signing in again");
                    refusedToken = statePrefs().getString(KEY_WORLD_TOKEN, null);
                    clearCachedWorldToken();
                    jar = new SimpleCookieJar();
                    http = TravianApi.newClient(jar);
                }
            }

            // Next: the game's own saved world login (no separate sign-in at all), when it is the same kind
            // of token as ours and still valid. Refused once, it isn't tried again for 6 hours.
            gameworldHost = seedGameLogin(jar, start);
            if (gameworldHost != null) {
                try {
                    poll(http, gameworldHost);
                    cacheWorldToken(jar, gameworldHost); // keeps a login the server renewed in its reply
                    Log.i(TAG, "using the game's own saved login, no separate sign-in");
                    return succeeded();
                } catch (AuthExpiredException e) {
                    Log.i(TAG, "the game's saved login was refused (" + e.getMessage() + "), signing in separately");
                    statePrefs().edit().putLong(KEY_GAME_LOGIN_REFUSED_AT, start).apply();
                    clearCachedWorldToken();
                    jar = new SimpleCookieJar();
                    http = TravianApi.newClient(jar);
                }
            }

            if (quiet) {
                // A person doesn't log in in the middle of the night: once the saved login has run out, checks
                // wait for the morning (or for the game to be opened, which saves a fresh login).
                Log.i(TAG, "quiet hours: no saved login left, not signing in until the quiet hours end");
                statusNote = "Paused for the night (quiet hours): alerts resume in the morning or when you open the game";
                scheduleNextCheck();
                return Result.success();
            }
            long lastSignIn = statePrefs().getLong(KEY_LAST_SIGN_IN, 0);
            if (start - lastSignIn < SIGN_IN_GAP_MS && start >= lastSignIn) {
                return failed("signed in less than 30 minutes ago; waiting before signing in again");
            }
            statePrefs().edit().putLong(KEY_LAST_SIGN_IN, start).apply();
            gameworldHost = resumeSession(http, jar, sessionCookie);
            if (gameworldHost == null) {
                return failed("the game's login was not accepted");
            }
            cacheWorldToken(jar, gameworldHost);

            poll(http, gameworldHost);
            return succeeded();
        } catch (Exception e) {
            // Refused, busy ("too many requests"), maintenance, no network: wait longer each time. Never a
            // quick retry, and never a new sign-in just because an answer had no data.
            return failed(e.toString());
        }
    }

    private boolean quiet = false;
    private final java.util.Random random = new java.util.Random();

    private Result succeeded() {
        statePrefs().edit().putInt(KEY_FAILURES, 0).putLong(KEY_LAST_CHECK_END, System.currentTimeMillis()).apply();
        scheduleNextCheck();
        return Result.success();
    }

    private Result failed(String why) {
        int failures = statePrefs().getInt(KEY_FAILURES, 0) + 1;
        long delay = CheckPacing.failureDelayMs(failures, quiet, random);
        Log.w(TAG, "check failed (" + failures + " in a row), next try in " + (delay / 1000) + "s: " + why);
        statePrefs().edit().putInt(KEY_FAILURES, failures).putLong(KEY_LAST_CHECK_END, System.currentTimeMillis())
                .apply();
        statusNote = failures == 1 ? "Last check failed, will try again" : "Last " + failures + " checks failed, will try again";
        scheduleAfter(delay);
        return Result.success();
    }

    // ------------------------------------------------------------------
    // scheduling the next precise check
    // ------------------------------------------------------------------

    private void scheduleNextCheck() {
        long now = System.currentTimeMillis();
        int retries = getInputData().getInt(KEY_RETRIES, 0);
        // The regular 4-7 minute check (20-40 in quiet hours) is how a build started elsewhere (e.g. on a PC)
        // gets noticed; finish times and attack moments can bring it forward (see CheckPacing).
        long delayMs = CheckPacing.nextDelayMs(now, nextWakeMs, attackWakeMs, lagging, retries, quiet, random);
        int nextRetries = lagging && retries < CheckPacing.MAX_LAG_RETRIES ? retries + 1 : 0;
        schedule(delayMs, nextRetries);
    }

    private void scheduleAfter(long delayMs) {
        schedule(delayMs, 0);
    }

    private void schedule(long delayMs, int nextRetries) {
        statePrefs().edit().putLong(KEY_NEXT_CHECK_AT, System.currentTimeMillis() + delayMs).apply();
        OneTimeWorkRequest request = new OneTimeWorkRequest.Builder(NotifierWorker.class)
                .setInitialDelay(delayMs, TimeUnit.MILLISECONDS)
                .setConstraints(new Constraints.Builder().setRequiredNetworkType(NetworkType.CONNECTED).build())
                .setInputData(new Data.Builder().putInt(KEY_RETRIES, nextRetries).putBoolean(KEY_CHAINED, true)
                        .build())
                .build();
        WorkManager.getInstance(getApplicationContext())
                .enqueueUniqueWork(NEXT_WORK_NAME, ExistingWorkPolicy.REPLACE, request);
        Log.i(TAG, "next check scheduled in " + (delayMs / 1000) + "s");
        saveStatus(statusNote);
    }

    /**
     * Runs a check right away (used when the Travian Tools screen is opened). Returns false if the
     * scheduler isn't set up yet: the game sets up WorkManager itself when it first starts, so on a
     * fresh install, before the game has ever been opened, there is nothing to run the check with.
     */
    static boolean requestCheckNow(Context ctx) {
        try {
            OneTimeWorkRequest request = new OneTimeWorkRequest.Builder(NotifierWorker.class)
                    .setConstraints(new Constraints.Builder().setRequiredNetworkType(NetworkType.CONNECTED).build())
                    .setInputData(new Data.Builder().putBoolean(KEY_ASKED_NOW, true).build())
                    .build();
            WorkManager.getInstance(ctx.getApplicationContext())
                    .enqueueUniqueWork(CHECK_NOW_WORK_NAME, ExistingWorkPolicy.KEEP, request);
            return true;
        } catch (IllegalStateException e) {
            Log.i(TAG, "can't start a check yet, WorkManager isn't set up until the game has been opened: " + e.getMessage());
            return false;
        }
    }

    /** Saves what the Travian Tools screen shows: when this check ran, and what it saw. */
    private void saveStatus(String note) {
        AlertStatus status = new AlertStatus(System.currentTimeMillis(), note,
                statBuilds, statTrainings, statAttacks, statArrivals);
        statePrefs().edit().putString(KEY_STATUS, status.toJson()).apply();
        ToolsWidget.update(getApplicationContext());
    }

    /** Records a finish time from the server: schedules around it, or flags server lag if it just passed. */
    private void noteFinish(NotificationKind kind, String label, long finishMs) {
        if (finishMs <= 0) {
            return;
        }
        if (!NotifierSettings.isEnabled(getApplicationContext(), kind)) {
            return; // muted: nobody is told about it, so no early check for it (the regular one sees it)
        }
        long delta = finishMs - System.currentTimeMillis();
        Log.i(TAG, label + " finishes in " + (delta / 1000) + "s");
        if (delta > 0) {
            nextWakeMs = Math.min(nextWakeMs, finishMs);
        } else if (-delta <= LAG_WINDOW_MS) {
            lagging = true;
        }
    }

    /** The API's timestamps are epoch seconds; tolerate milliseconds too. */
    private static long toMillis(long ts) {
        if (ts <= 0) {
            return 0;
        }
        return ts > 100_000_000_000L ? ts : ts * 1000L;
    }

    // ------------------------------------------------------------------
    // session resume (reuses the game's own cookie, see TravianSession)
    // ------------------------------------------------------------------

    /** The gameworld rejected our token (expired or revoked), as opposed to a transient failure. */
    private static final class AuthExpiredException extends Exception {
        AuthExpiredException(String message) {
            super(message);
        }
    }

    /**
     * If a still-valid world token from the last full sign-in is cached, puts it in the cookie
     * jar and returns its gameworld host; otherwise returns null. The token is the same
     * short-lived (~2 hour) session token the game itself holds, kept in this app's private
     * storage like the game's own copy, and never contains a password.
     */
    private String seedCachedWorldToken(SimpleCookieJar jar) {
        return seedWorldToken(statePrefs(), jar);
    }

    /** Same as the worker's fast path, for screens: puts the cached world token in jar, returns its host or null. */
    static String seedWorldToken(SharedPreferences prefs, SimpleCookieJar jar) {
        String host = prefs.getString(KEY_WORLD_HOST, null);
        String token = prefs.getString(KEY_WORLD_TOKEN, null);
        long expMs = prefs.getLong(KEY_WORLD_TOKEN_EXP, 0);
        if (host == null || token == null || expMs - System.currentTimeMillis() < TOKEN_MARGIN_MS) {
            return null;
        }
        jar.seed(TravianApi.hostOf(host), new Cookie.Builder()
                .name("JWT")
                .value(token)
                .domain(TravianApi.hostOf(host))
                .path("/")
                .httpOnly()
                .secure()
                .expiresAt(expMs)
                .build());
        return host;
    }

    /** The claim names of the token this app got from its own sign-in (names only, see GameLogin). */
    private static final String KEY_OUR_CLAIMS = "own_token_claim_names";
    private static final String KEY_GAME_LOGIN_REFUSED_AT = "game_login_refused_at";
    private static final long GAME_LOGIN_RETRY_MS = TimeUnit.HOURS.toMillis(6);
    /** The cached token refused earlier in this check (never tried twice in one check). */
    private String refusedToken;

    /**
     * Puts the game's own saved world login in jar (and caches it like our own), returning the world host;
     * null when it isn't there, isn't the same kind as ours, has expired, or was refused lately.
     */
    private String seedGameLogin(SimpleCookieJar jar, long now) {
        try {
            SharedPreferences s = statePrefs();
            String host = s.getString(KEY_LAST_WORLD_HOST, null);
            long refusedAt = s.getLong(KEY_GAME_LOGIN_REFUSED_AT, 0);
            if (host == null || (now >= refusedAt && now - refusedAt < GAME_LOGIN_RETRY_MS)) {
                return null;
            }
            String saved = GameLogin.pick(TravianSession.savedSettings(getApplicationContext()),
                    s.getString(KEY_LAST_AVATAR_UUID, null));
            String ours = s.getString(KEY_OUR_CLAIMS, null);
            Log.i(TAG, "game's saved login: " + GameLogin.describe(saved, ours, now));
            String jwt = GameLogin.usable(saved, ours, now, TOKEN_MARGIN_MS);
            if (jwt == null || jwt.equals(refusedToken)) {
                return null;
            }
            s.edit().putString(KEY_WORLD_HOST, host).putString(KEY_WORLD_TOKEN, jwt)
                    .putLong(KEY_WORLD_TOKEN_EXP, GameLogin.expiresAtMs(jwt)).apply();
            return seedWorldToken(s, jar);
        } catch (Exception e) {
            Log.w(TAG, "game's saved login not usable: " + e);
            return null;
        }
    }

    private void cacheWorldToken(SimpleCookieJar jar, String host) {
        try {
            String token = jar.getCookieValue(TravianApi.hostOf(host), "JWT");
            long expMs = token != null ? jwtExpiryMs(token) : 0;
            if (token == null || expMs <= System.currentTimeMillis()) {
                return; // can't tell how long it's good for, so don't reuse it
            }
            if (token.equals(statePrefs().getString(KEY_WORLD_TOKEN, null))) {
                return; // already the cached one
            }
            statePrefs().edit()
                    .putString(KEY_WORLD_HOST, host)
                    .putString(KEY_WORLD_TOKEN, token)
                    .putLong(KEY_WORLD_TOKEN_EXP, expMs)
                    .putString(KEY_OUR_CLAIMS, GameLogin.claimNames(token))
                    .apply();
            Log.i(TAG, "cached world token, good for " + ((expMs - System.currentTimeMillis()) / 60000) + " min");
        } catch (Exception e) {
            Log.w(TAG, "couldn't cache the world token: " + e);
        }
    }

    private void clearCachedWorldToken() {
        statePrefs().edit().remove(KEY_WORLD_HOST).remove(KEY_WORLD_TOKEN).remove(KEY_WORLD_TOKEN_EXP).apply();
    }

    /** Reads the "exp" claim (epoch seconds) from a JWT's payload; 0 if it can't be read. */
    private static long jwtExpiryMs(String jwt) throws Exception {
        String[] parts = jwt.split("\\.");
        if (parts.length < 2) {
            return 0;
        }
        byte[] payload = Base64.decode(parts[1], Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
        long exp = new JSONObject(new String(payload, "UTF-8")).optLong("exp", 0);
        return exp > 0 ? exp * 1000L : 0;
    }

    /** The world this app signed in to last; kept when the token is cleared, so the same world is picked again. */
    private static final String KEY_LAST_WORLD_HOST = "last_world_host";
    /** The game account (avatar uuid) this app signed in with last. */
    private static final String KEY_LAST_AVATAR_UUID = "last_avatar_uuid";

    private static String worldHostOf(JSONObject avatar) throws Exception {
        String url = avatar.getJSONObject("gameworld").getJSONObject("metadata").getString("url");
        return url.endsWith("/") ? url.substring(0, url.length() - 1) : url;
    }

    private String resumeSession(OkHttpClient http, SimpleCookieJar jar, String sessionCookie) throws Exception {
        String lobbyHost = TravianApi.hostOf(TravianApi.LOBBY_HOST);
        Cookie cookie = new Cookie.Builder()
                .name(TravianApi.LOBBY_SESSION_COOKIE)
                .value(sessionCookie)
                .domain(lobbyHost)
                .path("/")
                .httpOnly()
                .secure()
                .expiresAt(System.currentTimeMillis() + SESSION_SEED_TTL_MS)
                .build();
        jar.seed(lobbyHost, cookie);

        String avatarsQuery = "{ \"query\": \"query { avatars(wuid: null, context: null) "
                + "{ uuid, gameworld { metadata { url } } } }\" }";
        Request avatarsReq = new Request.Builder()
                .url(TravianApi.LOBBY_HOST + "/api/graphql")
                .post(TravianApi.jsonBody(avatarsQuery))
                .build();
        JSONObject avatarsResp = TravianApi.executeJson(http, avatarsReq);
        JSONObject data = avatarsResp.optJSONObject("data");
        if (data == null) {
            Log.w(TAG, "game's session was rejected by lobby: " + avatarsResp);
            return null;
        }
        JSONArray avatars = data.getJSONArray("avatars");
        if (avatars.length() == 0) {
            return null;
        }
        // Stay on the world used last time. With no earlier choice, the account the game itself has a saved
        // login for (its "lastCookie-<avatar uuid>" setting), else the first one.
        String lastWorld = statePrefs().getString(KEY_LAST_WORLD_HOST, null);
        java.util.Map<String, ?> saved = TravianSession.savedSettings(getApplicationContext());
        JSONObject avatar = avatars.getJSONObject(0);
        for (int i = 0; i < avatars.length() && lastWorld == null; i++) {
            if (saved.containsKey(GameLogin.COOKIE_PREFIX + avatars.getJSONObject(i).optString("uuid"))) {
                avatar = avatars.getJSONObject(i);
                break;
            }
        }
        for (int i = 0; i < avatars.length() && lastWorld != null; i++) {
            if (lastWorld.equals(worldHostOf(avatars.getJSONObject(i)))) {
                avatar = avatars.getJSONObject(i);
                break;
            }
        }
        if (avatars.length() > 1) {
            Log.i(TAG, avatars.length() + " game accounts (avatars) found, using the one on " + worldHostOf(avatar));
        }
        String avatarUuid = avatar.getString("uuid");
        String worldHost = worldHostOf(avatar);
        statePrefs().edit().putString(KEY_LAST_WORLD_HOST, worldHost).putString(KEY_LAST_AVATAR_UUID, avatarUuid)
                .apply();
        Log.i(TAG, "the game has a saved login for this account: "
                + saved.containsKey(GameLogin.COOKIE_PREFIX + avatarUuid));

        Request playReq = new Request.Builder()
                .url(TravianApi.LOBBY_HOST + "/api/avatar/play/" + avatarUuid)
                .post(TravianApi.emptyBody())
                .build();
        JSONObject playResp = TravianApi.executeJson(http, playReq);
        String worldCode = playResp.getString("code");

        Request worldAuthReq = new Request.Builder()
                .url(worldHost + "/api/v1/auth?redirect=false&code=" + worldCode + "&response_type=token")
                .post(TravianApi.emptyBody())
                .build();
        TravianApi.executeJson(http, worldAuthReq); // sets JWT cookie for worldHost

        return worldHost;
    }

    // ------------------------------------------------------------------
    // polling
    // ------------------------------------------------------------------

    private static String pollQuery(boolean withMovements) {
        return "{ \"query\": \"query { ownPlayer { villages { id name x y tribeId "
                + "buildEvents { id buildingTypeId aspiredLevel timestamp status isActive } "
                + "trainingTroops { eventId unit { id } unitsLeft nextUnitReadyAt lastUnitReadyAt } "
                + "stable { trainingUnits { eventId unit { id } unitsLeft nextUnitReadyAt lastUnitReadyAt } } "
                + "barracks { trainingUnits { eventId unit { id } unitsLeft nextUnitReadyAt lastUnitReadyAt } } "
                + (withMovements ? AttackAlerts.MOVEMENTS_SELECTION + " " : "")
                + "} } }\" }";
    }

    /**
     * The poll request. HTTP 401/403 means the world token was refused (sign in again); any other non-2xx
     * answer ("too many requests", maintenance, server error) or an unreadable one is thrown as it is, so
     * the check waits instead of signing in again.
     */
    private JSONObject runPollQuery(OkHttpClient http, String gameworldHost, boolean withMovements) throws Exception {
        Request req = new Request.Builder()
                .url(gameworldHost + "/api/v1/graphql")
                .post(TravianApi.jsonBody(pollQuery(withMovements)))
                .build();
        try {
            return TravianApi.executeJsonStrict(http, req);
        } catch (TravianApi.HttpError e) {
            if (e.code == 401 || e.code == 403) {
                throw new AuthExpiredException("HTTP " + e.code);
            }
            throw e;
        }
    }

    private boolean movementsEnabled() {
        return System.currentTimeMillis() >= statePrefs().getLong(KEY_MOVEMENTS_OFF_UNTIL, 0);
    }

    private static String errorSummary(JSONObject resp) {
        JSONArray errors = resp.optJSONArray("errors");
        String text = errors != null ? errors.toString() : "no errors field";
        return text.length() > 300 ? text.substring(0, 300) + "..." : text;
    }

    private void poll(OkHttpClient http, String gameworldHost) throws Exception {
        boolean withMovements = movementsEnabled();
        JSONObject resp = runPollQuery(http, gameworldHost, withMovements);
        JSONObject data = resp.optJSONObject("data");
        if (data == null && withMovements) {
            // The movements part may have been rejected (schema mismatch). Retry without it so
            // build/troop notifications keep working, and stop asking for it for a day.
            Log.w(TAG, "poll with movements returned no data (" + errorSummary(resp) + "), retrying without");
            resp = runPollQuery(http, gameworldHost, false);
            data = resp.optJSONObject("data");
            if (data != null) {
                statePrefs().edit().putLong(KEY_MOVEMENTS_OFF_UNTIL,
                        System.currentTimeMillis() + TimeUnit.DAYS.toMillis(1)).apply();
                withMovements = false;
            }
        }
        if (data == null) {
            // Could be a refused token the game reports as an error, or anything else. A new sign-in is
            // allowed for it, but runCheck limits sign-ins to one per 30 minutes.
            throw new AuthExpiredException("no data in poll response: " + errorSummary(resp));
        }
        JSONObject player = data.getJSONObject("ownPlayer");
        JSONArray villages = player.getJSONArray("villages");

        Map<String, TrackedEvent> tracked = loadTrackedState();
        Map<String, TrackedEvent> stillActive = new HashMap<String, TrackedEvent>();
        List<AttackAlerts.Alert> attacks = new ArrayList<AttackAlerts.Alert>();
        List<ArrivalAlerts.Arrival> arrivals = new ArrayList<ArrivalAlerts.Arrival>();
        // false if any village came back without its attack list: then "no attacks" means "unknown"
        boolean movementsComplete = withMovements;

        for (int i = 0; i < villages.length(); i++) {
            JSONObject village = villages.getJSONObject(i);
            String villageName = village.optString("name", "your village");
            int vx = village.optInt("x", 0);
            int vy = village.optInt("y", 0);
            currentTribeId = village.optInt("tribeId", -1);
            if (withMovements) {
                attacks.addAll(AttackAlerts.parse(village, System.currentTimeMillis()));
                arrivals.addAll(ArrivalAlerts.parse(village, System.currentTimeMillis()));
                movementsComplete = movementsComplete && AttackAlerts.hasMovementData(village);
            }

            JSONArray buildEvents = village.optJSONArray("buildEvents");
            if (buildEvents != null) {
                for (int j = 0; j < buildEvents.length(); j++) {
                    JSONObject ev = buildEvents.getJSONObject(j);
                    String id = "build:" + ev.optLong("id");
                    boolean active = ev.optBoolean("isActive", false);
                    long finishMs = toMillis(ev.optLong("timestamp", 0));
                    stillActive.put(id, new TrackedEvent("build", villageName, vx, vy,
                            ev.optInt("buildingTypeId", -1), ev.optInt("aspiredLevel", -1), 0, finishMs));
                    Log.i(TAG, "build event " + id + " active=" + active + " raw timestamp=" + ev.optLong("timestamp", 0));
                    if (active) {
                        noteFinish(NotificationKind.forTrackedKind("build"), "build " + id, finishMs);
                    }
                }
            }
            // The game lists one training both under its building (barracks/stable) and in the general
            // trainingTroops list. Read the specific ones first so it's counted (and labelled) once.
            Set<String> seenTraining = new HashSet<String>();
            JSONObject stable = village.optJSONObject("stable");
            if (stable != null) {
                collectQueue(stable.optJSONArray("trainingUnits"), "stable", villageName, vx, vy, tracked, stillActive, seenTraining);
            }
            JSONObject barracks = village.optJSONObject("barracks");
            if (barracks != null) {
                collectQueue(barracks.optJSONArray("trainingUnits"), "barracks", villageName, vx, vy, tracked, stillActive, seenTraining);
            }
            collectQueue(village.optJSONArray("trainingTroops"), "train", villageName, vx, vy, tracked, stillActive, seenTraining);
        }

        long now = System.currentTimeMillis();
        for (Map.Entry<String, TrackedEvent> entry : tracked.entrySet()) {
            if (stillActive.containsKey(entry.getKey())) {
                continue;
            }
            TrackedEvent gone = entry.getValue();
            if (gone.finishMs > 0 && now < gone.finishMs - EARLY_TOLERANCE_MS) {
                Log.i(TAG, "event " + entry.getKey() + " vanished before its finish time (cancelled or sped up), not notifying");
                continue;
            }
            notify(NotificationKind.forTrackedKind(gone.kind), describeCompletion(gone));
        }
        saveTrackedState(stillActive);
        saveIdleVillages(villages, stillActive.values());
        saveVillageList(villages);
        int buildCount = 0;
        for (TrackedEvent ev : stillActive.values()) {
            if ("build".equals(ev.kind)) {
                buildCount++;
            }
        }
        statBuilds = buildCount;
        statTrainings = stillActive.size() - buildCount;
        statAttacks = withMovements ? attacks.size() : -1;
        statArrivals = withMovements ? arrivals.size() : -1;
        if (withMovements && movementsComplete) {
            long nowMs = System.currentTimeMillis();
            statePrefs().edit().putLong(KEY_NEXT_ATTACK_AT, AttackAlerts.nextArrivalMs(attacks, nowMs))
                    .putLong(KEY_ATTACKS_KNOWN_AT, nowMs).apply();
            completeAttacks = attacks;
        }
        if (withMovements) {
            announceAttacks(attacks);
            if (movementsComplete) {
                reportArrivals(arrivals);
                reportCalledOffAttacks(attacks);
            } else {
                // "nothing listed" would look like "everything has arrived / been called off"
                Log.w(TAG, "a village came back without its movement lists, not judging arrivals or called-off attacks this time");
            }
        }

        if (quiet) {
            // Quiet hours: no automatic action may go out anyway, so only the one poll above (attacks,
            // queues, arrivals) runs; storage, hero, silver and building reads wait for the morning.
            Log.i(TAG, "quiet hours: extras skipped");
        } else {
            checkExtras(http, gameworldHost);
        }
        Log.i(TAG, "poll ok: villages=" + villages.length() + " active=" + stillActive.size());
    }

    /**
     * Storage warnings and hero changes. Each is its own request, so a problem with either can
     * never break the main check above.
     */
    /**
     * Like runQuery, but for queries that don't start at ownPlayer (bootstrapData, ownVillage(id:)).
     * The query text is JSON-escaped by JSONObject, so quotes inside it are safe.
     */
    private JSONObject runRootQuery(OkHttpClient http, String gameworldHost, String query) throws Exception {
        String body = new JSONObject().put("query", query).toString();
        Request req = new Request.Builder()
                .url(gameworldHost + "/api/v1/graphql")
                .post(TravianApi.jsonBody(body))
                .build();
        return TravianApi.executeJson(http, req);
    }

    /** The object under data.<key> of a GraphQL response, or null if the response has none. */
    private static JSONObject dataObject(JSONObject response, String key) {
        JSONObject data = response.optJSONObject("data");
        return data == null ? null : data.optJSONObject(key);
    }

    /**
     * Keeps the game's own building data current: the rules table (downloaded again only when the game's
     * release version changes) and the player's buildings (every check). Failures leave the last good copy
     * in place.
     */
    private void refreshBuildingData(OkHttpClient http, String gameworldHost) {
        refreshBuildingRules(http, gameworldHost);
        refreshPlayerBuildings(http, gameworldHost);
        try {
            refreshLandDistribution(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "land distribution read failed: " + e);
        }
    }

    /** village id -> the game's landDistribution value (picks the field layout on the Map). */
    static final String KEY_LAND_DISTRIBUTION = "land_distribution";
    private static final String KEY_LAND_TRIED_AT = "land_distribution_tried_at";
    /** Reads in a row that learned nothing; after LAND_MAX_EMPTY_TRIES the game doesn't have it, so stop asking. */
    private static final String KEY_LAND_EMPTY_TRIES = "land_distribution_empty_tries";
    private static final int LAND_MAX_EMPTY_TRIES = 3;

    /**
     * Reads each village's landDistribution once (it never changes), so the Map can place the fields the way
     * the game does. The field name comes from the game client; where it sits in the API is tried in two
     * places, at most every 6 hours while unknown. The raw answers are logged ("LAND" lines).
     */
    private void refreshLandDistribution(OkHttpClient http, String gameworldHost) throws Exception {
        SharedPreferences state = statePrefs();
        PlayerBuildings player = PlayerBuildings.parse(state.getString(KEY_PLAYER_BUILDINGS, null));
        if (player == null || player.villages.isEmpty()) {
            return;
        }
        JSONObject known = new JSONObject(state.getString(KEY_LAND_DISTRIBUTION, "{}"));
        boolean missing = false;
        for (PlayerBuildings.Village v : player.villages) {
            missing |= !known.has(v.id);
        }
        long now = System.currentTimeMillis();
        int emptyTries = state.getInt(KEY_LAND_EMPTY_TRIES, 0);
        if (!missing || emptyTries >= LAND_MAX_EMPTY_TRIES
                || now - state.getLong(KEY_LAND_TRIED_AT, 0) < 6 * 3_600_000L) {
            return;
        }
        state.edit().putLong(KEY_LAND_TRIED_AT, now).apply();
        int knownBefore = known.length();
        JSONObject own = null;
        try {
            JSONObject first = runRootQuery(http, gameworldHost, "query { ownPlayer { villages { id landDistribution } } }");
            Log.i(TAG, "LAND ownPlayer: " + cut(first.toString(), 600));
            own = dataObject(first, "ownPlayer");
        } catch (Exception e) {
            Log.i(TAG, "LAND ownPlayer failed: " + e);
        }
        org.json.JSONArray list = own == null ? null : own.optJSONArray("villages");
        for (int i = 0; list != null && i < list.length(); i++) {
            JSONObject v = list.optJSONObject(i);
            if (v != null && v.has("landDistribution") && !v.isNull("landDistribution")) {
                known.put(String.valueOf(v.opt("id")), String.valueOf(v.opt("landDistribution")));
            }
        }
        for (PlayerBuildings.Village v : player.villages) {
            if (known.has(v.id)) {
                continue;
            }
            JSONObject one = null;
            try {
                JSONObject second = runRootQuery(http, gameworldHost,
                        "query { village( id: " + Long.parseLong(v.id) + " ) { landDistribution } }");
                Log.i(TAG, "LAND village " + v.id + ": " + cut(second.toString(), 600));
                one = dataObject(second, "village");
            } catch (Exception e) {
                Log.i(TAG, "LAND village " + v.id + " failed: " + e);
            }
            if (one != null && one.has("landDistribution") && !one.isNull("landDistribution")) {
                known.put(v.id, String.valueOf(one.opt("landDistribution")));
            }
        }
        // A read that keeps failing is noise in the game's error logs: after a few empty ones, never again.
        state.edit().putString(KEY_LAND_DISTRIBUTION, known.toString())
                .putInt(KEY_LAND_EMPTY_TRIES, known.length() > knownBefore ? 0 : emptyTries + 1).apply();
    }

    private void refreshBuildingRules(OkHttpClient http, String gameworldHost) {
        SharedPreferences rulesPrefs = getApplicationContext().getSharedPreferences(BuildingRules.PREFS, Context.MODE_PRIVATE);
        boolean haveRules = BuildingRules.cacheUsable(rulesPrefs.getString(BuildingRules.KEY_JSON, null),
                rulesPrefs.getString(BuildingRules.KEY_QUERY, null));
        long now = System.currentTimeMillis();
        if (haveRules && now - statePrefs().getLong(KEY_RULES_CHECKED_AT, 0) < TimeUnit.HOURS.toMillis(2)) {
            return;
        }
        try {
            JSONObject versionObject = dataObject(runRootQuery(http, gameworldHost, BuildingRules.VERSION_QUERY), "bootstrapData");
            if (versionObject == null) {
                Log.w(TAG, "building rules version not readable");
                return;
            }
            String version = versionObject.optString("releaseVersion", "");
            if (haveRules && version.equals(rulesPrefs.getString(BuildingRules.KEY_VERSION, ""))) {
                statePrefs().edit().putLong(KEY_RULES_CHECKED_AT, now).apply();
                return;
            }
            JSONObject rules = dataObject(runRootQuery(http, gameworldHost, BuildingRules.QUERY), "bootstrapData");
            if (rules == null || BuildingRules.parse(rules.toString()) == null) {
                Log.w(TAG, "building rules not readable, keeping the old copy");
                return;
            }
            rulesPrefs.edit().putString(BuildingRules.KEY_JSON, rules.toString())
                    .putString(BuildingRules.KEY_VERSION, version)
                    .putString(BuildingRules.KEY_QUERY, BuildingRules.QUERY).apply();
            statePrefs().edit().putLong(KEY_RULES_CHECKED_AT, now).apply();
            Log.i(TAG, "building rules saved: version " + version + ", " + rules.toString().length() + " chars");
        } catch (Exception e) {
            Log.w(TAG, "building rules refresh failed: " + e);
        }
    }

    /** True only when this check read the player's buildings successfully (the build queue relies on it). */
    private boolean buildingsFresh;

    private void refreshPlayerBuildings(OkHttpClient http, String gameworldHost) {
        buildingsFresh = false;
        try {
            JSONObject player = dataObject(runRootQuery(http, gameworldHost, PlayerBuildings.QUERY), "ownPlayer");
            if (player == null || PlayerBuildings.parse(player.toString()) == null) {
                Log.w(TAG, "player buildings not readable, keeping the old copy");
                return;
            }
            statePrefs().edit().putString(KEY_PLAYER_BUILDINGS, player.toString()).apply();
            buildingsFresh = true;
        } catch (Exception e) {
            Log.w(TAG, "player buildings refresh failed: " + e);
        }
    }

    /**
     * Runs each village's saved build queue: only when Automatic actions is on (Actions screen) and that
     * village's own switch is on. Decides with BuildQueueStep (game data only), sends through ActionSender
     * (safety check, attack pause, practice mode, log), and saves the queue's status line for the screen.
     */
    private void checkBuildQueues(OkHttpClient http, String gameworldHost) {
        Context ctx = getApplicationContext();
        if (!ActionSender.settings(ctx).masterOn) {
            return;
        }
        if (!buildingsFresh) {
            Log.i(TAG, "build queues skipped: buildings not read in this check");
            return;
        }
        SharedPreferences state = statePrefs();
        PlayerBuildings player = PlayerBuildings.parse(state.getString(KEY_PLAYER_BUILDINGS, null));
        BuildingRules rules = BuildingRules.parse(ctx.getSharedPreferences(BuildingRules.PREFS, Context.MODE_PRIVATE)
                .getString(BuildingRules.KEY_JSON, null));
        if (player == null || rules == null) {
            return;
        }
        SharedPreferences orders = ctx.getSharedPreferences(BuildOrderStore.PREFS, Context.MODE_PRIVATE);
        AutomationSettings.Config cfg = ActionSender.timing(ctx);
        List<VillageResources.Entry> stocks = VillageResources.fromJson(state.getString(KEY_VILLAGE_RESOURCES, null));
        long now = System.currentTimeMillis();
        boolean quiet = QuietHours.isQuietNow(cfg.quietHours, now);
        for (PlayerBuildings.Village village : player.villages) {
            if (!orders.getBoolean(BuildOrderStore.autoKey(village.id), false)) {
                continue;
            }
            boolean parallel = player.tribeId == BuildChoices.ROMAN_TRIBE
                    && orders.getBoolean(BuildOrderStore.parallelKey(village.id), true);
            long fieldIdle, buildingIdle;
            if (parallel) {
                fieldIdle = idleSince(orders, "idle_since_" + village.id + "_field",
                        BuildQueueStep.laneBusy(village, true), now);
                buildingIdle = idleSince(orders, "idle_since_" + village.id + "_building",
                        BuildQueueStep.laneBusy(village, false), now);
            } else {
                fieldIdle = buildingIdle = idleSince(orders, "idle_since_" + village.id, !village.pending.isEmpty(), now);
            }
            List<BuildOrderStore.Entry> queue = BuildOrderStore.fromJson(
                    orders.getString(BuildOrderStore.key(village.id), null));
            BuildQueueStep.Outcome out = BuildQueueStep.next(rules, player.tribeId, village,
                    VillageResources.find(stocks, village.id), queue, cfg, quiet, now, parallel, fieldIdle, buildingIdle);
            String notes = android.text.TextUtils.join("; ", out.notes);
            orders.edit().putString(BuildOrderStore.key(village.id), BuildOrderStore.toJson(out.queue))
                    .putString(BuildOrderStore.notesKey(village.id),
                            java.text.DateFormat.getTimeInstance(java.text.DateFormat.SHORT).format(new java.util.Date(now))
                                    + ": " + (notes.isEmpty() ? "nothing to do" : notes))
                    .apply();
            if (out.fire == null) {
                continue;
            }
            String failKey = "fail_" + village.id + "_" + out.fire.slotId + "_" + out.fire.toLevel;
            int failures = orders.getInt(failKey, 0);
            long until = orders.getLong(failKey + "_until", 0);
            String label = GameData.buildingName(out.fire.typeId) + " to " + out.fire.toLevel;
            if (now < until) {
                orders.edit().putString(BuildOrderStore.notesKey(village.id), label + ": the game refused it, trying "
                        + "again at " + java.text.DateFormat.getTimeInstance(java.text.DateFormat.SHORT)
                        .format(new java.util.Date(until))).apply();
                continue;
            }
            try {
                ActionClient.Result r = ActionSender.send(ctx, http, gameworldHost,
                        GameActions.build(village.id, out.fire.slotId, out.fire.typeId, label,
                                out.fire.fromLevel, out.fire.next), true);
                Log.i(TAG, "build queue " + village.id + ": " + label + " -> " + r.outcome);
                if (r.sessionExpired) {
                    clearCachedWorldToken();
                } else if ("FAILED".equals(r.outcome)) {
                    orders.edit().putInt(failKey, failures + 1)
                            .putLong(failKey + "_until", now + Backoff.delayMs(failures + 1))
                            .putString(BuildOrderStore.notesKey(village.id), label + ": the game said no ("
                                    + r.describe() + ")").apply();
                } else if ("SENT".equals(r.outcome)) {
                    orders.edit().remove(failKey).remove(failKey + "_until").apply();
                }
            } catch (Exception e) {
                Log.w(TAG, "build queue send failed: " + e);
            }
        }
    }

    /**
     * Starts a town hall celebration per village when the user's switch is on (Settings, default off) and
     * CelebrationPlanner says the game allows it and the stock covers it plus the auto-build buffer. Sends
     * through ActionSender (master switch, practice mode, attack pause, log).
     */
    private void checkCelebrations(OkHttpClient http, String gameworldHost) throws Exception {
        Context ctx = getApplicationContext();
        SharedPreferences actions = ctx.getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE);
        if (!ActionSender.settings(ctx).masterOn || !actions.getBoolean(CelebrationPlanner.KEY_ON, false)) {
            return;
        }
        SharedPreferences state = statePrefs();
        PlayerBuildings player = PlayerBuildings.parse(state.getString(KEY_PLAYER_BUILDINGS, null));
        if (player == null) {
            return;
        }
        long now = System.currentTimeMillis();
        // The town halls are read every 25-35 minutes, not every check (a celebration lasts hours).
        if (now < state.getLong(KEY_CELEBRATIONS_NEXT_READ, 0)) {
            return;
        }
        state.edit().putLong(KEY_CELEBRATIONS_NEXT_READ, now + CheckPacing.between(random, 25 * 60_000L, 35 * 60_000L))
                .apply();
        String wanted = actions.getBoolean(CelebrationPlanner.KEY_GREAT, false) ? "GREAT" : "SMALL";
        int buffer = ActionSender.timing(ctx).bufferPercent;
        List<VillageResources.Entry> stocks = VillageResources.fromJson(state.getString(KEY_VILLAGE_RESOURCES, null));
        SharedPreferences orders = ctx.getSharedPreferences(BuildOrderStore.PREFS, Context.MODE_PRIVATE);
        for (PlayerBuildings.Village village : player.villages) {
            JSONObject v = dataObject(runRootQuery(http, gameworldHost, CelebrationPlanner.query(village.id)),
                    "ownVillage");
            CelebrationPlanner.TownHall hall = CelebrationPlanner.parse(v == null ? null : v.optJSONObject("townHall"));
            VillageResources.Entry s = VillageResources.find(stocks, village.id);
            BuildQueueAutomation.Resources stock = s == null ? null
                    : new BuildQueueAutomation.Resources(s.lumberStock, s.clayStock, s.ironStock, s.cropStock);
            boolean queueWaiting = orders.getBoolean(BuildOrderStore.autoKey(village.id), false)
                    && village.pending.isEmpty()
                    && !BuildOrderStore.fromJson(orders.getString(BuildOrderStore.key(village.id), null)).isEmpty();
            CelebrationPlanner.Decision d = CelebrationPlanner.decide(hall, wanted, stock, buffer, queueWaiting, now);
            String line = java.text.DateFormat.getTimeInstance(java.text.DateFormat.SHORT).format(new java.util.Date(now))
                    + ": " + d.reason;
            if (d.start != null) {
                ActionClient.Result r = ActionSender.send(ctx, http, gameworldHost,
                        GameActions.celebrate(village.id, d.start), true);
                Log.i(TAG, "celebration " + village.id + ": " + d.start + " -> " + r.outcome + " " + r.describe());
                line += " -> " + r.describe();
                if (r.sessionExpired) {
                    clearCachedWorldToken();
                }
            }
            actions.edit().putString(CelebrationPlanner.notesKey(village.id), line).apply();
        }
    }

    /**
     * Troop escape (Settings, off by default): shortly before an attack lands on a village, raids the
     * nearest empty oasis with the troops at home. EscapePlanner decides when; the game's step-1 preview
     * (its own travel time) decides whether an oasis is far enough that the troops are still away when the
     * wave's last attack lands; up to MAX_TRIES of the nearest empty oases are tried. Sends through
     * ActionSender (master switch, practice mode, village steps, log); the attack pause doesn't apply.
     */
    private void checkEscape(OkHttpClient http, String gameworldHost) throws Exception {
        Context ctx = getApplicationContext();
        SharedPreferences p = ctx.getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE);
        EscapePlanner.Settings s = new EscapePlanner.Settings(p.getBoolean(EscapePlanner.KEY_ON, false),
                p.getInt(EscapePlanner.KEY_LEAD_MIN, EscapePlanner.DEFAULT_LEAD_MIN),
                p.getBoolean(EscapePlanner.KEY_HERO, true), p.getInt(EscapePlanner.KEY_MIN_ATTACK, 0));
        if (!s.on || completeAttacks == null) {
            return;
        }
        long now = System.currentTimeMillis();
        List<Long> handled = EscapePlanner.handled(p.getString(EscapePlanner.KEY_DONE, null), now);
        for (VillageList.Entry v : VillageList.fromJson(statePrefs().getString(KEY_VILLAGES, null))) {
            List<Long> arrivals = new ArrayList<Long>();
            for (AttackAlerts.Alert a : completeAttacks) {
                if (a.targetX == v.x && a.targetY == v.y) {
                    arrivals.add(a.arrivalMs);
                }
            }
            EscapePlanner.Plan plan = EscapePlanner.plan(s, arrivals, now, handled);
            if ("wait".equals(plan.step)) {
                noteWake("escape " + v.name, plan.wakeAtMs);
                continue;
            }
            if (!"go".equals(plan.step)) {
                continue;
            }
            // Handled from here on, whatever happens, so one wave is acted on once.
            p.edit().putString(EscapePlanner.KEY_DONE, EscapePlanner.withHandled(handled, plan.firstImpactMs)).apply();
            handled.add(plan.firstImpactMs);
            String when = java.text.DateFormat.getTimeInstance(java.text.DateFormat.SHORT)
                    .format(new java.util.Date(plan.firstImpactMs));
            JSONObject own = dataObject(runRootQuery(http, gameworldHost, "query { ownVillage(id: "
                    + Integer.parseInt(v.id) + ") { troops { ownTroopsAtTown { units { t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 "
                    + "t11 } } } troopOverview { incomingAttacksRaidsPower { attack amount } } } }"), "ownVillage");
            JSONObject power = own == null || own.optJSONObject("troopOverview") == null ? null
                    : own.optJSONObject("troopOverview").optJSONObject("incomingAttacksRaidsPower");
            if (s.minAttackPower > 0 && power != null && power.optInt("attack", 0) < s.minAttackPower) {
                Log.i(TAG, "escape " + v.name + ": attack power " + power.optInt("attack") + " is under "
                        + s.minAttackPower + ", staying home");
                continue;
            }
            JSONObject atTown = own == null || own.optJSONObject("troops") == null ? null
                    : own.optJSONObject("troops").optJSONObject("ownTroopsAtTown");
            java.util.Map<String, Integer> units = EscapePlanner.unitsToMove(
                    atTown == null ? null : atTown.optJSONObject("units"), s.includeHero);
            if (units.isEmpty()) {
                Log.i(TAG, "escape " + v.name + ": no troops at home to move");
                continue;
            }
            JSONObject grid = runRootQuery(http, gameworldHost, OasisFinder.gridQuery(v.x, v.y)).optJSONObject("data");
            List<OasisFinder.Oasis> empties = new ArrayList<OasisFinder.Oasis>();
            for (OasisFinder.Oasis o : OasisFinder.parseGrid(grid, v.x, v.y)) {
                if (o.empty() && o.cellId > 0) {
                    empties.add(o);
                }
            }
            final long lastImpact = plan.lastImpactMs;
            ActionClient.PreviewCheck check = new ActionClient.PreviewCheck() {
                @Override
                public String problem(ActionClient.Response preview) {
                    return EscapePlanner.previewProblem(preview.body, System.currentTimeMillis(), lastImpact);
                }
            };
            String outcome = null;
            boolean gameOpened = false;
            java.util.List<String> tried = new ArrayList<String>();
            for (int i = 0; i < empties.size() && i < EscapePlanner.MAX_TRIES; i++) {
                OasisFinder.Oasis o = empties.get(i);
                if (i > 0) {
                    // A player reads one preview before trying the next oasis.
                    Thread.sleep(CheckPacing.between(random, 2_000L, 5_000L));
                }
                ActionClient.Result r = ActionSender.send(ctx, http, gameworldHost,
                        TroopSend.escape(v.id, o.cellId, o.x, o.y, units, plan.firstImpactMs), true, check);
                Log.i(TAG, "escape " + v.name + " -> (" + o.x + "|" + o.y + "): " + r.outcome + " " + r.describe());
                if (r.sessionExpired) {
                    clearCachedWorldToken();
                    break;
                }
                if ("SENT".equals(r.outcome) || "DRY_RUN".equals(r.outcome)) {
                    String arrival = TroopSend.arrivalText(r.responseBody);
                    outcome = ("SENT".equals(r.outcome) ? "Moved " : "Practice: would move ")
                            + EscapePlanner.total(units) + " troops from " + v.name + " to the empty oasis ("
                            + o.x + "|" + o.y + ") before the attack at " + when
                            + (arrival.isEmpty() ? "" : " (" + arrival + ")");
                    break;
                }
                if ("REFUSED".equals(r.outcome) && GameScreen.busy(System.currentTimeMillis())) {
                    gameOpened = true; // nothing went out: the player opened the game during this check
                    break;
                }
                tried.add("(" + o.x + "|" + o.y + "): " + r.describe());
                if (!r.describe().contains("too close")) {
                    break; // refused for another reason (switch off, game said no): trying farther won't help
                }
            }
            if (outcome == null && gameOpened) {
                // Not handled after all: a later check (after the game is closed) may still act on this wave.
                handled.remove(Long.valueOf(plan.firstImpactMs));
                p.edit().putString(EscapePlanner.KEY_DONE, EscapePlanner.joinHandled(handled)).apply();
                Log.i(TAG, "escape " + v.name + ": the game was opened, nothing sent; will look again after it closes");
                continue;
            }
            if (outcome == null) {
                outcome = "Couldn't move troops from " + v.name + " before the attack at " + when + ": "
                        + (empties.isEmpty() ? "no empty oasis within " + OasisFinder.RADIUS + " fields"
                        : android.text.TextUtils.join("; ", tried));
            }
            notify(NotificationKind.TROOPS_ESCAPED, outcome);
        }
    }

    /** When a build line went idle (saved under key); cleared while the game is building in it. */
    private static long idleSince(SharedPreferences orders, String key, boolean busy, long now) {
        if (busy) {
            orders.edit().remove(key).apply();
            return 0;
        }
        long since = orders.getLong(key, 0);
        if (since == 0) {
            since = now;
            orders.edit().putLong(key, now).apply();
        }
        return since;
    }

    private void checkExtras(OkHttpClient http, String gameworldHost) {
        try {
            checkEscape(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "escape check failed: " + e);
        }
        try {
            refreshBuildingData(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "building data refresh failed: " + e);
        }
        try {
            checkBuildQueues(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "build queue check failed: " + e);
        }
        try {
            checkCelebrations(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "celebration check failed: " + e);
        }
        try {
            checkStorage(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "storage check failed: " + e);
        }
        try {
            checkHero(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "hero data check failed: " + e);
        }
        try {
            checkSilver(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "silver check failed: " + e);
        }
        try {
            checkAccountTier(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "gold club check failed: " + e);
        }
    }

    /**
     * Reads whether the account has Gold Club active (goldClub is expected to be a plain true/false on
     * ownPlayer, going by the field's accessor names in the game's compiled code). Logs the raw value
     * the first time so an unexpected shape is visible without guessing at it.
     */
    private void checkAccountTier(OkHttpClient http, String gameworldHost) throws Exception {
        SharedPreferences prefs = statePrefs();
        long now = System.currentTimeMillis();
        // Every 30 minutes until the game has answered once (true, false, or nothing), then every 6 hours.
        long every = prefs.contains(KEY_GOLD_CLUB) || prefs.getBoolean(KEY_GOLD_CLUB_ANSWERED, false)
                ? TimeUnit.HOURS.toMillis(6) : TimeUnit.MINUTES.toMillis(30);
        if (now - prefs.getLong(KEY_GOLD_CLUB_LOGGED_AT, 0) < every) {
            return;
        }
        prefs.edit().putLong(KEY_GOLD_CLUB_LOGGED_AT, now).apply();
        JSONObject resp = runQuery(http, gameworldHost, "goldClub");
        JSONObject data = resp.optJSONObject("data");
        if (data == null) {
            Log.i(TAG, "gold club query failed: " + errorSummary(resp));
            return;
        }
        Object raw = data.getJSONObject("ownPlayer").opt("goldClub");
        Log.i(TAG, "gold club raw: " + raw);
        prefs.edit().putBoolean(KEY_GOLD_CLUB_ANSWERED, true).apply();
        if (raw instanceof Boolean) {
            prefs.edit().putString(KEY_GOLD_CLUB, String.valueOf(raw)).apply();
        } else {
            Log.w(TAG, "goldClub wasn't a plain true/false, leaving it unknown: " + raw);
        }
    }

    private JSONObject runQuery(OkHttpClient http, String gameworldHost, String selection) throws Exception {
        String body = "{ \"query\": \"query { ownPlayer { " + selection + " } }\" }";
        Request req = new Request.Builder()
                .url(gameworldHost + "/api/v1/graphql")
                .post(TravianApi.jsonBody(body))
                .build();
        return TravianApi.executeJson(http, req);
    }

    /**
     * Warns once per village and resource when a warehouse or granary is full or due to be within about
     * 30 minutes, and again only after it has clearly moved away from full.
     */
    private void checkStorage(OkHttpClient http, String gameworldHost) throws Exception {
        JSONObject resp = runQuery(http, gameworldHost, "villages { id name x y " + ResourceAlerts.SELECTION + " }");
        JSONObject data = resp.optJSONObject("data");
        if (data == null) {
            Log.w(TAG, "storage query returned no data (" + errorSummary(resp) + ")");
            return;
        }
        JSONArray villages = data.getJSONObject("ownPlayer").getJSONArray("villages");
        saveVillageResources(villages);
        Set<String> alerted = new HashSet<String>(statePrefs().getStringSet(KEY_STORAGE_ALERTED, new HashSet<String>()));
        int warned = 0;
        long nowMs = System.currentTimeMillis();
        long soonestFull = 0;
        String soonestWhat = null;
        for (int i = 0; i < villages.length(); i++) {
            JSONObject village = villages.getJSONObject(i);
            List<ResourceAlerts.Reading> fresh = new ArrayList<ResourceAlerts.Reading>();
            for (ResourceAlerts.Reading r : ResourceAlerts.read(village)) {
                if (r.etaMs >= 0 && (soonestFull == 0 || nowMs + r.etaMs < soonestFull)) {
                    soonestFull = nowMs + r.etaMs;
                    soonestWhat = r.label + (villages.length() > 1 ? " in " + village.optString("name", "a village") : "");
                }
                if (ResourceAlerts.atRisk(r)) {
                    if (alerted.add(r.key)) {
                        fresh.add(r);
                    }
                } else if (ResourceAlerts.clear(r)) {
                    alerted.remove(r.key);
                }
            }
            JSONObject res = village.optJSONObject("resources");
            if (res != null && res.has("netCropProduction")) {
                String cropKey = "crop:" + village.opt("id");
                long net = res.optLong("netCropProduction", 0);
                long cropStock = res.optLong("cropStock", 0);
                CropWatch.Action action = CropWatch.decide(alerted.contains(cropKey), net, cropStock);
                if (action == CropWatch.Action.WARN) {
                    alerted.add(cropKey);
                    postNotification(NotificationKind.CROP_NEGATIVE, CropWatch.TITLE,
                            CropWatch.text(village.optString("name", "your village"), net, cropStock),
                            cropKey.hashCode(), NotificationCompat.PRIORITY_HIGH);
                } else if (action == CropWatch.Action.CLEAR) {
                    alerted.remove(cropKey);
                }
            }
            if (!fresh.isEmpty()) {
                String name = village.optString("name", "your village");
                postNotification(NotificationKind.RESOURCES_FULL, ResourceAlerts.TITLE,
                        ResourceAlerts.text(name, village.optInt("x", 0), village.optInt("y", 0), fresh),
                        ("storage:" + village.opt("id")).hashCode(), NotificationCompat.PRIORITY_HIGH);
                warned++;
            }
        }
        statePrefs().edit().putStringSet(KEY_STORAGE_ALERTED, alerted)
                .putLong(ToolsWidget.KEY_STORAGE_FULL_AT, soonestFull)
                .putString(ToolsWidget.KEY_STORAGE_FULL_WHAT, soonestWhat).apply();
        Log.i(TAG, "storage checked: villages=" + villages.length() + " warned=" + warned + " tracked=" + alerted.size());
    }

    /**
     * Tells what changed about the hero since the last check: a new adventure, back home, health low, or
     * died. The first check after installing only records where things stand. The raw hero record is also
     * written to the log whenever it changes, so the game's real values can be checked against.
     */
    private void checkHero(OkHttpClient http, String gameworldHost) throws Exception {
        JSONObject resp = runQuery(http, gameworldHost, HeroAlerts.SELECTION);
        JSONObject data = resp.optJSONObject("data");
        if (data == null) {
            Log.w(TAG, "hero query returned no data (" + errorSummary(resp) + ")");
            return;
        }
        JSONObject hero = data.getJSONObject("ownPlayer").optJSONObject("hero");
        SharedPreferences prefs = statePrefs();
        if (hero == null) {
            Log.i(TAG, "no hero in the response");
            return;
        }
        String raw = hero.toString();
        if (!raw.equals(prefs.getString(KEY_HERO_LOGGED, null))) {
            Log.i(TAG, "hero data: " + raw);
            prefs.edit().putString(KEY_HERO_LOGGED, raw).apply();
        }
        HeroAlerts.Snapshot before = HeroAlerts.Snapshot.fromJson(prefs.getString(KEY_HERO_STATE, null));
        HeroAlerts.Result result = HeroAlerts.evaluate(before, HeroAlerts.read(hero));
        for (HeroAlerts.Event event : result.events) {
            postNotification(HeroAlerts.kindOf(event), HeroAlerts.title(event, result.next),
                    HeroAlerts.text(event, result.next), ("hero:" + event.name()).hashCode(),
                    NotificationCompat.PRIORITY_HIGH);
        }
        prefs.edit().putString(KEY_HERO_STATE, result.next.toJson()).apply();
        Log.i(TAG, "hero checked: " + result.events.size() + " change(s), alive=" + result.next.alive
                + " health=" + result.next.health + " adventures=" + result.next.adventures
                + " atHome=" + result.next.atHome);
    }

    private static final String KEY_CELEBRATIONS_NEXT_READ = "celebrations_next_read";
    /** The auction house is read every 8-14 minutes (deals are auctions ending within 15). */
    private static final String KEY_SILVER_NEXT_READ = "silver_next_read";
    private static final String KEY_SILVER_SEEN = "silver_seen_at";
    private static final String KEY_SILVER_DEALS = "silver_deals_announced";
    private static final String KEY_SILVER_BIDS = "silver_auto_bids";
    private static final String KEY_SILVER_SOLD_AT = "silver_auto_sell_at";

    /**
     * Silver and the auction house, every check: announces new outbid / won / sold entries from the game's
     * silver log (the first look only remembers where the log stands), announces cheap auctions ending soon
     * (once per auction), and - only when the user switched them on - bids on those deals and puts bag items
     * up for sale when the game's price history says prices are high. Bids and sales go through ActionSender
     * (master switch, practice mode, guard, log).
     */
    private void checkSilver(OkHttpClient http, final String gameworldHost) throws Exception {
        final OkHttpClient client = http;
        SilverData.Reader reader = new SilverData.Reader() {
            @Override
            public JSONObject query(String query) throws Exception {
                return runRootQuery(client, gameworldHost, query);
            }
        };
        long now = System.currentTimeMillis();
        SharedPreferences state = statePrefs();
        if (now < state.getLong(KEY_SILVER_NEXT_READ, 0)) {
            return;
        }
        Context c = getApplicationContext();
        SharedPreferences switches = c.getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE);
        if (!switches.getBoolean(SilverActions.KEY_AUTO_BID, false)
                && !switches.getBoolean(SilverActions.KEY_AUTO_SELL, false)
                && !NotifierSettings.isEnabled(c, NotificationKind.SILVER_OUTBID)
                && !NotifierSettings.isEnabled(c, NotificationKind.SILVER_AUCTION)
                && !NotifierSettings.isEnabled(c, NotificationKind.SILVER_DEAL)) {
            return; // nothing would be shown or done with it: don't read the auction house at all
        }
        state.edit().putLong(KEY_SILVER_NEXT_READ, now + CheckPacing.between(random, 8 * 60_000L, 14 * 60_000L)).apply();
        JSONObject snap = SilverData.readForAlerts(reader, now);
        SharedPreferences actions = getApplicationContext().getSharedPreferences(ActionSender.PREFS,
                Context.MODE_PRIVATE);

        if (snap.optJSONObject("me") != null) {
            List<SilverData.Record> records = SilverData.records(snap);
            long seen = state.getLong(KEY_SILVER_SEEN, 0);
            for (SilverData.Event e : SilverData.newEvents(records, seen)) {
                postNotification(e.kind, "Travian: Legends", e.text, ("silver:" + e.text).hashCode(),
                        NotificationCompat.PRIORITY_HIGH);
            }
            long newest = SilverData.newestRecord(records);
            // The first look stores "now" when the log is empty, so later entries count as new.
            state.edit().putLong(KEY_SILVER_SEEN, Math.max(seen, newest > 0 ? newest : now)).apply();
        } else {
            Log.i(TAG, "silver: no wallet/log (" + snap.optString("meError") + ")");
        }

        int percent = actions.getInt(SilverActions.KEY_DEAL_PERCENT, SilverData.DEFAULT_DEAL_PERCENT);
        int minutes = actions.getInt(SilverActions.KEY_DEAL_MINUTES, SilverData.DEFAULT_DEAL_MINUTES);
        List<SilverData.Deal> deals = SilverData.deals(SilverData.buy(snap), SilverData.market(snap),
                SilverData.myId(snap), now, percent, minutes);
        Map<String, Long> announced = loadLongMap(KEY_SILVER_DEALS);
        Map<String, Long> autoBids = loadLongMap(KEY_SILVER_BIDS);
        boolean autoBid = actions.getBoolean(SilverActions.KEY_AUTO_BID, false);
        long cap = actions.getLong(SilverActions.KEY_BID_CAP, 0);
        long silver = SilverData.silver(snap);
        for (SilverData.Deal d : deals) {
            SilverData.Auction a = d.auction;
            if (!announced.containsKey(a.id)) {
                announced.put(a.id, a.finishedMs);
                postNotification(NotificationKind.SILVER_DEAL, "Cheap auction ending soon",
                        SilverData.itemText(a.name, a.amount) + " at " + a.price + " silver, " + d.percentUnder
                                + "% under the usual " + d.normalTotal() + ". Ends in "
                                + AlertStatus.duration(a.finishedMs - now) + ".",
                        ("silverdeal:" + a.id).hashCode(), NotificationCompat.PRIORITY_DEFAULT);
            }
            if (autoBid && !autoBids.containsKey(a.id)) {
                long amount = SilverActions.autoBidAmount(d, percent, cap, silver);
                if (amount > 0) {
                    // A person reads the offer before bidding: wait a few random seconds first.
                    ActionClient.Settings sw = ActionSender.settings(getApplicationContext());
                    try {
                        Thread.sleep(sw.masterOn && !sw.dryRun ? CheckPacing.between(random, 5_000L, 30_000L) : 0L);
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        break;
                    }
                    ActionClient.Result r = ActionSender.send(getApplicationContext(), http, gameworldHost,
                            SilverActions.bid(a.id, amount, "Bid up to " + amount + " silver on "
                                    + SilverData.itemText(a.name, a.amount)), true);
                    if (SilverActions.bidTried(r.outcome)) {
                        autoBids.put(a.id, a.finishedMs);
                    }
                    if ("SENT".equals(r.outcome)) {
                        silver -= amount;
                    }
                }
            }
        }
        pruneOld(announced, now);
        pruneOld(autoBids, now);
        saveLongMap(KEY_SILVER_DEALS, announced);
        saveLongMap(KEY_SILVER_BIDS, autoBids);
        Log.i(TAG, "silver checked: silver=" + silver + " deals=" + deals.size()
                + (snap.has("buyError") ? " buyError=" + snap.optString("buyError") : "")
                + (snap.has("marketError") ? " marketError=" + snap.optString("marketError") : ""));

        if (actions.getBoolean(SilverActions.KEY_AUTO_SELL, false)
                && now - state.getLong(KEY_SILVER_SOLD_AT, 0) > TimeUnit.HOURS.toMillis(1)) {
            state.edit().putLong(KEY_SILVER_SOLD_AT, now).apply();
            if (SilverActions.SELL_STEP_ONE_ONLY) {
                Log.i(TAG, "silver: automatic selling waits for the one-time Sell test on the Silver tab");
                return;
            }
            JSONObject full = SilverData.readAll(reader, now);
            int running = 0;
            for (SilverData.Auction s : SilverData.mySales(full)) {
                if (s.running()) {
                    running++;
                }
            }
            for (SilverData.BagItem it : SilverActions.toSell(full, running, SilverData.maxSales(full))) {
                ActionSender.send(getApplicationContext(), http, gameworldHost, SilverActions.sell(it.id,
                        it.amountToSell(), "Sell " + SilverData.itemText(it.name, it.amountToSell())), true);
            }
        }
    }

    private static String cut(String text, int max) {
        return text.length() > max ? text.substring(0, max) + "..." : text;
    }

    /**
     * Notifies once per incoming attack the first time it is seen, then once more when it is about
     * a minute away (waking the chain just before that moment so the reminder isn't late).
     */
    private void announceAttacks(List<AttackAlerts.Alert> attacks) {
        long now = System.currentTimeMillis();
        Map<String, Long> announced = loadLongMap(KEY_ANNOUNCED_ATTACKS);
        Map<String, Long> reminded = loadLongMap(KEY_REMINDED_ATTACKS);
        int fresh = 0;
        int reminders = 0;
        for (AttackAlerts.Alert alert : attacks) {
            if (!announced.containsKey(alert.key)) {
                postNotification(NotificationKind.ATTACK_INCOMING, AttackAlerts.title(alert), AttackAlerts.describe(alert, now),
                        alert.key.hashCode(), NotificationCompat.PRIORITY_MAX);
                announced.put(alert.key, alert.arrivalMs);
                fresh++;
            }
            if (reminded.containsKey(alert.key)) {
                continue;
            }
            if (AttackAlerts.reminderDue(alert, now)) {
                postNotification(NotificationKind.ATTACK_REMINDER, AttackAlerts.reminderTitle(alert),
                        AttackAlerts.reminderText(alert, now), alert.key.hashCode() + 1, NotificationCompat.PRIORITY_MAX);
                reminded.put(alert.key, alert.arrivalMs);
                reminders++;
            } else if (NotifierSettings.isEnabled(getApplicationContext(), NotificationKind.ATTACK_REMINDER)) {
                noteWake("attack reminder " + alert.key, alert.arrivalMs - AttackAlerts.REMINDER_WAKE_BEFORE_MS);
            }
        }
        for (AttackWaves.Wave wave : AttackWaves.find(attacks, AttackWaves.WINDOW_MS)) {
            if (wave.lastMs > now && !announced.containsKey(wave.key)) {
                postNotification(NotificationKind.ATTACK_WAVE, AttackWaves.title(wave), AttackWaves.describe(wave),
                        wave.key.hashCode(), NotificationCompat.PRIORITY_MAX);
                announced.put(wave.key, wave.lastMs);
            }
        }
        pruneOld(announced, now);
        pruneOld(reminded, now);
        saveLongMap(KEY_ANNOUNCED_ATTACKS, announced);
        saveLongMap(KEY_REMINDED_ATTACKS, reminded);
        Log.i(TAG, "incoming attacks: " + attacks.size() + " (" + fresh + " new, " + reminders + " reminders)");
    }

    /**
     * Tells when an attack that was in flight disappears well before its landing time, i.e. the
     * attacker called it off. One that is gone at or after its landing time simply landed, which is
     * not reported.
     */
    private void reportCalledOffAttacks(List<AttackAlerts.Alert> current) {
        long now = System.currentTimeMillis();
        Map<String, AttackOutcomes.Tracked> tracked =
                AttackOutcomes.fromJson(statePrefs().getString(KEY_TRACKED_ATTACKS, null));
        Set<String> currentKeys = new HashSet<String>();
        List<AttackOutcomes.Tracked> inFlight = new ArrayList<AttackOutcomes.Tracked>();
        for (AttackAlerts.Alert a : current) {
            currentKeys.add(a.key);
            inFlight.add(AttackOutcomes.Tracked.of(a));
        }
        int calledOff = 0;
        for (Map.Entry<String, AttackOutcomes.Tracked> entry : tracked.entrySet()) {
            AttackOutcomes.Tracked gone = entry.getValue();
            if (currentKeys.contains(entry.getKey()) || !AttackOutcomes.calledOff(gone, now)) {
                continue;
            }
            postNotification(NotificationKind.ATTACK_CALLED_OFF, AttackOutcomes.title(gone),
                    AttackOutcomes.text(gone), gone.key.hashCode() + 2, NotificationCompat.PRIORITY_HIGH);
            calledOff++;
        }
        statePrefs().edit().putString(KEY_TRACKED_ATTACKS, AttackOutcomes.toJson(inFlight)).apply();
        Log.i(TAG, "attacks in flight: " + inFlight.size() + " (" + calledOff + " called off)");
    }

    /**
     * Reports reinforcements and returning troops once they have arrived: remembers each one seen
     * in flight, and when one is no longer listed and its arrival time has passed, notifies.
     * One that vanishes well before arrival was recalled, so it stays silent.
     */
    private void reportArrivals(List<ArrivalAlerts.Arrival> current) {
        long now = System.currentTimeMillis();
        Map<String, ArrivalAlerts.Arrival> tracked = loadTrackedArrivals();
        Set<String> currentKeys = new HashSet<String>();
        for (ArrivalAlerts.Arrival a : current) {
            currentKeys.add(a.key);
            noteFinish(NotificationKind.forArrivalKey(a.key), "arrival " + a.key, a.arrivalMs);
        }
        int notified = 0;
        for (Map.Entry<String, ArrivalAlerts.Arrival> entry : tracked.entrySet()) {
            if (currentKeys.contains(entry.getKey())) {
                continue;
            }
            ArrivalAlerts.Arrival gone = entry.getValue();
            if (now < gone.arrivalMs - EARLY_TOLERANCE_MS) {
                Log.i(TAG, "movement " + entry.getKey() + " vanished before it arrived (recalled?), not notifying");
                continue;
            }
            postNotification(NotificationKind.forArrivalKey(gone.key), "Travian: Legends", gone.text,
                    gone.key.hashCode(), NotificationCompat.PRIORITY_HIGH);
            notified++;
        }
        saveTrackedArrivals(current);
        Log.i(TAG, "friendly arrivals in flight: " + current.size() + " (" + notified + " arrived)");
    }

    /** Wake the chain at this attack moment (reminder or escape; kept on time, also in quiet hours). */
    private void noteWake(String label, long wakeMs) {
        if (wakeMs > System.currentTimeMillis()) {
            Log.i(TAG, label + " wake in " + ((wakeMs - System.currentTimeMillis()) / 1000) + "s");
            attackWakeMs = Math.min(attackWakeMs, wakeMs);
        }
    }

    /** Forget entries whose time was over an hour ago, so the stored lists stay tiny. */
    private static void pruneOld(Map<String, Long> map, long now) {
        Iterator<Map.Entry<String, Long>> it = map.entrySet().iterator();
        while (it.hasNext()) {
            if (it.next().getValue() < now - TimeUnit.HOURS.toMillis(1)) {
                it.remove();
            }
        }
    }

    private Map<String, Long> loadLongMap(String prefKey) {
        Map<String, Long> result = new HashMap<String, Long>();
        try {
            String json = statePrefs().getString(prefKey, null);
            if (json != null) {
                JSONObject root = new JSONObject(json);
                Iterator<String> keys = root.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    result.put(key, root.getLong(key));
                }
            }
        } catch (Exception e) {
            Log.w(TAG, "failed to load " + prefKey + ", starting fresh: " + e);
        }
        return result;
    }

    private void saveLongMap(String prefKey, Map<String, Long> map) {
        try {
            JSONObject root = new JSONObject();
            for (Map.Entry<String, Long> entry : map.entrySet()) {
                root.put(entry.getKey(), entry.getValue().longValue());
            }
            statePrefs().edit().putString(prefKey, root.toString()).apply();
        } catch (Exception e) {
            Log.w(TAG, "failed to save " + prefKey + ": " + e);
        }
    }

    private Map<String, ArrivalAlerts.Arrival> loadTrackedArrivals() {
        Map<String, ArrivalAlerts.Arrival> result = new HashMap<String, ArrivalAlerts.Arrival>();
        try {
            String json = statePrefs().getString(KEY_TRACKED_ARRIVALS, null);
            if (json != null) {
                JSONObject root = new JSONObject(json);
                Iterator<String> keys = root.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    JSONObject o = root.getJSONObject(key);
                    result.put(key, new ArrivalAlerts.Arrival(key, o.getLong("arrivalMs"), o.getString("text")));
                }
            }
        } catch (Exception e) {
            Log.w(TAG, "failed to load tracked arrivals, starting fresh: " + e);
        }
        return result;
    }

    private void saveTrackedArrivals(List<ArrivalAlerts.Arrival> current) {
        try {
            JSONObject root = new JSONObject();
            for (ArrivalAlerts.Arrival a : current) {
                JSONObject o = new JSONObject();
                o.put("arrivalMs", a.arrivalMs);
                o.put("text", a.text);
                root.put(a.key, o);
            }
            statePrefs().edit().putString(KEY_TRACKED_ARRIVALS, root.toString()).apply();
        } catch (Exception e) {
            Log.w(TAG, "failed to save tracked arrivals: " + e);
        }
    }

    private void collectQueue(JSONArray queue, String kind, String villageName, int vx, int vy,
                               Map<String, TrackedEvent> tracked, Map<String, TrackedEvent> stillActive,
                               Set<String> seenTraining) {
        if (queue == null) {
            return;
        }
        for (int j = 0; j < queue.length(); j++) {
            JSONObject ev = queue.optJSONObject(j);
            if (ev == null) {
                continue;
            }
            if (!seenTraining.add(ev.optLong("eventId") + ":" + villageName)) {
                continue; // already counted from this training's own building list
            }
            String id = kind + ":" + ev.optLong("eventId") + ":" + villageName;
            // keep the count as first observed -- unitsLeft counts down each poll
            TrackedEvent existing = tracked.get(id);
            int initialUnits = existing != null ? existing.initialUnitsLeft : ev.optInt("unitsLeft", 0);
            long finishMs = toMillis(ev.optLong("lastUnitReadyAt", 0));
            stillActive.put(id, new TrackedEvent(kind, villageName, vx, vy, -1, -1, initialUnits, finishMs));
            JSONObject unit = ev.optJSONObject("unit");
            Log.i(TAG, kind + " event " + id + " unit id=" + (unit != null ? unit.optInt("id", -1) : -1)
                    + " tribe=" + currentTribeId + " raw lastUnitReadyAt=" + ev.optLong("lastUnitReadyAt", 0));
            noteFinish(NotificationKind.forTrackedKind(kind), kind + " " + id, finishMs);
        }
    }

    private String describeCompletion(TrackedEvent ev) {
        String location = ev.villageName + " (" + ev.villageX + "|" + ev.villageY + ")";
        if ("build".equals(ev.kind)) {
            String name = GameData.buildingName(ev.buildingTypeId);
            String level = ev.aspiredLevel >= 0 ? " upgraded to level " + ev.aspiredLevel : " upgrade finished";
            return name + level + " — " + location;
        }
        String label = "train".equals(ev.kind) ? "Troop training"
                : "stable".equals(ev.kind) ? "Stable training"
                : "Barracks training";
        String count = ev.initialUnitsLeft > 0 ? " (" + ev.initialUnitsLeft + " units)" : "";
        return label + " finished" + count + " — " + location;
    }

    // ------------------------------------------------------------------
    // tracked-event state, persisted across worker runs -- not sensitive,
    // just village names/building ids, no session or credentials involved
    // ------------------------------------------------------------------

    private static final class TrackedEvent {
        final String kind; // "build" | "train" | "stable" | "barracks"
        final String villageName;
        final int villageX;
        final int villageY;
        final int buildingTypeId; // -1 for troop-training events
        final int aspiredLevel; // -1 for troop-training events
        final int initialUnitsLeft; // 0 for build events
        final long finishMs; // server-reported finish time (epoch ms), 0 if unknown

        TrackedEvent(String kind, String villageName, int villageX, int villageY,
                     int buildingTypeId, int aspiredLevel, int initialUnitsLeft, long finishMs) {
            this.kind = kind;
            this.villageName = villageName;
            this.villageX = villageX;
            this.villageY = villageY;
            this.buildingTypeId = buildingTypeId;
            this.aspiredLevel = aspiredLevel;
            this.initialUnitsLeft = initialUnitsLeft;
            this.finishMs = finishMs;
        }

        JSONObject toJson() throws Exception {
            JSONObject o = new JSONObject();
            o.put("kind", kind);
            o.put("villageName", villageName);
            o.put("villageX", villageX);
            o.put("villageY", villageY);
            o.put("buildingTypeId", buildingTypeId);
            o.put("aspiredLevel", aspiredLevel);
            o.put("initialUnitsLeft", initialUnitsLeft);
            o.put("finishMs", finishMs);
            return o;
        }

        static TrackedEvent fromJson(JSONObject o) throws Exception {
            return new TrackedEvent(
                    o.getString("kind"), o.getString("villageName"),
                    o.getInt("villageX"), o.getInt("villageY"),
                    o.getInt("buildingTypeId"), o.getInt("aspiredLevel"), o.getInt("initialUnitsLeft"),
                    o.optLong("finishMs", 0));
        }
    }

    private Map<String, TrackedEvent> loadTrackedState() {
        Map<String, TrackedEvent> result = new HashMap<String, TrackedEvent>();
        try {
            String json = statePrefs().getString(STATE_KEY, null);
            if (json == null) {
                return result;
            }
            JSONObject root = new JSONObject(json);
            Iterator<String> keys = root.keys();
            while (keys.hasNext()) {
                String id = keys.next();
                result.put(id, TrackedEvent.fromJson(root.getJSONObject(id)));
            }
        } catch (Exception e) {
            Log.w(TAG, "failed to load tracked state, starting fresh: " + e);
        }
        return result;
    }

    private void saveTrackedState(Map<String, TrackedEvent> state) {
        try {
            JSONObject root = new JSONObject();
            for (Map.Entry<String, TrackedEvent> entry : state.entrySet()) {
                root.put(entry.getKey(), entry.getValue().toJson());
            }
            statePrefs().edit().putString(STATE_KEY, root.toString()).apply();
        } catch (Exception e) {
            Log.w(TAG, "failed to save tracked state: " + e);
        }
    }

    /** Computes and stores which villages have nothing in stillActive, for the Alerts screen. */
    private void saveIdleVillages(JSONArray villages, java.util.Collection<TrackedEvent> active) {
        Set<String> busyKeys = new HashSet<String>();
        for (TrackedEvent ev : active) {
            busyKeys.add(IdleVillages.key(ev.villageName, ev.villageX, ev.villageY));
        }
        List<String> idle = IdleVillages.compute(villages, busyKeys);
        statePrefs().edit().putString(KEY_IDLE_VILLAGES, IdleVillages.toJson(idle)).apply();
    }

    private SharedPreferences statePrefs() {
        return getApplicationContext().getSharedPreferences(STATE_PREFS, Context.MODE_PRIVATE);
    }

    /** Stores the last poll's villages (id, name, x, y) so screens can key data per village by id. */
    private void saveVillageList(JSONArray villages) {
        statePrefs().edit().putString(KEY_VILLAGES, VillageList.toJson(VillageList.compute(villages))).apply();
    }

    /** Stores the last poll's real per-village resource stock/production for screens that need the raw numbers. */
    private void saveVillageResources(JSONArray villages) {
        statePrefs().edit().putString(KEY_VILLAGE_RESOURCES,
                VillageResources.toJson(VillageResources.compute(villages))).apply();
    }

    // ------------------------------------------------------------------
    // notification -- one-shot and dismissible, no ongoing/foreground notice
    // ------------------------------------------------------------------

    private void notify(NotificationKind kind, String text) {
        postNotification(kind, "Travian: Legends", text,
                (int) System.currentTimeMillis(), NotificationCompat.PRIORITY_HIGH);
    }

    /**
     * The one place every notification goes through: checks the user's switch for this type, records
     * it in the history (also when muted, so the screens can show and count what was skipped), and adds
     * the tap-to-open-the-game action plus a shortcut to the Notifications screen. A switched-off type is
     * still tracked (the caller has already advanced its state); only the display is skipped, so
     * switching it back on never dumps old alerts.
     */
    private void postNotification(NotificationKind kind, String title, String text, int id, int priority) {
        Context ctx = getApplicationContext();
        // Recorded first, so the 24 h counts include events Android would have blocked too.
        boolean muted = !NotifierSettings.isEnabled(ctx, kind);
        recordHistory(kind, title, text, muted);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            int granted = ctx.checkSelfPermission("android.permission.POST_NOTIFICATIONS");
            if (granted != PackageManager.PERMISSION_GRANTED) {
                Log.w(TAG, "POST_NOTIFICATIONS not granted, skipping notification: " + text);
                return;
            }
        }
        if (muted) {
            Log.i(TAG, "muted (" + kind.id + "), not notifying: " + text);
            return;
        }
        NotificationManager nm = (NotificationManager) ctx.getSystemService(Context.NOTIFICATION_SERVICE);
        NotificationCompat.Builder builder = new NotificationCompat.Builder(
                ctx, kind.attackChannel ? ATTACK_CHANNEL_ID : CHANNEL_ID)
                .setContentTitle(title)
                .setContentText(text)
                .setStyle(new NotificationCompat.BigTextStyle().bigText(text))
                .setSmallIcon(android.R.drawable.ic_popup_reminder)
                .setPriority(priority)
                .setAutoCancel(true);
        Intent openGame = GameLauncher.launchIntent(ctx);
        if (openGame != null) {
            builder.setContentIntent(PendingIntent.getActivity(ctx, 0, openGame, PENDING_FLAGS));
        }
        Intent openSettings = new Intent(ctx, NotificationSettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        builder.addAction(0, "Alert settings", PendingIntent.getActivity(ctx, 1, openSettings, PENDING_FLAGS));
        nm.notify(id, builder.build());
        Log.i(TAG, "notified: " + title + " " + text);
    }

    private void recordHistory(NotificationKind kind, String title, String text, boolean muted) {
        SharedPreferences prefs = statePrefs();
        String updated = NotificationHistory.add(prefs.getString(KEY_HISTORY, null),
                new NotificationHistory.Entry(System.currentTimeMillis(), kind.id, title, text, muted));
        prefs.edit().putString(KEY_HISTORY, updated).apply();
    }
}
