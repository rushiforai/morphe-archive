package app.czyeru.extension.tiktok.favorites;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

import app.czyeru.extension.shared.Logger;
import app.czyeru.extension.shared.Utils;
import app.czyeru.extension.tiktok.settings.Settings;
import app.czyeru.extension.tiktok.settings.SettingsStatus;

/**
 * Favorites rate limit retry. TikTok's server refuses favorites tapped in quick succession
 * ("You're adding to Favorites too fast. Take a break!") and the app just undoes them. This keeps
 * each refused favorite in a queue saved in the settings and sends it again, one at a time, with
 * a growing wait, until the server accepts it. The queue survives app restarts.
 * <p>
 * Hooked at the start of AwemeCollectionAgent's request method, which every video favorite button
 * goes through: its error and success callbacks are wrapped to see each result.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class FavoritesRetryPatch {
    private static final String FUNCTION2 = "kotlin.jvm.functions.Function2";
    private static final String COLLECT_INTERFACE = "com.ss.android.ugc.aweme.favorites.agents.abilities.ICollect";
    private static final String COLLECT_SERVICE = "com.ss.android.ugc.aweme.favorites.business.aweme.ability.ICollectAweme";
    private static final String STATE_INTERFACE = "com.ss.android.ugc.aweme.state.ability.IState";
    private static final String SERVICE_MANAGER = "com.ss.android.ugc.aweme.framework.services.ServiceManager";
    /** Wait after launch before the first retry, so TikTok has finished starting up. */
    private static final long START_DELAY_MS = 10_000;
    /** A retry whose callback never comes is given up after this, so the queue keeps moving. */
    private static final long IN_FLIGHT_TIMEOUT_MS = 60_000;
    private static final long NO_AGENT_DELAY_MS = 30_000;

    private static final Object lock = new Object();
    private static FavoritesRetryQueue queue;
    /** TikTok's favorites agent, from the last request. */
    private static volatile Object agent;
    /** Video being retried, or null. */
    private static String inFlight;
    private static int retryGeneration;
    private static boolean timerPending;

    private FavoritesRetryPatch() {
    }

    public static boolean isEnabled() {
        return SettingsStatus.favoritesRetryEnabled && Settings.FAVORITES_RETRY.get();
    }

    /** Start of MainActivity.onCreate: resumes favorites queued before the app was closed. */
    public static void onAppStart() {
        // Delayed as a whole: this runs before the rest of onCreate (and the extension setup in it).
        Utils.runOnMainThreadDelayed(() -> {
            if (!isEnabled()) {
                return;
            }
            synchronized (lock) {
                if (queue().isEmpty()) {
                    return;
                }
            }
            schedule(0);
        }, START_DELAY_MS);
    }

    /**
     * Start of AwemeCollectionAgent's request method. Returns the error callback to use instead of
     * onError (never null when this patch is on; TikTok accepts null there and checks for it).
     */
    public static Object wrapError(Object collectionAgent, String aid, boolean collect, Map params, Object onError) {
        try {
            if (aid == null || aid.isEmpty() || !isEnabled()) {
                return onError;
            }
            agent = collectionAgent;
            if (!collect) {
                // Unfavorited: drop any pending retry of it.
                synchronized (lock) {
                    if (queue().remove(aid)) {
                        save();
                    }
                }
                return onError;
            }
            Map<String, Object> savedParams = FavoritesRetryQueue.copyParams(params);
            return proxy(onError, args -> onFailed(aid, savedParams, args[1] instanceof Throwable ? (Throwable) args[1] : null));
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorites retry: wrapError failed", throwable);
            return onError;
        }
    }

    /**
     * Start of AwemeCollectionAgent's request method, after {@link #wrapError}. Returns the
     * success callback to use instead of onSuccess. TikTok calls it with true for the instant
     * (optimistic) update and with false once the server has accepted.
     */
    public static Object wrapSuccess(Object collectionAgent, String aid, boolean collect, Map params,
                                     Object onError, Object onSuccess) {
        try {
            if (aid == null || aid.isEmpty() || !collect || !isEnabled()) {
                return onSuccess;
            }
            return proxy(onSuccess, args -> {
                if (Boolean.FALSE.equals(args[1])) {
                    onSaved(aid);
                }
            });
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorites retry: wrapSuccess failed", throwable);
            return onSuccess;
        }
    }

    private interface Listener {
        void onInvoke(Object[] args);
    }

    /** A kotlin Function2 that calls TikTok's callback (if any) first, then the listener. */
    private static Object proxy(Object original, Listener listener) throws ClassNotFoundException {
        Class<?> function2 = Class.forName(FUNCTION2);
        return Proxy.newProxyInstance(function2.getClassLoader(), new Class<?>[]{function2}, (proxy, method, args) -> {
            String name = method.getName();
            if ("invoke".equals(name) && args != null && args.length == 2) {
                Object result = null;
                if (original != null) {
                    try {
                        result = method.invoke(original, args);
                    } catch (InvocationTargetException e) {
                        throw e.getCause();
                    }
                }
                try {
                    listener.onInvoke(args);
                } catch (Throwable throwable) {
                    Logger.printException(() -> "Favorites retry callback failed", throwable);
                }
                return result;
            }
            if ("hashCode".equals(name)) return System.identityHashCode(proxy);
            if ("equals".equals(name)) return args != null && proxy == args[0];
            if ("toString".equals(name)) return "FavoritesRetryCallback";
            return original != null ? method.invoke(original, args) : null;
        });
    }

    private static void onFailed(String aid, Map<String, Object> params, Throwable error) {
        boolean rateLimited = FavoritesRetryQueue.isRateLimit(error);
        long now = System.currentTimeMillis();
        boolean added = false;
        long delay;
        synchronized (lock) {
            boolean wasRetry = aid.equals(inFlight);
            if (wasRetry) {
                inFlight = null;
            }
            FavoritesRetryQueue queue = queue();
            if (rateLimited) {
                added = queue.onRateLimited(aid, params, now);
            } else if (!queue.onOtherFailure(aid, FavoritesRetryQueue.isServerError(error), now) && !wasRetry) {
                return; // An ordinary failure of a video that is not queued: TikTok handles it.
            }
            save();
            if (queue.isEmpty()) {
                return;
            }
            delay = queue.delayUntilNext(now);
            int size = queue.size();
            Logger.printDebug(() -> "Favorites retry: " + aid + " failed (rate limited: " + rateLimited
                    + "), " + size + " queued, next try in " + (delay / 1000) + "s");
        }
        if (added) {
            Utils.showToastLong("Favorite queued. It will be saved automatically when TikTok allows it.");
        }
        schedule(delay);
    }

    private static void onSaved(String aid) {
        long delay;
        boolean emptied;
        synchronized (lock) {
            if (aid.equals(inFlight)) {
                inFlight = null;
            }
            FavoritesRetryQueue queue = queue();
            if (!queue.onSaved(aid, System.currentTimeMillis())) {
                if (queue.isEmpty()) {
                    return;
                }
                delay = queue.delayUntilNext(System.currentTimeMillis());
                emptied = false;
            } else {
                save();
                Logger.printDebug(() -> "Favorites retry: saved " + aid + ", " + queue.size() + " left");
                emptied = queue.isEmpty();
                delay = queue.delayUntilNext(System.currentTimeMillis());
            }
        }
        if (emptied) {
            Utils.showToastShort("Queued favorites saved.");
        } else {
            schedule(delay);
        }
    }

    private static void schedule(long delay) {
        synchronized (lock) {
            if (timerPending) {
                return; // The pending run checks the wait again and reschedules itself.
            }
            timerPending = true;
        }
        Utils.runOnMainThreadDelayed(FavoritesRetryPatch::retryNext, delay);
    }

    /** Main thread. Sends the oldest queued favorite once its wait is over. */
    private static void retryNext() {
        String aid;
        Map<String, Object> params;
        int generation;
        synchronized (lock) {
            timerPending = false;
            if (!isEnabled() || inFlight != null) {
                return; // A retry is running: its result schedules the next one.
            }
            FavoritesRetryQueue queue = queue();
            long now = System.currentTimeMillis();
            int before = queue.size();
            FavoritesRetryQueue.Entry entry = queue.next(now);
            if (queue.size() != before) {
                save();
            }
            if (entry == null) {
                return;
            }
            long wait = queue.delayUntilNext(now);
            if (wait > 0) {
                timerPending = true;
                Utils.runOnMainThreadDelayed(FavoritesRetryPatch::retryNext, wait);
                return;
            }
            aid = entry.aid;
            params = new HashMap<>(entry.params);
            inFlight = aid;
            generation = ++retryGeneration;
        }

        Object collectionAgent = agent();
        if (collectionAgent == null) {
            synchronized (lock) {
                inFlight = null;
            }
            schedule(NO_AGENT_DELAY_MS);
            return;
        }

        try {
            if (Boolean.TRUE.equals(isFavorited(collectionAgent, aid))) {
                // Favorited in the meantime (or a tap of it is still running).
                synchronized (lock) {
                    inFlight = null;
                    queue().remove(aid);
                    save();
                }
                schedule(0);
                return;
            }

            Logger.printDebug(() -> "Favorites retry: sending " + aid);
            Class<?> function2 = Class.forName(FUNCTION2);
            // Null callbacks: the hook wraps them, so the result comes back to onFailed / onSaved.
            Class.forName(COLLECT_INTERFACE)
                    .getMethod("collect", String.class, Map.class, function2, function2)
                    .invoke(collectionAgent, aid, params, null, null);
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorites retry: request failed", throwable);
            synchronized (lock) {
                if (aid.equals(inFlight)) {
                    inFlight = null;
                }
                queue().onOtherFailure(aid, false, System.currentTimeMillis());
                save();
            }
            schedule(FavoritesRetryQueue.BACKOFF_MS[0]);
            return;
        }

        Utils.runOnMainThreadDelayed(() -> {
            synchronized (lock) {
                if (generation != retryGeneration || !aid.equals(inFlight)) {
                    return;
                }
                inFlight = null;
            }
            Logger.printDebug(() -> "Favorites retry: no answer for " + aid);
            schedule(0);
        }, IN_FLIGHT_TIMEOUT_MS);
    }

    /** TikTok's favorite state for the video (IState.currentState), or null when unknown. */
    private static Object isFavorited(Object collectionAgent, String aid) {
        try {
            return Class.forName(STATE_INTERFACE)
                    .getMethod("currentState", String.class, Object.class)
                    .invoke(collectionAgent, aid, Boolean.FALSE);
        } catch (Throwable throwable) {
            return null;
        }
    }

    /** The agent from the last favorite, or TikTok's service (same singleton) after a restart. */
    private static Object agent() {
        Object current = agent;
        if (current != null) {
            return current;
        }
        try {
            Class<?> serviceManager = Class.forName(SERVICE_MANAGER);
            Object manager = serviceManager.getMethod("get").invoke(null);
            current = serviceManager.getMethod("getService", Class.class)
                    .invoke(manager, Class.forName(COLLECT_SERVICE));
            agent = current;
            return current;
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorites retry: favorites service not found", throwable);
            return null;
        }
    }

    /** Hold the lock. */
    private static FavoritesRetryQueue queue() {
        if (queue == null) {
            queue = FavoritesRetryQueue.decode(Settings.FAVORITES_RETRY_QUEUE.get());
        }
        return queue;
    }

    /** Hold the lock. */
    private static void save() {
        Settings.FAVORITES_RETRY_QUEUE.save(queue().encode());
    }
}
