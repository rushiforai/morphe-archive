package app.morphe.extension.discord.bunny.recovery;

import org.json.JSONException;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.LinkedHashSet;
import java.util.ArrayList;
import java.util.List;

/** Small, versioned native state that is available before Bunny plugins execute. */
final class RecoveryState {
    static final int VERSION = 4;
    static final int MAX_HISTORY_RECORDS = 5;

    boolean startupInProgress;
    boolean startupHealthy = true;
    int consecutiveFailures;
    String currentPlugin;
    final LinkedHashSet<String> initializingPlugins = new LinkedHashSet<>();
    String mostRecentlyChangedPlugin;
    boolean temporarySafeModeNextLaunch;
    boolean recoveryLatch;
    boolean tryNormalOnce;
    long session;
    long lastHealthyAt;
    long totalCrashes;
    final List<CrashRecord> recentCrashes = new ArrayList<>();
    final List<FailedStartRecord> failedStarts = new ArrayList<>();

    static RecoveryState fromJson(JSONObject json) {
        RecoveryState state = new RecoveryState();
        state.startupInProgress = json.optBoolean("startupInProgress", false);
        state.startupHealthy = json.optBoolean("startupHealthy", true);
        state.consecutiveFailures = Math.max(0, json.optInt("consecutiveFailures", 0));
        state.currentPlugin = optionalString(json, "currentPlugin");
        JSONArray initializing = json.optJSONArray("initializingPlugins");
        if (initializing != null) {
            for (int index = 0; index < initializing.length(); index++) {
                String id = initializing.optString(index, "").trim();
                if (!id.isEmpty()) state.initializingPlugins.add(id);
            }
        } else if (state.currentPlugin != null) {
            state.initializingPlugins.add(state.currentPlugin);
        }
        state.mostRecentlyChangedPlugin = optionalString(json, "mostRecentlyChangedPlugin");
        // Migrate the pre-v4 one-shot field without turning it into a persistent setting.
        state.temporarySafeModeNextLaunch = json.optBoolean(
                "temporarySafeModeNextLaunch",
                json.optBoolean("safeModeRequested", false)
        );
        state.recoveryLatch = json.optBoolean("recoveryLatch", false);
        state.tryNormalOnce = json.optBoolean("tryNormalOnce", false);
        state.session = Math.max(0L, json.optLong("session", 0L));
        state.lastHealthyAt = Math.max(0L, json.optLong("lastHealthyAt", 0L));
        state.totalCrashes = Math.max(0L, json.optLong("totalCrashes", 0L));
        JSONArray crashes = json.optJSONArray("recentCrashes");
        if (crashes != null) {
            for (int index = 0; index < crashes.length() && state.recentCrashes.size() < MAX_HISTORY_RECORDS; index++) {
                JSONObject item = crashes.optJSONObject(index);
                if (item != null) state.recentCrashes.add(CrashRecord.fromJson(item));
            }
        }
        JSONArray failures = json.optJSONArray("failedStarts");
        if (failures != null) {
            for (int index = 0; index < failures.length() && state.failedStarts.size() < MAX_HISTORY_RECORDS; index++) {
                JSONObject item = failures.optJSONObject(index);
                if (item != null) state.failedStarts.add(FailedStartRecord.fromJson(item));
            }
        }
        return state;
    }

    JSONObject toJson() throws JSONException {
        JSONObject json = new JSONObject();
        json.put("version", VERSION);
        json.put("startupInProgress", startupInProgress);
        json.put("startupHealthy", startupHealthy);
        json.put("consecutiveFailures", consecutiveFailures);
        json.put("currentPlugin", currentPlugin == null ? JSONObject.NULL : currentPlugin);
        json.put("initializingPlugins", new JSONArray(initializingPlugins));
        json.put("mostRecentlyChangedPlugin", mostRecentlyChangedPlugin == null ? JSONObject.NULL : mostRecentlyChangedPlugin);
        json.put("temporarySafeModeNextLaunch", temporarySafeModeNextLaunch);
        json.put("recoveryLatch", recoveryLatch);
        json.put("tryNormalOnce", tryNormalOnce);
        json.put("session", session);
        json.put("lastHealthyAt", lastHealthyAt);
        json.put("totalCrashes", totalCrashes);
        JSONArray crashes = new JSONArray();
        for (CrashRecord crash : recentCrashes) crashes.put(crash.toJson());
        json.put("recentCrashes", crashes);
        JSONArray failures = new JSONArray();
        for (FailedStartRecord failure : failedStarts) failures.put(failure.toJson());
        json.put("failedStarts", failures);
        return json;
    }

    void addCrash(CrashRecord crash) {
        totalCrashes++;
        recentCrashes.add(0, crash);
        while (recentCrashes.size() > MAX_HISTORY_RECORDS) {
            recentCrashes.remove(recentCrashes.size() - 1);
        }
    }

    void addFailedStart(FailedStartRecord failure) {
        failedStarts.add(0, failure);
        while (failedStarts.size() > MAX_HISTORY_RECORDS) {
            failedStarts.remove(failedStarts.size() - 1);
        }
    }

    static final class CrashRecord {
        final String id;
        final long timestamp;
        final String kind;
        final String message;
        final String stack;
        final String plugin;
        final boolean duringStartup;

        CrashRecord(String id, long timestamp, String kind, String message, String stack, String plugin, boolean duringStartup) {
            this.id = id == null || id.isEmpty() ? timestamp + "-" + kind : id;
            this.timestamp = Math.max(0L, timestamp);
            this.kind = kind == null ? "unknown" : kind;
            this.message = message == null ? "Unknown crash" : message;
            this.stack = stack == null ? "" : stack;
            this.plugin = plugin;
            this.duringStartup = duringStartup;
        }

        static CrashRecord fromJson(JSONObject json) {
            return new CrashRecord(
                    json.optString("id", ""),
                    json.optLong("timestamp", 0L),
                    json.optString("kind", "unknown"),
                    json.optString("message", "Unknown crash"),
                    json.optString("stack", ""),
                    optionalString(json, "plugin"),
                    json.optBoolean("duringStartup", false)
            );
        }

        JSONObject toJson() throws JSONException {
            return new JSONObject()
                    .put("id", id)
                    .put("timestamp", timestamp)
                    .put("kind", kind)
                    .put("message", message)
                    .put("stack", stack)
                    .put("plugin", plugin == null ? JSONObject.NULL : plugin)
                    .put("duringStartup", duringStartup);
        }
    }

    static final class FailedStartRecord {
        final String id;
        final long timestamp;
        final long session;
        final String plugin;
        final String message;

        FailedStartRecord(String id, long timestamp, long session, String plugin, String message) {
            this.id = id == null || id.isEmpty() ? timestamp + "-failed-" + session : id;
            this.timestamp = Math.max(0L, timestamp);
            this.session = Math.max(0L, session);
            this.plugin = plugin;
            this.message = message == null ? "Bunny did not reach its healthy startup checkpoint." : message;
        }

        static FailedStartRecord fromJson(JSONObject json) {
            return new FailedStartRecord(
                    json.optString("id", ""),
                    json.optLong("timestamp", 0L),
                    json.optLong("session", 0L),
                    optionalString(json, "plugin"),
                    json.optString("message", "Bunny did not reach its healthy startup checkpoint.")
            );
        }

        JSONObject toJson() throws JSONException {
            return new JSONObject()
                    .put("id", id)
                    .put("timestamp", timestamp)
                    .put("session", session)
                    .put("plugin", plugin == null ? JSONObject.NULL : plugin)
                    .put("message", message);
        }
    }

    private static String optionalString(JSONObject json, String key) {
        String value = json.optString(key, "").trim();
        return value.isEmpty() ? null : value;
    }
}
