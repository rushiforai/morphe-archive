package app.noam.extension.chesscom.home;

import android.content.SharedPreferences;
import android.text.TextUtils;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;

/**
 * chess.com serves one of two Home screens per account (the older list or the redesign), so every
 * switch applies to both. Items are recognised by what their data classes print ("QuickPlay(...").
 */
public final class HomeLayout {
    /** Tiles (the redesign calls them recommended activities). */
    public static final String[] TILES = {
        "quick_game", "puzzles", "daily_puzzle", "bots", "coach", "lessons", "courses", "drills",
        "game_review", "play_friend", "find_friend", "in_person", "solo_chess", "vision",
    };
    public static final String[] TILE_TITLES = {
        "Play Online", "Puzzles", "Daily Puzzle", "Play Bots", "Play Coach", "Lessons", "Courses", "Drills",
        "Game Review", "Play a Friend", "Find a Friend", "Play in Person", "Solo Chess", "Vision",
    };

    public static final String[] SECTIONS = {
        "header", "daily_games", "challenges", "recommendations", "friends", "stats", "history",
        "activity_feed", "online_now",
    };
    public static final String[] SECTION_TITLES = {
        "Coach message and Chess TV", "Daily games", "Challenges", "Suggested opponents", "Friends",
        "Stats", "Game history", "Activity feed", "Online now",
    };

    private static final String TILE_ORDER = "home_tile_order_v2";
    private static final String HIDDEN_TILES = "home_hidden_tiles_v2";
    private static final String HIDDEN_SECTIONS = "home_hidden_sections_v2";

    private static Map<String, String> sectionsByClass;

    private HomeLayout() {}

    /** "binary.class.Name=SectionName;..." for the older Home's section classes; set by the patch. */
    private static String sectionClasses() {
        return "";
    }

    private static boolean enabled() {
        return Features.customHomePatched() && Features.isEnabled(Features.CUSTOM_HOME);
    }

    /** The grid's tiles, reordered and filtered as the user chose. */
    @SuppressWarnings("rawtypes")
    public static List tiles(List tiles) {
        if (tiles == null || !enabled()) return tiles;
        return arrange(tiles);
    }

    /** The sections map as the screen reads it, without the hidden sections. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Map sections(Map sections) {
        if (sections == null || !enabled()) return sections;
        Set<String> hidden = hiddenSections();
        if (hidden.isEmpty()) return sections;
        Map<String, String> names = sectionNames();
        Map filtered = new LinkedHashMap(sections);
        Iterator keys = filtered.keySet().iterator();
        while (keys.hasNext()) {
            Object key = keys.next();
            if (key instanceof Class && hidden.contains(olderSection(names.get(((Class<?>) key).getName())))) keys.remove();
        }
        return filtered;
    }

    /** The recommended activities, filtered and reordered (a new section object when changed). */
    @SuppressWarnings("rawtypes")
    public static Object recommendedActivities(Object section) {
        if (section == null || !enabled()) return section;
        try {
            Field listField = null, typeField = null;
            for (Field field : section.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                if (List.class.isAssignableFrom(field.getType())) listField = field;
                else if (field.getType().isEnum()) typeField = field;
            }
            if (listField == null || typeField == null) return section;
            listField.setAccessible(true);
            typeField.setAccessible(true);
            List activities = (List) listField.get(section);
            if (activities == null) return section;
            List arranged = arrange(activities);
            if (arranged.equals(activities)) return section;
            Constructor<?> constructor = section.getClass().getConstructor(List.class, typeField.getType());
            return constructor.newInstance(arranged, typeField.get(section));
        } catch (Throwable throwable) {
            Utils.logError("Home activities failed", throwable);
            return section;
        }
    }

    /** A section of the redesigned Home, or an empty one when it is hidden. */
    public static Object section(Object section) {
        if (section == null || !enabled()) return section;
        if (!hiddenSections().contains(redesignSection(prefix(section)))) return section;
        try {
            return section.getClass().getConstructor().newInstance();
        } catch (Throwable throwable) {
            Utils.logError("Home section failed", throwable);
            return section;
        }
    }

    /** Players online now, or nothing when that row is hidden. */
    public static Object onlineNow(Object users) {
        if (users == null || !enabled() || !hiddenSections().contains("online_now")) return users;
        return Collections.emptyList();
    }

    public static List<String> tileOrder() {
        List<String> order = new ArrayList<>();
        SharedPreferences preferences = Features.preferences();
        String saved = preferences == null ? null : preferences.getString(TILE_ORDER, null);
        if (saved != null) {
            for (String id : saved.split(",")) if (Arrays.asList(TILES).contains(id) && !order.contains(id)) order.add(id);
        }
        for (String id : TILES) if (!order.contains(id)) order.add(id);
        return order;
    }

    public static void setTileOrder(List<String> order) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putString(TILE_ORDER, TextUtils.join(",", order)).apply();
    }

    public static Set<String> hiddenTiles() {
        return set(HIDDEN_TILES);
    }

    public static void setTileHidden(String id, boolean hidden) {
        update(HIDDEN_TILES, id, hidden);
    }

    public static Set<String> hiddenSections() {
        return set(HIDDEN_SECTIONS);
    }

    public static void setSectionHidden(String id, boolean hidden) {
        update(HIDDEN_SECTIONS, id, hidden);
    }

    public static String tileTitle(String id) {
        int index = Arrays.asList(TILES).indexOf(id);
        return index < 0 ? id : TILE_TITLES[index];
    }

    /** Without the hidden tiles, and in the saved order once the user has reordered them. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    private static List arrange(List tiles) {
        Set<String> hidden = hiddenTiles();
        List kept = new ArrayList(tiles.size());
        for (Object tile : tiles) if (!hidden.contains(tileId(tile))) kept.add(tile);
        SharedPreferences preferences = Features.preferences();
        if (preferences != null && preferences.contains(TILE_ORDER)) {
            List<String> order = tileOrder();
            Collections.sort(kept, (a, b) -> Integer.compare(rank(order, tileId(a)), rank(order, tileId(b))));
        }
        return kept;
    }

    /** What a data class prints before its "(" ("Drills" for objects). */
    private static String prefix(Object item) {
        String name = String.valueOf(item);
        int open = name.indexOf('(');
        return open > 0 ? name.substring(0, open) : name;
    }

    private static String tileId(Object tile) {
        String name = prefix(tile);
        switch (name) {
            case "QuickGameOnlineFeatureTileItem":
            case "QuickPlay":
                return "quick_game";
            case "ClassicPuzzlesFeatureTileItem":
            case "PathPuzzlesFeatureTileItem":
            case "OfflinePuzzlesFeatureTileItem":
            case "GuestPuzzlesFeatureTileItem":
            case "PuzzlePlay":
            case "PuzzlePath":
                return "puzzles";
            case "DailyPuzzleFeatureTileItem":
            case "DailyPuzzle":
                return "daily_puzzle";
            case "QuickBotGameFeatureTileItem":
            case "UnfinishedBotGameFeatureTileItem":
            case "Bot":
            case "LocalBot":
                return "bots";
            case "QuickCoachGameFeatureTileItem":
            case "UnfinishedCoachGameFeatureTileItem":
            case "Coach":
                return "coach";
            case "LessonsFeatureTileItem":
            case "Learn":
                return "lessons";
            case "Courses":
                return "courses";
            case "Drills":
                return "drills";
            case "GameReview":
                return "game_review";
            case "PlayAFriend":
                return "play_friend";
            case "FindAFriend":
                return "find_friend";
            case "PlayInPerson":
                return "in_person";
            case "SoloChess":
                return "solo_chess";
            case "Vision":
                return "vision";
            default:
                return name;
        }
    }

    private static String olderSection(String name) {
        if (name == null) return null;
        switch (name) {
            case "CurrentDailyGames":
                return "daily_games";
            case "Challenges":
            case "OutgoingChallenges":
                return "challenges";
            case "ChallengeRecommendations":
                return "recommendations";
            case "FriendsCarousel":
                return "friends";
            case "Stats":
                return "stats";
            case "FinishedVsPlayerGames":
            case "FinishedVsBotsGames":
            case "FinishedCoachGames":
                return "history";
            default:
                return null;
        }
    }

    /** The redesigned Home's section classes, by what they print. */
    private static String redesignSection(String name) {
        switch (name) {
            case "HeaderSection":
                return "header";
            case "StatsSection":
                return "stats";
            case "GameHistorySection":
                return "history";
            case "FriendsSection":
                return "friends";
            case "ChallengesSection":
                return "challenges";
            case "DailyGameSection":
                return "daily_games";
            case "ActivityFeedSection":
                return "activity_feed";
            default:
                return null;
        }
    }

    private static int rank(List<String> order, String id) {
        int index = order.indexOf(id);
        return index < 0 ? Integer.MAX_VALUE : index;
    }

    private static Map<String, String> sectionNames() {
        if (sectionsByClass == null) {
            Map<String, String> map = new HashMap<>();
            for (String pair : sectionClasses().split(";")) {
                int equals = pair.indexOf('=');
                if (equals > 0) map.put(pair.substring(0, equals), pair.substring(equals + 1));
            }
            sectionsByClass = map;
        }
        return sectionsByClass;
    }

    private static Set<String> set(String key) {
        SharedPreferences preferences = Features.preferences();
        Set<String> saved = preferences == null ? null : preferences.getStringSet(key, null);
        return saved == null ? new HashSet<>() : new HashSet<>(saved);
    }

    private static void update(String key, String value, boolean add) {
        SharedPreferences preferences = Features.preferences();
        if (preferences == null) return;
        Set<String> values = set(key);
        if (add) values.add(value);
        else values.remove(value);
        preferences.edit().putStringSet(key, values).apply();
    }
}
