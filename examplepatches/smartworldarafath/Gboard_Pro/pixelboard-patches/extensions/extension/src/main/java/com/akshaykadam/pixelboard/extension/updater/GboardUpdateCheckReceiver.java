package com.akshaykadam.pixelboard.extension.updater;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;

import com.akshaykadam.pixelboard.extension.BuildConfig;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class GboardUpdateCheckReceiver extends BroadcastReceiver {

    private static final String TAG = "GboardProUpdateRecv";
    public static final String ACTION_CHECK_UPDATE = "com.akshaykadam.pixelboard.action.CHECK_UPDATE";
    public static final long INTERVAL_8_HOURS_MS = 8L * 60L * 60L * 1000L; // 8 hours in milliseconds
    private static final String PREF_UPDATES = "gboard_pro_updates";
    private static final String KEY_LAST_NOTIFIED_VERSION = "last_notified_release_version";

    @Override
    public void onReceive(final Context context, Intent intent) {
        if (context == null) return;

        boolean autoCheck = PixelBoardUpdateManager.isAutoCheckEnabled(context);
        if (!autoCheck) {
            cancelUpdateCheck(context);
            return;
        }

        // Reschedule next check in 8 hours to ensure persistent execution across Doze and reboots
        scheduleUpdateCheck(context);

        // Perform background check
        new Thread(new Runnable() {
            @Override
            public void run() {
                queryAndNotifyIfUpdateAvailable(context);
            }
        }, "GboardProBackgroundUpdateCheck").start();
    }

    public static void scheduleUpdateCheck(Context context) {
        if (context == null) return;
        try {
            AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            if (alarmManager == null) return;

            Intent intent = new Intent(context, GboardUpdateCheckReceiver.class);
            intent.setAction(ACTION_CHECK_UPDATE);

            int flags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                flags |= PendingIntent.FLAG_IMMUTABLE;
            }
            PendingIntent pendingIntent = PendingIntent.getBroadcast(context, 901, intent, flags);

            long triggerAt = SystemClock.elapsedRealtime() + INTERVAL_8_HOURS_MS;

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                alarmManager.setAndAllowWhileIdle(AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAt, pendingIntent);
            } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
                alarmManager.setExact(AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAt, pendingIntent);
            } else {
                alarmManager.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAt, pendingIntent);
            }
            Log.i(TAG, "Scheduled next update check in 8 hours");
        } catch (Throwable t) {
            Log.w(TAG, "Failed to schedule update check alarm", t);
        }
    }

    public static void cancelUpdateCheck(Context context) {
        if (context == null) return;
        try {
            AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            if (alarmManager == null) return;

            Intent intent = new Intent(context, GboardUpdateCheckReceiver.class);
            intent.setAction(ACTION_CHECK_UPDATE);

            int flags = PendingIntent.FLAG_NO_CREATE;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                flags |= PendingIntent.FLAG_IMMUTABLE;
            }
            PendingIntent pendingIntent = PendingIntent.getBroadcast(context, 901, intent, flags);
            if (pendingIntent != null) {
                alarmManager.cancel(pendingIntent);
                pendingIntent.cancel();
            }
            Log.i(TAG, "Cancelled 8-hour update check alarm");
        } catch (Throwable t) {
            Log.w(TAG, "Failed to cancel update check alarm", t);
        }
    }

    private static void queryAndNotifyIfUpdateAvailable(Context context) {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(PixelBoardUpdateManager.GITHUB_REPO_API);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Gboard-Pro-Android-App");
            conn.setRequestProperty("Accept", "application/vnd.github.v3+json");
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(15000);
            conn.setDoInput(true);

            int code = conn.getResponseCode();
            if (code != 200) {
                Log.w(TAG, "GitHub API returned HTTP " + code);
                return;
            }

            InputStream is = conn.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append('\n');
            }
            reader.close();

            JSONObject json = new JSONObject(sb.toString());
            String tagName = json.optString("tag_name", "");
            String title = json.optString("name", "");
            String body = json.optString("body", "");

            String remoteVersion = tagName.startsWith("v") ? tagName.substring(1) : tagName;
            String currentVersion = BuildConfig.PATCH_VERSION;

            if (isNewerVersion(remoteVersion, currentVersion)) {
                SharedPreferences prefs = context.getSharedPreferences(PREF_UPDATES, Context.MODE_PRIVATE);
                String lastNotified = prefs.getString(KEY_LAST_NOTIFIED_VERSION, "");

                if (!remoteVersion.equals(lastNotified)) {
                    prefs.edit().putString(KEY_LAST_NOTIFIED_VERSION, remoteVersion).apply();
                    GboardNotificationHelper.showUpdateNotification(context, remoteVersion, title, body);
                    Log.i(TAG, "Update available: v" + remoteVersion + ". Notification posted.");
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error checking for updates in background", t);
        } finally {
            if (conn != null) {
                try {
                    conn.disconnect();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static boolean isNewerVersion(String remote, String current) {
        if (remote == null || remote.trim().isEmpty()) return false;
        if (current == null || current.trim().isEmpty()) return true;

        String[] rParts = remote.split("-")[0].split("\\.");
        String[] cParts = current.split("-")[0].split("\\.");

        int len = Math.max(rParts.length, cParts.length);
        for (int i = 0; i < len; i++) {
            int r = (i < rParts.length) ? parsePart(rParts[i]) : 0;
            int c = (i < cParts.length) ? parsePart(cParts[i]) : 0;
            if (r > c) return true;
            if (r < c) return false;
        }
        return false;
    }

    private static int parsePart(String s) {
        try {
            return Integer.parseInt(s.replaceAll("[^0-9]", ""));
        } catch (Throwable t) {
            return 0;
        }
    }
}
