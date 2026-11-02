package dev.twitchpatches.extension.emotes;

public final class EmoteInputBridge {
    private EmoteInputBridge() { }

    public static String code(Object suggestion) {
        throw new UnsupportedOperationException("Emote suggestion identity bridge is not patched.");
    }

    public static String id(Object emote) {
        throw new UnsupportedOperationException("Emote id bridge is not patched.");
    }

    public static Object model(String id, String code, boolean animated) {
        throw new UnsupportedOperationException("Emote input model bridge is not patched.");
    }
}
