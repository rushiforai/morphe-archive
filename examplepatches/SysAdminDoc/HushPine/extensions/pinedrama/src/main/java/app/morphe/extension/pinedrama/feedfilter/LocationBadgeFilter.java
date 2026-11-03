/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.feedfilter;

import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.blockauthor.Reflect;
import app.morphe.extension.pinedrama.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.util.List;

/** A place badge is an explicit content preference, not proof that a post is a paid ad. */
public final class LocationBadgeFilter implements IFilter {
    private static final String FAMILY = "location badges";

    @Override public boolean getEnabled() { return Settings.FILTER_LOCATION_VIDEOS.get(); }

    @Override public boolean getFiltered(Aweme item) { return hasBadge(item); }

    public static boolean hasBadge(Aweme item) {
        Object value = Reflect.required(item, "getAnchors", FAMILY);
        if (!(value instanceof List<?>)) return false;
        try {
            for (Object anchor : (List<?>) value) if (isLocation(anchor)) return true;
        } catch (RuntimeException error) {
            HookStatus.threw(FAMILY, "read anchors", error);
        }
        return false;
    }

    private static boolean isLocation(Object anchor) {
        return isLocationKey(Reflect.required(anchor, "getComponentKey", FAMILY));
    }

    private static boolean isLocationKey(Object key) {
        // This is PineDrama's component key, not a caption, place name, locale or broad POI field.
        return "anchor_poi".equals(key);
    }
}
