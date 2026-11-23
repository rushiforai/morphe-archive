package app.ffn.extension;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Merges identical API requests that are in flight at the same time. The first request (leader)
 * goes to the server. Identical requests started while it runs (followers) wait, then receive the
 * leader's decoded result through their own callbacks. If the leader fails or is cancelled,
 * followers send their own request instead, so a failure never spreads.
 * <p>
 * Called through {@link RequestHooks} when the "Merge duplicate requests" patch is applied.
 */
@SuppressWarnings("unused")
final class RequestDedup {
    private static final String TAG = "FFNTao";
    /**
     * Safety net for a leader that disappears without succeeding or failing. Its followers then send
     * their own request. Longer than any request timeout, so a slow leader is never duplicated.
     */
    private static final long FOLLOWER_TIMEOUT_MS = 600_000;

    private static final Object lock = new Object();
    private static final Map<String, Group> groupsByKey = new HashMap<>();
    private static final Map<Object, Group> groupsByLeader = new IdentityHashMap<>();
    private static final Map<Object, Group> groupsByFollower = new IdentityHashMap<>();
    /** Followers released to run on their own; they must not be deferred again. */
    private static final Set<Object> released = Collections.newSetFromMap(new IdentityHashMap<>());
    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    private static final class Group {
        final String key;
        final List<Object> followers = new ArrayList<>();

        Group(String key) {
            this.key = key;
        }
    }

    private RequestDedup() {
    }

    /**
     * Called when a request is about to be sent.
     *
     * @return true if an identical request is in flight and this one will reuse its result.
     */
    public static boolean shouldDefer(Object request) {
        try {
            synchronized (lock) {
                if (released.remove(request)) return false;

                String key = keyOf(request);
                if (key == null) return false;

                Group group = groupsByKey.get(key);
                if (group == null) {
                    group = new Group(key);
                    groupsByKey.put(key, group);
                    groupsByLeader.put(request, group);
                    return false;
                }
                group.followers.add(request);
                groupsByFollower.put(request, group);
            }
            Log.d(TAG, "merged duplicate request " + shortKey(request));
            mainHandler.postDelayed(() -> release(request, "leader timed out"), FOLLOWER_TIMEOUT_MS);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "shouldDefer", t);
            return false;
        }
    }

    /** Called when a request has decoded its result, just before its callbacks run. */
    public static void onSuccess(Object request) {
        Group group;
        synchronized (lock) {
            group = removeLeader(request);
        }
        if (group == null || group.followers.isEmpty()) return;

        Object result = RequestHooks.getResult(request);
        for (Object follower : group.followers) {
            try {
                RequestHooks.setResult(follower, result);
                RequestHooks.runCallbacks(follower);
            } catch (Throwable t) {
                Log.e(TAG, "replay to follower failed, sending it instead", t);
                send(follower, "replay failed");
            }
        }
    }

    /** Called when any request fails or is cancelled. */
    public static void onFailure(Object request) {
        Group group;
        synchronized (lock) {
            Group asFollower = groupsByFollower.remove(request);
            if (asFollower != null) {
                asFollower.followers.remove(request);
                return;
            }
            group = removeLeader(request);
        }
        if (group == null) return;
        for (Object follower : group.followers) {
            send(follower, "leader failed");
        }
    }

    private static Group removeLeader(Object request) {
        Group group = groupsByLeader.remove(request);
        if (group == null) return null;
        groupsByKey.remove(group.key);
        for (Object follower : group.followers) {
            groupsByFollower.remove(follower);
        }
        return group;
    }

    /** Lets a waiting follower send its own request, unless it was already resolved. */
    private static void release(Object follower, String reason) {
        synchronized (lock) {
            Group group = groupsByFollower.remove(follower);
            if (group == null) return;
            group.followers.remove(follower);
        }
        send(follower, reason);
    }

    /** Sends a follower's own request. Its group must already be resolved. */
    private static void send(Object follower, String reason) {
        synchronized (lock) {
            released.add(follower);
        }
        Log.d(TAG, "sending deferred request (" + reason + ") " + shortKey(follower));
        try {
            RequestHooks.execute(follower);
        } catch (Throwable t) {
            Log.e(TAG, "execute deferred request", t);
        }
    }

    /**
     * Identity of a request: every instance field declared by its class. Returns null, meaning
     * "never merge", if any value can't be compared by its text form.
     */
    static String keyOf(Object request) throws IllegalAccessException {
        StringBuilder key = new StringBuilder(request.getClass().getName());
        for (Field field : request.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            Object value = field.get(request);
            String text = describe(value);
            if (text == null) return null;
            key.append('|').append(text);
        }
        return key.toString();
    }

    private static String describe(Object value) {
        return describe(value, 0);
    }

    private static String describe(Object value, int depth) {
        if (value == null) return "null";
        if (depth > 4) return null;
        if (value instanceof Collection) {
            StringBuilder text = new StringBuilder("[");
            for (Object item : (Collection<?>) value) {
                String itemText = describe(item, depth + 1);
                if (itemText == null) return null;
                text.append(itemText).append(',');
            }
            return text.append(']').toString();
        }
        if (value.getClass().isArray()) return arrayText(value, depth);
        if (hasOwnToString(value)) return value.getClass().getName() + "=" + value;
        // The app's request packets and filters (networkpacket.*) are plain data without toString.
        if (value.getClass().getName().contains(".networkpacket.")) return fieldsText(value, depth);
        return null;
    }

    private static String arrayText(Object array, int depth) {
        if (array instanceof byte[]) return null;
        StringBuilder text = new StringBuilder("[");
        int length = java.lang.reflect.Array.getLength(array);
        for (int i = 0; i < length; i++) {
            String itemText = describe(java.lang.reflect.Array.get(array, i), depth + 1);
            if (itemText == null) return null;
            text.append(itemText).append(',');
        }
        return text.append(']').toString();
    }

    private static String fieldsText(Object value, int depth) {
        StringBuilder text = new StringBuilder(value.getClass().getName()).append('{');
        for (Field field : value.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            try {
                field.setAccessible(true);
                String fieldText = describe(field.get(value), depth + 1);
                if (fieldText == null) return null;
                text.append(field.getName()).append('=').append(fieldText).append(',');
            } catch (IllegalAccessException e) {
                return null;
            }
        }
        return text.append('}').toString();
    }

    private static boolean hasOwnToString(Object value) {
        try {
            return value.getClass().getMethod("toString").getDeclaringClass() != Object.class;
        } catch (NoSuchMethodException e) {
            return false;
        }
    }

    private static String shortKey(Object request) {
        try {
            String key = keyOf(request);
            if (key == null) return "?";
            int api = key.indexOf("/api/");
            return api >= 0 ? key.substring(api, Math.min(key.length(), api + 120)) : key;
        } catch (Throwable t) {
            return "?";
        }
    }
}
