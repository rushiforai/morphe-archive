package app.hushmessenger.extension;

/**
 * The row of stories and notes above the chats (#225). The inbox builds that row in one method, which takes the
 * account's own tile (the Create story tile, carrying your own story and note) as an argument and only adds the tile
 * when it's there. The patch passes that argument through here first, and with Hide Create story on it comes back null,
 * so the row starts with the first friend's story.
 *
 * Off, Pause, safe mode and every failure hand the tile back as it came. Public, since the call comes from Messenger's
 * own inbox classes.
 */
public final class StoryTray {
    static final String KEY = "story_create_tile";

    private StoryTray() { }

    /** The account's own tile, or null while Hide Create story is on. */
    public static Object ownTile(Object tile) {
        try {
            if (tile == null || !Settings.enabled(KEY)) return tile;
            return null;
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't look over the Create story tile", error);
            return tile;
        }
    }
}
