package app.template.extension.watch;

import android.Manifest;
import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.util.Log;

import app.template.extension.alerts.AlertHistory;
import app.template.extension.alerts.AlertBackup;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import static app.template.extension.watch.WatchAvailability.*;

final class WatchAlerts {
    private static final String STORAGE = AlertBackup.STREAMING_STORE;
    private static final String CHANNEL = "morphe_streaming_availability";
    static final int JOB_ID = 0x57415443;
    private static final int REQUEST_PERMISSION = 0x5741;

    static final class Reminder {
        final Film film;
        final String token;
        final Map<String, Set<Integer>> known;

        Reminder(Film film, String token, Map<String, Set<Integer>> known) {
            this.film = film;
            this.token = token;
            this.known = known;
        }
    }

    private WatchAlerts() {}

    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(STORAGE, Context.MODE_PRIVATE);
    }

    static boolean armed(Context context, Film film) {
        return prefs(context).contains(film.id());
    }

    static synchronized boolean arm(Context context, Film film, Map<String, Set<Integer>> baseline) {
        Reminder reminder = new Reminder(film, UUID.randomUUID().toString(), baseline);
        if (!write(context, reminder)) return false;
        if (schedule(context)) return true;
        prefs(context).edit().remove(film.id()).commit();
        return false;
    }

    static synchronized boolean remove(Context context, Film film) {
        boolean removed = prefs(context).edit().remove(film.id()).commit();
        if (removed) stopWhenEmpty(context);
        return removed;
    }

    static Map<String, Reminder> all(Context context) {
        Map<String, Reminder> reminders = new LinkedHashMap<>();
        prefs(context).getAll().forEach((id, value) -> {
            Reminder reminder = decode(id, value.toString());
            if (reminder != null) reminders.put(id, reminder);
        });
        return reminders;
    }

    private static Reminder decode(String id, String raw) {
        if (raw == null) return null;
        try {
            JSONObject json = new JSONObject(raw);
            Film film = new Film(id, json.getString("title"), json.getInt("year"),
                    json.optString("imdb", null), json.optString("tmdb", null),
                    json.optString("justWatch", null));
            JSONObject regions = json.getJSONObject("known");
            Map<String, Set<Integer>> known = new HashMap<>();
            for (var names = regions.keys(); names.hasNext();) {
                String region = names.next();
                JSONArray ids = regions.getJSONArray(region);
                Set<Integer> services = new HashSet<>();
                for (int i = 0; i < ids.length(); i++) services.add(ids.getInt(i));
                known.put(region, services);
            }
            return new Reminder(film, json.getString("token"), known);
        } catch (JSONException error) {
            Log.w("MorpheStreaming", "Could not read a streaming reminder", error);
            return null;
        }
    }

    private static boolean write(Context context, Reminder reminder) {
        Film film = reminder.film;
        try {
            JSONObject known = new JSONObject();
            for (var region : reminder.known.entrySet()) {
                known.put(region.getKey(), new JSONArray(region.getValue()));
            }
            JSONObject json = new JSONObject().put("title", film.title()).put("year", film.year())
                    .put("imdb", film.imdb()).put("tmdb", film.tmdb()).put("justWatch", film.justWatch())
                    .put("token", reminder.token).put("known", known);
            return prefs(context).edit().putString(film.id(), json.toString()).commit();
        } catch (JSONException error) {
            Log.w("MorpheStreaming", "Could not save a streaming reminder", error);
            return false;
        }
    }

    static synchronized void complete(Context context, Reminder checked, Offer arrival) {
        String id = checked.film.id();
        Reminder current = decode(id, prefs(context).getString(id, null));
        if (current == null || !current.token.equals(checked.token)) return;
        if (arrival == null) {
            write(context, checked);
        } else if (notificationsEnabled(context)) {
            post(context, checked, arrival);
            prefs(context).edit().remove(id).commit();
        }
    }

    static boolean schedule(Context context) {
        JobScheduler jobs = context.getSystemService(JobScheduler.class);
        if (jobs.getPendingJob(JOB_ID) != null) return true;
        JobInfo job = new JobInfo.Builder(JOB_ID, new ComponentName(context, WatchAlertJob.class))
                .setPersisted(true)
                .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY)
                .setPeriodic(TimeUnit.DAYS.toMillis(1))
                .build();
        try {
            return jobs.schedule(job) == JobScheduler.RESULT_SUCCESS;
        } catch (RuntimeException error) {
            Log.w("MorpheStreaming", "Could not schedule streaming reminders", error);
            return false;
        }
    }

    static synchronized void stopWhenEmpty(Context context) {
        if (prefs(context).getAll().isEmpty()) {
            context.getSystemService(JobScheduler.class).cancel(JOB_ID);
        }
    }

    static boolean notificationsEnabled(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        NotificationChannel channel = manager.getNotificationChannel(CHANNEL);
        return manager.areNotificationsEnabled()
                && (channel == null || channel.getImportance() != NotificationManager.IMPORTANCE_NONE);
    }

    static void promptNotifications(Context context) {
        if (notificationsEnabled(context)) return;
        WatchViews.dialog(context).setTitle("Enable notifications")
                .setMessage("Allow Letterboxd notifications to receive streaming reminders.")
                .setNegativeButton("Later", null)
                .setPositiveButton("Enable", (dialog, which) -> {
                    Activity activity = activity(context);
                    if (activity != null && Build.VERSION.SDK_INT >= 33
                            && activity.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS)
                            != PackageManager.PERMISSION_GRANTED
                            && !activity.getPreferences(Context.MODE_PRIVATE)
                            .getBoolean("morphe_release_alert_permission_requested", false)) {
                        activity.getPreferences(Context.MODE_PRIVATE).edit()
                                .putBoolean("morphe_release_alert_permission_requested", true).apply();
                        activity.requestPermissions(new String[]{Manifest.permission.POST_NOTIFICATIONS},
                                REQUEST_PERMISSION);
                        return;
                    }
                    NotificationManager manager = context.getSystemService(NotificationManager.class);
                    Intent settings = new Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                            .putExtra(Settings.EXTRA_APP_PACKAGE, context.getPackageName());
                    if (manager.areNotificationsEnabled() && manager.getNotificationChannel(CHANNEL) != null) {
                        settings.setAction(Settings.ACTION_CHANNEL_NOTIFICATION_SETTINGS)
                                .putExtra(Settings.EXTRA_CHANNEL_ID, CHANNEL);
                    }
                    context.startActivity(settings);
                }).show();
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static void post(Context context, Reminder reminder, Offer arrival) {
        Film film = reminder.film;
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        manager.createNotificationChannel(new NotificationChannel(CHANNEL, "Streaming reminders",
                NotificationManager.IMPORTANCE_DEFAULT));
        String key = "morphe.streaming." + film.id();
        String url = "https://boxd.it/" + Uri.encode(film.id());
        String message = "Now streaming on " + arrival.service().name();
        Intent open = new Intent(Intent.ACTION_VIEW, Uri.parse(url))
                .setPackage(context.getPackageName()).setIdentifier(key)
                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        PendingIntent target = PendingIntent.getActivity(context, 0, open,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        Notification notification = new Notification.Builder(context, CHANNEL)
                .setSmallIcon(WatchViews.resource(context, "drawable", "morphe_stream_alert_bell"))
                .setContentTitle(film.title())
                .setContentText(message)
                .setContentIntent(target)
                .setAutoCancel(true)
                .build();
        manager.notify(key, 0, notification);
        AlertHistory.record(context, "stream:" + reminder.token, film.title(), message, url);
    }
}
