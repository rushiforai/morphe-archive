package app.jofslash.extension.booking;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.Locale;

/**
 * "Remember result sort": a new search keeps the sort the user last picked for the search
 * results, instead of going back to Booking.com's "Our top picks".
 *
 * <p>The sort is the SearchQuery's SortType (id and name, e.g. "price"/"price"). Booking.com resets
 * it to SortType.AUTO ("Our top picks") on a new search: the search boxes call
 * SearchQueryBuilderExtKt.setSortType(builder, SortType.AUTO) when the destination, dates or
 * guests change. The patch catches that call, the very AUTO object only (getDefaultType()), and
 * puts the remembered sort in its place. A sort the user or the server picks is a new SortType
 * object and passes unchanged.
 *
 * <p>The sort is remembered when the user picks one in the sort sheet or the filter screen.
 * Picking "Our top picks" (or popularity) forgets it, and so does a distance sort, which only
 * means something for the place it was picked for.
 */
@SuppressWarnings("unused")
public final class RememberSort {
    private RememberSort() {
    }

    private static final String TAG = "JoFBookingSort";
    private static final String PREFS = "jofslash_remember_sort";
    private static final String SORT_TYPE = "com.booking.searchquery.SortType";

    private static Object auto;
    /** The remembered sort as a SortType, made once per id. */
    private static Object cached;

    /** Called from the sort sheet's apply coroutine's constructor with the SortType picked. */
    public static void onSortPicked(Object sortType) {
        try {
            if (sortType == null) return;
            remember(HotelInfo.str(HotelInfo.call(sortType, "getId")), HotelInfo.str(HotelInfo.call(sortType, "getName")));
        } catch (Throwable t) {
            Log.w(TAG, "onSortPicked", t);
        }
    }

    /** Called first in SearchResultsActivity.onFiltersOrSortersChange with the sorter id, or null. */
    public static void onSorterId(String id) {
        try {
            if (id == null) return;
            Object sortType = Class.forName(SORT_TYPE).getMethod("fromId", String.class).invoke(null, id);
            onSortPicked(sortType);
        } catch (Throwable t) {
            Log.w(TAG, "onSorterId", t);
        }
    }

    /**
     * Called first in SearchQueryBuilderExtKt.setSortType(builder, sortType, params): returns the
     * sort to set, the remembered one in place of Booking.com's reset to "Our top picks".
     */
    public static Object forNewSearch(Object sortType) {
        try {
            if (sortType == null || sortType != auto()) return sortType;
            SharedPreferences prefs = prefs();
            String id = prefs == null ? null : prefs.getString("id", null);
            if (id == null) return sortType;
            Object current = cached;
            if (current == null || !id.equals(HotelInfo.str(HotelInfo.call(current, "getId")))) {
                String name = prefs.getString("name", id);
                current = Class.forName(SORT_TYPE).getConstructor(String.class, String.class).newInstance(id, name);
                cached = current;
            }
            Log.i(TAG, "New search sorted by " + id);
            return current;
        } catch (Throwable t) {
            Log.w(TAG, "forNewSearch", t);
            return sortType;
        }
    }

    private static Object auto() throws Exception {
        if (auto == null) auto = Class.forName(SORT_TYPE).getMethod("getDefaultType").invoke(null);
        return auto;
    }

    private static void remember(String id, String name) {
        SharedPreferences prefs = prefs();
        if (prefs == null || id == null) return;
        if (!keeps(id)) {
            if (prefs.contains("id")) Log.i(TAG, "Sort " + id + " picked; new searches use Booking.com's sort");
            prefs.edit().remove("id").remove("name").apply();
            return;
        }
        Log.i(TAG, "Sort " + id + " picked; new searches keep it");
        prefs.edit().putString("id", id).putString("name", name == null || name.isEmpty() ? id : name).apply();
    }

    /** Whether a new search should keep this sort: not the default, not one tied to a place. */
    static boolean keeps(String id) {
        String l = id.toLowerCase(Locale.ROOT);
        if (l.isEmpty() || l.equals("auto") || l.equals("popularity")) return false;
        return !l.contains("distance") && !l.contains("closest") && !l.equals("dateviewed");
    }

    private static SharedPreferences prefs() {
        Context c = PriceRecorder.currentApplication();
        return c == null ? null : c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
