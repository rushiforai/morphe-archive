/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;

/**
 * Keeps a reel's Quality settings row once it has been offered (issue #286). Facebook's player
 * stores the list of qualities a video offers and refills it on every format change with the
 * labels of the tracks its format evaluator holds right then. When the evaluator holds none, the
 * list arrives empty, replaces the full one, and the three-dot sheet leaves the row out (it only
 * adds the row when the list isn't empty). Scrolling away and back builds a new player and the
 * row returns.
 *
 * <p>The patch hands every list the player is about to store to {@link #keep}, with the listener
 * that receives it (one per player). A non-empty list is remembered for that listener, and an empty
 * one for the same listener is answered with the remembered list, so the row stays. A listener with
 * nothing remembered gets the list as it came. The listener is held weakly, so a finished player
 * takes its list with it. Never throws: it runs inside Facebook's player callbacks, so a failure
 * answers the list unchanged.
 *
 * <p>Off for a build without the Default playback quality patch, before the settings are ready and
 * while Hushfacebook is paused.
 */
public final class QualityList {
    private QualityList() {}

    private static final String FAMILY = FamilyNames.PLAYBACK_QUALITY;

    /** Counted each time an empty list was swapped for the one the player had. */
    static final String KEPT = "quality row kept after an empty list";

    /** Whether the patch is in this build, when a test says so instead of {@link SettingsStatus}. */
    @Nullable
    static volatile Boolean inBuildForTests;

    private static final Map<Object, List<String>> LISTS = new WeakHashMap<>();

    static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return forced != null ? forced : SettingsStatus.defaultPlaybackQuality();
    }

    /**
     * Injection point, first thing in the player's callback that stores the quality labels, with
     * the callback's own object and the list about to be stored. Answers the list to store. Never
     * throws.
     */
    @Nullable
    public static List<String> keep(@Nullable Object player, @Nullable List<String> incoming) {
        try {
            if (player == null || !inBuild()) return incoming;
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady() || HushfacebookPause.isPaused()) return incoming;
            synchronized (LISTS) {
                if (incoming != null && !incoming.isEmpty()) {
                    LISTS.put(player, new ArrayList<>(incoming));
                    return incoming;
                }
                List<String> remembered = LISTS.get(player);
                if (remembered == null || remembered.isEmpty()) return incoming;
                HookStatus.bound(FAMILY, "quality list");
                HookStatus.counted(FAMILY, KEPT);
                int count = remembered.size();
                Logger.diagnosticDebug(DiagnosticCategory.OTHER, QualityChoice.SOURCE,
                        () -> QualityChoice.PREFIX + "an empty quality list for a player that had "
                                + count + " was left out, so its Quality row stays.");
                return new ArrayList<>(remembered);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "quality list", failure);
            return incoming;
        }
    }

    /** Forgets every player, as a new process would. */
    static void forget() {
        synchronized (LISTS) {
            LISTS.clear();
        }
    }
}
