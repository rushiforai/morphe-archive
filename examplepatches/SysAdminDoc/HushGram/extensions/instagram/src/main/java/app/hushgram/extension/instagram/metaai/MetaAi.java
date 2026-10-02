/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.metaai;

import android.view.View;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import app.hushgram.extension.instagram.feed.FeedItemKinds;
import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Hide Meta AI" patch.
 *
 * <p>Instagram decides whether its search bars offer Meta AI from server flags. On 449 one flag
 * covers the Search tab's bar ("Search with Meta AI"), its results and Meta AI's answers there, and
 * two more the bar at the top of your messages: its "Search or ask Meta AI" hint, and the Meta AI
 * ring at its end. The patch passes every read of them through {@link #searchFlag}, which answers no
 * while its switch is on, the answer an account without Meta AI gets.
 *
 * <p>A keyword search's results end in an "Ask a follow-up…" bar with topic pills above it. Its flag
 * also gives the results page its header (Back and the query), so it stays on, and the bar's stub
 * goes through {@link #followUpBar} as the page sets the bar up instead.
 *
 * <p>Home's top bar is built from a list of button names the server sends. Meta AI's ("meta_ai")
 * goes through {@link #homeButton}, and a fourth flag, which adds a Meta AI chats button when the
 * list has no messages button, goes through {@link #searchFlag} with the others.
 *
 * <p>The home feed's Meta AI units go through {@link #filter} at the feed's parse helper, the way
 * Hide suggested posts' do.
 */
public final class MetaAi {
    /**
     * The feed item kinds of Meta AI's units, by the constant names Instagram 449 gives them:
     * Vibes (its feed of AI videos), Meta AI chats ("hatch") and Imagine pictures of you ("memu").
     * Hide Reels in the feed takes out the first two as well.
     */
    static final Set<String> FEED_UNITS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "VIBES_IN_FEED_UNIT", "HATCH_IMMERSIVE_IN_FEED_UNIT", "MEMU_IN_FEED_UNIT")));

    /** The name Home's top bar list gives Meta AI's button on 449. */
    static final String HOME_BUTTON = "meta_ai";

    /** The diagnostic counter route for the feed units. */
    static final String ROUTE = "Meta AI in the feed";

    private static volatile boolean loggedSearch;

    private MetaAi() {
    }

    /**
     * Injected right after each read of one of Meta AI's search flags, with Instagram's answer as an
     * int (non-zero is yes). Answers false while its switch is on, and Instagram's answer
     * otherwise, or when anything goes wrong. Never throws, and never waits for the settings: before
     * they're ready Instagram's answer stands.
     */
    public static boolean searchFlag(int enabled) {
        if (enabled == 0) return false;
        try {
            HookStatus.invoked(FamilyNames.META_AI);
            if (!Utils.settingsReady() || !Settings.HIDE_META_AI_SEARCH.get()) return true;
            if (!loggedSearch) {
                loggedSearch = true;
                Logger.printDebug(() -> "Meta AI: search flag answered off");
            }
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.META_AI, "search flag", failure);
            return true;
        }
    }

    /**
     * Injected where the search results page checks that its "Ask a follow-up…" bar's stub is in
     * the page, with that stub. Answers null, which Instagram takes as a page without the bar, while
     * the search switch is on, and the stub otherwise, or when anything goes wrong. Never throws.
     */
    public static View followUpBar(View stub) {
        if (stub == null) return null;
        try {
            HookStatus.invoked(FamilyNames.META_AI);
            if (!Utils.settingsReady() || !Settings.HIDE_META_AI_SEARCH.get()) return stub;
            Logger.printDebug(() -> "Meta AI: left out the Ask a follow-up bar");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.META_AI, "follow-up bar", failure);
            return stub;
        }
    }

    /**
     * Injected where Home's top bar takes each button name from the server's list. Answers null for
     * Meta AI's button ("meta_ai"), which the bar skips like an empty name, while the search switch
     * is on, and the name otherwise, or when anything goes wrong. Never throws.
     */
    public static String homeButton(String name) {
        if (!HOME_BUTTON.equals(name)) return name;
        try {
            HookStatus.invoked(FamilyNames.META_AI);
            if (!Utils.settingsReady() || !Settings.HIDE_META_AI_SEARCH.get()) return name;
            Logger.printDebug(() -> "Meta AI: left Home's Meta AI button out");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.META_AI, "home button", failure);
            return name;
        }
    }

    /**
     * Injected at the return of Instagram's feed item parse helper. Answers null for a Meta AI unit
     * while Hide Meta AI posts is on, and [item] itself otherwise, or when anything goes wrong.
     * Never throws.
     */
    public static Object filter(Object item) {
        if (item == null) return null;
        try {
            HookStatus.invoked(FamilyNames.META_AI);
            String kind = FeedItemKinds.kindIn(item, FEED_UNITS, FamilyNames.META_AI);
            if (kind == null) return item;
            FeedFilterCounters.sawKind(ROUTE, kind);
            if (!Utils.settingsReady() || !Settings.HIDE_META_AI_POSTS.get()) return item;
            FeedFilterCounters.removed(ROUTE, 1, kind);
            Logger.printDebug(() -> "Meta AI: took out a " + kind + " item");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.META_AI, "feed item", failure);
            return item;
        }
    }
}
