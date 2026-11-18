package io.github.sabopura.morphe.extension.twitch.app;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.util.Collections;
import java.util.Locale;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Text;

/** How far a live stream plays behind the broadcast, on the theatre's player. A tap reloads it. */
public final class LatencyBadge {
    public static final String KEY = "latency_badge";
    private static final long TICK_MS = 1000;
    private static final Object TAG = new Object();
    /** Badges that stopped because they had nothing to show; each change that could alter that wakes them. */
    private static final Set<Badge> IDLE = Collections.newSetFromMap(new WeakHashMap<>());

    private LatencyBadge() {
    }

    static void playerView(View view) {
        if (!(view instanceof FrameLayout) || !enabled()) return;
        FrameLayout frame = (FrameLayout) view;
        for (int i = 0; i < frame.getChildCount(); i++) {
            View child = frame.getChildAt(i);
            if (child.getTag() == TAG) {
                ((Badge) child).wake();
                return;
            }
        }
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START);
        int margin = dp(frame.getContext(), 8);
        params.setMargins(margin, margin, margin, margin);
        frame.addView(new Badge(frame.getContext()), params);
    }

    private static boolean enabled() {
        return AppHooks.on(Feature.LATENCY_BADGE, KEY);
    }

    /** A player started, perhaps on live content where a badge had nothing to show. Any thread. */
    public static void playerStarted() {
        synchronized (IDLE) {
            for (Badge badge : IDLE) badge.post(badge);
            IDLE.clear();
        }
    }

    /** Tenths below ten seconds, whole seconds above. */
    static String text(long delayMs) {
        if (delayMs < 10_000) return String.format(Locale.ROOT, "%.1f s", delayMs / 1000.0);
        return delayMs / 1000 + " s";
    }

    static int color(long delayMs) {
        return delayMs < 5_000 ? 0xFF149650 : delayMs < 10_000 ? 0xFFD28714 : 0xFFBE2D37;
    }

    private static int dp(Context context, float value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    private static final class Badge extends TextView implements Runnable, View.OnLayoutChangeListener {
        private final GradientDrawable pill = new GradientDrawable();

        Badge(Context context) {
            super(context);
            setTag(TAG);
            setTextColor(0xFFFFFFFF);
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            int horizontal = dp(context, 8), vertical = dp(context, 3);
            setPadding(horizontal, vertical, horizontal, vertical);
            pill.setCornerRadius(dp(context, 12));
            setBackground(pill);
            setVisibility(GONE);
            setContentDescription(Text.label("ライブからの遅延。タップで再読み込み", "Delay behind live. Tap to reload"));
            setOnClickListener(v -> {
                try {
                    PlayerTools.reload(getContext());
                } catch (RuntimeException | LinkageError e) {
                    Diagnostics.note("app.latency-badge-reload", e);
                }
            });
        }

        void wake() {
            boolean idle;
            synchronized (IDLE) {
                idle = IDLE.remove(this);
            }
            if (idle) post(this);
        }

        @Override
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            if (getParent() instanceof View) ((View) getParent()).addOnLayoutChangeListener(this);
            post(this);
        }

        @Override
        protected void onDetachedFromWindow() {
            if (getParent() instanceof View) ((View) getParent()).removeOnLayoutChangeListener(this);
            synchronized (IDLE) {
                IDLE.remove(this);
            }
            removeCallbacks(this);
            super.onDetachedFromWindow();
        }

        /** Back from the background, or from the settings, where the badge may have been turned on. */
        @Override
        protected void onWindowVisibilityChanged(int visibility) {
            super.onWindowVisibilityChanged(visibility);
            if (visibility == VISIBLE) wake();
        }

        @Override
        public void onWindowFocusChanged(boolean focused) {
            super.onWindowFocusChanged(focused);
            if (focused) wake();
        }

        /** The player grew out of the mini player, or shrank into it. */
        @Override
        public void onLayoutChange(View v, int l, int t, int r, int b, int oldL, int oldT, int oldR, int oldB) {
            if (r - l != oldR - oldL || b - t != oldB - oldT) wake();
        }

        @Override
        public void run() {
            removeCallbacks(this);
            if (!isAttachedToWindow()) return;
            boolean watching = false;
            long delay = -1;
            try {
                watching = watching();
                if (watching && Boolean.TRUE.equals(PlayerTools.live())) delay = PlayerTools.liveDelay();
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("app.latency-badge", e);
            }
            if (delay > 0) {
                setText(text(delay));
                pill.setColor(color(delay));
                setVisibility(VISIBLE);
            } else if (getVisibility() != GONE) {
                setVisibility(GONE);
            }
            if (watching) {
                postDelayed(this, TICK_MS);
            } else {
                synchronized (IDLE) {
                    IDLE.add(this);
                }
            }
        }

        /**
         * Whether a live delay may show soon: on screen with the badge on, in the theatre, not shrunk
         * into the mini player, which the badge would cover, and not playing a VOD.
         */
        private boolean watching() {
            View player = (View) getParent();
            return getWindowVisibility() == VISIBLE && enabled() && player.getWidth() * 2 >= getRootView().getWidth()
                    && ForceLandscape.inTheatre(player) && PlayerTools.vodId().isEmpty();
        }
    }
}
