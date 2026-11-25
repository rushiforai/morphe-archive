package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

public final class GboardEnglishUppercaseToggleRuntime {
    private static final MetadataIdentityState METADATA_IDENTITY_STATE =
            new MetadataIdentityState();
    private static volatile Context applicationContext;

    private GboardEnglishUppercaseToggleRuntime() {
    }

    public static boolean isEnabled() {
        try {
            Context context = resolveContext();
            if (context == null) {
                return GboardEnglishUppercaseToggleSettings.DEFAULT_ENABLED;
            }
            SharedPreferences preferences =
                    GboardEnglishUppercaseToggleSettings.preferences(context);
            GboardEnglishUppercaseToggleSettings.ensureDefaults(preferences);
            return GboardEnglishUppercaseToggleSettings.readEnabled(preferences);
        } catch (Throwable ignored) {
            return GboardEnglishUppercaseToggleSettings.DEFAULT_ENABLED;
        }
    }

    public static boolean isPatchedMetadata(Object metadata) {
        return METADATA_IDENTITY_STATE.isPatched(metadata);
    }

    public static void markPatchedMetadata(Object metadata) {
        METADATA_IDENTITY_STATE.markPatched(metadata);
    }

    public static Object getCachedPatchedMetadata(Object originalMetadata) {
        return METADATA_IDENTITY_STATE.getCached(originalMetadata);
    }

    public static Object cachePatchedMetadata(Object originalMetadata, Object patchedMetadata) {
        return METADATA_IDENTITY_STATE.cachePatched(originalMetadata, patchedMetadata);
    }

    private static Context resolveContext() {
        Context cached = applicationContext;
        if (cached != null) {
            return cached;
        }
        Context reflected = reflectedApplicationContext(
                "android.app.ActivityThread",
                "currentApplication");
        if (reflected != null) {
            applicationContext = reflected;
            return reflected;
        }
        reflected = reflectedApplicationContext(
                "android.app.AppGlobals",
                "getInitialApplication");
        if (reflected != null) {
            applicationContext = reflected;
            return reflected;
        }
        return null;
    }

    private static Context reflectedApplicationContext(String className, String methodName) {
        try {
            Class<?> owner = Class.forName(className);
            Object application = owner.getMethod(methodName).invoke(null);
            if (!(application instanceof Context context)) {
                return null;
            }
            Context resolvedContext = context.getApplicationContext();
            return resolvedContext != null ? resolvedContext : context;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static final class MetadataIdentityState {
        private final WeakIdentityMap<Boolean> patchedMetadataMarkers =
                new WeakIdentityMap<Boolean>();
        private final WeakIdentityMap<Object> patchedMetadataByOriginal =
                new WeakIdentityMap<Object>();

        synchronized boolean isPatched(Object metadata) {
            return metadata != null
                    && Boolean.TRUE.equals(patchedMetadataMarkers.get(metadata));
        }

        synchronized void markPatched(Object metadata) {
            if (metadata != null) {
                patchedMetadataMarkers.put(metadata, Boolean.TRUE);
            }
        }

        synchronized Object getCached(Object originalMetadata) {
            return originalMetadata == null
                    ? null : patchedMetadataByOriginal.get(originalMetadata);
        }

        synchronized Object cachePatched(Object originalMetadata, Object patchedMetadata) {
            if (originalMetadata == null || patchedMetadata == null) {
                return patchedMetadata;
            }
            Object cached = patchedMetadataByOriginal.get(originalMetadata);
            Object canonical = cached != null ? cached : patchedMetadata;
            if (cached == null) {
                patchedMetadataByOriginal.put(originalMetadata, patchedMetadata);
            }
            patchedMetadataMarkers.put(canonical, Boolean.TRUE);
            return canonical;
        }
    }

    private static final class WeakIdentityMap<V> {
        private final ReferenceQueue<Object> referenceQueue = new ReferenceQueue<Object>();
        private final Map<IdentityWeakReference, V> entries =
                new HashMap<IdentityWeakReference, V>();

        V get(Object key) {
            if (key == null) {
                return null;
            }
            purgeQueuedKeys();
            return entries.get(new IdentityWeakReference(key));
        }

        void put(Object key, V value) {
            if (key == null) {
                return;
            }
            purgeQueuedKeys();
            entries.put(new IdentityWeakReference(key, referenceQueue), value);
        }

        private void purgeQueuedKeys() {
            Reference<?> queued;
            while ((queued = referenceQueue.poll()) != null) {
                entries.remove(queued);
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
            if (!(other instanceof IdentityWeakReference reference)) {
                return false;
            }
            Object referent = get();
            return referent != null && referent == reference.get();
        }
    }
}
