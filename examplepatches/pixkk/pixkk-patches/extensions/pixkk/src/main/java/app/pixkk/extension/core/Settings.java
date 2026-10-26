package app.pixkk.extension.core;

import android.content.Context;
import android.content.SharedPreferences;

/** Every setting of the bundle, kept in one preferences file. */
public final class Settings {
    private static final String FILE = "pixkk_settings";

    private Settings() {
    }

    private static SharedPreferences prefs() {
        Context context = Utils.getContext();
        return context == null ? null : context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    public static final class BooleanSetting {
        public final String key;
        private final boolean fallback;

        BooleanSetting(String key, boolean fallback) {
            this.key = key;
            this.fallback = fallback;
        }

        public boolean get() {
            SharedPreferences prefs = prefs();
            return prefs == null ? fallback : prefs.getBoolean(key, fallback);
        }

        public boolean save(boolean value) {
            SharedPreferences prefs = prefs();
            return prefs != null && prefs.edit().putBoolean(key, value).commit();
        }
    }

    /** Where an integer setting's value comes from until it is changed. */
    interface IntSource {
        int get();
    }

    public static final class IntegerSetting {
        public final String key;
        public final int min;
        public final int max;
        private final IntSource fallback;

        IntegerSetting(String key, IntSource fallback, int min, int max) {
            this.key = key;
            this.fallback = fallback;
            this.min = min;
            this.max = max;
        }

        public int get() {
            SharedPreferences prefs = prefs();
            int value = prefs == null ? fallback.get() : prefs.getInt(key, fallback.get());
            return Math.max(min, Math.min(max, value));
        }

        public boolean save(int value) {
            SharedPreferences prefs = prefs();
            int kept = Math.max(min, Math.min(max, value));
            return prefs != null && prefs.edit().putInt(key, kept).commit();
        }
    }

    public static final class StringSetting {
        public final String key;
        private final String fallback;

        StringSetting(String key, String fallback) {
            this.key = key;
            this.fallback = fallback;
        }

        public String get() {
            SharedPreferences prefs = prefs();
            return prefs == null ? fallback : prefs.getString(key, fallback);
        }

        public boolean save(String value) {
            SharedPreferences prefs = prefs();
            return prefs != null && prefs.edit().putString(key, value).commit();
        }
    }

    /** See more and a tap on the description unfold it in place instead of opening the full text. */
    public static final BooleanSetting EXPAND_DESCRIPTION_IN_PLACE =
            new BooleanSetting("expand_description_in_place", true);
    /** The video's sound name on its own line under the description. */
    public static final BooleanSetting SOUND_UNDER_DESCRIPTION =
            new BooleanSetting("sound_under_description", true);
    /** A sound name wider than its row scrolls along the row instead of being cut off with dots. */
    public static final BooleanSetting SOUND_NAME_SCROLL = new BooleanSetting("sound_name_scroll", true);
    public static final IntegerSetting SOUND_NAME_SCROLL_SPEED =
            new IntegerSetting("sound_name_scroll_speed", Defaults::soundScrollSpeed, 10, 200);

    /** Added to the gaps down the right of a video, in dp; negative closes a gap up. */
    public static final IntegerSetting RAIL_SPACING_DP =
            new IntegerSetting("rail_spacing_dp", Defaults::railSpacingDp, -30, 60);
    public static final IntegerSetting RAIL_AVATAR_GAP_DP =
            new IntegerSetting("rail_avatar_gap_dp", Defaults::railAvatarGapDp, -30, 60);
    public static final IntegerSetting RAIL_DISC_GAP_DP =
            new IntegerSetting("rail_disc_gap_dp", Defaults::railDiscGapDp, -30, 60);

    /** Rows of the comment long-press menu that are left out, and every row seen so far. */
    public static final StringSetting COMMENT_MENU_HIDDEN_ROWS = new StringSetting("comment_menu_hidden_rows", "");
    public static final StringSetting COMMENT_MENU_ROW_CATALOG = new StringSetting("comment_menu_row_catalog", "");
    public static final BooleanSetting COMMENT_MENU_CENTERED = new BooleanSetting("comment_menu_centered", true);

    /** Lets a swipe that starts on a button down the right of a video scroll the feed. */
    public static final BooleanSetting RAIL_SWIPE_PASSTHROUGH = new BooleanSetting("rail_swipe_passthrough", true);
    public static final BooleanSetting ANIMATED_PROFILE_COVERS = new BooleanSetting("animated_profile_covers", true);
    public static final BooleanSetting SEEK_FOLLOWS_FINGER = new BooleanSetting("seek_follows_finger", true);
    public static final BooleanSetting OLD_STYLE_COUNTS = new BooleanSetting("old_style_counts", true);
    public static final BooleanSetting DISCOVER_TAB = new BooleanSetting("discover_tab", true);
}
