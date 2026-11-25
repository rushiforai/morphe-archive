package app.hushmessenger.extension;

/**
 * Messenger's own pinned message bar under a chat's name (#213). Messenger gathers a chat's banners in one place and
 * only adds the pinned messages one for some chats, after asking the chat's thread key. The patch passes that answer
 * through here, and with Show pinned messages on it comes back yes, so every chat gets the bar Messenger already draws
 * for the chats it picked.
 *
 * Off, Pause, safe mode and every failure hand the answer back as it came. A chat Messenger already shows the bar in
 * keeps it without counting as a use. Public, since the call comes from Messenger's own banner code.
 */
public final class PinnedBar {
    static final String KEY = "pinned_bar";

    private PinnedBar() { }

    /** Whether the chat's banners take the pinned messages bar. */
    public static boolean show(boolean stock) {
        try {
            return stock || Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't look over the pinned message bar", error);
            return stock;
        }
    }
}
