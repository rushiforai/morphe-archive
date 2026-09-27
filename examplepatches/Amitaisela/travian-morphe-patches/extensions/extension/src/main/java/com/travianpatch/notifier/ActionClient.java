package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Map;

/**
 * Sends one GameAction after the safety check, and turns the server's answer into a plain outcome.
 * The network itself is behind Transport (ActionSender supplies the real one), so this stays pure logic
 * that can be checked off-device. It never retries on its own: a failed action is simply tried again on a
 * later check (and ActionGuard stops fast repeats).
 */
final class ActionClient {

    private ActionClient() {
    }

    interface Transport {
        /**
         * method: the HTTP method (POST for actions; PUT for step 1 of a two-step send, as the game's own
         * client does). nonce: the one-time token for step 2 (x-nonce header), or null.
         */
        Response send(String method, String path, String json, String nonce) throws Exception;
    }

    static final class Response {
        final int code;
        final String body;
        /** Response headers, names in lower case (empty when not known). */
        final Map<String, String> headers;

        Response(int code, String body) {
            this(code, body, new java.util.HashMap<String, String>());
        }

        Response(int code, String body, Map<String, String> headers) {
            this.code = code;
            this.body = body;
            this.headers = headers;
        }
    }

    /** Looks at the game's step-1 preview before step 2; returns null to confirm, else why not. */
    interface PreviewCheck {
        String problem(Response preview);
    }

    /** The header that carries the one-time token of a two-step send (name from the game's client). */
    static final String NONCE_HEADER = "x-nonce";

    /** The user's switches: master automation on/off, practice mode (nothing sent), attack pause on/off and window. */
    static final class Settings {
        final boolean masterOn;
        final boolean dryRun;
        final boolean attackPauseOn;
        final int attackPauseMinutes;
        /** Inside the quiet hours of Settings → Auto-build timing: no automatic action of any kind goes out. */
        final boolean quietNow;

        Settings(boolean masterOn, boolean dryRun, int attackPauseMinutes) {
            this(masterOn, dryRun, true, attackPauseMinutes);
        }

        Settings(boolean masterOn, boolean dryRun, boolean attackPauseOn, int attackPauseMinutes) {
            this(masterOn, dryRun, attackPauseOn, attackPauseMinutes, false);
        }

        Settings(boolean masterOn, boolean dryRun, boolean attackPauseOn, int attackPauseMinutes, boolean quietNow) {
            this.masterOn = masterOn;
            this.dryRun = dryRun;
            this.attackPauseOn = attackPauseOn;
            this.attackPauseMinutes = attackPauseMinutes;
            this.quietNow = quietNow;
        }
    }

    /** The attack pause is off until the user turns it on (their choice, 2026-09-26). */
    static final Settings DEFAULT_SETTINGS = new Settings(false, true, false, 10);

    /** Attack data older than this (or never read) counts as "an attack may land now" for automatic actions. */
    static final long ATTACK_DATA_MAX_AGE_MS = 15 * 60_000L;

    /**
     * The landing time the guard should use: the saved one when the attack list was read recently and
     * completely, otherwise "right now", so missing or stale data pauses automation instead of reading as
     * "no attack".
     */
    static long effectiveNextAttack(long savedNextMs, long knownAtMs, long nowMs) {
        if (knownAtMs <= 0 || nowMs - knownAtMs > ATTACK_DATA_MAX_AGE_MS) {
            return nowMs + 1;
        }
        return savedNextMs;
    }

    static final class Result {
        /** SENT, DRY_RUN, REFUSED, FAILED, or CHECKED (step 1 of a two-step send only). */
        final String outcome;
        final int httpCode;
        final String serverMessage;
        final boolean sessionExpired;
        final String responseBody;

        Result(String outcome, int httpCode, String serverMessage, boolean sessionExpired, String responseBody) {
            this.outcome = outcome;
            this.httpCode = httpCode;
            this.serverMessage = serverMessage;
            this.sessionExpired = sessionExpired;
            this.responseBody = responseBody;
        }

        /** One line for the log and toasts. */
        String describe() {
            if ("FAILED".equals(outcome) && serverMessage != null && serverMessage.length() > 0) {
                return "failed: " + serverMessage;
            }
            return outcome.toLowerCase().replace('_', ' ') + (serverMessage == null || serverMessage.isEmpty()
                    ? "" : ": " + serverMessage);
        }
    }

    static Result sendWith(Transport transport, GameAction action, boolean automated, Settings settings,
                           long nowMs, long nextAttackLandingMs, Map<String, Long> recentKeys) {
        Result refused = check(action, automated, settings, nowMs, nextAttackLandingMs, recentKeys);
        if (refused != null) {
            return refused;
        }
        recentKeys.put(action.dedupeKey, nowMs);
        Response response;
        try {
            response = transport.send("POST", action.path, action.body.toString(), null);
        } catch (Exception e) {
            return new Result("FAILED", 0, "no answer from the game (" + e.getClass().getSimpleName() + ")", false, null);
        }
        return judge(response);
    }

    /**
     * A two-step send (troops): step 1 (PUT, like the game's GetOneTimeToken calls) asks the game for a
     * one-time token, step 2 (POST, like its ConfirmAction calls) repeats the same body with it in the x-nonce
     * header. stepOneOnly stops after step 1 and reports what the game answered (outcome
     * CHECKED), for the first watched try while the token's shape is not yet seen live.
     */
    static Result sendTwoStep(Transport transport, GameAction action, boolean automated, Settings settings,
                              long nowMs, long nextAttackLandingMs, Map<String, Long> recentKeys, boolean stepOneOnly) {
        return sendTwoStep(transport, action, automated, settings, nowMs, nextAttackLandingMs, recentKeys, stepOneOnly,
                null);
    }

    /** Like sendTwoStep, but step 2 only goes when check (if any) accepts the game's step-1 preview. */
    static Result sendTwoStep(Transport transport, GameAction action, boolean automated, Settings settings,
                              long nowMs, long nextAttackLandingMs, Map<String, Long> recentKeys, boolean stepOneOnly,
                              PreviewCheck check) {
        Result refused = check(action, automated, settings, nowMs, nextAttackLandingMs, recentKeys);
        if (refused != null) {
            return refused;
        }
        recentKeys.put(action.dedupeKey, nowMs);
        Response first;
        try {
            first = transport.send("PUT", action.path, action.body.toString(), null);
        } catch (Exception e) {
            return new Result("FAILED", 0, "no answer from the game (" + e.getClass().getSimpleName() + ")", false, null);
        }
        if (first.code == 401 || first.code == 403) {
            return new Result("FAILED", first.code, "the game session has expired", true, first.body);
        }
        String nonce = first.headers == null ? null : first.headers.get(NONCE_HEADER);
        if (stepOneOnly) {
            return new Result("CHECKED", first.code, "step 1 only (PUT): HTTP " + first.code + ", token "
                    + (nonce == null ? "not in headers" : "in x-nonce header") + ", headers " + headerText(first.headers)
                    + ", answer " + cut(first.body, 600), false, first.body);
        }
        if (nonce == null || nonce.isEmpty()) {
            Result r = judge(first);
            return new Result("FAILED", first.code, "the game gave no one-time token (" + r.describe()
                    + "); nothing confirmed", false, first.body);
        }
        if (check != null && first.code >= 200 && first.code < 300) {
            String problem = check.problem(first);
            if (problem != null) {
                return new Result("REFUSED", first.code, "not confirmed: " + problem, false, first.body);
            }
        }
        Response second;
        try {
            second = transport.send("POST", action.path, action.body.toString(), nonce);
        } catch (Exception e) {
            return new Result("FAILED", 0, "no answer to the confirm step (" + e.getClass().getSimpleName() + ")",
                    false, null);
        }
        return judge(second);
    }

    /** The guard and practice mode: a Result when the action must not go out, else null. */
    private static Result check(GameAction action, boolean automated, Settings settings, long nowMs,
                                long nextAttackLandingMs, Map<String, Long> recentKeys) {
        ActionGuard.Input in = new ActionGuard.Input();
        in.path = action.path;
        in.automated = automated;
        in.masterOn = settings.masterOn;
        in.dryRun = settings.dryRun;
        in.nowMs = nowMs;
        in.nextAttackLandingMs = nextAttackLandingMs;
        in.attackPauseOn = settings.attackPauseOn;
        in.attackPauseMinutes = settings.attackPauseMinutes;
        in.passesAttackPause = TroopSend.ESCAPE_KIND.equals(action.kind);
        in.quietNow = settings.quietNow;
        in.dedupeKey = action.dedupeKey;
        in.recentKeys = recentKeys;
        ActionGuard.Verdict verdict = ActionGuard.check(in);
        if (!verdict.allowed) {
            return new Result("REFUSED", 0, verdict.reason, false, null);
        }
        if (settings.dryRun) {
            return new Result("DRY_RUN", 0, "would send " + action.body, false, null);
        }
        return null;
    }

    /** Turns the game's answer into SENT or FAILED. */
    private static Result judge(Response response) {
        if (response.code == 401 || response.code == 403) {
            return new Result("FAILED", response.code, "the game session has expired", true, response.body);
        }
        String message = serverMessage(response.body);
        if (response.code < 200 || response.code >= 300 || hasErrors(response.body)) {
            return new Result("FAILED", response.code, message == null ? "HTTP " + response.code : message, false,
                    response.body);
        }
        return new Result("SENT", response.code, message == null ? "" : message, false, response.body);
    }

    /** Header names with values cut short; cookie values are left out. */
    static String headerText(Map<String, String> headers) {
        if (headers == null) {
            return "{}";
        }
        StringBuilder b = new StringBuilder("{");
        for (Map.Entry<String, String> e : new java.util.TreeMap<String, String>(headers).entrySet()) {
            if (b.length() > 1) {
                b.append(", ");
            }
            String v = e.getKey().contains("cookie") ? "(hidden)" : cut(e.getValue(), 80);
            b.append(e.getKey()).append('=').append(v);
        }
        return b.append('}').toString();
    }

    private static String cut(String s, int max) {
        return s == null ? "(none)" : s.length() > max ? s.substring(0, max) + "…" : s;
    }

    private static boolean hasErrors(String body) {
        try {
            JSONArray errors = new JSONObject(body).optJSONArray("errors");
            return errors != null && errors.length() > 0;
        } catch (Exception e) {
            return false;
        }
    }

    /** The game's own message text (message / error / first errors[].message), cut to 300 chars. */
    static String serverMessage(String body) {
        if (body == null) {
            return null;
        }
        try {
            JSONObject o = new JSONObject(body);
            String m = o.optString("message", null);
            if (m == null) {
                Object error = o.opt("error");
                if (error instanceof JSONObject) {
                    m = ((JSONObject) error).optString("message", null);
                } else if (error != null) {
                    m = String.valueOf(error);
                }
            }
            if (m == null) {
                JSONArray errors = o.optJSONArray("errors");
                if (errors != null && errors.length() > 0 && errors.optJSONObject(0) != null) {
                    m = errors.optJSONObject(0).optString("message", null);
                }
            }
            return m == null ? null : (m.length() > 300 ? m.substring(0, 300) : m);
        } catch (Exception e) {
            return body.length() > 300 ? body.substring(0, 300) : body;
        }
    }
}
