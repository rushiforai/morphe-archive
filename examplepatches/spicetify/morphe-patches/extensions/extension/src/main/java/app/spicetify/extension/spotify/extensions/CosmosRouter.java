package app.spicetify.extension.spotify.extensions;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * Spotify's cosmos router as {@link PlayerBridge} uses it: a request goes in, its answers come back
 * through a {@link Callback}, and a {@link Cancel} ends it. {@link #reflective} adapts the native router
 * Spotify's own services use; tests use a fake.
 */
interface CosmosRouter {
    /**
     * Sends {@code action} (POST, GET or SUB) to {@code uri}. Answers arrive on Spotify's core
     * thread. Throws when it can't send, as when Spotify has destroyed the router.
     */
    Cancel resolve(String action, String uri, byte[] body, Callback callback);

    /** True once Spotify has begun to destroy the router, as it does on logout. */
    boolean destroyed();

    interface Callback {
        void onResponse(int status, byte[] body);

        void onError(Throwable error);
    }

    interface Cancel {
        void cancel();
    }

    /**
     * The router of a Spotify cosmos service, its {@code NativeRouter}: requests go to its {@code resolve},
     * where Spotify's own transports end. Its classes keep their real names, but the extension doesn't
     * compile against them. Each one is looked up here, through the router's class loader, so a renamed
     * one fails now and only once.
     */
    static CosmosRouter reflective(Object nativeRouter) throws ReflectiveOperationException {
        return new Reflective(nativeRouter);
    }

    /**
     * Spotify is about to shut {@code nativeRouter} down (H1's second hook): nothing is sent to it from now on, and
     * this returns only once every send that got in has returned. Ignored for a router never wrapped.
     */
    static void shutdown(Object nativeRouter) {
        Reflective gone = Reflective.LIVE.remove(nativeRouter);
        if (gone != null) gone.destroy();
    }

    final class Reflective implements CosmosRouter {
        /** The routers H1 wrapped that Spotify hasn't shut down. By identity: a router's equals is Spotify's. */
        static final Map<Object, Reflective> LIVE = Collections.synchronizedMap(new IdentityHashMap<>());

        private final ClassLoader loader;
        private final Object nativeRouter;
        private final Class<?> callbackClass;
        private final Constructor<?> newRequest;
        private final Method resolve;
        private final Method getStatus;
        private final Method getBody;
        private final Method release;
        /**
         * Spotify's own service guards its router the same way: a send holds the read side while it calls in,
         * and shutdown takes the write side to set the flag before it destroys the router. So a send is
         * either inside the router when shutdown starts, which then waits for it, or sees the flag.
         */
        private final ReentrantReadWriteLock lock = new ReentrantReadWriteLock();
        private volatile boolean destroyed;

        Reflective(Object nativeRouter) throws ReflectiveOperationException {
            this.nativeRouter = nativeRouter;
            loader = nativeRouter.getClass().getClassLoader();
            Class<?> requestClass = type("com.spotify.cosmos.cosmos.Request");
            callbackClass = type("com.spotify.cosmos.cosmos.ResolveCallback");
            Class<?> responseClass = type("com.spotify.cosmos.cosmos.Response");
            newRequest = requestClass.getConstructor(String.class, String.class, byte[].class);
            resolve = nativeRouter.getClass().getMethod("resolve", requestClass, callbackClass);
            getStatus = responseClass.getMethod("getStatus");
            getBody = responseClass.getMethod("getBody");
            // From the interface: the Lifetime Spotify returns may be a class the extension can't access.
            release = type("com.spotify.cosmos.cosmos.Lifetime").getMethod("release");
            LIVE.put(nativeRouter, this);
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
                lock.readLock().lock();
                try {
                    if (destroyed) throw new IllegalStateException("Spotify's router is destroyed");
                    return new Release(resolve.invoke(nativeRouter, request, proxy), proxy);
                } finally {
                    lock.readLock().unlock();
                }
            } catch (ReflectiveOperationException e) {
                throw unchecked(e);
            }
        }

        @Override
        public boolean destroyed() {
            return destroyed;
        }

        /** Sets the flag once no send is inside the router, so after this returns none gets in. */
        void destroy() {
            lock.writeLock().lock();
            try {
                destroyed = true;
            } finally {
                lock.writeLock().unlock();
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
