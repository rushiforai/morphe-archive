package com.gdjztech.ringconn.engine;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Base64;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class IntervalsSyncEngine {

    public static final String PREFS_NAME = "ringconn_intervals_sync_prefs";
    public static final String KEY_ATHLETE_ID = "athlete_id";
    public static final String KEY_API_KEY = "api_key";
    public static final String KEY_AUTO_SYNC = "auto_sync";
    public static final String KEY_SCORE_SOURCE = "score_source"; // "athletic" or "ringconn"
    public static final String KEY_LAST_SYNC_TIME = "last_sync_time";
    public static final String KEY_LAST_SYNC_STATUS = "last_sync_status";
    public static final String KEY_LOGS = "sync_logs";
    public static final String KEY_CTL = "cached_ctl";
    public static final String KEY_ATL = "cached_atl";
    public static final String KEY_TSB = "cached_tsb";

    public static SQLiteDatabase getDatabase(Context context) {
        return com.gdjztech.ringconn.provider.HealthDataProvider.getDbInstance(context);
    }

    public static SharedPreferences getPrefs(Context context) {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    public static int calculateAthleticSleepScore(int sleepDurationMin, int deepMin, int remMin, int awakeMin) {
        if (sleepDurationMin <= 0) return 0;

        // 1. Non-linear duration fulfillment (40 pts max, baseline 480 min = 8h 00m)
        double ratio = Math.min(1.0, sleepDurationMin / 480.0);
        double durationScore = 40.0 * Math.pow(ratio, 2.2);

        // 2. Deep sleep (SWS) restorative volume (25 pts max, target >= 90 min)
        double deepRatio = Math.min(1.0, deepMin / 90.0);
        double deepScore = 25.0 * Math.pow(deepRatio, 1.5);

        // 3. REM sleep neural & motor recovery (20 pts max, target >= 100 min)
        double remRatio = Math.min(1.0, remMin / 100.0);
        double remScore = 20.0 * Math.pow(remRatio, 1.5);

        // 4. Sleep efficiency & wakefulness continuity (15 pts max)
        int inBed = sleepDurationMin + awakeMin;
        double efficiency = inBed > 0 ? ((double) sleepDurationMin / inBed) : 1.0;

        double effScore;
        if (efficiency >= 0.92) effScore = 8.0;
        else if (efficiency >= 0.88) effScore = 6.5 + (efficiency - 0.88) / 0.04 * 1.5;
        else if (efficiency >= 0.84) effScore = 4.5 + (efficiency - 0.84) / 0.04 * 2.0;
        else if (efficiency >= 0.80) effScore = 2.5 + (efficiency - 0.80) / 0.04 * 2.0;
        else effScore = 0.0;

        double wasoScore;
        if (awakeMin <= 15) wasoScore = 7.0;
        else if (awakeMin <= 25) wasoScore = 5.5;
        else if (awakeMin <= 40) wasoScore = 3.5;
        else if (awakeMin <= 60) wasoScore = 1.5;
        else wasoScore = 0.0;

        double continuityScore = Math.min(15.0, effScore + wasoScore);
        double total = durationScore + deepScore + remScore + continuityScore;
        return (int) Math.max(1, Math.min(100, Math.round(total)));
    }

    public static int computeSleepQuality(int score) {
        if (score >= 85) return 1; // Great
        if (score >= 70) return 2; // Good
        if (score >= 50) return 3; // Avg
        return 4;                  // Poor
    }

    public static String getSettingsJson(Context context) {
        SharedPreferences prefs = getPrefs(context);
        JSONObject obj = new JSONObject();
        try {
            String athleteId = prefs.getString(KEY_ATHLETE_ID, "").trim();
            String apiKey = prefs.getString(KEY_API_KEY, "").trim();

            obj.put("athleteId", athleteId);
            obj.put("apiKey", apiKey);
            obj.put("autoSync", prefs.getBoolean(KEY_AUTO_SYNC, true));
            obj.put("scoreSource", prefs.getString(KEY_SCORE_SOURCE, "athletic"));
            obj.put("lastSyncTime", prefs.getLong(KEY_LAST_SYNC_TIME, 0));
            obj.put("lastSyncStatus", prefs.getString(KEY_LAST_SYNC_STATUS, "Never synced"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj.toString();
    }

    public static String getOsaDataJson(Context context) {
        JSONObject res = new JSONObject();
        try {
            res.put("enabled", true);
            SQLiteDatabase db = getDatabase(context);
            if (db != null) {
                Cursor cursor = null;
                try {
                    cursor = db.query(
                            "OSADataModel",
                            null,
                            null,
                            null,
                            null,
                            null,
                            "utc DESC",
                            "7"
                    );
                    if (cursor != null && cursor.moveToFirst()) {
                        res.put("hasRecords", true);
                        int colAhi = cursor.getColumnIndex("ahiValue");
                        int colCount = cursor.getColumnIndex("ahiCount");
                        int colSpo2Low = cursor.getColumnIndex("spo2LowValue");
                        int colMins = cursor.getColumnIndex("effectiveMonitorMinute");
                        int colTime = cursor.getColumnIndex("updateTime");
                        int colAdvice = cursor.getColumnIndex("healthAdvice");

                        float ahi = colAhi >= 0 ? cursor.getFloat(colAhi) : 0f;
                        int count = colCount >= 0 ? cursor.getInt(colCount) : 0;
                        int spo2Low = colSpo2Low >= 0 ? cursor.getInt(colSpo2Low) : 0;
                        int mins = colMins >= 0 ? cursor.getInt(colMins) : 0;
                        String updateTime = colTime >= 0 ? cursor.getString(colTime) : "";
                        String advice = colAdvice >= 0 ? cursor.getString(colAdvice) : "";

                        res.put("latestAhi", ahi);
                        res.put("ahiCount", count);
                        res.put("spo2Low", spo2Low);
                        res.put("effectiveMinutes", mins);
                        res.put("updateTime", updateTime);
                        res.put("advice", advice);

                        String status = ahi < 5.0f ? "Normal (< 5/h)" : (ahi < 15.0f ? "Leicht (5-15/h)" : (ahi < 30.0f ? "Moderat (15-30/h)" : "Schwer (> 30/h)"));
                        res.put("status", status);
                    } else {
                        res.put("hasRecords", false);
                        res.put("status", "Monitoring aktiv");
                        res.put("message", "Kontinuierliche SpO2-Überwachung aktiv. Werte werden nach vollständiger Schlafmessung ausgewertet.");
                    }
                } finally {
                    if (cursor != null) cursor.close();
                }
            } else {
                res.put("hasRecords", false);
                res.put("status", "DB nicht verfügbar");
            }
        } catch (Exception e) {
            try {
                res.put("enabled", true);
                res.put("hasRecords", false);
                res.put("status", "Aktiv");
                res.put("error", e.getMessage());
            } catch (Exception ignored) {}
        }
        return res.toString();
    }

    public static String getCoachDataJson(Context context) {
        JSONObject obj = new JSONObject();
        try {
            SharedPreferences prefs = getPrefs(context);
            float ctl = prefs.getFloat(KEY_CTL, 68.0f);
            float atl = prefs.getFloat(KEY_ATL, 65.0f);
            float tsb = prefs.getFloat(KEY_TSB, ctl - atl);

            SQLiteDatabase db = getDatabase(context);
            int rhr = 46;
            int hrv = 68;
            float tempOffset = 0.0f;
            String latestDate = "";
            int sleepScore = 80;

            if (db != null) {
                Cursor cursor = null;
                try {
                    cursor = db.query(
                            "SleepSyncModel",
                            null,
                            null,
                            null,
                            null,
                            null,
                            "dateSleep DESC",
                            "1"
                    );
                    if (cursor != null && cursor.moveToFirst()) {
                        int colDate = cursor.getColumnIndex("dateSleep");
                        int colRestingHr = cursor.getColumnIndex("restingHr");
                        int colHrvAvg = cursor.getColumnIndex("hrvAvg");
                        int colTempOffset = cursor.getColumnIndex("tempOffset");
                        int colScore = cursor.getColumnIndex("sleepScore");
                        int colDeep = cursor.getColumnIndex("deepDuration");
                        int colRem = cursor.getColumnIndex("remDuration");
                        int colAwake = cursor.getColumnIndex("awakeDuration");
                        int colSleepDur = cursor.getColumnIndex("sleepDuration");

                        if (colDate >= 0) latestDate = cursor.getString(colDate);
                        if (colRestingHr >= 0 && !cursor.isNull(colRestingHr)) rhr = cursor.getInt(colRestingHr);
                        if (colHrvAvg >= 0 && !cursor.isNull(colHrvAvg)) hrv = (int) cursor.getFloat(colHrvAvg);
                        if (colTempOffset >= 0 && !cursor.isNull(colTempOffset)) tempOffset = cursor.getFloat(colTempOffset);

                        int totalM = colSleepDur >= 0 ? (int) cursor.getFloat(colSleepDur) : 0;
                        int deepM = colDeep >= 0 ? (int) cursor.getFloat(colDeep) : 0;
                        int remM = colRem >= 0 ? (int) cursor.getFloat(colRem) : 0;
                        int awakeM = colAwake >= 0 ? (int) cursor.getFloat(colAwake) : 0;
                        sleepScore = calculateAthleticSleepScore(totalM, deepM, remM, awakeM);
                    }
                } finally {
                    if (cursor != null) cursor.close();
                }
            }

            CoachBrain.EvaluationResult eval = CoachBrain.evaluate(rhr, hrv, tempOffset, ctl, atl, tsb, null);
            obj = eval.toJson();
            obj.put("latestDate", latestDate);
            obj.put("restingHr", rhr);
            obj.put("hrv", hrv);
            obj.put("tempOffset", tempOffset);
            obj.put("sleepScore", sleepScore);

            String osaStr = getOsaDataJson(context);
            obj.put("osa", new JSONObject(osaStr));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj.toString();
    }

    public static void saveSettings(Context context, String athleteId, String apiKey, boolean autoSync, String scoreSource) {
        SharedPreferences.Editor ed = getPrefs(context).edit();
        ed.putString(KEY_ATHLETE_ID, athleteId != null ? athleteId.trim() : "");
        ed.putString(KEY_API_KEY, apiKey != null ? apiKey.trim() : "");
        ed.putBoolean(KEY_AUTO_SYNC, autoSync);
        ed.putString(KEY_SCORE_SOURCE, scoreSource != null && scoreSource.equalsIgnoreCase("ringconn") ? "ringconn" : "athletic");
        ed.apply();
    }


    public static void appendLog(Context context, String message) {
        SharedPreferences prefs = getPrefs(context);
        String oldLogs = prefs.getString(KEY_LOGS, "[]");
        try {
            JSONArray arr = new JSONArray(oldLogs);
            JSONObject entry = new JSONObject();
            String timeStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(new Date());
            entry.put("time", timeStr);
            entry.put("message", message);
            
            JSONArray newArr = new JSONArray();
            newArr.put(entry);
            for (int i = 0; i < Math.min(arr.length(), 49); i++) {
                newArr.put(arr.get(i));
            }
            prefs.edit().putString(KEY_LOGS, newArr.toString()).apply();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getLogsJson(Context context) {
        return getPrefs(context).getString(KEY_LOGS, "[]");
    }

    public static String getSleepHistoryJson(Context context, int limit) {
        JSONArray array = new JSONArray();
        SQLiteDatabase db = getDatabase(context);
        if (db == null) {
            return array.toString();
        }

        SharedPreferences prefs = getPrefs(context);
        String scoreSource = prefs.getString(KEY_SCORE_SOURCE, "athletic");

        Cursor cursor = null;
        try {
            cursor = db.query(
                    "SleepSyncModel",
                    null,
                    null,
                    null,
                    null,
                    null,
                    "dateSleep DESC",
                    String.valueOf(limit)
            );

            if (cursor != null) {
                int colDate = cursor.getColumnIndex("dateSleep");
                int colRestingHr = cursor.getColumnIndex("restingHr");
                int colHrAvg = cursor.getColumnIndex("hrAvg");
                int colHrvAvg = cursor.getColumnIndex("hrvAvg");
                int colRrAvg = cursor.getColumnIndex("rrAvg");
                int colTempOffset = cursor.getColumnIndex("tempOffset");
                int colTempBench = cursor.getColumnIndex("tempBenchmark");
                int colDeep = cursor.getColumnIndex("deepDuration");
                int colRem = cursor.getColumnIndex("remDuration");
                int colLight = cursor.getColumnIndex("lightDuration");
                int colAwake = cursor.getColumnIndex("awakeDuration");
                int colSleepDur = cursor.getColumnIndex("sleepDuration");
                int colScore = cursor.getColumnIndex("sleepScore");
                int colSpo2 = cursor.getColumnIndex("spo2Avg");

                while (cursor.moveToNext()) {
                    JSONObject row = new JSONObject();
                    String date = colDate >= 0 ? cursor.getString(colDate) : "";
                    row.put("date", date);

                    if (colRestingHr >= 0 && !cursor.isNull(colRestingHr)) {
                        row.put("restingHr", cursor.getInt(colRestingHr));
                    }
                    if (colHrAvg >= 0 && !cursor.isNull(colHrAvg)) {
                        row.put("hrAvg", (int) cursor.getFloat(colHrAvg));
                    }
                    if (colHrvAvg >= 0 && !cursor.isNull(colHrvAvg)) {
                        row.put("hrv", Math.round(cursor.getFloat(colHrvAvg) * 10.0f) / 10.0);
                    }
                    if (colRrAvg >= 0 && !cursor.isNull(colRrAvg)) {
                        float rawRr = cursor.getFloat(colRrAvg);
                        if (rawRr > 0) {
                            row.put("respiration", Math.round((rawRr / 8.0f) * 10.0f) / 10.0);
                        }
                    }
                    if (colTempOffset >= 0 && !cursor.isNull(colTempOffset)) {
                        row.put("tempOffset", Math.round(cursor.getFloat(colTempOffset) * 100.0f) / 100.0);
                    }
                    int deepMins = 0;
                    if (colDeep >= 0 && !cursor.isNull(colDeep)) {
                        deepMins = (int) cursor.getFloat(colDeep);
                        row.put("deepMinutes", deepMins);
                    }
                    int remMins = 0;
                    if (colRem >= 0 && !cursor.isNull(colRem)) {
                        remMins = (int) cursor.getFloat(colRem);
                        row.put("remMinutes", remMins);
                    }
                    if (colLight >= 0 && !cursor.isNull(colLight)) {
                        row.put("lightMinutes", (int) cursor.getFloat(colLight));
                    }
                    int awakeMins = 0;
                    if (colAwake >= 0 && !cursor.isNull(colAwake)) {
                        awakeMins = (int) cursor.getFloat(colAwake);
                        row.put("awakeMinutes", awakeMins);
                    }
                    int totalSleepMins = 0;
                    if (colSleepDur >= 0 && !cursor.isNull(colSleepDur)) {
                        totalSleepMins = (int) cursor.getFloat(colSleepDur);
                        row.put("sleepDurationMinutes", totalSleepMins);
                    }

                    int rcScore = 0;
                    if (colScore >= 0 && !cursor.isNull(colScore)) {
                        rcScore = cursor.getInt(colScore);
                    }
                    int athleticScore = calculateAthleticSleepScore(totalSleepMins, deepMins, remMins, awakeMins);
                    int finalScore = "ringconn".equalsIgnoreCase(scoreSource) ? rcScore : athleticScore;

                    row.put("ringconnScore", rcScore);
                    row.put("athleticScore", athleticScore);
                    row.put("score", finalScore);
                    row.put("scoreSource", scoreSource);

                    if (colSpo2 >= 0 && !cursor.isNull(colSpo2)) {
                        row.put("spo2", Math.round(cursor.getFloat(colSpo2) * 10.0f) / 10.0);
                    }

                    array.put(row);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
        return array.toString();
    }

    public static JSONObject syncDate(Context context, String targetDate) {
        JSONObject result = new JSONObject();
        SharedPreferences prefs = getPrefs(context);
        String athleteId = prefs.getString(KEY_ATHLETE_ID, "").trim();
        String apiKey = prefs.getString(KEY_API_KEY, "").trim();
        String scoreSource = prefs.getString(KEY_SCORE_SOURCE, "athletic");

        if (athleteId.isEmpty() || apiKey.isEmpty()) {
            try {
                result.put("success", false);
                result.put("message", "Athlete ID and API Key are required in Settings.");
            } catch (Exception ignored) {}
            return result;
        }

        SQLiteDatabase db = getDatabase(context);
        if (db == null) {
            try {
                result.put("success", false);
                result.put("message", "Could not open RingConn local database.");
            } catch (Exception ignored) {}
            return result;
        }

        Cursor cursor = null;
        try {
            cursor = db.query(
                    "SleepSyncModel",
                    null,
                    "dateSleep = ?",
                    new String[]{targetDate},
                    null,
                    null,
                    null
            );

            if (cursor == null || !cursor.moveToFirst()) {
                if (cursor != null) cursor.close();
                cursor = db.query(
                        "SleepSyncModel",
                        null,
                        null,
                        null,
                        null,
                        null,
                        "dateSleep DESC",
                        "1"
                );
                if (cursor == null || !cursor.moveToFirst()) {
                    result.put("success", false);
                    result.put("message", "No sleep record found in local database.");
                    return result;
                }
                int colD = cursor.getColumnIndex("dateSleep");
                if (colD >= 0) targetDate = cursor.getString(colD);
            }

            JSONObject payload = new JSONObject();
            payload.put("id", targetDate);
            payload.put("steps", -1); // prevent phone pedometer overwrite

            int colRestingHr = cursor.getColumnIndex("restingHr");
            int colHrAvg = cursor.getColumnIndex("hrAvg");
            int colHrvAvg = cursor.getColumnIndex("hrvAvg");
            int colRrAvg = cursor.getColumnIndex("rrAvg");
            int colTempOffset = cursor.getColumnIndex("tempOffset");
            int colDeep = cursor.getColumnIndex("deepDuration");
            int colRem = cursor.getColumnIndex("remDuration");
            int colLight = cursor.getColumnIndex("lightDuration");
            int colAwake = cursor.getColumnIndex("awakeDuration");
            int colSleepDur = cursor.getColumnIndex("sleepDuration");
            int colScore = cursor.getColumnIndex("sleepScore");
            int colSpo2 = cursor.getColumnIndex("spo2Avg");

            int totalMins = 0;
            if (colSleepDur >= 0 && !cursor.isNull(colSleepDur)) {
                totalMins = (int) cursor.getFloat(colSleepDur);
                if (totalMins > 0) payload.put("sleepSecs", totalMins * 60);
            }

            int deepMins = (colDeep >= 0 && !cursor.isNull(colDeep)) ? (int) cursor.getFloat(colDeep) : 0;
            int remMins = (colRem >= 0 && !cursor.isNull(colRem)) ? (int) cursor.getFloat(colRem) : 0;
            int awakeMins = (colAwake >= 0 && !cursor.isNull(colAwake)) ? (int) cursor.getFloat(colAwake) : 0;

            int rcScore = (colScore >= 0 && !cursor.isNull(colScore)) ? cursor.getInt(colScore) : 0;
            int athleticScore = calculateAthleticSleepScore(totalMins, deepMins, remMins, awakeMins);
            int chosenScore = "ringconn".equalsIgnoreCase(scoreSource) ? rcScore : athleticScore;

            if (chosenScore > 0) {
                payload.put("sleepScore", chosenScore);
                payload.put("sleepQuality", computeSleepQuality(chosenScore));
            }

            if (colRestingHr >= 0 && !cursor.isNull(colRestingHr)) {
                int rhr = cursor.getInt(colRestingHr);
                if (rhr > 0) payload.put("restingHR", rhr);
            }
            if (colHrAvg >= 0 && !cursor.isNull(colHrAvg)) {
                int ahr = (int) cursor.getFloat(colHrAvg);
                if (ahr > 0) payload.put("avgSleepingHR", ahr);
            }
            if (colHrvAvg >= 0 && !cursor.isNull(colHrvAvg)) {
                float hrv = cursor.getFloat(colHrvAvg);
                if (hrv > 0) payload.put("hrv", Math.round(hrv * 10.0) / 10.0);
            }
            if (colRrAvg >= 0 && !cursor.isNull(colRrAvg)) {
                float rawRr = cursor.getFloat(colRrAvg);
                if (rawRr > 0) {
                    payload.put("respiration", Math.round((rawRr / 8.0f) * 10.0f) / 10.0);
                }
            }
            // Note: Intervals.icu standard wellness rejects skinTemp with HTTP 422.
            // Temperature evaluation is handled natively inside CoachBrain.
            if (deepMins > 0) {
                payload.put("DeepSleep", deepMins);
            }
            if (remMins > 0) {
                payload.put("RemSleep", remMins);
            }
            if (colLight >= 0 && !cursor.isNull(colLight)) {
                int l = (int) cursor.getFloat(colLight);
                if (l > 0) payload.put("LightSleep", l);
            }
            if (colSpo2 >= 0 && !cursor.isNull(colSpo2)) {
                float sp = cursor.getFloat(colSpo2);
                if (sp > 0) payload.put("spO2", Math.round(sp * 10.0) / 10.0);
            }

            // HTTP PUT to intervals.icu
            String endpoint = "https://intervals.icu/api/v1/athlete/" + athleteId + "/wellness/" + targetDate;
            URL url = new URL(endpoint);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("PUT");
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(15000);
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");

            String auth = "API_KEY:" + apiKey;
            String basicAuth = "Basic " + Base64.encodeToString(auth.getBytes(StandardCharsets.UTF_8), Base64.NO_WRAP);
            conn.setRequestProperty("Authorization", basicAuth);

            byte[] jsonBytes = payload.toString().getBytes(StandardCharsets.UTF_8);
            try (OutputStream os = conn.getOutputStream()) {
                os.write(jsonBytes);
                os.flush();
            }

            int responseCode = conn.getResponseCode();
            InputStream is = (responseCode >= 200 && responseCode < 300) ? conn.getInputStream() : conn.getErrorStream();
            StringBuilder resp = new StringBuilder();
            if (is != null) {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        resp.append(line);
                    }
                }
            }

            boolean isSuccess = (responseCode >= 200 && responseCode < 300);
            result.put("success", isSuccess);
            result.put("statusCode", responseCode);
            result.put("message", "HTTP " + responseCode + (isSuccess ? " OK" : ": " + resp.toString()));
            result.put("date", targetDate);

            if (isSuccess && resp.length() > 0) {
                try {
                    JSONObject respJson = new JSONObject(resp.toString());
                    SharedPreferences.Editor ed = prefs.edit();
                    boolean updated = false;
                    if (respJson.has("ctl") && !respJson.isNull("ctl")) {
                        ed.putFloat(KEY_CTL, (float) respJson.getDouble("ctl"));
                        updated = true;
                    }
                    if (respJson.has("atl") && !respJson.isNull("atl")) {
                        ed.putFloat(KEY_ATL, (float) respJson.getDouble("atl"));
                        updated = true;
                    }
                    if (respJson.has("ctl") && respJson.has("atl") && !respJson.isNull("ctl") && !respJson.isNull("atl")) {
                        float ctlVal = (float) respJson.getDouble("ctl");
                        float atlVal = (float) respJson.getDouble("atl");
                        ed.putFloat(KEY_TSB, ctlVal - atlVal);
                        updated = true;
                    }
                    if (updated) ed.apply();
                } catch (Exception ignored) {}
            }

            String sourceLabel = "ringconn".equalsIgnoreCase(scoreSource) ? "Official" : "Athletic";
            String statusSummary = isSuccess ? "Synced " + targetDate + " (Score " + chosenScore + " [" + sourceLabel + "], HTTP " + responseCode + ")" : "Failed " + targetDate + " (" + responseCode + ")";
            prefs.edit()
                    .putLong(KEY_LAST_SYNC_TIME, System.currentTimeMillis())
                    .putString(KEY_LAST_SYNC_STATUS, statusSummary)
                    .apply();

            appendLog(context, statusSummary);

        } catch (Exception e) {
            e.printStackTrace();
            try {
                result.put("success", false);
                result.put("message", "Exception: " + e.getMessage());
                appendLog(context, "Error syncing " + targetDate + ": " + e.getMessage());
            } catch (Exception ignored) {}
        } finally {
            if (cursor != null) cursor.close();
        }

        return result;
    }

    public static String exportLocalBackup(Context context) {
        if (context == null) return "Context is null";
        SQLiteDatabase db = getDatabase(context);
        if (db == null) return "Database ring_conn.db not available";

        Cursor cursor = null;
        try {
            cursor = db.query("SleepSyncModel", null, null, null, null, null, "dateSleep DESC", "180");
            if (cursor == null || cursor.getCount() == 0) {
                return "No sleep records to export";
            }

            JSONArray jsonArray = new JSONArray();
            StringBuilder csv = new StringBuilder();
            csv.append("Date,Sleep_Hours,Sleep_Score_Athletic,Sleep_Score_RingConn,Deep_Min,REM_Min,Light_Min,Awake_Min,Resting_HR,HR_Avg,HRV_rMSSD,Respiration,Skin_Temp_Offset\n");

            int colDate = cursor.getColumnIndex("dateSleep");
            int colRestingHr = cursor.getColumnIndex("restingHr");
            int colHrAvg = cursor.getColumnIndex("hrAvg");
            int colHrvAvg = cursor.getColumnIndex("hrvAvg");
            int colRrAvg = cursor.getColumnIndex("rrAvg");
            int colTempOffset = cursor.getColumnIndex("tempOffset");
            int colDeep = cursor.getColumnIndex("deepDuration");
            int colRem = cursor.getColumnIndex("remDuration");
            int colLight = cursor.getColumnIndex("lightDuration");
            int colAwake = cursor.getColumnIndex("awakeDuration");
            int colSleepDur = cursor.getColumnIndex("sleepDuration");
            int colScore = cursor.getColumnIndex("sleepScore");
            int colSpo2 = cursor.getColumnIndex("spo2Avg");

            while (cursor.moveToNext()) {
                String date = colDate >= 0 ? cursor.getString(colDate) : "";
                int deepM = colDeep >= 0 ? (int) cursor.getFloat(colDeep) : 0;
                int remM = colRem >= 0 ? (int) cursor.getFloat(colRem) : 0;
                int lightM = colLight >= 0 ? (int) cursor.getFloat(colLight) : 0;
                int awakeM = colAwake >= 0 ? (int) cursor.getFloat(colAwake) : 0;
                int sleepM = colSleepDur >= 0 ? (int) cursor.getFloat(colSleepDur) : (deepM + remM + lightM);
                int officialScore = colScore >= 0 ? (int) cursor.getFloat(colScore) : 0;
                int athleticScore = calculateAthleticSleepScore(sleepM, deepM, remM, awakeM);
                Integer rhr = (colRestingHr >= 0 && !cursor.isNull(colRestingHr)) ? cursor.getInt(colRestingHr) : null;
                Integer hrAvg = (colHrAvg >= 0 && !cursor.isNull(colHrAvg)) ? (int) cursor.getFloat(colHrAvg) : null;
                Float hrv = (colHrvAvg >= 0 && !cursor.isNull(colHrvAvg)) ? Math.round(cursor.getFloat(colHrvAvg) * 10.0f) / 10.0f : null;
                Float rr = null;
                if (colRrAvg >= 0 && !cursor.isNull(colRrAvg)) {
                    float rawRr = cursor.getFloat(colRrAvg);
                    if (rawRr > 0) rr = Math.round((rawRr / 8.0f) * 10.0f) / 10.0f;
                }
                Float tempOffset = (colTempOffset >= 0 && !cursor.isNull(colTempOffset)) ? Math.round(cursor.getFloat(colTempOffset) * 100.0f) / 100.0f : null;
                Float spo2 = (colSpo2 >= 0 && !cursor.isNull(colSpo2)) ? cursor.getFloat(colSpo2) : null;

                JSONObject item = new JSONObject();
                item.put("date", date);
                item.put("sleepDurationMin", sleepM);
                item.put("sleepScoreAthletic", athleticScore);
                item.put("sleepScoreOfficial", officialScore);
                item.put("deepMin", deepM);
                item.put("remMin", remM);
                item.put("lightMin", lightM);
                item.put("awakeMin", awakeM);
                if (rhr != null) item.put("restingHr", rhr);
                if (hrAvg != null) item.put("hrAvg", hrAvg);
                if (hrv != null) item.put("hrv", hrv);
                if (rr != null) item.put("respiration", rr);
                if (tempOffset != null) item.put("tempOffset", tempOffset);
                if (spo2 != null) item.put("spo2", spo2);
                jsonArray.put(item);

                String sleepHours = String.format(Locale.US, "%.2f", sleepM / 60.0);
                csv.append(date).append(",")
                   .append(sleepHours).append(",")
                   .append(athleticScore).append(",")
                   .append(officialScore).append(",")
                   .append(deepM).append(",")
                   .append(remM).append(",")
                   .append(lightM).append(",")
                   .append(awakeM).append(",")
                   .append(rhr != null ? rhr : "").append(",")
                   .append(hrAvg != null ? hrAvg : "").append(",")
                   .append(hrv != null ? hrv : "").append(",")
                   .append(rr != null ? rr : "").append(",")
                   .append(tempOffset != null ? tempOffset : "").append("\n");
            }

            int count = jsonArray.length();
            writeExportFile(context, "RingConn_Wellness_Master.json", "application/json", jsonArray.toString(2));
            writeExportFile(context, "RingConn_Wellness_Master.csv", "text/csv", csv.toString());

            String msg = "Exported " + count + " days to Download/IntervalsDirect";
            appendLog(context, msg);
            return msg;
        } catch (Exception e) {
            e.printStackTrace();
            return "Export failed: " + e.getMessage();
        } finally {
            if (cursor != null) cursor.close();
        }
    }

    private static void writeExportFile(Context context, String fileName, String mimeType, String content) {
        try {
            byte[] bytes = content.getBytes(StandardCharsets.UTF_8);
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.Q) {
                android.content.ContentValues values = new android.content.ContentValues();
                values.put(android.provider.MediaStore.MediaColumns.DISPLAY_NAME, fileName);
                values.put(android.provider.MediaStore.MediaColumns.MIME_TYPE, mimeType);
                values.put(android.provider.MediaStore.MediaColumns.RELATIVE_PATH, android.os.Environment.DIRECTORY_DOWNLOADS + "/IntervalsDirect");

                try {
                    android.net.Uri queryUri = android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI;
                    String selection = android.provider.MediaStore.MediaColumns.DISPLAY_NAME + "=?";
                    context.getContentResolver().delete(queryUri, selection, new String[]{fileName});
                } catch (Exception ignored) {}

                android.net.Uri uri = context.getContentResolver().insert(android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                if (uri != null) {
                    try (OutputStream os = context.getContentResolver().openOutputStream(uri)) {
                        if (os != null) {
                            os.write(bytes);
                            os.flush();
                            return;
                        }
                    }
                }
            }

            File dir = new File(android.os.Environment.getExternalStoragePublicDirectory(android.os.Environment.DIRECTORY_DOWNLOADS), "IntervalsDirect");
            if (!dir.exists()) dir.mkdirs();
            File file = new File(dir, fileName);
            try (java.io.FileOutputStream fos = new java.io.FileOutputStream(file)) {
                fos.write(bytes);
                fos.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
