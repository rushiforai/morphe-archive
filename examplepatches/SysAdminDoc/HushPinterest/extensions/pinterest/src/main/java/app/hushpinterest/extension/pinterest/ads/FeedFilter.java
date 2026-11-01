/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.pinterest.actions.BoardDownloads;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;

/**
 * The one place both list families take items out.
 *
 * <p>Pinterest hands every page of a feed, search, related pins and boards to one of three list
 * holders before anything is drawn. The patch passes the list each holder is built with through
 * {@link #filter}, which drops what Hide ads and Hide AI-labeled pins each say to and hands back the
 * rest in order. A module that stays, such as a row of ideas or a group of products, has the same
 * done to the pins inside it, and goes when none are left ({@link ModuleItems}). With every switch
 * off, or paused, the list goes through untouched.
 *
 * <p>Download board reads what's left, untouched, to keep the pins of a board's own pages. It never
 * throws and never changes the list, so the filtering is the same with it or without it.
 */
public final class FeedFilter {
    private FeedFilter() {}

    /**
     * Injected at the start of each list holder's constructor, on its list parameter. Returns the
     * same list when nothing goes, or a new one without the items that do. Never throws.
     */
    public static List<?> filter(List<?> items) {
        // Each family's patch marks its list capability once the hook is in.
        boolean ads = PatchFamily.Capability.FEED_ADS.installed();
        boolean ai = PatchFamily.Capability.FEED_AI_PINS.installed();
        boolean shopping = PatchFamily.Capability.FEED_SHOPPING.installed();
        boolean videos = PatchFamily.Capability.FEED_VIDEO_PINS.installed();
        boolean muting = PatchFamily.Capability.FEED_MUTED_WORDS.installed();
        if (ads) HookStatus.invoked(FamilyNames.HIDE_ADS);
        if (ai) HookStatus.invoked(FamilyNames.HIDE_AI_PINS);
        if (shopping) HookStatus.invoked(FamilyNames.HIDE_SHOPPING);
        if (videos || muting) HookStatus.invoked(FamilyNames.FILTER_FEED);
        if (items == null || items.isEmpty()) return items;
        ads = ads && Ads.active();
        // Hide pins that say they're AI rides the same hook as Hide AI-labeled pins, on its own switch.
        boolean aiWords = ai && AiPins.wordsActive();
        ai = ai && AiPins.active();
        shopping = shopping && Shopping.active();
        videos = videos && VideoPins.active();
        List<String> muted = muting ? MutedWords.phrases() : Collections.emptyList();
        if (!ads && !ai && !aiWords && !shopping && !videos && muted.isEmpty()) {
            BoardDownloads.record(items);
            return items;
        }
        boolean hideAds = ads, hideAi = ai, hideAiWords = aiWords, hideShopping = shopping, hideVideos = videos;
        ModuleItems.Verdict verdict = model -> family(model, hideAds, hideAi, hideAiWords, hideShopping, hideVideos, muted);
        String owner = ads ? FamilyNames.HIDE_ADS : ai || aiWords ? FamilyNames.HIDE_AI_PINS
                : shopping ? FamilyNames.HIDE_SHOPPING : FamilyNames.FILTER_FEED;
        boolean debug = debugLogging();
        List<?> shown;
        // What the loop takes out, counted only once the whole list went through: a list that fails
        // partway is shown as it was, so nothing was removed from it. A module pruned before the
        // failure keeps its own counts, since it did lose those entries.
        List<String[]> removed = new ArrayList<>();
        try {
            List<Object> kept = null;
            int size = items.size();
            for (int i = 0; i < size; i++) {
                Object item = items.get(i);
                String family = judge(item, verdict, owner, debug, removed);
                if (family != null) {
                    if (kept == null) kept = new ArrayList<>(items.subList(0, i));
                } else if (kept != null) {
                    kept.add(item);
                }
            }
            shown = kept == null ? items : kept;
        } catch (Throwable t) {
            HookStatus.threw(owner, "list filter", t);
            return items;
        }
        for (String[] entry : removed) HookStatus.counted(entry[0], entry[1]);
        // Outside the filter's own failure handling: what's kept for a board never decides what's shown.
        BoardDownloads.record(shown);
        return shown;
    }

    /**
     * The family that takes [item] out, or null to keep it, adding its count to [removed]. An item that
     * can't be read stays, and the rest of the page is still filtered, so one odd model never lets
     * every ad on it through.
     */
    static String judge(Object item, ModuleItems.Verdict verdict, String owner, boolean debug, List<String[]> removed) {
        try {
            String family = verdict.family(item);
            String count = null;
            // A module that stays loses what's inside it that goes, and goes too when that's everything.
            if (family == null && ModuleItems.isModule(item)) {
                family = ModuleItems.prune(item, verdict, owner);
                if (family != null) count = "module left empty removed";
            } else if (family != null) {
                count = removal(family);
            }
            // A kept item with commercial fields set is what a report of an ad that got through needs (#6),
            // and its saved fields say why Hide pins you've already saved left it in.
            if (family == null && debug) {
                String marks = ModuleItems.markers(item);
                if (!marks.isEmpty()) Logger.printDebug(() -> "Kept " + item.getClass().getSimpleName() + marks);
            }
            if (count != null) removed.add(new String[]{owner(family), count});
            return family;
        } catch (Throwable t) {
            HookStatus.threw(owner, "item filter", t);
            return null;
        }
    }

    /** Whether Debug logging is on, read once a page; never throws. */
    static boolean debugLogging() {
        try {
            return Utils.settingsReady() && BaseSettings.DEBUG.get();
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * The first switch on that takes [item] out, in the order ads, AI label, AI words, shopping,
     * video, muted words, or null to keep it. A pin that says it's AI is named
     * {@link AiPins#SELF_DESCRIBED} and a muted one {@link MutedWords#MUTED}, each counted apart.
     */
    private static String family(Object item, boolean ads, boolean ai, boolean aiWords, boolean shopping, boolean videos,
                                 List<String> muted) {
        return ads && Ads.isAd(item) ? FamilyNames.HIDE_ADS
                : ai && AiPins.isLabeled(item) ? FamilyNames.HIDE_AI_PINS
                : aiWords && AiPins.saysItIsAi(item) ? AiPins.SELF_DESCRIBED
                : shopping && Shopping.isShopping(item) ? FamilyNames.HIDE_SHOPPING
                : videos && VideoPins.isVideo(item) ? FamilyNames.FILTER_FEED
                : MutedWords.isMuted(item, muted) ? MutedWords.MUTED : null;
    }

    /** The family whose report counts a removal [family] names. */
    static String owner(String family) {
        return AiPins.SELF_DESCRIBED.equals(family) ? FamilyNames.HIDE_AI_PINS
                : MutedWords.MUTED.equals(family) || SavedPins.SAVED.equals(family) ? FamilyNames.FILTER_FEED : family;
    }

    /** What a removal by [family] is counted as. English, for the report. */
    static String removal(String family) {
        return family.equals(FamilyNames.HIDE_ADS) ? "promoted pin removed"
                : family.equals(FamilyNames.HIDE_AI_PINS) ? "AI-labeled pin removed"
                : family.equals(AiPins.SELF_DESCRIBED) ? "self-described AI pin removed"
                : family.equals(FamilyNames.FILTER_FEED) ? "video pin removed"
                : family.equals(MutedWords.MUTED) ? "muted word pin removed"
                : family.equals(SavedPins.SAVED) ? "saved pin removed" : "shopping placement removed";
    }
}
