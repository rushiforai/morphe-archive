package app.bin0culars.extension.reddit;

import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;
import kotlin.jvm.functions.Function0;

final class GlassTopBarState {

    private static final Object LOCK = new Object();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final Map<Object, Object> FEED_STATES = new WeakHashMap<>();
    private static final Map<Object, Function0<?>> SCROLLED_CHECKS = new WeakHashMap<>();
    private static volatile WeakReference<Object> activeListRef;
    private static volatile Object feedAtTopState;
    private static volatile Method getValueMethod;
    private static volatile Method setValueMethod;
    private static volatile boolean initialized;

    private GlassTopBarState() {}

    static void onFeedAtTop(boolean atTop) {
        try {
            Object state = ensureState();
            Method setter = setValueMethod;
            if (state != null && setter != null) {
                setter.invoke(state, Boolean.valueOf(atTop));
            }
        } catch (Throwable ignored) {
        }
    }

    static void registerFeed(Object listState, Object feedState) {
        try {
            if (listState == null || feedState == null) {
                return;
            }
            boolean becameActive = false;
            synchronized (LOCK) {
                FEED_STATES.put(listState, feedState);
                if (feedVisible(feedState, 0)) {
                    Object prev = activeListRef != null ? activeListRef.get() : null;
                    if (prev != listState) {
                        activeListRef = new WeakReference<>(listState);
                        becameActive = true;
                    }
                }
            }
            if (becameActive) {
                MAIN_HANDLER.post(GlassTopBarState::notifyHeader);
            }
        } catch (Throwable ignored) {
        }
    }

    static boolean isFeedAtTop() {
        try {
            Object state = ensureState();
            Method getter = getValueMethod;
            if (state != null && getter != null) {
                getter.invoke(state);
            }
            Object listState = pickVisibleList();
            if (listState == null) {
                return true;
            }
            Function0<?> fn = getScrolledCheck(listState);
            if (fn == null) {
                return true;
            }
            Object scrolled = fn.invoke();
            return !(scrolled instanceof Boolean) || !((Boolean) scrolled);
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static void notifyHeader() {
        try {
            Object state = ensureState();
            Method getter = getValueMethod;
            Method setter = setValueMethod;
            if (state != null && getter != null && setter != null) {
                Object current = getter.invoke(state);
                setter.invoke(state, Boolean.valueOf(!Boolean.TRUE.equals(current)));
            }
        } catch (Throwable ignored) {
        }
    }

    private static Object pickVisibleList() {
        synchronized (LOCK) {
            Object candidate = activeListRef != null ? activeListRef.get() : null;
            if (candidate != null) {
                Object feedState = FEED_STATES.get(candidate);
                if (feedState != null && feedVisible(feedState, 0)) {
                    return candidate;
                }
            }
            for (Map.Entry<Object, Object> entry : FEED_STATES.entrySet()) {
                Object feedState = entry.getValue();
                if (feedState != null && feedVisible(feedState, 0)) {
                    Object listState = entry.getKey();
                    activeListRef = new WeakReference<>(listState);
                    return listState;
                }
            }
            return null;
        }
    }

    private static Function0<?> getScrolledCheck(Object listState) {
        synchronized (LOCK) {
            Function0<?> cached = SCROLLED_CHECKS.get(listState);
            if (cached != null) {
                return cached;
            }
        }
        Object created = scrolledCheck(listState, 0, null);
        if (!(created instanceof Function0<?>)) {
            return null;
        }
        Function0<?> fn = (Function0<?>) created;
        synchronized (LOCK) {
            Function0<?> existing = SCROLLED_CHECKS.get(listState);
            if (existing != null) {
                return existing;
            }
            SCROLLED_CHECKS.put(listState, fn);
            return fn;
        }
    }

    private static Object ensureState() {
        if (initialized) {
            return feedAtTopState;
        }
        synchronized (LOCK) {
            if (!initialized) {
                try {
                    Object state = createState(Boolean.TRUE);
                    if (state != null) {
                        Class<?> cls = state.getClass();
                        Method getter = cls.getMethod("getValue");
                        Method setter = cls.getMethod("setValue", Object.class);
                        getter.setAccessible(true);
                        setter.setAccessible(true);
                        getValueMethod = getter;
                        setValueMethod = setter;
                        feedAtTopState = state;
                    }
                } catch (Throwable ignored) {
                    feedAtTopState = null;
                    getValueMethod = null;
                    setValueMethod = null;
                } finally {
                    initialized = true;
                }
            }
            return feedAtTopState;
        }
    }

    private static boolean feedVisible(Object feedState, int spare) {
        return false;
    }

    private static Object scrolledCheck(Object listState, int spareK, Object spare) {
        return null;
    }

    private static Object createState(Object initial) {
        return null;
    }
}
