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
 * <p>Every page Threads fetches for the feed, For You and Following alike, goes through one merge
 * method of {@code BarcelonaFeedCache} before anything is cached or drawn. The patch hands that
 * method's page of items to {@link #filter} first and merges what comes back. Only selected,
 * enabled rules remove items, so unrelated feed items keep their original order.
 *
 * <p>An item is an ad when the post it carries is one: Threads' own check reads the post's
 * "injected" data, the block the server attaches to a sponsored post, and this asks that same check.
 * A thread unit counts by its first post, which is the one the feed shows, the same post Threads'
 * own item reads for its media. An item also counts as an ad by its unit type: every feed item
 * carries an enum saying what kind of unit it is, Threads keeps that enum's constant names, and the
 * ad kinds in {@link #AD_UNIT_TYPES} come out whatever they carry. Suggestion units (the NETEGO and
 * SUGGESTED kinds) and ordinary posts aren't ad kinds.
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
                HookStatus.counted(rule.family, "feed pages checked");
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
                HookStatus.threw(checking.family, "feed page", t);
            } else {
                for (Rule rule : active) HookStatus.threw(rule.family, "feed page", t);
            }
            return items;
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

    /** A typed server suggestion card, excluding Media and unknown/fallback card types. */
    static boolean isSuggestedUserItem(Object item) {
        return false;
    }
}
