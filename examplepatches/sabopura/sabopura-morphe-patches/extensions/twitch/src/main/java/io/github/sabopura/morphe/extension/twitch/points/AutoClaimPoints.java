package io.github.sabopura.morphe.extension.twitch.points;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.original.Stats;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

public final class AutoClaimPoints {
    public static final String KEY = "auto_claim_points";
    private static final Handler UI = new Handler(Looper.getMainLooper());
    private static final ClaimDispatcher DISPATCHER = new ClaimDispatcher(
            new ClaimDispatcher.Access() {
                public boolean enabled(Object state) { return PointsAccess.isEnabled(state); }
                public Object claim(Object state) { return PointsAccess.activeClaim(state); }
                public String id(Object claim) { return PointsAccess.id(claim); }
                public String status(Object state) {
                    Object status = PointsAccess.status(state);
                    return status == null ? null : status instanceof Enum<?> ? ((Enum<?>) status).name() : "INVALID";
                }
                public void submit(Object presenter, String id) { PointsAccess.claimBonus(presenter, id); }
                public void claimed() { Stats.pointsClaimed(); }
            }, action -> UI.post(action), SystemClock::elapsedRealtime,
            failure -> Diagnostics.note("points.claim", failure));
    private AutoClaimPoints() {}

    /** Observe native output, after Twitch's login, enabled-channel and ban checks. */
    public static void onViewState(Object viewState, Object presenter) {
        try {
            if (!Features.has(Feature.AUTO_POINTS)) return;
            android.content.SharedPreferences prefs = ChatSettings.preferences();
            if (prefs != null && !prefs.getBoolean(KEY, true)) return;
            // Do not re-enter Twitch's state machine from its render callback.
            DISPATCHER.update(viewState, presenter);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("points.view-state", e);
        }
    }
}
