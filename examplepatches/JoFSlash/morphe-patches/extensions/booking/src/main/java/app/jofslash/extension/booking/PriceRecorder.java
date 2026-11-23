package app.jofslash.extension.booking;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Used by the Check crossed-out prices patch. Saves every hotel price the app shows: on the
 * property page and on the property cards of the search map. Also runs the price database's
 * reads and writes for Price watch.
 */
@SuppressWarnings("unused")
public final class PriceRecorder {
    private PriceRecorder() {
    }

    private static final ExecutorService DB_THREAD = Executors.newSingleThreadExecutor();
    private static volatile Context appContext;

    /** Recently seen prices, so cards drawn again and again don't each hit the database. */
    private static final Map<String, Boolean> RECENT = new LinkedHashMap<String, Boolean>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > 300;
        }
    };

    /**
     * Called from the property page's constructor by the patches that need the saved prices
     * (Check crossed-out prices): saves the prices the page shows.
     */
    public static void onPropertyPageRecord(Activity activity) {
        PropertyPageButton.attachRecorder(activity);
    }

    static void setContext(Context context) {
        if (appContext == null && context != null) appContext = context.getApplicationContext();
    }

    /**
     * Called by PropertyPageViewModelImpl.onHotelUpdate when the property page loads the hotel
     * again, for example after the dates changed.
     */
    public static void onHotelUpdate(Object hotel) {
        if (hotel == null) return;
        try {
            PropertyPageButton.onHotelUpdate(hotel);
        } catch (Throwable t) {
            Log.w(HotelInfo.TAG, "onHotelUpdate", t);
        }
    }

    static Context currentApplication() {
        try {
            return (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Called by PropertyCardMappersKt.toData for each property card on the search map. */
    public static void onSearchCard(Object hotel, Object searchConfig) {
        if (appContext == null) setContext(currentApplication());
        if (appContext == null) return;
        try {
            HotelInfo info = HotelInfo.of(hotel);
            Stay stay = Stay.ofSearchConfig(searchConfig);
            if (info == null || stay == null || !info.hasPrice()) return;
            record(info, stay, PriceDb.SOURCE_CARD);
        } catch (Throwable t) {
            Log.w(HotelInfo.TAG, "onSearchCard", t);
        }
    }

    /** Saves the price in the background. */
    static void record(final HotelInfo info, final Stay stay, final String source) {
        final Context context = appContext;
        if (context == null || info == null || stay == null || !info.hasPrice()) return;
        final String key = info.id + "|" + stay + "|" + info.price + "|" + info.currency;
        synchronized (RECENT) {
            if (RECENT.put(key, Boolean.TRUE) != null) return;
        }
        DB_THREAD.execute(() -> {
            try {
                boolean saved = PriceDb.get(context).add(info, stay, source, System.currentTimeMillis());
                if (saved) {
                    Log.i(HotelInfo.TAG, "Saved " + source + " price " + info.price + " " + info.currency
                            + " for hotel " + info.id + " " + stay);
                }
            } catch (Throwable t) {
                Log.w(HotelInfo.TAG, "Couldn't save the price", t);
            }
        });
    }

    /** Runs a database read in the background, then calls back on the activity's main thread. */
    static <T> void load(final Activity activity, final Loader<T> loader, final Callback<T> callback) {
        final Context context = activity.getApplicationContext();
        DB_THREAD.execute(() -> {
            T result = null;
            try {
                result = loader.load(PriceDb.get(context));
            } catch (Throwable t) {
                Log.w(HotelInfo.TAG, "Couldn't read the saved prices", t);
            }
            final T r = result;
            activity.runOnUiThread(() -> callback.done(r));
        });
    }

    interface Loader<T> {
        T load(PriceDb db);
    }

    interface Callback<T> {
        void done(T result);
    }
}
