package semicoloncolonel.mobilestream.extension.recgov;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * "Show hidden details" for Recreation.gov.
 *
 * The app receives these values with its normal requests but never shows
 * them. Most helpers append the detail to text the app already shows from the
 * same data. The ticket-lottery applicant and award counts are the exception:
 * that screen carries no text to append to, so they are shown in a dialog that
 * stays until the user dismisses it. The lottery's results date is left out
 * because the app already shows it. Nothing is requested, and nothing about
 * booking changes.
 */
@SuppressWarnings("unused")
public final class HiddenDetails {
    private static final String TAG = "MSP-RECGOV";

    private static final Map<String, Object[]> ticketWindows = new HashMap<>();
    private static final Set<Object> shownLotteries = Collections.synchronizedSet(new HashSet<>());

    private HiddenDetails() {
    }

    private static Object get(Object target, String getter) {
        if (target == null) {
            return null;
        }
        try {
            Method method = target.getClass().getMethod(getter);
            return method.invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String format(Date date) {
        return date == null ? null : new SimpleDateFormat("MMM d, h:mm a z", Locale.US).format(date);
    }

    private static Date parseIso(Object value) {
        if (value instanceof Date) {
            return (Date) value;
        }
        if (!(value instanceof String)) {
            return null;
        }
        try {
            return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssXXX", Locale.US).parse((String) value);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Turns a booking window offset into a day and a time. The server counts the offset back
     * from the end of the tour date (midnight after it), in the facility's local time: for a
     * tour on Dec 2, "30 days, 14 hours" is Nov 2 at 10:00 AM and "1 day, -6 hours" is Dec 2 at
     * 6:00 AM.
     */
    private static String offset(Object days, Object hours) {
        int d = days instanceof Integer ? (Integer) days : 0;
        int h = hours instanceof Integer ? (Integer) hours : 0;
        int minutes = 24 * 60 - (d * 24 + h) * 60;
        int day = Math.floorDiv(minutes, 24 * 60);
        int minuteOfDay = Math.floorMod(minutes, 24 * 60);
        String when;
        if (day == 0) {
            when = "on the tour date";
        } else if (day == -1) {
            when = "the day before the tour date";
        } else if (day < 0) {
            when = -day + " days before the tour date";
        } else {
            when = day + (day == 1 ? " day" : " days") + " after the tour date";
        }
        int hour = minuteOfDay / 60;
        String time = (hour % 12 == 0 ? 12 : hour % 12) + String.format(Locale.US, ":%02d", minuteOfDay % 60)
                + (hour < 12 ? " AM" : " PM");
        return when + " at " + time + " local time";
    }

    /**
     * Calls the original text getter, which the patch keeps as {@code <name>$msp}. The patched
     * getter calls the one-argument helpers below, which pass the original text on.
     */
    private static String original(Object target, String getter) {
        try {
            Method method = target.getClass().getDeclaredMethod(getter + "$msp");
            method.setAccessible(true);
            return (String) method.invoke(target);
        } catch (Throwable t) {
            Log.w(TAG, getter + ": " + t);
            return null;
        }
    }

    public static String lotteryResults(Object order) {
        return lotteryResults(order, original(order, "resultsAvailableDescription"));
    }

    public static String bookingSection(Object facility) {
        return bookingSection(facility, original(facility, "getBookingWindowsSection"));
    }

    public static String ticketSlot(Object slot) {
        return ticketSlot(slot, original(slot, "availabilityDesc"));
    }

    public static String venueSlot(Object slot) {
        return venueSlot(slot, original(slot, "toString"));
    }

    /** OrderLottery.resultsAvailableDescription(): adds the deadline to confirm a win. */
    public static String lotteryResults(Object order, String text) {
        try {
            String deadline = format((Date) get(order, "getDeadlineToConfirm"));
            if (deadline != null) {
                return (text == null ? "" : text) + " · confirm by " + deadline;
            }
        } catch (Throwable t) {
            Log.w(TAG, "lottery deadline: " + t);
        }
        return text;
    }

    /** TicketFacility.getBookingWindowsSection(): adds the exact booking window rules. */
    public static String bookingSection(Object facility, String text) {
        try {
            Object configs = get(facility, "getBookingWindowConfigs");
            if (!(configs instanceof Map) || ((Map<?, ?>) configs).isEmpty()) {
                return text;
            }
            StringBuilder rules = new StringBuilder();
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) configs).entrySet()) {
                Object config = entry.getValue();
                String name = String.valueOf(entry.getKey()).toLowerCase(Locale.US);
                rules.append("<p><b>Booking window (").append(name).append("):</b> opens ")
                        .append(offset(get(config, "getOpenDays"), get(config, "getOpenHours")))
                        .append(", closes ")
                        .append(offset(get(config, "getCloseDays"), get(config, "getCloseHours")))
                        .append(".</p>");
            }
            return (text == null ? "" : text) + rules;
        } catch (Throwable t) {
            Log.w(TAG, "booking section: " + t);
            return text;
        }
    }

    /** Ticket availability list (List of TicketsDailyAvailability): remembers each slot's booking windows. */
    public static void rememberTicketDays(Object days) {
        if (!(days instanceof List)) {
            return;
        }
        try {
            for (Object day : (List<?>) days) {
                String key = get(day, "getTourId") + "|" + get(day, "getTourTime");
                ticketWindows.put(key, new Object[]{get(day, "primaryBookingWindow"), get(day, "secondaryBookingWindow")});
            }
        } catch (Throwable t) {
            Log.w(TAG, "ticket windows: " + t);
        }
    }

    /** TicketsSimplifiedAvailableTime.availabilityDesc(): adds when ticket sales for the slot close. */
    public static String ticketSlot(Object slot, String text) {
        try {
            Object[] windows = ticketWindows.get(get(slot, "getTourId") + "|" + get(slot, "getTourTime"));
            if (windows == null) {
                return text;
            }
            for (Object window : windows) {
                Date close = parseIso(get(window, "getCloseTimestamp"));
                if (close != null && close.after(new Date())) {
                    return (text == null ? "" : text) + " · sales close " + format(close);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "ticket slot: " + t);
        }
        return text;
    }

    /** VenueAvailabilityData.toString(): adds when booking for the slot opens or closes. */
    public static String venueSlot(Object slot, String text) {
        try {
            Object window = get(slot, "getBookingWindow");
            Date open = parseIso(get(window, "getOpenTimestamp"));
            Date close = parseIso(get(window, "getCloseTimestamp"));
            Date now = new Date();
            if (open != null && open.after(now)) {
                return text + " · opens " + format(open);
            }
            if (close != null && close.after(now)) {
                return text + " · book by " + format(close);
            }
        } catch (Throwable t) {
            Log.w(TAG, "venue slot: " + t);
        }
        return text;
    }

    private static String count(Object value) {
        if (!(value instanceof Number)) {
            return null;
        }
        return NumberFormat.getIntegerInstance(Locale.US).format(((Number) value).longValue());
    }

    /** The resumed Activity, found through ActivityThread so no extra app hook is needed. */
    private static Activity currentActivity() {
        try {
            Class<?> threadClass = Class.forName("android.app.ActivityThread");
            Object thread = threadClass.getMethod("currentActivityThread").invoke(null);
            Field activitiesField = threadClass.getDeclaredField("mActivities");
            activitiesField.setAccessible(true);
            Object activities = activitiesField.get(thread);
            if (!(activities instanceof Map)) {
                return null;
            }
            for (Object record : ((Map<?, ?>) activities).values()) {
                Field pausedField = record.getClass().getDeclaredField("paused");
                pausedField.setAccessible(true);
                if (!pausedField.getBoolean(record)) {
                    Field activityField = record.getClass().getDeclaredField("activity");
                    activityField.setAccessible(true);
                    Object activity = activityField.get(record);
                    if (activity instanceof Activity) {
                        return (Activity) activity;
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "current activity: " + t);
        }
        return null;
    }

    /**
     * A ticket lottery screen's state was created: shows the lottery's hidden
     * applicant and ticket counts. These four numbers are received but shown
     * nowhere in the app; the results-available date is left out because the
     * screen already shows it. Shown once per lottery as a dialog that stays up
     * until dismissed and has room for every line, not a vanishing toast.
     */
    public static void showLottery(Object lottery) {
        try {
            Object id = get(lottery, "getLotteryInstanceId");
            if (lottery == null || !shownLotteries.add(id == null ? lottery : id)) {
                return;
            }
            String applications = count(get(lottery, "getTotalApplicationCount"));
            String tickets = count(get(lottery, "getTotalApplicationTicketCount"));
            String awarded = count(get(lottery, "getFulfilledTicketCount"));
            String perAccount = count(get(lottery, "getMaxReservationsPerAccount"));

            StringBuilder body = new StringBuilder();
            if (applications != null) {
                body.append("Applications: ").append(applications).append('\n');
            }
            if (tickets != null) {
                body.append("Tickets requested: ").append(tickets).append('\n');
            }
            if (awarded != null) {
                body.append("Tickets awarded: ").append(awarded).append('\n');
            }
            if (perAccount != null) {
                body.append("Limit per account: ").append(perAccount).append('\n');
            }
            if (body.length() == 0) {
                return;
            }
            final String message = body.toString().trim();
            Log.i(TAG, "lottery: " + message.replace('\n', ' '));

            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    Activity activity = currentActivity();
                    if (activity != null && !activity.isFinishing()) {
                        new AlertDialog.Builder(activity)
                                .setTitle("Lottery details")
                                .setMessage(message)
                                .setCancelable(false)
                                .setPositiveButton("Close", null)
                                .show();
                        return;
                    }
                    // No activity to host a dialog: fall back to a toast.
                    Application app = (Application) Class.forName("android.app.ActivityThread")
                            .getMethod("currentApplication").invoke(null);
                    Toast.makeText(app, "Lottery — " + message.replace("\n", ", "), Toast.LENGTH_LONG).show();
                } catch (Throwable t) {
                    Log.w(TAG, "lottery dialog: " + t);
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "lottery: " + t);
        }
    }
}
