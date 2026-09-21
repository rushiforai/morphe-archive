/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feedfilter;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.util.ArrayList;
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
        // This is TikTok's component key, not a caption, place name, locale or broad POI field.
        return "anchor_poi".equals(Reflect.required(anchor, "getComponentKey", FAMILY));
    }

    /** Called only by the native badge renderer. Never edits Aweme.getAnchors() or its elements. */
    public static List<?> visibleAnchors(List<?> anchors) {
        HookStatus.bound(FAMILY, "native badge list");
        if (!Settings.HIDE_LOCATION_LABELS.get() || anchors == null || anchors.isEmpty()) return anchors;
        try {
            ArrayList<Object> kept = null;
            for (int i = 0; i < anchors.size(); i++) {
                Object anchor = anchors.get(i);
                if (isLocation(anchor)) {
                    if (kept == null) kept = new ArrayList<>(anchors.subList(0, i));
                } else if (kept != null) {
                    kept.add(anchor);
                }
            }
            if (kept == null) return anchors;
            HookStatus.bound(FAMILY, "location entries hidden");
            return kept;
        } catch (RuntimeException error) {
            HookStatus.threw(FAMILY, "badge list", error);
            Logger.printException(() -> "Could not hide location badges", error);
            return anchors;
        }
    }
}
