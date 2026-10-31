package com.nmnvan.extension.thescore.patches;

import static com.nmnvan.extension.thescore.settings.Settings.*;

import com.nmnvan.extension.thescore.Utils;
import com.nmnvan.extension.thescore.settings.BooleanSetting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("unused")
public final class ScorecastPatch {

    /**
     * Scorecast block (MatchupPageStrategy enum constant name) to the setting that hides it.
     */
    private static final Map<String, BooleanSetting> BLOCK_SETTINGS = new HashMap<>();

    static {
        BLOCK_SETTINGS.put("GAME_NEWS", HIDE_SCORECAST_GAME_NEWS);
        BLOCK_SETTINGS.put("LIVE_ODDS", HIDE_SCORECAST_ODDS);
        BLOCK_SETTINGS.put("BETTING_POLL", HIDE_SCORECAST_BETTING_POLL);
        BLOCK_SETTINGS.put("BET_HISTORY", HIDE_SCORECAST_BET_HISTORY);
        BLOCK_SETTINGS.put("PROP_ANALYSIS", HIDE_SCORECAST_PROP_ANALYSIS);
        BLOCK_SETTINGS.put("LIVE_STREAM_CTA", HIDE_SCORECAST_LIVE_STREAM_CTA);
        BLOCK_SETTINGS.put("CLIPS", HIDE_SCORECAST_CLIPS);
        BLOCK_SETTINGS.put("MATCHUP_PREVIEW_RECAP", HIDE_SCORECAST_PREVIEW_RECAP);
        BLOCK_SETTINGS.put("LAST_PLAY", HIDE_SCORECAST_LAST_PLAY);
        BLOCK_SETTINGS.put("SCORING_SUMMARY", HIDE_SCORECAST_SCORING_SUMMARY);
        BLOCK_SETTINGS.put("TIMELINE", HIDE_SCORECAST_TIMELINE);
        BLOCK_SETTINGS.put("BOXSCORE", HIDE_SCORECAST_BOXSCORE);
        BLOCK_SETTINGS.put("LINE_SCORE", HIDE_SCORECAST_LINE_SCORE);
        BLOCK_SETTINGS.put("TEAM_STATS", HIDE_SCORECAST_TEAM_STATS);
        BLOCK_SETTINGS.put("TEAM_RECORDS", HIDE_SCORECAST_TEAM_RECORDS);
        BLOCK_SETTINGS.put("TEAM_FORM", HIDE_SCORECAST_TEAM_FORM);
        BLOCK_SETTINGS.put("PLAYER_COMPARISON", HIDE_SCORECAST_PLAYER_COMPARISON);
        BLOCK_SETTINGS.put("STARTING_LINEUP", HIDE_SCORECAST_STARTING_LINEUP);
        BLOCK_SETTINGS.put("PLAYER_INJURIES", HIDE_SCORECAST_PLAYER_INJURIES);
        BLOCK_SETTINGS.put("LAST_TEN_MEETINGS", HIDE_SCORECAST_PAST_MEETINGS);
        BLOCK_SETTINGS.put("LAST_FIVE_MEETINGS", HIDE_SCORECAST_PAST_MEETINGS);
        BLOCK_SETTINGS.put("GAME_DETAILS", HIDE_SCORECAST_GAME_DETAILS);
        // Tennis.
        BLOCK_SETTINGS.put("HEAD_TO_HEAD", HIDE_SCORECAST_HEAD_TO_HEAD);
        BLOCK_SETTINGS.put("PAST_MEETINGS", HIDE_SCORECAST_HEAD_TO_HEAD);
        BLOCK_SETTINGS.put("PLAYER_PROFILES", HIDE_SCORECAST_PLAYER_PROFILES);
        BLOCK_SETTINGS.put("MATCH_DETAILS", HIDE_SCORECAST_MATCH_DETAILS);
        BLOCK_SETTINGS.put("TOURNAMENT_DETAILS", HIDE_SCORECAST_MATCH_DETAILS);
        BLOCK_SETTINGS.put("THREE_STARS", HIDE_SCORECAST_THREE_STARS);
        BLOCK_SETTINGS.put("SHOTS_ON_GOAL", HIDE_SCORECAST_SHOTS_ON_GOAL);
        BLOCK_SETTINGS.put("MATCHUP_PENALTIES", HIDE_SCORECAST_PENALTIES);
        BLOCK_SETTINGS.put("PENALTY_SHOOTOUTS", HIDE_SCORECAST_PENALTIES);
        BLOCK_SETTINGS.put("LIVE_TABLE_PREVIEW", HIDE_SCORECAST_LIVE_TABLE);
        BLOCK_SETTINGS.put("MATCH_SUMMARY", HIDE_SCORECAST_MATCH_SUMMARY);
    }

    /**
     * Replaced by the patch to return true when the patch is applied.
     */
    public static boolean isPatchIncluded() {
        return false;
    }

    /**
     * Injection point: every MatchupPageStrategy getter that returns the ordered list of blocks.
     * The app builds one block per enum entry, so dropping an entry removes the whole block
     * (header, content and buttons) without leaving a gap.
     */
    public static List<?> filterBlocks(List<?> blocks) {
        if (blocks == null || blocks.isEmpty()) return blocks;
        try {
            ArrayList<Object> filtered = null;
            for (int i = 0, size = blocks.size(); i < size; i++) {
                Object block = blocks.get(i);
                if (isHidden(block)) {
                    if (filtered == null) filtered = new ArrayList<>(blocks.subList(0, i));
                } else if (filtered != null) {
                    filtered.add(block);
                }
            }
            return filtered == null ? blocks : filtered;
        } catch (Exception ex) {
            Utils.logException("filterBlocks failure", ex);
            return blocks;
        }
    }

    private static boolean isHidden(Object block) {
        if (!(block instanceof Enum)) return false;
        BooleanSetting setting = BLOCK_SETTINGS.get(((Enum<?>) block).name());
        return setting != null && setting.get();
    }
}
