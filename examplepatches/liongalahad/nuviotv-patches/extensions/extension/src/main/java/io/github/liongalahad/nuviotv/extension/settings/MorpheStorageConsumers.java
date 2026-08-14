package io.github.liongalahad.nuviotv.extension.settings;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/** Generic registry for installed features that consume the shared local-storage path. */
public final class MorpheStorageConsumers {
    public interface EnabledSource { boolean isEnabled(); }

    private static final Map<String, EnabledSource> SOURCES = new ConcurrentHashMap<>();

    private MorpheStorageConsumers() {}

    public static void register(String id, EnabledSource source) {
        if (id == null || id.trim().isEmpty() || source == null) return;
        SOURCES.put(id, source);
    }

    public static boolean isAnyEnabled() {
        for (EnabledSource source : SOURCES.values()) {
            try {
                if (source.isEnabled()) return true;
            } catch (RuntimeException ignored) { }
        }
        return false;
    }

    static int registeredCountForTesting() { return SOURCES.size(); }
    static void clearForTesting() { SOURCES.clear(); }
}
