package xyz.urro.gboard;

/** Names resolved from the input APK by the patch, never from its version number. */
final class NativeApi {
    private NativeApi() {}
    static String preferenceKey() { throw new IllegalStateException("Settings API not resolved"); }
    static String preferenceContext() { throw new IllegalStateException("Settings API not resolved"); }
    static String preferenceSummary() { throw new IllegalStateException("Settings API not resolved"); }
    static String preferenceSummarySetter() { throw new IllegalStateException("Settings API not resolved"); }
    static String itemClass() { throw new IllegalStateException("Clipboard API not resolved"); }
    static String builderClass() { throw new IllegalStateException("Clipboard API not resolved"); }
    static String adapterKeyboard() { throw new IllegalStateException("Clipboard API not resolved"); }
    static String header() { throw new IllegalStateException("Clipboard API not resolved"); }
    static String holderPosition() { throw new IllegalStateException("Clipboard API not resolved"); }
    static String paste() { throw new IllegalStateException("Clipboard API not resolved"); }
    static String refresh() { throw new IllegalStateException("Clipboard API not resolved"); }
    static String visiblePositions() { throw new IllegalStateException("Clipboard API not resolved"); }
    static String editorFocus() { throw new IllegalStateException("Translation API not resolved"); }
}
