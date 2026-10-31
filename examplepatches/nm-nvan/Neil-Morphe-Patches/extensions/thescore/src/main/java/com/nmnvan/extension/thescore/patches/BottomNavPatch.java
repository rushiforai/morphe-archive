package com.nmnvan.extension.thescore.patches;

import static com.nmnvan.extension.thescore.settings.Settings.*;

import android.content.Context;
import android.util.SparseArray;

import com.nmnvan.extension.thescore.Utils;
import com.nmnvan.extension.thescore.settings.BooleanSetting;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Hides bottom navigation tabs. Leagues is never hidden.
 * <p>
 * Only the visible tab list is filtered; every tab's navigation graph and fragment still exist,
 * so deep links keep working. If the tab the app would start on, or return to on Back, is hidden,
 * Leagues is used instead.
 */
@SuppressWarnings("unused")
public final class BottomNavPatch {

    /** Bottom nav tab ids (navigation graph ids), which are also the tabs' test tags. */
    private static final String NEWS = "navigation_news";
    private static final String SCORES = "navigation_scores";
    private static final String FAVORITES = "navigation_favorites";
    /** Bet and Videos share this slot. */
    private static final String BET = "navigation_videos";
    private static final String LEAGUES = "navigation_leagues";

    /**
     * Replaced by the patch to return true when the patch is applied.
     */
    public static boolean isPatchIncluded() {
        return false;
    }

    private static BooleanSetting settingFor(String tab) {
        switch (tab) {
            case NEWS:
                return HIDE_NAV_NEWS;
            case SCORES:
                return HIDE_NAV_SCORES;
            case FAVORITES:
                return HIDE_NAV_FAVORITES;
            case BET:
                return HIDE_NAV_BET;
            default:
                return null; // Leagues and anything unknown are always shown.
        }
    }

    private static boolean isHidden(String tab) {
        BooleanSetting setting = settingFor(tab);
        return setting != null && setting.get();
    }

    private static int navigationId(String tab) {
        Context context = Utils.getContext();
        if (context == null) return 0;
        return context.getResources().getIdentifier(tab, "id", context.getPackageName());
    }

    private static boolean isHiddenId(int id) {
        if (id == 0) return false;
        for (String tab : new String[]{NEWS, SCORES, FAVORITES, BET}) {
            if (id == navigationId(tab)) return isHidden(tab);
        }
        return false;
    }

    /**
     * Injection point: BottomNavController constructor, the tab list (BottomNavTabUiState items).
     */
    public static List<?> filterTabs(List<?> tabs) {
        if (tabs == null || tabs.isEmpty()) return tabs;
        try {
            ArrayList<Object> kept = new ArrayList<>(tabs.size());
            for (Object tab : tabs) {
                String tag = testTag(tab);
                if (tag == null || !isHidden(tag)) kept.add(tab);
            }
            return kept.isEmpty() || kept.size() == tabs.size() ? tabs : kept;
        } catch (Exception ex) {
            Utils.logException("filterTabs failure", ex);
            return tabs;
        }
    }

    /**
     * Injection point: return value of the saved "last active tab".
     *
     * @return Leagues if the saved tab is hidden.
     */
    public static int getStartTab(int savedTabId) {
        try {
            if (isHiddenId(savedTabId)) {
                int leagues = navigationId(LEAGUES);
                if (leagues != 0) return leagues;
            }
        } catch (Exception ex) {
            Utils.logException("getStartTab failure", ex);
        }
        return savedTabId;
    }

    /**
     * Injection point: end of the BottomNavController constructor.
     * <p>
     * Back always returns to the "home" tab, which is News. If News is hidden, make Leagues home.
     * Fields are found by their values, not their (obfuscated) names.
     */
    public static void fixHomeTab(Object controller) {
        try {
            if (!isHidden(NEWS)) return;
            int newsId = navigationId(NEWS);
            int leaguesId = navigationId(LEAGUES);
            if (newsId == 0 || leaguesId == 0) return;

            SparseArray<?> tags = null;
            for (Field field : instanceFields(controller)) {
                if (field.getType() == SparseArray.class) tags = (SparseArray<?>) field.get(controller);
            }
            if (tags == null) return;
            Object newsTag = tags.get(newsId);
            Object leaguesTag = tags.get(leaguesId);
            if (newsTag == null || leaguesTag == null) return;

            Field homeId = null, homeTag = null, currentTag = null, isOnHome = null;
            for (Field field : instanceFields(controller)) {
                Class<?> type = field.getType();
                if (type == int.class && field.getInt(controller) == newsId) {
                    homeId = field;
                } else if (type == String.class) {
                    // The home tag is final; the current tag changes as tabs are selected.
                    if (Modifier.isFinal(field.getModifiers())) {
                        if (newsTag.equals(field.get(controller))) homeTag = field;
                    } else {
                        currentTag = field;
                    }
                } else if (type == boolean.class) {
                    isOnHome = field;
                }
            }
            if (homeId == null || homeTag == null || currentTag == null || isOnHome == null) return;

            homeId.setInt(controller, leaguesId);
            homeTag.set(controller, leaguesTag);
            isOnHome.setBoolean(controller, Objects.equals(currentTag.get(controller), leaguesTag));
        } catch (Exception ex) {
            Utils.logException("fixHomeTab failure", ex);
        }
    }

    private static List<Field> instanceFields(Object object) {
        List<Field> fields = new ArrayList<>();
        for (Field field : object.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            fields.add(field);
        }
        return fields;
    }

    /**
     * BottomNavTabUiState is a data class: "BottomNavTabUiState(graphId=…, testTag=navigation_news)".
     */
    private static String testTag(Object tab) {
        String text = String.valueOf(tab);
        int start = text.indexOf("testTag=");
        if (start < 0) return null;
        start += "testTag=".length();
        int end = start;
        while (end < text.length() && text.charAt(end) != ',' && text.charAt(end) != ')') end++;
        return text.substring(start, end);
    }
}
