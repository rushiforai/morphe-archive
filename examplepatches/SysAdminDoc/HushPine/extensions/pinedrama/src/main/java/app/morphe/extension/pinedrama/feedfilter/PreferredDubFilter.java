/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.feedfilter;

import app.morphe.extension.pinedrama.captions.TrackPreference;
import app.morphe.extension.pinedrama.settings.Settings;

import com.ss.android.ugc.aweme.feed.model.Aweme;

/** Hides a video with none of the dubs on the Dub priority list (issue #4). */
public final class PreferredDubFilter implements IFilter {
    @Override
    public boolean getEnabled() {
        return Settings.HIDE_NO_PREFERRED_DUB.get() && TrackPreference.dubListSet();
    }

    @Override
    public boolean getFiltered(Aweme item) {
        return TrackPreference.missingDub(item);
    }
}
