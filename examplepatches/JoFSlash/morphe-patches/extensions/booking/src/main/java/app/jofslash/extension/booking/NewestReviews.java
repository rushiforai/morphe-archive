package app.jofslash.extension.booking;

import android.util.Log;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * "Newest reviews first": the hotel reviews screen opens sorted newest first instead of "Most
 * relevant".
 *
 * <p>The reviews screen keeps its sort and filters in one map, filter id to option ids, and sends
 * each entry to the reviews API as an argument. The sort is the filter "user_sort" (in 71.1), and
 * the screen starts with the map of ReviewsReactor$LoadFilters (empty, or the family filter for a
 * family search). The patch adds the newest-first sort to that map when it has no sort and the
 * user hasn't picked one on this screen, so the first page already comes newest first, and the
 * screen's sort menu shows it. Picking another sort works as before.
 *
 * <p>The sort option is the one Recent rating uses ({@link RecentRating#newestSort()}), and Recent
 * rating is told, so it can use the reviews the screen loads instead of asking the user to sort.
 */
@SuppressWarnings("unused")
public final class NewestReviews {
    private NewestReviews() {
    }

    private static final String TAG = "JoFBookingNewest";

    /** True once the user picked a sort on the current reviews screen. */
    private static volatile boolean picked;
    /** The sort's filter id from the screen's filter metadata, once loaded. */
    private static volatile String sortFilterId;

    /** Called from the reviews activity's constructor. */
    public static void onReviewsActivity() {
        picked = false;
    }

    /**
     * Called first in ReviewsReactor$LoadFilters's constructor with its filters; returns the
     * filters to use instead.
     */
    public static Map onLoadFilters(Map filters) {
        try {
            if (picked) return filters;
            String[] sort = RecentRating.newestSort();
            String key = sortFilterId != null ? sortFilterId : sort[0];
            if (filters != null && (filters.containsKey(key) || filters.containsKey(sort[0]))) return filters;
            @SuppressWarnings("unchecked")
            Map<Object, Object> out = filters == null ? new LinkedHashMap<>() : new LinkedHashMap<Object, Object>(filters);
            List<String> option = new ArrayList<>();
            option.add(sort[1]);
            out.put(sort[0], option);
            RecentRating.onDefaultSort(sort[0], sort[1]);
            Log.i(TAG, "Reviews sorted by " + sort[0] + "=" + sort[1]);
            return out;
        } catch (Throwable t) {
            Log.w(TAG, "onLoadFilters", t);
            return filters;
        }
    }

    /** Called from ReviewsReactor$FiltersMetadataLoaded's constructor. */
    public static void onFiltersMetadata(Object metadata) {
        try {
            String id = HotelInfo.str(HotelInfo.call(HotelInfo.call(metadata, "getSortMetadata"), "getId"));
            if (id != null) sortFilterId = id;
        } catch (Throwable t) {
            Log.w(TAG, "onFiltersMetadata", t);
        }
    }

    /** Called from ReviewsReactor$ApplyFilterOptions's constructor: the user picked an option. */
    public static void onApplyFilterOptions(String filterId, List<?> optionIds) {
        if (filterId == null) return;
        String key = sortFilterId != null ? sortFilterId : RecentRating.newestSort()[0];
        if (filterId.equals(key)) picked = true;
    }
}
