package app.fblite.extension.hideads;

/** Loads the app's original X.1E8, which the extension's X.1E8 delegates to. */
public final class OriginalDecoder {
    private OriginalDecoder() {
    }

    public static Class<?> load() throws ClassNotFoundException {
        Class<?> original = OriginalClass.load("X.1E8");
        if (original == null) throw new ClassNotFoundException("X.1E8 not found in the app's secondary dex");
        return original;
    }
}
