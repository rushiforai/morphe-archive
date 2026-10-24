/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.download;

import app.morphe.extension.shared.settings.preference.LogBufferManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The Download quality choice as it was last built, for the exported report (#240): which gears
 * TikTok listed for the video, which of them the choice offers and why each of the others was
 * left out. A reporter whose choice stopped at 540p could not say whether TikTok had listed
 * anything taller, so nothing could tell a left-out ByteVC2 gear from a missing one. Only the
 * last video is kept, with no addresses, ids or account data, and the list is bounded.
 */
final class DownloadPickerReport implements LogBufferManager.ReportSection {
    static final String TITLE = "DOWNLOAD PICKER";
    /** Gear lines kept for the one video. */
    static final int MAX_LINES = 30;

    private static final DownloadPickerReport INSTANCE = new DownloadPickerReport();
    private static volatile List<String> last = Collections.emptyList();
    private static volatile boolean installed;

    private DownloadPickerReport() {
    }

    /** Replaces what the report says with this video's choice. Never throws into the Download tap. */
    static void record(List<String> lines) {
        try {
            if (!installed) {
                installed = true;
                LogBufferManager.registerReportSection(INSTANCE);
            }
            List<String> kept = new ArrayList<>();
            for (String line : lines) {
                if (kept.size() == MAX_LINES) {
                    kept.add("+" + (lines.size() - MAX_LINES) + " more lines left out");
                    break;
                }
                kept.add(line);
            }
            last = Collections.unmodifiableList(kept);
        } catch (Throwable ignored) {
            // A report missing one choice beats a Download tap that throws.
        }
    }

    @Override public String title() {
        return TITLE;
    }

    @Override public List<String> lines() {
        return last;
    }

    static DownloadPickerReport sectionForTests() {
        return INSTANCE;
    }

    static void resetForTests() {
        last = Collections.emptyList();
    }
}
