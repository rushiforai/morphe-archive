package semicoloncolonel.mobilestream.extension.nba.misc;

import java.util.ArrayList;
import java.util.List;

/**
 * Removes League Pass upsells from the home and tab feeds.
 *
 * Feeds arrive as lists of com.nba.base.model.FeedItem subclasses. Moshi reads
 * them by class, so the nested class names survive R8 and are matched here.
 */
@SuppressWarnings("unused")
public final class NbaLeaguePassFilter {
    private static final String[] UPSELLS = {
            "$LeaguePassUpsellBannerItem",
            "$GenericUpsellBannerItem",
            "$LeaguePassItem",
    };

    private NbaLeaguePassFilter() {
    }

    /** Called with the feed items before they become cards. */
    public static List<?> filterFeed(List<?> items) {
        if (items == null || items.isEmpty()) return items;
        List<Object> kept = new ArrayList<>(items.size());
        for (Object item : items) {
            if (!isUpsell(item)) kept.add(item);
        }
        return kept.size() == items.size() ? items : kept;
    }

    private static boolean isUpsell(Object item) {
        if (item == null) return false;
        String name = item.getClass().getName();
        for (String upsell : UPSELLS) {
            if (name.endsWith(upsell)) return true;
        }
        return false;
    }
}
