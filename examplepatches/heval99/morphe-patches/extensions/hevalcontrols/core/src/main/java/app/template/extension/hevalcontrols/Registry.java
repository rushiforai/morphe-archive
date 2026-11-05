package app.template.extension.hevalcontrols;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The features patched into this APK. The "Patch settings" patch rewrites the three getters below
 * at patch time ({@code returnEarly}), so the list always matches what was really patched.
 */
@SuppressWarnings("unused")
public final class Registry {
    private static volatile Registry current;

    /** Rewritten at patch time with the encoded feature list ({@link RegistryCodec}). */
    public static String encoded() {
        return "";
    }

    /** Rewritten at patch time with the patch bundle version. */
    public static String bundleVersion() {
        return "";
    }

    /** Rewritten at patch time with the patched app's "versionName (versionCode)". */
    public static String patchedAppVersion() {
        return "";
    }

    /** The decoded registry; decoded once per process. Never null, never throws. */
    public static Registry get() {
        Registry registry = current;
        if (registry != null) return registry;
        synchronized (Registry.class) {
            if (current == null) {
                String text;
                try {
                    text = encoded();
                } catch (Throwable unexpected) {
                    text = null;
                }
                current = new Registry(RegistryCodec.decode(text));
            }
            return current;
        }
    }

    /** Tests: replaces the registry (null forgets it, so the next {@link #get()} decodes again). */
    static void install(String encoded) {
        synchronized (Registry.class) {
            current = encoded == null ? null : new Registry(RegistryCodec.decode(encoded));
        }
    }

    public final RegistryCodec.Result decoded;
    private final Map<String, Feature> byId;

    private Registry(RegistryCodec.Result decoded) {
        this.decoded = decoded;
        Map<String, Feature> map = new HashMap<>();
        for (Feature feature : decoded.features) map.put(feature.id, feature);
        this.byId = Collections.unmodifiableMap(map);
    }

    /** All features, in registration order. */
    public List<Feature> features() {
        return decoded.features;
    }

    /** The feature with this id, or null for an id this APK does not know. */
    public Feature feature(String id) {
        return id == null ? null : byId.get(id);
    }

    /** What a feature does before the settings engine is ready: its registered default. */
    boolean defaultFor(String id) {
        Feature feature = feature(id);
        return feature != null && feature.defaultEnabled;
    }
}
