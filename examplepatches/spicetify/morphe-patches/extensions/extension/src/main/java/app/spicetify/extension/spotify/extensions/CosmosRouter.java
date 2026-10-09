package app.spicetify.extension.spotify.extensions;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Spotify's cosmos router as {@link PlayerBridge} uses it: a request goes in, its answers come back
 * through a {@link Callback}, and a {@link Cancel} ends it. {@link #reflective} adapts the router
 * Spotify's own services use; tests use a fake.
 */
interface CosmosRouter {
    /**
     * Sends {@code action} (POST, GET or SUB) to {@code uri}. Answers arrive on Spotify's core
     * thread. Throws when it can't send, as when Spotify has destroyed the router.
     */
    Cancel resolve(String action, String uri, byte[] body, Callback callback);

    /** True once Spotify has destroyed the router, as it does on logout. */
    boolean destroyed();

    interface Callback {
        void onResponse(int status, byte[] body);

        void onError(Throwable error);
    }

    interface Cancel {
        void cancel();
    }

    /**
     * The router of a {@code SharedCosmosRouterService}: requests go to its
     * {@code RemoteNativeRouter.performNativeResolve}, where Spotify's own transports end. Its
     * classes keep their real names, but the extension doesn't compile against them. Each one is
     * looked up here, through the service's class loader, so a renamed one fails now and only once.
     */
    static CosmosRouter reflective(Object sharedCosmosRouterService) throws ReflectiveOperationException {
        return new Reflective(sharedCosmosRouterService);
    }

    final class Reflective implements CosmosRouter {
        private final ClassLoader loader;
        private final Object remoteNativeRouter;
        private final Class<?> callbackClass;
        private final Constructor<?> newRequest;
        private final Method performNativeResolve;
        private final Method getRouterDestroyed;
        private final Method getStatus;
        private final Method getBody;
        private final Method release;

        Reflective(Object service) throws ReflectiveOperationException {
            loader = service.getClass().getClassLoader();
            remoteNativeRouter = service.getClass().getMethod("getRemoteNativeRouter").invoke(service);
            Class<?> requestClass = type("com.spotify.cosmos.cosmos.Request");
            callbackClass = type("com.spotify.cosmos.cosmos.ResolveCallback");
            Class<?> responseClass = type("com.spotify.cosmos.cosmos.Response");
            newRequest = requestClass.getConstructor(String.class, String.class, byte[].class);
            Class<?> routerClass = remoteNativeRouter.getClass();
            performNativeResolve = routerClass.getMethod("performNativeResolve", requestClass, callbackClass);
            getRouterDestroyed = routerClass.getMethod("getRouterDestroyed");
            getStatus = responseClass.getMethod("getStatus");
            getBody = responseClass.getMethod("getBody");
            // From the interface: the Lifetime Spotify returns may be a class the extension can't access.
            release = type("com.spotify.cosmos.cosmos.Lifetime").getMethod("release");
        }

        private Class<?> type(String name) throws ClassNotFoundException {
            return Class.forName(name, false, loader);
        }

        @Override
        public Cancel resolve(String action, String uri, byte[] body, Callback callback) {
            Object proxy = Proxy.newProxyInstance(loader, new Class<?>[] {callbackClass},
                    (self, method, args) -> answer(callback, self, method, args));
            try {
                Object request = newRequest.newInstance(action, uri, body);
                // Spotify's own resolve checks the flag and calls in while it holds this monitor,
                // and destroy() takes it to set the flag, so nothing reaches a destroyed native router.
                synchronized (remoteNativeRouter) {
                    if (destroyed()) throw new IllegalStateException("Spotify's router is destroyed");
                    return new Release(performNativeResolve.invoke(remoteNativeRouter, request, proxy), proxy);
                }
            } catch (ReflectiveOperationException e) {
                throw unchecked(e);
            }
        }

        @Override
        public boolean destroyed() {
            try {
                return (Boolean) getRouterDestroyed.invoke(remoteNativeRouter);
            } catch (ReflectiveOperationException e) {
                throw unchecked(e);
            }
        }

        /** Spotify's {@code ResolveCallback}, mapped onto {@code callback}. */
        private Object answer(Callback callback, Object self, Method method, Object[] args) {
            switch (method.getName()) {
                case "onResolved":
                    resolved(callback, args[0]);
                    return null;
                case "onError":
                    callback.onError((Throwable) args[0]);
                    return null;
                // Spotify may keep the callback in a hashed collection.
                case "equals":
                    return self == args[0];
                case "hashCode":
                    return System.identityHashCode(self);
                case "toString":
                    return "Spicetify ResolveCallback@" + Integer.toHexString(System.identityHashCode(self));
                default:
                    return null;
            }
        }

        /** Reads Spotify's {@code Response}; one it can't read becomes an error. */
        private void resolved(Callback callback, Object response) {
            int status;
            byte[] body;
            try {
                status = (Integer) getStatus.invoke(response);
                body = (byte[]) getBody.invoke(response);
            } catch (ReflectiveOperationException | RuntimeException e) {
                callback.onError(e);
                return;
            }
            callback.onResponse(status, body);
        }

        private static RuntimeException unchecked(ReflectiveOperationException e) {
            return new IllegalStateException(e instanceof InvocationTargetException ? e.getCause() : e);
        }

        /**
         * Releases one request's {@code Lifetime}. It also holds the request's callback proxy:
         * Spotify may hold that only weakly, and the bridge keeps this Cancel while the request lives.
         */
        private final class Release implements Cancel {
            private final Object lifetime;
            private final Object callback;

            Release(Object lifetime, Object callback) {
                this.lifetime = lifetime;
                this.callback = callback;
            }

            @Override
            public void cancel() {
                try {
                    release.invoke(lifetime);
                } catch (ReflectiveOperationException e) {
                    throw unchecked(e);
                }
            }
        }
    }
}
