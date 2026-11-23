package app.jofslash.extension.booking;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;

/** The dates and guests a price is for. Dates are yyyy-MM-dd. */
public final class Stay {
    public final String checkIn;
    public final String checkOut;
    public final int adults;
    public final int rooms;

    public Stay(String checkIn, String checkOut, int adults, int rooms) {
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.adults = adults;
        this.rooms = rooms;
    }

    /** From com.booking.searchquery.SearchQuery. */
    static Stay ofSearchQuery(Object query) {
        if (query == null) return null;
        String in = date(HotelInfo.call(query, "getCheckInDate"));
        String out = date(HotelInfo.call(query, "getCheckOutDate"));
        Object adults = HotelInfo.call(query, "getAdultsCount");
        Object rooms = HotelInfo.call(query, "getRoomsCount");
        if (in == null || out == null || !(adults instanceof Integer)) return null;
        return new Stay(in, out, (Integer) adults, rooms instanceof Integer ? (Integer) rooms : 1);
    }

    /** From com.booking.propertycard.model.AccommodationSearchConfig. */
    static Stay ofSearchConfig(Object config) {
        if (config == null) return null;
        String in = date(HotelInfo.field(config, "checkInDate"));
        String out = date(HotelInfo.field(config, "checkOutDate"));
        Object adults = HotelInfo.field(config, "adultsCount");
        Object rooms = HotelInfo.field(config, "roomsCount");
        if (in == null || out == null || !(adults instanceof Integer)) return null;
        return new Stay(in, out, (Integer) adults, rooms instanceof Integer ? (Integer) rooms : 1);
    }

    /** From the extras PropertyPageActivity is opened with. */
    static Stay ofIntent(Activity activity) {
        Intent intent = activity.getIntent();
        Bundle extras = intent == null ? null : intent.getExtras();
        if (extras == null) return null;
        String in = date(extras.getSerializable("checkin"));
        String out = date(extras.getSerializable("checkout"));
        int adults = extras.getInt("number_of_guests", -1);
        int rooms = extras.getInt("number_of_rooms", -1);
        if (in == null || out == null || adults <= 0) return null;
        return new Stay(in, out, adults, rooms > 0 ? rooms : 1);
    }

    /** A joda LocalDate prints itself as yyyy-MM-dd. */
    private static String date(Object localDate) {
        if (localDate == null) return null;
        String s = localDate.toString();
        return s.matches("\\d{4}-\\d{2}-\\d{2}") ? s : null;
    }

    static int[] parts(String date) {
        return new int[]{
                Integer.parseInt(date.substring(0, 4)),
                Integer.parseInt(date.substring(5, 7)),
                Integer.parseInt(date.substring(8, 10)),
        };
    }

    static long utcMillis(String date) {
        int[] p = parts(date);
        Calendar c = new GregorianCalendar(TimeZone.getTimeZone("UTC"));
        c.clear();
        c.set(p[0], p[1] - 1, p[2]);
        return c.getTimeInMillis();
    }

    public int nights() {
        try {
            long n = (utcMillis(checkOut) - utcMillis(checkIn)) / 86_400_000L;
            return (int) Math.max(1, n);
        } catch (RuntimeException e) {
            return 1;
        }
    }

    public boolean sameAs(Stay o) {
        return o != null && checkIn.equals(o.checkIn) && checkOut.equals(o.checkOut)
                && adults == o.adults && rooms == o.rooms;
    }

    @Override
    public String toString() {
        return checkIn + ".." + checkOut + " a" + adults + " r" + rooms;
    }
}
