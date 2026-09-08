/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */
package psylos.morphe.extension.soundcloud;

/** Methods are changed to return true by the corresponding bytecode patch. */
@SuppressWarnings("unused")
public final class PatchStatus {
    private PatchStatus() {
    }

    public static boolean downloadButtonHookIncluded() {
        return false;
    }

    public static boolean hideCastIconIncluded() {
        return false;
    }
}
