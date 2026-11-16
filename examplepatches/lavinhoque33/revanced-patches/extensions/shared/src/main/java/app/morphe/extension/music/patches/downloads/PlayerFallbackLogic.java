/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import android.view.KeyEvent;

import java.util.List;
import java.util.function.Predicate;

/** Per-request routing, with no session-wide offline latch and no unbounded native Next loop. */
final class PlayerFallbackLogic {
    enum Route { NETWORK, LOCAL, SKIP, UNAVAILABLE }

    record Decision(Route route, int nextIndex) { }
    private static final Decision NETWORK = new Decision(Route.NETWORK, -1);
    private static final Decision LOCAL = new Decision(Route.LOCAL, -1);
    private static final Decision UNAVAILABLE = new Decision(Route.UNAVAILABLE, -1);

    private PlayerFallbackLogic() { }

    static Decision decide(boolean enabled, boolean online, String videoId, boolean explicit,
                           List<String> queue, int current, Predicate<String> playable) {
        if (!enabled || online) return NETWORK;
        if (playable.test(videoId)) return LOCAL;
        if (explicit) return UNAVAILABLE;

        int next = nextCached(queue, current, queue.size(), playable);
        return next < 0 ? UNAVAILABLE : new Decision(Route.SKIP, next);
    }

    /** Scans only the remaining native ordering; repeat/shuffle wrapping is the native resolver's decision. */
    static int nextCached(List<String> queue, int current, int remaining, Predicate<String> playable) {
        if (current < 0 || current >= queue.size() || remaining <= 1) return -1;

        int limit = Math.min(queue.size() - current, remaining);
        for (int step = 1; step < limit; step++) {
            int index = current + step;
            if (playable.test(queue.get(index))) return index;
        }
        return -1;
    }

    static boolean isExplicitPlayKey(int action, int repeat, int keyCode) {
        return action == KeyEvent.ACTION_DOWN && repeat == 0 && keyCode == KeyEvent.KEYCODE_MEDIA_PLAY;
    }

    /** Debug-only inventory includes cached occurrences outside the bounded scan, including duplicate video IDs. */
    static String describeStop(List<ExhaustedPlayback.Occurrence> queue, int current, int failed, int remaining,
                               boolean advancing, String reason, Predicate<String> playable) {
        boolean scanned = advancing && failed >= 0 && failed < queue.size();
        int start = scanned ? failed + 1 : -1;
        int end = scanned ? failed + Math.min(queue.size() - failed, Math.max(1, remaining)) : -1;
        int left = scanned ? Math.max(0, remaining - (end - failed)) : remaining;
        StringBuilder cached = new StringBuilder("[");
        for (int index = 0; index < queue.size(); index++) {
            ExhaustedPlayback.Occurrence item = queue.get(index);
            if (!playable.test(item.videoId())) continue;
            if (cached.length() > 1) cached.append(", ");
            cached.append(index).append('#').append(item.itemId()).append(':').append(item.videoId());
        }
        return "PlayerFallback: STOP size=" + queue.size() + " current=" + current + " failed=" + failed
                + " scan=[" + start + "," + end + ") budget=" + remaining + " left=" + left
                + " advancing=" + advancing + " cached=" + cached.append(']') + " reason=" + reason;
    }
}
