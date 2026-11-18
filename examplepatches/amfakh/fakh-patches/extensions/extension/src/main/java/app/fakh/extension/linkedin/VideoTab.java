package app.fakh.extension.linkedin;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.Locale;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Extras of the Video tab (a server driven pager of videos): the time of the video above the seek bar, and moving on
 * to the next video when one ends.
 * <p>
 * The video on screen is the one whose player was last told to play (SimpleMediaPlayer.setPlayWhenReady), since the
 * tab prepares the next videos ahead but plays only the visible one.
 */
@SuppressWarnings("unused")
public final class VideoTab {
    static final String SCREEN = "com.linkedin.sdui.flagshipnav.media.VideoTab";
    private static final String TIME_TAG = "fakh_video_tab_time";
    private static final long POLL_MS = 250;

    private static final Handler main = new Handler(Looper.getMainLooper());
    private static WeakReference<Object> playing = new WeakReference<>(null);
    private static WeakReference<Activity> shown = new WeakReference<>(null);
    private static Method position;
    private static Method duration;
    private static final Set<Object> listened = Collections.newSetFromMap(new WeakHashMap<>());

    private VideoTab() {
    }

    /** Injected at the start of SimpleMediaPlayer.setPlayWhenReady(int, boolean, boolean). */
    public static void onPlayWhenReady(Object player, boolean play) {
        if (!play) return;
        playing = new WeakReference<>(player);
        if (listened.add(player)) listen(player);
    }

    /**
     * Listens to the player's own events for the end of a video: the tab plays each video in a loop, and a loop is
     * a position discontinuity with reason 0 (auto transition) inside the same media. This does not depend on the
     * duration the player reports, which can be longer than the video that loops.
     */
    private static void listen(Object player) {
        try {
            Class<?> type = Class.forName("com.linkedin.android.media.player.PlayerEventListener");
            Object listener = Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, args) -> {
                // The player compares and hashes its listeners; null would fail to unbox as a boolean or int.
                if (method.getDeclaringClass() == Object.class) {
                    switch (method.getName()) {
                        case "equals":
                            return proxy == args[0];
                        case "hashCode":
                            return System.identityHashCode(proxy);
                        default:
                            return "VideoTab listener";
                    }
                }
                if (method.getName().equals("onPositionDiscontinuity") && args != null && args.length == 3
                        && Integer.valueOf(0).equals(args[2]) && playing.get() == player) {
                    main.post(VideoTab::onVideoEnded);
                }
                return null;
            });
            player.getClass().getMethod("addPlayerEventListener", type).invoke(player, listener);
        } catch (Throwable t) {
            Diagnostics.error("video tab listener failed", t);
        }
    }

    private static void onVideoEnded() {
        Activity activity = shown.get();
        if (activity != null && Settings.videoTabAutoScroll()) scrollToNext(activity);
    }

    // region Screen

    /** Called by SduiMediaDownload when an SDUI screen comes to the front. */
    static void onScreen(Activity activity, String screen, Object fragment) {
        // Every tab's screen resumes with the activity, the hidden ones too; those change nothing.
        if (hidden(fragment)) return;
        if (!SCREEN.equals(screen) || !Settings.isVideoTabIncluded()) {
            hide(activity);
            return;
        }
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null) return;
        if (Settings.videoTabTime() && content.findViewWithTag(TIME_TAG) == null) {
            content.addView(timeView(activity));
        }
        shown = new WeakReference<>(activity);
        main.removeCallbacks(VideoTab::poll);
        main.post(VideoTab::poll);
    }

    private static boolean hidden(Object fragment) {
        try {
            return (Boolean) fragment.getClass().getMethod("isHidden").invoke(fragment);
        } catch (Throwable t) {
            return false;
        }
    }

    /** Called by SduiMediaDownload when the screen in front goes away. */
    static void hide(Activity activity) {
        if (shown.get() != activity) return;
        shown = new WeakReference<>(null);
        main.removeCallbacks(VideoTab::poll);
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null) return;
        View view = content.findViewWithTag(TIME_TAG);
        if (view != null) content.removeView(view);
    }

    /** The time of the video, right above the end of the seek bar. */
    private static View timeView(Activity activity) {
        TextView time = new TextView(activity);
        time.setTag(TIME_TAG);
        time.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        time.setTextColor(0xFFFFFFFF);
        time.setShadowLayer(4, 0, 1, 0x99000000);
        time.setVisibility(View.INVISIBLE);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.END);
        params.setMarginEnd(Downloads.dp(activity, 20));
        time.setLayoutParams(params);
        return time;
    }

    // endregion

    // region Playback

    private static void poll() {
        Activity activity = shown.get();
        if (activity == null) return;
        main.postDelayed(VideoTab::poll, POLL_MS);
        try {
            Object exo = Reflect.get(playing.get(), "player");
            if (exo == null) return;
            if (position == null) {
                position = exo.getClass().getMethod("getCurrentPosition");
                duration = exo.getClass().getMethod("getDuration");
            }
            long now = (Long) position.invoke(exo);
            long total = (Long) duration.invoke(exo);
            showTime(activity, now, total);
        } catch (Throwable t) {
            Diagnostics.error("video tab poll failed", t);
            main.removeCallbacks(VideoTab::poll);
        }
    }

    private static void showTime(Activity activity, long now, long total) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        TextView time = content == null ? null : content.findViewWithTag(TIME_TAG);
        View tabs = content == null ? null : NavigationBar.child(content, "bb_slim_bottom_bar_item_container");
        if (time == null || tabs == null || total <= 0) return;
        time.setText(format(now) + " / " + format(total));
        // The seek bar runs about 26dp above the row of tabs; the time sits right on top of it.
        int[] tabsAt = new int[2];
        int[] contentAt = new int[2];
        tabs.getLocationInWindow(tabsAt);
        content.getLocationInWindow(contentAt);
        int bottom = content.getHeight() - (tabsAt[1] - contentAt[1]) + Downloads.dp(activity, 30);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) time.getLayoutParams();
        if (params.bottomMargin != bottom) {
            params.bottomMargin = bottom;
            time.setLayoutParams(params);
        }
        time.setVisibility(View.VISIBLE);
    }

    private static String format(long millis) {
        long seconds = millis / 1000;
        return seconds >= 3600
                ? String.format(Locale.ROOT, "%d:%02d:%02d", seconds / 3600, seconds / 60 % 60, seconds % 60)
                : String.format(Locale.ROOT, "%d:%02d", seconds / 60, seconds % 60);
    }

    /** Swipes the pager up by a finger's worth of synthetic touches, as a person would. */
    private static void scrollToNext(Activity activity) {
        View page = NavigationBar.child(activity.getWindow().getDecorView(), "home_nav_item_fragment_container");
        if (page == null) return;
        float x = page.getWidth() / 2f;
        float from = page.getHeight() * 0.7f;
        float to = page.getHeight() * 0.2f;
        long down = SystemClock.uptimeMillis();
        int steps = 8;
        for (int i = 0; i <= steps + 1; i++) {
            int step = i;
            main.postAtTime(() -> {
                int action = step == 0 ? MotionEvent.ACTION_DOWN
                        : step > steps ? MotionEvent.ACTION_UP : MotionEvent.ACTION_MOVE;
                float y = from + (to - from) * Math.min(step, steps) / steps;
                MotionEvent event = MotionEvent.obtain(down, SystemClock.uptimeMillis(), action, x, y, 0);
                page.dispatchTouchEvent(event);
                event.recycle();
            }, down + i * 16L);
        }
    }

    // endregion
}
