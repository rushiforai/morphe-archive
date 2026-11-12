/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */

package app.morphe.extension.music.settings.preference;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;

import app.morphe.extension.music.patches.downloads.OfflineReplayHooks;
import app.morphe.extension.music.patches.downloads.StreamDownloads;
import app.morphe.extension.shared.utils.Utils;

/**
 * A row that opens the list of downloaded songs. The list is also reached from the app's own Downloads entries, but
 * what those show depends on the home the app has cached, so this row is the one that is always there.
 */
@SuppressWarnings({"unused", "deprecation"})
public class OpenDownloadsPreference extends Preference {

    public OpenDownloadsPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    public OpenDownloadsPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public OpenDownloadsPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public OpenDownloadsPreference(Context context) {
        super(context);
        init();
    }

    private void init() {
        // Nothing is stored here, and the tap is the whole feature.
        setPersistent(false);
        setSelectable(true);
        refreshSummary();
        StreamDownloads.setReadinessListener(this::refreshSummary);
    }

    /** How many copies can play offline is counted off the main thread; with no copies the summary stays as is. */
    private void refreshSummary() {
        Utils.runOnBackgroundThread(() -> {
            final StreamDownloads.Readiness readiness = StreamDownloads.readiness();
            if (readiness.total() == 0) return;

            final String summary = str("morphe_music_open_downloads_ready", readiness.ready(), readiness.total());
            Utils.runOnMainThread(() -> setSummary(summary));
        });
    }

    @Override
    protected void onPrepareForRemoval() {
        StreamDownloads.setReadinessListener(null);
        super.onPrepareForRemoval();
    }

    @Override
    protected void onClick() {
        OfflineReplayHooks.openList(getContext());
    }
}
