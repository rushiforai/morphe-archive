package app.ahmedyarub.extension.x;

import android.content.Context;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Filters the item lists of the Customize patches.
 *
 * Items are told apart by what their toString prints, or by their enum name. Those survive R8,
 * the field names do not. Each placeholder below returns the comma separated keys its patch hides.
 * Every filter keeps at least one item, since a pager with no pages breaks, and hands back its
 * input unchanged if anything goes wrong.
 */
@SuppressWarnings("unused")
public final class Customise {

    private static String inlineActionBarHidden() { return ""; }
    private static String navBarHidden() { return ""; }
    private static String replySortChoice() { return ""; }
    private static String exploreTabsHidden() { return ""; }
    private static String notificationTabsHidden() { return ""; }
    private static String searchSuggestionsHidden() { return ""; }
    private static String searchTabsHidden() { return ""; }
    private static String sideBarHidden() { return ""; }
    private static String homeTabsHidden() { return ""; }

    private static final class Hidden {
        static final Set<String> INLINE_ACTION_BAR = keys(inlineActionBarHidden());
        static final Set<String> NAV_BAR = keys(navBarHidden());
        static final Set<String> EXPLORE_TABS = keys(exploreTabsHidden());
        static final Set<String> NOTIFICATION_TABS = keys(notificationTabsHidden());
        static final Set<String> SEARCH_SUGGESTIONS = keys(searchSuggestionsHidden());
        static final Set<String> SEARCH_TABS = keys(searchTabsHidden());
        static final Set<String> HOME_TABS = keys(homeTabsHidden());
    }

    private static final Pattern INLINE_ACTION = Pattern.compile("InlineActionEntry\\(actionType=(\\w+)");
    private static final Pattern NOTIFICATION_TAB = Pattern.compile("notificationTabType=(\\w+)");
    private static final Pattern SEARCH_TAB = Pattern.compile("searchType=(\\w+)");
    private static final Pattern HOME_TAB = Pattern.compile("homeTabType=(\\w+)");
    private static final Pattern EXPLORE_ID = Pattern.compile("segmentedTimelineId=([^,)]*)");
    private static final Pattern EXPLORE_SECTION = Pattern.compile("section=([^,)]*)");

    // region Inline action bar

    /** Removes hidden actions from the bar's entries, in place. */
    public static void inlineActionBar(List<?> entries) {
        if (Hidden.INLINE_ACTION_BAR.isEmpty() || entries == null) return;

        try {
            for (Iterator<?> iterator = entries.iterator(); iterator.hasNext(); ) {
                String action = group(INLINE_ACTION, iterator.next());
                if (action != null && Hidden.INLINE_ACTION_BAR.contains(inlineActionKey(action))) iterator.remove();
            }
        } catch (Exception ex) {
            Logger.printException(() -> "inlineActionBar failure", ex);
        }
    }

    /** The option key an action belongs to: an action and its undo share one. */
    private static String inlineActionKey(String action) {
        return switch (action) {
            case "Retweet", "UndoRetweet" -> "retweet";
            case "Favorite", "Unfavorite" -> "like";
            case "ViewCount", "Dislike", "UndoDislike" -> "views";
            case "AddToBookmarks", "RemoveFromBookmarks" -> "bookmark";
            default -> action.toLowerCase(Locale.ROOT);
        };
    }

    // endregion

    // region Navigation bar

    /** Removes hidden tabs from the bottom bar, in place. Home is the start destination and stays. */
    public static void navBar(List<?> tabs) {
        if (Hidden.NAV_BAR.isEmpty() || tabs == null) return;

        try {
            for (Iterator<?> iterator = tabs.iterator(); iterator.hasNext(); ) {
                String name = ((Enum<?>) iterator.next()).name();
                if (!name.equals("HOME") && Hidden.NAV_BAR.contains(name.toLowerCase(Locale.ROOT))) iterator.remove();
            }
        } catch (Exception ex) {
            Logger.printException(() -> "navBar failure", ex);
        }
    }

    // endregion

    // region Reply sorting

    /** The sort a conversation opens with, in place of the app's default. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Enum<?> replySort(Enum<?> defaultSort) {
        String chosen = replySortChoice();
        if (chosen.isEmpty() || defaultSort == null) return defaultSort;

        try {
            return Enum.valueOf((Class) defaultSort.getDeclaringClass(), chosen);
        } catch (Exception ex) {
            Logger.printException(() -> "replySort failure", ex);
            return defaultSort;
        }
    }

    // endregion

    // region Explore tabs

    /** The Explore page's tabs without the hidden ones, matched on their id or scribe section. */
    public static List<?> exploreTabs(List<?> tabs) {
        if (Hidden.EXPLORE_TABS.isEmpty() || tabs == null) return tabs;

        try {
            List<Object> kept = new ArrayList<>(tabs.size());
            for (Object tab : tabs) {
                String id = normalise(group(EXPLORE_ID, tab));
                String section = normalise(group(EXPLORE_SECTION, tab));
                if (!Hidden.EXPLORE_TABS.contains(id) && !Hidden.EXPLORE_TABS.contains(section)) kept.add(tab);
            }
            return kept.isEmpty() ? tabs : kept;
        } catch (Exception ex) {
            Logger.printException(() -> "exploreTabs failure", ex);
            return tabs;
        }
    }

    // endregion

    // region Tab arrays

    public static Object[] notificationTabs(Object[] tabs) {
        return filterArray(tabs, NOTIFICATION_TAB, Hidden.NOTIFICATION_TABS);
    }

    public static Object[] searchTabs(Object[] tabs) {
        return filterArray(tabs, SEARCH_TAB, Hidden.SEARCH_TABS);
    }

    /** The home timeline's default tabs, For you and Following. */
    public static Object[] homeTabs(Object[] tabs) {
        return filterArray(tabs, HOME_TAB, Hidden.HOME_TABS);
    }

    /** The home timeline's full tab list, pinned lists and communities included, in place. */
    public static void homeTabsList(List<?> tabs) {
        if (Hidden.HOME_TABS.isEmpty() || tabs == null) return;

        try {
            List<Object> removed = new ArrayList<>();
            for (Object tab : tabs) {
                if (Hidden.HOME_TABS.contains(homeTabKey(tab))) removed.add(tab);
            }
            if (removed.size() < tabs.size()) tabs.removeAll(removed);
        } catch (Exception ex) {
            Logger.printException(() -> "homeTabsList failure", ex);
        }
    }

    private static String homeTabKey(Object tab) {
        String text = String.valueOf(tab);
        if (text.contains("ListPinnedTimeline")) return "pinnedlists";
        if (text.contains("CommunityPinnedTimeline")) return "pinnedcommunities";
        if (text.contains("TopicPinnedTimeline") || text.contains("GenericPinnedTimeline")) return "pinnedtopics";
        return normalise(group(HOME_TAB, tab));
    }

    private static Object[] filterArray(Object[] items, Pattern key, Set<String> hidden) {
        if (hidden.isEmpty() || items == null) return items;

        try {
            List<Object> kept = new ArrayList<>(items.length);
            for (Object item : items) {
                if (!hidden.contains(normalise(group(key, item)))) kept.add(item);
            }
            if (kept.isEmpty() || kept.size() == items.length) return items;

            // The same array type the app built, so it can be handed on as is.
            return kept.toArray(Arrays.copyOf(items, 0));
        } catch (Exception ex) {
            Logger.printException(() -> "Tab filter failure", ex);
            return items;
        }
    }

    // endregion

    // region Search suggestions

    /** The search typeahead without the hidden kinds of item: users or query suggestions. */
    public static List<?> searchTypeahead(List<?> items) {
        if (Hidden.SEARCH_SUGGESTIONS.isEmpty() || items == null) return items;

        try {
            List<Object> kept = new ArrayList<>(items.size());
            for (Object item : items) {
                String text = String.valueOf(item);
                boolean hidden = (text.startsWith("User(") && Hidden.SEARCH_SUGGESTIONS.contains("users"))
                        || (text.startsWith("Suggestion(") && Hidden.SEARCH_SUGGESTIONS.contains("suggestions"));
                if (!hidden) kept.add(item);
            }
            return kept;
        } catch (Exception ex) {
            Logger.printException(() -> "searchTypeahead failure", ex);
            return items;
        }
    }

    // endregion

    // region Side bar

    private static volatile Set<String> hiddenSideBarTitles;

    /**
     * If a side bar row with this title is hidden. The rows are drawn one by one with their
     * localised titles, so the hidden string resources are resolved to titles once.
     */
    public static boolean hideDrawerItem(String title) {
        if (title == null) return false;

        Set<String> titles = hiddenSideBarTitles;
        if (titles == null) {
            titles = resolveTitles(sideBarHidden());
            hiddenSideBarTitles = titles;
        }
        return titles.contains(title);
    }

    private static Set<String> resolveTitles(String resourceNames) {
        Set<String> titles = new HashSet<>();
        try {
            Context context = Utils.getContext();
            for (String name : keys(resourceNames)) {
                int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
                if (id != 0) titles.add(context.getString(id));
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not resolve the hidden side bar titles", ex);
        }
        return titles;
    }

    // endregion

    private static String group(Pattern pattern, Object item) {
        Matcher matcher = pattern.matcher(String.valueOf(item));
        return matcher.find() ? matcher.group(1) : null;
    }

    private static String normalise(String key) {
        return key == null ? "" : key.toLowerCase(Locale.ROOT).replace("_", "").replace("-", "");
    }

    private static Set<String> keys(String encoded) {
        if (encoded.isEmpty()) return Collections.emptySet();

        Set<String> keys = new HashSet<>();
        for (String key : encoded.split(",")) {
            if (!key.isEmpty()) keys.add(key);
        }
        return Collections.unmodifiableSet(keys);
    }
}
