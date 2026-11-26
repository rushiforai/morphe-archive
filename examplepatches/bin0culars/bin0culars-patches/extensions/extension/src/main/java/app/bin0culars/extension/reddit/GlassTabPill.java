package app.bin0culars.extension.reddit;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.functions.Function1;

final class GlassTabPill {

    private static final int MAX_WALK_DEPTH = 5;
    private static final float PILL_INSET_X_DP = 2f;
    private static final float PILL_INSET_Y_DP = 4f;

    private static final Map<Object, Boolean> INDICATOR_MATCH_CACHE = new WeakHashMap<>();
    private static final ConcurrentHashMap<Class<?>, Field[]> DECLARED_FIELDS_CACHE =
            new ConcurrentHashMap<>();

    private static volatile WeakReference<Object> homePagerRef;
    private static volatile float lastTabsHeightPx;
    private static volatile float lastCapsuleHeightPx;

    private static final Function1<Object, Object> PILL_DRAW =
            new Function1<Object, Object>() {
                @Override
                public Object invoke(Object scope) {
                    try {
                        if (!GlassTopTabs.isTabsActive()) {
                            GlassNavPatch.drawContent(scope);
                            return null;
                        }
                        drawTabPill(scope);
                    } catch (Throwable ignored) {
                    }
                    // Intentionally omit drawContent when active so the 2dp underline stays hidden.
                    return null;
                }
            };

    private GlassTabPill() {}

    static void setHomePager(Object pager) {
        try {
            if (pager == null) {
                return;
            }
            WeakReference<Object> ref = homePagerRef;
            Object current = ref != null ? ref.get() : null;
            if (current != pager) {
                homePagerRef = new WeakReference<>(pager);
                synchronized (INDICATOR_MATCH_CACHE) {
                    INDICATOR_MATCH_CACHE.clear();
                }
            }
        } catch (Throwable ignored) {
        }
    }

    static void recordTabsBounds(float tabsHeightPx, float capsuleHeightPx) {
        lastTabsHeightPx = tabsHeightPx;
        lastCapsuleHeightPx = capsuleHeightPx;
    }

    static Object tabIndicatorModifier(Object modifier) {
        try {
            if (modifier == null || !GlassTopTabs.isTabsActive()) {
                return modifier;
            }
            WeakReference<Object> ref = homePagerRef;
            Object homePager = ref != null ? ref.get() : null;
            if (homePager == null) {
                return modifier;
            }
            Boolean cached;
            synchronized (INDICATOR_MATCH_CACHE) {
                cached = INDICATOR_MATCH_CACHE.get(modifier);
            }
            boolean matches;
            if (cached != null) {
                matches = cached;
            } else {
                matches = reachesObject(modifier, homePager, new IdentityHashMap<>(), 0);
                synchronized (INDICATOR_MATCH_CACHE) {
                    INDICATOR_MATCH_CACHE.put(modifier, matches);
                }
            }
            return matches ? GlassBlur.drawWithContent(modifier, PILL_DRAW) : modifier;
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    private static boolean reachesObject(
            Object current, Object target, Map<Object, Integer> visited, int depth) {
        if (current == null || depth > MAX_WALK_DEPTH) {
            return false;
        }
        if (current == target) {
            return true;
        }
        Integer prevDepth = visited.get(current);
        if (prevDepth != null && prevDepth <= depth) {
            return false;
        }
        visited.put(current, depth);
        if (depth == MAX_WALK_DEPTH || shouldSkipClass(current.getClass())) {
            return false;
        }
        for (Class<?> cls = current.getClass(); cls != null && cls != Object.class; cls = cls.getSuperclass()) {
            if (shouldSkipClass(cls)) {
                break;
            }
            for (Field field : getDeclaredFields(cls)) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) {
                    continue;
                }
                try {
                    Object value = field.get(current);
                    if (value == target) {
                        return true;
                    }
                    if (value != null && reachesObject(value, target, visited, depth + 1)) {
                        return true;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return false;
    }

    private static Field[] getDeclaredFields(Class<?> cls) {
        Field[] cached = DECLARED_FIELDS_CACHE.get(cls);
        if (cached != null) {
            return cached;
        }
        Field[] fields = cls.getDeclaredFields();
        for (Field field : fields) {
            try {
                field.setAccessible(true);
            } catch (Throwable ignored) {
            }
        }
        DECLARED_FIELDS_CACHE.putIfAbsent(cls, fields);
        return fields;
    }

    private static boolean shouldSkipClass(Class<?> cls) {
        if (cls.isPrimitive() || cls.isArray() || cls == String.class) {
            return true;
        }
        String name = cls.getName();
        return name.startsWith("java.")
                || name.startsWith("android.")
                || name.startsWith("kotlin.");
    }

    private static void drawTabPill(Object scope) {
        long size = GlassNavPatch.drawScopeSize(scope);
        float w = Float.intBitsToFloat((int) (size >>> 32));
        float h = Float.intBitsToFloat((int) size);
        float tabsHeight = lastTabsHeightPx;
        float capsuleHeight = lastCapsuleHeightPx;
        if (w <= 0f || h <= 0f || tabsHeight <= 0f || capsuleHeight <= 0f) {
            return;
        }
        float density = GlassNavPatch.getDensity();
        float pillHeight = capsuleHeight - (2f * PILL_INSET_Y_DP * density);
        float pillLeft = PILL_INSET_X_DP * density;
        float pillWidth = w - (2f * pillLeft);
        if (pillWidth <= 0f || pillHeight <= 0f) {
            return;
        }
        float pillTop = (h - (tabsHeight / 2f)) - (pillHeight / 2f);
        float radius = Math.min(pillWidth, pillHeight) / 2f;
        GlassPill.drawPill(scope, pillLeft, pillTop, pillWidth, pillHeight, radius);
    }
}
