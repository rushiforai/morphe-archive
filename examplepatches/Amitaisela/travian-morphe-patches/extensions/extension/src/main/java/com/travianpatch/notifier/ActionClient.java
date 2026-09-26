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
        Response post(String path, String json) throws Exception;
    }

    static final class Response {
        final int code;
        final String body;

        Response(int code, String body) {
            this.code = code;
            this.body = body;
        }
    }

    /** The user's switches: master automation on/off, practice mode (nothing sent), attack pause window. */
    static final class Settings {
        final boolean masterOn;
        final boolean dryRun;
        final int attackPauseMinutes;

        Settings(boolean masterOn, boolean dryRun, int attackPauseMinutes) {
            this.masterOn = masterOn;
            this.dryRun = dryRun;
            this.attackPauseMinutes = attackPauseMinutes;
        }
    }

    static final Settings DEFAULT_SETTINGS = new Settings(false, true, 10);

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
        /** SENT, DRY_RUN, REFUSED or FAILED. */
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
        ActionGuard.Input in = new ActionGuard.Input();
        in.path = action.path;
        in.automated = automated;
        in.masterOn = settings.masterOn;
        in.dryRun = settings.dryRun;
        in.nowMs = nowMs;
        in.nextAttackLandingMs = nextAttackLandingMs;
        in.attackPauseMinutes = settings.attackPauseMinutes;
        in.dedupeKey = action.dedupeKey;
        in.recentKeys = recentKeys;
        ActionGuard.Verdict verdict = ActionGuard.check(in);
        if (!verdict.allowed) {
            return new Result("REFUSED", 0, verdict.reason, false, null);
        }
        if (settings.dryRun) {
            return new Result("DRY_RUN", 0, "would send " + action.body, false, null);
        }
        recentKeys.put(action.dedupeKey, nowMs);
        Response response;
        try {
            response = transport.post(action.path, action.body.toString());
        } catch (Exception e) {
            return new Result("FAILED", 0, "no answer from the game (" + e.getClass().getSimpleName() + ")", false, null);
        }
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
