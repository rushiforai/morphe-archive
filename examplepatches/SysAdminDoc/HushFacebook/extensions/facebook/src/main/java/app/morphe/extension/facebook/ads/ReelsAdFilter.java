/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/extensions/extension/src/main/java/app/andrewliang/extension/ReelsAdFilter.java
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.extension.facebook.ads;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.facebook.reels.ReelSections;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "[Reels] Hide sponsored reels" patch.
 *
 * <p>Facebook does not splice ads into Reels on the device. A logging build showed items reaching the
 * Reels collection only as whole fetched pages, never one at a time, with the ad already sitting in
 * the page beside the organic reels. Every client-side insertion path the patch blocks is therefore
 * beside the point: the server inlines the ad, so the only place left to stop it is where the page
 * enters the collection.
 *
 * <p>A page enters at two levels, and the patch filters both. A device round on 2026-09-19 caught
 * an ad in a page and logged {@code dropped 1 of 2} from {@link #withoutAds}. The app then showed
 * that ad as the third reel. The controller adds a section wrapper, and the wrapper holds its own
 * list of items. The screen reads that list, so a new flat collection one step later changes
 * nothing. {@link #withoutAdSections} filters the list inside each section, through the walk every
 * page filter shares ({@link ReelSections}). That list is the copy that the screen reads.
 *
 * <p>Ad items all extend one base class. Its name is a Redex name that changes on every Facebook
 * release, so the patch resolves it while patching and passes it in rather than this file naming it.
 *
 * <p>Not every ad arrives as one. Facebook builds the ad item only when the unit says it's an ad and
 * the unit's ad details pass a further check; a unit marked as an ad that fails it can be built as
 * an ordinary reel around the same story (580's builder, {@code LX/4Wb;->A0H}). Two reports on v0.5.0
 * saw sponsored reels again (issues #47 and #35). So an item that isn't an ad item is asked for its
 * story, and a story that carries {@code sponsored_data}, which a story only has when it's delivered
 * as an ad, goes too. That's the test Facebook's own Reels code makes before it shows a promotion
 * over a reel. The item's story getter and the story's accessor are Redex names, so the patch fills
 * in {@link #isReelItem}, {@link #itemStory} and {@link #sponsoredData}.
 *
 * <p>The ads that reach a page come out of Facebook's Reels and Watch ad pool (VideoHomeSponsoredPool),
 * which the Reels tab's story loader asks for an ad whenever a slot comes up. A report from a 581
 * phone still seeing reel ads on 0.7.1 (#47) logged that loader's page with one ad item, dropped
 * here, so by then the pool had already marked the ad as used and logged its position.
 * {@link #holdPoolAd} answers before the pool hands anything out, the same no-ad answer the pool gives
 * itself when no slot is free.
 *
 * <p>That report's drop came too late, though. The pool was never asked, and the same phone showed a
 * reel ad 8 seconds after logging it. 581's client-side loader (VideoFeedUnitFeedCSRDataLoaderAdapter)
 * puts reels into the collection's backing list one at a time, or appends a page through a static
 * helper, and only then walks the page to tell the collection's listeners. The filter sat on that walk,
 * so it took the ad out of the announcement while the ad stayed in the list the viewer reads. The patch
 * now drops an ad item at the one-item insert itself and filters the append as it filters the positioned
 * insert. The walk keeps its filter, counted apart ({@link #ANNOUNCED_ROUTE}), because it is always handed
 * the page as Facebook passed it in: a removal there matches one the insert already made, and a report
 * that counts more removed on the walk than on the pages has an ad that came in some other way.
 */
public final class ReelsAdFilter {

    private ReelsAdFilter() {}

    /** The source every event of this filter carries in the diagnostic report. */
    private static final String SOURCE = "ReelsAdFilter";

    /** The diagnostic counter routes, one per level the patch filters. */
    static final String SECTIONS_ROUTE = "Reels sections";
    static final String PAGES_ROUTE = "Reels pages";
    /** The listener walk after each insert, which sees the page before the insert's own filter. */
    static final String ANNOUNCED_ROUTE = "Reels announcements";

    /** What the diagnostic report counts each time the ad pool is held to no ad. */
    static final String POOL_HELD = "Reels ad pool held to no ad";

    /** What the diagnostic report counts each time a profile's Reels tab is kept from fetching its ads. */
    static final String PROFILE_ADS_HELD = "Profile Reels ad query held";

    /** What the diagnostic report counts each time an ad-break fetch is answered with a failure. */
    static final String AD_BREAK_FETCH_HELD = "Ad-break fetch held";

    /**
     * What the diagnostic report counts each time the comment pill asks about an ad's button and
     * hears no. The pill asks about every plugin it has on each draw, before Facebook's own check of
     * whether the ad has a button, so this counts the answers, not buttons that would have shown.
     */
    static final String AD_PILL_HELD = "Ad button checks answered no";

    /**
     * The comment sheet's floating buttons for a reel, Watch or in-stream ad, by the class name of
     * the pill plugin that draws each. The pill's other plugins stay: a message button, affiliate
     * links and visual search aren't ads, and the Permalink and Flyout ad buttons belong to feed ads.
     */
    static final Set<String> AD_PILLS = new HashSet<>(Arrays.asList(
            "com.facebook.feedback.comments.plugins.indicatorpill.reelsadsfloatingcta.ReelsAdsFloatingCtaPlugin",
            "com.facebook.feedback.comments.plugins.indicatorpill.watchadsfloatingcta.WatchAdsFloatingCtaPlugin",
            "com.facebook.feedback.comments.plugins.indicatorpill.instreamadsfloatingcta.InstreamAdsFloatingCtaPlugin"));

    /** Whether the first hold of this process has been logged. */
    private static volatile boolean poolHoldLogged;

    /**
     * What an item counts as. The first two come off the page: an item of the ad class, and an item
     * whose story carries sponsored data. A section also holds lists that aren't items.
     */
    static final String AD_ITEM = "ad item";
    static final String SPONSORED_STORY = "sponsored story";
    static final String STORY = "story";
    static final String NO_STORY = "no story";
    static final String NOT_AN_ITEM = "not a reel item";
    static final String NOT_PATCHED = "reader not patched";
    static final String READ_FAILED = "read failed";

    /** The field that marks a story an ad. */
    static final String SPONSORED_DATA = "sponsored_data";

    /** What {@link #itemStory} and {@link #sponsoredData} answer until the patch fills them in. */
    static final Object UNPATCHED = new Object();

    /** An item's story and its sponsored data, read through the stubs the patch filled in or a test's stand-in. */
    interface Items {
        boolean isItem(Object item);

        /** The item's story, a GraphQLStory or null, or {@link #UNPATCHED}. */
        @Nullable
        Object story(Object item);

        /** The story's sponsored data model, or null when it has none, or {@link #UNPATCHED}. */
        @Nullable
        Object sponsoredData(Object story);
    }

    static final Items PATCHED = new Items() {
        @Override
        public boolean isItem(Object item) {
            return isReelItem(item);
        }

        @Nullable
        @Override
        public Object story(Object item) {
            return itemStory(item);
        }

        @Nullable
        @Override
        public Object sponsoredData(Object story) {
            return ReelsAdFilter.sponsoredData(story);
        }
    };

    /**
     * The same page with no ad left inside any of its sections.
     *
     * <p>The ads come out of each section's item list in place when the list permits it, so every
     * other holder of that list agrees with the screen, and a list that refuses is replaced through
     * its field ({@link ReelSections}).
     *
     * @param page        the sections about to be added to the Reels list.
     * @param adClassName binary name of the ad item base class, for example {@code X.B89}.
     */
    public static List<?> withoutAdSections(List<?> page, String adClassName) {
        return withoutAdSections(page, adClassName, PATCHED);
    }

    /** {@link #withoutAdSections(List, String)} with the item reads passed in, so a test can stand in for the stubs. */
    static List<?> withoutAdSections(List<?> page, String adClassName, Items access) {
        HookStatus.invoked(FamilyNames.SPONSORED_REELS);
        FeedFilterCounters.sawList(SECTIONS_ROUTE, page == null ? 0 : page.size());
        if (page == null || page.isEmpty() || !switchedOn()) return page;

        try {
            Map<String, Integer> dropping = new LinkedHashMap<>();
            ReelSections.Result result = ReelSections.strip(page, item -> {
                String kind = kindOf(item, adClassName, access);
                FeedFilterCounters.sawKind(SECTIONS_ROUTE, kind);
                if (!isAd(kind)) return false;
                dropping.merge(kind, 1, Integer::sum);
                return true;
            }, FamilyNames.SPONSORED_REELS, SOURCE);
            if (result.dropped == 0) return page;

            for (Map.Entry<String, Integer> kind : dropping.entrySet()) {
                FeedFilterCounters.removed(SECTIONS_ROUTE, kind.getValue(), kind.getKey() + " in a section");
            }
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "section filter dropped " + result.dropped + " item(s) from " + page.size() + " section(s)"
                            + kinds(dropping));

            return result.page;
        } catch (Throwable failure) {
            // Anything thrown here would go on into Facebook's Reels page insert. The page goes
            // through as Facebook sent it, like the section filter's own failures.
            HookStatus.threw(FamilyNames.SPONSORED_REELS, "section page", failure);
            Logger.diagnosticError(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "could not filter a page of sections", failure);
            return page;
        }
    }

    /**
     * The same items without the ads, or the very same collection when it holds none.
     *
     * <p>Returning the original untouched matters: the caller's collection may be immutable, and
     * most pages contain no ad at all, so the common case allocates nothing and changes no type.
     *
     * <p>The patch also hands it a one-item list from the collection's one-item insert, and skips the
     * insert when the answer comes back empty.
     *
     * @param items       the page about to be added to the Reels collection.
     * @param adClassName binary name of the ad item base class, for example {@code X.B89}.
     */
    public static Collection<?> withoutAds(Collection<?> items, String adClassName) {
        return withoutAds(items, adClassName, PATCHED, PAGES_ROUTE);
    }

    /**
     * {@link #withoutAds(Collection, String)} for the collection's listener walk after an insert, counted
     * on {@link #ANNOUNCED_ROUTE} so the pages route counts each page once.
     */
    public static Collection<?> withoutAnnouncedAds(Collection<?> items, String adClassName) {
        return withoutAds(items, adClassName, PATCHED, ANNOUNCED_ROUTE);
    }

    /** {@link #withoutAds(Collection, String)} with the item reads passed in, so a test can stand in for the stubs. */
    static Collection<?> withoutAds(Collection<?> items, String adClassName, Items access) {
        return withoutAds(items, adClassName, access, PAGES_ROUTE);
    }

    static Collection<?> withoutAds(Collection<?> items, String adClassName, Items access, String route) {
        HookStatus.invoked(FamilyNames.SPONSORED_REELS);
        FeedFilterCounters.sawList(route, items == null ? 0 : items.size());
        if (items == null || items.isEmpty() || !switchedOn()) return items;

        try {
            return filtered(items, adClassName, access, route);
        } catch (Throwable failure) {
            // Anything thrown here would go on into Facebook's Reels page insert.
            HookStatus.threw(FamilyNames.SPONSORED_REELS, "page filter", failure);
            Logger.diagnosticError(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "could not filter a page", failure);
            return items;
        }
    }

    private static Collection<?> filtered(Collection<?> items, String adClassName, Items access, String route) {
        // Each item is read once: the kinds are kept in the page's order for the second pass.
        List<String> kinds = new ArrayList<>(items.size());
        boolean found = false;
        for (Object item : items) {
            String kind = kindOf(item, adClassName, access);
            FeedFilterCounters.sawKind(route, kind);
            kinds.add(kind);
            if (isAd(kind)) found = true;
        }
        if (!found) return items;

        ArrayList<Object> kept = new ArrayList<>(items.size());
        Map<String, Integer> dropped = new LinkedHashMap<>();
        int index = 0;
        for (Object item : items) {
            String kind = kinds.get(index++);
            if (isAd(kind)) {
                dropped.merge(kind, 1, Integer::sum);
            } else {
                kept.add(item);
            }
        }

        // Only when something was actually dropped, so this stays silent on an ordinary page while
        // still confirming on a device that the filter is reached and doing its job.
        for (Map.Entry<String, Integer> kind : dropped.entrySet()) {
            FeedFilterCounters.removed(route, kind.getValue(), kind.getKey());
        }
        String where = ANNOUNCED_ROUTE.equals(route) ? "announcement dropped " : "dropped ";
        Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                () -> where + (items.size() - kept.size()) + " of " + items.size() + kinds(dropped));

        return kept;
    }

    /** " (ad item 1, sponsored story 2)", naming what was dropped. */
    private static String kinds(Map<String, Integer> dropped) {
        StringBuilder line = new StringBuilder(" (");
        for (Map.Entry<String, Integer> kind : dropped.entrySet()) {
            if (line.length() > 2) line.append(", ");
            line.append(kind.getKey()).append(' ').append(kind.getValue());
        }
        return line.append(')').toString();
    }

    /**
     * Injection point, asked first thing in each vend of Facebook's Reels and Watch ad pool: true makes
     * the vend answer null, as it does when no slot is free, so the loader takes the next organic reel
     * and the ad stays in the pool unused. Off, or asked before the settings are ready, the pool works
     * as Facebook wrote it. Never throws.
     */
    public static boolean holdPoolAd() {
        HookStatus.invoked(FamilyNames.SPONSORED_REELS);
        if (!switchedOn()) return false;

        HookStatus.counted(FamilyNames.SPONSORED_REELS, POOL_HELD);
        if (!poolHoldLogged) {
            poolHoldLogged = true;
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "the Reels ad pool was asked for an ad and held to none");
        }
        return true;
    }

    /**
     * Injection point, asked first thing in the method that sends a profile's or Page's Reels tab
     * query for its ads (ProfileReelsAsyncAdsQuery): true makes it return before the query goes
     * out, as it does when the ads it holds already fill the tab, so the tab shows that profile's
     * own reels. Off, or asked before the settings are ready, Facebook fetches them. Never throws.
     */
    public static boolean holdProfileReelAds() {
        HookStatus.invoked(FamilyNames.SPONSORED_REELS);
        if (!switchedOn()) return false;

        HookStatus.counted(FamilyNames.SPONSORED_REELS, PROFILE_ADS_HELD);
        return true;
    }

    /**
     * Injection point, run by each ad-break fetch the patch answers with a failed future: a banner
     * over a reel, a video's ad break, the Reels idle query or an extended break. Those stay held
     * while Hushfacebook is paused, so this only counts them for the diagnostic report.
     */
    public static void heldAdBreakFetch() {
        HookStatus.invoked(FamilyNames.SPONSORED_REELS);
        HookStatus.counted(FamilyNames.SPONSORED_REELS, AD_BREAK_FETCH_HELD);
    }

    /**
     * Injection point, first in the comment pill's check of whether a plugin's button shows, with
     * that plugin's class name: true answers no. An ad that still reaches a reel or a video then
     * opens its comments without the floating button. Any other plugin, off, or asked before the
     * settings are ready, and Facebook decides. Never throws.
     */
    public static boolean holdsAdPill(String plugin) {
        HookStatus.invoked(FamilyNames.SPONSORED_REELS);
        if (!AD_PILLS.contains(plugin) || !switchedOn()) return false;

        HookStatus.counted(FamilyNames.SPONSORED_REELS, AD_PILL_HELD);
        return true;
    }

    /**
     * The Hushfacebook switch. Off, unreadable, or asked before the settings are ready, the page
     * passes as Facebook sent it.
     */
    private static boolean switchedOn() {
        try {
            return Utils.settingsReady() && Settings.HIDE_SPONSORED_REELS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SPONSORED_REELS, "switch read", t);
            Logger.diagnosticError(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "could not read the sponsored reels switch", t);
            return false;
        }
    }

    /** Whether an item of this kind comes off the page. */
    static boolean isAd(String kind) {
        return AD_ITEM.equals(kind) || SPONSORED_STORY.equals(kind);
    }

    /**
     * What [item] counts as: an item of the ad class, an item whose story carries sponsored data, an
     * item with an ordinary story or none, or something that isn't an item. Never throws.
     */
    static String kindOf(@Nullable Object item, String adClassName, Items access) {
        if (item == null) return NOT_AN_ITEM;
        if (extendsAdBase(item, adClassName)) return AD_ITEM;
        try {
            if (!access.isItem(item)) return NOT_AN_ITEM;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPONSORED_REELS, "item check", failure);
            return READ_FAILED;
        }

        Object story;
        try {
            story = access.story(item);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPONSORED_REELS, "item story", failure);
            return READ_FAILED;
        }
        if (story == UNPATCHED) {
            HookStatus.missingMember(FamilyNames.SPONSORED_REELS, "method", "reel item", "story");
            return NOT_PATCHED;
        }
        if (!ProfileAdFilter.isStory(story)) return NO_STORY;

        Object data;
        try {
            data = access.sponsoredData(story);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPONSORED_REELS, "sponsored data accessor", failure);
            return READ_FAILED;
        }
        if (data == UNPATCHED) {
            HookStatus.missingMember(FamilyNames.SPONSORED_REELS, "method", "GraphQLStory", SPONSORED_DATA);
            return NOT_PATCHED;
        }
        HookStatus.bound(FamilyNames.SPONSORED_REELS, "reel item story#" + SPONSORED_DATA);
        return data == null ? STORY : SPONSORED_STORY;
    }

    /** Whether [item] is the ad base class or anything extending it. */
    private static boolean extendsAdBase(Object item, String adClassName) {
        if (adClassName == null) return false;

        for (Class<?> type = item.getClass(); type != null; type = type.getSuperclass()) {
            if (adClassName.equals(type.getName())) return true;
        }

        return false;
    }

    /**
     * Injection point, filled in by the patch: whether an object is a Reels or Watch item. The patch
     * replaces this body with an instance-of the item interface the ad base answers its story
     * through, whose name changes every build.
     */
    public static boolean isReelItem(Object item) {
        return false;
    }

    /**
     * Injection point, filled in by the patch: the item's story, a GraphQLStory or null. The patch
     * replaces this body with a call of the item interface's story getter. Only an object
     * {@link #isReelItem} took may be passed.
     */
    public static Object itemStory(Object item) {
        return UNPATCHED;
    }

    /**
     * Injection point, filled in by the patch: the story's {@code sponsored_data} model, or null when
     * it has none. The patch replaces this body with a call of the story's accessor. Only a
     * GraphQLStory may be passed.
     */
    public static Object sponsoredData(Object story) {
        return UNPATCHED;
    }
}
