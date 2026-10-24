/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.facebook.download.PostDetails;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Takes the Meta AI shortcut, and any tile picked in Menu tiles to hide (#153), out of Facebook's Menu,
 * where they sit with Feeds, Marketplace, Reels and Groups above See more. A tile is matched by the
 * deep link it opens ({@link MenuTiles#keyOf}), or by what it bookmarks when it has no link and
 * its server sends the route, as 584's Finds does ({@link MenuTiles#appKey}), never by its label.
 *
 * <p>Those rows are a bookmarks folder section's list of bookmarks, the same list See more opens
 * in full. The patch hands that list to {@link #kept} the moment the section reads it, before it
 * splits off the rows shown above See more, so a bookmark taken out here leaves no gap: the next
 * one moves up. Each bookmark is a GraphQL model, its name read through the tree's kept
 * {@code getString} by the hash of {@code name}, as {@link MuseCard} reads the Muse card's.
 *
 * <p>Each list read also writes down its tiles' keys and names ({@link MenuTiles#remember}), so
 * Menu tiles to hide offers the tiles this Menu has, in its own words.
 *
 * <p>Every other bookmark stays, in Facebook's order. Off, paused, before the settings are ready,
 * for a list with nothing to take out, or when anything here fails, the list is Facebook's own.
 */
public final class MenuShortcuts {
    /** The bookmark's name. Meta AI is a product name, the same in every language. */
    static final String META_AI = "Meta AI";

    /** The bookmark's GraphQL name field, keyed the way the tree keys its fields. */
    static final int NAME = "name".hashCode();

    /** The Hook status name of the hook. */
    static final String HOOK = "Menu shortcut list";

    /** The counter route: every bookmark in a list asked about, and the ones taken out. */
    static final String ROUTE = "Menu shortcuts";

    /** What a hidden Meta AI shortcut is counted under. */
    static final String HIDDEN = "Meta AI shortcut";

    /** What a tile taken out by its deep link is counted under. */
    static final String TILE_HIDDEN = "Menu tile";

    private MenuShortcuts() {
    }

    /**
     * Injection point, in the Menu's bookmarks folder section right after it read its list of
     * bookmarks. Answers the same bookmarks in the same order without Meta AI's while the switch is
     * on, and [bookmarks] itself otherwise. The patch copies the answer back into an ImmutableList.
     * Never throws.
     */
    @Nullable
    public static List<?> kept(@Nullable List<?> bookmarks) {
        try {
            HookStatus.invoked(FamilyNames.MENU_PROMOTIONS);
            if (bookmarks == null || bookmarks.isEmpty()) return bookmarks;
            // Ready first: Settings loads every switch, and it can't before the context is set.
            if (!Utils.settingsReady()) return bookmarks;
            MenuTiles.remember(tiles(bookmarks));
            boolean metaAi = Settings.HIDE_MENU_META_AI.get();
            Set<String> tiles = MenuTiles.hiddenNow();
            if (!metaAi && tiles.isEmpty()) return bookmarks;
            HookStatus.bound(FamilyNames.MENU_PROMOTIONS, HOOK);
            FeedFilterCounters.sawList(ROUTE, bookmarks.size());
            List<Object> kept = null;
            int metaAiGone = 0;
            for (int index = 0; index < bookmarks.size(); index++) {
                Object bookmark = bookmarks.get(index);
                boolean isMetaAi = metaAi && isMetaAi(bookmark);
                if (isMetaAi || (!tiles.isEmpty() && isHiddenTile(bookmark, tiles))) {
                    if (isMetaAi) metaAiGone++;
                    if (kept == null) kept = new ArrayList<>(bookmarks.subList(0, index));
                } else if (kept != null) {
                    kept.add(bookmark);
                }
            }
            if (kept == null) return bookmarks;
            int gone = bookmarks.size() - kept.size();
            if (metaAiGone > 0) FeedFilterCounters.removed(ROUTE, metaAiGone, HIDDEN);
            if (gone > metaAiGone) FeedFilterCounters.removed(ROUTE, gone - metaAiGone, TILE_HIDDEN);
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MENU_PROMOTIONS, HOOK, failure);
            return bookmarks;
        }
    }

    /**
     * The tiles in [bookmarks], each live model's key with its name, in order, for Menu tiles to
     * hide's list. Meta AI has a switch of its own and isn't one of them.
     */
    private static Map<String, String> tiles(List<?> bookmarks) {
        Map<String, String> tiles = new LinkedHashMap<>();
        for (Object bookmark : bookmarks) {
            if (!PostDetails.isLiveTree(bookmark)) continue;
            String name = PostDetails.string(bookmark, NAME);
            String key = keyOf(bookmark);
            if (key != null && name != null && !isMetaAiName(name) && !tiles.containsKey(key)) tiles.put(key, name);
        }
        return tiles;
    }

    /** Whether [bookmark] is a live bookmark model that keys to one of [tiles]. */
    private static boolean isHiddenTile(@Nullable Object bookmark, Set<String> tiles) {
        if (!PostDetails.isLiveTree(bookmark)) return false;
        String key = keyOf(bookmark);
        return key != null && tiles.contains(key);
    }

    /**
     * The key of the live bookmark model [bookmark]: by the deep link it opens, or, for one with
     * no link that opens what it bookmarks by a route its server sends (584's Finds, #224), by
     * the id of that node. Null for a bookmark with neither, a folder for one.
     */
    @Nullable
    static String keyOf(Object bookmark) {
        String key = MenuTiles.keyOf(PostDetails.string(bookmark, MenuTiles.URL));
        if (key != null) return key;
        Object node = PostDetails.tree(bookmark, MenuTiles.BOOKMARKED_NODE);
        return node == null ? null : MenuTiles.appKey(PostDetails.string(node, MenuTiles.ID));
    }

    /** Whether [bookmark] is a live bookmark model named Meta AI. A released one is never read. */
    private static boolean isMetaAi(@Nullable Object bookmark) {
        return PostDetails.isLiveTree(bookmark) && isMetaAiName(PostDetails.string(bookmark, NAME));
    }

    /** Whether a bookmark named [name] is the Meta AI shortcut's. */
    static boolean isMetaAiName(@Nullable String name) {
        return name != null && META_AI.equalsIgnoreCase(name.trim());
    }
}
