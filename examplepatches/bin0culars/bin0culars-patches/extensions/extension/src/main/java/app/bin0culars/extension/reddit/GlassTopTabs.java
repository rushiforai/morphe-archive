package app.bin0culars.extension.reddit;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

final class GlassTopTabs {

    private static final float TABS_WEIGHT = 1000f;
    private static final float HEADER_TABS_HEIGHT_DP = 8f;
    private static final float CAPSULE_GAP_DP = 8f;
    private static final float CAPSULE_INNER_PADDING_DP = 4f;

    private static final Map<Object, WeakReference<BelowWrapper>> BELOW_WRAPPERS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, WeakReference<Object>> WRAPPED_TO_ORIG =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<Boolean> IN_ROW = new ThreadLocal<>();

    private static final Function1<Object, Object> TABS_DRAW =
            new Function1<Object, Object>() {
                @Override
                public Object invoke(Object scope) {
                    try {
                        if (isTabsActive()) {
                            drawTabsCapsule(scope);
                        }
                    } catch (Throwable ignored) {
                    } finally {
                        try {
                            GlassNavPatch.drawContent(scope);
                        } catch (Throwable ignored) {
                        }
                    }
                    return null;
                }
            };

    private static volatile boolean hooksApplied;
    private static volatile WeakReference<Function2<Object, Object, Object>> currentBelow;
    private static volatile Object weightModifier;

    private static final class BelowWrapper implements Function2<Object, Object, Object> {
        final Function2<Object, Object, Object> original;

        BelowWrapper(Function2<Object, Object, Object> original) {
            this.original = original;
        }

        @Override
        public Object invoke(Object composer, Object changed) {
            if (isTabsActive() && !Boolean.TRUE.equals(IN_ROW.get())) {
                return null;
            }
            return original.invoke(composer, changed);
        }
    }

    private GlassTopTabs() {}

    static void setHooksApplied() {
        hooksApplied = true;
    }

    static boolean isTabsActive() {
        return GlassSearch.isSettingEnabled()
                && hooksApplied
                && !GlassSearch.isTablet(GlassSearch.getActivity());
    }

    @SuppressWarnings("unchecked")
    static Function2<?, ?, ?> wrapBelow(Function2<?, ?, ?> original) {
        try {
            if (original == null) {
                return null;
            }
            if (original instanceof BelowWrapper) {
                currentBelow = new WeakReference<>(((BelowWrapper) original).original);
                return original;
            }
            if (!isTabsActive()) {
                return original;
            }
            Function2<Object, Object, Object> typed = (Function2<Object, Object, Object>) original;
            BelowWrapper wrapper;
            synchronized (BELOW_WRAPPERS) {
                WeakReference<BelowWrapper> ref = BELOW_WRAPPERS.get(original);
                wrapper = ref != null ? ref.get() : null;
                if (wrapper == null) {
                    wrapper = new BelowWrapper(typed);
                    BELOW_WRAPPERS.put(original, new WeakReference<>(wrapper));
                }
            }
            currentBelow = new WeakReference<>(typed);
            return wrapper;
        } catch (Throwable ignored) {
            return original;
        }
    }

    static void inlineTabs(Object composer) {
        try {
            if (!isTabsActive() || composer == null) {
                return;
            }
            WeakReference<Function2<Object, Object, Object>> ref = currentBelow;
            Function2<Object, Object, Object> below = ref != null ? ref.get() : null;
            if (below == null) {
                return;
            }
            IN_ROW.set(Boolean.TRUE);
            try {
                below.invoke(composer, 0);
            } finally {
                IN_ROW.remove();
            }
        } catch (Throwable ignored) {
        }
    }

    static Object tabsModifier(Object modifier) {
        try {
            if (modifier == null) {
                return null;
            }
            if (!isTabsActive()) {
                WeakReference<Object> origRef;
                synchronized (WRAPPED_TO_ORIG) {
                    origRef = WRAPPED_TO_ORIG.get(modifier);
                }
                Object orig = origRef != null ? origRef.get() : null;
                return orig != null ? orig : modifier;
            }
            synchronized (WRAPPED_TO_ORIG) {
                if (WRAPPED_TO_ORIG.containsKey(modifier)) {
                    return modifier;
                }
            }
            Object weight = weightModifier;
            if (weight == null) {
                weight = newWeight(null, TABS_WEIGHT, true);
                if (weight == null) {
                    return modifier;
                }
                weightModifier = weight;
            }
            float gap = (GlassSearch.CIRCLE_EXTRA_DP / 2f) + CAPSULE_GAP_DP;
            Object outerPadded = GlassNavPatch.padding(weight, gap, 0f, gap, 0f, 0);
            Object withCapsule = GlassBlur.drawWithContent(outerPadded, TABS_DRAW);
            Object wrapped = GlassNavPatch.padding(
                    withCapsule, CAPSULE_INNER_PADDING_DP, 0f, CAPSULE_INNER_PADDING_DP, 0f, 0);
            if (wrapped == null) {
                return modifier;
            }
            synchronized (WRAPPED_TO_ORIG) {
                WRAPPED_TO_ORIG.put(wrapped, new WeakReference<>(modifier));
            }
            return wrapped;
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    static float headerTabsHeight(float original) {
        try {
            return isTabsActive() ? HEADER_TABS_HEIGHT_DP : original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    static void setHomePager(Object pager) {
        try {
            GlassTabPill.setHomePager(pager);
        } catch (Throwable ignored) {
        }
    }

    static Object tabIndicatorModifier(Object modifier) {
        try {
            if (modifier == null || !isTabsActive()) {
                return modifier;
            }
            return GlassTabPill.tabIndicatorModifier(modifier);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    static boolean tabsEvenly(boolean original) {
        try {
            return isTabsActive() || original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    private static void drawTabsCapsule(Object scope) {
        long size = GlassNavPatch.drawScopeSize(scope);
        float width = Float.intBitsToFloat((int) (size >>> 32));
        float height = Float.intBitsToFloat((int) size);
        if (width <= 0f || height <= 0f) {
            return;
        }
        float circleDiameter = GlassSearch.getCircleDiameterPx();
        float rectHeight = circleDiameter > 0f ? circleDiameter : height;
        if (rectHeight <= 0f) {
            return;
        }
        GlassTabPill.recordTabsBounds(height, rectHeight);
        float top = (height - rectHeight) / 2f;
        float radius = rectHeight / 2f;
        GlassSearch.drawGlassCapsule(scope, 0f, top, width, rectHeight, radius);
    }

    private static Object newWeight(Object slot, float weight, boolean fill) {
        return null;
    }

    private static Object thenModifier(Object first, Object second) {
        return first;
    }
}
