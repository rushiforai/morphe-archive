package me.dyskal.ytmrpc;

import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/** Small, testable OAuth-attempt guard. Cancelling invalidates even an already claimed callback. */
public final class DiscordAuthorization {
    public static final long TIMEOUT_MILLIS = 120_000;
    public static final class Attempt {
        public final String appId, state, verifier;
        public final long startedAt;
        public final int returnTaskId;
        private boolean claimed;
        private Attempt(String appId, String state, String verifier, long startedAt, int returnTaskId) {
            this.appId = appId; this.state = state; this.verifier = verifier; this.startedAt = startedAt;
            this.returnTaskId = returnTaskId;
        }
        public JSONObject toJson() throws Exception {
            return new JSONObject().put("app_id", appId).put("state", state).put("verifier", verifier)
                    .put("started_at", startedAt).put("return_task_id", returnTaskId);
        }
    }
    private Attempt current;

    public synchronized Attempt begin(String appId, long now, int returnTaskId) {
        if (current != null) return null;
        if (!DiscordOAuth.isValidApplicationId(appId)) throw new IllegalArgumentException("Invalid application ID");
        current = new Attempt(appId, DiscordOAuth.randomSecret(), DiscordOAuth.randomSecret(), now, returnTaskId);
        return current;
    }

    public synchronized Attempt restore(JSONObject saved, long now) throws Exception {
        if (current != null || saved == null) return null;
        long startedAt = saved.getLong("started_at");
        if (now < startedAt || now - startedAt >= TIMEOUT_MILLIS) return null;
        String appId = saved.getString("app_id");
        String state = saved.getString("state"), verifier = saved.getString("verifier");
        if (!DiscordOAuth.isValidApplicationId(appId) || state.isEmpty() || verifier.isEmpty()) return null;
        current = new Attempt(appId, state, verifier, startedAt, saved.optInt("return_task_id", -1));
        return current;
    }

    public synchronized boolean isBusy() { return current != null; }
    public synchronized boolean isCurrent(Attempt attempt) { return attempt != null && current == attempt; }
    public synchronized boolean finish(Attempt attempt) {
        if (!isCurrent(attempt)) return false;
        current = null;
        return true;
    }
    public synchronized Attempt cancel() { Attempt attempt = current; current = null; return attempt; }

    public synchronized Attempt claim(String state, long now) throws DiscordFailure {
        if (current == null || current.claimed) throw new DiscordFailure(DiscordFailure.Kind.CANCELLED, "No pending Discord authorization");
        if (now < current.startedAt || now - current.startedAt >= TIMEOUT_MILLIS) {
            throw new DiscordFailure(DiscordFailure.Kind.CANCELLED, "Authorization expired; connect again");
        }
        if (state == null || !MessageDigest.isEqual(current.state.getBytes(StandardCharsets.UTF_8), state.getBytes(StandardCharsets.UTF_8))) {
            throw new DiscordFailure(DiscordFailure.Kind.CONFIGURATION, "OAuth callback state mismatch");
        }
        current.claimed = true;
        return current;
    }
}
