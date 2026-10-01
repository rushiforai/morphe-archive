package app.mmc.extension;

/**
 * The MMC patches are pure bytecode/resource patches and do not need runtime extension code.
 * This class only keeps the extension module (required by the Morphe gradle plugin) non-empty.
 */
@SuppressWarnings("unused")
public final class Placeholder {
    private Placeholder() {
    }
}
