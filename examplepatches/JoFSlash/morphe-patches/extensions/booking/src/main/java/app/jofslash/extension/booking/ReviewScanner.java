package app.jofslash.extension.booking;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Scans a list of the app's loaded review objects (com.booking.ugc.review.model.HotelReview) for
 * scam / money / booking-integrity keywords. It reads the review text by reflection (so nothing
 * breaks at build time), matches it with {@link ReviewMatcher} and returns a {@link Result}. It is a heads-up based on
 * keyword matching, not AI and not fake-review detection.
 */
final class ReviewScanner {
    private ReviewScanner() {
    }

    /** One flagged review: a short snippet, the categories it matched, and its severity tier. */
    static final class Flag {
        final String snippet;
        final String labels;
        /** True when the review matched a tier-1 (hard scam / money taken) keyword. */
        final boolean tier1;

        Flag(String snippet, String labels, boolean tier1) {
            this.snippet = snippet;
            this.labels = labels;
            this.tier1 = tier1;
        }
    }

    static final class Result {
        /** How many reviews were looked at (the loaded "recent reviews"). */
        final int scanned;
        /** Flagged reviews, tier-1 (hard scam) first. */
        final List<Flag> flags;
        /** How many of the flags are tier-1. */
        final int tier1Count;

        Result(int scanned, List<Flag> flags, int tier1Count) {
            this.scanned = scanned;
            this.flags = flags;
            this.tier1Count = tier1Count;
        }

        int flaggedCount() {
            return flags.size();
        }
    }

    static Result scan(List<?> reviews) {
        // Keep tier-1 (hard scam) flags first, tier-2 after, each in the order seen.
        List<Flag> tier1Flags = new ArrayList<>();
        List<Flag> tier2Flags = new ArrayList<>();
        int scanned = 0;
        if (reviews != null) {
            for (Object review : reviews) {
                if (review == null) continue;
                scanned++;
                String pros = HotelInfo.str(HotelInfo.call(review, "getPositiveComment"));
                String cons = HotelInfo.str(HotelInfo.call(review, "getNegativeComment"));
                String title = HotelInfo.str(HotelInfo.call(review, "getTitle"));
                // Booking's own English translation, when the app loaded one (rare on this screen).
                Object translation = HotelInfo.call(review, "getHotelReviewTranslation");
                String tPros = HotelInfo.str(HotelInfo.call(translation, "getPositiveComment"));
                String tCons = HotelInfo.str(HotelInfo.call(translation, "getNegativeComment"));
                String tTitle = HotelInfo.str(HotelInfo.call(translation, "getTitle"));

                ReviewMatcher.Match match =
                        ReviewMatcher.match(join(pros, cons, title, tPros, tCons, tTitle));
                if (match == null) continue;

                // Count the review once even if it hit several categories.
                Flag flag = new Flag(snippet(cons, pros, title, tCons, tPros, tTitle),
                        joinLabels(match.labels), match.tier1);
                (match.tier1 ? tier1Flags : tier2Flags).add(flag);
            }
        }
        List<Flag> flags = new ArrayList<>(tier1Flags);
        flags.addAll(tier2Flags);
        return new Result(scanned, flags, tier1Flags.size());
    }

    /** First non-empty text, collapsed to a single line and trimmed to a snippet. */
    private static String snippet(String... parts) {
        for (String part : parts) {
            if (part != null) {
                String clean = part.replaceAll("\\s+", " ").trim();
                if (!clean.isEmpty()) {
                    return clean.length() > 180 ? clean.substring(0, 177) + "…" : clean;
                }
            }
        }
        return "";
    }

    private static String join(String... parts) {
        StringBuilder sb = new StringBuilder();
        for (String part : parts) {
            if (part != null && !part.isEmpty()) {
                sb.append(part).append('\n');
            }
        }
        return sb.toString();
    }

    private static String joinLabels(Set<String> labels) {
        StringBuilder sb = new StringBuilder();
        for (String label : labels) {
            if (sb.length() > 0) sb.append(" · ");
            sb.append(label);
        }
        return sb.toString();
    }
}
