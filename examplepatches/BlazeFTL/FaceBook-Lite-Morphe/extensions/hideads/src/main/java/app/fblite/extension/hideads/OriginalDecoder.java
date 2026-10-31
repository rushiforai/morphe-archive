package app.fblite.extension.hideads;

/** Loads the app's original X.1DY, which the extension's X.1DY delegates to. */
public final class OriginalDecoder {
    private OriginalDecoder() {
    }

    public static Class<?> load() throws ClassNotFoundException {
        Class<?> original = OriginalClass.load("X.1DY");
        if (original == null) throw new ClassNotFoundException("X.1DY not found in the app's secondary dex");
        return original;
    }
}
