/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.inbox;

import app.morphe.extension.pinedrama.blockauthor.Reflect;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Tracks real native jobs. It neither starts a request nor invents a completion. */
final class InboxNativeRequests {
    static final Object LOCK = new Object();
    private static final List<RequestOwner> REQUESTS = new ArrayList<>();
    private static final Map<Class<?>, List<Field>> JOB_FIELDS = new WeakHashMap<>();
    private static Method completionRegistration;

    private InboxNativeRequests() {}

    /**
     * JobSupport's invokeOnCompletion(handler): its one public instance method that takes only a
     * Function1 and answers a handle. R8 renames it on every build, so it's found by that shape.
     */
    static Method completionRegistration(Class<?> type, Class<?> function) throws NoSuchMethodException {
        Method cached = completionRegistration;
        if (cached != null && cached.getDeclaringClass().isAssignableFrom(type)) return cached;
        for (Class<?> at = type; at != null; at = at.getSuperclass()) {
            if (!"kotlinx.coroutines.JobSupport".equals(at.getName())) continue;
            Method found = null;
            for (Method method : at.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                int modifiers = method.getModifiers();
                if (parameters.length != 1 || parameters[0] != function || !Modifier.isPublic(modifiers)
                        || Modifier.isStatic(modifiers) || method.getReturnType() == void.class) continue;
                if (found != null) throw new NoSuchMethodException("JobSupport has two completion registrations");
                found = method;
            }
            if (found == null) break;
            completionRegistration = found;
            return found;
        }
        throw new NoSuchMethodException("JobSupport completion registration");
    }

    static boolean allowed(Object target) {
        synchronized (LOCK) {
            for (InboxQueryOwners.Owner owner : InboxQueryOwners.forPagingTarget(target)) {
                if (owner.query.phase() != LoadedInboxQuery.Phase.IDLE) return false;
            }
            return true;
        }
    }

    /** Enter before the native method changes loading flags or schedules its coroutine. */
    static boolean begin(Object target) {
        synchronized (LOCK) {
            if (!allowed(target)) return false;
            record(target).entering++;
            return true;
        }
    }

    /** A native method returned normally. Its asynchronous jobs have independent lifetimes. */
    static void returned(Object target) {
        synchronized (LOCK) {
            RequestOwner request = find(target);
            if (request != null && request.entering > 0) request.entering--;
        }
    }

    static void launched(Object target, Object job) {
        if (target == null || job == null) return;
        synchronized (LOCK) {
            RequestOwner request = record(target);
            for (WeakReference<Object> old : request.jobs) if (old.get() == job) return;
            request.jobs.add(new WeakReference<>(job));
            try {
                ClassLoader loader = job.getClass().getClassLoader();
                Class<?> function = Class.forName("kotlin.jvm.functions.Function1", false, loader);
                Object unit = Class.forName("kotlin.Unit", false, loader).getField("LIZ").get(null);
                WeakReference<Object> capturedJob = new WeakReference<>(job);
                Object completion = Proxy.newProxyInstance(loader, new Class<?>[]{function}, (proxy, method, arguments) -> {
                    if (method.getName().equals("invoke")) {
                        synchronized (LOCK) {
                            for (int i = request.jobs.size() - 1; i >= 0; i--) {
                                Object old = request.jobs.get(i).get();
                                if (old == null || old == capturedJob.get()) request.jobs.remove(i);
                            }
                        }
                        return unit;
                    }
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return proxy == arguments[0];
                    return "Inbox request completion";
                });
                // JobSupport's invokeOnCompletion(handler) is the reviewed entry. It also
                // invokes the handler immediately when the genuine job has already completed.
                completionRegistration(job.getClass(), function).invoke(job, completion);
            } catch (ReflectiveOperationException | LinkageError failure) {
                // isCompleted remains an exact native fallback, never a timeout-based success.
                if (!(Reflect.invoke(job, "isCompleted") instanceof Boolean)) request.unreadable = true;
            }
        }
    }

    static boolean busy(Object target) {
        synchronized (LOCK) {
            RequestOwner request = find(target);
            if (request != null) {
                if (request.entering != 0 || request.unreadable) return true;
                for (int i = request.jobs.size() - 1; i >= 0; i--) {
                    Object old = request.jobs.get(i).get();
                    if (old == null || Boolean.TRUE.equals(Reflect.invoke(old, "isCompleted"))) request.jobs.remove(i);
                }
                if (!request.jobs.isEmpty()) return true;
            }
            // onLoadMore's outer coroutine launches a sibling job and can finish first. These
            // are the actual native refresh/load jobs, not a guessed loading timeout.
            String name = target == null ? "" : target.getClass().getName();
            if (!name.endsWith("NotificationCreatorResultViewModel") && !isRegularVm(target)) return false;
            List<Field> fields = jobFields(target.getClass());
            if (fields.isEmpty()) return true;
            for (Field field : fields) {
                Object job;
                try {
                    job = field.get(target);
                } catch (IllegalAccessException | RuntimeException failure) {
                    return true;
                }
                if (job != null && !Boolean.TRUE.equals(Reflect.invoke(job, "isCompleted"))) return true;
            }
            return false;
        }
    }

    /**
     * The view model's own native job fields: those typed as a coroutine (a JobSupport subclass),
     * declared on the result view model classes below BaseNotificationResultViewModel. R8 renames
     * the fields on every build, so they're found by type.
     */
    static List<Field> jobFields(Class<?> type) {
        synchronized (LOCK) {
            List<Field> cached = JOB_FIELDS.get(type);
            if (cached != null) return cached;
            List<Field> found = new ArrayList<>();
            for (Class<?> at = type; at != null && at.getName().endsWith("ResultViewModel")
                    && !at.getName().endsWith("BaseNotificationResultViewModel"); at = at.getSuperclass()) {
                for (Field field : at.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers()) || !isCoroutine(field.getType())) continue;
                    try {
                        field.setAccessible(true);
                        found.add(field);
                    } catch (RuntimeException failure) {
                        found.clear();
                        break;
                    }
                }
            }
            JOB_FIELDS.put(type, found);
            return found;
        }
    }

    private static boolean isCoroutine(Class<?> type) {
        for (Class<?> at = type; at != null; at = at.getSuperclass()) {
            if ("kotlinx.coroutines.JobSupport".equals(at.getName())) return true;
        }
        return false;
    }

    private static boolean isRegularVm(Object target) {
        for (Class<?> type = target == null ? null : target.getClass(); type != null; type = type.getSuperclass()) {
            if (type.getName().endsWith("NotificationResultViewModel")) return true;
        }
        return false;
    }

    private static RequestOwner find(Object target) {
        for (int i = REQUESTS.size() - 1; i >= 0; i--) {
            if (REQUESTS.get(i).target.get() == null) REQUESTS.remove(i);
        }
        for (RequestOwner request : REQUESTS) if (request.target.get() == target) return request;
        return null;
    }
    private static RequestOwner record(Object target) {
        RequestOwner request = find(target);
        if (request == null) { request = new RequestOwner(target); REQUESTS.add(request); }
        return request;
    }
    private static final class RequestOwner {
        final WeakReference<Object> target;
        final List<WeakReference<Object>> jobs = new ArrayList<>();
        int entering;
        boolean unreadable;
        RequestOwner(Object target) { this.target = new WeakReference<>(target); }
    }
    static void resetForTests() { synchronized (LOCK) { REQUESTS.clear(); JOB_FIELDS.clear(); } }
}
