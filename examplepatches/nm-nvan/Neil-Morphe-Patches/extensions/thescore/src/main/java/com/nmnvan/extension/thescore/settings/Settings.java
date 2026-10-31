package com.nmnvan.extension.thescore.settings;

import com.nmnvan.extension.thescore.patches.BottomNavPatch;
import com.nmnvan.extension.thescore.patches.GameScreenPatch;
import com.nmnvan.extension.thescore.patches.HeaderTabsPatch;
import com.nmnvan.extension.thescore.patches.LeaguesScreenPatch;
import com.nmnvan.extension.thescore.patches.ScorecastPatch;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class Settings {

    private Settings() {
    }

    /**
     * Settings under an optional sub-heading (e.g. a sport) within a section.
     */
    public static final class Group {
        /** Sub-heading, or null for settings shown directly under the section title. */
        public final String title;
        public final List<BooleanSetting> settings;

        Group(String title, BooleanSetting... settings) {
            this.title = title;
            this.settings = Collections.unmodifiableList(Arrays.asList(settings));
        }
    }

    /**
     * A titled section of the settings screen.
     */
    public static final class Section {
        public final String title;
        public final String note;
        public final List<Group> groups;

        Section(String title, String note, Group... groups) {
            this.title = title;
            this.note = note;
            this.groups = Collections.unmodifiableList(Arrays.asList(groups));
        }

        Section(String title, String note, BooleanSetting... settings) {
            this(title, note, new Group(null, settings));
        }
    }

    private static final String ALL_SPORTS = "All sports";
    private static final String BASEBALL = "Baseball";
    private static final String FOOTBALL = "Football";
    private static final String HOCKEY = "Hockey";
    private static final String BASKETBALL = "Basketball";
    private static final String OTHER = "Other";

    private static BooleanSetting.Availability bottomNav() {
        return BottomNavPatch::isPatchIncluded;
    }

    private static BooleanSetting.Availability headerTabs() {
        return HeaderTabsPatch::isPatchIncluded;
    }

    private static BooleanSetting.Availability scorecast() {
        return ScorecastPatch::isPatchIncluded;
    }

    // region Bottom navigation.

    public static final BooleanSetting HIDE_NAV_NEWS = new BooleanSetting("hide_nav_news", false,
            "Hide News", null, bottomNav());
    public static final BooleanSetting HIDE_NAV_SCORES = new BooleanSetting("hide_nav_scores", false,
            "Hide Scores", null, bottomNav());
    public static final BooleanSetting HIDE_NAV_FAVORITES = new BooleanSetting("hide_nav_favorites", false,
            "Hide Favorites", null, bottomNav());
    public static final BooleanSetting HIDE_NAV_BET = new BooleanSetting("hide_nav_bet", false,
            "Hide Bet", "Also hides Videos, which uses the same slot when Bet is off.", bottomNav());

    // endregion

    // region Game screen.

    public static final BooleanSetting KEEP_CLASSIC_GAME_SCREEN = new BooleanSetting(
            "keep_classic_game_screen", true,
            "Keep classic game screen",
            "theScore can switch game screens to a redesigned layout remotely. Keeping the classic layout "
                    + "makes sure the game tab and Scorecast settings below keep working.",
            GameScreenPatch::isPatchIncluded);

    // endregion

    // region Game screen tabs.

    public static final BooleanSetting HIDE_GAME_TAB_FEED = new BooleanSetting("hide_game_tab_feed", false,
            "Hide Feed", "Also the News tab on golf tournaments.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_CHAT = new BooleanSetting("hide_game_tab_chat", false,
            "Hide Chat", null, headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_SCORECAST = new BooleanSetting("hide_game_tab_scorecast", false,
            "Hide Scorecast", "Also the Matchup tab before and after games. The next tab opens instead.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_STATS = new BooleanSetting("hide_game_tab_stats", false,
            "Hide Stats", null, headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_BETTING = new BooleanSetting("hide_game_tab_betting", false,
            "Hide Betting", "Also Betting Info.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_PLAYS = new BooleanSetting("hide_game_tab_plays", false,
            "Hide Plays", null, headerTabs());

    public static final BooleanSetting HIDE_GAME_TAB_DRIVES = new BooleanSetting("hide_game_tab_drives", false,
            "Hide Drives", null, headerTabs());

    public static final BooleanSetting HIDE_GAME_TAB_LINEUPS = new BooleanSetting("hide_game_tab_lineups", false,
            "Hide Lineups", "Soccer.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_MBM = new BooleanSetting("hide_game_tab_mbm", false,
            "Hide MbM", "Soccer minute by minute.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_FIGHTS = new BooleanSetting("hide_game_tab_fights", false,
            "Hide Fights", "MMA.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_RESULTS = new BooleanSetting("hide_game_tab_results", false,
            "Hide Results", "Auto racing.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_QUALIFYING = new BooleanSetting("hide_game_tab_qualifying", false,
            "Hide Qualifying", "Auto racing.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_LEADERBOARD = new BooleanSetting("hide_game_tab_leaderboard", false,
            "Hide Field / Leaders / Matches", "Golf.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_COURSE = new BooleanSetting("hide_game_tab_course", false,
            "Hide Course", "Golf.", headerTabs());
    public static final BooleanSetting HIDE_GAME_TAB_INFO = new BooleanSetting("hide_game_tab_info", false,
            "Hide Info", "Golf.", headerTabs());

    // endregion

    // region League screen tabs.

    public static final BooleanSetting HIDE_LEAGUE_TAB_SCORES = new BooleanSetting("hide_league_tab_scores", false,
            "Hide Scores", null, headerTabs());
    public static final BooleanSetting HIDE_LEAGUE_TAB_NEWS = new BooleanSetting("hide_league_tab_news", false,
            "Hide News", null, headerTabs());
    public static final BooleanSetting HIDE_LEAGUE_TAB_CHAT = new BooleanSetting("hide_league_tab_chat", false,
            "Hide Chat", null, headerTabs());
    public static final BooleanSetting HIDE_LEAGUE_TAB_STANDINGS = new BooleanSetting("hide_league_tab_standings", false,
            "Hide Standings", null, headerTabs());
    public static final BooleanSetting HIDE_LEAGUE_TAB_LEADERS = new BooleanSetting("hide_league_tab_leaders", false,
            "Hide Leaders", null, headerTabs());
    public static final BooleanSetting HIDE_LEAGUE_TAB_BRACKET = new BooleanSetting("hide_league_tab_bracket", false,
            "Hide Bracket", null, headerTabs());
    public static final BooleanSetting HIDE_LEAGUE_TAB_OTHER = new BooleanSetting("hide_league_tab_other", false,
            "Hide other tabs", "Any other tabs theScore adds to a league, such as Teams or Players.", headerTabs());

    // endregion

    // region Leagues tab.

    public static final BooleanSetting HIDE_LEAGUE_CHIPS = new BooleanSetting("hide_league_chips", false,
            "Hide league chips",
            "Hides the row of recently viewed leagues (NCAA Football, MLB, NFL…) at the top of the Leagues tab.",
            LeaguesScreenPatch::isPatchIncluded);
    public static final BooleanSetting HIDE_SPOTLIGHT = new BooleanSetting("hide_spotlight", false,
            "Hide Spotlight", "Hides the Spotlight section on the Leagues tab.",
            LeaguesScreenPatch::isPatchIncluded);

    // endregion

    // region Scorecast blocks.

    private static BooleanSetting block(String key, String title, String summary) {
        return new BooleanSetting("hide_scorecast_" + key, false, title, summary, scorecast());
    }

    public static final BooleanSetting HIDE_SCORECAST_GAME_NEWS = block("game_news", "Hide Game News", null);
    public static final BooleanSetting HIDE_SCORECAST_ODDS = block("live_odds", "Hide Odds", "Including Go to SBET and See All Odds.");
    public static final BooleanSetting HIDE_SCORECAST_BETTING_POLL = block("betting_poll", "Hide betting poll", null);
    public static final BooleanSetting HIDE_SCORECAST_BET_HISTORY = block("bet_history", "Hide your bets", "Bets you placed on this game.");
    public static final BooleanSetting HIDE_SCORECAST_PROP_ANALYSIS = block("prop_analysis", "Hide prop analysis", null);
    public static final BooleanSetting HIDE_SCORECAST_LIVE_STREAM_CTA = block("live_stream_cta", "Hide watch live prompt", null);
    public static final BooleanSetting HIDE_SCORECAST_CLIPS = block("clips", "Hide clips", null);
    public static final BooleanSetting HIDE_SCORECAST_PREVIEW_RECAP = block("matchup_preview_recap", "Hide preview / recap", null);
    public static final BooleanSetting HIDE_SCORECAST_LAST_PLAY = block("last_play", "Hide last play", null);
    public static final BooleanSetting HIDE_SCORECAST_SCORING_SUMMARY = block("scoring_summary", "Hide scoring summary", null);
    public static final BooleanSetting HIDE_SCORECAST_BOXSCORE = block("boxscore", "Hide box score", null);
    public static final BooleanSetting HIDE_SCORECAST_LINE_SCORE = block("line_score", "Hide line score", null);
    public static final BooleanSetting HIDE_SCORECAST_TEAM_STATS = block("team_stats", "Hide team stats", null);
    public static final BooleanSetting HIDE_SCORECAST_TEAM_RECORDS = block("team_records", "Hide team records", null);
    public static final BooleanSetting HIDE_SCORECAST_TEAM_FORM = block("team_form", "Hide team form", null);
    public static final BooleanSetting HIDE_SCORECAST_PLAYER_COMPARISON = block("player_comparison", "Hide player comparison", null);
    public static final BooleanSetting HIDE_SCORECAST_STARTING_LINEUP = block("starting_lineup", "Hide starting lineups", null);
    public static final BooleanSetting HIDE_SCORECAST_PLAYER_INJURIES = block("player_injuries", "Hide injuries", null);
    public static final BooleanSetting HIDE_SCORECAST_PAST_MEETINGS = block("past_meetings", "Hide past meetings",
            "Last 5 and last 10 meetings.");
    public static final BooleanSetting HIDE_SCORECAST_GAME_DETAILS = block("game_details", "Hide game details", null);

    public static final BooleanSetting HIDE_SCORECAST_THREE_STARS = block("three_stars", "Hide three stars", null);
    public static final BooleanSetting HIDE_SCORECAST_SHOTS_ON_GOAL = block("shots_on_goal", "Hide shots on goal", null);
    public static final BooleanSetting HIDE_SCORECAST_PENALTIES = block("matchup_penalties", "Hide penalties",
            "Also shootouts.");

    public static final BooleanSetting HIDE_SCORECAST_TIMELINE = block("timeline", "Hide timeline", "Soccer.");
    public static final BooleanSetting HIDE_SCORECAST_LIVE_TABLE = block("live_table_preview", "Hide live table", "Soccer.");
    public static final BooleanSetting HIDE_SCORECAST_HEAD_TO_HEAD = block("head_to_head", "Hide head to head",
            "Tennis. Also past meetings.");
    public static final BooleanSetting HIDE_SCORECAST_PLAYER_PROFILES = block("player_profiles", "Hide player profiles", "Tennis.");
    public static final BooleanSetting HIDE_SCORECAST_MATCH_DETAILS = block("match_details", "Hide match details",
            "Tennis. Also tournament details.");
    public static final BooleanSetting HIDE_SCORECAST_MATCH_SUMMARY = block("match_summary", "Hide match summary", "Tennis.");

    // endregion

    /**
     * All settings by section, in the order shown on the settings screen.
     * Sport sub-headings without settings are not shown.
     */
    public static final List<Section> SECTIONS = Collections.unmodifiableList(Arrays.asList(
            new Section("Bottom navigation",
                    "Leagues is always shown. If the tab the app would open on is hidden, it opens on Leagues.",
                    HIDE_NAV_NEWS, HIDE_NAV_SCORES, HIDE_NAV_FAVORITES, HIDE_NAV_BET),
            new Section("Game screen", null,
                    KEEP_CLASSIC_GAME_SCREEN),
            new Section("Game screen tabs",
                    "If every tab of a game would be hidden, all tabs are shown.",
                    new Group(ALL_SPORTS,
                            HIDE_GAME_TAB_FEED, HIDE_GAME_TAB_CHAT, HIDE_GAME_TAB_SCORECAST, HIDE_GAME_TAB_STATS,
                            HIDE_GAME_TAB_BETTING, HIDE_GAME_TAB_PLAYS),
                    new Group(BASEBALL),
                    new Group(FOOTBALL,
                            HIDE_GAME_TAB_DRIVES),
                    new Group(HOCKEY),
                    new Group(BASKETBALL),
                    new Group(OTHER,
                            HIDE_GAME_TAB_LINEUPS, HIDE_GAME_TAB_MBM, HIDE_GAME_TAB_FIGHTS, HIDE_GAME_TAB_RESULTS,
                            HIDE_GAME_TAB_QUALIFYING, HIDE_GAME_TAB_LEADERBOARD, HIDE_GAME_TAB_COURSE,
                            HIDE_GAME_TAB_INFO)),
            new Section("League screen tabs",
                    "If every tab of a league would be hidden, all tabs are shown.",
                    HIDE_LEAGUE_TAB_SCORES, HIDE_LEAGUE_TAB_NEWS, HIDE_LEAGUE_TAB_CHAT, HIDE_LEAGUE_TAB_STANDINGS,
                    HIDE_LEAGUE_TAB_LEADERS, HIDE_LEAGUE_TAB_BRACKET, HIDE_LEAGUE_TAB_OTHER),
            new Section("Leagues tab", null,
                    HIDE_LEAGUE_CHIPS, HIDE_SPOTLIGHT),
            new Section("Scorecast",
                    "Blocks on a game's Scorecast tab. A block only appears when theScore has data for it.",
                    new Group(ALL_SPORTS,
                            HIDE_SCORECAST_GAME_NEWS, HIDE_SCORECAST_ODDS, HIDE_SCORECAST_BETTING_POLL,
                            HIDE_SCORECAST_BET_HISTORY, HIDE_SCORECAST_PROP_ANALYSIS, HIDE_SCORECAST_LIVE_STREAM_CTA,
                            HIDE_SCORECAST_CLIPS, HIDE_SCORECAST_PREVIEW_RECAP, HIDE_SCORECAST_LAST_PLAY,
                            HIDE_SCORECAST_SCORING_SUMMARY, HIDE_SCORECAST_BOXSCORE, HIDE_SCORECAST_LINE_SCORE,
                            HIDE_SCORECAST_TEAM_STATS, HIDE_SCORECAST_TEAM_RECORDS, HIDE_SCORECAST_TEAM_FORM,
                            HIDE_SCORECAST_PLAYER_COMPARISON, HIDE_SCORECAST_STARTING_LINEUP,
                            HIDE_SCORECAST_PLAYER_INJURIES, HIDE_SCORECAST_PAST_MEETINGS, HIDE_SCORECAST_GAME_DETAILS),
                    new Group(BASEBALL),
                    new Group(FOOTBALL),
                    new Group(HOCKEY,
                            HIDE_SCORECAST_THREE_STARS, HIDE_SCORECAST_SHOTS_ON_GOAL, HIDE_SCORECAST_PENALTIES),
                    new Group(BASKETBALL),
                    new Group(OTHER,
                            HIDE_SCORECAST_TIMELINE, HIDE_SCORECAST_LIVE_TABLE, HIDE_SCORECAST_HEAD_TO_HEAD,
                            HIDE_SCORECAST_PLAYER_PROFILES, HIDE_SCORECAST_MATCH_DETAILS, HIDE_SCORECAST_MATCH_SUMMARY))
    ));
}
