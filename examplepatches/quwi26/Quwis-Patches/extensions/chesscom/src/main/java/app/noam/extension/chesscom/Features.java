package app.noam.extension.chesscom;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.List;

/** A feature shows in Quwi's Patches only when its patch was applied, which makes its marker below return true. */
public final class Features {
    public static final String LIMIT_TOASTS = "limit_toasts";
    public static final String SHORT_TIME_CONTROLS = "short_time_controls";
    public static final String HIDE_PREMIUM = "hide_premium";
    public static final String CUSTOM_HOME = "custom_home";
    public static final String CUSTOM_TABS = "custom_tabs";
    public static final String ARCADE = "arcade";
    public static final String ARROWS = "arrows";
    public static final String ARROWS_REVIEWS = "arrows_reviews";
    public static final String BOARD_COLORS = "board_colors";
    public static final String AMOLED = "amoled";
    public static final String ACCENT = "accent";
    public static final String NO_ADS = "no_ads";
    public static final String NO_RATING_PROMPTS = "no_rating_prompts";
    public static final String STOCKFISH = "stockfish";
    public static final String LICHESS_PUZZLES = "lichess_puzzles";
    public static final String BOT_UNLOCK = "bot_unlock";
    public static final String UNLIMITED_COACH = "unlimited_coach";
    public static final String PREMIUM_UNLOCK = "premium_unlock";
    public static final String GAME_REVIEW = "game_review";
    public static final String COMPUTER_REVIEW = "computer_review";
    public static final String NETWORK_SCAN = "network_scan";
    public static final String GREAT_MOVES = "great_moves";
    public static final String DISCORD = "discord";
    public static final String LOGS = "logs";

    public static final String PAGE_HOME = "home";
    public static final String PAGE_TABS = "tabs";
    public static final String PAGE_BOARD_COLORS = "board_colors";
    public static final String PAGE_ARCADE = "arcade";
    public static final String PAGE_ACCENT = "accent";
    public static final String PAGE_STOCKFISH = "stockfish";
    public static final String PAGE_PUZZLES = "lichess_puzzles";
    public static final String PAGE_GAME_REVIEW = "game_review";
    public static final String PAGE_COMPUTER_REVIEW = "computer_review";
    public static final String PAGE_NETWORK_SCAN = "network_scan";
    public static final String PAGE_GREAT_MOVES = "great_moves";
    public static final String PAGE_DISCORD = "discord";
    public static final String PAGE_LOGS = "logs";
    /** The screens shown the first time the patched app opens. */
    public static final String PAGE_WELCOME = "welcome";

    public static final String[] SECTIONS = {"Board", "Look", "Games", "Less clutter", "Social", "Help"};

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
            "As on the chess.com website.",
            PAGE_ARCADE, Features::arcadePatched),
        new Feature(BOARD_COLORS, "Board", "glyph_board_simple_brush", "Board colors",
            "Your own squares or chess.com's.",
            PAGE_BOARD_COLORS, Features::boardColorsPatched),
        new Feature(ARROWS, "Board", "glyph_arrow_line_diagonal_top_right", "Arrows in games",
            "As on the website, in game bars.",
            null, Features::arrowsPatched),
        new Feature(ARROWS_REVIEWS, "Board", "glyph_board_analysis", "Arrows in reviews",
            "In Game Review and analysis.",
            null, Features::arrowsReviewsPatched),
        new Feature(AMOLED, "Look", "glyph_circle_fill_contrast", "AMOLED black",
            "Pure black instead of dark grey.",
            null, Features::amoledPatched),
        new Feature(ACCENT, "Look", "glyph_element_droplet", "Accent color",
            "In place of chess.com's green.",
            PAGE_ACCENT, Features::accentPatched),
        new Feature(CUSTOM_HOME, "Look", "glyph_dots_grid_3x3", "Home screen",
            "Tiles, sections and their order.",
            PAGE_HOME, Features::customHomePatched),
        new Feature(CUSTOM_TABS, "Look", "glyph_layout_list_bullet", "Bottom bar",
            "Tabs between Home and More.",
            PAGE_TABS, Features::customTabsPatched),
        new Feature(SHORT_TIME_CONTROLS, "Games", "glyph_board_simple_badge_clock", "Time controls under a minute",
            "Down to 10 seconds.",
            null, Features::shortTimeControlsPatched),
        new Feature(STOCKFISH, "Games", "glyph_device_chip", "Stockfish analysis",
            "Offline Stockfish 19 on your phone.",
            PAGE_STOCKFISH, Features::stockfishPatched),
        new Feature(LICHESS_PUZZLES, "Games", "glyph_game_type_puzzle", "Lichess Puzzles",
            "Rated here, solved offline.",
            PAGE_PUZZLES, Features::lichessPuzzlesPatched),
        new Feature(BOT_UNLOCK, "Games", "glyph_device_computer_versus", "Unlock all bots",
            "Versus Bots, Premium-only too.",
            null, Features::botUnlockPatched),
        new Feature(UNLIMITED_COACH, "Games", "glyph_game_lesson_student", "Unlimited Play Coach",
            "No one-game-a-day limit.",
            null, Features::unlimitedCoachPatched),
        new Feature(PREMIUM_UNLOCK, "Games", "glyph_membership_tier_diamond", "Unlock Premium content",
            "Premium checks always pass.",
            null, Features::premiumUnlockPatched),
        new Feature(GAME_REVIEW, "Games", "glyph_board_analysis", "Unlimited Game Review",
            "Lichess or Stockfish, no daily limit.",
            PAGE_GAME_REVIEW, Features::gameReviewPatched),
        new Feature(COMPUTER_REVIEW, "Games", "glyph_device_computer_versus", "Game Review on your computer",
            "Over Wi-Fi, instead of the phone.",
            PAGE_COMPUTER_REVIEW, Features::computerReviewPatched),
        new Feature(NETWORK_SCAN, "Games", "glyph_device_computer_versus", "Find the computer on the network",
            "Finds sf-bridge on your Wi-Fi.",
            PAGE_NETWORK_SCAN, Features::networkScanPatched),
        new Feature(GREAT_MOVES, "Games", "glyph_element_star_hollow", "Great and Brilliant moves analysis",
            "Marks Great (!) and Brilliant (!!).",
            PAGE_GREAT_MOVES, Features::greatMovesPatched),
        new Feature(DISCORD, "Social", "glyph_message_bubble_fill_pair", "Discord Rich Presence",
            "What you are doing, on your Discord profile.",
            PAGE_DISCORD, Features::discordPatched),
        new Feature(LOGS, "Help", "glyph_layout_list_bullet", "App logs",
            "Recent logs from this phone, for a bug report.",
            PAGE_LOGS, Features::logsPatched),
        new Feature(LIMIT_TOASTS, "Less clutter", "glyph_message_bubble_fill_pair", "Limits as toasts",
            "A toast instead of a Premium offer.",
            null, Features::limitToastsPatched),
        new Feature(HIDE_PREMIUM, "Less clutter", "glyph_game_suit_diamonds", "Hide Premium-only content",
            "Bots and upgrade banners are hidden.",
            null, Features::hidePremiumPatched),
        new Feature(NO_ADS, "Less clutter", "glyph_circle_block_megaphone", "No ads",
            "Banner and game-over ads are gone.",
            null, Features::noAdsPatched),
        new Feature(NO_RATING_PROMPTS, "Less clutter", "glyph_element_star_hollow", "No rating prompts",
            "No Google Play rating prompts.",
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
    public static boolean arrowsReviewsPatched() { return false; }
    public static boolean boardColorsPatched() { return false; }
    public static boolean amoledPatched() { return false; }
    public static boolean accentPatched() { return false; }
    public static boolean noAdsPatched() { return false; }
    public static boolean noRatingPromptsPatched() { return false; }
    public static boolean stockfishPatched() { return false; }
    public static boolean lichessPuzzlesPatched() { return false; }
    public static boolean botUnlockPatched() { return false; }
    public static boolean unlimitedCoachPatched() { return false; }
    public static boolean premiumUnlockPatched() { return false; }
    public static boolean gameReviewPatched() { return false; }
    public static boolean computerReviewPatched() { return false; }
    public static boolean networkScanPatched() { return false; }
    public static boolean greatMovesPatched() { return false; }
    public static boolean discordPatched() { return false; }
    public static boolean crashPatched() { return false; }
    public static boolean logsPatched() { return false; }

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
