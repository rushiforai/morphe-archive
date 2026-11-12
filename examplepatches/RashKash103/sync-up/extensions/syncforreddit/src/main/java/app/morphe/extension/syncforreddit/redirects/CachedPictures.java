package app.morphe.extension.syncforreddit.redirects;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.syncforreddit.settings.SyncUpSettings;

/**
 * Throwing away the pictures already kept, when the answer to asking for one has changed.
 *
 * <p>The routes are interceptors, and an interceptor only ever sees a request that is actually
 * made. Glide looks in its own cache on disk first and goes to the network only when it finds
 * nothing, so a picture that was fetched before any of this was turned on is handed back exactly
 * as it was fetched — which, where Imgur refused the region, is the notice saying so, kept as a
 * perfectly good image and shown ever after.
 *
 * <p>That is why a feed can go on showing refusals in its thumbnails while opening the same post
 * works: the larger picture is a different address, was never fetched before, and so is asked for
 * and routed. Turning a route on therefore has to forget what is already kept, or it appears to
 * do nothing to everything already seen.
 */
public final class CachedPictures {
    private CachedPictures() {}

    private static boolean watching;

    /** What the last look at the settings that decide how a picture is fetched came to. */
    private static String fetchedBy;

    /**
     * Starts watching for a change to how a picture would be fetched.
     *
     * <p>Only those settings count. Whether an address is handed out when something is shared
     * makes no difference to a picture already kept, and throwing them all away over it would
     * cost a reader every picture they have for nothing.
     */
    public static synchronized void watch() {
        if (watching || SyncUpSettings.store() == null) {
            return;
        }
        watching = true;
        fetchedBy = howPicturesAreFetched();
        SyncUpSettings.whenChanged("sync_up_redirect", () -> {
            String now = howPicturesAreFetched();
            synchronized (CachedPictures.class) {
                if (now.equals(fetchedBy)) {
                    return;
                }
                fetchedBy = now;
            }
            Logger.printDebug(() -> "pictures: how one is fetched has changed, forgetting them");
            forget();
        });
    }

    private static String howPicturesAreFetched() {
        return RedirectSettings.redirecting()
                + "/" + RedirectSettings.usingDuckDuckGo()
                + "/" + RedirectSettings.usingRimgo()
                + "/" + RedirectSettings.usingProxy()
                + "/" + RedirectSettings.onlyOnceRefused();
    }

    /** Forgets every picture held, so that the next look at one asks for it again. */
    public static void forget() {
        Context context = Utils.getContext();
        if (context == null) {
            return;
        }
        // Glide insists on which thread each of these is called from and throws otherwise, so
        // they are asked for from the two different places rather than together.
        try {
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    com.bumptech.glide.b.d(context).c();
                } catch (Throwable ex) {
                    Logger.printInfo(() -> "pictures: could not forget those in memory: " + ex);
                }
            });
        } catch (Throwable ex) {
            Logger.printInfo(() -> "pictures: could not reach the drawing thread: " + ex);
        }
        try {
            new Thread(() -> {
                try {
                    com.bumptech.glide.b.d(context).b();
                    Logger.printDebug(() -> "pictures: forgot those kept on disk");
                } catch (Throwable ex) {
                    Logger.printInfo(() -> "pictures: could not forget those on disk: " + ex);
                }
            }, "sync-up-forget-pictures").start();
        } catch (Throwable ex) {
            Logger.printInfo(() -> "pictures: could not start forgetting: " + ex);
        }
    }
}
