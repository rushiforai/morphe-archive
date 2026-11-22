package app.template.extension.alerts;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.Log;
import android.util.LruCache;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.DialogFragment;

import com.google.android.material.dialog.MaterialAlertDialogBuilder;

import app.template.extension.settings.AccentPresets;
import app.template.extension.settings.SurfaceColors;

import java.lang.reflect.Method;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.Map;

public final class ReleaseAlerts {
    private static final LruCache<String, Map<ReleaseAlert, Object>> releases = new LruCache<>(24);
    private static boolean available;
    public static void markAvailable() { available = true; }
    public static boolean available() { return available; }

    private static final int NOTIFICATION_REQUEST = 0x52A1;

    private ReleaseAlerts() {}

    public static void filmLoaded(Object film) {
        try {
            String id = text(call(film, "getId"));
            if (id.isEmpty()) return;
            Map<ReleaseAlert, Object> dates = new LinkedHashMap<>();
            if (call(film, "getReleases") instanceof Iterable<?> entries) {
                for (Object entry : entries) {
                    try {
                        Object date = call(entry, "getReleaseDate");
                        if (date == null) continue;
                        Object type = call(entry, "getType");
                        Object country = call(entry, "getCountry");
                        String kind = text(call(type, "getValue"));
                        String label = "Theatrical_limited".equals(kind)
                                ? "Theatrical Limited" : text(call(type, "getName"));
                        dates.put(new ReleaseAlert(LocalDate.parse(text(call(date, "getValue"))),
                                kind, label.isEmpty() ? "Other" : label, text(call(country, "getCode")),
                                text(call(country, "getName")), text(call(entry, "getNote"))), entry);
                    } catch (ReflectiveOperationException | RuntimeException e) {
                        Log.w("MorpheReleaseAlerts", "Could not read a release date", e);
                    }
                }
            }
            releases.put(id, dates);
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.w("MorpheReleaseAlerts", "Could not read the film's releases", e);
        }
    }

    public static void bind(DialogFragment sheet) {
        View root = sheet.getView();
        if (root == null) return;
        Context context = root.getContext();
        View row = root.findViewById(resource(context, "morphe_release_alert", "id"));
        if (row == null) return;
        try {
            Object film = call(sheet, "getFilmSummary");
            String id = text(call(film, "getId"));
            String title = text(call(film, "getFullDisplayName"));
            String link = text(call(film, "getLink"));
            if (id.isEmpty()) return;
            String url = link.isEmpty() ? "https://boxd.it/" + id : link;
            row.setVisibility(View.VISIBLE);
            row.setOnClickListener(view -> show(sheet, id, title, url));
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.w("MorpheReleaseAlerts", "Could not attach the Alert action", e);
        }
    }

    public static void resume(Context context) {
        // Also restores scheduling after the user grants permission or restarts a force-stopped app.
        ReleaseAlertReceiver.schedule(context, true);
    }

    public static void restoreSchedule(Context context) {
        if (available()) ReleaseAlertReceiver.schedule(context, false);
    }

    private static void show(DialogFragment sheet, String id, String title, String url) {
        Activity activity = sheet.getActivity();
        if (activity == null) return;
        Context theme = sheet.requireView().getContext();
        MaterialAlertDialogBuilder builder = dialog(theme)
                .setTitle("Release alerts")
                .setNegativeButton("Cancel", null);

        Map<ReleaseAlert, Object> filmDates = releases.get(id);
        Map<String, ReleaseAlert> saved = ReleaseAlertReceiver.saved(theme, id);
        Map<String, ReleaseAlert> shown = new LinkedHashMap<>(saved);
        LocalDate today = LocalDate.now();
        if (filmDates != null) {
            for (ReleaseAlert alert : filmDates.keySet()) {
                if (!alert.date.isBefore(today)) shown.put(alert.key(), alert);
            }
        }

        if (shown.isEmpty()) {
            showDialog(builder.setMessage(filmDates == null
                            ? "Release dates are unavailable. Reopen the film page and try again."
                            : "Letterboxd has no upcoming release dates for this film.")
                    .setNegativeButton("Close", null));
            return;
        }

        Map<String, ReleaseAlert> selected = new LinkedHashMap<>(saved);
        Map<String, Object> nativeReleases = new LinkedHashMap<>();
        if (filmDates != null) {
            filmDates.forEach((alert, entry) -> nativeReleases.put(alert.key(), entry));
        }
        try {
            builder.setView(ReleaseAlertPicker.create(builder.getContext(), shown.values(),
                    nativeReleases, selected));
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.w("MorpheReleaseAlerts", "Could not display release rows", e);
            showDialog(builder.setMessage("Couldn’t open release alerts. Reopen the film and try again.")
                    .setNegativeButton("Close", null));
            return;
        }

        AlertDialog dialog = showDialog(builder.setPositiveButton("Save", null));
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
            // A reminder may have fired while the picker was open.
            Map<String, ReleaseAlert> pending = ReleaseAlertReceiver.saved(theme, id);
            LocalDate date = LocalDate.now();
            selected.values().removeIf(alert -> saved.containsKey(alert.key())
                    ? !pending.containsKey(alert.key()) : alert.date.isBefore(date));
            if (!ReleaseAlertReceiver.save(theme, id, title, url, shown, selected)) {
                Toast.makeText(theme, "Couldn’t save release alerts", Toast.LENGTH_SHORT).show();
                return;
            }
            dialog.dismiss();
            if (!selected.isEmpty() && !ReleaseAlertReceiver.notificationsEnabled(activity)) {
                enableNotifications(activity, theme);
            }
        });
    }

    private static void enableNotifications(Activity activity, Context theme) {
        showDialog(dialog(theme)
                .setTitle("Enable notifications")
                .setMessage("Your selections are saved. Allow Letterboxd notifications to receive release alerts.")
                .setNegativeButton("Later", null)
                .setPositiveButton("Enable", (dialog, which) -> {
                    if (Build.VERSION.SDK_INT >= 33
                            && activity.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS)
                               != PackageManager.PERMISSION_GRANTED
                            && !activity.getPreferences(Context.MODE_PRIVATE)
                                        .getBoolean("morphe_release_alert_permission_requested", false)) {
                        activity.getPreferences(Context.MODE_PRIVATE).edit()
                                .putBoolean("morphe_release_alert_permission_requested", true).apply();
                        activity.requestPermissions(new String[]{Manifest.permission.POST_NOTIFICATIONS},
                                NOTIFICATION_REQUEST);
                    } else {
                        ReleaseAlertReceiver.openSettings(activity);
                    }
                }));
    }

    static MaterialAlertDialogBuilder dialog(Context context) {
        int overlay = resource(context, "ThemeOverlay.Letterboxd.MaterialAlertDialog", "style");
        MaterialAlertDialogBuilder builder = new MaterialAlertDialogBuilder(context, overlay)
                .setBackgroundInsetStart(dp(context, 12))
                .setBackgroundInsetEnd(dp(context, 12));
        Drawable background = builder.getBackground();
        if (background != null) {
            background.mutate().setTint(SurfaceColors.elevated(context));
        }
        return builder;
    }

    static AlertDialog showDialog(MaterialAlertDialogBuilder builder) {
        AlertDialog dialog = builder.show();
        Context context = builder.getContext();
        TextView action = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
        if (action != null) {
            action.setTextColor(AccentPresets.readableText(color(context, "green00E054"),
                    SurfaceColors.elevated(context)));
        }
        return dialog;
    }

    static int color(Context context, String name) {
        return context.getColor(resource(context, name, "color"));
    }

    static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    static int resource(Context context, String name, String type) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    static Object call(Object target, String name) throws ReflectiveOperationException {
        if (target == null) return null;
        Method method = target.getClass().getMethod(name);
        return method.invoke(target);
    }

    private static String text(Object value) {
        return value == null ? "" : value.toString().trim();
    }
}
