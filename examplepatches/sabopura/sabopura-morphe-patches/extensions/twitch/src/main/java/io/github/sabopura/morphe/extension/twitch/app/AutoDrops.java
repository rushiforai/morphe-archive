package io.github.sabopura.morphe.extension.twitch.app;

import android.os.SystemClock;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.points.ClaimGate;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;

/**
 * Presses the Claim button of Twitch's channel drops notification when it shows a claimable drop,
 * through the same handler a tap uses.
 */
@SuppressWarnings("unused")
public final class AutoDrops {
    public static final String KEY = "auto_drops";
    private static final ClaimGate GATE = new ClaimGate();

    private AutoDrops() {
    }

    /** Injection point: the drops notification just showed a drop presentation. */
    public static void presented(Object presenter, Object presentation) {
        try {
            if (presenter == null || presentation == null || !AppHooks.on(Feature.AUTO_DROPS, KEY)) return;
            Object claimable = claimableOf(presentation, 0);
            if (claimable == null || !GATE.acquire(dropInstanceId(claimable), null, SystemClock.elapsedRealtime())) return;
            tapClaim(presenter, claimable, null, null, 0);
        } catch (Throwable e) {
            Diagnostics.note("app.auto-drops", e);
        }
    }

    /** Replaced at patch time: the presentation's drop when it is claimable, else null. The int is a scratch register. */
    private static Object claimableOf(Object presentation, int scratch) {
        return null;
    }

    /** Replaced at patch time. */
    private static String dropInstanceId(Object claimable) {
        return null;
    }

    /** Replaced at patch time: the Claim button's event on the presenter's handler. The last three arguments are scratch registers. */
    private static void tapClaim(Object presenter, Object claimable, Object handler, Object event, int value) {
    }
}
