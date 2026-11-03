package semicoloncolonel.mobilestream.extension.recgov;

import android.app.Application;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.lang.reflect.Method;
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
 * them. Each helper adds them to text the app already shows from the same
 * data. Nothing is requested, and nothing about booking changes.
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

    private static String offset(Object days, Object hours) {
        int d = days instanceof Integer ? (Integer) days : 0;
        int h = hours instanceof Integer ? (Integer) hours : 0;
        StringBuilder text = new StringBuilder();
        if (d != 0) {
            text.append(d).append(d == 1 ? " day" : " days");
        }
        if (h != 0) {
            if (text.length() > 0) {
                text.append(", ");
            }
            text.append(h).append(h == 1 ? " hour" : " hours");
        }
        return text.length() == 0 ? "at the start" : text + " before";
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
                        .append(" the tour.</p>");
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

    /** A ticket lottery screen's state was created: shows the lottery's numbers once. */
    public static void showLottery(Object lottery) {
        try {
            Object id = get(lottery, "getLotteryInstanceId");
            if (lottery == null || !shownLotteries.add(id == null ? lottery : id)) {
                return;
            }
            Object applications = get(lottery, "getTotalApplicationCount");
            Object tickets = get(lottery, "getTotalApplicationTicketCount");
            Object awarded = get(lottery, "getFulfilledTicketCount");
            Object perAccount = get(lottery, "getMaxReservationsPerAccount");
            String results = format((Date) get(lottery, "getResultsAvailableTime"));
            StringBuilder text = new StringBuilder("Lottery");
            if (applications != null) {
                text.append(": ").append(applications).append(" applications");
                if (tickets != null) {
                    text.append(" for ").append(tickets).append(" tickets");
                }
            }
            if (awarded != null) {
                text.append(", ").append(awarded).append(" tickets awarded");
            }
            if (perAccount != null) {
                text.append(", limit ").append(perAccount).append(" per account");
            }
            if (results != null) {
                text.append(". Results ").append(results);
            }
            if (text.length() == "Lottery".length()) {
                return;
            }
            final String message = text.toString();
            Log.i(TAG, message);
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    Application app = (Application) Class.forName("android.app.ActivityThread")
                            .getMethod("currentApplication").invoke(null);
                    Toast.makeText(app, message, Toast.LENGTH_LONG).show();
                } catch (Throwable t) {
                    Log.w(TAG, "lottery toast: " + t);
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "lottery: " + t);
        }
    }
}
