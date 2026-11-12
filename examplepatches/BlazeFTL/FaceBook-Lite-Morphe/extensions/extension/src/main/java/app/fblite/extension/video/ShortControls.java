package app.fblite.extension.video;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Build;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.MediaController;
import android.widget.SeekBar;

import java.lang.ref.WeakReference;
import java.util.Locale;

import app.fblite.extension.settings.MorpheLog;
import app.fblite.extension.settings.MorpheSettings;

/**
 * Facebook Lite gives a seek bar and the back / forward 10 second buttons only to videos of a minute or more. This
 * draws the same controls over reels and full screen videos that are shorter: a seek bar along the bottom of the
 * video, and, while the video is paused or for a moment after a touch, back 10, play / pause and forward 10 in the
 * middle. It talks to the video's own player (MediaPlayerControl), so seeking is the app's own seeking.
 *
 * The views sit on the window's decor view like the download button, and are hidden while a comment sheet or
 * another list is drawn over the video.
 */
final class ShortControls {
    /** Videos at least this long already have the app's own controls. */
    private static final int MAX_MS = 60_000;
    private static final int SKIP_MS = 10_000;
    private static final long TICK_MS = 50;
    private static final long ROW_HOLD_MS = 3000;
    private static final long PAUSE_DEBOUNCE_MS = 150;
    private static final long COVER_CHECK_MS = 150;
    private static final float REEL_ASPECT = 1.5f;

    private static WeakReference<Activity> owner = new WeakReference<>(null);
    private static WeakReference<View> target = new WeakReference<>(null);
    private static Bar bar;
    private static Glyph back;
    private static Glyph toggle;
    private static Glyph forward;
    private static Glyph timerPill;
    private static boolean shown;
    private static boolean ticking;
    private static boolean rowShown;
    private static long pausedSince;
    private static long touchedAt;
    private static long coverCheckedAt;
    private static boolean covered;
    private static int lastDuration;
    private static WeakReference<View> lastDurationFor = new WeakReference<>(null);
    private static String lastReason = "";
    private static final Rect FRAME = new Rect();
    private static final Overlay.Probe PROBE_MID = new Overlay.Probe();
    private static final Overlay.Probe PROBE_BAR = new Overlay.Probe();
    private static final Rect RECT = new Rect();
    private static final int[] LOCATION = new int[2];

    private ShortControls() {
    }

    /** Called from the scan with the video on screen (playing, or paused), or null when there is none. */
    static void update(Activity activity, View video) {
        try {
            String why = video == null ? null : notEligible(activity, video);
            if (video == null || why != null) {
                if (why != null) logReason(why);
                hide();
                return;
            }
            if (owner.get() != activity || bar == null) create(activity);
            target = new WeakReference<>(video);
            if (!refresh()) {
                logReason(lastReason);
                hide();
                return;
            }
            if (!shown) {
                shown = true;
                if (MorpheLog.enabled()) MorpheLog.log("controls", "Shown for " + Overlay.describe(video));
            }
            if (!ticking) {
                ticking = true;
                VideoFeatures.MAIN.postDelayed(TICK, TICK_MS);
            }
        } catch (Throwable t) {
            hide();
            VideoFeatures.log("Short video controls failed", t);
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
                VideoFeatures.log("Short video controls failed", t);
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
        if (bar != null) {
            bar.setVisibility(View.GONE);
            back.setVisibility(View.GONE);
            toggle.setVisibility(View.GONE);
            forward.setVisibility(View.GONE);
            timerPill.setVisibility(View.GONE);
        }
        if (shown && MorpheLog.enabled()) MorpheLog.log("controls", "Hidden");
        shown = false;
        rowShown = false;
        pausedSince = 0;
        if (!covered) {
            PROBE_MID.reset();
            PROBE_BAR.reset();
        }
    }

    static void hideNow() {
        hide();
        covered = false;
        coverCheckedAt = 0;
        PROBE_MID.reset();
        PROBE_BAR.reset();
    }

    static void forget(Activity activity) {
        if (owner.get() != activity) return;
        hideNow();
        owner = new WeakReference<>(null);
        target = new WeakReference<>(null);
        bar = null;
        back = null;
        toggle = null;
        forward = null;
        timerPill = null;
    }

    // ------------------------------------------------------------------------------------ state

    /** The video's length; the last good value is kept while the player reports none (loading, after a seek). */
    private static int durationOf(MediaController.MediaPlayerControl player, View video) {
        int duration = 0;
        try {
            duration = player.getDuration();
        } catch (Throwable t) {
            // keep 0
        }
        if (duration > 0) {
            lastDuration = duration;
            lastDurationFor = new WeakReference<>(video);
            return duration;
        }
        return lastDurationFor.get() == video ? lastDuration : 0;
    }

    private static boolean fail(String reason) {
        lastReason = reason;
        return false;
    }

    private static void logReason(String reason) {
        if (MorpheLog.enabled() && !reason.equals(lastLogged)) {
            lastLogged = reason;
            MorpheLog.log("controls", "Not shown: " + reason);
        }
    }

    private static String lastLogged = "";
    private static WeakReference<View> cornerPausedFor = new WeakReference<>(null);

    private static MediaController.MediaPlayerControl playerOf(View video) {
        Object player = VideoFeatures.playerOf(video);
        return player instanceof MediaController.MediaPlayerControl ? (MediaController.MediaPlayerControl) player : null;
    }

    /** A reel, or a video that fills the screen, whose length is under a minute. Null when it is, else why not. */
    private static String notEligible(Activity activity, View video) {
        MediaController.MediaPlayerControl player = playerOf(video);
        if (player == null) return "no player";
        if (video.getWidth() <= 0 || video.getHeight() <= 0) return "video has no size";
        int duration = durationOf(player, video);
        if (duration <= 0) return "no duration yet";
        if (duration >= MAX_MS) return "video is " + duration / 1000 + " s, the app has its own controls";
        View decor = activity.getWindow().getDecorView();
        boolean tall = video.getHeight() >= video.getWidth() * REEL_ASPECT;
        boolean full = decor.getHeight() > 0 && video.getHeight() >= decor.getHeight() * 0.8f;
        return tall || full ? null : "not a reel or full screen video (" + video.getWidth() + "x" + video.getHeight() + ")";
    }

    private static boolean mostlyVisible(View video) {
        return video.getHeight() > 0 && video.getGlobalVisibleRect(RECT) && RECT.height() >= video.getHeight() * 0.5f;
    }

    /**
     * Facebook Lite has its own controls in the video's layout: R.id.video_player_controls holds
     * skip_backward_icon, video_play_icon and skip_forward_icon, and a SeekBar with a time label sits at the bottom.
     * They show and hide by themselves (on a tap, on pause), and for short videos they may be missing or late. Ours
     * only fill in what the app's own are not showing at that moment, so the two never overlap.
     */
    private static final class Native {
        View back;
        View play;
        View forward;
        SeekBar seek;
    }

    private static WeakReference<View> nativeFor = new WeakReference<>(null);
    private static final Native NATIVE = new Native();
    private static long lookedUpAt;

    private static int idOf(Activity activity, String name) {
        try {
            return activity.getResources().getIdentifier(name, "id", activity.getPackageName());
        } catch (Throwable t) {
            return 0;
        }
    }

    private static String idName(View view) {
        int id = view.getId();
        if (id == View.NO_ID) return "-";
        try {
            return view.getResources().getResourceEntryName(id);
        } catch (Throwable t) {
            return "?";
        }
    }

    /** One line per view drawn in the bottom right of the reel (the speaker, the 3 dot button, the app's mute view). */
    private static void logCorner(View video, String when) {
        if (!MorpheLog.enabled()) return;
        try {
            View pager = FeedItems.pagerOf(video);
            View item = pager != null ? FeedItems.childOf(pager, video) : null;
            if (item == null) item = video;
            video.getLocationInWindow(LOCATION);
            int left = LOCATION[0] + Math.round(video.getWidth() * 0.5f);
            int top = LOCATION[1] + Math.round(video.getHeight() * 0.85f);
            int bottom = LOCATION[1] + video.getHeight() + 240;
            StringBuilder out = new StringBuilder();
            int[] count = {0};
            walkCorner(item, 0, left, top, bottom, out, count);
            MorpheLog.log("controls", "Corner views " + when + " (" + count[0] + "):" + out);
        } catch (Throwable t) {
            VideoFeatures.log("Corner log failed", t);
        }
    }

    private static void walkCorner(View view, int depth, int left, int top, int bottom, StringBuilder out, int[] count) {
        if (depth > 16 || count[0] >= 40) return;
        if (view.getWidth() > 0 && view.getHeight() > 0 && view.getVisibility() != View.GONE) {
            view.getLocationInWindow(LOCATION);
            int cx = LOCATION[0] + view.getWidth() / 2;
            int cy = LOCATION[1] + view.getHeight() / 2;
            boolean small = view.getWidth() < 400 && view.getHeight() < 400;
            if (small && cx >= left && cy >= top && cy <= bottom) {
                count[0]++;
                out.append("\n    ").append(Overlay.describe(view)).append(" id=").append(idName(view))
                        .append(" clickable=").append(view.isClickable()).append(" showing=").append(showing(view))
                        .append(" depth=").append(depth);
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) walkCorner(group.getChildAt(i), depth + 1, left, top, bottom, out, count);
        }
    }

    private static SeekBar findSeekBar(View view, int depth) {
        if (view instanceof SeekBar) return (SeekBar) view;
        if (depth > 8 || !(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            SeekBar found = findSeekBar(group.getChildAt(i), depth + 1);
            if (found != null) return found;
        }
        return null;
    }

    /** Finds the app's controls that belong to this video (looked up again when they are gone). */
    private static Native nativeOf(Activity activity, View video) {
        long now = SystemClock.uptimeMillis();
        boolean missing = NATIVE.play == null && NATIVE.seek == null;
        boolean stale = nativeFor.get() != video || (NATIVE.play != null && !NATIVE.play.isAttachedToWindow())
                || (missing && now - lookedUpAt >= 1000);
        if (!stale) return NATIVE;
        lookedUpAt = now;
        NATIVE.back = null;
        NATIVE.play = null;
        NATIVE.forward = null;
        NATIVE.seek = null;
        nativeFor = new WeakReference<>(video);
        int controls = idOf(activity, "video_player_controls");
        int backId = idOf(activity, "skip_backward_icon");
        int playId = idOf(activity, "video_play_icon");
        int forwardId = idOf(activity, "skip_forward_icon");
        View scope = video;
        for (int level = 0; level < 8 && scope != null; level++) {
            View found = controls != 0 ? scope.findViewById(controls) : null;
            if (found != null) {
                NATIVE.back = backId != 0 ? found.findViewById(backId) : null;
                NATIVE.play = playId != 0 ? found.findViewById(playId) : null;
                NATIVE.forward = forwardId != 0 ? found.findViewById(forwardId) : null;
                NATIVE.seek = findSeekBar(scope, 0);
                break;
            }
            ViewParent parent = scope.getParent();
            scope = parent instanceof View ? (View) parent : null;
        }
        if (MorpheLog.enabled()) {
            MorpheLog.log("controls", "Native controls: back=" + (NATIVE.back != null) + " play=" + (NATIVE.play != null)
                    + " forward=" + (NATIVE.forward != null) + " seek=" + (NATIVE.seek != null));
            logCorner(video, "at lookup");
        }
        return NATIVE;
    }

    /** Shown on screen and not faded out. */
    private static boolean showing(View view) {
        if (view == null || !view.isShown() || view.getWidth() <= 0 || view.getHeight() <= 0) return false;
        float alpha = 1f;
        View v = view;
        while (v != null) {
            alpha *= v.getAlpha();
            ViewParent parent = v.getParent();
            v = parent instanceof View ? (View) parent : null;
        }
        return alpha > 0.3f;
    }

    /** Moves the views onto the video and updates them. False when the controls should not be on screen. */
    private static boolean refresh() {
        Activity activity = owner.get();
        View video = target.get();
        if (activity == null || video == null || bar == null || !video.isAttachedToWindow() || !video.isShown()) return fail("video not on screen");
        MediaController.MediaPlayerControl player = playerOf(video);
        if (player == null) return fail("no player");
        if (!mostlyVisible(video)) return fail("video mostly off screen");
        int duration = durationOf(player, video);
        int position = player.getCurrentPosition();
        boolean playing = player.isPlaying();
        if (duration <= 0 || duration >= MAX_MS) return fail("duration " + duration);

        video.getLocationInWindow(LOCATION);
        int vx = LOCATION[0];
        int vy = LOCATION[1];
        int vw = video.getWidth();
        int vh = video.getHeight();
        Context context = activity;
        View decor = activity.getWindow().getDecorView();

        // The seek bar sits just under the video, clear of the post text and the tags, which are drawn inside the
        // video's bottom edge. It is held above the bottom of the visible window.
        Native app = nativeOf(activity, video);
        decor.getWindowVisibleDisplayFrame(FRAME);
        int contentBottom = FRAME.bottom > 0 ? FRAME.bottom : decor.getHeight();
        int trackY = Math.min(vy + vh + dp(context, 15), contentBottom - dp(context, 10));
        int barHeight = dp(context, 52);
        int barTop = trackY - dp(context, 38);
        float midX = vx + vw / 2f;
        float midY = vy + vh / 2f;
        if (coveredNow(video, midX, midY, trackY)) return fail("covered by another layer");

        boolean appPlay = showing(app.play);
        boolean appSkip = showing(app.back) || showing(app.forward);
        boolean appSeek = showing(app.seek);

        long now = SystemClock.uptimeMillis();
        if (playing) pausedSince = 0;
        else if (pausedSince == 0) pausedSince = now;
        boolean paused = !playing && position > 0 && now - pausedSince >= PAUSE_DEBOUNCE_MS;
        if (paused && cornerPausedFor.get() != video) {
            cornerPausedFor = new WeakReference<>(video);
            logCorner(video, "while paused");
        }
        boolean row = paused || appPlay || appSkip || now - touchedAt < ROW_HOLD_MS || bar.dragging;

        ViewGroup.LayoutParams params = bar.getLayoutParams();
        if (params.width != vw || params.height != barHeight) {
            params.width = vw;
            params.height = barHeight;
            bar.setLayoutParams(params);
        }
        bar.setTranslationX(vx);
        bar.setTranslationY(barTop);
        if (!bar.dragging) bar.set(position, duration);
        bar.invalidate();
        int barVisibility = (!appSeek || bar.dragging) ? View.VISIBLE : View.GONE;
        if (bar.getVisibility() != barVisibility) {
            bar.setVisibility(barVisibility);
            if (barVisibility == View.VISIBLE) bar.bringToFront();
        }

        // Same size and spacing as the app's own buttons: 40 dp and 59 dp, 65.5 dp from the middle.
        int small = dp(context, 40);
        int big = dp(context, 59);
        int offset = Math.round(65.5f * context.getResources().getDisplayMetrics().density);
        float cx = midX;
        float cy = midY;
        if (app.play != null && app.play.getWidth() > 0) {
            app.play.getLocationInWindow(LOCATION);
            cx = LOCATION[0] + app.play.getWidth() / 2f;
            cy = LOCATION[1] + app.play.getHeight() / 2f;
        }
        place(back, cx - offset - small / 2f, cy - small / 2f, small);
        place(toggle, cx - big / 2f, cy - big / 2f, big);
        place(forward, cx + offset - small / 2f, cy - small / 2f, small);
        toggle.setPlaying(playing);
        int skipVisibility = row && !appSkip ? View.VISIBLE : View.GONE;
        int toggleVisibility = row && !appSkip && !appPlay ? View.VISIBLE : View.GONE;
        if (back.getVisibility() != skipVisibility) {
            back.setVisibility(skipVisibility);
            forward.setVisibility(skipVisibility);
            if (skipVisibility == View.VISIBLE) {
                back.bringToFront();
                forward.bringToFront();
            }
        }
        if (toggle.getVisibility() != toggleVisibility) {
            toggle.setVisibility(toggleVisibility);
            if (toggleVisibility == View.VISIBLE) toggle.bringToFront();
        }
        // The time goes in the top left corner of the video: the bottom row holds the caption and the 3 dot button.
        int margin = dp(context, 16);
        int rowSize = dp(context, 40);
        int pillWidth = dp(context, 104);
        int pillHeight = dp(context, 30);
        ViewGroup.LayoutParams pillParams = timerPill.getLayoutParams();
        if (pillParams.width != pillWidth || pillParams.height != pillHeight) {
            pillParams.width = pillWidth;
            pillParams.height = pillHeight;
            timerPill.setLayoutParams(pillParams);
        }
        timerPill.setTranslationX(vx + margin);
        timerPill.setTranslationY(vy + margin + (rowSize - pillHeight) / 2f);
        timerPill.setLabel(time(bar.position) + " / " + time(duration));
        int pillVisibility = (paused || bar.dragging || now - touchedAt < ROW_HOLD_MS) && !appSeek ? View.VISIBLE : View.GONE;
        if (timerPill.getVisibility() != pillVisibility) {
            timerPill.setVisibility(pillVisibility);
            if (pillVisibility == View.VISIBLE) timerPill.bringToFront();
        }
        rowShown = row;
        return true;
    }

    private static void place(View view, float x, float y, int size) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params.width != size || params.height != size) {
            params.width = size;
            params.height = size;
            view.setLayoutParams(params);
        }
        view.setTranslationX(x);
        view.setTranslationY(y);
    }

    /**
     * True while a large list that is not the video's own (the comment sheet's comments, a menu) is drawn over the
     * middle of the video or over the bar. Checked every 150 ms.
     */
    private static boolean coveredNow(View video, float midX, float midY, float barY) {
        long now = SystemClock.uptimeMillis();
        if (now - coverCheckedAt < COVER_CHECK_MS) return covered;
        coverCheckedAt = now;
        boolean result = false;
        try {
            Activity activity = owner.get();
            if (activity != null && MorpheSettings.isEnabled(activity, MorpheSettings.HIDE_OVER_COMMENTS)) {
                View pager = FeedItems.pagerOf(video);
                boolean mid = PROBE_MID.covering(video, pager, midX, midY) != null;
                boolean low = PROBE_BAR.covering(video, pager, midX, barY) != null;
                result = mid || low;
            }
        } catch (Throwable t) {
            VideoFeatures.log("Short controls cover check failed", t);
        }
        if (result != covered) {
            covered = result;
            if (MorpheLog.enabled()) MorpheLog.log("controls", result ? "Covered by another layer" : "Uncovered");
        }
        return covered;
    }

    // ------------------------------------------------------------------------------------ actions

    private static void seekTo(int milliseconds) {
        View video = target.get();
        if (video == null) return;
        MediaController.MediaPlayerControl player = playerOf(video);
        if (player == null) return;
        try {
            int duration = player.getDuration();
            player.seekTo(Math.max(0, Math.min(milliseconds, Math.max(0, duration - 100))));
        } catch (Throwable t) {
            VideoFeatures.log("Seek failed", t);
        }
    }

    private static void onGlyph(int kind) {
        View video = target.get();
        if (video == null) return;
        MediaController.MediaPlayerControl player = playerOf(video);
        if (player == null) return;
        touchedAt = SystemClock.uptimeMillis();
        try {
            if (kind == Glyph.BACK) {
                seekTo(player.getCurrentPosition() - SKIP_MS);
            } else if (kind == Glyph.FORWARD) {
                seekTo(player.getCurrentPosition() + SKIP_MS);
            } else if (player.isPlaying()) {
                player.pause();
            } else {
                player.start();
            }
        } catch (Throwable t) {
            VideoFeatures.log("Control tap failed", t);
        }
    }

    // ------------------------------------------------------------------------------------ views

    private static void create(Activity activity) {
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        if (bar != null) {
            decor.removeView(bar);
            decor.removeView(back);
            decor.removeView(toggle);
            decor.removeView(forward);
            decor.removeView(timerPill);
        }
        bar = Overlay.mark(new Bar(activity));
        back = Overlay.mark(new Glyph(activity, Glyph.BACK));
        toggle = Overlay.mark(new Glyph(activity, Glyph.TOGGLE));
        forward = Overlay.mark(new Glyph(activity, Glyph.FORWARD));
        timerPill = Overlay.mark(new Glyph(activity, Glyph.TIMER));
        back.setContentDescription("Back 10 seconds");
        toggle.setContentDescription("Play or pause");
        forward.setContentDescription("Forward 10 seconds");
        View[] all = {bar, back, toggle, forward, timerPill};
        for (View view : all) {
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(dp(activity, 40), dp(activity, 40),
                    Gravity.TOP | Gravity.START);
            view.setVisibility(View.GONE);
            decor.addView(view, params);
        }
        owner = new WeakReference<>(activity);
        shown = false;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static String time(int milliseconds) {
        int seconds = Math.max(0, milliseconds / 1000);
        return String.format(Locale.US, "%d:%02d", seconds / 60, seconds % 60);
    }

    /** The seek bar: a thin track with a thumb, the time above it while paused or touched. */
    private static final class Bar extends View {
        private final Paint shade = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint track = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint thumb = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint label = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final float density;
        private int position;
        private int duration;
        boolean dragging;

        Bar(Context context) {
            super(context);
            density = context.getResources().getDisplayMetrics().density;
            shade.setColor(0x40000000);
            track.setColor(0x80FFFFFF);
            fill.setColor(0xFFFFFFFF);
            thumb.setColor(0xFFFFFFFF);
            label.setColor(0xFFFFFFFF);
            label.setTextSize(13f * density);
            label.setTypeface(Typeface.DEFAULT_BOLD);
            label.setShadowLayer(3f * density, 0f, 0f, 0xB0000000);
            setClickable(true);
        }

        void set(int positionMs, int durationMs) {
            position = positionMs;
            duration = durationMs;
        }

        private float fraction() {
            return duration <= 0 ? 0f : Math.max(0f, Math.min(1f, position / (float) duration));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float pad = 12f * density;
            float left = pad;
            float right = getWidth() - pad;
            float cy = 38f * density;
            float height = (dragging ? 4f : 3f) * density;
            rect.set(left, cy - height / 2f - density, right, cy + height / 2f + density);
            canvas.drawRoundRect(rect, height, height, shade);
            rect.set(left, cy - height / 2f, right, cy + height / 2f);
            canvas.drawRoundRect(rect, height / 2f, height / 2f, track);
            float x = left + (right - left) * fraction();
            rect.set(left, cy - height / 2f, x, cy + height / 2f);
            canvas.drawRoundRect(rect, height / 2f, height / 2f, fill);
            canvas.drawCircle(x, cy, (dragging ? 8f : 5f) * density, thumb);
        }

        private void moveTo(float x) {
            float pad = 12f * density;
            float width = Math.max(1f, getWidth() - 2f * pad);
            float fraction = Math.max(0f, Math.min(1f, (x - pad) / width));
            position = Math.round(duration * fraction);
            invalidate();
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    if (Math.abs(event.getY() - 38f * density) > 16f * density) return false;
                    dragging = true;
                    touchedAt = SystemClock.uptimeMillis();
                    if (getParent() != null) getParent().requestDisallowInterceptTouchEvent(true);
                    moveTo(event.getX());
                    return true;
                case MotionEvent.ACTION_MOVE:
                    if (dragging) {
                        touchedAt = SystemClock.uptimeMillis();
                        moveTo(event.getX());
                    }
                    return true;
                case MotionEvent.ACTION_UP:
                    if (dragging) {
                        moveTo(event.getX());
                        seekTo(position);
                    }
                    dragging = false;
                    touchedAt = SystemClock.uptimeMillis();
                    invalidate();
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    dragging = false;
                    invalidate();
                    return true;
                default:
                    return true;
            }
        }
    }

    /** One round button of the middle row: back 10, play / pause, or forward 10. */
    private static final class Glyph extends View {
        static final int BACK = 0;
        static final int TOGGLE = 1;
        static final int FORWARD = 2;
        static final int TIMER = 4;

        private final int kind;
        private final Paint disc = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint solid = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint digits = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF arc = new RectF();
        private final RectF rectF = new RectF();
        private boolean playing;
        private String text = "";

        Glyph(Context context, final int kind) {
            super(context);
            this.kind = kind;
            disc.setColor(0x8C000000);
            stroke.setColor(0xFFFFFFFF);
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeCap(Paint.Cap.ROUND);
            solid.setColor(0xFFFFFFFF);
            digits.setColor(0xFFFFFFFF);
            digits.setTextAlign(Paint.Align.CENTER);
            digits.setTypeface(Typeface.DEFAULT_BOLD);
            setClickable(kind != TIMER);
            setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    onGlyph(kind);
                }
            });
        }

        void setLabel(String value) {
            if (text.equals(value)) return;
            text = value;
            invalidate();
        }

        void setPlaying(boolean value) {
            if (playing == value) return;
            playing = value;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            float r = Math.min(getWidth(), getHeight()) / 2f;
            if (kind == TIMER) {
                float radius = getHeight() / 2f;
                rectF.set(0, 0, getWidth(), getHeight());
                canvas.drawRoundRect(rectF, radius, radius, disc);
                digits.setTextSize(getHeight() * 0.5f);
                canvas.drawText(text, cx, cy + getHeight() * 0.18f, digits);
                return;
            }
            canvas.drawCircle(cx, cy, r, disc);
            if (kind == TOGGLE) {
                path.reset();
                if (playing) {
                    canvas.drawRoundRect(cx - 0.32f * r, cy - 0.36f * r, cx - 0.1f * r, cy + 0.36f * r, 0.05f * r, 0.05f * r, solid);
                    canvas.drawRoundRect(cx + 0.1f * r, cy - 0.36f * r, cx + 0.32f * r, cy + 0.36f * r, 0.05f * r, 0.05f * r, solid);
                } else {
                    path.moveTo(cx - 0.22f * r, cy - 0.4f * r);
                    path.lineTo(cx - 0.22f * r, cy + 0.4f * r);
                    path.lineTo(cx + 0.44f * r, cy);
                    path.close();
                    canvas.drawPath(path, solid);
                }
                return;
            }
            drawSkip(canvas, cx, cy, r, kind == FORWARD);
        }

        private void drawSkip(Canvas canvas, float cx, float cy, float r, boolean clockwise) {
            float radius = r * 0.55f;
            arc.set(cx - radius, cy - radius, cx + radius, cy + radius);
            stroke.setStrokeWidth(r * 0.12f);
            float start = -45f;
            float sweep = 280f;
            canvas.save();
            if (!clockwise) canvas.scale(-1f, 1f, cx, cy);
            canvas.drawArc(arc, start, sweep, false, stroke);
            double angle = Math.toRadians(start + sweep);
            float px = cx + radius * (float) Math.cos(angle);
            float py = cy + radius * (float) Math.sin(angle);
            float dx = (float) -Math.sin(angle);
            float dy = (float) Math.cos(angle);
            float s = r * 0.3f;
            float bx = px - dx * s * 0.3f;
            float by = py - dy * s * 0.3f;
            path.reset();
            path.moveTo(px + dx * s * 0.9f, py + dy * s * 0.9f);
            path.lineTo(bx - dy * s * 0.8f, by + dx * s * 0.8f);
            path.lineTo(bx + dy * s * 0.8f, by - dx * s * 0.8f);
            path.close();
            canvas.drawPath(path, solid);
            canvas.restore();
            digits.setTextSize(r * 0.52f);
            canvas.drawText("10", cx, cy + r * 0.18f, digits);
        }
    }
}
