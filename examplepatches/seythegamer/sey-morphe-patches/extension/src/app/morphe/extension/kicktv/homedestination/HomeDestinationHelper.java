package app.morphe.extension.kicktv.homedestination;

import android.content.Context;
import android.util.Log;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Resolves the Compose route that KICK's splash screen navigates to once the
 * start-up gate finishes.
 *
 * <p>KICK 1.9.0 hard-codes the navigation target in the splash coroutine
 * ({@code const-string "home"} right before
 * {@code Lxs5;->b(String, Function1)}). The DEFAULT HOME DESTINATION patch
 * replaces that constant with a call to {@link #getStartRoute()}, so the route
 * is taken from SEYTTINGS while the splash pop-up options stay untouched.</p>
 */
public final class HomeDestinationHelper {

    /** Stock KICK tab; also the fallback when the preference cannot be read. */
    private static final String FALLBACK_ROUTE = "home";

    private static final String TAG = "SeyttingsHome";

    private HomeDestinationHelper() {
    }

    /**
     * Returns an existing top level KICK navigation route for the destination
     * stored in SEYTTINGS. Never throws: a patched app must always start, even
     * when the preference file is unavailable.
     */
    public static String getStartRoute() {
        try {
            Context context = MorpheContext.getAppContext();
            if (context == null) {
                Log.w(TAG, "no application context, opening the stock home tab");
                return FALLBACK_ROUTE;
            }
            String destination = HomeDestinationPrefs.getHomeDestination(context);
            String route = toRoute(destination);
            Log.i(TAG, "default home destination " + destination + " -> route " + route);
            return route;
        } catch (Throwable ignored) {
            return FALLBACK_ROUTE;
        }
    }

    /**
     * Maps the user facing destination label to the route used by KICK's
     * navigation graph (see {@code lj4} / {@code oh4} in 1.9.0).
     */
    private static String toRoute(String destination) {
        if ("Categories".equals(destination)) {
            return "browseCategories";
        }
        if ("Live".equals(destination)) {
            return "browseLivestreams";
        }
        if ("Following".equals(destination)) {
            return "following";
        }
        if ("Settings".equals(destination)) {
            return "settings";
        }
        return FALLBACK_ROUTE;
    }
}
