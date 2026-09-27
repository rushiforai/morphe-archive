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
    static final String KEY_PAUSE_ON = "attack_pause_on";
    static final String KEY_PAUSE_MIN = "attack_pause_minutes";
    private static final String KEY_RECENT = "recent_keys";

    private ActionSender() {
    }

    static ActionClient.Settings settings(Context ctx) {
        SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        AutomationSettings.Config timing = AutomationSettings.fromJson(ctx.getSharedPreferences(
                AutomationSettings.PREFS, Context.MODE_PRIVATE).getString(AutomationSettings.KEY, null));
        return new ActionClient.Settings(p.getBoolean(KEY_MASTER, ActionClient.DEFAULT_SETTINGS.masterOn),
                p.getBoolean(KEY_DRY_RUN, ActionClient.DEFAULT_SETTINGS.dryRun),
                p.getBoolean(KEY_PAUSE_ON, ActionClient.DEFAULT_SETTINGS.attackPauseOn),
                p.getInt(KEY_PAUSE_MIN, ActionClient.DEFAULT_SETTINGS.attackPauseMinutes),
                QuietHours.isQuietNow(timing.quietHours, System.currentTimeMillis()));
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

    /**
     * A read-only GraphQL query from a screen, with the session the background check cached. Returns the
     * game's JSON answer, or null when there is no session yet. Must be called off the main thread.
     */
    static JSONObject queryFromScreen(Context ctx, String query) throws Exception {
        if (!query.trim().startsWith("query")) {
            throw new IllegalArgumentException("only reads");
        }
        SimpleCookieJar jar = new SimpleCookieJar();
        SharedPreferences state = ctx.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        String host = NotifierWorker.seedWorldToken(state, jar);
        if (host == null) {
            return null;
        }
        Request req = new Request.Builder()
                .url(host + "/api/v1/graphql")
                .post(TravianApi.jsonBody(new JSONObject().put("query", query).toString()))
                .build();
        return TravianApi.executeJson(TravianApi.newClient(jar), req);
    }

    /** From the background worker, with its own signed-in client. */
    static ActionClient.Result send(Context ctx, final OkHttpClient http, final String host, GameAction action,
                                    boolean automated) {
        return send(ctx, http, host, action, automated, null);
    }

    /** From the worker, for a two-step send whose step-1 preview check decides whether step 2 goes. */
    static ActionClient.Result send(Context ctx, final OkHttpClient http, final String host, GameAction action,
                                    boolean automated, final ActionClient.PreviewCheck check) {
        ActionClient.Transport transport = new ActionClient.Transport() {
            @Override
            public ActionClient.Response send(String method, String path, String json, String nonce)
                    throws Exception {
                Request.Builder b = new Request.Builder()
                        .url(host + "/api/v1" + path)
                        .method(method, TravianApi.jsonBody(json));
                if (nonce != null) {
                    b.header(ActionClient.NONCE_HEADER, nonce);
                }
                Response resp = http.newCall(b.build()).execute();
                try {
                    Map<String, String> headers = new HashMap<String, String>();
                    for (String name : resp.headers().names()) {
                        headers.put(name.toLowerCase(java.util.Locale.ROOT), resp.header(name));
                    }
                    return new ActionClient.Response(resp.code(), resp.body() == null ? "" : resp.body().string(),
                            headers);
                } finally {
                    resp.close();
                }
            }
        };
        // One send at a time in this app (worker, screen taps, a second worker): the dedupe memory is read,
        // checked, marked and saved under this lock, so two overlapping sends can never both go out.
        synchronized (SEND_LOCK) {
            return sendLocked(ctx, transport, action, automated, check);
        }
    }

    private static final Object SEND_LOCK = new Object();

    private static ActionClient.Result sendLocked(Context ctx, ActionClient.Transport transport, GameAction action,
                                                  boolean automated, ActionClient.PreviewCheck check) {
        SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        SharedPreferences state = ctx.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        Map<String, Long> recent = loadRecent(p.getString(KEY_RECENT, null));
        ActionClient.Settings settings = settings(ctx);
        long now = System.currentTimeMillis();
        long nextAttack = ActionClient.effectiveNextAttack(state.getLong(NotifierWorker.KEY_NEXT_ATTACK_AT, 0),
                state.getLong(NotifierWorker.KEY_ATTACKS_KNOWN_AT, 0), now);

        if (ActionSteps.inVillage(action.kind)) {
            int villages = villageCount(state);
            if (villages < 1) {
                return finish(ctx, p, recent, now, action, new ActionClient.Result("REFUSED", 0,
                        "the village list isn't read yet", false, null));
            }
            // Check the action itself first, so a refused action never touches the game at all.
            ActionClient.Result pre = preflight(action, automated, settings, now, nextAttack, recent);
            if (pre != null) {
                return finish(ctx, p, recent, now, action, pre);
            }
            if (villages > 1) {
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
                pause(ActionSteps.AFTER_SWITCH);
            }
            if (!settings.dryRun) {
                // Open the village the way the game does and check its fresh answer before going on.
                String why;
                try {
                    ActionClient.Response view = transport.send("POST", "/graphql", ActionSteps.villageViewBody(action.villageId), null);
                    why = view.code == 200 ? ActionSteps.check(view.body, action)
                            : "the game didn't open the village (HTTP " + view.code + ")";
                } catch (Exception e) {
                    why = "couldn't open the village (" + e.getClass().getSimpleName() + ")";
                }
                if (why != null) {
                    return finish(ctx, p, recent, now, action, new ActionClient.Result("REFUSED", 0,
                            "not sent: " + why, false, null));
                }
                pause(ActionSteps.OPEN_BUILDING);
                pause(ActionSteps.PRESS);
                now = System.currentTimeMillis();
            }
        }
        boolean troops = TroopSend.KIND.equals(action.kind) || TroopSend.ESCAPE_KIND.equals(action.kind);
        ActionClient.Result result = troops || SilverActions.SELL.equals(action.kind)
                ? ActionClient.sendTwoStep(transport, action, automated, settings, now, nextAttack, recent,
                troops ? TroopSend.STEP_ONE_ONLY : SilverActions.SELL_STEP_ONE_ONLY, check)
                : ActionClient.sendWith(transport, action, automated, settings, now, nextAttack, recent);
        if (result.sessionExpired) {
            state.edit().remove(NotifierWorker.KEY_WORLD_HOST).remove(NotifierWorker.KEY_WORLD_TOKEN)
                    .remove(NotifierWorker.KEY_WORLD_TOKEN_EXP).commit();
        }
        return finish(ctx, p, recent, now, action, result);
    }

    private static final java.util.Random PAUSE_RANDOM = new java.util.Random();

    private static void pause(int step) {
        try {
            Thread.sleep(ActionSteps.pauseMs(PAUSE_RANDOM, step));
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
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
        in.attackPauseOn = settings.attackPauseOn;
        in.attackPauseMinutes = settings.attackPauseMinutes;
        in.passesAttackPause = TroopSend.ESCAPE_KIND.equals(action.kind);
        in.quietNow = settings.quietNow;
        in.dedupeKey = action.dedupeKey;
        in.recentKeys = recent;
        ActionGuard.Verdict v = ActionGuard.check(in);
        return v.allowed ? null : new ActionClient.Result("REFUSED", 0, v.reason, false, null);
    }

    private static ActionClient.Result finish(Context ctx, SharedPreferences p, Map<String, Long> recent, long now,
                                              GameAction action, ActionClient.Result r) {
        // Every outcome goes to the phone log, including ones stopped before anything was sent.
        Log.i(TAG, "action " + action.kind + " " + action.label + ": " + r.outcome
                + (r.httpCode > 0 ? " HTTP " + r.httpCode : "") + " " + r.describe());
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
