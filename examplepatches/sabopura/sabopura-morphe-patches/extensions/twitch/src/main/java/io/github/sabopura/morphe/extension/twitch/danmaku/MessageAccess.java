package io.github.sabopura.morphe.extension.twitch.danmaku;

import java.util.List;
import java.util.Map;

/** Typed reads of Twitch's parsed chat message; the bodies are generated at patch time. */
final class MessageAccess {
    private MessageAccess() {
    }

    static Map<?, ?> tags(Object message) {
        return null;
    }

    static Integer color(Object message) {
        return null;
    }

    static List<?> tokens(Object message) {
        return null;
    }

    /** A message that is one "gigantified" emote keeps it in its own field. */
    static Object gigantifiedEmote(Object message) {
        return null;
    }

    static Long timestampSeconds(Object message) {
        return null;
    }

    static Object sender(Object message) {
        return null;
    }

    static String login(Object sender) {
        return null;
    }
}
