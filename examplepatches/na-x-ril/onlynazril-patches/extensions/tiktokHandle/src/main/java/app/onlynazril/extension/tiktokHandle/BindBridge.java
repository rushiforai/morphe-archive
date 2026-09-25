package app.onlynazril.extension.tiktokHandle;

import android.os.Handler;
import android.os.Looper;

import app.onlynazril.extension.tiktokHandle.internal.Debug;
import app.onlynazril.extension.tiktokHandle.internal.Reflect;

/**
 * Entered by the hook at each surface's binder, so the name renderer knows where it is.
 *
 * Two jobs, both about what is in hand at a bind: mark which surface is rendering, and remember the
 * region the account itself carries.
 *
 * The region is remembered per handle, and it is the **account's** region that is remembered — the
 * same field a name read straight off the model would give (`User.getRegion`). An item carries a
 * region of its own as well, and it is not the same thing: attributing a video's region to the
 * person who posted it is how a comment ends up showing the country of a video it has nothing to
 * do with.
 *
 * Captured at bind rather than only from the getter because the item is in hand there, on the same
 * thread that renders the name. The old ThreadLocal-only stash assumed the getter ran on that
 * thread too, which it does not — the feed parses elsewhere — so the value never reached the
 * header.
 *
 * This class only fills the cache; deciding what a region is belongs to `RegionSource`, so there is
 * one answer to that question rather than one per caller.
 */
public final class BindBridge {
    private static final ThreadLocal<String> CURRENT_SURFACE = new ThreadLocal<>();
    private static final long SURFACE_WINDOW_MS = 200L;

    private static boolean announcedFeed;

    private BindBridge() {}

    /** Feed binder entry — the one place the item and its author are both in hand. */
    public static void onBind(Object videoItemParams) {
        if (!announcedFeed) {
            announcedFeed = true;
            Debug.print("feed bind hook fired");
        }
        markSurface(Surfaces.FEED);
        captureItem(videoItemParams);
    }

    /** Secondary capture: any other place that touches the item's region. */
    public static void captureAwemeRegionFromAweme(Object aweme) {
        rememberAuthor(aweme);
    }

    public static String currentSurface() {
        return CURRENT_SURFACE.get();
    }

    private static void captureItem(Object videoItemParams) {
        if (videoItemParams == null) return;
        try {
            rememberAuthor(Reflect.property(videoItemParams, "getAweme", "mAweme"));
        } catch (Throwable ignored) {
        }
    }

    /** The account's own region, stored against the handle the name will be rendered from. */
    private static void rememberAuthor(Object aweme) {
        if (aweme == null) return;
        try {
            Object author = Reflect.property(aweme, "getAuthor", "author");
            if (author == null) return;
            RegionSource.remember(RegionSource.handleOf(author), RegionSource.accountRegion(author));
        } catch (Throwable ignored) {
        }
    }

    /** Feeds the fast path: while a bind is in flight, most renders belong to that surface. */
    private static void markSurface(String surface) {
        CURRENT_SURFACE.set(surface);
        try {
            new Handler(Looper.getMainLooper())
                    .postDelayed(() -> CURRENT_SURFACE.remove(), SURFACE_WINDOW_MS);
        } catch (Throwable ignored) {
        }
    }
}
