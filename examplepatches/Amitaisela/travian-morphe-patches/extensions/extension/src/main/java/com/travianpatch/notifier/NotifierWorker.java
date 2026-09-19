package com.travianpatch.notifier;

import android.app.NotificationManager;
import android.content.Context;
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
    private static final String STATE_PREFS = "travian_notifier_state";
    private static final String STATE_KEY = "tracked_events";
    private static final long SESSION_SEED_TTL_MS = TimeUnit.DAYS.toMillis(3650);

    static final String NEXT_WORK_NAME = "travian-notifier-next";
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
    private static final String KEY_WORLD_HOST = "world_host";
    private static final String KEY_WORLD_TOKEN = "world_token";
    private static final String KEY_WORLD_TOKEN_EXP = "world_token_exp";
    private static final String KEY_ANNOUNCED_ATTACKS = "announced_attacks";
    private static final String KEY_REMINDED_ATTACKS = "reminded_attacks";
    private static final String KEY_TRACKED_ARRIVALS = "tracked_arrivals";
    /** If the game rejects the movements part of the poll query, skip it until this time (epoch ms). */
    private static final String KEY_MOVEMENTS_OFF_UNTIL = "movements_off_until";
    private static final String ATTACK_CHANNEL_ID = NotifierBootstrap.ATTACK_CHANNEL_ID;
    /** An event that disappears earlier than this before its finish time was cancelled or sped up. */
    private static final long EARLY_TOLERANCE_MS = 30_000L;

    // earliest upcoming finish seen during this run (epoch ms), and whether a just-passed one is still listed
    private long nextWakeMs = Long.MAX_VALUE;
    private boolean lagging = false;
    private int currentTribeId = -1; // tribe of the village being read, for logging trained unit ids

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
                scheduleNextCheck(); // the game's session wasn't usable right now; try again later
                return Result.success();
            }
            cacheWorldToken(jar, gameworldHost);

            poll(http, gameworldHost);
            scheduleNextCheck();
            return Result.success();
        } catch (Exception e) {
            Log.w(TAG, "notifier check failed, will retry: " + e);
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
        SharedPreferences prefs = statePrefs();
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

        for (int i = 0; i < villages.length(); i++) {
            JSONObject village = villages.getJSONObject(i);
            String villageName = village.optString("name", "your village");
            int vx = village.optInt("x", 0);
            int vy = village.optInt("y", 0);
            currentTribeId = village.optInt("tribeId", -1);
            if (withMovements) {
                attacks.addAll(AttackAlerts.parse(village, System.currentTimeMillis()));
                arrivals.addAll(ArrivalAlerts.parse(village, System.currentTimeMillis()));
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
            notify(describeCompletion(gone));
        }
        saveTrackedState(stillActive);
        if (withMovements) {
            announceAttacks(attacks);
            reportArrivals(arrivals);
        }

        Log.i(TAG, "poll ok: villages=" + villages.length() + " active=" + stillActive.size());
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
                postNotification(ATTACK_CHANNEL_ID, AttackAlerts.title(alert), AttackAlerts.describe(alert, now),
                        alert.key.hashCode(), NotificationCompat.PRIORITY_MAX);
                announced.put(alert.key, alert.arrivalMs);
                fresh++;
            }
            if (reminded.containsKey(alert.key)) {
                continue;
            }
            if (AttackAlerts.reminderDue(alert, now)) {
                postNotification(ATTACK_CHANNEL_ID, AttackAlerts.reminderTitle(alert),
                        AttackAlerts.reminderText(alert, now), alert.key.hashCode() + 1, NotificationCompat.PRIORITY_MAX);
                reminded.put(alert.key, alert.arrivalMs);
                reminders++;
            } else {
                noteWake("attack reminder " + alert.key, alert.arrivalMs - AttackAlerts.REMINDER_WAKE_BEFORE_MS);
            }
        }
        pruneOld(announced, now);
        pruneOld(reminded, now);
        saveLongMap(KEY_ANNOUNCED_ATTACKS, announced);
        saveLongMap(KEY_REMINDED_ATTACKS, reminded);
        Log.i(TAG, "incoming attacks: " + attacks.size() + " (" + fresh + " new, " + reminders + " reminders)");
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
            postNotification(CHANNEL_ID, "Travian: Legends", gone.text, gone.key.hashCode(), NotificationCompat.PRIORITY_HIGH);
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

    private SharedPreferences statePrefs() {
        return getApplicationContext().getSharedPreferences(STATE_PREFS, Context.MODE_PRIVATE);
    }

    // ------------------------------------------------------------------
    // notification -- one-shot and dismissible, no ongoing/foreground notice
    // ------------------------------------------------------------------

    private void notify(String text) {
        postNotification(CHANNEL_ID, "Travian: Legends", text,
                (int) System.currentTimeMillis(), NotificationCompat.PRIORITY_HIGH);
    }

    private void postNotification(String channelId, String title, String text, int id, int priority) {
        Context ctx = getApplicationContext();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            int granted = ctx.checkSelfPermission("android.permission.POST_NOTIFICATIONS");
            if (granted != PackageManager.PERMISSION_GRANTED) {
                Log.w(TAG, "POST_NOTIFICATIONS not granted, skipping notification: " + text);
                return;
            }
        }
        NotificationManager nm = (NotificationManager) ctx.getSystemService(Context.NOTIFICATION_SERVICE);
        NotificationCompat.Builder builder = new NotificationCompat.Builder(ctx, channelId)
                .setContentTitle(title)
                .setContentText(text)
                .setStyle(new NotificationCompat.BigTextStyle().bigText(text))
                .setSmallIcon(android.R.drawable.ic_popup_reminder)
                .setPriority(priority)
                .setAutoCancel(true);
        nm.notify(id, builder.build());
        Log.i(TAG, "notified: " + title + " " + text);
    }
}
