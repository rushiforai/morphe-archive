package app.ratbanana.extension.gaminghub;

import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Proxy;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.HashMap;
import java.util.Map;

/**
 * Wraps the Gaming Hub server API so that account-only endpoints never reach Samsung's servers
 * when no Samsung account is visible.
 * <p>
 * Play history endpoints are answered on the device by {@link LocalPlayHistory}. Every other
 * account-only endpoint fails at once instead of sending a request that the server rejects,
 * which also stops the app from retrying it over the network.
 */
@SuppressWarnings("unused")
public final class LocalGamingHubService implements InvocationHandler {

    /** Path prefix of the endpoints that require a signed-in Samsung account. */
    private static final String ACCOUNT_API_PREFIX = "/gotcha/";

    private static final long RETRY_THROTTLE_MILLIS = 2_000L;

    /** Last time each endpoint was skipped, to throttle immediate retries. */
    private static final Map<String, Long> LAST_SKIP_TIMES = new HashMap<>();

    private final Object remoteService;

    private LocalGamingHubService(Object remoteService) {
        this.remoteService = remoteService;
    }

    /**
     * Injection point.
     *
     * @param remoteService The API implementation created by Retrofit.
     * @param serviceType   The API interface.
     * @return The wrapped API implementation, or the original one if it cannot be wrapped.
     */
    public static Object wrap(Object remoteService, Class<?> serviceType) {
        if (remoteService == null || serviceType == null || !serviceType.isInterface()) {
            return remoteService;
        }
        return Proxy.newProxyInstance(
                serviceType.getClassLoader(),
                new Class<?>[]{serviceType},
                new LocalGamingHubService(remoteService));
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        if (method.getDeclaringClass() == Object.class) {
            return invokeRemote(method, args);
        }

        String path = endpointPath(method);
        if (path == null || !path.startsWith(ACCOUNT_API_PREFIX)) {
            return invokeRemote(method, args);
        }

        Context context = SamsungAccount.applicationContext();
        if (context == null || SamsungAccount.isVisible(context)) {
            return invokeRemote(method, args);
        }

        Type responseType = suspendResultType(method);
        Object localResponse = LocalPlayHistory.respond(context, path, method, args, responseType);
        if (localResponse != null) {
            return localResponse;
        }

        throttleRepeatedSkip(path);
        throw new AccountUnavailableException(path);
    }

    /**
     * Some callers retry a failed request immediately. Without network latency in between, that
     * would spin, so a request skipped again right after the previous skip waits first.
     */
    private static void throttleRepeatedSkip(String path) {
        long now = SystemClock.elapsedRealtime();
        Long previous;
        synchronized (LAST_SKIP_TIMES) {
            previous = LAST_SKIP_TIMES.put(path, now);
        }
        boolean onMainThread = Looper.myLooper() == Looper.getMainLooper();
        if (previous != null && now - previous < RETRY_THROTTLE_MILLIS && !onMainThread) {
            SystemClock.sleep(RETRY_THROTTLE_MILLIS);
            synchronized (LAST_SKIP_TIMES) {
                LAST_SKIP_TIMES.put(path, SystemClock.elapsedRealtime());
            }
        }
    }

    private Object invokeRemote(Method method, Object[] args) throws Throwable {
        try {
            return method.invoke(remoteService, args);
        } catch (InvocationTargetException ex) {
            throw ex.getCause() != null ? ex.getCause() : ex;
        }
    }

    /** @return The relative URL of a Retrofit HTTP method annotation, such as {@code @GET("/path")}. */
    private static String endpointPath(Method method) {
        for (Annotation annotation : method.getDeclaredAnnotations()) {
            try {
                Object value = annotation.annotationType().getMethod("value").invoke(annotation);
                if (value instanceof String && ((String) value).startsWith("/")) {
                    return (String) value;
                }
            } catch (ReflectiveOperationException ignored) {
                // Not an HTTP method annotation.
            }
        }
        return null;
    }

    /**
     * Kotlin suspend functions declare their result type as the type argument of the trailing
     * {@code Continuation<? super T>} parameter.
     */
    private static Type suspendResultType(Method method) {
        Type[] parameterTypes = method.getGenericParameterTypes();
        if (parameterTypes.length == 0 || !(parameterTypes[parameterTypes.length - 1] instanceof ParameterizedType)) {
            return null;
        }

        Type resultType = ((ParameterizedType) parameterTypes[parameterTypes.length - 1]).getActualTypeArguments()[0];
        if (resultType instanceof WildcardType) {
            Type[] lowerBounds = ((WildcardType) resultType).getLowerBounds();
            return lowerBounds.length > 0 ? lowerBounds[0] : null;
        }
        return resultType;
    }

    /** Thrown instead of calling an account-only endpoint that the server would reject. */
    static final class AccountUnavailableException extends IllegalStateException {
        AccountUnavailableException(String path) {
            super("Samsung account unavailable, skipped " + path);
        }
    }
}
