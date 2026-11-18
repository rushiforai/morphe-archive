package io.github.sabopura.morphe.extension.twitch.chat.emotes;

/** Marks the range of an image in a chat row with what the info sheet needs. Draws nothing. */
public final class EmoteInfoSpan {
    public final String name;
    public final String source;
    final String url;
    final boolean animated;

    EmoteInfoSpan(String name, String source, String url, boolean animated) {
        this.name = name;
        this.source = source;
        this.url = url;
        this.animated = animated;
    }
}
