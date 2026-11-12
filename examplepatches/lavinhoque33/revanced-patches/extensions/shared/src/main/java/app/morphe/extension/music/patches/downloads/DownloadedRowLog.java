/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.utils.Logger;

/**
 * Debug log of the song-row checks (tag "DownloadedRowLog", only with debug logging on). A line is logged when the
 * result of a row differs from the last result logged for that kind of row (a list row or a queue row), so a page of
 * rows with one result is one line and a new result always shows up; there is no budget that a busy page could use
 * up before another page opens. When a row is downloaded but the check could not be placed, the line says why. Main
 * thread only.
 */
final class DownloadedRowLog {
    private static final int MAX_SKIPPED_CLASSES = 8;

    private final Map<String, String> lastByKind = new HashMap<>();
    private final Set<String> skippedClasses = new HashSet<>();

    /** A row was evaluated: says why it is, or is not, marked. Nothing is built unless the line is logged. */
    void decided(DownloadedMarkers.RowState state, String reason, @Nullable String videoId, String outcome) {
        if (!BaseSettings.DEBUG.get()) return;

        String result = reason + "/" + outcome;
        state.lastOutcome = result;
        if (result.equals(lastByKind.put(state.kind, result))) return;

        boolean skipped = outcome.startsWith("no-");
        Logger.printDebug(() -> (skipped ? "Row end-check skipped: " + outcome + " (" + reason + ")"
                : "Row " + reason + " -> " + outcome) + " kind=" + state.kind
                + (videoId == null ? "" : " song=" + videoId));
    }

    /** A bound view that has no end slot: once per view class, at most a few. */
    void notASongRow(String viewClass) {
        if (!BaseSettings.DEBUG.get() || skippedClasses.size() >= MAX_SKIPPED_CLASSES
                || !skippedClasses.add(viewClass)) {
            return;
        }

        Logger.printDebug(() -> "Row end-check skipped: no end slot in " + viewClass);
    }
}
