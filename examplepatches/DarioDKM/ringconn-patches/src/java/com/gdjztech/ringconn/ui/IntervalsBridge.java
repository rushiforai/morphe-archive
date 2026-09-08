package com.gdjztech.ringconn.ui;

import android.app.Activity;
import android.webkit.JavascriptInterface;
import com.gdjztech.ringconn.engine.IntervalsSyncEngine;
import org.json.JSONObject;

public class IntervalsBridge {
    private final Activity activity;

    public IntervalsBridge(Activity activity) {
        this.activity = activity;
    }

    @JavascriptInterface
    public String getSettings() {
        return IntervalsSyncEngine.getSettingsJson(activity);
    }

    @JavascriptInterface
    public void saveSettings(String athleteId, String apiKey, boolean autoSync, String scoreSource) {
        IntervalsSyncEngine.saveSettings(activity, athleteId, apiKey, autoSync, scoreSource);
    }

    @JavascriptInterface
    public void saveSettings(String athleteId, String apiKey, boolean autoSync) {
        IntervalsSyncEngine.saveSettings(activity, athleteId, apiKey, autoSync, "athletic");
    }

    @JavascriptInterface
    public String getSleepHistory(int limit) {
        return IntervalsSyncEngine.getSleepHistoryJson(activity, limit <= 0 ? 30 : limit);
    }

    @JavascriptInterface
    public String syncDate(String targetDate) {
        JSONObject res = IntervalsSyncEngine.syncDate(activity, targetDate);
        return res != null ? res.toString() : "{\"success\":false,\"message\":\"No response\"}";
    }

    @JavascriptInterface
    public String getLogs() {
        return IntervalsSyncEngine.getLogsJson(activity);
    }

    @JavascriptInterface
    public String exportLocalBackup() {
        return IntervalsSyncEngine.exportLocalBackup(activity);
    }

    @JavascriptInterface
    public String getCoachData() {
        return IntervalsSyncEngine.getCoachDataJson(activity);
    }

    @JavascriptInterface
    public String getOsaData() {
        return IntervalsSyncEngine.getOsaDataJson(activity);
    }

    @JavascriptInterface
    public void close() {
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                activity.finish();
            }
        });
    }
}
