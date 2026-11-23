package app.jofslash.extension.booking;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicReference;

/**
 * "Recent rating": the average score of a hotel's recent reviews, next to its overall score, so a
 * hotel that is 8.5 overall but 6.0 lately stands out.
 *
 * <p>Booking.com sends no recent score, score trend or score distribution: the property page's
 * review data has only the overall score and the scores per category and traveller type. So the
 * average is computed from the newest reviews themselves:
 * <ul>
 * <li>On the reviews screen, when the list is sorted newest first, from the reviews it loaded.</li>
 * <li>Otherwise one request through the app's own review repository (the same call the reviews
 * screen makes, bookings.getHotelReviews) for the newest {@link #FETCH_ROWS} reviews, once per
 * hotel while the app runs. The result is only used when its dates really are newest first.</li>
 * </ul>
 * The reviews API takes the sort as a filter whose id and option come from the server
 * ("user_sort" = "sort_recent_desc" in 71.1). The patch starts with that, follows the reviews
 * screen's sort menu if it names another newest-first option, and only trusts a sort whose
 * results really come newest first.
 *
 * <p>Review scores come on Booking.com's 1-4 scale and are shown out of 10 (x 2.5), as the app does.
 */
@SuppressWarnings("unused")
public final class RecentRating {
    private RecentRating() {
    }

    static final String TAG = "JoFBookingRecent";
    private static final String CHIP_TAG = "jofslash_recent_rating";
    private static final String LINE_TAG = "jofslash_recent_line";
    private static final String PREFS = "jofslash_recent_rating";
    static final int FETCH_ROWS = 50;
    /** Fewer recent reviews than this and no average is shown. */
    static final int MIN_REVIEWS = 10;
    static final int WINDOW_DAYS = 182;
    private static final long DAY = 24L * 60 * 60 * 1000;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService NET = Executors.newSingleThreadExecutor();

    /** The newest reviews' average of one hotel. */
    static final class Stats {
        /** Reviews averaged: those of the last six months, or all fetched when they're newer. */
        int count;
        double average;
        /** The oldest review averaged, yyyy-MM-dd. */
        String since;
        /** True when the reviews reach back six months, so the count is the six months' count. */
        boolean fullWindow;
    }

    /** Per hotel id while the app runs: the stats, or null after a failed or unsorted fetch. */
    private static final Map<Integer, Stats> CACHE = Collections.synchronizedMap(new HashMap<>());
    private static final Set<Integer> FETCHING = Collections.synchronizedSet(new HashSet<>());
    /** Overall score per hotel id, from the property page. */
    private static final Map<Integer, Double> OVERALL = Collections.synchronizedMap(new HashMap<>());

    // The reviews screen's sort filter, from its filter metadata.
    private static volatile String sortFilterId;
    private static volatile List<String[]> sortOptions = new ArrayList<>();
    /** The sort option the user picked on the current reviews screen, or null. */
    private static volatile String appliedSort;
    /**
     * The newest-first sort Newest reviews first opened the current reviews screen with, as
     * {filter id, option}, or null.
     */
    private static volatile String[] defaultSort;
    private static volatile Context appContext;

    private static WeakReference<Activity> reviewsScreen = new WeakReference<>(null);
    /** What the reviews screen's chip shows: text and whether it's a warning. */
    private static volatile String chipText;
    private static volatile boolean chipBad;
    private static volatile int reviewsHotelId;

    // ---------------------------------------------------------------------------------------
    // Hooks

    /** Called from the reviews activity's constructor. */
    public static void onReviewsActivity(Activity activity) {
        try {
            appliedSort = null;
            defaultSort = null;
            chipText = null;
            reviewsHotelId = 0;
            reviewsScreen = new WeakReference<>(activity);
            listen(activity);
        } catch (Throwable t) {
            Log.w(TAG, "onReviewsActivity", t);
        }
    }

    /** Called from ReviewsReactor$FiltersMetadataLoaded's constructor. */
    public static void onFiltersMetadata(Object metadata) {
        try {
            Object sort = HotelInfo.call(metadata, "getSortMetadata");
            String id = HotelInfo.str(HotelInfo.call(sort, "getId"));
            Object categories = HotelInfo.call(sort, "getCategories");
            if (id == null || !(categories instanceof Iterable)) return;
            List<String[]> options = new ArrayList<>();
            for (Object c : (Iterable<?>) categories) {
                options.add(new String[]{HotelInfo.str(HotelInfo.call(c, "getId")),
                        HotelInfo.str(HotelInfo.call(c, "getDisplayValue"))});
            }
            sortFilterId = id;
            sortOptions = options;
            Log.i(TAG, "Sort filter " + id + ": " + describe(options));
            // The list may have loaded before the metadata: try the fetch now that a guess exists.
            if (reviewsHotelId > 0 && chipNeedsFetch) startFetch(reviewsHotelId);
        } catch (Throwable t) {
            Log.w(TAG, "onFiltersMetadata", t);
        }
    }

    /** Called from ReviewsReactor$ApplyFilterOptions's constructor. */
    public static void onApplyFilterOptions(String filterId, List<?> optionIds) {
        try {
            if (filterId != null && filterId.equals(sortFilterId) && optionIds != null && !optionIds.isEmpty()) {
                appliedSort = String.valueOf(optionIds.get(0));
            }
        } catch (Throwable t) {
            Log.w(TAG, "onApplyFilterOptions", t);
        }
    }

    /**
     * Called by Newest reviews first when it opens the reviews screen sorted by this option, as
     * if the user had picked it.
     */
    static void onDefaultSort(String filterId, String option) {
        defaultSort = new String[]{filterId, option};
        appliedSort = option;
    }

    private static volatile boolean chipNeedsFetch;

    /** Called from ReviewsReactor$ReviewsLoaded's constructor with the list the screen shows. */
    public static void onReviewsLoaded(List<?> reviews) {
        try {
            if (reviews == null || reviews.isEmpty()) return;
            int hotelId = hotelIdOf(reviews);
            if (hotelId <= 0) return;
            reviewsHotelId = hotelId;
            if (appContext == null) {
                Activity a = reviewsScreen.get();
                if (a != null) appContext = a.getApplicationContext();
            }
            // The list is only used when the screen is sorted newest first: "Most relevant" can
            // also come in date order, but leave reviews out.
            String[] newest = sortToUse();
            String sort = appliedSort;
            // With no newest-first sort known, trust the one Newest reviews first opened with
            // when its dates come newest first, and keep it for the fetches.
            String[] opened = defaultSort;
            if (newest == null && opened != null && opened[1].equals(sort)) newest = opened;
            if (sort != null && newest != null && sort.equals(newest[1]) && newestFirst(reviews)) {
                if (newest == opened) saveSort(opened[0], opened[1]);
                chipNeedsFetch = false;
                Stats loaded = stats(reviews);
                Stats fetched = CACHE.get(hotelId);
                Stats best = fetched != null && fetched.count >= loaded.count ? fetched : loaded;
                CACHE.put(hotelId, best);
                showChip(hotelId, best);
                return;
            }
            if (CACHE.containsKey(hotelId)) {
                Stats cached = CACHE.get(hotelId);
                if (cached != null) {
                    showChip(hotelId, cached);
                } else {
                    setChip(Strings.RECENT_FAILED, false);
                }
            } else {
                chipNeedsFetch = true;
                startFetch(hotelId);
            }
        } catch (Throwable t) {
            Log.w(TAG, "onReviewsLoaded", t);
        }
    }

    // ---------------------------------------------------------------------------------------
    // Property page: a line under the address, drawn with Compose's AndroidView.

    private static Object factory;
    private static final Map<TextView, Boolean> LINES = new WeakHashMap<>();

    /**
     * Called right after the property page's overview draws the address with
     * Address(address, modifier, composer), in the column under the name and score.
     */
    public static void onPropertyOverview(Object address, Object modifier, Object composer) {
        try {
            if (factory == null) factory = ComposeViews.factory(RecentRating::makeLine);
            ComposeViews.androidView(composer, factory);
            MAIN.post(RecentRating::refreshLines);
        } catch (RuntimeException e) {
            throw e;
        } catch (Throwable t) {
            Log.w(TAG, "onPropertyOverview", t);
        }
    }

    private static View makeLine(Context context) {
        // A frame whose only child is the text: the frame is 0 high while the text is hidden.
        FrameLayout frame = new FrameLayout(context);
        TextView line = new TextView(context);
        line.setTag(LINE_TAG);
        line.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        line.setVisibility(View.GONE);
        frame.addView(line, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        synchronized (LINES) {
            LINES.put(line, Boolean.TRUE);
        }
        return frame;
    }

    private static void refreshLines() {
        List<TextView> lines;
        synchronized (LINES) {
            lines = new ArrayList<>(LINES.keySet());
        }
        for (TextView line : lines) {
            try {
                refreshLine(line);
            } catch (Throwable t) {
                Log.w(TAG, "refreshLine", t);
            }
        }
    }

    private static void refreshLine(TextView line) {
        Activity activity = ComposeViews.activity(line.getContext());
        if (activity == null || activity.isFinishing()) return;
        if (appContext == null) appContext = activity.getApplicationContext();
        int hotelId = PropertyPageButton.pageHotelId(activity);
        if (hotelId <= 0) return;
        HotelInfo hotel = HotelInfo.of(HotelInfo.field(activity, "hotel"));
        if (hotel != null && !Double.isNaN(hotel.reviewScore)) OVERALL.put(hotelId, hotel.reviewScore);
        // Hotels with few reviews can't have ten recent ones.
        if (hotel != null && hotel.reviewCount > 0 && hotel.reviewCount < MIN_REVIEWS) {
            line.setVisibility(View.GONE);
            return;
        }
        if (!CACHE.containsKey(hotelId)) {
            line.setVisibility(View.GONE);
            startFetch(hotelId);
            return;
        }
        Stats stats = CACHE.get(hotelId);
        if (stats == null || stats.count < MIN_REVIEWS) {
            line.setVisibility(View.GONE);
            return;
        }
        Panel.Colors colors = Panel.Colors.of(activity);
        String text = text(stats, OVERALL.get(hotelId));
        line.setText(text);
        line.setContentDescription(text);
        line.setTextColor(isBad(stats, OVERALL.get(hotelId)) ? colors.bad : colors.text);
        line.setVisibility(View.VISIBLE);
    }

    // ---------------------------------------------------------------------------------------
    // The fetch

    private static void startFetch(final int hotelId) {
        if (CACHE.containsKey(hotelId) || !FETCHING.add(hotelId)) return;
        final String[] sort = sortToUse();
        if (sort == null) {
            FETCHING.remove(hotelId);
            Log.i(TAG, "No newest-first sort known yet; not fetching reviews for " + hotelId);
            updateChipNoSort(hotelId);
            return;
        }
        updateChipLoading(hotelId);
        NET.execute(() -> {
            Stats result = null;
            boolean failed = false;
            try {
                List<?> reviews = fetch(hotelId, sort[0], sort[1]);
                Boolean order = reviews == null ? Boolean.FALSE : newestOrder(reviews);
                if (Boolean.TRUE.equals(order)) {
                    saveSort(sort[0], sort[1]);
                    result = stats(reviews);
                    Log.i(TAG, "Hotel " + hotelId + ": " + result.count + " recent reviews, average "
                            + result.average + " since " + result.since);
                } else if (order == null) {
                    // A hotel with few reviews (or all from one day) can't show whether the sort
                    // works, and has too few for a recent rating anyway: keep the sort.
                    Log.i(TAG, "Hotel " + hotelId + ": too few dated reviews to check the sort");
                } else {
                    Log.w(TAG, "Reviews for " + hotelId + " with " + sort[0] + "=" + sort[1]
                            + " aren't newest first; forgetting that sort");
                    forgetSort(sort[0], sort[1]);
                }
            } catch (Throwable t) {
                failed = true;
                Log.w(TAG, "Couldn't fetch the newest reviews", t);
            }
            final Stats r = result;
            final boolean f = failed;
            // Once per hotel while the app runs, also when it failed.
            CACHE.put(hotelId, r);
            FETCHING.remove(hotelId);
            MAIN.post(() -> {
                refreshLines();
                if (hotelId == reviewsHotelId) {
                    if (r != null) {
                        showChip(hotelId, r);
                    } else if (f) {
                        setChip(Strings.RECENT_FAILED, false);
                    } else {
                        updateChipNoSort(hotelId);
                    }
                }
            });
        });
    }

    /**
     * The newest reviews through the app's HotelReviewRepository, with the same arguments the
     * reviews screen sends, plus the sort. Runs on a background thread.
     */
    private static List<?> fetch(int hotelId, String sortKey, String sortValue) throws Exception {
        Object ugc = ((AtomicReference<?>) Class.forName("com.booking.ugc.Ugc").getField("UGC_REFERENCE")
                .get(null)).get();
        if (ugc == null) throw new IllegalStateException("Ugc isn't set up");
        Object module = HotelInfo.call(ugc, "getUgcReviewModule");
        Object repository = HotelInfo.call(HotelInfo.field(module, "hotelReviewRepositoryLazy"), "getValue");
        if (repository == null) throw new IllegalStateException("No review repository");

        Class<?> queryClass = Class.forName("com.booking.ugc.review.repository.hotel.HotelReviewQuery");
        Object query = newQuery(queryClass);
        set(query, "hotelId", String.valueOf(hotelId));
        set(query, "offset", 0);
        set(query, "count", FETCH_ROWS);
        @SuppressWarnings({"unchecked", "rawtypes"})
        Object scope = Enum.valueOf((Class<Enum>) Class.forName("com.booking.ugc.model.UgcDisplayScope"), "REVIEW_LIST");
        set(query, "source", scope);
        Method arg = queryClass.getMethod("addExperimentalArgument", String.class, String.class);
        arg.invoke(query, "use_new_group_sorting", "1");
        arg.invoke(query, sortKey, sortValue);
        try {
            Object language = Class.forName("com.booking.localization.LanguageHelper")
                    .getMethod("getCurrentLanguage").invoke(null);
            if (language != null) arg.invoke(query, "languagecode", language.toString());
        } catch (Throwable ignored) {
            // Sent without it.
        }
        arg.invoke(query, "use_new_customer_types", "1");
        arg.invoke(query, "include_stay_status", "1");

        Method getItems = null;
        for (Method m : repository.getClass().getMethods()) {
            if (m.getName().equals("getItems") && m.getParameterTypes().length == 1) {
                getItems = m;
                break;
            }
        }
        if (getItems == null) throw new IllegalStateException("No getItems");
        Object single = getItems.invoke(repository, query);
        Object list = single.getClass().getMethod("blockingGet").invoke(single);
        return list instanceof List ? (List<?>) list : null;
    }

    /**
     * A new HotelReviewQuery. R8 removed its constructor (the app creates it with the
     * superclass's), so it's allocated without one and its argument map set as that would.
     */
    private static Object newQuery(Class<?> queryClass) throws Exception {
        for (java.lang.reflect.Constructor<?> c : queryClass.getDeclaredConstructors()) {
            if (c.getParameterTypes().length == 0) {
                c.setAccessible(true);
                return c.newInstance();
            }
        }
        Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
        Field theUnsafe = unsafeClass.getDeclaredField("theUnsafe");
        theUnsafe.setAccessible(true);
        Object unsafe = theUnsafe.get(null);
        Object query = unsafeClass.getMethod("allocateInstance", Class.class).invoke(unsafe, queryClass);
        for (Class<?> c = queryClass; c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                if (f.getType() == HashMap.class || f.getType() == Map.class) {
                    f.setAccessible(true);
                    if (f.get(query) == null) f.set(query, new HashMap<>());
                }
            }
        }
        return query;
    }

    private static void set(Object target, String name, Object value) throws Exception {
        Field f = target.getClass().getField(name);
        f.set(target, value);
    }

    // ---------------------------------------------------------------------------------------
    // The sort option

    /**
     * The newest-first sort as Booking.com's server named it in Nov 2026 (version 71.1): filter
     * "user_sort", options sort_most_relevant, sort_recent_desc, sort_recent_asc, sort_score_desc,
     * sort_score_asc. Used until the reviews screen's sort options say otherwise, and only
     * trusted when the dates come back newest first.
     */
    private static final String[] KNOWN_SORT = {"user_sort", "sort_recent_desc"};

    /**
     * The sorts that didn't come back newest first. Earlier builds kept them under "rejected",
     * where a hotel with under 10 reviews could put the working sort; that set is ignored.
     */
    private static final String REJECTED = "rejected_sorts";

    /**
     * The newest-first sort, as {filter id, option}: the one saved after it worked, else the
     * option of the reviews screen's sort menu that says newest, else {@link #KNOWN_SORT}.
     */
    private static String[] sortToUse() {
        SharedPreferences prefs = prefs();
        if (prefs != null) {
            String key = prefs.getString("sort_key", null);
            String value = prefs.getString("sort_value", null);
            if (key != null && value != null) return new String[]{key, value};
        }
        String filter = sortFilterId;
        Set<String> rejected = prefs == null ? new HashSet<>()
                : prefs.getStringSet(REJECTED, new HashSet<>());
        for (String[] option : filter == null ? new ArrayList<String[]>() : sortOptions) {
            if (option[0] == null || rejected.contains(filter + "=" + option[0])) continue;
            if (looksNewest(option[0]) || looksNewest(option[1])) return new String[]{filter, option[0]};
        }
        return rejected.contains(KNOWN_SORT[0] + "=" + KNOWN_SORT[1]) ? null : KNOWN_SORT;
    }

    /** "Newest first" in the option's id or (English) name. Only a guess: the dates decide. */
    private static boolean looksNewest(String s) {
        if (s == null) return false;
        String l = s.toLowerCase(Locale.ROOT);
        // "sort_recent_asc" (Oldest first) has "recent" in it too.
        if (l.contains("asc") || l.contains("oldest")) return false;
        return l.contains("newest") || l.contains("recent") || l.contains("latest") || l.contains("date_desc")
                || l.contains("new_first") || l.contains("completed_desc");
    }

    private static void saveSort(String key, String value) {
        SharedPreferences prefs = prefs();
        if (prefs == null) return;
        if (key.equals(prefs.getString("sort_key", null)) && value.equals(prefs.getString("sort_value", null))) return;
        Log.i(TAG, "Newest-first sort is " + key + "=" + value);
        prefs.edit().putString("sort_key", key).putString("sort_value", value).apply();
    }

    private static void forgetSort(String key, String value) {
        SharedPreferences prefs = prefs();
        if (prefs == null) return;
        Set<String> rejected = new HashSet<>(prefs.getStringSet(REJECTED, new HashSet<>()));
        rejected.add(key + "=" + value);
        SharedPreferences.Editor edit = prefs.edit().putStringSet(REJECTED, rejected);
        if (key.equals(prefs.getString("sort_key", null)) && value.equals(prefs.getString("sort_value", null))) {
            edit.remove("sort_key").remove("sort_value");
        }
        edit.apply();
    }

    /**
     * The newest-first sort for the reviews screen, as {filter id, option}: {@link #sortToUse()},
     * or {@link #KNOWN_SORT} when every guess failed before.
     */
    static String[] newestSort() {
        String[] sort = sortToUse();
        return sort != null ? sort : KNOWN_SORT.clone();
    }

    private static SharedPreferences prefs() {
        Context c = appContext;
        if (c == null) c = appContext = PriceRecorder.currentApplication();
        return c == null ? null : c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static String describe(List<String[]> options) {
        StringBuilder sb = new StringBuilder();
        for (String[] o : options) sb.append(o[0]).append(" (").append(o[1]).append(") ");
        return sb.toString();
    }

    // ---------------------------------------------------------------------------------------
    // The numbers

    private static int hotelIdOf(List<?> reviews) {
        for (Object r : reviews) {
            Object id = HotelInfo.call(r, "getHotelId");
            if (id instanceof Integer && (Integer) id > 0) return (Integer) id;
        }
        return -1;
    }

    private static String dateOf(Object review) {
        Object date = HotelInfo.call(review, "getDate");
        String s = date == null ? null : date.toString();
        return s != null && s.matches("\\d{4}-\\d{2}-\\d{2}.*") ? s.substring(0, 10) : null;
    }

    /**
     * True when the dates of the reviews never go up: at least {@link #MIN_REVIEWS} dated reviews
     * over more than one day. "Most relevant" and score sorts fail this.
     */
    static boolean newestFirst(List<?> reviews) {
        return Boolean.TRUE.equals(newestOrder(reviews));
    }

    /**
     * Whether the reviews are newest first: false as soon as a date goes up, null when there are
     * too few dated reviews (under {@link #MIN_REVIEWS}, or all from one day) to tell, else true.
     */
    static Boolean newestOrder(List<?> reviews) {
        String previous = null, first = null;
        int dated = 0;
        for (Object r : reviews) {
            String d = dateOf(r);
            if (d == null) continue;
            if (previous != null && d.compareTo(previous) > 0) return false;
            if (first == null) first = d;
            previous = d;
            dated++;
        }
        if (dated < MIN_REVIEWS || first.equals(previous)) return null;
        return true;
    }

    /** The average of the reviews of the last six months, of a newest-first list. */
    static Stats stats(List<?> reviews) {
        String cutoff = new java.text.SimpleDateFormat("yyyy-MM-dd", Locale.US)
                .format(new java.util.Date(System.currentTimeMillis() - WINDOW_DAYS * DAY));
        Stats s = new Stats();
        double sum = 0;
        // Any score above 4 means the list is already out of 10.
        boolean outOf10 = false;
        for (Object r : reviews) {
            Object raw = HotelInfo.call(r, "getAverageScore");
            if (raw instanceof Double && (Double) raw > 4.0001) outOf10 = true;
        }
        boolean older = false;
        for (Object r : reviews) {
            String d = dateOf(r);
            if (d == null) continue;
            if (d.compareTo(cutoff) < 0) {
                older = true;
                continue;
            }
            // Booking.com leaves reviews of guests who didn't stay out of the score.
            if (Boolean.TRUE.equals(HotelInfo.call(r, "isNonStayed"))) continue;
            double score = scoreOutOf10(r, outOf10);
            if (Double.isNaN(score)) continue;
            sum += score;
            s.count++;
            s.since = d;
        }
        s.average = s.count == 0 ? Double.NaN : sum / s.count;
        s.fullWindow = older;
        return s;
    }

    /**
     * A review's score out of 10. The reviews API sends "average_score" on Booking.com's old
     * 1-4 scale (a review the app shows as 9.0 comes as 3.6), so it's multiplied by 2.5 unless
     * [outOf10] (a score above 4 in the same list).
     * "average_score_out_of_10" is used when the server fills it.
     */
    static double scoreOutOf10(Object review, boolean outOf10) {
        Object featured = HotelInfo.call(review, "getAverageFeaturedScore");
        if (featured instanceof Double && (Double) featured > 0) return (Double) featured;
        Object score = HotelInfo.call(review, "getAverageScore");
        if (!(score instanceof Double) || (Double) score <= 0) return Double.NaN;
        double v = (Double) score;
        return outOf10 ? v : v * 2.5;
    }

    static String score(double v) {
        return String.format(Locale.getDefault(), "%.1f", v);
    }

    static String text(Stats stats, Double overall) {
        String text = stats.fullWindow
                ? String.format(Locale.getDefault(), Strings.RECENT_6M, score(stats.average), stats.count)
                : String.format(Locale.getDefault(), Strings.RECENT_LATEST, score(stats.average), stats.count,
                Panel.day(Stay.utcMillis(stats.since) + 12L * 3600 * 1000));
        if (overall != null && Math.abs(overall - stats.average) >= 0.3) {
            text += String.format(Strings.RECENT_OVERALL, score(overall));
        }
        return text;
    }

    /** Recent reviews clearly worse than the overall score. */
    static boolean isBad(Stats stats, Double overall) {
        return overall != null && stats.average <= overall - 0.5;
    }

    // ---------------------------------------------------------------------------------------
    // The reviews screen's chip, above the Review check banner.

    private static void showChip(int hotelId, Stats stats) {
        if (stats == null || stats.count < MIN_REVIEWS) {
            setChip(Strings.RECENT_FEW, false);
        } else {
            Double overall = OVERALL.get(hotelId);
            setChip(text(stats, overall), isBad(stats, overall));
        }
    }

    private static void updateChipLoading(int hotelId) {
        if (hotelId == reviewsHotelId) setChip(Strings.RECENT_LOADING, false);
    }

    private static void updateChipNoSort(int hotelId) {
        if (hotelId == reviewsHotelId) setChip(Strings.RECENT_NEED_SORT, false);
    }

    private static void setChip(String text, boolean bad) {
        chipText = text;
        chipBad = bad;
        MAIN.post(() -> {
            Activity a = reviewsScreen.get();
            if (a != null && !a.isFinishing()) drawChip(a);
        });
    }

    private static void drawChip(Activity activity) {
        try {
            String text = chipText;
            View content = activity.findViewById(android.R.id.content);
            if (text == null || content == null) return;
            TextView chip = content.findViewWithTag(CHIP_TAG);
            float density = activity.getResources().getDisplayMetrics().density;
            if (chip == null) {
                chip = new TextView(activity);
                chip.setTag(CHIP_TAG);
                chip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                chip.setTypeface(Typeface.DEFAULT_BOLD);
                int h = Math.round(14 * density), v = Math.round(10 * density);
                chip.setPadding(h, v, h, v);
                chip.setElevation(6 * density);
                ReviewsScreen.add(activity, chip, true);
            }
            Panel.Colors colors = Panel.Colors.of(activity);
            GradientDrawable bg = new GradientDrawable();
            bg.setCornerRadius(10 * density);
            bg.setColor(colors.surface);
            bg.setStroke(Math.round((chipBad ? 2 : 1) * density), chipBad ? colors.bad : colors.divider);
            chip.setBackground(bg);
            chip.setTextColor(chipBad ? colors.bad : colors.text);
            chip.setText(text);
            chip.setContentDescription(text);
        } catch (Throwable t) {
            Log.w(TAG, "drawChip", t);
        }
    }

    private static void listen(final Activity activity) {
        Application.ActivityLifecycleCallbacks callbacks = new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity a, Bundle b) {
            }

            @Override
            public void onActivityStarted(Activity a) {
            }

            @Override
            public void onActivityResumed(Activity a) {
                if (a == activity) drawChip(a);
            }

            @Override
            public void onActivityPaused(Activity a) {
            }

            @Override
            public void onActivityStopped(Activity a) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity a, Bundle b) {
            }

            @Override
            public void onActivityDestroyed(Activity a) {
            }
        };
        if (Build.VERSION.SDK_INT >= 29) {
            activity.registerActivityLifecycleCallbacks(callbacks);
        } else {
            MAIN.post(() -> {
                Application app = activity.getApplication();
                if (app != null) app.registerActivityLifecycleCallbacks(callbacks);
            });
        }
    }
}
