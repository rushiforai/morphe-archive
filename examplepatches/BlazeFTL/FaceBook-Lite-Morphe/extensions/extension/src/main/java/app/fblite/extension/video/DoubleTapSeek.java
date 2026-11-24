package app.fblite.extension.video;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.MediaController;

import java.lang.ref.WeakReference;

import app.fblite.extension.settings.MorpheLog;
import app.fblite.extension.settings.MorpheSettings;

/**
 * Double tap the left side of a reel or full screen video to go back 10 seconds, the right side to go forward 10
 * seconds. Two see-through views sit over the video's left and right sides. They only look at touches: a first tap
 * is passed to the app as usual, and the second tap of a pair is taken here, so the app does not see it. The app
 * would turn the first tap into a play / pause about 0.3 s later (its single tap is only confirmed when no second tap
 * follows), so a cancel is sent to the video's own touch handler with the second tap, and the play state is checked
 * and put back for a second as a second line. Further taps within 0.4 s keep seeking, one step each. The feedback is
 * the app's own look: one small dark round "back 10" or "forward 10" icon at the same place as the app's own
 * buttons (65.5 dp from the middle), for half a second, and none while the app's own icons or ours are on screen.
 * The middle of the video, the Like column (lower right) and the caption row are left alone. The views are hidden while a comment
 * sheet or another layer is open over the video.
 */
final class DoubleTapSeek {
    private static final int SKIP_MS = 10_000;
    private static final long TICK_MS = 100;
    private static final long DOUBLE_MS = 280;
    private static final long CHAIN_MS = 400;
    private static final long COVER_CHECK_MS = 200;
    private static final float REEL_ASPECT = 1.5f;
    private static final long FLASH_HOLD_MS = 350;
    private static final long FLASH_FADE_MS = 150;
    private static final long[] RESTORE_AT = {120, 300, 520, 800, 1100};

    private static WeakReference<Activity> owner = new WeakReference<>(null);
    private static WeakReference<View> target = new WeakReference<>(null);
    private static Zone left;
    private static Zone right;
    private static View flashBack;
    private static View flashForward;
    private static boolean shown;
    private static boolean ticking;
    private static boolean covered;
    private static boolean playingAtFirstTap;
    private static long coverCheckedAt;
    private static final Overlay.Probe PROBE = new Overlay.Probe();
    private static final Rect RECT = new Rect();
    private static final int[] LOCATION = new int[2];

    private DoubleTapSeek() {
    }

    /** Called from the scan with the video on screen (playing or paused), or null when there is none. */
    static void update(Activity activity, View video) {
        try {
            if (video == null || !eligible(activity, video)) {
                hide();
                return;
            }
            if (owner.get() != activity || left == null) create(activity);
            target = new WeakReference<>(video);
            if (!refresh()) {
                hide();
                return;
            }
            if (!shown) {
                shown = true;
                if (MorpheLog.enabled()) MorpheLog.log("doubletap", "Zones on for " + Overlay.describe(video));
            }
            if (!ticking) {
                ticking = true;
                VideoFeatures.MAIN.postDelayed(TICK, TICK_MS);
            }
        } catch (Throwable t) {
            hide();
            VideoFeatures.log("Double tap seek failed", t);
        }
    }

    private static final Runnable TICK = new Runnable() {
        @Override
        public void run() {
            ticking = false;
            if (!shown) return;
            boolean ok;
            try {
                ok = refresh();
            } catch (Throwable t) {
                ok = false;
                VideoFeatures.log("Double tap seek failed", t);
            }
            if (!ok) {
                hide();
                return;
            }
            ticking = true;
            VideoFeatures.MAIN.postDelayed(this, TICK_MS);
        }
    };

    static void hide() {
        VideoFeatures.MAIN.removeCallbacks(TICK);
        ticking = false;
        if (left != null) {
            left.setVisibility(View.GONE);
            right.setVisibility(View.GONE);
        }
        hideFlash();
        if (shown && MorpheLog.enabled()) MorpheLog.log("doubletap", "Zones off");
        shown = false;
        if (!covered) PROBE.reset();
    }

    static void hideNow() {
        hide();
        covered = false;
        coverCheckedAt = 0;
        PROBE.reset();
    }

    static void forget(Activity activity) {
        if (owner.get() != activity) return;
        hideNow();
        owner = new WeakReference<>(null);
        target = new WeakReference<>(null);
        left = null;
        right = null;
        flashBack = null;
        flashForward = null;
    }

    // ------------------------------------------------------------------------------------ state

    private static MediaController.MediaPlayerControl playerOf(View video) {
        Object player = VideoFeatures.playerOf(video);
        return player instanceof MediaController.MediaPlayerControl ? (MediaController.MediaPlayerControl) player : null;
    }

    /** A reel, or a video that fills the screen. */
    private static boolean eligible(Activity activity, View video) {
        if (playerOf(video) == null || video.getWidth() <= 0 || video.getHeight() <= 0) return false;
        View decor = activity.getWindow().getDecorView();
        boolean tall = video.getHeight() >= video.getWidth() * REEL_ASPECT;
        boolean full = decor.getHeight() > 0 && video.getHeight() >= decor.getHeight() * 0.8f;
        return tall || full;
    }

    private static boolean refresh() {
        Activity activity = owner.get();
        View video = target.get();
        if (activity == null || video == null || left == null || !video.isAttachedToWindow() || !video.isShown()) return false;
        if (video.getHeight() <= 0 || !video.getGlobalVisibleRect(RECT) || RECT.height() < video.getHeight() * 0.5f) return false;
        video.getLocationInWindow(LOCATION);
        int vx = LOCATION[0];
        int vy = LOCATION[1];
        int vw = video.getWidth();
        int vh = video.getHeight();
        if (coveredNow(activity, video, vx + vw / 2f, vy + vh / 2f)) return false;

        // Left 40 % of the width, right 60 to 100 %; from 12 to 75 % of the height (the caption and Follow row are
        // below). The right zone does not take touches in the Like column: from 82 % of the width and from 58 % of
        // the height down (the download, Like and Comment buttons start at about 64 %).
        int top = vy + Math.round(vh * 0.12f);
        int height = Math.round(vh * 0.63f);
        place(left, vx, top, Math.round(vw * 0.4f), height);
        place(right, vx + Math.round(vw * 0.6f), top, vw - Math.round(vw * 0.6f), height);
        right.exclude(Math.round(vw * 0.22f), Math.round(vh * 0.46f));
        if (left.getVisibility() != View.VISIBLE) {
            left.setVisibility(View.VISIBLE);
            right.setVisibility(View.VISIBLE);
            left.bringToFront();
            right.bringToFront();
        }
        return true;
    }

    private static void place(View view, int x, int y, int width, int height) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params.width != width || params.height != height) {
            params.width = width;
            params.height = height;
            view.setLayoutParams(params);
        }
        view.setTranslationX(x);
        view.setTranslationY(y);
    }

    private static boolean coveredNow(Activity activity, View video, float x, float y) {
        long now = SystemClock.uptimeMillis();
        if (now - coverCheckedAt < COVER_CHECK_MS) return covered;
        coverCheckedAt = now;
        boolean result = false;
        try {
            if (MorpheSettings.isEnabled(activity, MorpheSettings.HIDE_OVER_COMMENTS)) {
                result = PROBE.covering(video, FeedItems.pagerOf(video), x, y) != null;
            }
        } catch (Throwable t) {
            VideoFeatures.log("Double tap cover check failed", t);
        }
        if (result != covered) {
            covered = result;
            if (MorpheLog.enabled()) MorpheLog.log("doubletap", result ? "Covered by another layer" : "Uncovered");
        }
        return covered;
    }

    // ------------------------------------------------------------------------------------ actions

    /** Remembers whether the video was playing when a first tap arrived, before the app reacts to it. */
    private static void noteFirstTap() {
        View video = target.get();
        MediaController.MediaPlayerControl player = video == null ? null : playerOf(video);
        try {
            if (player != null) playingAtFirstTap = player.isPlaying();
        } catch (Throwable t) {
            // keep the old value
        }
    }

    /**
     * Cancels the touch the app's gesture detector has seen (the first tap of the pair). Without this it confirms
     * that tap as a single tap about 0.3 s after it and pauses or resumes the video.
     */
    private static void cancelAppTap() {
        View video = target.get();
        if (video == null) return;
        long now = SystemClock.uptimeMillis();
        MotionEvent cancel = MotionEvent.obtain(now, now, MotionEvent.ACTION_CANCEL, 0f, 0f, 0);
        try {
            video.dispatchTouchEvent(cancel);
        } catch (Throwable t) {
            VideoFeatures.log("Double tap cancel failed", t);
        } finally {
            cancel.recycle();
        }
    }

    private static void seek(boolean forward) {
        View video = target.get();
        MediaController.MediaPlayerControl player = video == null ? null : playerOf(video);
        if (player == null) return;
        try {
            int duration = player.getDuration();
            int position = player.getCurrentPosition() + (forward ? SKIP_MS : -SKIP_MS);
            int limit = duration > 0 ? Math.max(0, duration - 100) : Integer.MAX_VALUE;
            player.seekTo(Math.max(0, Math.min(position, limit)));
        } catch (Throwable t) {
            VideoFeatures.log("Double tap seek failed", t);
        }
        flash(forward);
        // Second line: whatever the first tap did to play / pause (the app may act on it a moment late) is put back.
        VideoFeatures.MAIN.removeCallbacks(RESTORE);
        for (long delay : RESTORE_AT) VideoFeatures.MAIN.postDelayed(RESTORE, delay);
    }

    private static final Runnable RESTORE = new Runnable() {
        @Override
        public void run() {
            View video = target.get();
            MediaController.MediaPlayerControl player = video == null ? null : playerOf(video);
            if (player == null) return;
            try {
                if (player.isPlaying() != playingAtFirstTap) {
                    if (MorpheLog.enabled()) MorpheLog.log("doubletap", "Play state put back to " + (playingAtFirstTap ? "playing" : "paused"));
                    if (playingAtFirstTap) player.start();
                    else player.pause();
                }
            } catch (Throwable t) {
                VideoFeatures.log("Double tap restore failed", t);
            }
        }
    };

    // ------------------------------------------------------------------------------------ feedback

    /** One round "back 10" / "forward 10" icon where the app draws its own, unless an icon pair is already showing. */
    private static void flash(boolean forward) {
        Activity activity = owner.get();
        View video = target.get();
        View glyph = forward ? flashForward : flashBack;
        View other = forward ? flashBack : flashForward;
        if (activity == null || video == null || glyph == null) return;
        try {
            if (other != null) {
                other.animate().cancel();
                other.setVisibility(View.GONE);
            }
            if (ShortControls.skipButtonsShowing(activity, video)) {
                glyph.animate().cancel();
                glyph.setVisibility(View.GONE);
                return;
            }
            float density = activity.getResources().getDisplayMetrics().density;
            int size = Math.round(40f * density);
            int offset = Math.round(65.5f * density);
            video.getLocationInWindow(LOCATION);
            float cx = LOCATION[0] + video.getWidth() / 2f;
            float cy = LOCATION[1] + video.getHeight() / 2f;
            ViewGroup.LayoutParams params = glyph.getLayoutParams();
            if (params.width != size || params.height != size) {
                params.width = size;
                params.height = size;
                glyph.setLayoutParams(params);
            }
            glyph.setTranslationX(cx + (forward ? offset : -offset) - size / 2f);
            glyph.setTranslationY(cy - size / 2f);
            glyph.animate().cancel();
            glyph.setAlpha(1f);
            glyph.setVisibility(View.VISIBLE);
            glyph.bringToFront();
            final View done = glyph;
            glyph.animate().alpha(0f).setStartDelay(FLASH_HOLD_MS).setDuration(FLASH_FADE_MS).withEndAction(new Runnable() {
                @Override
                public void run() {
                    done.setVisibility(View.GONE);
                }
            });
        } catch (Throwable t) {
            VideoFeatures.log("Double tap icon failed", t);
        }
    }

    private static void hideFlash() {
        View[] all = {flashBack, flashForward};
        for (View view : all) {
            if (view == null) continue;
            view.animate().cancel();
            view.setVisibility(View.GONE);
        }
    }

    // ------------------------------------------------------------------------------------ views

    private static void create(Activity activity) {
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        if (left != null) {
            decor.removeView(left);
            decor.removeView(right);
        }
        if (flashBack != null) {
            decor.removeView(flashBack);
            decor.removeView(flashForward);
        }
        left = Overlay.mark(new Zone(activity, false));
        right = Overlay.mark(new Zone(activity, true));
        flashBack = Overlay.mark(ShortControls.newSkipGlyph(activity, false));
        flashForward = Overlay.mark(ShortControls.newSkipGlyph(activity, true));
        View[] all = {left, right, flashBack, flashForward};
        for (View view : all) {
            view.setVisibility(View.GONE);
            decor.addView(view, new FrameLayout.LayoutParams(1, 1, Gravity.TOP | Gravity.LEFT));
        }
        owner = new WeakReference<>(activity);
        shown = false;
    }

    /** One side of the video. Sees touches without taking them, except the second tap of a pair. */
    private static final class Zone extends View {
        private final boolean forward;
        private final float density;
        private long lastDownAt;
        private float lastX;
        private float lastY;
        private long chainUntil;
        private boolean swallowing;
        private int excludeX = Integer.MAX_VALUE;
        private int excludeY = Integer.MAX_VALUE;

        Zone(Context context, boolean forward) {
            super(context);
            this.forward = forward;
            density = context.getResources().getDisplayMetrics().density;
        }

        /** Touches from this x and y (in this view) down and right are not ours: the Like column's buttons. */
        void exclude(int fromX, int fromY) {
            excludeX = fromX;
            excludeY = fromY;
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                if (event.getX() >= excludeX && event.getY() >= excludeY) {
                    swallowing = false;
                    return false;
                }
                long now = event.getEventTime();
                float near = 60f * density;
                boolean pair = lastDownAt != 0 && now - lastDownAt <= DOUBLE_MS
                        && Math.abs(event.getX() - lastX) < near && Math.abs(event.getY() - lastY) < near;
                if (pair || now < chainUntil) {
                    lastDownAt = 0;
                    chainUntil = now + CHAIN_MS;
                    swallowing = true;
                    if (pair) cancelAppTap();
                    seek(forward);
                    return true;
                }
                lastDownAt = now;
                lastX = event.getX();
                lastY = event.getY();
                noteFirstTap();
                return false;
            }
            if (swallowing) {
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) swallowing = false;
                return true;
            }
            return false;
        }
    }
}
