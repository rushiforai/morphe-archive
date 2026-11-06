/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0). The hook's place, the feed cache's merge, is the one
 * zeldrisho/morphe-patches found: https://github.com/zeldrisho/morphe-patches
 * The feed unit types read as ads are the ones MrxSiN/ThreadsHideAds named (2.0.0, GPL-3.0):
 * https://github.com/MrxSiN/ThreadsHideAds
 */
package app.morphe.extension.hushthreads.ads;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.hushthreads.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Applies selected local rules to each feed page before the feed cache merges it.
 *
 * <p>The pages Threads fetches for the feed, For You and Following alike, go through one merge
 * method of {@code BarcelonaFeedCache} before anything is cached or drawn. The patch hands that
 * method's page of items to {@link #filter} first and merges what comes back. Only selected,
 * enabled rules remove items, so unrelated feed items keep their original order.
 *
 * <p>When two of Threads' flags are on, For You is kept in its spool cache instead, whose own merge
 * puts each page into the spool's model pool without passing the one above. The patch hands that
 * page to {@link #spoolPage}, which applies the same rules and also counts the page as the spool's,
 * so an export shows which cache a phone's For You runs on.
 *
 * <p>For You's data source also writes feed items into either cache four more ways that pass
 * neither merge: the refresh's write, the paging flow's, an append to the page it holds, and a page
 * it rebuilds. Each handler's write hands its items to {@link #forYouWrite} or {@link #spoolWrite}
 * first, which apply the same rules and count the writes apart from the pages. Its writes of one
 * item (one it adds, puts after a post or swaps in) ask {@link #forYouItem} or {@link #spoolItem}
 * the same way, and an item the rules take out isn't written.
 *
 * <p>An item is an ad when the post it carries is one: Threads' own check reads the post's
 * "injected" data, the block the server attaches to a sponsored post, and this asks that same check.
 * A thread unit counts by its first post, which is the one the feed shows, the same post Threads'
 * own item reads for its media. An item also counts as an ad by its unit type: every feed item
 * carries an enum saying what kind of unit it is, Threads keeps that enum's constant names, and the
 * ad kinds in {@link #AD_UNIT_TYPES} come out whatever they carry. Suggestion units (the NETEGO and
 * SUGGESTED kinds) and ordinary posts aren't ad kinds.
 *
 * <p>An opened post fetches its own ads to show among its replies, apart from the feed. Those come
 * through {@link #permalinkAds}, where every item is an ad.
 *
 * <p>Threads can also insert one item into a For You page a cache already holds, which is how it
 * places an ad it got on its own, and that passes neither merge. Each insert asks
 * {@link #insertedAd} first.
 *
 * <p>The typed methods at the bottom have no body of their own here. Their answers are Threads'
 * obfuscated names, which change with every build, so the patch finds them by what they do and
 * writes the calls in when you patch. Unpatched they answer nothing and every item stays.
 */
public final class FeedAds {
    private FeedAds() {}

    private enum Rule {
        ADS(FamilyNames.HIDE_ADS, "ad posts taken out") {
            @Override boolean selected() { return SettingsStatus.hideAds(); }
            @Override boolean enabled() { return Settings.HIDE_ADS.get(); }
            @Override boolean matches(Object item) { return isAdItem(item); }
        },
        SUGGESTED_USERS(FamilyNames.HIDE_SUGGESTED_USERS, "suggestion cards taken out") {
            @Override boolean selected() { return SettingsStatus.hideSuggestedUsers(); }
            @Override boolean enabled() { return Settings.HIDE_SUGGESTED_USERS.get(); }
            @Override boolean matches(Object item) { return isSuggestedUserItem(item); }
        };

        final String family;
        final String outcome;

        Rule(String family, String outcome) {
            this.family = family;
            this.outcome = outcome;
        }

        abstract boolean selected();
        abstract boolean enabled();
        abstract boolean matches(Object item);
    }

    /**
     * Injected at the start of the feed cache's merge, with the page it was given. Answers the page
     * after its selected rules, or the same list when no rule removes an item, all switches are off,
     * HushThreads is paused or anything goes wrong. Never throws.
     */
    public static List<?> filter(List<?> items) {
        return filter(items, PAGES, null, "feed page");
    }

    /**
     * Injected at the start of the spool cache's merge, with For You's page it was given. The same
     * as {@link #filter}, and each completed check also counts a spool page. Never throws.
     */
    public static List<?> spoolPage(List<?> items) {
        return filter(items, PAGES, SPOOL_PAGES, "spool feed page");
    }

    /**
     * Injected at the start of For You's other writes into the feed cache, with the items each was
     * given. The same as {@link #filter}, counted as a For You cache write instead of a page. A
     * resumed write passes no list. Never throws.
     */
    public static List<?> forYouWrite(List<?> items) {
        return filter(items, FOR_YOU_WRITES, null, "For You cache write");
    }

    /** The same as {@link #forYouWrite} for the spool cache's writes, each also counted as the spool's. Never throws. */
    public static List<?> spoolWrite(List<?> items) {
        return filter(items, FOR_YOU_WRITES, SPOOL_WRITES, "spool cache write");
    }

    /**
     * Injected at the start of For You's writes of one feed item into the feed cache: an item it
     * adds, puts after a post or swaps in for one it holds. Answers true when a selected rule takes
     * the item out, and the patch then answers the write's own "done" without writing it. False
     * when every rule keeps it, all switches are off, HushThreads is paused or anything goes wrong.
     * A resumed write passes no item, and that isn't a check. Never throws.
     */
    public static boolean forYouItem(Object item) {
        return dropped(item, FOR_YOU_ITEMS, null, "For You item write");
    }

    /** The same as {@link #forYouItem} for the spool cache's writes, each also counted as the spool's. Never throws. */
    public static boolean spoolItem(Object item) {
        return dropped(item, FOR_YOU_ITEMS, SPOOL_ITEMS, "spool item write");
    }

    private static final String PAGES = "feed pages checked";
    private static final String SPOOL_PAGES = "spool feed pages checked";
    private static final String FOR_YOU_WRITES = "For You cache writes checked";
    private static final String SPOOL_WRITES = "spool cache writes checked";
    private static final String FOR_YOU_ITEMS = "For You item writes checked";
    private static final String SPOOL_ITEMS = "spool item writes checked";

    /** One item through the page rules: whether they took it out. Kept on every failure, as a page is. */
    private static boolean dropped(Object item, String checked, String spool, String hook) {
        List<?> kept = filter(item == null ? null : Collections.singletonList(item), checked, spool, hook);
        return kept != null && kept.isEmpty();
    }

    /**
     * Counts each completed check as {@code checked}, and also as {@code spool} when that isn't
     * null. A failure is reported against {@code hook}, so the report names the write that threw.
     */
    private static List<?> filter(List<?> items, String checked, String spool, String hook) {
        // The rule being asked when something throws. Null while walking the page itself, where a
        // failure belongs to every rule that was going to read it.
        Rule checking = null;
        List<Rule> active = new ArrayList<>(Rule.values().length);
        try {
            for (Rule rule : Rule.values()) {
                checking = rule;
                if (!rule.selected()) continue;
                HookStatus.invoked(rule.family);
                if (items != null && !items.isEmpty() && Utils.settingsReady() && rule.enabled()) {
                    active.add(rule);
                }
            }
            checking = null;
            if (items == null || items.isEmpty() || active.isEmpty()) return items;
            int[] removed = new int[active.size()];
            List<Object> kept = null;
            int index = 0;
            for (Object item : items) {
                boolean remove = false;
                for (int r = 0; r < active.size(); r++) {
                    checking = active.get(r);
                    if (checking.matches(item)) {
                        removed[r]++;
                        remove = true;
                    }
                }
                checking = null;
                if (remove) {
                    if (kept == null) {
                        kept = new ArrayList<>(items.size());
                        kept.addAll(items.subList(0, index));
                    }
                } else if (kept != null) {
                    kept.add(item);
                }
                index++;
            }
            for (int r = 0; r < active.size(); r++) {
                Rule rule = active.get(r);
                // Count only completed checks, including pages the server sent without matches.
                HookStatus.counted(rule.family, checked);
                if (spool != null) HookStatus.counted(rule.family, spool);
                HookStatus.counted(rule.family, "feed items checked", index);
                if (removed[r] == 0) continue;
                int count = removed[r];
                HookStatus.counted(rule.family, rule.outcome, count);
                Logger.printDebug(() -> rule.family + ": took " + count + " of " + items.size() + " feed items out");
            }
            return kept == null ? items : kept;
        } catch (Throwable t) {
            // One bad item keeps the whole page as Threads sent it rather than dropping posts blind.
            if (checking != null) {
                HookStatus.threw(checking.family, hook, t);
            } else {
                for (Rule rule : active) HookStatus.threw(rule.family, hook, t);
            }
            return items;
        }
    }

    /**
     * Injected where Threads' fetcher for the ads under an opened post's replies hands them on, with
     * the ads it read. Every item there is an ad, so with Hide ads on this answers an empty list and
     * the post opens without them. Answers the same list when the switch is off, HushThreads is
     * paused or anything goes wrong. Never throws.
     */
    public static List<?> permalinkAds(List<?> ads) {
        Rule rule = Rule.ADS;
        try {
            if (!rule.selected()) return ads;
            HookStatus.invoked(rule.family);
            if (ads == null || ads.isEmpty() || !Utils.settingsReady() || !rule.enabled()) return ads;
            int count = ads.size();
            HookStatus.counted(rule.family, "opened post ads taken out", count);
            Logger.printDebug(() -> rule.family + ": took " + count + " ads out from under an opened post");
            return new ArrayList<>(0);
        } catch (Throwable t) {
            HookStatus.threw(rule.family, "opened post ads", t);
            return ads;
        }
    }

    /**
     * Injected at the start of both For You caches' insert of one item into a page they already
     * hold, the way Threads places an ad it got apart from a page fetch. Answers true for an ad with
     * Hide ads on, and the patch then answers the insert's own "nothing went in" code. False when
     * the switch is off, HushThreads is paused, the item isn't an ad or anything goes wrong. Never
     * throws.
     */
    public static boolean insertedAd(Object item) {
        Rule rule = Rule.ADS;
        try {
            if (!rule.selected()) return false;
            HookStatus.invoked(rule.family);
            if (item == null || !Utils.settingsReady() || !rule.enabled()) return false;
            boolean ad = rule.matches(item);
            HookStatus.counted(rule.family, "inserted items checked");
            if (!ad) return false;
            HookStatus.counted(rule.family, "inserted ads taken out");
            Logger.printDebug(() -> rule.family + ": kept an inserted ad out of For You");
            return true;
        } catch (Throwable t) {
            HookStatus.threw(rule.family, "inserted item", t);
            return false;
        }
    }

    /**
     * The feed unit types that are ads, matched whole: an ad, an ad for ads, the two ad pivots and
     * the ads feedback prompts.
     */
    static final Set<String> AD_UNIT_TYPES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "AD", "AD4AD", "INTENT_AWARE_AD_PIVOT", "STAND_ALONE_MULTI_AD_PIVOT", "ADS_FEEDBACK_INTERFACE",
            "ADS_FEEDBACK_INTERFACE_INTERESTS_PICKER", "ADS_FEEDBACK_INTERFACE_REPETITION")));

    /** Whether this feed item is an ad unit, or the post it carries is an ad. */
    static boolean isAdItem(Object item) {
        if (item == null) return false;
        if (isAdUnitType(itemUnitType(item))) return true;
        Object media = itemMedia(item);
        return media != null && isAd(media);
    }

    /** Whether a feed item's unit type is one of the ad kinds. Anything but an enum constant isn't. */
    static boolean isAdUnitType(Object unitType) {
        return unitType instanceof Enum && AD_UNIT_TYPES.contains(((Enum<?>) unitType).name());
    }

    /**
     * The feed item's unit type, an enum constant, or null for an item of another class or one whose
     * type isn't set. The patch writes the read of the item's field in.
     */
    static Object itemUnitType(Object item) {
        return null;
    }

    /**
     * The post a feed item carries ({@code com.instagram.feed.media.Media}), or null for an item
     * that carries none. The patch writes the item class's own getter in.
     */
    static Object itemMedia(Object item) {
        return null;
    }

    /** Threads' own check of whether a post is an ad. The patch writes the call in. */
    static boolean isAd(Object media) {
        return false;
    }

    /**
     * A typed server suggestion card, or the suggested-accounts row Threads builds itself under a
     * post after a follow (its id starts with "suggested_users_chaining_"). Media and
     * unknown/fallback card types never match. The patch writes the check in.
     */
    static boolean isSuggestedUserItem(Object item) {
        return false;
    }
}
