package io.github.liongalahad.nuviotv.extension.settings;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/** Generic registry for installed features that consume the shared local-storage path. */
public final class MorpheStorageConsumers {
    public interface EnabledSource { boolean isEnabled(); }
    public interface StorageChangedListener { void onStorageChanged(); }

    private static final Map<String, Consumer> SOURCES = new ConcurrentHashMap<>();

    private MorpheStorageConsumers() {}

    public static void register(String id, EnabledSource source) {
        register(id, source, false, null);
    }

    public static void register(String id, EnabledSource source, boolean requiresWriteAccess) {
        register(id, source, requiresWriteAccess, null);
    }

    public static void register(
            String id,
            EnabledSource source,
            boolean requiresWriteAccess,
            StorageChangedListener listener
    ) {
        if (id == null || id.trim().isEmpty() || source == null) return;
        SOURCES.put(id, new Consumer(source, requiresWriteAccess, listener));
    }

    public static boolean isAnyEnabled() {
        for (Consumer consumer : SOURCES.values()) {
            try {
                if (consumer.source.isEnabled()) return true;
            } catch (RuntimeException ignored) { }
        }
        return false;
    }

    public static boolean isWriteAccessRequired() {
        for (Consumer consumer : SOURCES.values()) {
            try {
                if (consumer.requiresWriteAccess && consumer.source.isEnabled()) return true;
            } catch (RuntimeException ignored) { }
        }
        return false;
    }

    /** Invalidates each installed storage consumer after a path or on-disk content change. */
    public static void notifyStorageChanged() {
        for (Consumer consumer : SOURCES.values()) {
            if (consumer.listener == null) continue;
            try {
                consumer.listener.onStorageChanged();
            } catch (RuntimeException ignored) { }
        }
    }

    static int registeredCountForTesting() { return SOURCES.size(); }
    static void clearForTesting() { SOURCES.clear(); }

    private static final class Consumer {
        final EnabledSource source;
        final boolean requiresWriteAccess;
        final StorageChangedListener listener;

        Consumer(
                EnabledSource source,
                boolean requiresWriteAccess,
                StorageChangedListener listener
        ) {
            this.source = source;
            this.requiresWriteAccess = requiresWriteAccess;
            this.listener = listener;
        }
    }
}
