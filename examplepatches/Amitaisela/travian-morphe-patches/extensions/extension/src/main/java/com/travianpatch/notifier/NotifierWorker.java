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
    private static final String KEY_CP_LOGGED_AT = "cp_logged_at";
    private static final String KEY_BUILD_COST_LOGGED_AT = "build_cost_logged_at";
    private static final String KEY_MARKET_LOGGED_AT = "market_logged_at";
    private static final int PENDING_FLAGS = PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT;
    private static final String KEY_RETRIES = "retries";
    /** Wait a few seconds past the finish time so the server has processed the completion. */
    private static final long SETTLE_BUFFER_MS = 3_000L;
    /** A finish time that passed this recently but is still listed means the server is lagging: recheck. */
    private static final long LAG_WINDOW_MS = 60_000L;
    private static final long LAG_RETRY_MS = 20_000L;
    private static final int MAX_LAG_RETRIES = 5;
    private static final long MAX_SCHEDULE_AHEAD_MS = TimeUnit.DAYS.toMillis(2);
    /** Regular re-check interval, used when nothing is due sooner (catches builds started elsewhere). */
    private static final long POLL_INTERVAL_MS = TimeUnit.MINUTES.toMillis(5);
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
    private static final String KEY_FARM_LOGGED_AT = "farm_logged_at";
    /** If the game rejects the movements part of the poll query, skip it until this time (epoch ms). */
    private static final String KEY_MOVEMENTS_OFF_UNTIL = "movements_off_until";
    private static final String ATTACK_CHANNEL_ID = NotifierBootstrap.ATTACK_CHANNEL_ID;
    /** An event that disappears earlier than this before its finish time was cancelled or sped up. */
    private static final long EARLY_TOLERANCE_MS = 30_000L;

    // earliest upcoming finish seen during this run (epoch ms), and whether a just-passed one is still listed
    private long nextWakeMs = Long.MAX_VALUE;
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

    private Result runCheck() {
        try {
            Log.i(TAG, "check started");
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

            // Fast path: reuse the world token cached from the last full sign-in (one request per
            // check). Only when it's missing, expired or rejected do we redo the full sign-in.
            SimpleCookieJar jar = new SimpleCookieJar();
            OkHttpClient http = TravianApi.newClient(jar);
            String gameworldHost = seedCachedWorldToken(jar);
            if (gameworldHost != null) {
                try {
                    poll(http, gameworldHost);
                    scheduleNextCheck();
                    return Result.success();
                } catch (AuthExpiredException e) {
                    Log.i(TAG, "cached world token was rejected, signing in again");
                    clearCachedWorldToken();
                    jar = new SimpleCookieJar();
                    http = TravianApi.newClient(jar);
                }
            }

            gameworldHost = resumeSession(http, jar, sessionCookie);
            if (gameworldHost == null) {
                statusNote = "The game's login was not accepted, will try again";
                scheduleNextCheck(); // the game's session wasn't usable right now; try again later
                return Result.success();
            }
            cacheWorldToken(jar, gameworldHost);

            poll(http, gameworldHost);
            scheduleNextCheck();
            return Result.success();
        } catch (Exception e) {
            Log.w(TAG, "notifier check failed, will retry: " + e);
            saveStatus("Last check failed, will retry");
            return Result.retry();
        }
    }

    // ------------------------------------------------------------------
    // scheduling the next precise check
    // ------------------------------------------------------------------

    private void scheduleNextCheck() {
        long now = System.currentTimeMillis();
        int retries = getInputData().getInt(KEY_RETRIES, 0);
        long delayMs;
        int nextRetries = 0;
        if (lagging && retries < MAX_LAG_RETRIES) {
            delayMs = LAG_RETRY_MS;
            nextRetries = retries + 1;
        } else {
            // Wake at the earliest known finish time, but never wait longer than the regular
            // interval: that's how a build started elsewhere (e.g. on a PC) gets noticed.
            long untilFinishMs = (nextWakeMs != Long.MAX_VALUE && nextWakeMs - now <= MAX_SCHEDULE_AHEAD_MS)
                    ? Math.max(nextWakeMs - now, 0L) + SETTLE_BUFFER_MS
                    : Long.MAX_VALUE;
            delayMs = Math.min(untilFinishMs, POLL_INTERVAL_MS);
        }

        OneTimeWorkRequest request = new OneTimeWorkRequest.Builder(NotifierWorker.class)
                .setInitialDelay(delayMs, TimeUnit.MILLISECONDS)
                .setConstraints(new Constraints.Builder().setRequiredNetworkType(NetworkType.CONNECTED).build())
                .setInputData(new Data.Builder().putInt(KEY_RETRIES, nextRetries).build())
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
    }

    /** Records a finish time from the server: schedules around it, or flags server lag if it just passed. */
    private void noteFinish(String label, long finishMs) {
        if (finishMs <= 0) {
            return;
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

    private void cacheWorldToken(SimpleCookieJar jar, String host) {
        try {
            String token = jar.getCookieValue(TravianApi.hostOf(host), "JWT");
            long expMs = token != null ? jwtExpiryMs(token) : 0;
            if (token == null || expMs <= System.currentTimeMillis()) {
                return; // can't tell how long it's good for, so don't reuse it
            }
            statePrefs().edit()
                    .putString(KEY_WORLD_HOST, host)
                    .putString(KEY_WORLD_TOKEN, token)
                    .putLong(KEY_WORLD_TOKEN_EXP, expMs)
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

        String avatarsQuery = "{ \"query\": \"query { a: avatars(wuid: null, context: null) "
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
        JSONArray avatars = data.getJSONArray("a");
        if (avatars.length() == 0) {
            return null;
        }
        JSONObject avatar = avatars.getJSONObject(0);
        String avatarUuid = avatar.getString("uuid");
        String worldUrl = avatar.getJSONObject("gameworld").getJSONObject("metadata").getString("url");
        String worldHost = worldUrl.endsWith("/") ? worldUrl.substring(0, worldUrl.length() - 1) : worldUrl;

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
        return "{ \"query\": \"query { p: ownPlayer { villages { id name x y tribeId "
                + "buildEvents { id buildingTypeId aspiredLevel timestamp status isActive } "
                + "trainingTroops { eventId unit { id } unitsLeft nextUnitReadyAt lastUnitReadyAt } "
                + "stable { trainingUnits { eventId unit { id } unitsLeft nextUnitReadyAt lastUnitReadyAt } } "
                + "barracks { trainingUnits { eventId unit { id } unitsLeft nextUnitReadyAt lastUnitReadyAt } } "
                + (withMovements ? AttackAlerts.MOVEMENTS_SELECTION + " " : "")
                + "} } }\" }";
    }

    private JSONObject runPollQuery(OkHttpClient http, String gameworldHost, boolean withMovements) throws Exception {
        Request req = new Request.Builder()
                .url(gameworldHost + "/api/v1/graphql")
                .post(TravianApi.jsonBody(pollQuery(withMovements)))
                .build();
        return TravianApi.executeJson(http, req);
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
            throw new AuthExpiredException("no data in poll response: " + errorSummary(resp));
        }
        JSONObject player = data.getJSONObject("p");
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
                        noteFinish("build " + id, finishMs);
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

        checkExtras(http, gameworldHost);
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
    }

    private void refreshBuildingRules(OkHttpClient http, String gameworldHost) {
        SharedPreferences rulesPrefs = getApplicationContext().getSharedPreferences(BuildingRules.PREFS, Context.MODE_PRIVATE);
        boolean haveRules = BuildingRules.cacheUsable(rulesPrefs.getString(BuildingRules.KEY_JSON, null),
                rulesPrefs.getString(BuildingRules.KEY_QUERY, null));
        long now = System.currentTimeMillis();
        if (haveRules && now - statePrefs().getLong(KEY_RULES_CHECKED_AT, 0) < TimeUnit.MINUTES.toMillis(30)) {
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
     * One-off, read-only diagnostic for the next features (troops, farm lists, crop finder, Gold status):
     * runs the queries in DataProbe once per install after a poll has seen a village and logs every raw
     * response. Nothing is shown on any screen and nothing is changed in the game.
     */
    private void runDataProbe(OkHttpClient http, String gameworldHost) {
        SharedPreferences prefs = statePrefs();
        List<VillageList.Entry> known = VillageList.fromJson(prefs.getString(KEY_VILLAGES, null));
        if (!DataProbe.shouldRun(prefs.getBoolean(DataProbe.KEY_DONE, false), known.size())) {
            return;
        }
        prefs.edit().putBoolean(DataProbe.KEY_DONE, true).apply();
        VillageList.Entry village = known.get(0);
        List<String> queries = new ArrayList<String>(DataProbe.queries(village.id, village.x, village.y));
        for (int n = 1; n <= queries.size(); n++) {
            String query = queries.get(n - 1);
            Log.i(TAG, "DPROBE " + n + " query: " + query);
            try {
                JSONObject response = runRootQuery(http, gameworldHost, query);
                logProbePieces(n, response.toString());
                JSONObject player = dataObject(response, "ownPlayer");
                JSONArray lists = player == null ? null : player.optJSONArray("farmLists");
                if (lists != null && lists.length() > 0 && lists.optJSONObject(0) != null) {
                    queries.add(DataProbe.farmSlotsQuery(lists.optJSONObject(0).optLong("id")));
                }
            } catch (Exception e) {
                Log.i(TAG, "DPROBE " + n + " failed: " + e);
            }
        }
        Log.i(TAG, "DPROBE finished");
    }

    private void logProbePieces(int n, String response) {
        Log.i(TAG, "DPROBE " + n + " response length: " + response.length());
        List<String> pieces = DataProbe.split(cut(response, DataProbe.MAX_LOGGED_CHARS), DataProbe.LOG_PIECE);
        for (int k = 0; k < pieces.size(); k++) {
            Log.i(TAG, "DPROBE " + n + " part " + (k + 1) + "/" + pieces.size() + ": " + pieces.get(k));
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
        AutomationSettings.Config cfg = AutomationSettings.fromJson(
                ctx.getSharedPreferences(AutomationSettings.PREFS, Context.MODE_PRIVATE)
                        .getString(AutomationSettings.KEY, null));
        List<VillageResources.Entry> stocks = VillageResources.fromJson(state.getString(KEY_VILLAGE_RESOURCES, null));
        long now = System.currentTimeMillis();
        java.util.Calendar midnight = java.util.Calendar.getInstance();
        midnight.set(java.util.Calendar.HOUR_OF_DAY, 0);
        midnight.set(java.util.Calendar.MINUTE, 0);
        midnight.set(java.util.Calendar.SECOND, 0);
        midnight.set(java.util.Calendar.MILLISECOND, 0);
        boolean quiet = QuietHours.isQuiet(cfg.quietHours, now, midnight.getTimeInMillis());
        for (PlayerBuildings.Village village : player.villages) {
            if (!orders.getBoolean(BuildOrderActivity.autoKey(village.id), false)) {
                continue;
            }
            String idleKey = "idle_since_" + village.id;
            long idleSince = orders.getLong(idleKey, 0);
            if (!village.pending.isEmpty()) {
                orders.edit().remove(idleKey).apply();
            } else if (idleSince == 0) {
                idleSince = now;
                orders.edit().putLong(idleKey, now).apply();
            }
            List<BuildOrderStore.Entry> queue = BuildOrderStore.fromJson(
                    orders.getString(BuildOrderStore.key(village.id), null));
            BuildQueueStep.Outcome out = BuildQueueStep.next(rules, player.tribeId, village,
                    VillageResources.find(stocks, village.id), queue, cfg, quiet, now, idleSince);
            String notes = android.text.TextUtils.join("; ", out.notes);
            orders.edit().putString(BuildOrderStore.key(village.id), BuildOrderStore.toJson(out.queue))
                    .putString(BuildOrderActivity.notesKey(village.id),
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
                orders.edit().putString(BuildOrderActivity.notesKey(village.id), label + ": the game refused it, trying "
                        + "again at " + java.text.DateFormat.getTimeInstance(java.text.DateFormat.SHORT)
                        .format(new java.util.Date(until))).apply();
                continue;
            }
            try {
                ActionClient.Result r = ActionSender.send(ctx, http, gameworldHost,
                        GameActions.build(village.id, out.fire.slotId, out.fire.typeId, label), true);
                Log.i(TAG, "build queue " + village.id + ": " + label + " -> " + r.outcome);
                if (r.sessionExpired) {
                    clearCachedWorldToken();
                } else if ("FAILED".equals(r.outcome)) {
                    orders.edit().putInt(failKey, failures + 1)
                            .putLong(failKey + "_until", now + Backoff.delayMs(failures + 1))
                            .putString(BuildOrderActivity.notesKey(village.id), label + ": the game said no ("
                                    + r.describe() + ")").apply();
                } else if ("SENT".equals(r.outcome)) {
                    orders.edit().remove(failKey).remove(failKey + "_until").apply();
                }
            } catch (Exception e) {
                Log.w(TAG, "build queue send failed: " + e);
            }
        }
    }

    private void checkExtras(OkHttpClient http, String gameworldHost) {
        try {
            runDataProbe(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "data probe failed: " + e);
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
            logFarmLists(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "farm list log failed: " + e);
        }
        try {
            checkAccountTier(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "gold club check failed: " + e);
        }
        try {
            logCulturePointsAndSettlement(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "culture points log failed: " + e);
        }
        try {
            logBuildingCosts(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "building cost log failed: " + e);
        }
        try {
            logMarketplace(http, gameworldHost);
        } catch (Exception e) {
            Log.w(TAG, "marketplace log failed: " + e);
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
        if (now - prefs.getLong(KEY_GOLD_CLUB_LOGGED_AT, 0) < TimeUnit.MINUTES.toMillis(30)) {
            return;
        }
        prefs.edit().putLong(KEY_GOLD_CLUB_LOGGED_AT, now).apply();
        JSONObject resp = runQuery(http, gameworldHost, "goldClub");
        JSONObject data = resp.optJSONObject("data");
        if (data == null) {
            Log.i(TAG, "gold club query failed: " + errorSummary(resp));
            return;
        }
        Object raw = data.getJSONObject("p").opt("goldClub");
        Log.i(TAG, "gold club raw: " + raw);
        if (raw instanceof Boolean) {
            prefs.edit().putString(KEY_GOLD_CLUB, String.valueOf(raw)).apply();
        } else {
            Log.w(TAG, "goldClub wasn't a plain true/false, leaving it unknown: " + raw);
        }
    }

    /**
     * Diagnostic only, at most every 30 minutes: logs whatever the game returns for culture points and
     * the next settlement slot, trying a few field-name guesses from the compiled client's own field
     * names (culturePoints, nextSlotPrediction, villageSlotCount, ...). Nothing is shown on any screen
     * yet — this is how the hero and storage fields were learned too, before those screens were built.
     */
    private void logCulturePointsAndSettlement(OkHttpClient http, String gameworldHost) {
        SharedPreferences prefs = statePrefs();
        long now = System.currentTimeMillis();
        if (now - prefs.getLong(KEY_CP_LOGGED_AT, 0) < TimeUnit.MINUTES.toMillis(30)) {
            return;
        }
        prefs.edit().putLong(KEY_CP_LOGGED_AT, now).apply();
        String[] variants = {
                "culturePoints nextSlotAvailableAt nextSlotPrediction villageSlotCount",
                "culturePoints",
                "culturePointsRank nextSlotPrediction",
                "villages { id name culturePointsDistributionPerDay }",
        };
        runDiagnosticVariants("culture points", http, gameworldHost, variants);
        logSchema(http, gameworldHost, "Player", "fields");
    }

    /**
     * Diagnostic only, at most every 30 minutes: logs the game's own upgrade-cost fields for a building,
     * so a "smart queue" advisor can be built on the game's real costs instead of a guessed formula.
     * Nothing is shown on any screen yet.
     *
     * Unlike runDiagnosticVariants (used elsewhere in this file), this tries every variant every time
     * and never stops early on a "clean" response: a real response was seen where the top-level query
     * succeeded with no GraphQL errors at all, yet the requested nested field (buildingSlots) was simply
     * missing from the returned object. So "no errors" does not mean "the field I asked for came back" on
     * this server for a nested selection - each variant below asks for exactly one field at a time so a
     * silently-dropped nested selection can be pinned to the single field that caused it.
     */
    private void logBuildingCosts(OkHttpClient http, String gameworldHost) {
        SharedPreferences prefs = statePrefs();
        long now = System.currentTimeMillis();
        if (now - prefs.getLong(KEY_BUILD_COST_LOGGED_AT, 0) < TimeUnit.MINUTES.toMillis(30)) {
            return;
        }
        prefs.edit().putLong(KEY_BUILD_COST_LOGGED_AT, now).apply();
        String[] variants = {
                "villages { id name buildingSlots { id } }",
                "villages { id name buildEvents { id buildingTypeId aspiredLevel buildCostObject } }",
                "villages { id name buildEvents { id buildingTypeId aspiredLevel upgradeCostObject } }",
        };
        for (String selection : variants) {
            try {
                JSONObject resp = runQuery(http, gameworldHost, selection);
                JSONObject data = resp.optJSONObject("data");
                JSONArray errors = resp.optJSONArray("errors");
                if (data != null) {
                    Log.i(TAG, "building costs ok [" + selection + "]: " + cut(data.toString(), 2500));
                }
                if (errors != null) {
                    Log.i(TAG, "building costs errors [" + selection + "]: " + cut(errors.toString(), 1500));
                }
                if (data == null && errors == null) {
                    Log.i(TAG, "building costs empty response [" + selection + "]");
                }
            } catch (Exception e) {
                Log.i(TAG, "building costs request failed [" + selection + "]: " + e);
            }
        }
    }

    /**
     * Diagnostic only, at most every 30 minutes: logs the game's marketplace offer shape, so a market
     * price advisor can be built on real field names. Nothing is shown on any screen yet.
     */
    private void logMarketplace(OkHttpClient http, String gameworldHost) {
        SharedPreferences prefs = statePrefs();
        long now = System.currentTimeMillis();
        if (now - prefs.getLong(KEY_MARKET_LOGGED_AT, 0) < TimeUnit.MINUTES.toMillis(30)) {
            return;
        }
        prefs.edit().putLong(KEY_MARKET_LOGGED_AT, now).apply();
        String[] variants = {
                "marketplaceOwnOffer { id resourcePricesById }",
                "marketplaceOffer { id resourcePricesById }",
        };
        runDiagnosticVariants("marketplace", http, gameworldHost, variants);
        logSchema(http, gameworldHost, "MarketplaceOffer", "fields");
    }

    /**
     * Tries each selection in turn, logging both the data and, when present, the errors a GraphQL
     * response can carry alongside it (a query can partially succeed: valid fields resolve while an
     * invalid one next to them is reported as an error, instead of failing the whole request). Stops at
     * the first variant that comes back with data and no errors; otherwise tries them all.
     */
    private void runDiagnosticVariants(String label, OkHttpClient http, String gameworldHost, String[] variants) {
        for (String selection : variants) {
            try {
                JSONObject resp = runQuery(http, gameworldHost, selection);
                JSONObject data = resp.optJSONObject("data");
                JSONArray errors = resp.optJSONArray("errors");
                if (data != null) {
                    Log.i(TAG, label + " ok [" + selection + "]: " + cut(data.toString(), 2500));
                }
                if (errors != null) {
                    Log.i(TAG, label + " errors [" + selection + "]: " + cut(errors.toString(), 1500));
                }
                if (data == null && errors == null) {
                    Log.i(TAG, label + " empty response [" + selection + "]");
                }
                if (data != null && errors == null) {
                    return; // clean success, no need to try the other guesses
                }
            } catch (Exception e) {
                Log.i(TAG, label + " request failed [" + selection + "]: " + e);
            }
        }
    }

    private JSONObject runQuery(OkHttpClient http, String gameworldHost, String selection) throws Exception {
        String body = "{ \"query\": \"query { p: ownPlayer { " + selection + " } }\" }";
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
        JSONArray villages = data.getJSONObject("p").getJSONArray("villages");
        saveVillageResources(villages);
        Set<String> alerted = new HashSet<String>(statePrefs().getStringSet(KEY_STORAGE_ALERTED, new HashSet<String>()));
        int warned = 0;
        for (int i = 0; i < villages.length(); i++) {
            JSONObject village = villages.getJSONObject(i);
            List<ResourceAlerts.Reading> fresh = new ArrayList<ResourceAlerts.Reading>();
            for (ResourceAlerts.Reading r : ResourceAlerts.read(village)) {
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
        statePrefs().edit().putStringSet(KEY_STORAGE_ALERTED, alerted).apply();
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
        JSONObject hero = data.getJSONObject("p").optJSONObject("hero");
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

    /**
     * Diagnostic only, at most every 30 minutes: writes the player's farm lists, and the field names the
     * game's server knows for them, to the log. It sends nothing to the game and shows nothing. It exists
     * so a farm list screen can be built on what the game really returns instead of on guesses.
     */
    private void logFarmLists(OkHttpClient http, String gameworldHost) {
        SharedPreferences prefs = statePrefs();
        long now = System.currentTimeMillis();
        if (now - prefs.getLong(KEY_FARM_LOGGED_AT, 0) < TimeUnit.MINUTES.toMillis(30)) {
            return;
        }
        prefs.edit().putLong(KEY_FARM_LOGGED_AT, now).apply();
        String fields = "id name slotsAmount runningRaidsAmount lastStartedTime isExpanded";
        String[] variants = {
                "farmLists { " + fields + " }",
                "farmLists(filter: {}) { " + fields + " }",
                "farmLists { id name }",
        };
        for (String selection : variants) {
            try {
                JSONObject resp = runQuery(http, gameworldHost, selection);
                JSONObject data = resp.optJSONObject("data");
                if (data != null) {
                    Log.i(TAG, "farm lists ok [" + selection + "]: " + cut(data.toString(), 3500));
                    break;
                }
                Log.i(TAG, "farm lists query failed [" + selection + "]: " + errorSummary(resp));
            } catch (Exception e) {
                Log.i(TAG, "farm lists request failed [" + selection + "]: " + e);
            }
        }
        logSchema(http, gameworldHost, "FarmList", "fields");
        logSchema(http, gameworldHost, "FarmListsFilter", "inputFields");
        logSchema(http, gameworldHost, "FarmSlot", "fields");
    }

    /** Logs the names of a GraphQL type's fields, if the server answers introspection questions. */
    private void logSchema(OkHttpClient http, String gameworldHost, String type, String listField) {
        try {
            String body = "{ \"query\": \"query { __type(name: \\\"" + type + "\\\") { " + listField + " { name } } }\" }";
            Request req = new Request.Builder()
                    .url(gameworldHost + "/api/v1/graphql")
                    .post(TravianApi.jsonBody(body))
                    .build();
            Log.i(TAG, "schema " + type + ": " + cut(TravianApi.executeJson(http, req).toString(), 1500));
        } catch (Exception e) {
            Log.i(TAG, "schema " + type + " not available: " + e);
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
            } else {
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
            noteFinish("arrival " + a.key, a.arrivalMs);
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

    /** Wake the chain at this time (if it's still ahead), without treating it as a finish time. */
    private void noteWake(String label, long wakeMs) {
        if (wakeMs > System.currentTimeMillis()) {
            Log.i(TAG, label + " wake in " + ((wakeMs - System.currentTimeMillis()) / 1000) + "s");
            nextWakeMs = Math.min(nextWakeMs, wakeMs);
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
            noteFinish(kind + " " + id, finishMs);
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
