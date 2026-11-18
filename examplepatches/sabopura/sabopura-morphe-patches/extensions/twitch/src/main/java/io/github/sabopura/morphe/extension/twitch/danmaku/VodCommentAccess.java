package io.github.sabopura.morphe.extension.twitch.danmaku;

/** Typed reads of Twitch's VOD chat replay comment; the bodies are generated at patch time. */
final class VodCommentAccess {
    private VodCommentAccess() {
    }

    static String id(Object comment) {
        return null;
    }

    static String vodId(Object comment) {
        return null;
    }

    /** The second of the VOD the comment was sent at. */
    static int offsetSeconds(Object comment) {
        return 0;
    }

    static Object commenter(Object comment) {
        return null;
    }

    static Object message(Object comment) {
        return null;
    }

    static String userId(Object commenter) {
        return null;
    }

    static String displayName(Object commenter) {
        return null;
    }

    static String login(Object commenter) {
        return null;
    }

    static String body(Object message) {
        return null;
    }

    /** A list of Twitch's emoticon models; its declared type differs between versions. */
    static Object emoticons(Object message) {
        return null;
    }

    static String color(Object message) {
        return null;
    }

    static String emoteId(Object emoticon) {
        return null;
    }

    static int emoteBegin(Object emoticon) {
        return 0;
    }
}
