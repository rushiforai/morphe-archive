package app.template.extension.spotify;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Scroll lock for Spotify's Now Playing screen.
 * <p>
 * The patch calls into this class from the Now Playing scroll container:
 * - {@link #onScrollViewAttached(View)} from onAttachedToWindow,
 * - {@link #filterMotionEvent(View, MotionEvent)} at the start of onInterceptTouchEvent / onTouchEvent,
 * - {@link #beginCall(View)} at the start of onStartNestedScroll,
 * - {@link #filterResult(boolean)} on every return of those methods.
 * <p>
 * While locked, the container only ever sees ACTION_CANCEL and never claims a gesture,
 * so its children (the cover art carousel that changes songs) get every touch.
 */
@SuppressWarnings("unused")
public final class NowPlayingScrollLockPatch {

    private static final String PREFS_NAME = "morphe_now_playing_scroll_lock";
    private static final String KEY_LOCKED = "locked";
    private static final String KEY_OFFSET_X = "button_offset_x";
    private static final String KEY_OFFSET_Y = "button_offset_y";

    private static final int BUTTON_SIZE_DP = 40;
    /** Default gap between the button and the right edge. */
    private static final int RIGHT_MARGIN_DP = 16;
    private static final int DEFAULT_OFFSET_Y_DP = 72;

    /** Now Playing scroll containers, weakly held. */
    private static final Set<View> targets = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<View, TextView> buttons = new WeakHashMap<>();

    private static SharedPreferences prefs;
    private static boolean locked;

    /** Set at the start of a hooked method, read and cleared by its return. Main thread only. */
    private static boolean blockCurrentCall;

    // region Hooks

    /** Body replaced by the patch with the Now Playing scroll view's class name. */
    public static String targetClassName() {
        return "";
    }

    private static String targetName;

    /** Temporary diagnostics: set to false once the button works. */
    private static final boolean DEBUG = false;
    private static final Set<String> shownDebug = new java.util.HashSet<>();

    private static void debug(Context context, String message) {
        if (!DEBUG || context == null || !shownDebug.add(message)) return;
        try {
            Toast.makeText(context.getApplicationContext(), "ScrollLock: " + message, Toast.LENGTH_LONG).show();
        } catch (Exception ignored) {
        }
    }

    private static boolean isTarget(View view) {
        if (view == null) return false;
        if (targetName == null) targetName = targetClassName();
        return view.getClass().getName().equals(targetName);
    }

    /** Called from onAttachedToWindow() of the scroll view (or a shared superclass). */
    public static void onScrollViewAttached(View view) {
        try {
            if (!isTarget(view)) return;
            debug(view.getContext(), "attached " + targetName);
            loadPrefs(view.getContext());

            if (targets.add(view)) {
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override
                    public void onViewAttachedToWindow(View v) {
                    }

                    @Override
                    public void onViewDetachedFromWindow(View v) {
                        removeButton(v);
                    }
                });
            }
            view.post(() -> attachButton(view));
        } catch (Exception e) {
            // Never crash Spotify because of the lock button.
            debug(view.getContext(), "attach error " + e);
        }
    }

    public static MotionEvent filterMotionEvent(View view, MotionEvent event) {
        if (view != null && isTarget(view)) debug(view.getContext(), "touch hook OK");
        blockCurrentCall = shouldBlock(view);
        if (!blockCurrentCall || event == null || event.getActionMasked() == MotionEvent.ACTION_CANCEL) {
            return event;
        }
        MotionEvent cancel = MotionEvent.obtain(event);
        cancel.setAction(MotionEvent.ACTION_CANCEL);
        return cancel;
    }

    public static void beginCall(View view) {
        blockCurrentCall = shouldBlock(view);
    }

    public static boolean filterResult(boolean original) {
        boolean block = blockCurrentCall;
        blockCurrentCall = false;
        return !block && original;
    }

    private static boolean shouldBlock(View view) {
        return locked && isTarget(view);
    }

    // endregion

    // region State

    private static void loadPrefs(Context context) {
        if (prefs != null) return;
        prefs = context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        locked = prefs.getBoolean(KEY_LOCKED, false);
    }

    private static void setLocked(boolean value) {
        locked = value;
        if (prefs != null) prefs.edit().putBoolean(KEY_LOCKED, value).apply();

        for (Map.Entry<View, TextView> entry : buttons.entrySet()) {
            styleButton(entry.getValue());
            if (value) scrollToTop(entry.getKey());
        }
    }

    private static void scrollToTop(View view) {
        if (view == null || !view.canScrollVertically(-1)) return;
        try {
            view.scrollTo(view.getScrollX(), 0);
        } catch (Exception ignored) {
            // Some containers (RecyclerView) do not support absolute scrolling.
        }
    }

    // endregion

    // region Button

    private static int dp(Context context, int dp) {
        return Math.round(dp * context.getResources().getDisplayMetrics().density);
    }

    private static void styleButton(TextView button) {
        button.setText(locked ? "🔒" : "🔓"); // locked / unlocked padlock
        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.OVAL);
        background.setColor(locked ? Color.argb(220, 30, 215, 96) : Color.argb(140, 0, 0, 0));
        button.setBackground(background);
        button.setContentDescription(locked ? "Now Playing scroll locked" : "Now Playing scroll unlocked");
    }

    @SuppressLint("ClickableViewAccessibility")
    private static void attachButton(View target) {
        try {
            if (buttons.containsKey(target) || !target.isAttachedToWindow()) return;

            View root = target.getRootView();
            View contentView = root.findViewById(android.R.id.content);
            ViewGroup container = contentView instanceof FrameLayout
                    ? (ViewGroup) contentView
                    : (root instanceof FrameLayout ? (ViewGroup) root : null);
            if (container == null) {
                debug(target.getContext(), "no container for button");
                return;
            }

            Context context = target.getContext();
            int size = dp(context, BUTTON_SIZE_DP);

            TextView button = new TextView(context);
            button.setGravity(Gravity.CENTER);
            button.setTextSize(18);
            button.setElevation(dp(context, 6));
            styleButton(button);

            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size);
            params.gravity = Gravity.TOP | Gravity.START;
            container.addView(button, params);
            buttons.put(target, button);

            int touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
            float[] down = new float[4]; // rawX, rawY, startOffsetX, startOffsetY
            boolean[] dragging = new boolean[1];

            // Tap toggles, drag moves the button (position is remembered).
            button.setOnTouchListener((v, event) -> {
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        down[0] = event.getRawX();
                        down[1] = event.getRawY();
                        down[2] = lastX;
                        down[3] = getOffsetY(context);
                        dragging[0] = false;
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        float dx = event.getRawX() - down[0];
                        float dy = event.getRawY() - down[1];
                        if (!dragging[0] && Math.hypot(dx, dy) > touchSlop) dragging[0] = true;
                        if (dragging[0]) {
                            setOffset(Math.round(down[2] + dx), Math.round(down[3] + dy), false);
                            positionButton(target, button, container);
                        }
                        return true;
                    case MotionEvent.ACTION_UP:
                        if (dragging[0]) {
                            setOffset(lastX, getOffsetY(context), true);
                        } else {
                            v.performClick();
                            setLocked(!locked);
                        }
                        return true;
                    default:
                        return true;
                }
            });

            ViewTreeObserver.OnPreDrawListener preDraw = () -> {
                positionButton(target, button, container);
                return true;
            };
            target.getViewTreeObserver().addOnPreDrawListener(preDraw);
            button.setTag(preDraw);
            positionButton(target, button, container);
            debug(context, "button added");
        } catch (Exception e) {
            debug(target.getContext(), "button error " + e);
        }
    }

    private static void removeButton(View target) {
        TextView button = buttons.remove(target);
        if (button == null) return;
        Object tag = button.getTag();
        if (tag instanceof ViewTreeObserver.OnPreDrawListener) {
            target.getViewTreeObserver().removeOnPreDrawListener((ViewTreeObserver.OnPreDrawListener) tag);
        }
        if (button.getParent() instanceof ViewGroup) {
            ((ViewGroup) button.getParent()).removeView(button);
        }
    }

    private static final Rect visibleRect = new Rect();
        private static final int[] containerLocation = new int[2];

    /** Keeps the button pinned to the scroll view and hidden whenever Now Playing is not on screen. */
    private static void positionButton(View target, View button, View container) {
        // Pin to the on-screen part of the scroll view, whatever its full height is.
        boolean visible = target.isShown() && target.getGlobalVisibleRect(visibleRect);
        int visibility = visible ? View.VISIBLE : View.GONE;
        if (button.getVisibility() != visibility) button.setVisibility(visibility);
        if (!visible) return;

        container.getLocationInWindow(containerLocation);
        Context context = target.getContext();

        float maxX = Math.max(0, visibleRect.width() - button.getWidth());
        float maxY = Math.max(0, visibleRect.height() - button.getHeight());
        int savedX = getOffsetX();
        // No saved position yet: sit on the right side.
        float x = savedX < 0
                ? Math.max(0, maxX - dp(context, RIGHT_MARGIN_DP))
                : clamp(savedX, 0, maxX);
        float y = clamp(getOffsetY(context), 0, maxY);
        lastX = Math.round(x);

        button.setTranslationX(visibleRect.left - containerLocation[0] + x);
        button.setTranslationY(visibleRect.top - containerLocation[1] + y);
    }

    private static float clamp(float value, float min, float max) {
        return Math.max(min, Math.min(max, value));
    }

    /** Cached button offset inside the visible scroll view, in px. */
    private static final int NOT_LOADED = Integer.MIN_VALUE;
    private static int offsetX = NOT_LOADED; // -1 means "default: right side"
    private static int offsetY = -1;
    /** Last x the button was drawn at, used as the drag start. */
    private static int lastX;

    private static int getOffsetX() {
        if (offsetX == NOT_LOADED) {
            offsetX = prefs == null ? -1 : prefs.getInt(KEY_OFFSET_X, -1);
        }
        return offsetX;
    }

    private static int getOffsetY(Context context) {
        if (offsetY < 0) {
            int fallback = dp(context, DEFAULT_OFFSET_Y_DP);
            offsetY = prefs == null ? fallback : prefs.getInt(KEY_OFFSET_Y, fallback);
        }
        return offsetY;
    }

    private static void setOffset(int x, int y, boolean persist) {
        offsetX = Math.max(0, x);
        offsetY = Math.max(0, y);
        if (persist && prefs != null) {
            prefs.edit().putInt(KEY_OFFSET_X, offsetX).putInt(KEY_OFFSET_Y, offsetY).apply();
        }
    }

    // endregion
}
