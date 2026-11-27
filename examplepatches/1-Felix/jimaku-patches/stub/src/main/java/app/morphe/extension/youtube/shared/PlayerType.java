package app.morphe.extension.youtube.shared;

/**
 * Signature stub of Morphe Patches' player type, a Kotlin enum whose companion has a
 * {@code @JvmStatic} getter. Jimaku compares the result by name only, so a constant Morphe
 * adds or renames never breaks the call.
 */
public enum PlayerType {
    NONE;

    public static PlayerType getCurrent() {
        throw new UnsupportedOperationException();
    }
}
