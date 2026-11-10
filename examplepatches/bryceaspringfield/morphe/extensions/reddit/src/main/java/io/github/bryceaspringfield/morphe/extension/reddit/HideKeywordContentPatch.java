package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.*;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.text.InputType;
import android.util.Log;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * The injection points of the Hide keyword content patch, and its section of Morphe's Reddit settings screen.
 * This bundle uses no class of Morphe Patches or of Reddit at compile time, since it is selected beside
 * Morphe Patches; Reddit's classes are read by reflection and by their toString().
 */
@SuppressWarnings({"unused", "deprecation"})
public final class HideKeywordContentPatch {

    // region Feed hooks

    /**
     * The FeedType field of each feed data source class.
     */
    private static final Map<Class<?>, Field> FEED_TYPE_FIELDS = new ConcurrentHashMap<>();

    private static String feedType(Object source) {
        if (source == null) return null;
        Class<?> type = source.getClass();
        Field field = FEED_TYPE_FIELDS.get(type);
        if (field == null && !FEED_TYPE_FIELDS.containsKey(type)) {
            for (Class<?> current = type; current != null && field == null; current = current.getSuperclass()) {
                for (Field candidate : current.getDeclaredFields()) {
                    if (candidate.getType().isEnum() && candidate.getType().getSimpleName().equals("FeedType")) {
                        candidate.setAccessible(true);
                        field = candidate;
                        break;
                    }
                }
            }
            if (field != null) FEED_TYPE_FIELDS.put(type, field);
        }
        if (field == null) return null;
        try {
            Object value = field.get(source);
            return value == null ? null : ((Enum<?>) value).name();
        } catch (Exception ex) {
            return null;
        }
    }

    /**
     * The community a community feed's data source loads: the text field beside its community ID (t5_...).
     */
    private static String sourceCommunity(Object source) {
        if (source == null) return null;
        List<String> values = new ArrayList<>();
        boolean hasId = false;
        for (Class<?> type = source.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != String.class || java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(source);
                    if (value == null) continue;
                    if (((String) value).startsWith("t5_")) hasId = true;
                    else values.add((String) value);
                } catch (Exception ignored) {
                }
            }
        }
        if (!hasId) return null;
        for (String value : values) {
            if (value.matches("(?:r/)?[A-Za-z0-9_]{2,21}")) return value;
        }
        return null;
    }

    /**
     * The text fields of a feed's data source, for debug logging.
     */
    private static String describeSource(Object source) {
        if (source == null) return "null";
        StringBuilder text = new StringBuilder(source.getClass().getName());
        for (Class<?> type = source.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (field.getType() != String.class) continue;
                try {
                    field.setAccessible(true);
                    text.append(' ').append(type.getSimpleName()).append('.').append(field.getName()).append('=')
                            .append(field.get(source));
                } catch (Exception ignored) {
                }
            }
        }
        return text.toString();
    }

    /** The distinct class names of a feed's elements, as their toString() starts, for debug logging. */
    private static String elementNames(List<?> list) {
        Set<String> names = new java.util.LinkedHashSet<>();
        for (Object element : list) {
            String text = String.valueOf(element);
            int end = text.indexOf('(');
            names.add(end > 0 ? text.substring(0, end) : element == null ? "null" : element.getClass().getName());
        }
        return names.toString();
    }

    /**
     * Injection point. Filters each page of a feed (Home, Popular, News, a community, search, a profile).
     *
     * @param source The feed's data source, which names its feed type.
     */
    public static List<?> filterFeedElements(List<?> list, Object source) {
        try {
            if (list == null || list.isEmpty()) return list;
            Profiles.checkAccount();
            if (getBoolean(DEBUG)) Log.d(TAG, "feed " + feedType(source) + " elements " + elementNames(list));
            String type = feedType(source);
            String place = Filter.placeOf(type);
            if (PLACE_COMMUNITY.equals(place)) RecentCommunities.visited(sourceCommunity(source));
            if (!Filter.anyPostFilter()) return list;
            if (place == null) return list;

            boolean debug = getBoolean(DEBUG);
            if (debug) Log.d(TAG, "source " + type + " " + describeSource(source));
            String community = PLACE_COMMUNITY.equals(place) ? sourceCommunity(source) : null;
            List<Object> filtered = new ArrayList<>(list.size());
            for (Object element : list) {
                PostInfo post = PostInfo.fromElement(element);
                post.defaultCommunity(community);
                if (debug && !post.isPost) {
                    String text = String.valueOf(element);
                    Log.d(TAG, "not a post: " + text.substring(0, Math.min(600, text.length())));
                }
                String reason = Filter.hidePost(post, place);
                if (debug) Log.d(TAG, (reason == null ? "show " : "hide (" + reason + ") ") + type + " " + post);
                if (reason == null) {
                    filtered.add(element);
                    if (post.isPost && !post.id.isEmpty()) SHOWN_PLACES.put(post.id, new String[]{place, type, community});
                }
            }
            Log.i(TAG, "filterFeedElements " + type + ": hid " + (list.size() - filtered.size()) + " of " + list.size());
            return filtered.size() == list.size() ? list : filtered;
        } catch (Exception ex) {
            Log.e(TAG, "filterFeedElements failure", ex);
            return list;
        }
    }

    /**
     * The place, feed type, and community of each post a feed showed, by post ID, for filtering the feed again after
     * a translation rewrites its posts.
     */
    private static final Map<String, String[]> SHOWN_PLACES = Collections.synchronizedMap(
            new LinkedHashMap<String, String[]>(512, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String[]> eldest) {
                    return size() > 4000;
                }
            });

    /**
     * Injection point. Filters a feed again after a translation modification rewrote its posts (an automatic or
     * requested translation, or a repost's original), since the page filter saw only the original text.
     *
     * @param result       The modified feed, or another object while the modification is suspended.
     * @param modification The feed modification.
     * @return The result, or the posts to keep as the app's immutable list.
     */
    public static Object filterModifiedFeed(Object result, Object modification) {
        try {
            if (!(result instanceof List) || modification == null) return result;
            String kind = modification.getClass().getName();
            boolean debug = getBoolean(DEBUG);
            if (debug) Log.d(TAG, "feed modification " + kind);
            if (!kind.contains(".translation.") || !Filter.anyPostFilter()) return result;
            List<?> list = (List<?>) result;
            List<Object> kept = new ArrayList<>(list.size());
            for (Object element : list) {
                if (hideAfterTranslation(element, debug) == null) kept.add(element);
            }
            if (kept.size() == list.size()) return result;
            Log.i(TAG, "filterModifiedFeed: hid " + (list.size() - kept.size()) + " of " + list.size());
            return immutableList(kept);
        } catch (Exception ex) {
            Log.e(TAG, "filterModifiedFeed failure", ex);
            return result;
        }
    }

    /**
     * Why a post a feed showed is hidden now, after a translation rewrote it or the settings changed, or null if it
     * stays: the rules applied to the post at the place the feed showed it, else at the place of the pager being
     * filtered again.
     */
    private static String hideAfterTranslation(Object element, boolean debug) {
        PostInfo post = PostInfo.fromElement(element);
        String[] where = post.isPost ? SHOWN_PLACES.get(post.id) : null;
        String place = where != null ? where[0] : PAGER_PLACE.get();
        if (place == null) return null;
        if (where != null) post.defaultCommunity(where[2]);
        String reason = Filter.hidePost(post, place);
        if (debug && reason != null) Log.d(TAG, "hide on refilter (" + reason + ") " + place + " " + post);
        return reason;
    }

    /**
     * The place of the pager {@link #refilterPagerState(Object)} filters, for posts its feed loaded while no filter
     * was set (their place was not recorded).
     */
    private static final ThreadLocal<String> PAGER_PLACE = new ThreadLocal<>();

    /**
     * Every feed pager alive: Home's cached pager and the pager of each other feed (search, profiles, communities).
     */
    private static final List<WeakReference<Object>> PAGERS = new ArrayList<>();

    /**
     * Injection point, at the end of each feed pager's constructor.
     */
    public static void registerPager(Object pager) {
        if (pager == null) return;
        synchronized (PAGERS) {
            PAGERS.removeIf(ref -> ref.get() == null);
            PAGERS.add(new WeakReference<>(pager));
        }
    }

    private static final Runnable REFILTER_ALL = () -> {
        List<Object> pagers = new ArrayList<>();
        synchronized (PAGERS) {
            PAGERS.removeIf(ref -> ref.get() == null);
            for (WeakReference<Object> ref : PAGERS) {
                Object pager = ref.get();
                if (pager != null) pagers.add(pager);
            }
        }
        int changed = 0;
        for (Object pager : pagers) {
            try {
                if (refilterPagerState(pager)) changed++;
            } catch (Throwable ex) {
                Log.e(TAG, "refilterPagerState failure", ex);
            }
        }
        Log.i(TAG, "settings changed: filtered " + pagers.size() + " open feeds again, " + changed + " changed");
    };

    /**
     * Called after each settings write: filters every open feed again half a second after the last write, so a feed
     * loaded before the change loses the posts the new settings hide without a refresh.
     */
    static void settingsChanged() {
        MAIN.removeCallbacks(REFILTER_ALL);
        MAIN.postDelayed(REFILTER_ALL, 500);
    }

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /**
     * Injection point, at the start of a pager's update of one post (a requested translation, a vote, a read mark).
     * After a translation, filters the pager's posts again once the update is written, since a translation of one
     * post changes the post in place and runs no feed modification.
     *
     * @param pager  The feed's pager.
     * @param events The update's events.
     */
    public static void onElementEvents(Object pager, List<?> events) {
        try {
            if (pager == null || events == null || !Filter.anyPostFilter()) return;
            for (Object event : events) {
                if (event == null || !event.getClass().getName().endsWith(".OnTranslationSuccess")) continue;
                MAIN.post(() -> {
                    try {
                        boolean hid = refilterPagerState(pager);
                        if (getBoolean(DEBUG)) Log.d(TAG, "pager state after translation: " + (hid ? "posts hidden" : "unchanged"));
                    } catch (Throwable ex) {
                        Log.e(TAG, "refilterPagerState failure", ex);
                    }
                });
                return;
            }
        } catch (Exception ex) {
            Log.e(TAG, "onElementEvents failure", ex);
        }
    }

    /**
     * Called by {@link #refilterPagerState(Object)} with the pager state's posts and their parallel display models.
     *
     * @return The two lists without the posts the rules hide after translation, as the app's immutable lists, or
     * null if every post stays.
     */
    public static Object[] keptLists(List<?> elements, List<?> models) {
        try {
            if (elements == null || models == null || elements.size() != models.size()) return null;
            boolean debug = getBoolean(DEBUG);
            List<Object> keptElements = new ArrayList<>(elements.size());
            List<Object> keptModels = new ArrayList<>(models.size());
            for (int i = 0; i < elements.size(); i++) {
                if (hideAfterTranslation(elements.get(i), debug) != null) continue;
                keptElements.add(elements.get(i));
                keptModels.add(models.get(i));
            }
            if (keptElements.size() == elements.size()) return null;
            Log.i(TAG, "filterPagerState: hid " + (elements.size() - keptElements.size()) + " of " + elements.size());
            return new Object[]{immutableList(keptElements), immutableList(keptModels)};
        } catch (Exception ex) {
            Log.e(TAG, "keptLists failure", ex);
            return null;
        }
    }

    /**
     * Removes the posts {@link #keptLists(List, List)} drops from a pager's state.
     *
     * @return Whether posts were removed.
     */
    public static boolean refilterPagerState(Object pager) {
        if (pager == null || !Filter.anyPostFilter()) return false;
        String type = feedType(pager);
        PAGER_PLACE.set(type == null ? null : Filter.placeOf(type));
        try {
            return refilterFeedPager(pager) || refilterCachedPager(pager);
        } finally {
            PAGER_PLACE.remove();
        }
    }

    /**
     * Removes the posts {@link #keptLists(List, List)} drops from the state of a RedditFeedPager, with the app's own
     * state copy and compare-and-set; the patch replaces this method, which returns false for any other object.
     */
    public static boolean refilterFeedPager(Object pager) {
        return false;
    }

    /**
     * The same, for Home's RedditCachedFeedPager; the patch replaces this method.
     */
    public static boolean refilterCachedPager(Object pager) {
        return false;
    }

    /**
     * The app's immutable copy of a list; the patch writes this method's body.
     */
    public static Object immutableList(List<?> list) {
        return list;
    }

    /**
     * The data source of the page being filtered, set just before {@link #filterFeedElements(List)} on the same thread.
     */
    private static final ThreadLocal<Object> FEED_SOURCE = new ThreadLocal<>();

    /**
     * Injection point. Saves the data source of the page the next call filters.
     */
    public static void setFeedSource(Object source) {
        FEED_SOURCE.set(source);
    }

    /**
     * Injection point. Filters a feed page, of the data source saved by {@link #setFeedSource(Object)}.
     */
    public static List<?> filterFeedElements(List<?> list) {
        Object source = FEED_SOURCE.get();
        FEED_SOURCE.remove();
        return filterFeedElements(list, source);
    }

    /**
     * Injection point. Filters the older post listings, which hold com.reddit.domain.model.Link items.
     */
    public static List<?> filterLinks(List<?> list) {
        try {
            // A listing of one post is the post being opened (its page, its menu, or the full post Reddit fetches
            // for a feed card), never a page of results: emptied, it shows Reddit's error screen, so it stays.
            if (list == null || list.size() <= 1 || !Filter.anyPostFilter()) return list;
            boolean debug = getBoolean(DEBUG);
            List<Object> filtered = new ArrayList<>(list.size());
            for (Object item : list) {
                String reason = null;
                if (PostInfo.isLink(item)) {
                    PostInfo post = PostInfo.fromLink(item);
                    reason = Filter.hidePost(post, PLACE_OTHER);
                    if (debug) Log.d(TAG, (reason == null ? "show " : "hide (" + reason + ") ") + "listing " + post);
                }
                if (reason == null) filtered.add(item);
            }
            Log.i(TAG, "filterLinks: hid " + (list.size() - filtered.size()) + " of " + list.size());
            return filtered.size() == list.size() ? list : filtered;
        } catch (Exception ex) {
            Log.e(TAG, "filterLinks failure", ex);
            return list;
        }
    }

    /**
     * Injection point. Filters a post's comments; a hidden comment's replies follow it out.
     */
    public static List<?> filterComments(List<?> list) {
        try {
            if (list == null || list.isEmpty() || !Filter.anyCommentFilter()) return list;
            boolean debug = getBoolean(DEBUG);
            List<Object> filtered = new ArrayList<>(list.size());
            int hiddenDepth = -1;
            for (Object item : list) {
                int depth = Filter.depthOf(item);
                if (hiddenDepth >= 0) {
                    if (depth > hiddenDepth) continue;
                    hiddenDepth = -1;
                }
                if (Filter.isComment(item)) {
                    String reason = Filter.hideComment(item);
                    if (reason != null) {
                        if (debug) Log.d(TAG, "hide comment (" + reason + ")");
                        hiddenDepth = Math.max(depth, 0);
                        continue;
                    }
                }
                filtered.add(item);
            }
            Log.i(TAG, "filterComments: hid " + (list.size() - filtered.size()) + " of " + list.size());
            return filtered.size() == list.size() ? list : filtered;
        } catch (Exception ex) {
            Log.e(TAG, "filterComments failure", ex);
            return list;
        }
    }

    // endregion

    // region Navigation hooks

    /**
     * Injection point. Returns null for a bottom bar tab to hide, and the tab otherwise.
     */
    public static Enum<?> navigationTab(Enum<?> tab) {
        try {
            if (tab != null && getBoolean(HIDE_INBOX_TAB)) {
                String name = tab.name();
                if (name.equals("Inbox") || name.equals("UnifiedInbox")) return null;
            }
        } catch (Exception ex) {
            Log.e(TAG, "navigationTab failure", ex);
        }
        return tab;
    }

    /**
     * Injection point. Whether to hide the badge (orange dot) on the sidebar button.
     */
    /**
     * Injection point, at the start of each screen's handler of the bars' expanded fraction (0 hidden, 1 shown) as a
     * feed scrolls: 1 while the setting keeps the bars shown.
     */
    /** Whether the user turned captions on or off since the app started; the stored choice then holds. */
    private static volatile boolean captionsChosen;

    /**
     * Injection point, after each read of Reddit's stored captions switch: on while the setting turns captions on at
     * every start and the user has not changed them since.
     */
    public static boolean captionsEnabled(boolean stored) {
        try {
            boolean on = !captionsChosen && getBoolean(CAPTIONS_ON) || stored;
            if (getBoolean(DEBUG)) Log.d(TAG, "captions read: stored " + stored + ", shown " + on);
            return on;
        } catch (Exception ex) {
            return stored;
        }
    }

    /**
     * Injection point, at the start of the step opening a feed post's link: true when the link's media opened in the
     * player inside Reddit.
     */
    public static boolean onLinkClick(Object step) {
        return MediaLinks.onLinkClick(step);
    }

    /** Injection point, after each read of the blur-mature-media setting: whether 18+ media shows blurred. */
    public static boolean blurNsfw(boolean blur) {
        return blur && (noNsfw() || !getBoolean(NO_NSFW_BLUR));
    }

    /** Injection point, before Reddit stores the captions switch the user changed. */
    public static void captionsChanged() {
        captionsChosen = true;
    }

    public static float barsExpandedFraction(float fraction) {
        try {
            return getBoolean(KEEP_BARS) ? 1f : fraction;
        } catch (Exception ex) {
            return fraction;
        }
    }

    public static boolean hideMenuBadge() {
        try {
            return getBoolean(HIDE_MENU_BADGE);
        } catch (Exception ex) {
            return false;
        }
    }

    private static final Map<Class<?>, Field[]> ROW_FIELDS = new ConcurrentHashMap<>();

    private static Field[] rowFields(Class<?> type) {
        Field[] fields = ROW_FIELDS.get(type);
        if (fields != null) return fields;
        List<Field> found = new ArrayList<>();
        for (Field field : type.getDeclaredFields()) {
            if (field.getType() == int.class || field.getType().isEnum()) {
                field.setAccessible(true);
                found.add(field);
            }
        }
        fields = found.toArray(new Field[0]);
        ROW_FIELDS.put(type, fields);
        return fields;
    }

    /**
     * The sidebar section header an item opens (its HeaderItem enum's name), or null when the item is no header.
     */
    private static String headerOf(Object item) {
        for (Field field : rowFields(item.getClass())) {
            if (field.getType().isEnum() && field.getType().getSimpleName().equals("HeaderItem")) {
                try {
                    Object value = field.get(item);
                    return value == null ? "" : ((Enum<?>) value).name();
                } catch (Exception ex) {
                    return "";
                }
            }
        }
        return null;
    }

    /**
     * Injection point. Removes the sidebar rows the user hid; a hidden section loses its header and its rows.
     */
    public static List<?> filterSidebar(List<?> list) {
        try {
            if (list == null || list.isEmpty()) return list;
            Set<String> hidden = getSet(SIDEBAR_HIDDEN, Collections.emptySet());
            if (hidden.isEmpty()) return list;
            Context context = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            Set<Integer> titles = new HashSet<>();
            for (String name : hidden) {
                int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
                if (id != 0) titles.add(id);
            }

            List<Object> filtered = new ArrayList<>(list.size());
            boolean inHiddenSection = false;
            for (Object item : list) {
                if (item == null) {
                    filtered.add(null);
                    continue;
                }
                String header = headerOf(item);
                if (header != null) inHiddenSection = hidden.contains(header);
                if (inHiddenSection) continue;
                if (header == null && hasTitle(item, titles)) continue;
                filtered.add(item);
            }
            return filtered.size() == list.size() ? list : filtered;
        } catch (Exception ex) {
            Log.e(TAG, "filterSidebar failure", ex);
            return list;
        }
    }

    private static boolean hasTitle(Object item, Set<Integer> titles) {
        if (titles.isEmpty()) return false;
        for (Field field : rowFields(item.getClass())) {
            if (field.getType() != int.class) continue;
            try {
                if (titles.contains(field.getInt(item))) return true;
            } catch (Exception ignored) {
            }
        }
        return false;
    }

    // endregion

    // region Settings screen

    /**
     * The settings screen being built, saved when its initialize() starts.
     */
    private static WeakReference<Object> settingsFragment = new WeakReference<>(null);

    /**
     * Injection point. Saves Morphe Patches' Reddit settings screen when it starts building.
     */
    public static void setSettingsFragment(Object fragment) {
        settingsFragment = new WeakReference<>(fragment);
    }

    /**
     * Injection point. Returns Morphe's About dialog page with this bundle's section (author and source) at its end.
     */
    public static String aboutHtml(String html) {
        return SettingsUi.aboutHtml(html);
    }

    /**
     * Injection point. Adds this bundle's sections to the settings screen saved by
     * {@link #setSettingsFragment(Object)}, once the screen's own sections are built.
     */
    public static void addSettings() {
        try {
            Object fragment = settingsFragment.get();
            if (!(fragment instanceof PreferenceFragment)) {
                Log.e(TAG, "addSettings: no settings screen saved, found " + fragment);
                return;
            }
            SettingsUi.add((PreferenceFragment) fragment);
            Log.i(TAG, "addSettings: added the Keyword filter settings");
        } catch (Exception ex) {
            Log.e(TAG, "addSettings failure", ex);
        }
    }

    // endregion
}
