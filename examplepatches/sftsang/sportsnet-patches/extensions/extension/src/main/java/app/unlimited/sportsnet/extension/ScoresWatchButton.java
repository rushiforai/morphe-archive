package app.unlimited.sportsnet.extension;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * The Watch button on Scores game cards. The app shows it only while a game is live; this shows it
 * for every game, labelled for the game's state, and marks games you cannot watch with a lock and
 * the reason. Games without a Sportsnet+ event get a placeholder id, so their button shows but
 * does nothing when tapped.
 *
 * Whether you can watch a game is worked out the way the Sportsnet+ pages do it: the game's event
 * is fetched in the background with the app's own content repository and checked with the app's
 * own entitlement rules, for your current subscription. Results are kept in a Compose state map,
 * so cards update when a result arrives.
 */
@SuppressWarnings({"unused", "unchecked"})
public final class ScoresWatchButton {
    /** Stands in for the Sportsnet+ event of a game Sportsnet+ does not carry. */
    private static final String NOT_ON_SNPLUS = "unlimited:not-on-snplus";

    private static final String LOCK = "🔒 ";

    /** Entitlement state of an event Sportsnet+ does not have. */
    private static final String MISSING = "Missing";

    private enum Phase { UPCOMING, LIVE, FINAL }

    private static final Map<String, Phase> phases = Collections.synchronizedMap(new HashMap<>());
    private static final Map<String, String> leagues = Collections.synchronizedMap(new HashMap<>());
    private static final Set<String> requested = Collections.synchronizedSet(new HashSet<>());
    private static final ExecutorService executor = Executors.newSingleThreadExecutor();
    private static final ExecutorService fetcher = Executors.newCachedThreadPool();

    /** Event id to the name of its entitlement state, such as UpgradeRequired. Compose state. */
    private static Map<String, String> states;

    private static volatile Object contentRepository;
    private static volatile Object entitlementFactory;
    private static volatile Object userEntitlementState;
    private static volatile boolean tveToDtcPhaseTwo;
    private static boolean waitingLogged;

    private ScoresWatchButton() {
    }

    // region Captured app services

    /** Called when the app creates its Sportsnet+ content repository wrapper, with the repository. */
    public static void contentRepository(Object repository) {
        contentRepository = repository;
        requestWaiting();
    }

    /**
     * Called whenever the app checks entitlement, with the app's current subscription state. The
     * state compares by value (signed out, or signed in with a set of entitlements), so signing in,
     * signing out or changing plans shows up as a change, and every game is checked again.
     */
    public static void entitlementCheck(Object factory, Object item, Object userState, boolean flag, String league) {
        Object previous = userEntitlementState;
        boolean first = entitlementFactory == null || previous == null;
        entitlementFactory = factory;
        if (userState != null) userEntitlementState = userState;
        tveToDtcPhaseTwo = flag;
        if (first) {
            requestWaiting();
        } else if (userState != null && !userState.equals(previous)) {
            Logger.info("Subscription changed: " + previous.getClass().getSimpleName() + " → "
                    + userState.getClass().getSimpleName() + ", checking " + phases.size() + " games again");
            requested.clear();
            requestWaiting();
        }
    }

    /** Checks the games seen so far that have not been checked with the current subscription. */
    private static void requestWaiting() {
        String[] eventIds;
        synchronized (phases) {
            eventIds = phases.keySet().toArray(new String[0]);
        }
        for (String eventId : eventIds) requestState(eventId);
    }

    // endregion

    // region Banner

    /** Called with a score card's Sportsnet+ event id and the card; returns the id the banner uses. */
    public static String bannerEventId(String eventId, Object card) {
        if (eventId == null) return NOT_ON_SNPLUS;
        try {
            Object status = call(call(card, "getTeamGameDetails"), "getStatus");
            Phase phase = Boolean.TRUE.equals(call(status, "isLiveOrDelayed")) ? Phase.LIVE
                    : Boolean.TRUE.equals(call(status, "isGameStarted")) ? Phase.FINAL : Phase.UPCOMING;
            Phase previous = phases.put(eventId, phase);
            Object league = call(card, "getLeagueShortName");
            if (league != null) leagues.put(eventId, String.valueOf(league));
            // A game that went live or finished may have become watchable, or locked; check again.
            if (previous != null && previous != phase) requested.remove(eventId);
        } catch (Exception e) {
            Logger.error("Could not read the score card", e);
        }
        requestState(eventId);
        return eventId;
    }

    /** Called with the banner's text; returns the text for the game's state. */
    public static String bannerLabel(String original, String eventId) {
        if (NOT_ON_SNPLUS.equals(eventId) || MISSING.equals(state(eventId))) return LOCK + "Not on Sportsnet+";
        Phase phase = phases.get(eventId);
        String action = phase == Phase.LIVE ? "Watch Live"
                : phase == Phase.FINAL ? "Watch Full Game" : original;
        String reason = lockReason(state(eventId));
        return reason == null ? action : LOCK + action + " · " + reason;
    }

    /** Called when the banner is tapped; returns the event to open, or null to do nothing. */
    public static String clickedEventId(String eventId) {
        return NOT_ON_SNPLUS.equals(eventId) || MISSING.equals(state(eventId)) ? null : eventId;
    }

    // endregion

    // region Entitlement

    private static String lockReason(String state) {
        if (state == null) return null;
        switch (state) {
            case "NotSignedIn":
            case "NotSignedInPPV":
                return "Sign in";
            case "RegionalRestriction":
            case "RegionalRestrictionUpgradable":
                return "Blacked out";
            case "SubscriptionRequired":
                return "Subscription required";
            case "UpgradeRequired":
                return "Upgrade required";
            case "DTCUnentitledTVEAvailable":
            case "TVEAddOnUnavailable":
            case "TVEUnavailable":
                return "Not in your package";
            default:
                return null;
        }
    }

    private static synchronized Map<String, String> states() {
        if (states == null) {
            try {
                states = (Map<String, String>) Class.forName(
                        "androidx.compose.runtime.snapshots.SnapshotStateMap").newInstance();
            } catch (Exception e) {
                Logger.error("Compose state map unavailable, locks show after scrolling", e);
                states = Collections.synchronizedMap(new HashMap<>());
            }
        }
        return states;
    }

    private static String state(String eventId) {
        return states().get(eventId);
    }

    private static void requestState(String eventId) {
        if (contentRepository == null || entitlementFactory == null || userEntitlementState == null) {
            if (!waitingLogged) {
                waitingLogged = true;
                Logger.info("Lock check waiting for the app: repository " + (contentRepository != null)
                        + ", entitlement " + (entitlementFactory != null) + ", subscription " + (userEntitlementState != null));
            }
            return;
        }
        if (!requested.add(eventId)) return;
        executor.execute(() -> {
            try {
                Object item = fetchItemSummary(eventId);
                if (item == null) return;
                Object state = entitlementFactory.getClass().getMethod("invoke",
                        Class.forName("com.rogers.sportsnet.common.model.ItemSummary"),
                        Class.forName("com.rogers.sportsnet.service.authentication.model.data.UserEntitlementState"),
                        boolean.class, String.class)
                        .invoke(entitlementFactory, item, userEntitlementState, tveToDtcPhaseTwo, leagues.get(eventId));
                String name = state == null ? "Unknown" : state.getClass().getSimpleName();
                Logger.info("Event " + eventId + " (" + phases.get(eventId) + "): " + name);
                states().put(eventId, name);
            } catch (Throwable e) {
                requested.remove(eventId);
                Logger.error("Could not check event " + eventId, e);
            }
        });
    }

    /** The event as an item summary, fetched with the app's repository; null if it failed. */
    private static Object fetchItemSummary(String eventId) throws Exception {
        Object repository = contentRepository;
        Class<?> paramsClass = Class.forName("com.rogers.sportsnet.common.data.list.ItemParams");
        Object params = paramsClass.getConstructor(String.class, Boolean.class, Boolean.class)
                .newInstance(eventId, Boolean.TRUE, null); // true: look the item up by its event id, as the Sportsnet+ page does
        Class<?> continuationClass = Class.forName("kotlin.coroutines.Continuation");
        Method getItem = repository.getClass().getMethod("getItem", paramsClass, continuationClass);

        // runBlocking(EmptyCoroutineContext) { repository.getItem(params) }, from Java.
        Class<?> function2 = Class.forName("kotlin.jvm.functions.Function2");
        InvocationHandler handler = (proxy, method, args) -> {
            if ("invoke".equals(method.getName())) return getItem.invoke(repository, params, args[1]);
            if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
            if ("equals".equals(method.getName())) return proxy == args[0];
            return "ScoresWatchButton.fetch";
        };
        Object block = Proxy.newProxyInstance(function2.getClassLoader(), new Class<?>[]{function2}, handler);
        Class<?> contextClass = Class.forName("kotlin.coroutines.CoroutineContext");
        Object emptyContext = Class.forName("kotlin.coroutines.EmptyCoroutineContext").getField("INSTANCE").get(null);
        Method runBlocking = Class.forName("kotlinx.coroutines.BuildersKt").getMethod("runBlocking", contextClass, function2);
        java.util.concurrent.Future<Object> pending = fetcher.submit(() -> runBlocking.invoke(null, emptyContext, block));
        Object result;
        try {
            result = pending.get(20, java.util.concurrent.TimeUnit.SECONDS);
        } catch (java.util.concurrent.TimeoutException e) {
            pending.cancel(true);
            Logger.info("Event " + eventId + " timed out");
            return null;
        }

        if (result != null && String.valueOf(result).contains("404")) {
            // Sportsnet+ does not have this event, such as a game shown only on TV.
            states().put(eventId, MISSING);
            Logger.info("Event " + eventId + " is not on Sportsnet+");
            return null;
        }
        if (result == null || !result.getClass().getSimpleName().equals("Success")) {
            Logger.info("Event " + eventId + " not loaded: " + (result == null ? "null" : result.getClass().getName() + " " + result));
            return null;
        }
        Object detail = field(result, "data");
        if (detail == null) return null;
        return Class.forName("com.rogers.sportsnet.common.ui.extensions.ItemDetailExtKt")
                .getMethod("toItemSummary", detail.getClass())
                .invoke(null, detail);
    }

    // endregion

    private static Object call(Object target, String name) throws Exception {
        return target == null ? null : target.getClass().getMethod(name).invoke(target);
    }

    private static Object field(Object target, String name) throws Exception {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                java.lang.reflect.Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
                // Look in the superclass.
            }
        }
        throw new NoSuchFieldException(name);
    }
}
