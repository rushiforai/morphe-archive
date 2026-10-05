package app.template.extension;

import android.app.Activity;

import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.widget.Toolbar;
import androidx.navigation.NavController;
import androidx.navigation.NavDestination;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;

/**
 * Opens (and closes) the member's watchlist for the synthetic Watchlist bottom-nav item.
 *
 * <p>{@code Route.MemberWatchlist} lives inside the Member (profile) tab's nav graph — it isn't a
 * peer of the five tab destinations. Navigating to it cross-graph wedged the back stack, so this
 * mirrors Letterboxd's own {@code handleAppShortcuts}: select the Profile tab through the bottom
 * bar (a normal, fast tab switch that brings its NavController to the front), then on the next
 * frame navigate to the watchlist inside it. {@link #showing} tracks that state; when the user
 * taps any other bottom-nav item, {@link NavItems#onMenuSelected} calls {@link #dismiss} first so
 * that tab switch lands clean in a single tap.
 *
 * <p>Because the watchlist sits on the Profile tab's stack, a plain back / back-swipe from it
 * would pop to the Profile screen (with the Watchlist item still lit). {@link #installBackHandling}
 * intercepts that: back from the watchlist goes to the Films tab instead. Back from a film opened
 * inside the watchlist still just returns to the watchlist — the interceptor is only armed while
 * the current destination is the watchlist itself.
 */
public final class WatchlistNav {

    private static final String PKG = "com.letterboxd.letterboxd";

    /** True while the watchlist has been layered on the Profile tab by {@link #open}. */
    public static volatile boolean showing = false;

    /** Destination the Profile tab was at when {@link #open} pushed the watchlist — the pop target. */
    private static volatile int memberRootId = 0;

    private static OnBackPressedCallback backCallback;
    private static NavController.OnDestinationChangedListener destListener;
    private static NavController watchedController;

    private WatchlistNav() {}

    public static void open(final Activity activity) {
        try {
            if (showing) return;
            final BottomNavigationView bar = findBar(activity);
            int profileId = activity.getResources().getIdentifier(
                    "nav_profile", "id", activity.getPackageName());
            final String memberId = currentMemberId();
            if (bar == null || profileId == 0 || memberId == null || memberId.isEmpty()) return;

            bar.setSelectedItemId(profileId);
            bar.post(new Runnable() {
                @Override public void run() {
                    try {
                        Object ncObj = navController(activity);
                        if (!(ncObj instanceof NavController)) return;
                        NavController nc = (NavController) ncObj;
                        memberRootId = destinationId(nc);
                        Object route = Class.forName(PKG + ".ui.navigation.Route$MemberWatchlist")
                                .getConstructor(String.class, String.class)
                                .newInstance(memberId, null);
                        nc.getClass().getMethod("navigate", Object.class).invoke(nc, route);
                        showing = true;
                        installBackHandling(activity, nc);
                    } catch (Throwable ignored) {
                    }
                }
            });
        } catch (Throwable ignored) {
        }
    }

    /**
     * Pop the Profile tab back to where it was before the watchlist was pushed — so a pending tab
     * tap (Profile included) lands on the real screen, not the watchlist or a film opened from it.
     */
    public static void dismiss(Activity activity) {
        try {
            Object nc = navController(activity);
            if (nc != null) {
                boolean popped = false;
                if (memberRootId != 0) {
                    Object r = nc.getClass().getMethod("popBackStack", int.class, boolean.class)
                            .invoke(nc, memberRootId, Boolean.FALSE);
                    popped = Boolean.TRUE.equals(r);
                }
                if (!popped) {
                    nc.getClass().getMethod("popBackStack").invoke(nc);
                }
            }
        } catch (Throwable ignored) {
        } finally {
            showing = false;
            memberRootId = 0;
            teardownBackHandling();
        }
    }

    // --- back handling ---------------------------------------------------

    private static void installBackHandling(final Activity activity, NavController nc) {
        try {
            teardownBackHandling();

            backCallback = new OnBackPressedCallback(true) {
                @Override public void handleOnBackPressed() {
                    goHome(activity);
                }
            };
            Object dispatcher = activity.getClass()
                    .getMethod("getOnBackPressedDispatcher").invoke(activity);
            dispatcher.getClass()
                    .getMethod("addCallback", OnBackPressedCallback.class)
                    .invoke(dispatcher, backCallback);

            watchedController = nc;
            destListener = new NavController.OnDestinationChangedListener() {
                @Override public void onDestinationChanged(NavController controller,
                                                          NavDestination destination, Bundle arguments) {
                    // Only steer back to Films while the watchlist itself is on screen; from a
                    // film opened inside it, let a normal back return to the watchlist.
                    if (backCallback != null) {
                        backCallback.setEnabled(isWatchlist(destination));
                    }
                }
            };
            nc.addOnDestinationChangedListener(destListener);
        } catch (Throwable ignored) {
        }
    }

    private static void teardownBackHandling() {
        try {
            if (backCallback != null) backCallback.remove();
        } catch (Throwable ignored) {
        }
        try {
            if (watchedController != null && destListener != null) {
                watchedController.removeOnDestinationChangedListener(destListener);
            }
        } catch (Throwable ignored) {
        }
        backCallback = null;
        destListener = null;
        watchedController = null;
    }

    private static void goHome(Activity activity) {
        dismiss(activity); // pop the watchlist (and any film) off the Profile tab; clears state
        try {
            BottomNavigationView bar = findBar(activity);
            int popularId = activity.getResources().getIdentifier(
                    "nav_popular", "id", activity.getPackageName());
            if (bar != null && popularId != 0) bar.setSelectedItemId(popularId);
        } catch (Throwable ignored) {
        }
    }

    private static boolean isWatchlist(NavDestination destination) {
        return destination != null && String.valueOf(destination).contains("MemberWatchlist");
    }

    /**
     * Injected at the end of {@code MemberWatchlistFragment.onViewCreated}. When the watchlist was
     * opened as a bottom-nav tab (not reached through the app's own Profile screen), drop the
     * toolbar's back arrow — it went to Profile, which makes no sense for a tab. Back-swipe still
     * works and goes to Films via {@link #installBackHandling}.
     */
    public static void tidyToolbar(Object fragment) {
        try {
            if (!showing) return;
            Object root = fragment.getClass().getMethod("getView").invoke(fragment);
            if (!(root instanceof ViewGroup)) return;
            Toolbar toolbar = findToolbar((ViewGroup) root);
            if (toolbar != null) {
                toolbar.setNavigationIcon((android.graphics.drawable.Drawable) null);
                toolbar.setNavigationOnClickListener(null);
            }
        } catch (Throwable ignored) {
        }
    }

    private static Toolbar findToolbar(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof Toolbar) return (Toolbar) child;
            if (child instanceof ViewGroup) {
                Toolbar found = findToolbar((ViewGroup) child);
                if (found != null) return found;
            }
        }
        return null;
    }

    // --- helpers -------------------------------------------------------

    public static BottomNavigationView findBar(Activity activity) {
        try {
            int id = activity.getResources().getIdentifier(
                    "bottom_navigation", "id", activity.getPackageName());
            android.view.View v = id == 0 ? null : activity.findViewById(id);
            return v instanceof BottomNavigationView ? (BottomNavigationView) v : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object navController(Activity activity) throws Exception {
        return activity.getClass().getMethod("getNavController").invoke(activity);
    }

    private static int destinationId(Object nc) {
        try {
            Object d = nc.getClass().getMethod("getCurrentDestination").invoke(nc);
            Object id = d.getClass().getMethod("getId").invoke(d);
            return id instanceof Integer ? (Integer) id : 0;
        } catch (Throwable t) {
            return 0;
        }
    }

    private static String currentMemberId() {
        try {
            Class<?> mgr = Class.forName(PKG + ".services.CurrentMemberManager");
            Object instance = mgr.getField("INSTANCE").get(null);
            Object id = mgr.getMethod("getMemberId").invoke(instance);
            return id instanceof String ? (String) id : null;
        } catch (Throwable t) {
            return null;
        }
    }
}
