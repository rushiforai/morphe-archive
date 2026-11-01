package semicoloncolonel.mobilestream.extension.mgm.ads;

import android.util.Log;

import java.lang.reflect.Method;
import java.util.List;

/**
 * Skips the MGM+ pre-roll promo.
 *
 * MGM+ plays through Amazon's AIV player. When you start a title, MGM+ stitches
 * a ~20-30s self-promo into the player's timeline as an item whose ContentType
 * is AUX, ahead of the FEATURE (the thing you chose). This is not an ad break
 * (those are ADVERTISEMENT, handled by Skip ads) and not the "You may also
 * like" end card, so emptying the ad plan does not remove it.
 *
 * AmazonPlayerController.updatePosition() runs continuously during playback and
 * knows the current timeline item. This helper is called from the top of it:
 * while the item being played is an AUX item, it seeks the player to the start
 * of the FEATURE, so the promo is skipped. The moment playback is on the
 * FEATURE the check is false and nothing happens, so a title with no pre-roll
 * (the normal case, and every binge/next-episode) is never touched.
 *
 * Everything is reflection against the AIV SDK's public, un-obfuscated types,
 * wrapped so any failure is a silent no-op: this must never break playback.
 */
@SuppressWarnings("unused")
public final class MgmPrerollSkipper {
    private static final String TAG = "MSP-MGM-PREROLL";
    private static final long RETRY_THROTTLE_MS = 400L;

    // Cached reflected members (the SDK types are stable and not obfuscated).
    private static Method getCurrentTime;
    private static Method getCurrentTimelineItemIndex;
    private static Method getContentInfo;
    private static Method getContentType;
    private static Method getStartTime;
    private static Method seek;

    private static long lastSeekAtMs;

    private MgmPrerollSkipper() {
    }

    public static void maybeSkipAux(Object player, List<?> timelineItems) {
        try {
            if (player == null || timelineItems == null || timelineItems.isEmpty()) return;

            if (getCurrentTime == null) {
                getCurrentTime = player.getClass().getMethod("getCurrentTime");
            }
            Object timeData = getCurrentTime.invoke(player);
            if (timeData == null) return;

            if (getCurrentTimelineItemIndex == null) {
                getCurrentTimelineItemIndex = timeData.getClass().getMethod("getCurrentTimelineItemIndex");
            }
            long index = (Long) getCurrentTimelineItemIndex.invoke(timeData);
            if (index < 0 || index >= timelineItems.size()) return;

            Object current = timelineItems.get((int) index);
            if (current == null || !"AUX".equals(contentTypeName(current))) return; // not in a promo

            // Throttle so a player that refuses the seek cannot be seek-looped.
            long now = System.currentTimeMillis();
            if (now - lastSeekAtMs < RETRY_THROTTLE_MS) return;

            Long featureStart = firstFeatureStartMs(timelineItems);
            if (featureStart == null) return;

            if (seek == null) seek = player.getClass().getMethod("seek", long.class);
            seek.invoke(player, featureStart.longValue());
            lastSeekAtMs = now;
            Log.i(TAG, "skipped AUX pre-roll to feature start " + featureStart + "ms");
        } catch (Throwable t) {
            // Never break playback over this.
        }
    }

    private static String contentTypeName(Object timelineItem) throws Exception {
        if (getContentInfo == null) {
            getContentInfo = timelineItem.getClass().getMethod("getContentInfo");
        }
        Object info = getContentInfo.invoke(timelineItem);
        if (info == null) return null;
        if (getContentType == null) {
            getContentType = info.getClass().getMethod("getContentType");
        }
        Object type = getContentType.invoke(info);
        return type == null ? null : ((Enum<?>) type).name();
    }

    private static Long firstFeatureStartMs(List<?> timelineItems) throws Exception {
        for (Object item : timelineItems) {
            if (item == null || !"FEATURE".equals(contentTypeName(item))) continue;
            if (getStartTime == null) {
                getStartTime = item.getClass().getMethod("getStartTime");
            }
            Object start = getStartTime.invoke(item);
            return start instanceof Long ? (Long) start : null;
        }
        return null;
    }
}
