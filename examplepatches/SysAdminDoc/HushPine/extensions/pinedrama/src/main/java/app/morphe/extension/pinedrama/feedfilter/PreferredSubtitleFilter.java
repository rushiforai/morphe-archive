/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.feedfilter;

import app.morphe.extension.pinedrama.captions.TrackPreference;
import app.morphe.extension.pinedrama.settings.Settings;

import com.ss.android.ugc.aweme.feed.model.Aweme;

/** Hides a video with none of the subtitles on the Subtitle priority list (issue #4). */
public final class PreferredSubtitleFilter implements IFilter {
    @Override
    public boolean getEnabled() {
        return Settings.HIDE_NO_PREFERRED_SUBTITLE.get() && TrackPreference.subtitleListSet();
    }

    @Override
    public boolean getFiltered(Aweme item) {
        return TrackPreference.missingSubtitle(item);
    }
}
