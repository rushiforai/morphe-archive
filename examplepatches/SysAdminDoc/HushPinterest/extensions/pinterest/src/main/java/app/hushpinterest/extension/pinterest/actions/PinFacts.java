/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import androidx.annotation.Nullable;

/** What other parts of the extension may ask about a pin, answered from the media model it carries. */
public final class PinFacts {
    private PinFacts() {}

    /** The pin's id when it is a real pin with media, or null. */
    @Nullable
    public static String id(@Nullable Object pin) {
        return PinMedia.id(pin);
    }

    /**
     * The width and height of the largest copy of a picture pin that Pinterest sent with it. Null
     * for a video, for something that isn't a pin, and for a pin that came without sizes.
     */
    @Nullable
    public static int[] imageSize(@Nullable Object pin) {
        PinMedia.Resolution media = PinMedia.resolve(pin);
        if (media == null || media.source == null || PinMedia.kind(media) != PinMedia.Kind.IMAGE) return null;
        if (media.width == null || media.height == null) return null;
        return new int[] {media.width, media.height};
    }

    /** The pin's title as Pinterest sent it, else its grid title, trimmed. Null when it has neither. */
    @Nullable
    public static String title(@Nullable Object pin) {
        if (pin == null) return null;
        for (String name : new String[] {"title", "grid_title"}) {
            Object value = PinMedia.field(pin, name);
            if (value instanceof String && !((String) value).trim().isEmpty()) return ((String) value).trim();
        }
        return null;
    }
}
