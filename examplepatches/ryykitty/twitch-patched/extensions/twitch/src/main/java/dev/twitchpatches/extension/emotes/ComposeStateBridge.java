package dev.twitchpatches.extension.emotes;

public final class ComposeStateBridge {
    private ComposeStateBridge() { }

    public static Object create(Object value) {
        throw new UnsupportedOperationException("Compose state bridge is not patched.");
    }

    public static Object read(Object state) {
        throw new UnsupportedOperationException("Compose state bridge is not patched.");
    }

    public static void write(Object state, Object value) {
        throw new UnsupportedOperationException("Compose state bridge is not patched.");
    }
}
