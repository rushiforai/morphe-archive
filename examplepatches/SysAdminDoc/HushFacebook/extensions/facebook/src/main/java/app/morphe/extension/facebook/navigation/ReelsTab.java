/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import android.content.Context;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What Hide the Reels tab does to Facebook's tab bar: it takes off the Reels tab, which some
 * accounts call Video (Facebook keeps one class for both, {@link FacebookTabs#VIDEO_CLASS}), and
 * leaves every other tab where Facebook put it.
 *
 * <p>Facebook's tab bar list builder asks {@link TabBarFilter} about each configured tab right after
 * its own set of hidden tab ids has answered, and that asks {@link #hidesTab}, so the Reels tab goes
 * the way a tab hidden in Facebook's Settings, Tab bar, Customize the bar does. A Reels tab
 * Facebook's own set already hides stays Facebook's: this neither counts it nor puts it back.
 * Facebook builds the list once and keeps it, so a change of the switch shows when Facebook
 * restarts. Reels themselves still open: a reel link, a reel in the feed and the Reels viewer are
 * their own screens, and a start or a notification asking for the missing tab opens the bar's first
 * tab, as Facebook does for any tab its bar hasn't got.
 *
 * <p>Facebook also pushes a Reels shortcut into the long-press menu of its launcher icon. The
 * settings patch sends each of Facebook's shortcut calls through SettingsEntry, which asks
 * {@link #dropsShortcut} and {@link #withoutShortcut} first, so with the switch on that shortcut is
 * held back and one already published is removed, and each start clears one left from before
 * ({@link #removePublished}). With the switch off, Facebook's next push of its shortcuts brings it
 * back.
 *
 * <p>It fails open: with the patch not in the build, the switch off, Hushfacebook paused, the
 * settings not ready yet, or a failure in here, the tab bar is Facebook's own.
 */
public final class ReelsTab {
    /** The name the log lines go under, which is also their logcat tag after Morphe's prefix. */
    static final String SOURCE = "ReelsTab";

    /** What every line of this hook starts with, for a person reading the log. */
    static final String PREFIX = "Reels tab: ";

    /** The id of Facebook's launcher shortcut to the Reels tab, which its code calls video home. */
    static final String SHORTCUT_ID = "shortcut_video_home";

    /** Counted under the patch's name each time Facebook's Reels shortcut is held back or removed. */
    static final String SHORTCUT_HELD = "Reels shortcut held back";

    /** Whether the patch is in this build, when a test says so instead of {@link SettingsStatus}. */
    @Nullable
    static volatile Boolean inBuildForTests;

    /**
     * Whether the tab bar this process built lost the Reels tab to the switch, or null before
     * Facebook has built one. Facebook keeps the bar it built, so this, not the switch, says whether
     * the tab is there until Facebook restarts.
     */
    @Nullable
    private static volatile Boolean tookItOff;

    /** The lines logged, so a rebuilt tab bar doesn't log them again. */
    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    private ReelsTab() {
    }

    /** Whether this build carries the patch. */
    static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return forced != null ? forced : SettingsStatus.reelsTab();
    }

    /**
     * Whether the Reels tab goes now: the patch in the build, the settings ready and its switch on,
     * which a pause answers off. Never throws.
     */
    static boolean on() {
        try {
            return inBuild() && Utils.settingsReady() && Settings.HIDE_REELS_TAB.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REELS_TAB, "reels tab switch", failure);
            return false;
        }
    }

    /**
     * Whether a start asking for the Reels tab would find the switch has kept it off the bar: the
     * bar this process built lost it, or, before Facebook has built one, the switch is on. The
     * start then asks for Home. Never throws.
     */
    static boolean offTheBar() {
        Boolean built = tookItOff;
        return built != null ? built : on();
    }

    /**
     * Asked by {@link TabBarFilter} for each configured tab, right after Facebook's hidden-tab set
     * answered [hidden] for [tab]. Answers whether the tab stays off the bar: always when Facebook
     * hides it, and for the Reels tab while the switch is on. Never throws.
     */
    public static boolean hidesTab(boolean hidden, @Nullable Object tab) {
        try {
            if (tab == null || !inBuild()) return hidden;
            boolean reels = FacebookTabs.VIDEO_CLASS.equals(tab.getClass().getName());
            if (!Utils.settingsReady()) {
                // A bar built before the settings is Facebook's, and stays so until it restarts.
                if (reels) tookItOff = false;
                return hidden;
            }
            HookStatus.invoked(FamilyNames.REELS_TAB);
            if (!reels) return hidden;
            boolean wanted = on();
            if (hidden) {
                tookItOff = false;
                if (wanted && logged.add("facebook")) {
                    Logger.diagnosticInfo(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE, () -> PREFIX
                            + "Facebook's own tab bar settings already hide the Reels tab, so it's left to them.");
                }
                return true;
            }
            tookItOff = wanted;
            if (!wanted) return false;
            HookStatus.bound(FamilyNames.REELS_TAB, "tab bar");
            if (logged.add("took")) {
                Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                        () -> PREFIX + "took " + tab.getClass().getSimpleName() + " off the tab bar.");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REELS_TAB, "tab bar", failure);
            return hidden;
        }
    }

    /**
     * Asked by SettingsEntry before Facebook pushes [shortcut]. True when it's the Reels shortcut and
     * the switch is on: the push is dropped, and a Reels shortcut already published is removed.
     * Never throws.
     */
    public static boolean dropsShortcut(@Nullable ShortcutManager manager, @Nullable ShortcutInfo shortcut) {
        try {
            if (manager == null || shortcut == null || !SHORTCUT_ID.equals(shortcut.getId()) || !on()) return false;
            removeFrom(manager);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REELS_TAB, "launcher shortcut", failure);
            return false;
        }
    }

    /**
     * Asked by SettingsEntry before Facebook adds, replaces or updates [shortcuts]. With the switch
     * on, answers them without the Reels shortcut, and removes a published one; otherwise answers
     * the same list. Never throws.
     */
    public static List<ShortcutInfo> withoutShortcut(@Nullable ShortcutManager manager, List<ShortcutInfo> shortcuts) {
        try {
            if (manager == null || shortcuts == null) return shortcuts;
            List<ShortcutInfo> kept = new ArrayList<>(shortcuts.size());
            for (ShortcutInfo shortcut : shortcuts) {
                if (shortcut == null || !SHORTCUT_ID.equals(shortcut.getId())) kept.add(shortcut);
            }
            if (kept.size() == shortcuts.size() || !on()) return shortcuts;
            removeFrom(manager);
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REELS_TAB, "launcher shortcut", failure);
            return shortcuts;
        }
    }

    /**
     * Run at each start, off the main thread, before SettingsEntry checks its own shortcut: with the
     * switch on, removes a Reels shortcut Facebook published before it went on, which otherwise
     * stays until Facebook pushes its shortcuts again. Never throws.
     */
    public static void removePublished(Context context) {
        try {
            if (!on()) return;
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
                if (SHORTCUT_ID.equals(shortcut.getId())) {
                    removeFrom(manager);
                    return;
                }
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REELS_TAB, "launcher shortcut", failure);
        }
    }

    private static void removeFrom(ShortcutManager manager) {
        manager.removeDynamicShortcuts(Collections.singletonList(SHORTCUT_ID));
        HookStatus.counted(FamilyNames.REELS_TAB, SHORTCUT_HELD);
        if (logged.add("shortcut")) {
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> PREFIX + "kept Facebook's Reels shortcut out of its icon's long-press menu.");
        }
    }

    /** Forgets the built tab bar and which lines were logged, as a new process would. */
    static void forget() {
        logged.clear();
        tookItOff = null;
    }
}
