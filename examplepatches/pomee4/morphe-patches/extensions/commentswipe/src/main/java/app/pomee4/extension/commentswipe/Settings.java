package app.pomee4.extension.commentswipe;

import android.content.Context;
import android.content.SharedPreferences;

import app.pomee4.extension.commentswipe.CommentSwipeActionsPatch.SwipeAction;
import app.pomee4.extension.commentswipe.PostSwipe.PostAction;

/**
 * Swipe action settings of comments and posts, kept in their own preferences file so they do not depend on
 * the settings of other patches. Edited in {@link SettingsActivity}.
 */
public final class Settings {
    static final String PREFERENCES_NAME = "pomee4_comment_swipe";

    public static final BooleanSetting COMMENT_SWIPE_ACTIONS = new BooleanSetting("comment_swipe_actions", true);
    /**
     * Swipe left: the comment is dragged from right to left.
     */
    public static final EnumSetting<SwipeAction> LEFT_FIRST =
            new EnumSetting<>("comment_swipe_left_first", SwipeAction.UPVOTE);
    public static final EnumSetting<SwipeAction> LEFT_SECOND =
            new EnumSetting<>("comment_swipe_left_second", SwipeAction.DOWNVOTE);
    /**
     * Swipe right: the comment is dragged from left to right.
     */
    public static final EnumSetting<SwipeAction> RIGHT_FIRST =
            new EnumSetting<>("comment_swipe_right_first", SwipeAction.TOGGLE_COLLAPSE);
    public static final EnumSetting<SwipeAction> RIGHT_SECOND =
            new EnumSetting<>("comment_swipe_right_second", SwipeAction.REPLY);
    public static final BooleanSetting POST_SWIPE_ACTIONS = new BooleanSetting("post_swipe_actions", true);
    /**
     * Swipe a post left: upvote, or downvote on a longer swipe, the same as comments.
     */
    public static final EnumSetting<PostAction> POST_LEFT_FIRST =
            new EnumSetting<>("post_swipe_left_first", PostAction.UPVOTE);
    public static final EnumSetting<PostAction> POST_LEFT_SECOND =
            new EnumSetting<>("post_swipe_left_second", PostAction.DOWNVOTE);
    /**
     * Swipe a post right: save it for later, or hide it on a longer swipe.
     */
    public static final EnumSetting<PostAction> POST_RIGHT_FIRST =
            new EnumSetting<>("post_swipe_right_first", PostAction.SAVE);
    public static final EnumSetting<PostAction> POST_RIGHT_SECOND =
            new EnumSetting<>("post_swipe_right_second", PostAction.HIDE);

    public static final BooleanSetting COMMENT_SWIPE_VIBRATE = new BooleanSetting("comment_swipe_vibrate", true);

    // Settings of versions with one swipe direction and three actions, moved by migrate().
    private static final String OLD_FIRST = "comment_swipe_first";
    private static final String OLD_SECOND = "comment_swipe_second";
    private static final String OLD_THIRD = "comment_swipe_third";
    private static final String OLD_DIRECTION = "comment_swipe_direction";

    private static volatile SharedPreferences preferences;

    private Settings() {
    }

    static void init(Context context) {
        if (preferences == null) {
            SharedPreferences prefs = preferences(context);
            migrate(prefs);
            preferences = prefs;
        }
    }

    /**
     * Moves the first and second action of the old single swipe direction to that direction.
     * The old third action has no place anymore.
     */
    static void migrate(SharedPreferences prefs) {
        if (!prefs.contains(OLD_FIRST) && !prefs.contains(OLD_SECOND)
                && !prefs.contains(OLD_THIRD) && !prefs.contains(OLD_DIRECTION)) {
            return;
        }
        boolean leftToRight = "LEFT_TO_RIGHT".equals(prefs.getString(OLD_DIRECTION, null));
        SharedPreferences.Editor editor = prefs.edit();
        if (prefs.contains(OLD_FIRST)) {
            editor.putString((leftToRight ? RIGHT_FIRST : LEFT_FIRST).key, prefs.getString(OLD_FIRST, null));
        }
        if (prefs.contains(OLD_SECOND)) {
            editor.putString((leftToRight ? RIGHT_SECOND : LEFT_SECOND).key, prefs.getString(OLD_SECOND, null));
        }
        editor.remove(OLD_FIRST).remove(OLD_SECOND).remove(OLD_THIRD).remove(OLD_DIRECTION).apply();
    }

    static SharedPreferences preferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    public static final class BooleanSetting {
        final String key;
        final boolean defaultValue;

        BooleanSetting(String key, boolean defaultValue) {
            this.key = key;
            this.defaultValue = defaultValue;
        }

        public boolean get() {
            SharedPreferences prefs = preferences;
            return prefs == null ? defaultValue : prefs.getBoolean(key, defaultValue);
        }
    }

    public static final class EnumSetting<T extends Enum<T>> {
        final String key;
        final T defaultValue;

        EnumSetting(String key, T defaultValue) {
            this.key = key;
            this.defaultValue = defaultValue;
        }

        public T get() {
            SharedPreferences prefs = preferences;
            if (prefs == null) return defaultValue;
            String name = prefs.getString(key, null);
            if (name == null) return defaultValue;
            try {
                return Enum.valueOf(defaultValue.getDeclaringClass(), name);
            } catch (IllegalArgumentException ex) {
                return defaultValue;
            }
        }
    }
}
