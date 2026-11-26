package app.hushmessenger.extension;

/**
 * #194 See-through tab bar. Messenger paints its floating tab bar's pill solid. With this on, the pill's fill, its
 * hairline and its shadow come back with part of their alpha, by the level picked under the switch, so the chats that
 * scroll under the pill show through it. The shadow goes down with the fill, since a full shadow would show as a dark
 * smudge through a see-through pill. The selected tab's highlight and the icons keep theirs. The pill's paint calls
 * color() with each of the three as it reads them back. Public, since the call comes from Messenger's own package.
 */
public final class SeeThroughTabBar {
    static final String KEY = "see_through_tab_bar";
    /** The level picked, one of [LEVELS]. Nothing saved means [STANDARD]. */
    static final String LEVEL = "see_through_tab_bar_level";
    /** The levels, the most solid first. */
    static final String[] LEVELS = {"frosted", "standard", "light", "clear"};
    /** How much of each color's own alpha a level keeps, in percent, by [LEVELS]. */
    static final int[] KEEPS = {85, 70, 50, 30};
    static final String STANDARD = "standard";

    private SeeThroughTabBar() {}

    /** One of the pill's colors, as Messenger read it back to paint it. */
    public static int color(int color) {
        try {
            if (!Settings.enabled(KEY)) return color;
            return withAlpha(color, keeps(picked()));
        } catch (RuntimeException | LinkageError error) {
            Settings.hookFailed(KEY, "Can't make the tab bar see-through", error);
            return color;
        }
    }

    /** The color with [percent] of its own alpha, rounded, and its red, green and blue as they were. */
    static int withAlpha(int color, int percent) {
        int alpha = Math.round((color >>> 24) * percent / 100f);
        return (alpha << 24) | (color & 0x00FFFFFF);
    }

    /** The saved level, or [STANDARD] when nothing or something unknown is saved. */
    static String picked() {
        String saved = Settings.preferences == null ? null : Settings.preferences.getString(LEVEL, null);
        for (String level : LEVELS) if (level.equals(saved)) return level;
        return STANDARD;
    }

    static int keeps(String level) {
        for (int i = 0; i < LEVELS.length; i++) if (LEVELS[i].equals(level)) return KEEPS[i];
        return keeps(STANDARD);
    }
}
