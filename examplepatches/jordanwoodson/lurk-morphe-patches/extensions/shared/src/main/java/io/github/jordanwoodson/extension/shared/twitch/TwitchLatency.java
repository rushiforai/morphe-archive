package io.github.jordanwoodson.extension.shared.twitch;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.Locale;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Latency badge: how far a live stream plays behind the broadcast, on the native player in the theatre, read
 * from the player once a second (the live latency the stats panel reports). A tap reloads the stream through
 * the player's own Retry (a new access token and playlist), which starts at the live edge: the native player
 * has no seek to live. Feed previews, VODs and clips show nothing. After a switch between channels the player
 * can report a negative latency until the stream is reloaded; the pill then reads "? s", and a tap fixes it.
 */
@SuppressWarnings("unused")
public final class TwitchLatency {
    static final String KEY = "latency_badge";
    private static final long TICK_MS = 1000;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Object TAG = new Object();
    private static int theatreId = -1;

    private TwitchLatency() {
    }

    /**
     * From the shared player-view hook: a native player presenter attaching its player view. Main thread. The
     * badge is added only while the switch is on, so players opened with it off are untouched.
     */
    public static void playerView(Object presenter, View view) {
        if (presenter == null || !(view instanceof FrameLayout) || !Settings.isEnabled(KEY)) return;
        try {
            FrameLayout frame = (FrameLayout) view;
            for (int i = 0; i < frame.getChildCount(); i++) {
                View child = frame.getChildAt(i);
                if (child.getTag() == TAG) {
                    ((Badge) child).presenter = new WeakReference<>(presenter);
                    return;
                }
            }
            Badge badge = new Badge(frame.getContext(), presenter);
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START);
            int margin = dp(frame.getContext(), 8);
            params.setMargins(margin, margin, margin, margin);
            frame.addView(badge, params);
        } catch (RuntimeException e) {
            Logger.d("latency: " + e);
        }
    }

    /** "1.8 s behind live": tenths below ten seconds, whole seconds above. */
    static String label(long millis) {
        if (millis < 10_000) return String.format(Locale.ROOT, "%.1f s", millis / 1000.0);
        return (millis / 1000) + " s";
    }

    /**
     * The pill's text for a reading, or null to hide it. -1 is no player (or nothing measured yet) and 0 a stream
     * still loading. The IVS player can go on reporting a negative latency after a switch between channels, until
     * the stream is reloaded (issue 77): that shows as "? s", and a tap reloads it like any other reading.
     */
    static String text(long millis) {
        if (millis > 0) return label(millis);
        return millis < -1 ? "? s" : null;
    }

    /** Whether the badge shows a reading: the switch on and a player in the theatre. */
    private static boolean shows(View view) {
        return Settings.isEnabled(KEY) && inTheatre(view);
    }

    private static boolean inTheatre(View view) {
        if (theatreId == -1) {
            Context context = view.getContext();
            theatreId = context.getResources().getIdentifier("theatre_root_container", "id", context.getPackageName());
        }
        if (theatreId == 0) return false;
        for (ViewParent parent = view.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (((View) parent).getId() == theatreId) return true;
        }
        return false;
    }

    private static int dp(Context context, float value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    /** The small pill on the player. Polls while attached to a window. */
    private static final class Badge extends TextView implements Runnable {
        WeakReference<Object> presenter;
        private boolean polling;

        Badge(Context context, Object presenter) {
            super(context);
            this.presenter = new WeakReference<>(presenter);
            setTag(TAG);
            setTextColor(Color.WHITE);
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            int horizontal = dp(context, 8);
            int vertical = dp(context, 3);
            setPadding(horizontal, vertical, horizontal, vertical);
            GradientDrawable background = new GradientDrawable();
            background.setColor(0x99000000);
            background.setCornerRadius(dp(context, 12));
            setBackground(background);
            setVisibility(GONE);
            setClickable(true);
            setContentDescription("Latency behind live. Tap to jump to live.");
            setOnClickListener(view -> jump());
        }

        @Override
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            if (!polling) {
                polling = true;
                MAIN.post(this);
            }
        }

        @Override
        protected void onDetachedFromWindow() {
            polling = false;
            MAIN.removeCallbacks(this);
            super.onDetachedFromWindow();
        }

        @Override
        public void run() {
            if (!polling) return;
            try {
                Object player = presenter.get();
                String text = player == null ? null : text(latencyMillis(player));
                if (text != null && shows(this)) {
                    setText(text);
                    setVisibility(VISIBLE);
                } else if (getVisibility() != GONE) {
                    setVisibility(GONE);
                }
            } catch (RuntimeException e) {
                setVisibility(GONE);
                Logger.d("latency: " + e);
            }
            MAIN.postDelayed(this, TICK_MS);
        }

        private void jump() {
            Object player = presenter.get();
            if (player == null || !Settings.isEnabled(KEY)) return;
            try {
                Logger.d("latency: jump to live from " + latencyMillis(player) + " ms");
                retry(player);
                performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
                Toast.makeText(getContext().getApplicationContext(), "Jumping to live", Toast.LENGTH_SHORT).show();
            } catch (RuntimeException e) {
                Logger.d("latency: jump failed: " + e);
            }
        }
    }

    /** Replaced at patch time: the presenter's player's live latency in milliseconds, or 0 or less without one. */
    private static int latencyMillis(Object presenter) {
        return 0;
    }

    /** Replaced at patch time: the presenter's Retry, called as Twitch's error screen calls it, (0, true). */
    private static void retry(Object presenter) {
    }
}
