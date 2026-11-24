package app.template.extension.extension;

import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Context;
import android.os.SystemClock;
import android.text.Html;
import android.util.Log;
import android.widget.RemoteViews;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class NavigationWidget extends SpeedWidget {
    private static final String TAG = "QmNavigationWidget";
    private static final int MAX_DISTANCE = 2000;
    private static final int SPEAK_DISTANCE = 250;
    private static final long ALERT_FRESH_MS = 30_000;
    private static final Pattern DISTANCE = Pattern.compile(
            "(?iu)(\\p{Nd}+(?:[.,٫]\\p{Nd}+)?)\\s*(km|mi|ft|yd|m|км|м)(?!\\p{L})");
    private static final Pattern LIMIT = Pattern.compile("(\\d{2,3})$");
    private static final Map<String, Long> spoken = new HashMap<>();
    private static long lastSpokenAt = -10_000;
    private static String rendered = "";
    private static boolean navigating;
    private static int instruction;
    private static int exitNumber;
    private static String turnDistance = "";
    private static volatile String maneuverStreet = "";
    private static volatile String currentStreet = "";
    private static volatile List<Alert> alerts = Collections.emptyList();
    private static volatile long alertTime;

    static ComponentName component(Context context) {
        return new ComponentName(context, NavigationWidget.class);
    }

    static int[] ids(Context context) {
        return AppWidgetManager.getInstance(context).getAppWidgetIds(component(context));
    }

    public static void routeState(boolean active) {
        navigating = active;
        if (!active) {
            instruction = 0;
            exitNumber = 0;
            turnDistance = "";
            maneuverStreet = "";
            alerts = Collections.emptyList();
        }
    }

    public static void routeCleared() { routeState(false); }
    public static void turn(int value) { instruction = value; }
    public static void exit(int value) { exitNumber = value; }
    public static void currentStreet(String name) { currentStreet = name == null ? "" : name.trim(); }

    public static void maneuverStreet(String name, String sign, String secondary, String primary) {
        for (String candidate : new String[]{name, sign, secondary, primary}) {
            if (candidate == null || candidate.isEmpty()) continue;
            String label = Html.fromHtml(candidate, Html.FROM_HTML_MODE_COMPACT).toString()
                    .replaceAll("[\\s\\p{Z}]+", " ").trim();
            String word = label.toLowerCase(Locale.ROOT).replaceAll("[\\p{P}]+$", "").trim();
            if (!word.isEmpty() && !word.equals("then") && !word.equals("next") && !word.equals("sau đó")) {
                maneuverStreet = label;
                return;
            }
        }
        maneuverStreet = "";
    }

    public static void distance(String value, String unit) {
        turnDistance = (value + " " + unit).trim();
    }

    public static void onAlerts(Object repository) {
        try {
            List<?> descriptors = (List<?>) repository.getClass().getMethod("getDescriptorsList").invoke(repository);
            List<Alert> next = new ArrayList<>();
            for (Object descriptor : descriptors) {
                Object info = descriptor.getClass().getMethod("getInfo").invoke(descriptor);
                String icon = string(info, "getIconName").toLowerCase(Locale.ROOT);
                if (icon.isEmpty() || icon.contains("minimum") || icon.contains("min_speed")
                        || icon.contains("speed_min") || icon.contains("minspeed") || icon.contains("speedmin")) continue;
                String title = string(info, "getTitle");
                String distance = string(info, "getDistanceString");
                int meters = meters(distance);
                if (meters < 0) meters = meters(string(info, "getTitleWithDistance"));
                if (meters < 0 || meters > MAX_DISTANCE) continue;
                int type = (Integer) info.getClass().getMethod("getTypeValue").invoke(info);
                Matcher number = LIMIT.matcher(icon);
                int limit = type == 23 && number.find() ? Integer.parseInt(number.group(1)) : 0;
                Object id = descriptor.getClass().getMethod("getAlertId").invoke(descriptor);
                String key = string(id, "getUuid");
                if (key.isEmpty()) key = string(id, "getUniqueId");
                if (key.isEmpty()) key = icon + "|" + title;
                next.add(new Alert(key, icon, title, meters, limit, type));
            }
            next.sort(Comparator.comparingInt(alert -> alert.meters));
            alertTime = SystemClock.elapsedRealtime();
            alerts = next;
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Could not read Waze alerts", error);
        }
    }

    private static String string(Object object, String getter) throws ReflectiveOperationException {
        return ((String) object.getClass().getMethod(getter).invoke(object)).trim();
    }

    private static int meters(String distance) {
        Matcher match = DISTANCE.matcher(distance);
        String number = null;
        String unit = null;
        while (match.find()) {
            number = match.group(1).replace(',', '.').replace('٫', '.');
            unit = match.group(2);
        }
        if (number == null) return -1;
        StringBuilder digits = new StringBuilder();
        for (int offset = 0; offset < number.length();) {
            int codePoint = number.codePointAt(offset);
            offset += Character.charCount(codePoint);
            digits.append(codePoint == '.' ? '.' : (char) ('0' + Character.digit(codePoint, 10)));
        }
        double value = Double.parseDouble(digits.toString());
        switch (unit.toLowerCase(Locale.ROOT)) {
            case "km": case "км": value *= 1000; break;
            case "mi": value *= 1609.344; break;
            case "ft": value *= 0.3048; break;
            case "yd": value *= 0.9144; break;
            default: break;
        }
        return (int) Math.round(value);
    }

    static void render(Context context, String speed, String units, String limit, String status,
                       boolean usSign, boolean currentFix, boolean force) {
        int[] ids = ids(context);
        if (ids.length == 0) return;
        long now = SystemClock.elapsedRealtime();
        List<Alert> selected = new ArrayList<>();
        Set<String> types = new HashSet<>();
        boolean showRoadData = currentFix && engineRunning();
        if (showRoadData && now - alertTime <= ALERT_FRESH_MS) {
            for (Alert alert : alerts) {
                if (alert.limit > 0 && limit.equals(Integer.toString(alert.limit))) continue;
                String group = alert.limit > 0 ? "speed" : alert.type == 3 ? "traffic" : alert.icon;
                if (types.add(group)) selected.add(alert);
                if (selected.size() == 4) break;
            }
        }
        int turn = showRoadData && navigating ? instruction : 0;
        String distance = turn > 0 ? turnDistance : "";
        String street = showRoadData ? (navigating ? maneuverStreet : currentStreet) : "";
        int exit = turn >= 6 && turn <= 15 ? exitNumber : 0;
        maybeSpeak(context, selected, now, units);
        String key = speed + "|" + units + "|" + limit + "|" + status + "|" + usSign + "|" + turn
                + "|" + distance + "|" + street + "|" + exit + "|" + selected;
        if (!force && rendered.equals(key)) return;
        AppWidgetManager manager = AppWidgetManager.getInstance(context);
        int layout = context.getResources().getIdentifier("qm_navigation_widget", "layout", context.getPackageName());
        int container = context.getResources().getIdentifier("qm_navigation_display", "id", context.getPackageName());
        if (layout == 0 || container == 0) return;
        android.graphics.Bitmap bitmap = NavigationWidgetPanel.draw(context, turn, exit, distance, street,
                speed, units, limit, usSign, selected);
        StringBuilder description = new StringBuilder();
        if (turn > 0) description.append(NavigationWidgetPanel.direction(turn)).append(' ')
                .append(distance).append(' ').append(street).append(". ");
        else if (!street.isEmpty()) description.append(street).append(". ");
        description.append("Speed ").append(speed).append(' ').append(units).append(". Speed limit ").append(limit);
        for (Alert alert : selected) description.append(". ").append(alert.title).append(' ').append(formatDistance(alert.meters, units));
        if (!status.isEmpty()) description.append(". ").append(status);
        for (int id : ids) {
            RemoteViews view = new RemoteViews(context.getPackageName(), layout);
            view.setImageViewBitmap(container, bitmap);
            view.setContentDescription(container, description);
            view.setOnClickPendingIntent(container, controls(context, id));
            manager.updateAppWidget(id, view);
        }
        rendered = key;
    }

    private static void maybeSpeak(Context context, List<Alert> visible, long now, String units) {
        if (visible.isEmpty() || now - lastSpokenAt < 8_000) return;
        spoken.values().removeIf(time -> now - time >= 180_000);
        for (Alert alert : visible) {
            if (alert.meters > SPEAK_DISTANCE || spoken.containsKey(alert.key)) continue;
            try {
                if (!voiceAllowed(soundMode())) return;
                String title = alert.title;
                if (alert.limit > 0 && (title.isEmpty() || title.matches("[\\p{Nd} ]+"))) {
                    Locale language = context.getResources().getConfiguration().getLocales().get(0);
                    title = "vi".equals(language.getLanguage())
                            ? "Giới hạn tốc độ phía trước là " + alert.limit + " " + units
                            : "Speed limit changes to " + alert.limit + " " + units + " ahead";
                }
                if (title.isEmpty()) continue;
                String announcement = title;
                queueSpeech(() -> {
                    try {
                        if (voiceAllowed(soundMode())) speak(announcement);
                    } catch (RuntimeException | LinkageError error) {
                        Log.w(TAG, "Waze could not read the upcoming alert", error);
                    }
                });
                spoken.put(alert.key, now);
                lastSpokenAt = now;
            } catch (RuntimeException | LinkageError error) {
                Log.w(TAG, "Waze alert audio is unavailable", error);
            }
            return;
        }
    }

    static boolean voiceAllowed(String mode) {
        if (mode == null) return false;
        switch (mode.trim().toLowerCase(Locale.ROOT)) {
            case "yes": case "alerts": case "brief": case "smart": return true;
            default: return false;
        }
    }

    // Morphe binds these to Waze's guidance setting and native sound queue.
    private static boolean engineRunning() { return false; }
    private static String soundMode() { return null; }
    private static void queueSpeech(Runnable task) {}
    private static void speak(String text) {}

    static String formatDistance(int meters, String units) {
        if ("mph".equals(units)) {
            if (meters >= 160) return decimal(meters / 1609.344) + " mi";
            return Math.round(meters * 3.28084) + " ft";
        }
        if (meters >= 1000) return decimal(meters / 1000.0) + " km";
        return meters + " m";
    }

    private static String decimal(double value) {
        NumberFormat format = NumberFormat.getNumberInstance();
        format.setMaximumFractionDigits(1);
        return format.format(value);
    }

    static final class Alert {
        final String key;
        final String icon;
        final String title;
        final int meters;
        final int limit;
        final int type;

        Alert(String key, String icon, String title, int meters, int limit, int type) {
            this.key = key;
            this.icon = icon;
            this.title = title;
            this.meters = meters;
            this.limit = limit;
            this.type = type;
        }

        @Override public String toString() { return key + ":" + icon + ":" + title + ":" + meters + ":" + limit; }
    }
}
