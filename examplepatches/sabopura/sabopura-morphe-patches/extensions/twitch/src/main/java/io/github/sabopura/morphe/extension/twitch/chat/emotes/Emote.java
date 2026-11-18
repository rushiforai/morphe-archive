// Adapted from Hooman's patches, GPL-3.0; see NOTICE for source and revision.
package io.github.sabopura.morphe.extension.twitch.chat.emotes;

final class Emote {
    final String provider;
    final String id;
    final String name;
    final String url;
    final boolean animated;
    final boolean zeroWidth;
    final boolean global;

    /** An image with no catalog identity: a badge, or a higher-resolution copy of an emote. */
    Emote(String url, boolean animated) {
        this(null, null, null, url, animated, false, false);
    }

    Emote(String provider, String id, String name, String url, boolean animated, boolean zeroWidth, boolean global) {
        this.provider = provider;
        this.id = id;
        this.name = name;
        this.url = url;
        this.animated = animated;
        this.zeroWidth = zeroWidth;
        this.global = global;
    }

    /** Stable across renames and between channels, as in ryykitty's favourites. */
    String favoriteKey() {
        return "c:" + provider + ":" + (id == null || id.isEmpty() ? name : id);
    }
}
