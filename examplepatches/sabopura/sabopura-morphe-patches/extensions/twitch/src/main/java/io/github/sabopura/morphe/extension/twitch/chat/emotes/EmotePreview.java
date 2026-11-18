package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.content.Context;

/** The enlarged image in the info sheet: the chat-sized copy at once, the larger one when it arrives. */
final class EmotePreview extends EmoteImageView {
    private final String largeUrl;

    EmotePreview(Context context, String largeUrl) {
        super(context);
        this.largeUrl = largeUrl;
    }

    boolean waitsFor(String url) {
        return largeUrl.equals(url);
    }
}
