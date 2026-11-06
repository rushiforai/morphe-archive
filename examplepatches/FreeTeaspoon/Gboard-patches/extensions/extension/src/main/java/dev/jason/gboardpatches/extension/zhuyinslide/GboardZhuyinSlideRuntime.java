package dev.jason.gboardpatches.extension.zhuyinslide;

import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

import dev.jason.gboardpatches.extension.toprowswipe.GboardTopRowSwipeRuntime;

public final class GboardZhuyinSlideRuntime {
    private static final Object metadataLock = new Object();
    private static final WeakIdentityMap<Object> patchedMetadataByOriginal =
            new WeakIdentityMap<Object>();
    private static final WeakIdentityMap<Boolean> patchedMetadataMarkers =
            new WeakIdentityMap<Boolean>();
    private static final WeakIdentityMap<Boolean> unpatchedMetadataMarkers =
            new WeakIdentityMap<Boolean>();
    private static final WeakIdentityMap<PointerAnchor> pointerAnchors =
            new WeakIdentityMap<PointerAnchor>();
    private static final WeakIdentityMap<WeakReference<GboardZhuyinSlideRuntimeSupport>>
            handlesByClassLoader =
            new WeakIdentityMap<WeakReference<GboardZhuyinSlideRuntimeSupport>>();

    private GboardZhuyinSlideRuntime() {
    }

    public static Object patchIncomingSoftKeyMetadata(Object softKeyView, Object metadata) {
        if (metadata == null || isPatchedMetadata(metadata)) {
            return metadata;
        }
        synchronized (metadataLock) {
            if (Boolean.TRUE.equals(unpatchedMetadataMarkers.get(metadata))) {
                return metadata;
            }
            Object cached = patchedMetadataByOriginal.get(metadata);
            if (cached != null) {
                return cached;
            }
            try {
                GboardZhuyinSlideRuntimeSupport handles = handlesFor(softKeyView, metadata);
                Object pressAction = handles.pressAction(metadata);
                Object longPressAction = handles.longPressAction(metadata);
                GboardZhuyinSlidePolicy.PatchPlan plan = GboardZhuyinSlidePolicy.plan(
                        handles.primaryLabel(metadata),
                        handles.singlePayload(pressAction),
                        handles.payloadTokens(longPressAction),
                        handles.slideUpAction(metadata) != null,
                        handles.slideDownAction(metadata) != null);
                if (plan.isEmpty()) {
                    unpatchedMetadataMarkers.put(metadata, Boolean.TRUE);
                    return metadata;
                }
                Object patched = handles.buildPatchedMetadata(metadata, plan);
                if (patched == null || patched == metadata) {
                    unpatchedMetadataMarkers.put(metadata, Boolean.TRUE);
                    return metadata;
                }
                GboardTopRowSwipeRuntime.inheritPatchedMetadataForPatchInterop(
                        metadata, patched);
                patchedMetadataByOriginal.put(metadata, patched);
                patchedMetadataMarkers.put(patched, Boolean.TRUE);
                return patched;
            } catch (Throwable ignored) {
                unpatchedMetadataMarkers.put(metadata, Boolean.TRUE);
                return metadata;
            }
        }
    }

    public static boolean isPatchedMetadata(Object metadata) {
        return metadata != null && Boolean.TRUE.equals(patchedMetadataMarkers.get(metadata));
    }

    public static void inheritPatchedMetadata(Object source, Object target) {
        if (source == null || target == null || source == target || !isPatchedMetadata(source)) {
            return;
        }
        patchedMetadataMarkers.put(target, Boolean.TRUE);
    }

    public static boolean maybeCaptureAndShouldSuppressRetarget(
            Object tracker, Object incomingSoftKeyView, float x, float y) {
        if (tracker == null) {
            return false;
        }
        PointerAnchor anchor = pointerAnchors.get(tracker);
        try {
            GboardZhuyinSlideRuntimeSupport handles = handlesFor(tracker, incomingSoftKeyView);
            if (anchor == null) {
                if (handles.hasCurrentOwner(tracker) || incomingSoftKeyView == null) {
                    return false;
                }
                Object metadata = handles.currentMetadata(incomingSoftKeyView);
                if (!isPatchedMetadata(metadata)) {
                    return false;
                }
                anchor = new PointerAnchor(incomingSoftKeyView);
                pointerAnchors.put(tracker, anchor);
            }

            Object anchorMetadata = handles.currentMetadata(anchor.softKeyView);
            if (!isPatchedMetadata(anchorMetadata)) {
                return false;
            }
            Object resolvedAction = handles.resolveGestureAction(tracker, x, y);
            return handles.isVerticalAction(resolvedAction)
                    && handles.findExactAction(anchorMetadata, resolvedAction) != null;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void clearPointerState(Object tracker) {
        if (tracker != null) {
            pointerAnchors.remove(tracker);
        }
    }

    private static GboardZhuyinSlideRuntimeSupport handlesFor(Object primary, Object fallback)
            throws ReflectiveOperationException {
        Object classLoaderOwner = primary != null ? primary : fallback;
        if (classLoaderOwner == null) {
            throw new ClassNotFoundException("Missing target class loader owner");
        }
        ClassLoader classLoader = classLoaderOwner.getClass().getClassLoader();
        WeakReference<GboardZhuyinSlideRuntimeSupport> cachedReference =
                handlesByClassLoader.get(classLoader);
        GboardZhuyinSlideRuntimeSupport cached =
                cachedReference == null ? null : cachedReference.get();
        if (cached != null) {
            return cached;
        }
        synchronized (handlesByClassLoader) {
            cachedReference = handlesByClassLoader.get(classLoader);
            cached = cachedReference == null ? null : cachedReference.get();
            if (cached == null) {
                cached = new GboardZhuyinSlideRuntimeSupport(classLoader);
                handlesByClassLoader.put(classLoader,
                        new WeakReference<GboardZhuyinSlideRuntimeSupport>(cached));
            }
            return cached;
        }
    }

    private static final class PointerAnchor {
        final Object softKeyView;

        PointerAnchor(Object softKeyView) {
            this.softKeyView = softKeyView;
        }
    }

    private static final class WeakIdentityMap<V> {
        private final ReferenceQueue<Object> referenceQueue = new ReferenceQueue<Object>();
        private final Map<IdentityWeakReference, V> values =
                new HashMap<IdentityWeakReference, V>();

        synchronized V get(Object key) {
            if (key == null) {
                return null;
            }
            purgeQueuedKeys();
            return values.get(new IdentityWeakReference(key));
        }

        synchronized void put(Object key, V value) {
            if (key == null) {
                return;
            }
            purgeQueuedKeys();
            values.put(new IdentityWeakReference(key, referenceQueue), value);
        }

        synchronized V remove(Object key) {
            if (key == null) {
                return null;
            }
            purgeQueuedKeys();
            return values.remove(new IdentityWeakReference(key));
        }

        private void purgeQueuedKeys() {
            Reference<?> queued;
            while ((queued = referenceQueue.poll()) != null) {
                values.remove(queued);
            }
        }
    }

    private static final class IdentityWeakReference extends WeakReference<Object> {
        private final int identityHashCode;

        IdentityWeakReference(Object referent) {
            super(referent);
            identityHashCode = System.identityHashCode(referent);
        }

        IdentityWeakReference(Object referent, ReferenceQueue<Object> referenceQueue) {
            super(referent, referenceQueue);
            identityHashCode = System.identityHashCode(referent);
        }

        @Override
        public int hashCode() {
            return identityHashCode;
        }

        @Override
        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof IdentityWeakReference)) {
                return false;
            }
            Object referent = get();
            return referent != null && referent == ((IdentityWeakReference) other).get();
        }
    }
}
