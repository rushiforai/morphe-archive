/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-22.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.music.settings.preference;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;

import app.morphe.extension.music.patches.downloads.PlaybackSourceInspectorDialog;

@SuppressWarnings({"deprecation", "unused"})
public final class PlaybackSourceInspectorPreference extends Preference {
    public PlaybackSourceInspectorPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        setPersistent(false);
        if (PlaybackSourceInspectorDialog.hasNowPlayingShortcut()) {
            setSummary(str("morphe_music_playback_source_inspector_now_playing_summary"));
        }
    }

    @Override
    protected void onClick() {
        PlaybackSourceInspectorDialog.show(getContext());
    }
}
