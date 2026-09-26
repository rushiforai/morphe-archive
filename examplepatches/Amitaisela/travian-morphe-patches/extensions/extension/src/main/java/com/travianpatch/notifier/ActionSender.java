package com.travianpatch.notifier;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 * The Android side of ActionClient: the real connection to the game world (the worker's session, or the
 * session the worker cached for screens), the user's switches, the dedupe memory and the action log.
 * Must be called off the main thread.
 */
final class ActionSender {

    private static final String TAG = "TravianNotifier";
    static final String PREFS = ActionLog.PREFS;
    static final String KEY_MASTER = "master_on";
    static final String KEY_DRY_RUN = "dry_run";
    static final String KEY_PAUSE_MIN = "attack_pause_minutes";
    private static final String KEY_RECENT = "recent_keys";

    private ActionSender() {
    }

    static ActionClient.Settings settings(Context ctx) {
        SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        return new ActionClient.Settings(p.getBoolean(KEY_MASTER, ActionClient.DEFAULT_SETTINGS.masterOn),
                p.getBoolean(KEY_DRY_RUN, ActionClient.DEFAULT_SETTINGS.dryRun),
                p.getInt(KEY_PAUSE_MIN, ActionClient.DEFAULT_SETTINGS.attackPauseMinutes));
    }

    /** From a screen tap: uses the session the background check cached (about 2 hours). */
    static ActionClient.Result sendFromScreen(Context ctx, GameAction action) {
        SimpleCookieJar jar = new SimpleCookieJar();
        SharedPreferences state = ctx.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        String host = NotifierWorker.seedWorldToken(state, jar);
        if (host == null) {
            ActionClient.Result r = new ActionClient.Result("FAILED", 0,
                    "no game session yet: open the game, wait for the next check, then try again", true, null);
            record(ctx, action, r);
            return r;
        }
        return send(ctx, TravianApi.newClient(jar), host, action, false);
    }

    /** From the background worker, with its own signed-in client. */
    static ActionClient.Result send(Context ctx, final OkHttpClient http, final String host, GameAction action,
                                    boolean automated) {
        ActionClient.Transport transport = new ActionClient.Transport() {
            @Override
            public ActionClient.Response post(String path, String json) throws Exception {
                Request req = new Request.Builder()
                        .url(host + "/api/v1" + path)
                        .post(TravianApi.jsonBody(json))
                        .build();
                Response resp = http.newCall(req).execute();
                try {
                    return new ActionClient.Response(resp.code(), resp.body() == null ? "" : resp.body().string());
                } finally {
                    resp.close();
                }
            }
        };
        // One send at a time in this app (worker, screen taps, a second worker): the dedupe memory is read,
        // checked, marked and saved under this lock, so two overlapping sends can never both go out.
        synchronized (SEND_LOCK) {
            return sendLocked(ctx, transport, action, automated);
        }
    }

    private static final Object SEND_LOCK = new Object();

    private static ActionClient.Result sendLocked(Context ctx, ActionClient.Transport transport, GameAction action,
                                                  boolean automated) {
        SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        SharedPreferences state = ctx.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        Map<String, Long> recent = loadRecent(p.getString(KEY_RECENT, null));
        ActionClient.Settings settings = settings(ctx);
        long now = System.currentTimeMillis();
        long nextAttack = ActionClient.effectiveNextAttack(state.getLong(NotifierWorker.KEY_NEXT_ATTACK_AT, 0),
                state.getLong(NotifierWorker.KEY_ATTACKS_KNOWN_AT, 0), now);

        if ("BUILD".equals(action.kind) || "TRAIN".equals(action.kind)) {
            int villages = villageCount(state);
            if (villages < 1) {
                return finish(ctx, p, recent, now, action, new ActionClient.Result("REFUSED", 0,
                        "the village list isn't read yet", false, null));
            }
            if (villages > 1) {
                // Check the action itself first, so a refused action never moves the game's current village.
                ActionClient.Result pre = preflight(action, automated, settings, now, nextAttack, recent);
                if (pre != null) {
                    return finish(ctx, p, recent, now, action, pre);
                }
                ActionClient.Result switched;
                try {
                    switched = ActionClient.sendWith(transport, GameActions.changeVillage(action.villageId), automated,
                            settings, now, nextAttack, recent);
                } catch (Exception e) {
                    switched = new ActionClient.Result("FAILED", 0, "couldn't switch village (" + e + ")", false, null);
                }
                if (!"SENT".equals(switched.outcome) && !"DRY_RUN".equals(switched.outcome)) {
                    return finish(ctx, p, recent, now, action, new ActionClient.Result("REFUSED", 0,
                            "not sent: switching to the village failed (" + switched.describe() + ")", false, null));
                }
            }
        }
        ActionClient.Result result = ActionClient.sendWith(transport, action, automated, settings, now, nextAttack, recent);
        if (result.sessionExpired) {
            state.edit().remove(NotifierWorker.KEY_WORLD_HOST).remove(NotifierWorker.KEY_WORLD_TOKEN)
                    .remove(NotifierWorker.KEY_WORLD_TOKEN_EXP).commit();
        }
        Log.i(TAG, "action " + action.kind + " " + action.label + ": " + result.outcome
                + (result.httpCode > 0 ? " HTTP " + result.httpCode : "") + " " + result.describe());
        return finish(ctx, p, recent, now, action, result);
    }

    /** The guard's answer for the action without sending or marking anything; null when it may go. */
    private static ActionClient.Result preflight(GameAction action, boolean automated, ActionClient.Settings settings,
                                                 long now, long nextAttack, Map<String, Long> recent) {
        ActionGuard.Input in = new ActionGuard.Input();
        in.path = action.path;
        in.automated = automated;
        in.masterOn = settings.masterOn;
        in.dryRun = settings.dryRun;
        in.nowMs = now;
        in.nextAttackLandingMs = nextAttack;
        in.attackPauseMinutes = settings.attackPauseMinutes;
        in.dedupeKey = action.dedupeKey;
        in.recentKeys = recent;
        ActionGuard.Verdict v = ActionGuard.check(in);
        return v.allowed ? null : new ActionClient.Result("REFUSED", 0, v.reason, false, null);
    }

    private static ActionClient.Result finish(Context ctx, SharedPreferences p, Map<String, Long> recent, long now,
                                              GameAction action, ActionClient.Result r) {
        saveRecent(p, recent, now);
        record(ctx, action, r);
        return r;
    }

    /** How many villages the player has, from the game's own buildings data; 0 when not read yet. */
    private static int villageCount(SharedPreferences state) {
        PlayerBuildings player = PlayerBuildings.parse(state.getString(NotifierWorker.KEY_PLAYER_BUILDINGS, null));
        return player == null ? 0 : player.villages.size();
    }

    static void record(Context ctx, GameAction action, ActionClient.Result r) {
        SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String old = p.getString(ActionLog.KEY, null);
        long now = System.currentTimeMillis();
        if (!"SENT".equals(r.outcome) && !"FAILED".equals(r.outcome)
                && ActionLog.isRepeat(old, action.label, r.outcome, now, 30 * 60_000L)) {
            return; // the same practice/not-sent line every check would flood the log
        }
        String json = ActionLog.add(old, new ActionLog.Entry(now, action.kind, action.label, r.outcome, r.describe()),
                ActionLog.CAP);
        p.edit().putString(ActionLog.KEY, json).commit();
    }

    private static Map<String, Long> loadRecent(String json) {
        Map<String, Long> out = new HashMap<String, Long>();
        if (json == null) {
            return out;
        }
        try {
            JSONObject o = new JSONObject(json);
            Iterator<String> keys = o.keys();
            while (keys.hasNext()) {
                String k = keys.next();
                out.put(k, o.getLong(k));
            }
        } catch (Exception ignored) {
            // corrupt memory: start empty
        }
        return out;
    }

    private static void saveRecent(SharedPreferences p, Map<String, Long> recent, long now) {
        JSONObject o = new JSONObject();
        for (Map.Entry<String, Long> e : recent.entrySet()) {
            if (now - e.getValue() < ActionGuard.DEDUPE_MS * 10) {
                try {
                    o.put(e.getKey(), e.getValue().longValue());
                } catch (Exception ignored) {
                    // skip
                }
            }
        }
        p.edit().putString(KEY_RECENT, o.toString()).commit();
    }
}
