package app.proxma.simosa;

import android.content.Context;
import android.net.ConnectivityManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Claims today's Daily Rewards MB rung from the background worker via reflection into the app's
 * {@code DailyRewardRemoteDataSource} (load) and {@code DailyRewardSubscribedRemoteDataSource}
 * (claim). Both carry the full MSA encrypted pipeline, so we don't need to reimplement it.
 *
 * <p>Latches only on success — opposite to the in-app pre-latch, so a worker failure leaves the
 * in-app claim path intact. Double-fire is harmless (server rejects duplicate claims).
 */
public final class LadderClaim {

    private static final String TAG = "PROXMA_CLAIM";

    private static final String DATA_SOURCE_LOAD =
        "com.jazz.jazzworld.data.network.genericapis.dailyreward.DailyRewardRemoteDataSource";
    private static final String DATA_SOURCE_CLAIM =
        "com.jazz.jazzworld.data.network.genericapis.dailyreward.DailyRewardSubscribedRemoteDataSource";
    private static final String LISTENER_LOAD =
        "com.jazz.jazzworld.data.network.genericapis.dailyreward.OnDailyRewardListListeners";
    private static final String LISTENER_CLAIM =
        "com.jazz.jazzworld.data.network.genericapis.dailyreward.OnDailyRewardSubscriptionListeners";
    private static final String DAYS_LIST_ITEM =
        "com.jazz.jazzworld.data.appmodels.dailyreward.response.DaysListItem";

    private static final String DATA_SOURCE_STATUS =
        "com.jazz.jazzworld.data.network.genericapis.dailyreward.DailyRewardClaimedRemoteDataSource";
    private static final String LISTENER_STATUS =
        "com.jazz.jazzworld.data.network.genericapis.dailyreward.OnDailyRewardStatusListeners";

    private static final int TIMEOUT_SECONDS = 45;
    private static final int STATUS_TIMEOUT_SECONDS = 20;

    static String sResult = "n/a";

    private LadderClaim() {}

    public static String getResult() { return sResult; }

    /** @return true if settled; false if transient (retry-worthy). */
    public static boolean tryClaimLadder(Context context) {
        sResult = "n/a";
        try {
            return tryClaimInner(context);
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            log("LADDER_REFLECT " + e);
            sResult = "reflect: " + e.getMessage();
            return true; // permanent: app structure changed
        } catch (Throwable t) {
            log("LADDER_ERR " + t);
            sResult = "error: " + t.getMessage();
            return false;
        }
    }

    private static boolean tryClaimInner(Context context) throws Exception {
        String skip = AutoClaim.check(context, "ladder");
        if (skip != null) {
            log("LADDER_SKIP " + skip);
            sResult = skip;
            return true;
        }

        // On both days seen so far, the list stayed non-free after midnight until the app had been opened.
        // The app's home screen makes a status check on open, so a state that is not the free route gets
        // that same check and a second read before it is believed.
        String claimed = null;
        String currentDay = null;
        String currentStatus = null;
        List<?> daysList = null;
        for (int pass = 0; ; pass++) {
            Loaded loaded = loadList(context);
            if (loaded == null) {
                return false;
            }

            // Step 2: Parse response -> find today's rung
            Object data = loaded.response.getClass().getMethod("getData").invoke(loaded.response);
            if (data == null) {
                log("LADDER_NO_DATA");
                sResult = "no data";
                return false;
            }

            claimed = (String) data.getClass().getMethod("getClaimed").invoke(data);
            currentDay = (String) data.getClass().getMethod("getCurrentDay").invoke(data);
            currentStatus = (String) data.getClass().getMethod("getCurrentStatus").invoke(data);
            daysList = (List<?>) data.getClass().getMethod("getDaysList").invoke(data);

            String source = loaded.fromCache ? "cache" : "network";
            boolean online = isOnline(context);
            log("LADDER_STATE pass=" + pass + " source=" + source + " online=" + online + " claimed=" + claimed
                + " day=" + currentDay + " status=" + currentStatus);

            // With no network the app returns its last saved list whatever its age, so yesterday's
            // state cannot decide today's claim. Online, it only uses the cache after a claim made today.
            if (loaded.fromCache && !(online && "true".equals(claimed))) {
                sResult = "saved list not used (status " + currentStatus + ", day " + currentDay + ")";
                return false;
            }

            if ("true".equals(claimed)) {
                AutoClaim.latch(context, "ladder");
                log("LADDER_ALREADY_CLAIMED");
                sResult = "already claimed";
                return true;
            }

            if ("0".equals(currentStatus)) {
                break;
            }

            // Only "0" is the free route. After a free claim the server moves to the next day with status
            // "1", and a claim in that state spends real balance. The server also sends "2" (seen on day 1
            // after a finished week), which the app has no claim flow for. Not latched and retried: this
            // is also what a run sees before the server opens the new day's free rung.
            logRung(daysList, currentDay);
            if (pass > 0) {
                log("LADDER_SKIP_NOT_FREE status=" + currentStatus);
                sResult = "not free yet (status " + currentStatus + ", day " + currentDay + ", " + source + ")";
                return false;
            }
            statusCheck(context);
        }

        if (daysList == null || daysList.isEmpty()) {
            log("LADDER_NO_DAYS");
            sResult = "no days list";
            return false;
        }

        // Find the rung matching currentDay
        Object rung = null;
        for (Object item : daysList) {
            String day = (String) item.getClass().getMethod("getDay").invoke(item);
            if (day != null && day.equals(currentDay)) {
                rung = item;
                break;
            }
        }

        if (rung == null) {
            StringBuilder sb = new StringBuilder("LADDER_NO_RUNG day=" + currentDay + " available=[");
            for (int i = 0; i < daysList.size(); i++) {
                Object item = daysList.get(i);
                try {
                    sb.append(item.getClass().getMethod("getDay").invoke(item));
                } catch (Throwable t) {
                    sb.append("?");
                }
                if (i < daysList.size() - 1) sb.append(",");
            }
            sb.append("]");
            log(sb.toString());
            sResult = "no rung for day " + currentDay;
            return false;
        }

        // Step 3: Claim via DailyRewardSubscribedRemoteDataSource
        log("LADDER_CLAIM_START day=" + currentDay);
        Class<?> claimDsClass = Class.forName(DATA_SOURCE_CLAIM);
        Constructor<?> claimCtor = claimDsClass.getConstructor(Context.class);
        Object claimDs = claimCtor.newInstance(context);

        Class<?> claimListenerClass = Class.forName(LISTENER_CLAIM);
        Class<?> daysListItemClass = Class.forName(DAYS_LIST_ITEM);

        final CountDownLatch claimLatch = new CountDownLatch(1);
        final AtomicBoolean claimSuccess = new AtomicBoolean(false);
        final AtomicReference<String> claimFailText = new AtomicReference<>(null);

        Object claimProxy = Proxy.newProxyInstance(
            context.getClassLoader(),
            new Class<?>[] { claimListenerClass },
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    try {
                        String name = method.getName();
                        if ("onDailyRewardSubscriptionSuccess".equals(name)) {
                            claimSuccess.set(true);
                        } else if ("onDailyRewardSubscriptionFailed".equals(name)) {
                            String text = args != null && args.length > 0 ? String.valueOf(args[0]) : "";
                            String code = args != null && args.length > 1 ? String.valueOf(args[1]) : "";
                            claimFailText.set(text + " code=" + code);
                        } else if ("toString".equals(name)) {
                            return "ProxmaLadderClaimListener";
                        } else if ("hashCode".equals(name)) {
                            return System.identityHashCode(proxy);
                        } else if ("equals".equals(name)) {
                            return proxy == args[0];
                        }
                    } catch (Throwable t) {
                        log("LADDER_CLAIM_CB_ERR " + t);
                    } finally {
                        if (!"toString".equals(method.getName()) && !"hashCode".equals(method.getName())
                            && !"equals".equals(method.getName())) {
                            claimLatch.countDown();
                        }
                    }
                    return null;
                }
            }
        );

        String statusArg = currentStatus != null ? currentStatus : "";
        final Object finalRung = rung;
        Method requestClaim = claimDsClass.getMethod("requestSubscribeDailyReward",
            daysListItemClass, String.class, String.class, claimListenerClass);

        final String fStatus = statusArg;
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                try {
                    requestClaim.invoke(claimDs, finalRung, fStatus, "auto_claim", claimProxy);
                } catch (Throwable t) {
                    log("LADDER_CLAIM_INVOKE_ERR " + t);
                    claimFailText.set("invoke: " + t);
                    claimLatch.countDown();
                }
            }
        });

        if (!claimLatch.await(TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
            log("LADDER_CLAIM_TIMEOUT");
            sResult = "claim timeout";
            return false;
        }

        if (claimSuccess.get()) {
            AutoClaim.latch(context, "ladder");
            log("LADDER_CLAIMED day=" + currentDay);
            sResult = "claimed day " + currentDay;
            return true;
        }

        String failText = claimFailText.get();
        log("LADDER_CLAIM_FAIL " + failText);
        if (failText != null && failText.toLowerCase().contains("already")) {
            AutoClaim.latch(context, "ladder");
            sResult = "already claimed (from fail)";
            return true;
        }
        sResult = "claim fail: " + failText;
        return false;
    }

    /** Loads the ladder through the app's data source. Null means failed, with {@code sResult} set. */
    private static Loaded loadList(Context context) throws Exception {
        // Step 1: Load today's ladder state via DailyRewardRemoteDataSource
        log("LADDER_LOAD_START");
        Class<?> loadDsClass = Class.forName(DATA_SOURCE_LOAD);
        Constructor<?> loadCtor = loadDsClass.getConstructor(Context.class);
        Object loadDs = loadCtor.newInstance(context);

        Class<?> loadListenerClass = Class.forName(LISTENER_LOAD);

        final CountDownLatch loadLatch = new CountDownLatch(1);
        final AtomicReference<Object> loadResponse = new AtomicReference<>(null);
        final AtomicReference<String> loadError = new AtomicReference<>(null);
        // The app answers from its own cache during the request call, and from the network later.
        final AtomicBoolean loadCalling = new AtomicBoolean(false);
        final AtomicBoolean loadFromCache = new AtomicBoolean(false);

        Object loadProxy = Proxy.newProxyInstance(
            context.getClassLoader(),
            new Class<?>[] { loadListenerClass },
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    try {
                        String name = method.getName();
                        if ("onDailyRewardListSuccess".equals(name) && args != null && args.length > 0) {
                            loadFromCache.set(loadCalling.get());
                            loadResponse.set(args[0]);
                        } else if ("onDailyRewardListFailed".equals(name)) {
                            String text = args != null && args.length > 0 ? String.valueOf(args[0]) : "";
                            String code = args != null && args.length > 1 ? String.valueOf(args[1]) : "";
                            loadError.set(text + " code=" + code);
                        } else if ("toString".equals(name)) {
                            return "ProxmaLadderLoadListener";
                        } else if ("hashCode".equals(name)) {
                            return System.identityHashCode(proxy);
                        } else if ("equals".equals(name)) {
                            return proxy == args[0];
                        }
                    } catch (Throwable t) {
                        log("LADDER_LOAD_CB_ERR " + t);
                    } finally {
                        if (!"toString".equals(method.getName()) && !"hashCode".equals(method.getName())
                            && !"equals".equals(method.getName())) {
                            loadLatch.countDown();
                        }
                    }
                    return null;
                }
            }
        );

        Method requestList = loadDsClass.getMethod("requestDailyRewardList", loadListenerClass);
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                try {
                    loadCalling.set(true);
                    requestList.invoke(loadDs, loadProxy);
                } catch (Throwable t) {
                    log("LADDER_LOAD_INVOKE_ERR " + t);
                    loadError.set("invoke: " + t);
                    loadLatch.countDown();
                } finally {
                    loadCalling.set(false);
                }
            }
        });

        if (!loadLatch.await(TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
            log("LADDER_LOAD_TIMEOUT");
            sResult = "load timeout";
            return null;
        }

        if (loadError.get() != null) {
            log("LADDER_LOAD_FAIL " + loadError.get());
            sResult = "load fail: " + loadError.get();
            return null;
        }

        Object response = loadResponse.get();
        if (response == null) {
            log("LADDER_LOAD_NULL");
            sResult = "load null";
            return null;
        }

        Loaded loaded = new Loaded();
        loaded.response = response;
        loaded.fromCache = loadFromCache.get();
        return loaded;
    }

    /** What a ladder load returned, and whether the app answered from its own cache. */
    private static final class Loaded {
        Object response;
        boolean fromCache;
    }

    /**
     * The app's own {@code gamification/check}, which its home screen makes on every open. It claims
     * nothing. A failure here is only logged: the second read of the list decides either way.
     */
    private static void statusCheck(Context context) {
        try {
            Class<?> sourceClass = Class.forName(DATA_SOURCE_STATUS);
            final Object source = sourceClass.getConstructor(Context.class).newInstance(context);
            Class<?> listenerClass = Class.forName(LISTENER_STATUS);
            final CountDownLatch latch = new CountDownLatch(1);
            final Object listener = Proxy.newProxyInstance(context.getClassLoader(), new Class<?>[] { listenerClass },
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) {
                        String name = method.getName();
                        if ("toString".equals(name)) {
                            return "ProxmaLadderStatusListener";
                        } else if ("hashCode".equals(name)) {
                            return System.identityHashCode(proxy);
                        } else if ("equals".equals(name)) {
                            return proxy == args[0];
                        }
                        String detail;
                        try {
                            Object response = args != null && args.length > 0 ? args[0] : null;
                            Object data = response == null ? null
                                : response.getClass().getMethod("getData").invoke(response);
                            detail = String.valueOf(data != null ? data : response);
                        } catch (Throwable t) {
                            detail = "unreadable";
                        }
                        log("LADDER_STATUS_CHECK " + name + " " + detail);
                        latch.countDown();
                        return null;
                    }
                });
            final Method request = sourceClass.getMethod("requestForGetDailyRewardClaimedStatus", listenerClass);
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    try {
                        request.invoke(source, listener);
                    } catch (Throwable t) {
                        log("LADDER_STATUS_CHECK_ERR " + t);
                        latch.countDown();
                    }
                }
            });
            if (!latch.await(STATUS_TIMEOUT_SECONDS, TimeUnit.SECONDS)) {
                log("LADDER_STATUS_CHECK_TIMEOUT");
            }
        } catch (Throwable t) {
            log("LADDER_STATUS_CHECK_ERR " + t);
        }
    }

    /** The current rung's price and flags, to see what a non-free state is offering. */
    private static void logRung(List<?> daysList, String currentDay) {
        if (daysList == null) {
            return;
        }
        try {
            for (Object item : daysList) {
                if (String.valueOf(currentDay).equals(MilestoneClaim.field(item, "getDay"))) {
                    log("LADDER_RUNG price=" + MilestoneClaim.field(item, "getPrice")
                        + " active=" + MilestoneClaim.field(item, "is_active"));
                    return;
                }
            }
        } catch (Throwable t) {
            log("LADDER_RUNG_ERR " + t);
        }
    }

    private static boolean isOnline(Context context) {
        try {
            ConnectivityManager manager =
                (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            return manager != null && manager.getActiveNetworkInfo() != null;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void log(String msg) {
        Log.i(TAG, msg);
        Trace.line(msg);
    }
}
