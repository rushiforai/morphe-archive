package app.morphe.ather;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;

import java.lang.reflect.Constructor;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Shows the rides this patch recorded locally inside the app's own ride list.
 *
 * <p>The app renders that list as {@code List<kotlin.Pair<String, List<RideData>>>}: a date
 * heading plus the rides under it. The server sends no rides while the scooter is in incognito
 * mode, so the list stays empty. This class builds the same structures from the local records so
 * the app's own screen can render them, with its own card layout.
 *
 * <p>The server stays authoritative: when it sends rides, they are used as they are.
 */
public final class RideStats {

    private static final String GROUP_TITLE = "Recorded on this phone";

    private RideStats() {
    }

    /**
     * The groups the app should render. Returns the server groups unchanged when the server sent
     * any ride, so the local records only fill the gap the server leaves.
     */
    public static List<?> withLocalRides(List<?> serverGroups) {
        if (serverGroups != null && !serverGroups.isEmpty()) {
            return serverGroups;
        }
        return localGroups();
    }

    /** The locally recorded rides as one app-renderable group, empty when there are none. */
    public static List<?> localGroups() {
        List<Object> groups = new ArrayList<>();
        try {
            List<Object> rides = localRides();
            if (rides.isEmpty()) {
                return groups;
            }
            Constructor<?> pair = Class.forName("kotlin.k")
                    .getConstructor(Object.class, Object.class);
            groups.add(pair.newInstance(GROUP_TITLE, rides));
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return groups;
    }

    private static List<Object> localRides() {
        List<Object> rides = new ArrayList<>();
        try {
            Constructor<?> rideData = Class.forName("com.ather.ridestories.ui.model.RideData")
                    .getConstructor(String.class, String.class, String.class, List.class,
                            String.class, String.class, String.class, String.class,
                            Long.class, Bitmap.class);
            for (String[] record : RideLog.historyRecords()) {
                long start = asLong(record[0]);
                long end = asLong(record[1]);
                long shown = displayTime(record);
                String distance = record[2];
                boolean exact = !"0".equals(record[5]);
                // A ride the app did not watch has no start time, and the time it was noticed is
                // not the ride's time, so its card carries no clock at all.
                rides.add(rideData.newInstance(
                        exact ? range(start, end) : "",
                        (distance == null ? "?" : distance) + " km",
                        exact ? day(shown) : dayOnly(shown),
                        null,
                        odo(record[3]),
                        exact ? clock(start) : "",
                        odo(record[4]),
                        exact ? clock(end) : "",
                        Long.valueOf(rideId(end)),
                        null));
            }
        } catch (Throwable t) {
            // Fall through with whatever was collected.
        }
        return rides;
    }

    /**
     * The id a locally recorded ride is shown under. Ather's ride ids are positive, so a negative
     * id can never collide with one of the server's, and it tells {@link #handleRideClick} that the
     * ride belongs to this patch. The start time is unique per record, so it identifies the ride.
     */
    /**
     * The id a locally recorded ride is shown under. Ather's ride ids are positive, so a negative
     * id can never collide with one of the server's. The time the app first saw the new odometer
     * identifies the ride, and it is unique even when two rides share one observation window.
     */
    public static long rideId(long observedMillis) {
        return -observedMillis;
    }

    /**
     * Handles a tap on a ride card. Returns true when the tapped ride is one of ours, in which case
     * this opens the patch's own ride detail screen. Returns false for every server ride, so the
     * app navigates to its own detail screen as usual.
     */
    public static boolean handleRideClick(Object event) {
        try {
            if (event == null || !"com.ather.ridestories.ui.previousRides.c"
                    .equals(event.getClass().getName())) {
                return false;
            }
            Object value = event.getClass().getField("a").get(event);
            if (!(value instanceof Long)) {
                return false;
            }
            long id = (Long) value;
            if (id >= 0L) {
                return false;
            }
            Context context = MapPref.appContext();
            if (context != null) {
                Intent intent = new Intent(context, MorpheRideActivity.class);
                intent.putExtra("rideId", id);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            }
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static String odo(String value) {
        return value == null ? "" : "Odo " + value + " km";
    }

    private static String range(long start, long end) {
        if (start <= 0L || end <= 0L) {
            return "";
        }
        return clock(start) + " \u2013 " + clock(end);
    }

    private static String day(long millis) {
        return format(millis, "d MMMM, h:mm a");
    }

    /** The day alone, for a ride whose times are not known. */
    private static String dayOnly(long millis) {
        return format(millis, "d MMMM");
    }

    private static String clock(long millis) {
        return format(millis, "h:mm a");
    }

    private static String format(long millis, String pattern) {
        if (millis <= 0L) {
            return "";
        }
        return new SimpleDateFormat(pattern, Locale.US).format(new Date(millis));
    }

    private static long asLong(String value) {
        if (value == null) {
            return 0L;
        }
        try {
            return Long.parseLong(value.trim());
        } catch (NumberFormatException e) {
            return 0L;
        }
    }

    /**
     * The time a locally recorded ride is shown under. An exact ride is dated by its start; a ride
     * the app did not watch is dated by the time the app noticed it, because the window start can
     * be much earlier.
     */
    private static long displayTime(String[] record) {
        return "0".equals(record[5]) ? asLong(record[1]) : asLong(record[0]);
    }

    /**
     * Adds the rides recorded on this phone to the month figures behind "Your month so far".
     * The server keeps no rides for an incognito scooter, so its monthly totals are zero.
     *
     * <p>When the server does report a distance, its figure is kept as it is. Mixing the two would
     * count the same ride twice.
     *
     * @return {String distance, Integer days} when the figures change, or null to keep the
     *         server's values. A null return also keeps the "no rides this month" notice.
     */
    public static Object[] adjustMonth(String distance, Integer days) {
        try {
            Calendar calendar = Calendar.getInstance();
            int year = calendar.get(Calendar.YEAR);
            int month = calendar.get(Calendar.MONTH);
            double localKm = 0.0;
            Set<Integer> localDays = new HashSet<>();
            for (String[] record : RideLog.historyRecords()) {
                long shown = displayTime(record);
                if (shown <= 0L) {
                    continue;
                }
                calendar.setTimeInMillis(shown);
                if (calendar.get(Calendar.YEAR) != year || calendar.get(Calendar.MONTH) != month) {
                    continue;
                }
                Double km = asDouble(record[2]);
                if (km != null) {
                    localKm += km;
                }
                localDays.add(calendar.get(Calendar.DAY_OF_MONTH));
            }
            if (localDays.isEmpty()) {
                return null;
            }
            Double serverKm = asDouble(distance);
            if (serverKm != null && serverKm > 0.0) {
                return null;
            }
            return new Object[]{
                    merge(distance, localKm),
                    Integer.valueOf((days == null ? 0 : days) + localDays.size())};
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Fills the monthly chart with the rides recorded on this phone.
     *
     * <p>The chart is drawn from a list of day entries, each a pair of a day label and a distance.
     * Ather's server sends every day at zero for an incognito scooter, so the bars have nothing to
     * draw. Days the server already reports are left alone.
     *
     * @return a new list with the local distances added, or the input list when nothing changed.
     */
    public static List<?> adjustChart(List<?> entries) {
        try {
            if (entries == null || entries.isEmpty()) {
                return entries;
            }
            Map<Integer, Double> byDay = localKmByDay();
            if (byDay.isEmpty()) {
                return entries;
            }
            Class<?> pairClass = Class.forName("kotlin.k");
            java.lang.reflect.Field keyField = pairClass.getField("a");
            java.lang.reflect.Field valueField = pairClass.getField("b");
            Constructor<?> pair = pairClass.getConstructor(Object.class, Object.class);
            Class<?> dataClass = Class.forName(
                    "com.ather.connectedplatformlib.dataModels.responseModels.MonthlyDistanceData");
            Constructor<?> data = dataClass.getConstructor(double.class, String.class);
            java.lang.reflect.Field meters = dataClass.getField("a");
            List<Object> result = new ArrayList<>();
            boolean changed = false;
            for (Object entry : entries) {
                if (entry == null || !pairClass.isInstance(entry)) {
                    result.add(entry);
                    continue;
                }
                Object value = valueField.get(entry);
                Double km = byDay.get(dayOf(String.valueOf(keyField.get(entry))));
                Double reported = value == null ? null : asDouble(String.valueOf(meters.get(value)));
                if (km == null || (reported != null && reported > 0.0)) {
                    result.add(entry);
                    continue;
                }
                result.add(pair.newInstance(keyField.get(entry),
                        data.newInstance(km * 1000.0, trim(km) + "  km")));
                changed = true;
            }
            return changed ? result : entries;
        } catch (Throwable t) {
            return entries;
        }
    }

    /** The distance recorded on this phone for each day of the current month. */
    private static Map<Integer, Double> localKmByDay() {
        Map<Integer, Double> byDay = new HashMap<>();
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        for (String[] record : RideLog.historyRecords()) {
            long shown = displayTime(record);
            if (shown <= 0L) {
                continue;
            }
            calendar.setTimeInMillis(shown);
            if (calendar.get(Calendar.YEAR) != year || calendar.get(Calendar.MONTH) != month) {
                continue;
            }
            Double km = asDouble(record[2]);
            if (km == null) {
                continue;
            }
            int day = calendar.get(Calendar.DAY_OF_MONTH);
            Double soFar = byDay.get(day);
            byDay.put(day, soFar == null ? km : soFar + km);
        }
        return byDay;
    }

    /** The day of the month in a chart label such as "20th Sep". Returns 0 when there is none. */
    private static int dayOf(String label) {
        if (label == null) {
            return 0;
        }
        for (int i = 0; i < label.length(); i++) {
            if (!Character.isDigit(label.charAt(i))) {
                continue;
            }
            int end = i;
            while (end < label.length() && Character.isDigit(label.charAt(end))) {
                end++;
            }
            int value = Integer.parseInt(label.substring(i, end));
            String tail = label.substring(end).toLowerCase(Locale.US);
            if (tail.startsWith("st") || tail.startsWith("nd")
                    || tail.startsWith("rd") || tail.startsWith("th")) {
                return value >= 1 && value <= 31 ? value : 0;
            }
            i = end - 1;
        }
        return 0;
    }

    /** Puts a total back into the shape the server sent, keeping any prefix, unit or suffix. */
    private static String merge(String original, double extra) {        String text = original == null ? "" : original;
        int start = -1;
        int end = -1;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            boolean numeric = (c >= '0' && c <= '9') || c == '.' || c == ',';
            if (numeric) {
                if (start < 0) {
                    start = i;
                }
                end = i + 1;
            } else if (start >= 0) {
                break;
            }
        }
        if (start < 0) {
            return trim(extra);
        }
        Double base = asDouble(text.substring(start, end).replace(",", ""));
        if (base == null) {
            return trim(extra);
        }
        return text.substring(0, start) + trim(base + extra) + text.substring(end);
    }

    private static String trim(double value) {
        if (value == Math.rint(value)) {
            return String.valueOf((long) value);
        }
        return String.format(Locale.US, "%.1f", value);
    }

    private static Double asDouble(String value) {
        if (value == null) {
            return null;
        }
        try {
            return Double.valueOf(value.trim());
        } catch (NumberFormatException e) {
            return null;
        }
    }
}
