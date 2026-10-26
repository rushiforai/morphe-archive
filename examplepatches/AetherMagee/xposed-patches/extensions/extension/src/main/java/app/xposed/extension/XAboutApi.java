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
 * Calls X's own DefaultAboutProfileRepository (AboutProfileByScreenNameQuery) through
 * the app's authenticated GraphQL client. The repository is a Kotlin suspend API, so it
 * is driven with a hand-made continuation. R8 renamed most Kotlin and X members, which is
 * why everything past the class names handed over at patch time is found by shape.
 */
final class XAboutApi {
    interface Callback {
        /** info is null when X has no About data for the account. error is set on failure. */
        void onResult(AccountInfo info, Throwable error);
    }

    private static final String ABOUT_METADATA_CLASS = "com.x.models.profile.ProfileAboutMetadata";
    private static final String MINIMAL_USER_CLASS = "com.x.models.MinimalUser";

    private static volatile Object graphqlApi;
    private static Object repository;
    private static Method byScreenName;
    private static CoroutineContext emptyContext;
    private static boolean broken;

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
            Class<?> repoClass = Class.forName(Hooks.aboutRepositoryClass());
            Constructor<?> constructor = null;
            for (Constructor<?> c : repoClass.getConstructors()) {
                if (c.getParameterTypes().length == 1 && c.getParameterTypes()[0].isInstance(graphqlApi)) constructor = c;
            }
            for (Method m : repoClass.getMethods()) {
                Class<?>[] t = m.getParameterTypes();
                if (t.length == 2 && t[0] == String.class && t[1] == ContinuationImpl.class) byScreenName = m;
            }
            if (constructor == null || byScreenName == null) throw new NoSuchMethodException("AboutProfileRepository shape changed");
            emptyContext = emptyCoroutineContext();
            repository = constructor.newInstance(graphqlApi);
            return repository;
        } catch (Exception e) {
            broken = true;
            Log.e(Hooks.TAG, "X About lookups are unavailable", e);
            throw e;
        }
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

    /** Unpacks com.x.result.Result -> (MinimalUser, ProfileAboutMetadata?). */
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
            long userId = 0;
            boolean hasAboutField = false;
            for (Field f : success.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                if (f.getType().getName().equals(ABOUT_METADATA_CLASS)) {
                    about = f.get(success);
                    hasAboutField = true;
                } else if (f.getType().getName().equals(MINIMAL_USER_CLASS)) {
                    userId = userId(f.get(success));
                }
            }
            if (!hasAboutField) throw new IllegalStateException("Unexpected payload " + success);
            callback.onResult(about == null ? null : toInfo(about, userId), null);
        } catch (Throwable t) {
            callback.onResult(null, t);
        }
    }

    /** MinimalUser.getId().getUserId(), or 0. */
    private static long userId(Object minimalUser) {
        try {
            Object id = minimalUser.getClass().getMethod("getId").invoke(minimalUser);
            return (Long) id.getClass().getMethod("getUserId").invoke(id);
        } catch (Exception e) {
            return 0;
        }
    }

    private static AccountInfo toInfo(Object about, long userId) throws Exception {
        Class<?> c = about.getClass();
        String location = (String) c.getMethod("getBasedInCountry").invoke(about);
        String source = (String) c.getMethod("getAppSource").invoke(about);
        boolean accurate = (Boolean) c.getMethod("isLocationAccurate").invoke(about);
        String affiliation = null;
        Object affiliate = c.getMethod("getAffiliateData").invoke(about);
        if (affiliate != null) affiliation = (String) affiliate.getClass().getMethod("getUsername").invoke(affiliate);
        return new AccountInfo(location, source, location != null ? accurate : null, affiliation,
                System.currentTimeMillis(), AccountInfo.ORIGIN_X, userId);
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
