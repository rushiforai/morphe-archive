package app.xposed.extension;

import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/**
 * Calls X's own about-profile repository (AboutProfileByScreenNameQuery) through the app's
 * authenticated GraphQL client. The repository is a Kotlin suspend API, so it is driven with
 * a hand-made continuation. R8 renamed X's classes and fields and removed the getters, so
 * their names come from the patch.
 */
final class XAboutApi {
    interface Callback {
        /** info is null when X has no About data for the account. error is set on failure. */
        void onResult(AccountInfo info, Throwable error);
    }

    private static volatile Object graphqlApi;
    private static Object repository;
    private static Method byScreenName;
    private static CoroutineContext emptyContext;
    private static boolean broken;
    private static Class<?> aboutClass, userClass;
    private static Field basedIn, appSource, locationAccurate, affiliate, affiliateUsername, userId, userIdValue;

    private XAboutApi() {
    }

    static void setGraphqlApi(Object api) {
        synchronized (XAboutApi.class) {
            graphqlApi = api;
            repository = null;
        }
    }

    static boolean isAvailable() {
        return graphqlApi != null && !broken;
    }

    static void fetch(String handle, Callback callback) {
        try {
            Object repo;
            synchronized (XAboutApi.class) {
                repo = repository();
            }
            Object result = byScreenName.invoke(repo, handle, new ResultContinuation(callback));
            if (!isSuspended(result)) deliver(result, callback);
        } catch (Throwable t) {
            callback.onResult(null, t);
        }
    }

    private static Object repository() throws Exception {
        if (repository != null) return repository;
        try {
            // "repository|about|basedInCountry|appSource|isLocationAccurate|affiliateData|username|user|id|idValue"
            String[] spec = Hooks.aboutApiSpec().split("\\|");
            Class<?> repoClass = Class.forName(spec[0]);
            aboutClass = Class.forName(spec[1]);
            basedIn = field(aboutClass, spec[2]);
            appSource = field(aboutClass, spec[3]);
            locationAccurate = field(aboutClass, spec[4]);
            affiliate = field(aboutClass, spec[5]);
            affiliateUsername = field(affiliate.getType(), spec[6]);
            userClass = Class.forName(spec[7]);
            userId = field(userClass, spec[8]);
            userIdValue = field(userId.getType(), spec[9]);

            Constructor<?> constructor = null;
            for (Constructor<?> c : repoClass.getConstructors()) {
                if (c.getParameterTypes().length == 1 && c.getParameterTypes()[0].isInstance(graphqlApi)) constructor = c;
            }
            for (Method m : repoClass.getMethods()) {
                Class<?>[] t = m.getParameterTypes();
                if (t.length == 2 && t[0] == String.class && t[1] == ContinuationImpl.class) byScreenName = m;
            }
            if (constructor == null || byScreenName == null) throw new NoSuchMethodException("About repository shape changed");
            emptyContext = emptyCoroutineContext();
            repository = constructor.newInstance(graphqlApi);
            return repository;
        } catch (Exception e) {
            broken = true;
            Log.e(Hooks.TAG, "X About lookups are unavailable", e);
            throw e;
        }
    }

    private static Field field(Class<?> c, String name) throws NoSuchFieldException {
        Field f = c.getDeclaredField(name);
        f.setAccessible(true);
        return f;
    }

    /** kotlin.coroutines.EmptyCoroutineContext's singleton; its INSTANCE field is renamed in X. */
    private static CoroutineContext emptyCoroutineContext() throws Exception {
        Class<?> c = Class.forName("kotlin.coroutines.EmptyCoroutineContext");
        for (Field f : c.getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers()) && f.getType() == c) {
                f.setAccessible(true);
                return (CoroutineContext) f.get(null);
            }
        }
        throw new NoSuchFieldException("EmptyCoroutineContext singleton");
    }

    private static boolean isSuspended(Object result) {
        return result instanceof Enum && "COROUTINE_SUSPENDED".equals(((Enum<?>) result).name());
    }

    /** Unpacks X's Result -> (user, about metadata or null). */
    private static void deliver(Object result, Callback callback) {
        try {
            if (result == null) throw new IllegalStateException("null result");
            // kotlin.Result.Failure, thrown from inside the coroutine.
            if (result.getClass().getName().equals("kotlin.Result$Failure")) {
                throw new IllegalStateException("Request failed", findThrowable(result));
            }
            Throwable failure = findThrowable(result);
            if (failure != null) throw new IllegalStateException("Request failed", failure);

            Object success = firstInstanceField(result);
            if (success == null) throw new IllegalStateException("Unexpected result " + result);
            Object about = null;
            long id = 0;
            boolean hasAboutField = false;
            for (Field f : success.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                if (f.getType() == aboutClass) {
                    about = f.get(success);
                    hasAboutField = true;
                } else if (f.getType() == userClass) {
                    id = userId(f.get(success));
                }
            }
            if (!hasAboutField) throw new IllegalStateException("Unexpected payload " + success);
            callback.onResult(about == null ? null : toInfo(about, id), null);
        } catch (Throwable t) {
            callback.onResult(null, t);
        }
    }

    /** The user's numeric id, or 0. */
    private static long userId(Object user) throws IllegalAccessException {
        Object id = user == null ? null : userId.get(user);
        return id == null ? 0 : userIdValue.getLong(id);
    }

    private static AccountInfo toInfo(Object about, long id) throws IllegalAccessException {
        String location = (String) basedIn.get(about);
        String source = (String) appSource.get(about);
        boolean accurate = locationAccurate.getBoolean(about);
        Object affiliateData = affiliate.get(about);
        String affiliation = affiliateData == null ? null : (String) affiliateUsername.get(affiliateData);
        return new AccountInfo(location, source, location != null ? accurate : null, affiliation,
                System.currentTimeMillis(), AccountInfo.ORIGIN_X, id);
    }

    private static Throwable findThrowable(Object o) throws IllegalAccessException {
        for (Field f : o.getClass().getDeclaredFields()) {
            if (!Modifier.isStatic(f.getModifiers()) && Throwable.class.isAssignableFrom(f.getType())) {
                f.setAccessible(true);
                Throwable t = (Throwable) f.get(o);
                return t != null ? t : new IllegalStateException(o.toString());
            }
        }
        return null;
    }

    private static Object firstInstanceField(Object o) throws IllegalAccessException {
        for (Field f : o.getClass().getDeclaredFields()) {
            if (!Modifier.isStatic(f.getModifiers())) {
                f.setAccessible(true);
                return f.get(o);
            }
        }
        return null;
    }

    /** Receives the repository's result when it resumes asynchronously. */
    private static final class ResultContinuation extends ContinuationImpl {
        private final Callback callback;

        ResultContinuation(Callback callback) {
            super(new Root());
            this.callback = callback;
        }

        @Override
        public Object invokeSuspend(Object result) {
            deliver(result, callback);
            return null;
        }
    }

    /** Completion of ResultContinuation; nothing is waiting on it. */
    private static final class Root implements Continuation<Object> {
        @Override
        public CoroutineContext getContext() {
            return emptyContext;
        }

        @Override
        public void resumeWith(Object result) {
        }
    }
}
