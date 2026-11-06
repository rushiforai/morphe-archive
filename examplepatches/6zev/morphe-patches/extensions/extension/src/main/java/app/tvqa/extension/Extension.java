package app.tvqa.extension;

/**
 * Placeholder extension.
 *
 * The tvQuickActions patches are pure bytecode patches and do not need runtime code, so
 * nothing in this module is merged into the patched app. It is kept because the Morphe
 * patches Gradle plugin expects the extensions project to exist.
 */
public final class Extension {
    private Extension() {
    }
}
