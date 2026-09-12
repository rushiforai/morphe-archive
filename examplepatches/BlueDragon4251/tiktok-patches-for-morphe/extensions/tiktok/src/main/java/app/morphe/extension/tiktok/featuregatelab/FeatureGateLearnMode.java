package app.morphe.extension.tiktok.featuregatelab;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * BlueIT learn mode: captures a baseline and reports only configuration calls
 * or player values that appear/change while the user exercises a TikTok feature.
 */
public final class FeatureGateLearnMode {
    private static volatile boolean recording;
    private static volatile long startedAtMs;
    private static volatile Set<String> baselineObservations = Collections.emptySet();
    private static volatile Map<String, String> baselinePlayerValues = Collections.emptyMap();
    private static volatile int lastCandidateCount;

    private FeatureGateLearnMode() {
    }

    public static synchronized void begin() {
        baselineObservations = observationIdentities(FeatureGateLabRuntime.settingsManagerObservationsJson());
        baselinePlayerValues = stringifyPlayerValues(FeatureGateLabRuntime.playerObservedValues());
        startedAtMs = System.currentTimeMillis();
        lastCandidateCount = 0;
        recording = true;
    }

    public static synchronized void cancel() {
        recording = false;
        startedAtMs = 0L;
        baselineObservations = Collections.emptySet();
        baselinePlayerValues = Collections.emptyMap();
        lastCandidateCount = 0;
    }

    public static boolean isRecording() {
        return recording;
    }

    public static long startedAtMs() {
        return startedAtMs;
    }

    public static int lastCandidateCount() {
        return lastCandidateCount;
    }

    public static synchronized String stopAndBuildReport() {
        long stoppedAtMs = System.currentTimeMillis();
        JSONArray currentObservations = FeatureGateLabRuntime.settingsManagerObservationsJson();
        JSONArray newObservations = new JSONArray();
        Set<String> baseline = baselineObservations;

        for (int index = 0; index < currentObservations.length(); index++) {
            JSONObject observation = currentObservations.optJSONObject(index);
            if (observation == null) {
                continue;
            }
            if (!baseline.contains(observationIdentity(observation))) {
                newObservations.put(observation);
            }
        }

        JSONObject playerChanges = new JSONObject();
        Map<String, String> beforePlayer = baselinePlayerValues;
        Map<String, Object> currentPlayer = FeatureGateLabRuntime.playerObservedValues();
        for (Map.Entry<String, Object> entry : currentPlayer.entrySet()) {
            String value = String.valueOf(entry.getValue());
            String previous = beforePlayer.get(entry.getKey());
            if (previous == null || !previous.equals(value)) {
                try {
                    JSONObject change = new JSONObject();
                    change.put("before", previous == null ? JSONObject.NULL : previous);
                    change.put("after", value);
                    playerChanges.put(entry.getKey(), change);
                } catch (Throwable ignored) {
                }
            }
        }

        JSONObject report = new JSONObject();
        try {
            report.put("product", "BlueIT Service");
            report.put("mode", "feature_gate_learn_mode");
            report.put("target", "TikTok 46.4.3 / com.zhiliaoapp.musically");
            report.put("started_at_ms", startedAtMs);
            report.put("stopped_at_ms", stoppedAtMs);
            report.put("duration_ms", Math.max(0L, stoppedAtMs - startedAtMs));
            report.put("new_settings_manager_calls", newObservations);
            report.put("new_or_changed_player_values", playerChanges);
            report.put("settings_candidate_count", newObservations.length());
            report.put("player_candidate_count", playerChanges.length());
        } catch (Throwable ignored) {
        }

        lastCandidateCount = newObservations.length() + playerChanges.length();
        recording = false;
        baselineObservations = Collections.emptySet();
        baselinePlayerValues = Collections.emptyMap();

        try {
            return report.toString(2);
        } catch (Throwable ignored) {
            return report.toString();
        }
    }

    private static Set<String> observationIdentities(JSONArray observations) {
        Set<String> identities = new HashSet<>();
        if (observations == null) {
            return identities;
        }
        for (int index = 0; index < observations.length(); index++) {
            JSONObject observation = observations.optJSONObject(index);
            if (observation != null) {
                identities.add(observationIdentity(observation));
            }
        }
        return identities;
    }

    private static String observationIdentity(JSONObject observation) {
        return observation.optString("manager", "") + "\n"
                + observation.optString("key", "") + "\n"
                + observation.optString("requested_class", "") + "\n"
                + observation.optString("settings_manager_method_descriptor", "");
    }

    private static Map<String, String> stringifyPlayerValues(Map<String, Object> values) {
        Map<String, String> result = new HashMap<>();
        if (values == null) {
            return result;
        }
        for (Map.Entry<String, Object> entry : values.entrySet()) {
            result.put(entry.getKey(), String.valueOf(entry.getValue()));
        }
        return result;
    }
}
