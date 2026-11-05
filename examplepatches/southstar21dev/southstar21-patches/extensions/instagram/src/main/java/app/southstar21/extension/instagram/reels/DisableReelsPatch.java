package app.southstar21.extension.instagram.reels;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.southstar21.extension.instagram.InstagramHooks;
import app.southstar21.extension.instagram.settings.BooleanSetting;
import app.southstar21.extension.instagram.settings.Icons;
import app.southstar21.extension.instagram.settings.PatchSettings;
import app.southstar21.extension.instagram.settings.SettingsGroup;

/**
 * Disable Reels patch: entry points for every hook and their settings.
 * <ul>
 *   <li>Home feed: Instagram parses each feed item through one method, which returns null
 *       here for reels and reel units. Every caller skips null items.</li>
 *   <li>Explore: same for each section of the grid that holds a reel. Removing single tiles
 *       would break Instagram's fixed grid layouts, so whole sections go.</li>
 *   <li>Reels player: its vertical ViewPager2 is recognized by its view id.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class DisableReelsPatch {
    private static final String TAG = "DisableReels";

    static final BooleanSetting HIDE_IN_FEED = new BooleanSetting("reels_hide_in_feed",
            "Home feed", "Reel posts and suggested reels carousels.", true, false);
    static final BooleanSetting HIDE_IN_EXPLORE = new BooleanSetting("reels_hide_in_explore",
            "Explore", "Grid sections that contain a reel.", true, false);
    static final BooleanSetting NO_SCROLLING = new BooleanSetting("reels_no_scrolling",
            "Stop scrolling", "A reel opened from a message or profile plays alone, no swiping to the next one.",
            false, false);
    static final BooleanSetting BLOCK_PLAYER = new BooleanSetting("reels_block_player",
            "Block Reels player", "Reels don't open at all, including ones sent in messages.", false, false);

    public static final PatchSettings SETTINGS = new PatchSettings("reels",
            "Disable Reels",
            "Removes Reels from Instagram.",
            DisableReelsPatch::isIncluded,
            new SettingsGroup("Remove Reels from",
                    "Changes apply to newly loaded posts. The Reels tab is in Navigation buttons.",
                    HIDE_IN_FEED, HIDE_IN_EXPLORE),
            new SettingsGroup("Player", NO_SCROLLING, BLOCK_PLAYER))
            .icon(Icons.Glyph.NO_REELS, 0xFFFF2D55);

    /** The patch makes this return true, so the menu only shows patches that were applied. */
    public static boolean isIncluded() {
        return false;
    }

    // The three methods below are overwritten by the patch to call Instagram's obfuscated
    // getters.

    /** FeedItem's type, an enum such as MEDIA, AD or CLIPS_NETEGO. */
    public static Object feedItemType(Object feedItem) {
        return null;
    }

    /** FeedItem's media, or null if it isn't a post. */
    public static Object feedItemMedia(Object feedItem) {
        return null;
    }

    /** Media's ProductType enum, CLIPS for reels. */
    public static Object productType(Object media) {
        return null;
    }

    // region Home feed

    /** Feed units that are all about reels, whatever media they hold. */
    private static final String[] REEL_FEED_ITEM_TYPES = {
            "CLIPS_NETEGO",                 // "Suggested reels" carousel
            "IMMERSIVE_SEGUE_ITEM",         // "Keep watching" entry into the reels viewer
            "HATCH_IMMERSIVE_IN_FEED_UNIT", // Full screen reels unit inside the feed
            "VIBES_IN_FEED_UNIT",           // AI video reels unit
    };

    /** Called with each feed item Instagram parses. Returning null drops it. */
    public static Object filterFeedItem(Object item) {
        if (item == null) return null;
        try {
            if (SETTINGS.isActive() && HIDE_IN_FEED.get() && isReelFeedItem(item)) return null;
        } catch (Throwable t) {
            Log.e(TAG, "Failed to filter feed item", t);
        }
        return item;
    }

    private static boolean isReelFeedItem(Object item) {
        Object type = null;
        try {
            type = feedItemType(item);
        } catch (Throwable ignored) {
            // Instagram's getter throws if the item has no type yet.
        }
        if (type instanceof Enum) {
            String name = ((Enum<?>) type).name();
            for (String reelType : REEL_FEED_ITEM_TYPES) {
                if (reelType.equals(name)) return true;
            }
        }
        return isReel(feedItemMedia(item));
    }

    // endregion

    // region Explore

    private static final int MAX_DEPTH = 6;
    private static final int MAX_VISITED = 400;
    private static final String MEDIA_CLASS = "com.instagram.feed.media.Media";
    private static final Map<Class<?>, Field[]> fieldCache = new HashMap<>();

    /** Called with each Explore grid section Instagram parses. Returning null drops it. */
    public static Object filterExploreSection(Object section) {
        if (section == null) return null;
        try {
            if (SETTINGS.isActive() && HIDE_IN_EXPLORE.get()
                    && containsReel(section, 0, new IdentityHashMap<>())) {
                return null;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to filter explore section", t);
        }
        return section;
    }

    /**
     * Sections are obfuscated models (package X) nesting layout items, lists and Media, so
     * this walks their fields by type rather than by name.
     */
    private static boolean containsReel(Object value, int depth, IdentityHashMap<Object, Boolean> visited)
            throws IllegalAccessException {
        if (value == null || depth > MAX_DEPTH || visited.size() > MAX_VISITED) return false;
        if (visited.put(value, Boolean.TRUE) != null) return false;

        Class<?> type = value.getClass();
        if (MEDIA_CLASS.equals(type.getName())) return isReel(value);
        if (value instanceof Collection) {
            for (Object element : (Collection<?>) value) {
                if (containsReel(element, depth + 1, visited)) return true;
            }
            return false;
        }
        if (!type.getName().startsWith("X.")) return false;

        for (Field field : fieldsOf(type)) {
            if (containsReel(field.get(value), depth + 1, visited)) return true;
        }
        return false;
    }

    /** Instance fields that can hold a model, a list or Media. */
    private static Field[] fieldsOf(Class<?> type) {
        synchronized (fieldCache) {
            Field[] fields = fieldCache.get(type);
            if (fields != null) return fields;
            List<Field> list = new ArrayList<>();
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                Class<?> fieldType = field.getType();
                if (fieldType.isPrimitive() || fieldType == String.class) continue;
                field.setAccessible(true);
                list.add(field);
            }
            fields = list.toArray(new Field[0]);
            fieldCache.put(type, fields);
            return fields;
        }
    }

    // endregion

    private static boolean isReel(Object media) {
        if (media == null) return false;
        Object type = productType(media);
        return type instanceof Enum && "CLIPS".equals(((Enum<?>) type).name());
    }

    // region Player

    private static int reelsPagerId = -1;
    private static final WeakHashMap<View, Boolean> blockedViewers = new WeakHashMap<>();

    private static boolean isReelsPager(View pager) {
        if (reelsPagerId == -1) {
            reelsPagerId = pager.getResources().getIdentifier(
                    "clips_viewer_view_pager", "id", "com.instagram.android");
        }
        return reelsPagerId != 0 && pager.getId() == reelsPagerId;
    }

    private static boolean stopsScrolling() {
        return SETTINGS.isActive() && NO_SCROLLING.get();
    }

    /** Called when any ViewPager2 gets an adapter. Locks the Reels player's pager. */
    public static void onPagerAdapterSet(View pager) {
        try {
            if (stopsScrolling() && isReelsPager(pager)) {
                pager.getClass().getMethod("setUserInputEnabled", boolean.class).invoke(pager, false);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to lock reels pager", t);
        }
    }

    /** Called from ViewPager2.setUserInputEnabled. Keeps the Reels player's pager locked. */
    public static boolean pagerUserInputEnabled(View pager, boolean enabled) {
        try {
            if (enabled && stopsScrolling() && isReelsPager(pager)) return false;
        } catch (Throwable t) {
            Log.e(TAG, "Failed to check reels pager", t);
        }
        return enabled;
    }

    /** Called when the Reels player's view is created. Closes it again if it's blocked. */
    public static void onReelsViewerCreated(View view) {
        try {
            if (view == null || !SETTINGS.isActive() || !BLOCK_PLAYER.get()) return;
            if (blockedViewers.containsKey(view)) return;
            blockedViewers.put(view, Boolean.TRUE);
            Activity activity = activityOf(view.getContext());
            if (activity == null) return;
            Toast.makeText(activity, "Reels are disabled", Toast.LENGTH_SHORT).show();
            view.setVisibility(View.INVISIBLE);
            view.post(() -> {
                if (!activity.isFinishing()) activity.onBackPressed();
            });
        } catch (Throwable t) {
            Log.e(TAG, "Failed to block reels player", t);
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    // endregion
}
