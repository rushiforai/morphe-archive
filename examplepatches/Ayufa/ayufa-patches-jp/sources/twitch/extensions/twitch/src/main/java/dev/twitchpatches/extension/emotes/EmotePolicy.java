package dev.twitchpatches.extension.emotes;

public final class EmotePolicy {
    public static final int ALL = 7;

    public static int restore(boolean legacyEnabled, int storedMask) {
        return storedMask < 0 ? (legacyEnabled ? ALL : 0) : storedMask & ALL;
    }

    public static boolean includes(int mask, int provider) {
        return (mask & bit(provider)) != 0;
    }

    public static int select(int mask, int provider, boolean enabled) {
        int bit = bit(provider);
        return (enabled ? mask | bit : mask & ~bit) & ALL;
    }

    private static int bit(int provider) {
        if (provider < 0 || provider > 2) throw new IllegalArgumentException("Unknown emote provider.");
        return 1 << provider;
    }

    private EmotePolicy() { }
}
