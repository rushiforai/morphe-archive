package dev.twitchpatches.extension.emotes;

import java.util.List;

final class FavoriteEmoteBridge {
    private FavoriteEmoteBridge() { }

    static List<?> entries(Object section) { return null; }
    static boolean frequentlyUsed(Object section) { return false; }
    static Object clicked(Object model) { return null; }
    static String emoteId(Object clicked) { return null; }
    static boolean hasVariants(Object clicked) { return false; }
    static String lockedToken(Object clicked) { return null; }
    static String lockedChannel(Object clicked) { return null; }
    static String lockedKind(Object clicked) { return null; }
    static Object lockedModel(String id, String token, String channel, String kind) { return null; }
    static String cardEmoteId(Object cardState) { return null; }
    static String cardEmoteToken(Object cardState) { return null; }
    static String cardChannel(Object cardState) { return null; }
    static String cardKind(Object cardState) { return null; }
}
