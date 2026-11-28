/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.facer;

/** Text cleanup helpers for Facer's home screen UI patches. */
@SuppressWarnings("unused")
public final class FacerHomeCleanup {
    private FacerHomeCleanup() {
    }

    /**
     * Strips leading emoji, symbols, variation selectors, ZWJ joiners, and whitespace from a
     * category header title (e.g. `"⭐ Staff Picks"` -> `"Staff Picks"`).
     */
    public static String stripLeadingEmoji(String title) {
        if (title == null || title.isEmpty()) return title;
        int len = title.length();
        int i = 0;
        while (i < len) {
            int cp = title.codePointAt(i);
            int type = Character.getType(cp);
            boolean isEmojiOrSymbol =
                type == Character.OTHER_SYMBOL ||
                type == Character.MODIFIER_SYMBOL ||
                type == Character.NON_SPACING_MARK ||
                type == Character.FORMAT ||
                cp == 0xFE0F || cp == 0xFE0E || cp == 0x200D ||
                Character.isWhitespace(cp);
            if (!isEmojiOrSymbol) break;
            i += Character.charCount(cp);
        }
        return i < len ? title.substring(i) : title;
    }
}
