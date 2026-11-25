package dev.jason.gboardpatches.extension.clipboardcontentlimit;

final class GboardClipboardContentLimitPolicy {
    static final String TEXT_CLIP_ITEM_CHAR_LIMIT = "text_clip_item_char_limit";

    private GboardClipboardContentLimitPolicy() {
    }

    static Object maybeOverride(String flagName, Object stockResult,
            int configuredMaxCharacters) {
        if (!TEXT_CLIP_ITEM_CHAR_LIMIT.equals(flagName)
                || !(stockResult instanceof Long)
                || configuredMaxCharacters <= 0) {
            return stockResult;
        }
        return Long.valueOf(configuredMaxCharacters);
    }
}
