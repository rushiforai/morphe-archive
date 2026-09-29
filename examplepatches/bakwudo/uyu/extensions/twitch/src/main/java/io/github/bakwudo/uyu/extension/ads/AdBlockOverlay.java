package io.github.bakwudo.uyu.extension.ads;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.bakwudo.uyu.extension.Utils;

/**
 * An ad break stitched into the stream of one player: the player is muted and its video is
 * covered with a black screen that says "Ad blocked" and the seconds left.
 * <p>
 * The break ends when the stream says it plays the live broadcast again, or a few seconds after
 * its expected length, whichever comes first. The player stays muted without the black screen if
 * its view is not found, for example while only the audio plays.
 * <p>
 * Used on the main thread only.
 */
final class AdBlockOverlay {
    static final String VIEW_TAG = "uyu_ad_blocked";

    /** Time a break lasts after its expected end, if the stream does not end it. */
    private static final long END_GRACE_MILLIS = 5000;
    private static final long TICK_MILLIS = 250;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());
    /** The current break of each player. */
    private static final Map<Object, AdBlockOverlay> breaks = new WeakHashMap<>();

    private final WeakReference<Object> player;
    private final Runnable tick = this::tick;
    private long endTime;
    private View view;
    private TextView remaining;

    private AdBlockOverlay(Object player) {
        this.player = new WeakReference<>(player);
    }

    /**
     * Starts an ad break for a stitched ad, or extends the player's current one.
     *
     * @param renderView     The view the player draws the video into, or null.
     * @param player         The player, muted until the break ends.
     * @param adSeconds      Length of the ad that starts.
     * @param adBreakSeconds Length of the whole ad break.
     */
    static void show(View renderView, Object player, float adSeconds, float adBreakSeconds) {
        long now = SystemClock.uptimeMillis();
        AdBlockOverlay adBreak = breaks.get(player);
        if (adBreak == null) {
            adBreak = new AdBlockOverlay(player);
            breaks.put(player, adBreak);
            float seconds = adBreakSeconds > 0 ? adBreakSeconds : adSeconds;
            adBreak.endTime = now + (long) (seconds * 1000);
            PlayerEvents.setMuted(player, true);
        } else {
            adBreak.endTime = Math.max(adBreak.endTime, now + (long) (adSeconds * 1000));
        }
        adBreak.cover(renderView);
        adBreak.tick();
        Utils.logInfo(String.format(Locale.ROOT, "Ad blocked: %.1f s ad, %.1f s break",
                adSeconds, adBreakSeconds));
    }

    /**
     * Ends the player's ad break, if it has one.
     */
    static void end(Object player) {
        AdBlockOverlay adBreak = breaks.remove(player);
        if (adBreak != null) adBreak.finish();
    }

    /**
     * Covers the video with the black screen, in the player's view (player_view_delegate).
     */
    private void cover(View renderView) {
        ViewGroup container = findPlayerView(renderView);
        if (container == null) {
            if (view == null) Utils.logInfo("Ad blocked, but the player view was not found. The player is muted.");
            return;
        }
        if (view != null && view.getParent() == container) return;
        removeView();

        view = createView(container.getContext());
        // Above the video, below the player's error, ad and caption views, and below the
        // controls, which are in another container on top of the player. Danmaku comments
        // added earlier stay above it.
        container.addView(view, Math.min(1, container.getChildCount()), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
    }

    private View createView(Context context) {
        FrameLayout layout = new FrameLayout(context);
        layout.setTag(VIEW_TAG);
        layout.setBackgroundColor(Color.BLACK);

        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setGravity(Gravity.CENTER_HORIZONTAL);

        TextView title = new TextView(context);
        title.setText("Ad blocked");
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        texts.addView(title);

        remaining = new TextView(context);
        remaining.setTextColor(0xB3FFFFFF);
        remaining.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        texts.addView(remaining);

        // Touches go to the player below, so its controls still show.
        layout.addView(texts, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        return layout;
    }

    private void tick() {
        mainHandler.removeCallbacks(tick);
        long left = endTime - SystemClock.uptimeMillis();
        if (left <= -END_GRACE_MILLIS) {
            Object current = player.get();
            if (current != null) breaks.remove(current);
            finish();
            return;
        }
        if (remaining != null) {
            long seconds = (left + 999) / 1000;
            remaining.setText(seconds > 0 ? "The stream resumes in " + seconds + " s" : "The stream resumes soon");
        }
        mainHandler.postDelayed(tick, TICK_MILLIS);
    }

    private void finish() {
        mainHandler.removeCallbacks(tick);
        Object current = player.get();
        if (current != null) PlayerEvents.setMuted(current, false);
        removeView();
        Utils.logInfo("Ad break ended");
    }

    private void removeView() {
        if (view == null) return;
        ViewParent parent = view.getParent();
        if (parent instanceof ViewGroup group) group.removeView(view);
        view = null;
        remaining = null;
    }

    /**
     * @return The player's view (player_view_delegate) that contains the render view, or the
     * render view's parent if the layout is not as expected.
     */
    private static ViewGroup findPlayerView(View renderView) {
        if (renderView == null || !renderView.isAttachedToWindow()) return null;
        int playerId = Utils.getResourceId(renderView.getContext(), "player_view_delegate", "id");
        for (ViewParent parent = renderView.getParent(); parent instanceof View view; parent = parent.getParent()) {
            if (playerId != 0 && view.getId() == playerId && view instanceof FrameLayout layout) return layout;
        }
        ViewParent parent = renderView.getParent();
        return parent instanceof FrameLayout layout ? layout : null;
    }
}
