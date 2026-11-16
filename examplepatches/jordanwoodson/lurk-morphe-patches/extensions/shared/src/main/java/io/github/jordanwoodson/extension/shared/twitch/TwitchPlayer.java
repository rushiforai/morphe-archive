package io.github.jordanwoodson.extension.shared.twitch;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.SleepTimer;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Player controls: sleep timer, refresh, VOD skip interval, brightness and volume swipes and normal
 * latency. Everything pauses, reloads and seeks through Twitch's own paths; with a setting off, its
 * hook returns Twitch's original value or does nothing.
 */
@SuppressWarnings("unused")
public final class TwitchPlayer {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private TwitchPlayer() {
    }

    // ---------------------------------------------------------------------------------------------
    // Sleep timer

    /** Twitch's own set of players to pause, the one it pauses before a Guest Star call. */
    private static volatile WeakReference<Set<?>> pauseRegistry = new WeakReference<>(null);

    static {
        SleepTimer.setExpiryAction(TwitchPlayer::pauseAll);
    }

    /**
     * Injection point: the start of IVS CorePlayerImpl.play(), which every native, portal and React
     * Native start or resume reaches, and of start() on Twitch's ExoPlayer player (Force ExoPlayer).
     * (Re)arms the timer from now. May run on any thread.
     */
    public static void onPlay(Object player) {
        if (player != null) Logger.d("sleep timer: play on " + player.getClass().getName());
        SleepTimer.onPlay(player);
    }

    /** Injection point: the start of IVS CorePlayerImpl.pause() and release(), and of the ExoPlayer player's pause() and stop(). */
    public static void onStop(Object player) {
        SleepTimer.onStop(player);
    }

    /** Injection point: Twitch adding a player to its pause-everything registry. */
    public static void pauseRegistry(Set<?> registry) {
        if (registry != null && pauseRegistry.get() != registry) pauseRegistry = new WeakReference<>(registry);
    }

    /** The sleep timer's pause action: Twitch's own pause paths, then any player they missed. */
    private static void pauseAll(SleepTimer.Expiry expiry) {
        int registered = 0;
        Set<?> registry = pauseRegistry.get();
        if (registry != null) {
            List<Object> players;
            synchronized (registry) {
                players = new ArrayList<>(registry);
            }
            for (Object player : players) {
                try {
                    pauseRegisteredPlayer(player);
                    registered++;
                } catch (Throwable t) {
                    Logger.d("sleep timer: " + t);
                }
            }
        }
        boolean session = callRn("com.twitchrn.player.TwitchMediaSessionModule", "pausePlayer", false);
        boolean feed = callRn("com.twitchrn.player.FeedPlayerRegistry", "pauseActiveFeedPlayer", true);
        Logger.d("sleep timer: paused " + registered + " native players, React Native session " + session
                + ", feed " + feed);
        MAIN.postDelayed(() -> expiry.pauseLeftovers("Twitch's paths"), 3000);
    }

    /** {@code TwitchMediaSessionModule.getInstance().pausePlayer()} or {@code FeedPlayerRegistry.INSTANCE...}. */
    private static boolean callRn(String className, String method, boolean instanceField) {
        try {
            Class<?> type = Class.forName(className, false, TwitchPlayer.class.getClassLoader());
            Object target = instanceField ? type.getField("INSTANCE").get(null)
                    : type.getMethod("getInstance").invoke(null);
            if (target == null) return false;
            type.getMethod(method).invoke(target);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Replaced at patch time: Twitch's pause call on one player of its pause-everything registry. */
    private static void pauseRegisteredPlayer(Object player) {
    }

    // ---------------------------------------------------------------------------------------------
    // Refresh stream

    private static final class Attached {
        final WeakReference<View> view;
        final long order;

        Attached(View view, long order) {
            this.view = new WeakReference<>(view);
            this.order = order;
        }
    }

    /** Native player presenters and the player view each one last attached. Main thread. */
    private static final Map<Object, Attached> PLAYER_VIEWS = new WeakHashMap<>();
    private static long attachOrder;

    /** Injection point: a native player presenter attaching its player view. */
    public static void playerView(Object presenter, View view) {
        if (presenter == null || view == null) return;
        synchronized (PLAYER_VIEWS) {
            PLAYER_VIEWS.put(presenter, new Attached(view, ++attachOrder));
        }
    }

    /**
     * Injection point: the classic player's settings gear, once it is found. Long-press reloads. The gear's
     * own long-click listener is replaced only while Refresh stream is on, so a player opened with it off
     * is untouched; turning it on applies to players opened afterwards.
     */
    public static void bindRefresh(View gear) {
        if (gear == null || !Settings.isEnabled("refresh_stream")) return;
        gear.setOnLongClickListener(view -> {
            if (!Settings.isEnabled("refresh_stream")) return false;
            int[] location = new int[2];
            view.getLocationOnScreen(location);
            Object presenter = presenterAt(view, location[0] + view.getWidth() / 2f,
                    location[1] + view.getHeight() / 2f, true);
            if (presenter == null) {
                Logger.d("refresh: no player for this gear");
                return false;
            }
            refresh(presenter, view);
            return true;
        });
    }

    /**
     * Injection point: the native player's long press, which Twitch emits but ignores. Reloads when it
     * is in the middle of the video, away from the edges where hands rest.
     */
    public static void videoLongPress(MotionEvent event) {
        try {
            if (event == null || !Settings.isEnabled("refresh_stream") || !Settings.isEnabled("refresh_stream_video")) {
                return;
            }
            float x = event.getRawX();
            float y = event.getRawY();
            Object presenter = presenterAt(null, x, y, false);
            if (presenter == null) return;
            View view = viewOf(presenter);
            if (view == null) return;
            int[] location = new int[2];
            view.getLocationOnScreen(location);
            float relative = (x - location[0]) / Math.max(1, view.getWidth());
            if (relative < 0.2f || relative > 0.8f) return;
            refresh(presenter, view);
        } catch (Throwable t) {
            Logger.d("refresh: " + t);
        }
    }

    private static View viewOf(Object presenter) {
        synchronized (PLAYER_VIEWS) {
            Attached attached = PLAYER_VIEWS.get(presenter);
            return attached == null ? null : attached.view.get();
        }
    }

    /**
     * The presenter whose shown player view contains the screen point, most recently attached first.
     * With {@code sameWindow}, one in the anchor's window that doesn't contain it is the fallback.
     */
    private static Object presenterAt(View anchor, float x, float y, boolean sameWindow) {
        Object best = null;
        Object fallback = null;
        long bestOrder = -1;
        long fallbackOrder = -1;
        int[] location = new int[2];
        synchronized (PLAYER_VIEWS) {
            for (Map.Entry<Object, Attached> entry : PLAYER_VIEWS.entrySet()) {
                View view = entry.getValue().view.get();
                long order = entry.getValue().order;
                if (view == null || !view.isShown() || view.getWidth() == 0) continue;
                if (anchor != null && view.getRootView() != anchor.getRootView()) continue;
                view.getLocationOnScreen(location);
                boolean contains = x >= location[0] && x < location[0] + view.getWidth()
                        && y >= location[1] && y < location[1] + view.getHeight();
                if (contains && order > bestOrder) {
                    best = entry.getKey();
                    bestOrder = order;
                } else if (!contains && sameWindow && order > fallbackOrder) {
                    fallback = entry.getKey();
                    fallbackOrder = order;
                }
            }
        }
        return best != null ? best : fallback;
    }

    private static void refresh(Object presenter, View feedback) {
        try {
            // Exactly what the error screen's Retry does: a new access token and playlist (live), or the
            // same position with a new token (VOD).
            retryPlayer(presenter, 0, true);
            feedback.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
            toast("Refreshing stream");
            Logger.d("refresh: " + presenter.getClass().getName());
        } catch (Throwable t) {
            Logger.d("refresh: " + t);
        }
    }

    /** Replaced at patch time: the player presenter's Retry, called as Twitch's error screen calls it. */
    private static void retryPlayer(Object presenter, Integer position, boolean newToken) {
    }

    // ---------------------------------------------------------------------------------------------
    // VOD skip interval

    private static final Map<String, Integer> DRAWABLES = new HashMap<>();

    private static int skipSeconds() {
        return Math.max(0, Settings.getInt("vod_skip_seconds"));
    }

    /** Injection point: the classic VOD overlay's rewind, in seconds (Twitch: -10). */
    public static int seekBack(int original) {
        int seconds = skipSeconds();
        return seconds > 0 ? -seconds : original;
    }

    /** Injection point: the classic VOD overlay's forward, in seconds (Twitch: 30). */
    public static int seekForward(int original) {
        int seconds = skipSeconds();
        return seconds > 0 ? seconds : original;
    }

    /** Injection point: the vertical VOD controls, positive seconds in both directions (Twitch: 10 and 30). */
    public static long seekSeconds(long original) {
        int seconds = skipSeconds();
        return seconds > 0 ? seconds : original;
    }

    /** Injection point: the media notification's rewind, in milliseconds (Twitch: -10000). */
    public static int seekBackMillis(int original) {
        int seconds = skipSeconds();
        return seconds > 0 ? -seconds * 1000 : original;
    }

    /** Injection point: the media notification's forward, in milliseconds (Twitch: 30000). */
    public static int seekForwardMillis(int original) {
        int seconds = skipSeconds();
        return seconds > 0 ? seconds * 1000 : original;
    }

    /** Injection point: a rewind icon drawn with Twitch's "10". With another interval, one without it. */
    public static int seekBackIcon(int original) {
        return skipSeconds() > 0 ? drawable("lurk_seek_back", original) : original;
    }

    /** Injection point: a forward icon drawn with Twitch's "30". With another interval, one without it. */
    public static int seekForwardIcon(int original) {
        return skipSeconds() > 0 ? drawable("lurk_seek_forward", original) : original;
    }

    /** Injection point: the classic VOD overlay's rewind button, once it is found. */
    public static void bindSeekBack(ImageView button) {
        bindSeek(button, "lurk_seek_back", "Rewind ");
    }

    /** Injection point: the classic VOD overlay's forward button, once it is found. */
    public static void bindSeekForward(ImageView button) {
        bindSeek(button, "lurk_seek_forward", "Forward ");
    }

    private static void bindSeek(ImageView button, String icon, String label) {
        int seconds = skipSeconds();
        if (button == null || seconds <= 0) return;
        try {
            int id = drawable(icon, button.getId());
            if (id != button.getId()) button.setImageResource(id);
            button.setContentDescription(label + seconds + " seconds");
        } catch (RuntimeException e) {
            Logger.d("seek buttons: " + e);
        }
    }

    /** A drawable the patch added, looked up next to a resource of the app (the clone keeps its package). */
    private static int drawable(String name, int sibling) {
        synchronized (DRAWABLES) {
            Integer cached = DRAWABLES.get(name);
            if (cached != null) return cached != 0 ? cached : sibling;
            int id = 0;
            try {
                Resources resources = application().getResources();
                id = resources.getIdentifier(name, "drawable", resources.getResourcePackageName(sibling));
            } catch (RuntimeException e) {
                Logger.d("seek icons: " + e);
            }
            DRAWABLES.put(name, id);
            return id != 0 ? id : sibling;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Brightness and volume swipes

    private static final int IDLE = 0;
    private static final int CANDIDATE = 1;
    private static final int CLAIMED = 2;

    private static int swipe = IDLE;
    private static WeakReference<ViewGroup> swipeContainer = new WeakReference<>(null);
    private static long swipeDownTime;
    private static int swipePointer;
    private static float swipeDownX;
    private static float swipeDownY;
    private static float swipeHeight;
    private static float swipeStart;
    private static boolean swipeBrightness;
    private static final Map<View, Boolean> BRIGHTNESS_WATCHED = new WeakHashMap<>();
    private static WeakReference<TextView> indicator = new WeakReference<>(null);
    private static final Runnable HIDE_INDICATOR = TwitchPlayer::hideIndicator;

    /**
     * Injection point: the start of the theatre container's onInterceptTouchEvent. True takes the
     * gesture from the player and Twitch's drag-to-minimize; false runs Twitch's code as is.
     */
    public static boolean swipeIntercept(ViewGroup container, MotionEvent event) {
        try {
            if (container == null || event == null) return false;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    // A theatre can hold another draggable layout, which sees the same touch next.
                    if (swipe == CANDIDATE && event.getDownTime() == swipeDownTime) return false;
                    swipe = startSwipe(container, event) ? CANDIDATE : IDLE;
                    return false;
                case MotionEvent.ACTION_MOVE:
                    return moveCandidate(container, event);
                default:
                    if (swipe == CANDIDATE) swipe = IDLE;
                    return false;
            }
        } catch (Throwable t) {
            swipe = IDLE;
            Logger.d("swipe: " + t);
            return false;
        }
    }

    /** Injection point: the start of the theatre container's onTouchEvent. True consumes the event. */
    public static boolean swipeTouch(ViewGroup container, MotionEvent event) {
        try {
            if (container == null || event == null || container != swipeContainer.get()) return false;
            int action = event.getActionMasked();
            if (swipe == CANDIDATE) {
                // No child took the touch, so it came straight here.
                if (action == MotionEvent.ACTION_DOWN) return false;
                if (action == MotionEvent.ACTION_MOVE) return moveCandidate(container, event);
                swipe = IDLE;
                return false;
            }
            if (swipe != CLAIMED) return false;
            if (!Settings.isEnabled("swipe_controls") || event.getPointerCount() != 1 ||
                    event.findPointerIndex(swipePointer) < 0 || action == MotionEvent.ACTION_POINTER_UP ||
                    action == MotionEvent.ACTION_POINTER_DOWN) {
                swipe = IDLE;
                ViewParent parent = container.getParent();
                if (parent != null) parent.requestDisallowInterceptTouchEvent(false);
                MAIN.removeCallbacks(HIDE_INDICATOR);
                hideIndicator();
                return false;
            }
            if (action == MotionEvent.ACTION_MOVE) {
                int index = event.findPointerIndex(swipePointer);
                if (index >= 0) apply(container, (swipeDownY - event.getY(index)) / swipeHeight);
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                swipe = IDLE;
                MAIN.removeCallbacks(HIDE_INDICATOR);
                MAIN.postDelayed(HIDE_INDICATOR, 700);
            }
            return true;
        } catch (Throwable t) {
            swipe = IDLE;
            Logger.d("swipe: " + t);
            return false;
        }
    }

    private static boolean moveCandidate(ViewGroup container, MotionEvent event) {
        if (swipe != CANDIDATE || container != swipeContainer.get()) return false;
        int index = event.findPointerIndex(swipePointer);
        if (index < 0 || event.getPointerCount() > 1 || !Settings.isEnabled("swipe_controls")) {
            swipe = IDLE;
            return false;
        }
        float dx = event.getX(index) - swipeDownX;
        float dy = event.getY(index) - swipeDownY;
        int slop = ViewConfiguration.get(container.getContext()).getScaledTouchSlop();
        if (Math.abs(dy) > slop && Math.abs(dy) > 2 * Math.abs(dx)) {
            if (!claim(container)) {
                swipe = IDLE;
                return false;
            }
            swipe = CLAIMED;
            // Measure from here, so the value doesn't jump by the slop.
            swipeDownY = event.getY(index);
            return true;
        }
        if (Math.abs(dx) > slop) swipe = IDLE;
        return false;
    }

    /** Whether a touch here may become a swipe: landscape, full-size video, left or right side. */
    private static boolean startSwipe(ViewGroup container, MotionEvent event) {
        if (event.getPointerCount() != 1 || !Settings.isEnabled("swipe_controls")) return false;
        if (container.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE) {
            return false;
        }
        Activity activity = activity(container.getContext());
        if (activity == null || activity.isInPictureInPictureMode()) return false;
        AccessibilityManager accessibility = (AccessibilityManager)
                container.getContext().getSystemService(Context.ACCESSIBILITY_SERVICE);
        if (accessibility != null && accessibility.isTouchExplorationEnabled()) return false;

        View video = largestVideo(container, null);
        if (video == null || video.getWidth() < container.getWidth() / 2 || transformed(video, container)) return false;
        Rect rect = rectIn(container, video);
        float x = event.getX();
        float y = event.getY();
        if (!rect.contains((int) x, (int) y)) return false;
        // Leave the status bar edge and the seek bar alone.
        if (y < rect.top + rect.height() * 0.12f || y > rect.bottom - rect.height() * 0.12f) return false;
        float relative = (x - rect.left) / rect.width();
        // The middle fifth keeps Twitch's drag-to-minimize.
        if (relative > 0.4f && relative < 0.6f) return false;
        if (scrollsVertically(container, container, x, y)) return false;
        swipeContainer = new WeakReference<>(container);
        swipeDownTime = event.getDownTime();
        swipePointer = event.getPointerId(0);
        swipeDownX = x;
        swipeDownY = y;
        swipeHeight = Math.max(1, rect.height());
        swipeBrightness = relative <= 0.4f;
        return true;
    }

    private static boolean claim(ViewGroup container) {
        if (swipeBrightness) {
            Window window = window(container);
            if (window == null) return false;
            float current = window.getAttributes().screenBrightness;
            if (current < 0) {
                try {
                    current = android.provider.Settings.System.getInt(container.getContext().getContentResolver(),
                            android.provider.Settings.System.SCREEN_BRIGHTNESS) / 255f;
                } catch (android.provider.Settings.SettingNotFoundException e) {
                    current = 0.5f;
                }
            }
            swipeStart = current;
            watchBrightness(container);
        } else {
            AudioManager audio = (AudioManager) container.getContext().getSystemService(Context.AUDIO_SERVICE);
            if (audio == null) return false;
            swipeStart = audio.getStreamVolume(AudioManager.STREAM_MUSIC);
        }
        ViewParent parent = container.getParent();
        if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
        return true;
    }

    private static void apply(ViewGroup container, float fraction) {
        String text;
        if (swipeBrightness) {
            Window window = window(container);
            if (window == null) return;
            float value = Math.max(0.01f, Math.min(1f, swipeStart + fraction));
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.screenBrightness = value;
            window.setAttributes(attributes);
            text = "Brightness " + Math.round(value * 100) + "%";
        } else {
            AudioManager audio = (AudioManager) container.getContext().getSystemService(Context.AUDIO_SERVICE);
            if (audio == null) return;
            int max = audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
            int value = Math.max(0, Math.min(max, Math.round(swipeStart + fraction * max)));
            if (value != audio.getStreamVolume(AudioManager.STREAM_MUSIC)) {
                audio.setStreamVolume(AudioManager.STREAM_MUSIC, value, 0);
            }
            text = "Volume " + Math.round(value * 100f / Math.max(1, max)) + "%";
        }
        showIndicator(container, text);
    }

    /** Hand brightness back to the system when the theatre closes or turns to portrait. */
    private static void watchBrightness(ViewGroup container) {
        synchronized (BRIGHTNESS_WATCHED) {
            if (BRIGHTNESS_WATCHED.put(container, Boolean.TRUE) != null) return;
        }
        container.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
                resetBrightness(view);
            }
        });
        container.addOnLayoutChangeListener((view, l, t, r, b, oldL, oldT, oldR, oldB) -> {
            if (view.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE) {
                resetBrightness(view);
            }
        });
    }

    private static void resetBrightness(View view) {
        Window window = window(view);
        if (window == null) return;
        WindowManager.LayoutParams attributes = window.getAttributes();
        if (attributes.screenBrightness < 0) return;
        attributes.screenBrightness = WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE;
        window.setAttributes(attributes);
    }

    private static void showIndicator(View container, String text) {
        Window window = window(container);
        if (window == null) return;
        TextView view = indicator.get();
        ViewGroup decor = (ViewGroup) window.getDecorView();
        if (view == null || view.getParent() != decor) {
            if (view != null && view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
            Context context = container.getContext();
            float density = context.getResources().getDisplayMetrics().density;
            view = new TextView(context);
            view.setTextColor(Color.WHITE);
            view.setTextSize(16);
            int padding = Math.round(12 * density);
            view.setPadding(padding * 2, padding, padding * 2, padding);
            GradientDrawable background = new GradientDrawable();
            background.setColor(0xB3000000);
            background.setCornerRadius(12 * density);
            view.setBackground(background);
            view.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            decor.addView(view, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
            indicator = new WeakReference<>(view);
        }
        view.setText(text);
        view.setVisibility(View.VISIBLE);
        MAIN.removeCallbacks(HIDE_INDICATOR);
    }

    private static void hideIndicator() {
        TextView view = indicator.get();
        if (view != null && view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
        indicator = new WeakReference<>(null);
    }

    /** The largest shown video surface under {@code root}, where every theatre renders its player. */
    private static View largestVideo(ViewGroup root, View best) {
        for (int i = 0; i < root.getChildCount(); i++) {
            View child = root.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) continue;
            if ((child instanceof TextureView || child instanceof SurfaceView) && child.isShown()
                    && (best == null || area(child) > area(best))) {
                best = child;
            }
            if (child instanceof ViewGroup) best = largestVideo((ViewGroup) child, best);
        }
        return best;
    }

    private static long area(View view) {
        return (long) view.getWidth() * view.getHeight();
    }

    /** Zoomed or panned by pinch-to-zoom: leave the touch to that. */
    private static boolean transformed(View view, View container) {
        for (View current = view; current != null && current != container; ) {
            if (current.getScaleX() != 1f || current.getScaleY() != 1f) return true;
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        return false;
    }

    /** Overlay chat and other lists over the video keep their own scrolling. */
    private static boolean scrollsVertically(ViewGroup container, ViewGroup group, float x, float y) {
        for (int i = group.getChildCount() - 1; i >= 0; i--) {
            View child = group.getChildAt(i);
            if (!child.isShown() || !rectIn(container, child).contains((int) x, (int) y)) continue;
            if (child.canScrollVertically(1) || child.canScrollVertically(-1)) return true;
            if (child instanceof ViewGroup && scrollsVertically(container, (ViewGroup) child, x, y)) return true;
        }
        return false;
    }

    private static Rect rectIn(View container, View view) {
        int[] outer = new int[2];
        int[] inner = new int[2];
        container.getLocationOnScreen(outer);
        view.getLocationOnScreen(inner);
        int left = inner[0] - outer[0];
        int top = inner[1] - outer[1];
        return new Rect(left, top, left + view.getWidth(), top + view.getHeight());
    }

    // ---------------------------------------------------------------------------------------------
    // Normal latency

    /** Players Lurk switched to normal latency, to switch back when the setting is turned off. */
    private static final Map<Object, Boolean> NORMAL_LATENCY = Collections.synchronizedMap(new WeakHashMap<>());

    /** Injection point: Twitch's native load, with the IVS player it is about to load (Twitch never sets the mode). */
    public static void loadLatency(Object player) {
        if (player == null) return;
        try {
            if (Settings.isEnabled("normal_latency")) {
                setLowLatency(player, false);
                NORMAL_LATENCY.put(player, Boolean.TRUE);
            } else if (NORMAL_LATENCY.remove(player) != null) {
                setLowLatency(player, true);
            }
        } catch (Throwable t) {
            Logger.d("latency: " + t);
        }
    }

    /** Injection point: IVS setLiveLowLatencyEnabled, which React Native and the portal player call. */
    public static boolean lowLatency(boolean requested) {
        return requested && !Settings.isEnabled("normal_latency");
    }

    private static void setLowLatency(Object player, boolean enabled) throws ReflectiveOperationException {
        player.getClass().getMethod("setLiveLowLatencyEnabled", boolean.class).invoke(player, enabled);
    }

    // ---------------------------------------------------------------------------------------------

    private static Window window(View view) {
        Activity activity = activity(view.getContext());
        return activity == null ? null : activity.getWindow();
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static Context application() {
        try {
            return (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (ReflectiveOperationException e) {
            throw new IllegalStateException(e);
        }
    }

    private static void toast(String text) {
        MAIN.post(() -> {
            try {
                Toast.makeText(application(), text, Toast.LENGTH_SHORT).show();
            } catch (RuntimeException e) {
                Logger.d("toast: " + e);
            }
        });
    }
}
