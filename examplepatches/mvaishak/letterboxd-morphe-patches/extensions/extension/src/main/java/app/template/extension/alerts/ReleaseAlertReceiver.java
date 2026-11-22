package app.template.extension.alerts;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.LinkedHashMap;
import java.util.Map;

public final class ReleaseAlertReceiver extends BroadcastReceiver {
    private static final String CHANNEL = "morphe_film_releases";
    private static final String PREFS = AlertBackup.RELEASE_STORE;

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static String filmPrefix(String filmId) {
        return filmId + "\n";
    }

    static Map<String, ReleaseAlert> saved(Context context, String filmId) {
        Map<String, ReleaseAlert> alerts = new LinkedHashMap<>();
        String prefix = filmPrefix(filmId);
        for (Map.Entry<String, ?> entry : prefs(context).getAll().entrySet()) {
            if (!entry.getKey().startsWith(prefix)) continue;
            try {
                ReleaseAlert alert = decode(new JSONObject((String) entry.getValue()));
                alerts.put(alert.key(), alert);
            } catch (JSONException | RuntimeException e) {
                Log.w("MorpheReleaseAlerts", "Could not read a saved release", e);
            }
        }
        return alerts;
    }

    static boolean save(Context context, String filmId, String title, String url,
                        Map<String, ReleaseAlert> shown, Map<String, ReleaseAlert> selected) {
        SharedPreferences.Editor edit = prefs(context).edit();
        String prefix = filmPrefix(filmId);
        for (String key : shown.keySet()) {
            if (!selected.containsKey(key)) edit.remove(prefix + key);
        }
        for (ReleaseAlert alert : selected.values()) {
            try {
                JSONObject value = new JSONObject();
                value.put("date", alert.date.toString());
                value.put("type", alert.type);
                value.put("label", alert.label);
                value.put("countryCode", alert.countryCode);
                value.put("country", alert.country);
                value.put("note", alert.note);
                value.put("title", title);
                value.put("url", url);
                edit.putString(prefix + alert.key(), value.toString());
            } catch (JSONException e) {
                return false;
            }
        }
        if (!edit.commit()) return false;
        schedule(context, false);
        return true;
    }

    public static Map<String, java.util.List<SavedAlert>> all(Context context) {
        Map<String, java.util.List<SavedAlert>> films = new java.util.LinkedHashMap<>();
        for (Map.Entry<String, ?> entry : prefs(context).getAll().entrySet()) {
            try {
                JSONObject value = new JSONObject((String) entry.getValue());
                ReleaseAlert alert = decode(value);
                String filmId = entry.getKey().split("\n", 2)[0];
                films.computeIfAbsent(filmId, ignored -> new java.util.ArrayList<>())
                        .add(new SavedAlert(entry.getKey(), filmId, value.getString("title"), alert));
            } catch (JSONException | RuntimeException e) {
                Log.w("MorpheReleaseAlerts", "Could not read a saved release", e);
            }
        }
        for (java.util.List<SavedAlert> alerts : films.values()) {
            alerts.sort(java.util.Comparator.comparing(item -> item.alert.date));
        }
        return films;
    }

    public static final class SavedAlert {
        public final String key;
        public final String filmId;
        public final String title;
        public final ReleaseAlert alert;

        SavedAlert(String key, String filmId, String title, ReleaseAlert alert) {
            this.key = key;
            this.filmId = filmId;
            this.title = title;
            this.alert = alert;
        }

        public String date() { return alert.date.format(
                java.time.format.DateTimeFormatter.ofPattern("d MMM yyyy", java.util.Locale.ENGLISH)); }
        public String description() { return alert.description(); }
    }

    public static boolean remove(Context context, String key) {
        boolean saved = prefs(context).edit().remove(key).commit();
        if (saved) schedule(context, false);
        return saved;
    }

    // Manual check sends selected releases whose calendar date is today or earlier.
    // Future selections keep their original schedule.
    public static int checkNow(Context context) {
        if (!notificationsEnabled(context)) return -1;
        SharedPreferences stored = prefs(context);
        LocalDate today = LocalDate.now();
        int delivered = 0;
        SharedPreferences.Editor edit = stored.edit();
        for (Map.Entry<String, ?> entry : stored.getAll().entrySet()) {
            try {
                JSONObject value = new JSONObject((String) entry.getValue());
                ReleaseAlert alert = decode(value);
                if (alert.date.isAfter(today)) continue;
                notify(context, entry.getKey(), alert, value);
                edit.remove(entry.getKey());
                delivered++;
            } catch (JSONException | RuntimeException e) {
                Log.w("MorpheReleaseAlerts", "Could not deliver a saved release", e);
            }
        }
        if (delivered > 0 && !edit.commit()) {
            Log.w("MorpheReleaseAlerts", "Could not clear delivered releases");
        }
        schedule(context, false);
        return delivered;
    }

    private static ReleaseAlert decode(JSONObject data) throws JSONException {
        return new ReleaseAlert(LocalDate.parse(data.getString("date")), data.getString("type"),
                data.getString("label"), data.getString("countryCode"), data.getString("country"),
                data.getString("note"));
    }

    static boolean notificationsEnabled(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        NotificationChannel channel = manager.getNotificationChannel(CHANNEL);
        return manager.areNotificationsEnabled()
                && (channel == null || channel.getImportance() != NotificationManager.IMPORTANCE_NONE);
    }

    static void openSettings(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Intent settings = new Intent(android.provider.Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                .putExtra(android.provider.Settings.EXTRA_APP_PACKAGE, context.getPackageName());
        if (manager.areNotificationsEnabled() && manager.getNotificationChannel(CHANNEL) != null) {
            settings.setAction(android.provider.Settings.ACTION_CHANNEL_NOTIFICATION_SETTINGS)
                    .putExtra(android.provider.Settings.EXTRA_CHANNEL_ID, CHANNEL);
        }
        context.startActivity(settings);
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        schedule(context, true);
    }

    // Keep one alarm for the next date, regardless of how many releases the user selects.
    // Recompute from calendar dates on boot, app update, clock and time-zone changes.
    static void schedule(Context context, boolean deliver) {
        SharedPreferences stored = prefs(context);
        Map<String, ?> reminders = stored.getAll();
        AlarmManager alarms = context.getSystemService(AlarmManager.class);
        Intent wake = new Intent(context, ReleaseAlertReceiver.class);
        if (reminders.isEmpty()) {
            PendingIntent existing = PendingIntent.getBroadcast(context, 0, wake,
                    PendingIntent.FLAG_NO_CREATE | PendingIntent.FLAG_IMMUTABLE);
            if (existing != null) alarms.cancel(existing);
            return;
        }

        ZonedDateTime now = ZonedDateTime.now();
        long currentTime = now.toInstant().toEpochMilli();
        boolean enabled = notificationsEnabled(context);
        long next = Long.MAX_VALUE;
        SharedPreferences.Editor edit = null;
        for (Map.Entry<String, ?> entry : reminders.entrySet()) {
            try {
                JSONObject value = new JSONObject((String) entry.getValue());
                ReleaseAlert alert = decode(value);
                Instant trigger = ReleaseAlert.trigger(alert.date, now.toInstant(), now.getZone());
                long due = trigger == null ? currentTime : trigger.toEpochMilli();
                if (due <= currentTime && !enabled) continue;
                if (deliver && due <= currentTime) {
                    notify(context, entry.getKey(), alert, value);
                    if (edit == null) edit = stored.edit();
                    edit.remove(entry.getKey());
                } else {
                    next = Math.min(next, due);
                }
            } catch (JSONException | RuntimeException e) {
                Log.w("MorpheReleaseAlerts", "Could not process a saved release", e);
            }
        }
        if (edit != null) edit.commit();

        PendingIntent pending = PendingIntent.getBroadcast(context, 0, wake, PendingIntent.FLAG_IMMUTABLE);
        if (next == Long.MAX_VALUE) {
            alarms.cancel(pending);
        } else {
            alarms.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, next, pending);
        }
    }

    private static void notify(Context context, String key, ReleaseAlert alert, JSONObject value)
            throws JSONException {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        manager.createNotificationChannel(new NotificationChannel(CHANNEL, "Film release alerts",
                NotificationManager.IMPORTANCE_DEFAULT));

        Intent open = new Intent(Intent.ACTION_VIEW, Uri.parse(value.getString("url")))
                .setPackage(context.getPackageName())
                .setIdentifier(key)
                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        PendingIntent target = PendingIntent.getActivity(context, 0, open,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        String message = alert.message();
        int bell = context.getResources().getIdentifier("morphe_release_alert_bell", "drawable",
                context.getPackageName());
        Notification notification = new Notification.Builder(context, CHANNEL)
                .setSmallIcon(bell)
                .setContentTitle(value.getString("title"))
                .setContentText(message)
                .setStyle(new Notification.BigTextStyle().bigText(message))
                .setContentIntent(target)
                .setAutoCancel(true)
                .build();
        manager.notify(key, 0, notification);
        AlertHistory.record(context, "release:" + key, value.getString("title"), message, value.getString("url"));
    }
}
