package com.nmnvan.extension.thescore.patches;

import static com.nmnvan.extension.thescore.settings.Settings.*;

import android.content.Context;

import com.nmnvan.extension.thescore.Utils;
import com.nmnvan.extension.thescore.settings.BooleanSetting;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Hides top tabs on game and league screens.
 * <p>
 * Tabs are removed from the list before it reaches the ViewPager adapter and TabLayout,
 * so pages, titles and indices stay in sync. If the default tab is hidden, the app selects
 * the first remaining tab. A list is never filtered down to nothing.
 */
@SuppressWarnings("unused")
public final class HeaderTabsPatch {

    private static final String TAB_INFO_CLASS = "com.thescore.repositories.ui.tabs.TabInfo";
    private static final String TEXT_RESOURCE_CLASS = "com.thescore.commonUtilities.ui.Text$Resource";
    private static final String TEXT_RAW_CLASS = "com.thescore.commonUtilities.ui.Text$Raw";

    /**
     * Game tab title string resource name to the setting that hides it.
     */
    private static final Map<String, BooleanSetting> GAME_TAB_SETTINGS = new HashMap<>();

    static {
        GAME_TAB_SETTINGS.put("tab_feed", HIDE_GAME_TAB_FEED);
        GAME_TAB_SETTINGS.put("title_news", HIDE_GAME_TAB_FEED); // Golf.
        GAME_TAB_SETTINGS.put("tab_chat", HIDE_GAME_TAB_CHAT);
        GAME_TAB_SETTINGS.put("tab_score_cast", HIDE_GAME_TAB_SCORECAST);
        GAME_TAB_SETTINGS.put("tab_matchup", HIDE_GAME_TAB_SCORECAST);
        GAME_TAB_SETTINGS.put("tab_lineups", HIDE_GAME_TAB_LINEUPS);
        GAME_TAB_SETTINGS.put("stats", HIDE_GAME_TAB_STATS);
        GAME_TAB_SETTINGS.put("tab_betting", HIDE_GAME_TAB_BETTING);
        GAME_TAB_SETTINGS.put("tab_betting_info", HIDE_GAME_TAB_BETTING);
        GAME_TAB_SETTINGS.put("tab_plays", HIDE_GAME_TAB_PLAYS);
        GAME_TAB_SETTINGS.put("tab_drives", HIDE_GAME_TAB_DRIVES);
        GAME_TAB_SETTINGS.put("tab_mbm", HIDE_GAME_TAB_MBM);
        GAME_TAB_SETTINGS.put("tab_pitch_by_pitch", HIDE_GAME_TAB_PLAYS);
        GAME_TAB_SETTINGS.put("tab_fights", HIDE_GAME_TAB_FIGHTS);
        GAME_TAB_SETTINGS.put("tab_results", HIDE_GAME_TAB_RESULTS);
        GAME_TAB_SETTINGS.put("tab_qualifying", HIDE_GAME_TAB_QUALIFYING);
        GAME_TAB_SETTINGS.put("tab_qualifiers", HIDE_GAME_TAB_QUALIFYING);
        GAME_TAB_SETTINGS.put("tab_field", HIDE_GAME_TAB_LEADERBOARD);
        GAME_TAB_SETTINGS.put("tab_leaders", HIDE_GAME_TAB_LEADERBOARD);
        GAME_TAB_SETTINGS.put("tab_matches", HIDE_GAME_TAB_LEADERBOARD);
        GAME_TAB_SETTINGS.put("tab_course", HIDE_GAME_TAB_COURSE);
        GAME_TAB_SETTINGS.put("tab_info", HIDE_GAME_TAB_INFO);
    }

    private static Method getTitleMethod;
    private static Method getConfigMethod;

    /**
     * Replaced by the patch to return true when the patch is applied.
     */
    public static boolean isPatchIncluded() {
        return false;
    }

    /**
     * Injection point: every return of the game screen tab builders.
     * Non-list results (null, suspended coroutine marker) are passed through.
     */
    public static Object filterGameTabs(Object result) {
        return filter(result, true);
    }

    /**
     * Injection point: the league screen tab list, just before it is emitted.
     */
    public static Object filterLeagueTabs(Object result) {
        return filter(result, false);
    }

    private static Object filter(Object result, boolean gameScreen) {
        if (!(result instanceof List)) return result;
        List<?> tabs = (List<?>) result;
        if (tabs.isEmpty()) return result;

        try {
            ArrayList<Object> kept = new ArrayList<>(tabs.size());
            for (Object tab : tabs) {
                BooleanSetting setting = gameScreen ? gameTabSetting(tab) : leagueTabSetting(tab);
                if (setting == null || !setting.get()) kept.add(tab);
            }
            if (kept.size() == tabs.size() || kept.isEmpty()) return result;
            return kept;
        } catch (Exception ex) {
            Utils.logException("filter tabs failure", ex);
            return result;
        }
    }

    private static BooleanSetting gameTabSetting(Object tab) throws Exception {
        Object title = getTitle(tab);
        if (title == null || !title.getClass().getName().equals(TEXT_RESOURCE_CLASS)) return null;

        Context context = Utils.getContext();
        if (context == null) return null;

        int resId = (Integer) title.getClass().getMethod("getValue").invoke(title);
        String name = context.getResources().getResourceEntryName(resId);
        return GAME_TAB_SETTINGS.get(name);
    }

    private static BooleanSetting leagueTabSetting(Object tab) throws Exception {
        Object config = getConfig(tab);
        if (config == null) return null;
        String configClass = config.getClass().getName();

        if (configClass.endsWith("TabsConfig$LeagueScheduleConfig")
                || configClass.endsWith("TabsConfig$TournamentScheduleConfig")) {
            return HIDE_LEAGUE_TAB_SCORES;
        }
        if (configClass.endsWith(".ChatListConfig")) return HIDE_LEAGUE_TAB_CHAT;
        if (configClass.endsWith("TabsConfig$StandingsTabsConfig")) return HIDE_LEAGUE_TAB_STANDINGS;
        if (configClass.endsWith("TabsConfig$LeadersTabsConfig")) return HIDE_LEAGUE_TAB_LEADERS;
        if (configClass.endsWith(".BracketComposeConfig")) return HIDE_LEAGUE_TAB_BRACKET;

        // News and any other server-provided section (Teams, Players…) share a generic feed page.
        // The league tab titles come from the server, so News is recognised by its title.
        Object title = getTitle(tab);
        if (title != null && title.getClass().getName().equals(TEXT_RAW_CLASS)) {
            Object text = title.getClass().getMethod("getValue").invoke(title);
            if (text != null && text.toString().trim().toLowerCase(Locale.ROOT).equals("news")) {
                return HIDE_LEAGUE_TAB_NEWS;
            }
        }
        return HIDE_LEAGUE_TAB_OTHER;
    }

    private static Object getTitle(Object tab) throws Exception {
        if (!isTabInfo(tab)) return null;
        if (getTitleMethod == null) getTitleMethod = tab.getClass().getMethod("getTitle");
        return getTitleMethod.invoke(tab);
    }

    private static Object getConfig(Object tab) throws Exception {
        if (!isTabInfo(tab)) return null;
        if (getConfigMethod == null) getConfigMethod = tab.getClass().getMethod("getConfig");
        return getConfigMethod.invoke(tab);
    }

    private static boolean isTabInfo(Object tab) {
        return tab != null && tab.getClass().getName().equals(TAB_INFO_CLASS);
    }
}
