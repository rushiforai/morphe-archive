package dev.twitchpatches.extension.reload;

// Injected Compose bridges.
public final class NativeReloadBridge {
    public static volatile Object state;
    private NativeReloadBridge() {}
    public static void update(boolean enabled) {
        throw new IllegalStateException("Native reload state bridge was not resolved");
    }
}
