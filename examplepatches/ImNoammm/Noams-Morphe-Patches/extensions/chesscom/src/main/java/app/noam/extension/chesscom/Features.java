package app.noam.extension.chesscom;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.List;

/** A feature shows in Noam's Patches only when its patch was applied, which makes its marker below return true. */
public final class Features {
    public static final String LIMIT_TOASTS = "limit_toasts";
    public static final String SHORT_TIME_CONTROLS = "short_time_controls";
    public static final String HIDE_PREMIUM = "hide_premium";
    public static final String CUSTOM_HOME = "custom_home";
    public static final String CUSTOM_TABS = "custom_tabs";
    public static final String ARCADE = "arcade";
    public static final String ARROWS = "arrows";
    public static final String BOARD_COLORS = "board_colors";
    public static final String AMOLED = "amoled";
    public static final String ACCENT = "accent";
    public static final String NO_ADS = "no_ads";
    public static final String NO_RATING_PROMPTS = "no_rating_prompts";
    public static final String LICHESS_REVIEW = "lichess_review";

    public static final String PAGE_HOME = "home";
    public static final String PAGE_TABS = "tabs";
    public static final String PAGE_BOARD_COLORS = "board_colors";
    public static final String PAGE_LICHESS = "lichess";
    public static final String PAGE_ARCADE = "arcade";
    public static final String PAGE_ACCENT = "accent";

    public static final String[] SECTIONS = {"Board", "Look", "Games", "Less clutter"};

    private static final String PREFERENCES = "morphe_chesscom";

    /** java.util.function needs API 24; the extension supports 23. */
    interface Marker {
        boolean patched();
    }

    public static final class Feature {
        public final String id;
        public final String title;
        public final String summary;
        public final String page;
        public final String section;
        public final String icon;
        private final Marker marker;

        Feature(String id, String section, String icon, String title, String summary, String page, Marker marker) {
            this.id = id;
            this.section = section;
            this.icon = icon;
            this.title = title;
            this.summary = summary;
            this.page = page;
            this.marker = marker;
        }

        public boolean isPatched() {
            return marker.patched();
        }
    }

    private static final Feature[] ALL = {
        new Feature(ARCADE, "Board", "glyph_element_spark_trio", "Arcade animations",
            "The website's Arcade piece animations: light trails, bursts when a piece is picked up, "
                + "dropped or captured, a flash on check and animated move hints.",
            PAGE_ARCADE, Features::arcadePatched),
        new Feature(BOARD_COLORS, "Board", "glyph_board_simple_brush", "Board colors",
            "Your own light and dark square colours on every board, or one of chess.com's colour themes.",
            PAGE_BOARD_COLORS, Features::boardColorsPatched),
        new Feature(ARROWS, "Board", "glyph_arrow_line_diagonal_top_right", "Arrows in games",
            "An Arrows button in games: while it is on, dragging on the board draws an arrow and "
                + "tapping marks a square, instead of moving pieces. Clear removes them.",
            null, Features::arrowsPatched),
        new Feature(AMOLED, "Look", "glyph_circle_fill_contrast", "AMOLED black",
            "Pure black backgrounds instead of chess.com's dark grey. Restart the app after switching it.",
            null, Features::amoledPatched),
        new Feature(ACCENT, "Look", "glyph_element_droplet", "Accent color",
            "Your own colour in place of chess.com's green: buttons, highlights, icons and text. "
                + "Restart the app after changing it.",
            PAGE_ACCENT, Features::accentPatched),
        new Feature(CUSTOM_HOME, "Look", "glyph_dots_grid_3x3", "Home screen",
            "Choose which tiles and sections the Home screen shows, and the order of the tiles.",
            PAGE_HOME, Features::customHomePatched),
        new Feature(CUSTOM_TABS, "Look", "glyph_layout_list_bullet", "Bottom bar",
            "Choose the tabs between Home and More, and their order.",
            PAGE_TABS, Features::customTabsPatched),
        new Feature(SHORT_TIME_CONTROLS, "Games", "glyph_board_simple_badge_clock", "Time controls under a minute",
            "The custom time slider goes below one minute: 10, 15, 20, 30 and 45 seconds, with or "
                + "without increment.",
            null, Features::shortTimeControlsPatched),
        new Feature(LICHESS_REVIEW, "Games", "glyph_tool_magnifier_checker_1", "Review on Lichess",
            "Game Review opens your game on Lichess, imported and with Lichess's analysis, in a "
                + "browser inside the app.",
            PAGE_LICHESS, Features::lichessReviewPatched),
        new Feature(LIMIT_TOASTS, "Less clutter", "glyph_message_bubble_fill_pair", "Limits as toasts",
            "When you reach a free limit (Game Review, puzzles, lessons, drills…) a short toast says "
                + "so instead of a full-screen Premium offer. Promotional pop-ups are not shown.",
            null, Features::limitToastsPatched),
        new Feature(HIDE_PREMIUM, "Less clutter", "glyph_game_suit_diamonds", "Hide Premium-only content",
            "Bots only Premium members can play are not listed, and the Premium diamond, banners, "
                + "Membership and Upgrade rows are gone. Free accounts see exactly what they can use.",
            null, Features::hidePremiumPatched),
        new Feature(NO_ADS, "Less clutter", "glyph_circle_block_megaphone", "No ads",
            "Banner, full-screen and game-over ads are not loaded or shown, as for members, and "
                + "neither are their Remove Ads links. Restart the app after switching it.",
            null, Features::noAdsPatched),
        new Feature(NO_RATING_PROMPTS, "Less clutter", "glyph_element_star_hollow", "No rating prompts",
            "The app doesn't ask you to rate it on Google Play.",
            null, Features::noRatingPromptsPatched),
    };

    private Features() {}

    // Patch markers: the matching patch replaces each body with "return true".
    public static boolean limitToastsPatched() { return false; }
    public static boolean shortTimeControlsPatched() { return false; }
    public static boolean hidePremiumPatched() { return false; }
    public static boolean customHomePatched() { return false; }
    public static boolean customTabsPatched() { return false; }
    public static boolean arcadePatched() { return false; }
    public static boolean arrowsPatched() { return false; }
    public static boolean boardColorsPatched() { return false; }
    public static boolean amoledPatched() { return false; }
    public static boolean accentPatched() { return false; }
    public static boolean noAdsPatched() { return false; }
    public static boolean noRatingPromptsPatched() { return false; }
    public static boolean lichessReviewPatched() { return false; }

    public static List<Feature> patched() {
        List<Feature> list = new ArrayList<>();
        for (Feature feature : ALL) if (feature.isPatched()) list.add(feature);
        return list;
    }

    public static boolean isEnabled(String id) {
        SharedPreferences preferences = preferences();
        return preferences == null || preferences.getBoolean(id, true);
    }

    public static void setEnabled(String id, boolean enabled) {
        SharedPreferences preferences = preferences();
        if (preferences != null) preferences.edit().putBoolean(id, enabled).apply();
    }

    private static SharedPreferences preferences;

    /** The bundle's own preferences inside the app; null before the app has started. */
    public static SharedPreferences preferences() {
        if (preferences == null) {
            Context context = Utils.context();
            if (context != null) preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        }
        return preferences;
    }
}
