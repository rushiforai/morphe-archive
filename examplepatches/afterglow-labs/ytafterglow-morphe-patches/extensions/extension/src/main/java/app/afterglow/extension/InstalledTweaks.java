package app.afterglow.extension;

import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * The Afterglow tweaks selected in Morphe for this build.
 *
 * <p>Each tweak is its own named patch. When a tweak's patch runs, it inserts
 * {@code mark("tweak-id")} at the end of this class's static initializer
 * ({@code markTweakInstalled} in {@code patches/.../shared/Tweaks.kt}), so the
 * set holds exactly the tweaks the user patched in. Features check
 * {@link #has} before doing anything, so an unselected tweak changes nothing.
 *
 * <p>Keep the static initializer a single field store: the patch inserts its
 * calls before the final {@code return-void} and uses register v0.
 */
public final class InstalledTweaks {
    private static final Set<String> INSTALLED = Collections.newSetFromMap(new ConcurrentHashMap<>());

    private InstalledTweaks() {}

    /** Called from the patched static initializer, once per installed tweak. */
    public static void mark(String id) {
        if (id != null) INSTALLED.add(id);
    }

    /** True if the tweak with this id (from {@code tools/tweaks.json}) was patched in. */
    public static boolean has(String id) {
        return id != null && INSTALLED.contains(id);
    }

    /** Every installed tweak id. */
    public static Set<String> all() {
        return Collections.unmodifiableSet(INSTALLED);
    }
}
