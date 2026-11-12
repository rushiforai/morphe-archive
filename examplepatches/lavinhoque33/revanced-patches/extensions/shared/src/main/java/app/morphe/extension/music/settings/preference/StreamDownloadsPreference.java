/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */

package app.morphe.extension.music.settings.preference;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.WindowManager;

import java.util.Locale;

import app.morphe.extension.music.patches.downloads.StreamDownloads;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * The stream copies of Play downloads locally are private to the app, so Device files cannot show or delete them.
 * The summary shows how many there are and what they take; a tap, after a confirmation, deletes all of them.
 * It never touches songs saved as files by Download in app.
 */
@SuppressWarnings({"unused", "deprecation"})
public class StreamDownloadsPreference extends Preference {

    public StreamDownloadsPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    public StreamDownloadsPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public StreamDownloadsPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public StreamDownloadsPreference(Context context) {
        super(context);
        init();
    }

    private void init() {
        // Nothing is stored here, so a persisted value would only leave a key nothing reads.
        setPersistent(false);
        // The tap is the whole feature and the row is declared non-selectable, so this is what lets it through.
        setSelectable(true);
        refreshSummary();
    }

    /** The copies are counted off the main thread; the settings page reopens often enough to stay current. */
    private void refreshSummary() {
        Utils.runOnBackgroundThread(() -> {
            final String summary = summaryText(StreamDownloads.summary());
            Utils.runOnMainThread(() -> setSummary(summary));
        });
    }

    @Override
    protected void onClick() {
        if (!isEnabled()) return;

        Utils.runOnBackgroundThread(() -> {
            final StreamDownloads.Summary summary = StreamDownloads.summary();
            Utils.runOnMainThread(() -> confirm(summary));
        });
    }

    private void confirm(StreamDownloads.Summary summary) {
        if (summary.count() == 0) {
            Utils.showToastShort(str("morphe_music_stream_downloads_none"));
            return;
        }
        try {
            CustomDialog.create(getContext(),
                    str("morphe_music_stream_downloads_delete_title"),
                    str(StreamDownloads.deleteMessageKey(summary), summary.count(),
                            megabytes(summary.totalBytes()), summary.videos()),
                    null,
                    null,
                    this::deleteAll,
                    () -> { },
                    null,
                    null,
                    true).first.show();
        } catch (WindowManager.BadTokenException ex) {
            Logger.printException(() -> "Could not show the delete stream downloads dialog", ex);
        }
    }

    private void deleteAll() {
        Utils.runOnBackgroundThread(() -> {
            final int deleted = StreamDownloads.deleteAll();
            Utils.runOnMainThread(() -> {
                Utils.showToastShort(str("morphe_music_stream_downloads_deleted", deleted));
                refreshSummary();
            });
        });
    }

    private static String summaryText(StreamDownloads.Summary summary) {
        if (summary.count() == 0) return str(StreamDownloads.summaryKey(summary));
        return str(StreamDownloads.summaryKey(summary), summary.count(), megabytes(summary.totalBytes()),
                summary.videos());
    }

    private static String megabytes(long bytes) {
        return StreamDownloads.megabytes(bytes, Locale.getDefault());
    }
}
