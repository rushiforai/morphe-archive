/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

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
 * Helper for the "Hide suggested stories" patch.
 *
 * <p>The row of stories at the top of Home is one row of Home's list, added by its story tray
 * binder group. The patch asks {@link #hideTray} as that group adds its row, and while Hide the
 * Stories tray is on the group adds none.
 *
 * <p>The tray's items come from its own request, each marked with a reel type, and a story from an
 * account you don't follow is a suggested one. The patch passes each item the tray's parser reads
 * through {@link #filter}, which answers null for a suggested one while Hide suggested stories is
 * on, and the parser skips it the way it skips an item that didn't parse.
 */
public final class StoriesTray {
    /**
     * The reel types of suggested tray items, by the constant names Instagram 449 gives them: an
     * account to follow, its story, and a creator's story.
     */
    static final Set<String> SUGGESTED = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "SUGGESTED_USER", "SUGGESTED_USER_REEL", "SUGGESTED_CREATOR_REEL")));

    /** The diagnostic counter route for the tray's suggested items. */
    static final String ROUTE = "Suggested stories";

    private static volatile boolean loggedTray;

    private StoriesTray() {
    }

    /**
     * Injected first thing where Home's story tray adds its row. Answers true, and the tray adds
     * nothing, while Hide the Stories tray is on, and false otherwise, or when anything goes wrong.
     * Never throws, and never waits for the settings: before they're ready the tray stays.
     */
    public static boolean hideTray() {
        try {
            HookStatus.invoked(FamilyNames.STORIES_TRAY);
            if (!Utils.settingsReady() || !Settings.HIDE_STORIES_TRAY.get()) return false;
            if (!loggedTray) {
                loggedTray = true;
                Logger.printDebug(() -> "Stories tray: left the tray out of Home");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORIES_TRAY, "tray row", failure);
            return false;
        }
    }

    /**
     * Injected where the tray's parser reads each item. Answers null for a suggested item while
     * Hide suggested stories is on, and [item] itself otherwise, or when anything goes wrong. Never
     * throws.
     */
    public static Object filter(Object item) {
        if (item == null) return null;
        try {
            HookStatus.invoked(FamilyNames.STORIES_TRAY);
            String kind = FeedItemKinds.kindIn(item, SUGGESTED, FamilyNames.STORIES_TRAY);
            if (kind == null) return item;
            FeedFilterCounters.sawKind(ROUTE, kind);
            if (!Utils.settingsReady() || !Settings.HIDE_SUGGESTED_STORIES.get()) return item;
            FeedFilterCounters.removed(ROUTE, 1, kind);
            Logger.printDebug(() -> "Stories tray: took out a " + kind + " item");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORIES_TRAY, "tray item", failure);
            return item;
        }
    }
}
