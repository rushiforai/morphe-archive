package app.proxma.simosa;

import android.content.Context;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/**
 * The app's own side of the Daily Rewards session, for a worker with no Activity behind it: the
 * token cache it reads and writes, and {@code DailyRewardAuthTokenRepo.authToken}, the call it falls
 * back to when it has no token or the server refuses its refresh token. {@code authToken} is signed
 * with the app's main login, so it needs no refresh token. Only a dead main login stops it, and that
 * one takes a real sign-in.
 *
 * <p>The cache key is {@code key_gamification_authToken-<parent msisdn>} ({@code K8.X.M} on 3.3.5,
 * {@code D8.X.M} on 3.3.4.2), built here so an obfuscated class name cannot change it. The parent
 * comes from the login data in memory, which {@code getUserData(context)} loads after {@link #primeLogin}.
 */
final class AppAuth {

    private static final String DATA_MANAGER = "com.jazz.jazzworld.data.manager.DataManager";
    private static final String CACHE_MANAGER =
        "com.jazz.jazzworld.data.network.networkcache.NetworkCacheManager";
    private static final String TOKEN_RESPONSE =
        "com.jazz.jazzworld.data.appmodels.dailyreward.response.DailyRewardAuthTokenResponse";
    private static final String TOKEN_REQUEST =
        "com.jazz.jazzworld.data.appmodels.dailyreward.request.DailyRewardAuthTokenRequest";
    private static final String CACHE_KEY = "key_gamification_authToken-";
    private static final long MINT_TIMEOUT_S = 40;

    /** Why the last {@link #mint} failed, for the worker notification. Holds no token. */
    static String sFailure = "n/a";

    private AppAuth() {}

    /**
     * Makes the stored login readable. A process started for the worker has no MainActivity to set
     * the key, and without it {@code getUserData(context)} returns null and requests carry no msisdn
     * or token. The method is added by the patch, which copies the key setup from the app.
     */
    static void primeLogin(Context context) {
        try {
            Class<?> dataManager = Class.forName(DATA_MANAGER);
            Object companion = dataManager.getField("Companion").get(null);
            Object instance = companion.getClass().getMethod("getInstance").invoke(companion);
            dataManager.getMethod("proxmaPrimeLogin").invoke(instance);
            Object login = dataManager.getMethod("getUserData", Context.class).invoke(instance, context);
            BackgroundCheckin.log("AUTH_PRIME login=" + (login != null));
        } catch (Throwable t) {
            BackgroundCheckin.log("AUTH_PRIME_ERR " + MilestoneClaim.unwrap(t));
        }
    }

    /** The app's cache key for the token, or null when there is no login data to build it from. */
    private static String cacheKey(Context context) throws Exception {
        Class<?> dataManager = Class.forName(DATA_MANAGER);
        Object companion = dataManager.getField("Companion").get(null);
        Object instance = companion.getClass().getMethod("getInstance").invoke(companion);
        if (dataManager.getMethod("getUserData", Context.class).invoke(instance, context) == null) {
            return null;
        }
        Object parent = dataManager.getMethod("getParentUserData").invoke(instance);
        String msisdn = MilestoneClaim.field(parent, "getMsisdn");
        return CACHE_KEY + (msisdn == null ? "" : msisdn);
    }

    /** The cached {@code DailyRewardAuthTokenResponse}, or null. */
    static Object readCache(Context context) {
        try {
            String key = cacheKey(context);
            if (key == null) {
                return null;
            }
            Class<?> cache = Class.forName(CACHE_MANAGER);
            Object cacheData = cache.getMethod("getCacheData",
                    Context.class, Class.class, String.class, long.class, long.class)
                .invoke(cache.getField("INSTANCE").get(null), context,
                    Class.forName(TOKEN_RESPONSE), key, Long.MAX_VALUE, 0L);
            return cacheData == null ? null : cacheData.getClass().getMethod("getData").invoke(cacheData);
        } catch (Throwable t) {
            BackgroundCheckin.log("AUTH_CACHE_READ_ERR " + MilestoneClaim.unwrap(t));
            return null;
        }
    }

    /**
     * Store a new token where the app and the next run read it. Left out, the cache keeps the
     * refresh token the server has already replaced, and the next run sends that one and is refused.
     */
    static void writeCache(Context context, Object response) {
        try {
            String key = cacheKey(context);
            if (key == null) {
                return;
            }
            Class<?> cache = Class.forName(CACHE_MANAGER);
            cache.getMethod("setCacheData", Context.class, Object.class, Class.class,
                    String.class, String.class, String.class)
                .invoke(cache.getField("INSTANCE").get(null), context, response,
                    Class.forName(TOKEN_RESPONSE), key, String.valueOf(System.currentTimeMillis()), "");
        } catch (Throwable t) {
            BackgroundCheckin.log("AUTH_CACHE_WRITE_ERR " + MilestoneClaim.unwrap(t));
        }
    }

    /** A {@code DailyRewardAuthTokenResponse} built from a refresh reply, or null. */
    static Object newResponse(String access, String refresh, String type, Integer expiresIn, String uuid) {
        try {
            return Class.forName(TOKEN_RESPONSE)
                .getConstructor(String.class, String.class, String.class, Integer.class, String.class)
                .newInstance(access, refresh, type, expiresIn, uuid);
        } catch (Throwable t) {
            BackgroundCheckin.log("AUTH_RESPONSE_ERR " + MilestoneClaim.unwrap(t));
            return null;
        }
    }

    /**
     * {@code repo.authToken(request, cont)}: a new session from the main login.
     *
     * @return the {@code DailyRewardAuthTokenResponse}, or null with {@link #sFailure} set
     */
    static Object mint(Context context) {
        Object[] client = new Object[1];
        try {
            if (cacheKey(context) == null) {
                sFailure = "not signed in";
                return null;
            }
            final Object unit = MilestoneClaim.unit();
            final AtomicReference<Object> last = new AtomicReference<>(null);
            final AtomicReference<Throwable> failure = new AtomicReference<>(null);
            final CountDownLatch finished = new CountDownLatch(1);
            Object continuation = MilestoneClaim.continuation(new MilestoneClaim.Callback() {
                @Override public void done(Object result) {
                    if (result != unit) {
                        failure.set(MilestoneClaim.resultException(result));
                    }
                    finished.countDown();
                }
            });

            Object repo = MilestoneClaim.claimRepo(context, client);
            Method authToken = null;
            for (Method m : repo.getClass().getMethods()) {
                if ("authToken".equals(m.getName()) && m.getParameterTypes().length == 2) {
                    authToken = m;
                    break;
                }
            }
            if (authToken == null) throw new NoSuchMethodException("authToken");
            Object flow = authToken.invoke(repo,
                Class.forName(TOKEN_REQUEST).getConstructor().newInstance(), continuation);

            Method collect = MilestoneClaim.collectMethod(flow);
            Object collector = Proxy.newProxyInstance(
                context.getClassLoader(),
                new Class<?>[] { collect.getParameterTypes()[0] },
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        if ("emit".equals(method.getName())) {
                            Object item = args != null && args.length > 0 ? args[0] : null;
                            if (item != null && !"Loading".equals(item.getClass().getSimpleName())) {
                                last.set(item);
                            }
                            return unit;
                        }
                        return MilestoneClaim.objectMethod(proxy, method, args, "ProxmaAuthCollector");
                    }
                });

            // Same contract as the milestone claim: Unit means collect() finished without suspending.
            Object ret = collect.invoke(flow, collector, continuation);
            if (ret == null || ret == unit) {
                finished.countDown();
            }
            if (!finished.await(MINT_TIMEOUT_S, TimeUnit.SECONDS)) {
                sFailure = "timeout";
                return null;
            }
            if (failure.get() != null) {
                sFailure = String.valueOf(MilestoneClaim.unwrap(failure.get()));
                return null;
            }
            return judge(last.get());
        } catch (Throwable t) {
            sFailure = String.valueOf(MilestoneClaim.unwrap(t));
            return null;
        } finally {
            MilestoneClaim.close(client[0]);
        }
    }

    private static Object judge(Object item) throws Exception {
        if (item == null) {
            sFailure = "no result";
            return null;
        }
        if ("Success".equals(item.getClass().getSimpleName())) {
            Object body = item.getClass().getMethod("getData").invoke(item);
            if (body == null) {
                sFailure = "empty reply";
            }
            return body;
        }
        Object error = item.getClass().getMethod("getErrorState").invoke(item);
        sFailure = "code=" + MilestoneClaim.field(error, "getErrorCode")
            + " " + MilestoneClaim.field(error, "getErrorMessage");
        return null;
    }
}
