package app.jofslash.extension.booking;

import android.app.Activity;
import android.util.Log;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Used by the Hotel contact patch. The property page's data (Booking.com's PropertyPageInfoQuery)
 * includes the property's legal "trader" details, which EU consumer law makes Booking.com show:
 * the business's name, address, email, phone number and registration. The app only shows them deep
 * in the legal information screen. The patch keeps them as they arrive and the Contact tab of the
 * {@link Panel} shows them with the property's address.
 */
@SuppressWarnings("unused")
public final class HotelContact {
    private HotelContact() {
    }

    /** What the property page's data says about the property's trader details. */
    static final class Trader {
        /** False when the host said they're a private person, not a business. */
        boolean isTrader;
        String name;
        String address;
        String email;
        String phone;
        String registration;

        boolean hasContact() {
            return email != null || phone != null;
        }
    }

    /** The trader details by property id, for the last properties opened. */
    private static final Map<Integer, Trader> TRADERS = new LinkedHashMap<Integer, Trader>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Integer, Trader> eldest) {
            return size() > 50;
        }
    };

    /** Called from the property page's constructor. */
    public static void onPropertyPage(Activity activity) {
        PropertyPageButton.attach(activity, false, false, true);
    }

    /**
     * Called with each PropertyInfoQueryResult the app makes from the property page's data. Its
     * importantInfo.traderInfo is null when Booking.com sent no trader details for the property.
     */
    public static void onPropertyInfo(Object result) {
        try {
            if (result == null) return;
            Object id = HotelInfo.call(HotelInfo.call(HotelInfo.field(result, "propertyInfo"), "getPropertyId"), "getValue");
            if (!(id instanceof Integer)) return;
            Object traderInfo = HotelInfo.field(HotelInfo.field(result, "importantInfo"), "traderInfo");
            if (traderInfo == null) {
                Log.i(HotelInfo.TAG, "No trader details for property " + id);
                return;
            }
            Trader trader = new Trader();
            trader.isTrader = Boolean.TRUE.equals(HotelInfo.field(traderInfo, "isTrader"));
            Object details = HotelInfo.field(traderInfo, "contactDetails");
            if (details != null) {
                String company = text(details, "companyLegalName");
                trader.name = company != null ? company : join(" ",
                        text(details, "firstName"), text(details, "middleName"), text(details, "lastName"));
                trader.email = text(details, "email");
                trader.phone = text(details, "phoneNumber");
                String registration = text(details, "registrationNumber");
                String register = text(details, "tradeRegisterName");
                trader.registration = registration == null ? null
                        : register == null ? registration : register + ": " + registration;
                trader.address = address(HotelInfo.field(details, "address"));
            }
            Log.i(HotelInfo.TAG, "Trader details for property " + id + ": trader " + trader.isTrader
                    + ", email " + (trader.email != null) + ", phone " + (trader.phone != null)
                    + ", address " + (trader.address != null));
            synchronized (TRADERS) {
                TRADERS.put((Integer) id, trader);
            }
        } catch (Throwable t) {
            Log.w(HotelInfo.TAG, "Couldn't read the trader details", t);
        }
    }

    /** The trader details of the property, or null when the page's data hasn't arrived or had none. */
    static Trader traderOf(int propertyId) {
        synchronized (TRADERS) {
            return TRADERS.get(propertyId);
        }
    }

    /** "Street 1, 1160 Vienna, Austria", as the app's legal information screen writes it. */
    private static String address(Object address) {
        if (address == null) return null;
        String country = text(address, "countryCode");
        if (country != null) country = new Locale("", country).getDisplayCountry(Locale.getDefault());
        return join(", ",
                join(" ", text(address, "addressLine1"), text(address, "addressLine2")),
                join(" ", text(address, "postalCode"), text(address, "city")),
                text(address, "state"),
                country);
    }

    private static String text(Object target, String field) {
        Object value = HotelInfo.field(target, field);
        if (value == null) return null;
        String s = value.toString().trim();
        return s.isEmpty() ? null : s;
    }

    private static String join(String separator, String... parts) {
        List<String> kept = new ArrayList<>();
        for (String part : parts) {
            if (part != null && !part.trim().isEmpty()) kept.add(part.trim());
        }
        return kept.isEmpty() ? null : android.text.TextUtils.join(separator, kept);
    }
}
