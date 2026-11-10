package app.morphe.extension.kicktv.emotes;

/**
 * Entry point called at the start of the stock chat text parser
 * (vz3.d) and the stock inline-content builder (vz3.a).
 *
 * <p>Both stock methods parse the raw message text independently, so both
 * must see the same rewritten text for the emote annotation and its inline
 * content to line up.</p>
 */
public final class EmoteTextHook {

    private EmoteTextHook() {
    }

    public static String transform(String text) {
        try {
            return EmoteStore.transform(text);
        } catch (Throwable t) {
            // Never break chat rendering because of a third-party emote.
            return text;
        }
    }

    /**
     * True when the text carries at least one third-party emote token.
     *
     * <p>KICK has two inline-content renderers: the URL based one (used by
     * normal messages) and a placeholder renderer that reserves the emote box
     * but draws nothing (used by compact and reply layouts). The patched
     * inline map forces the URL renderer for any text that contains one of our
     * fake ids, otherwise third-party emotes would show up as blank gaps in
     * those layouts.</p>
     */
    public static boolean hasProviderEmote(String text) {
        if (text == null || text.isEmpty()) {
            return false;
        }
        int index = 0;
        while ((index = text.indexOf("[emote:", index)) >= 0) {
            int colon = text.indexOf(':', index + 7);
            if (colon > index + 7) {
                try {
                    long id = Long.parseLong(text.substring(index + 7, colon));
                    if (id >= 1000000000L) {
                        return true;
                    }
                } catch (NumberFormatException ignored) {
                    // Not a numeric token; keep scanning.
                }
            }
            index += 7;
        }
        return false;
    }
}
