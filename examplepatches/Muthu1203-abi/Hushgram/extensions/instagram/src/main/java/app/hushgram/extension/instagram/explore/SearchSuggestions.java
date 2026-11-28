/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.explore;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.feed.FeedItemKinds;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for Hide suggested accounts in search, a switch of the "Hide the Explore grid" patch.
 *
 * <p>Tapping the search bar shows, before you type, your recent searches and a Suggested for you
 * section of accounts to follow. Instagram 450 has two builders of that screen and the server picks
 * one:
 * <ul>
 *   <li>the older one adds the Suggested for you section in a method of its own, and the patch asks
 *       {@link #hideSection} first thing there, so the section is never added;</li>
 *   <li>the newer one is handed one list of items, each marked with its kind, and draws a section
 *       for each kind. The patch passes the list through {@link #items}, which leaves out the
 *       suggested accounts, and with none of them the builder draws no Suggested for you header or
 *       See all row either.</li>
 * </ul>
 * Recent searches and every other part of the screen stay. Each hook fails open: with the switch
 * off, HushGram paused, the settings not read yet or anything thrown, Instagram's own answer stands.
 */
public final class SearchSuggestions {
    /** The diagnostic counter route for the suggested accounts left out of the search screen. */
    static final String ROUTE = "Search suggested accounts";

    static final String SECTION = "older screen's section";
    static final String ITEMS = "newer screen's items";

    /** The kind of the suggested accounts among the newer screen's items, by its constant's name. */
    static final Set<String> SUGGESTED = Collections.singleton("SUGGESTED_USERS");

    private SearchSuggestions() {
    }

    /**
     * Injected first thing where the older search screen adds its Suggested for you section.
     * Answers true, leave it out, while the switch is on, and false otherwise, or when anything goes
     * wrong. Never throws, and never waits for the settings.
     */
    public static boolean hideSection() {
        return hideSection(SearchSuggestions::switchedOn);
    }

    static boolean hideSection(BooleanSupplier on) {
        try {
            HookStatus.invoked(FamilyNames.EXPLORE_GRID);
            FeedFilterCounters.sawKind(ROUTE, SECTION);
            if (!on.getAsBoolean()) return false;
            FeedFilterCounters.removed(ROUTE, 1, SECTION);
            Logger.printDebug(() -> "Search suggestions: left the older screen's section out");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.EXPLORE_GRID, SECTION, failure);
            return false;
        }
    }

    /**
     * Injected first thing in the newer search screen's builder, with the list of items it's
     * handed. Answers a new list without the suggested accounts while the switch is on, and [items]
     * itself otherwise, when there are none, or when anything goes wrong. The list Instagram passed
     * is never changed. Never throws.
     */
    public static List<?> items(List<?> items) {
        return items(items, SearchSuggestions::switchedOn);
    }

    static List<?> items(List<?> items, BooleanSupplier on) {
        if (items == null || items.isEmpty()) return items;
        try {
            HookStatus.invoked(FamilyNames.EXPLORE_GRID);
            FeedFilterCounters.sawList(ROUTE, items.size());
            if (!on.getAsBoolean()) return items;
            List<Object> kept = new ArrayList<>(items.size());
            int removed = 0;
            for (Object item : items) {
                if (item != null && FeedItemKinds.kindIn(item, SUGGESTED, FamilyNames.EXPLORE_GRID) != null) {
                    removed++;
                } else {
                    kept.add(item);
                }
            }
            if (removed == 0) return items;
            FeedFilterCounters.removed(ROUTE, removed, ITEMS);
            int count = removed;
            Logger.printDebug(() -> "Search suggestions: left out " + count + " suggested accounts");
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.EXPLORE_GRID, ITEMS, failure);
            return items;
        }
    }

    private static boolean switchedOn() {
        return Utils.settingsReady() && Settings.HIDE_SEARCH_SUGGESTIONS.get();
    }
}
