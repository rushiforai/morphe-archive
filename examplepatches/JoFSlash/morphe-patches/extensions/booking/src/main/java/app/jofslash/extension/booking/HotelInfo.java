package app.jofslash.extension.booking;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * What the patches need from the app's Hotel (com.booking.common.data.Hotel) and search objects,
 * read by reflection so nothing breaks at build time when the app changes.
 */
public final class HotelInfo {
    static final String TAG = "JoFBookingPrices";

    public int id;
    public String name;
    public String city;
    public String address;
    /** The full address as Booking.com formats it ("10 Grundsteingasse, 16. Ottakring, 1160 Vienna, Austria"). */
    public String formattedAddress;
    /** NaN when not known. */
    public double latitude = Double.NaN, longitude = Double.NaN;
    /** Total price for the stay as the app shows it, or NaN. */
    public double price = Double.NaN;
    /** Crossed-out ("original") total price, or NaN. */
    public double strike = Double.NaN;
    public String currency;
    /**
     * "genius" or "mobile" when the price includes a Genius or app-only discount, which the
     * crossed-out price leaves out: a real discount for this user. Null otherwise.
     */
    public String memberDiscount;
    /** The overall review score out of 10 and the number of reviews, or NaN and 0. */
    public double reviewScore = Double.NaN;
    public int reviewCount;

    private HotelInfo() {
    }

    /** A price fetched without a Hotel object, by the Price watch. */
    static HotelInfo ofPrice(int id, String name, double price, double strike, String currency) {
        HotelInfo info = new HotelInfo();
        info.id = id;
        info.name = name;
        info.price = price;
        info.strike = strike;
        info.currency = currency;
        return info;
    }

    /** Reads a Hotel object. Returns null when it isn't one or has no id. */
    public static HotelInfo of(Object hotel) {
        if (hotel == null) return null;
        try {
            HotelInfo info = new HotelInfo();
            Object id = call(hotel, "getHotelId");
            if (!(id instanceof Integer) || (Integer) id <= 0) return null;
            info.id = (Integer) id;
            info.name = str(call(hotel, "getHotelName"));
            info.city = str(call(hotel, "getCity"));
            info.address = str(call(hotel, "getAddress"));
            Object location = call(call(hotel, "getPropertyInfo"), "getLocation");
            info.formattedAddress = str(call(location, "getFormattedAddress"));
            Object latitude = call(hotel, "getLatitude");
            Object longitude = call(hotel, "getLongitude");
            if (latitude instanceof Double && longitude instanceof Double
                    && ((Double) latitude != 0 || (Double) longitude != 0)) {
                info.latitude = (Double) latitude;
                info.longitude = (Double) longitude;
            }
            Object breakdown = field(hotel, "compositePriceBreakdown");
            if (breakdown != null) {
                Object gross = call(breakdown, "getGrossAmount");
                if (gross == null) gross = field(breakdown, "grossAmount");
                double value = money(gross);
                if (value > 0) {
                    info.price = value;
                    info.currency = str(call(gross, "getCurrency"));
                }
                Object strike = call(breakdown, "getStrikethroughPrice");
                if (strike == null) strike = field(breakdown, "strikethroughPrice");
                double strikeValue = money(strike);
                if (strikeValue > 0 && info.currency != null
                        && info.currency.equals(str(call(strike, "getCurrency")))) {
                    info.strike = strikeValue;
                }
                info.memberDiscount = memberDiscount(breakdown);
            }
            Object score = call(hotel, "getReviewScore");
            Object count = call(hotel, "getReviewsNumber");
            if (score instanceof Double && (Double) score > 0) info.reviewScore = (Double) score;
            if (count instanceof Integer) info.reviewCount = (Integer) count;
            return info;
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't read the hotel", t);
            return null;
        }
    }

    /**
     * The member discount in a price breakdown: its discount items (BProductPrice of kind
     * "discount") and its benefit badges (BBadge, such as "Mobile Rate").
     */
    private static String memberDiscount(Object breakdown) {
        String found = memberDiscount(call(breakdown, "getAllDiscounts"), null);
        return memberDiscount(call(breakdown, "getBenefits"), found);
    }

    /**
     * "genius" when one of [items] (discounts or badges, by identifier) is a Genius discount, else
     * "mobile" for an app-only rate, else [found].
     */
    static String memberDiscount(Object items, String found) {
        if (!(items instanceof Iterable) || "genius".equals(found)) return found;
        for (Object item : (Iterable<?>) items) {
            String id = str(call(item, "getIdentifier"));
            if (id == null) continue;
            id = id.toLowerCase(java.util.Locale.ROOT);
            if (id.contains("genius")) return "genius";
            if (id.contains("mobile")) found = "mobile";
        }
        return found;
    }

    public boolean hasPrice() {
        return !Double.isNaN(price) && currency != null && !currency.isEmpty();
    }

    private static double money(Object money) {
        if (money == null) return Double.NaN;
        Object value = call(money, "getValue");
        return value instanceof Double ? (Double) value : Double.NaN;
    }

    static String str(Object o) {
        return o == null ? null : o.toString();
    }

    /** Calls a method without parameters, looking through the class and its superclasses. */
    static Object call(Object target, String name) {
        if (target == null) return null;
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod(name);
                m.setAccessible(true);
                return m.invoke(target);
            } catch (NoSuchMethodException ignored) {
                // Try the superclass.
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }

    static Object field(Object target, String name) {
        if (target == null) return null;
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (NoSuchFieldException ignored) {
                // Try the superclass.
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }
}
