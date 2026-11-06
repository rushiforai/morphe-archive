package dev.jason.gboardpatches.extension.emojisize;

public final class GboardEmojiSize1803Policy {
    public static final String EMOJI_SCALE_SUPPORTED_FLAG = "emoji_scale_supported";

    private GboardEmojiSize1803Policy() {
    }

    public static Object maybeForce(String flagName, Object stockResult, boolean enabled) {
        if (!enabled
                || !EMOJI_SCALE_SUPPORTED_FLAG.equals(flagName)
                || !Boolean.FALSE.equals(stockResult)) {
            return stockResult;
        }
        return Boolean.TRUE;
    }
}
