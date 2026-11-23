package app.jofslash.extension.booking;

import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * Checks a crossed-out ("original") price against the prices saved on this phone for the same
 * stay: same hotel, dates, adults, rooms and currency. Used by the line under the price on the
 * property page (Check crossed-out prices).
 *
 * <p>The saved price is the hotel's headline price, the one the property page shows: the
 * cheapest room for the stay, total for all nights. The crossed-out price on the property page
 * belongs to that same price, so the two compare like with like. Prices of single rooms on the
 * room list are not saved and not checked.
 */
final class StrikeCheck {
    private StrikeCheck() {
    }

    private static final long DAY = 24L * 60 * 60 * 1000;
    /** Only prices seen this recently count: a crossed-out price claims a recent price. */
    static final long WINDOW_DAYS = 30;
    /** Fewer saved prices than this, or all on one day, is too little to say anything. */
    static final int MIN_PRICES = 3;
    static final int MIN_DAYS = 2;
    /** A saved price this close to the crossed-out one counts as having seen it. */
    private static final double SEEN_TOLERANCE = 0.02;

    enum Tone { QUIET, NEUTRAL, BAD }

    static final class Verdict {
        final String text;
        final Tone tone;

        Verdict(String text, Tone tone) {
            this.text = text;
            this.tone = tone;
        }
    }

    /**
     * @param rows the saved prices for this stay (any order); rows of other stays are ignored.
     * @return null when the hotel shows no crossed-out price.
     */
    static Verdict check(HotelInfo hotel, Stay stay, List<PriceDb.Row> rows, long now) {
        if (hotel == null || Double.isNaN(hotel.strike) || !hotel.hasPrice()) return null;
        String currency = hotel.currency;
        String strike = Panel.money(hotel.strike, currency);

        // A Genius or app-only discount is real for this user. The saved prices are this user's
        // own (already discounted) prices, so they say nothing about the crossed-out price.
        if ("genius".equals(hotel.memberDiscount)) {
            return new Verdict(String.format(Strings.STRIKE_GENIUS, strike), Tone.NEUTRAL);
        }
        if ("mobile".equals(hotel.memberDiscount)) {
            return new Verdict(String.format(Strings.STRIKE_MOBILE, strike), Tone.NEUTRAL);
        }

        int count = 0, crossed = 0;
        double min = Double.MAX_VALUE, max = -1;
        long maxTime = 0, first = Long.MAX_VALUE;
        Set<Long> days = new HashSet<>();
        if (rows != null && stay != null) {
            for (PriceDb.Row r : rows) {
                if (r.hotelId != hotel.id || !r.checkIn.equals(stay.checkIn) || !r.checkOut.equals(stay.checkOut)
                        || r.adults != stay.adults || r.rooms != stay.rooms || !currency.equals(r.currency)
                        || r.time < now - WINDOW_DAYS * DAY) {
                    continue;
                }
                count++;
                if (!Double.isNaN(r.strike)) crossed++;
                if (r.price < min) min = r.price;
                if (r.price >= max) {
                    max = r.price;
                    maxTime = r.time;
                }
                first = Math.min(first, r.time);
                days.add(r.time / DAY);
            }
        }
        if (count < MIN_PRICES || days.size() < MIN_DAYS) {
            return new Verdict(count == 0 ? String.format(Strings.STRIKE_FEW_NONE, strike)
                    : String.format(Locale.getDefault(), Strings.STRIKE_FEW, strike, count), Tone.QUIET);
        }
        if (max >= hotel.strike * (1 - SEEN_TOLERANCE) - 0.5) {
            return new Verdict(String.format(Strings.STRIKE_SEEN, strike, Panel.money(max, currency),
                    Panel.day(maxTime)), Tone.NEUTRAL);
        }
        boolean one = max - min < 0.5;
        String text = String.format(Locale.getDefault(), one ? Strings.STRIKE_NEVER_ONE_PRICE : Strings.STRIKE_NEVER,
                strike, Panel.money(min, currency), Panel.money(max, currency), Panel.day(first), count);
        // Crossed out on (nearly) every check: the "discount" is the normal price.
        if (crossed >= MIN_PRICES && crossed * 5 >= count * 4) {
            text += String.format(Locale.getDefault(), Strings.STRIKE_ALWAYS, crossed);
        }
        return new Verdict(text, Tone.BAD);
    }

    static int color(Panel.Colors colors, Tone tone) {
        switch (tone) {
            case BAD:
                return colors.bad;
            case NEUTRAL:
                return colors.text;
            default:
                return colors.secondaryText;
        }
    }
}
