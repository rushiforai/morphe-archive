package dev.twitchpatches.extension.ui;

public final class UiComposeBridge {
    public static Object state;
    // Replaced with Twitch's typed StateFlow calls during patching.
    public static void update() { throw new UnsupportedOperationException("UI composition bridge is not patched."); }
    public static String classicButtonId(Object button) {
        throw new UnsupportedOperationException("UI action identity bridge is not patched.");
    }
    public static String metadataButtonId(Object button) {
        throw new UnsupportedOperationException("UI metadata identity bridge is not patched.");
    }
    public static void renderClassicHeader(Object owner, Object state) {
        throw new UnsupportedOperationException("UI header renderer is not patched.");
    }
}
