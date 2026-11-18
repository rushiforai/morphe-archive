package io.github.sabopura.morphe.extension.twitch.ui;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.DisplayCutout;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * Locks the Twitch screen against touches while the video plays on, for a child's hands, a bed or a
 * pocket. A clear view above everything in the activity's window takes every touch and the back
 * gesture; only its lock button answers, to a hold. The lock ends with that hold, when the player
 * leaves the window, and when the window is hidden or shrinks to picture-in-picture, so nobody is
 * left with a screen that takes no touch.
 */
public final class TouchLock extends FrameLayout implements View.OnAttachStateChangeListener {
    private static final int DIM_AFTER_MS = 3000, DIM_MS = 400, PLAYER_GONE_MS = 1500;
    private static final float DIMMED = .3f;
    /** The lock in place, if any. Main thread. */
    private static TouchLock active;

    private final Activity activity;
    private final LockButton button;
    private final Runnable dim, endQuietly = () -> unlock(false), playerCheck = () -> followPlayer(false);
    private View content, player;
    private int contentAccessibility;
    private Object backCallback;

    private TouchLock(Activity activity) {
        super(activity);
        this.activity = activity;
        setFocusable(true);
        setFocusableInTouchMode(true);
        setDefaultFocusHighlightEnabled(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        int size = Ui.dp(activity, 48);
        button = new LockButton(activity);
        addView(button, new LayoutParams(size, size));
        dim = () -> button.animate().alpha(DIMMED).setDuration(DIM_MS);
    }

    /**
     * Before Android 13 the back key only reaches the view that has the focus, so the lock takes the
     * focus back when Twitch moves it to one of its own views.
     */
    private final ViewTreeObserver.OnGlobalFocusChangeListener keepFocus = (from, to) -> {
        if (to != this) requestFocus();
    };

    /** Main thread. */
    public static void lock(Context context) {
        try {
            Activity activity = Ui.activity(context);
            if (active != null || activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            ((ViewGroup) activity.getWindow().getDecorView()).addView(new TouchLock(activity),
                    new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            Notice.show(activity, label("画面をロックしました。鍵のボタンを長押しすると解除します",
                    "Touches locked. Hold the lock button to unlock"));
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ui.touch-lock", e);
        }
    }

    /** Main thread. */
    public static boolean locked() {
        return active != null;
    }

    private void unlock(boolean byViewer) {
        if (!(getParent() instanceof ViewGroup)) return;
        ((ViewGroup) getParent()).removeView(this);
        if (byViewer) Notice.show(activity, label("ロックを解除しました", "Unlocked"));
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        try {
            active = this;
            // TalkBack must find the lock button and nothing of the screen under it.
            content = activity.findViewById(android.R.id.content);
            if (content != null) {
                contentAccessibility = content.getImportantForAccessibility();
                content.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            }
            if (Build.VERSION.SDK_INT >= 33) {
                android.window.OnBackInvokedCallback callback = this::hint;
                activity.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                        android.window.OnBackInvokedDispatcher.PRIORITY_OVERLAY, callback);
                backCallback = callback;
            }
            requestFocus();
            getViewTreeObserver().addOnGlobalFocusChangeListener(keepFocus);
            followPlayer(true);
            wake();
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ui.touch-lock-attach", e);
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        try {
            getViewTreeObserver().removeOnGlobalFocusChangeListener(keepFocus);
            removeCallbacks(dim);
            removeCallbacks(endQuietly);
            removeCallbacks(playerCheck);
            button.release();
            if (player != null) player.removeOnAttachStateChangeListener(this);
            player = null;
            if (content != null) content.setImportantForAccessibility(contentAccessibility);
            if (Build.VERSION.SDK_INT >= 33 && backCallback != null)
                activity.getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(
                        (android.window.OnBackInvokedCallback) backCallback);
            backCallback = null;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ui.touch-lock-detach", e);
        }
        if (active == this) active = null;
        super.onDetachedFromWindow();
    }

    /**
     * The lock must not outlive the player. The player's menu button is in every player these patches
     * reach; a rotation or a new layout only swaps it, so its leaving is checked again a moment later.
     */
    private void followPlayer(boolean locking) {
        int id = TwitchRes.id(activity, "sabopura_player_menu", "id");
        player = id == 0 ? null : activity.getWindow().getDecorView().findViewById(id);
        if (player != null) player.addOnAttachStateChangeListener(this);
        else if (!locking) unlock(false);
    }

    @Override
    public void onViewAttachedToWindow(View view) {
    }

    @Override
    public void onViewDetachedFromWindow(View view) {
        view.removeOnAttachStateChangeListener(this);
        player = null;
        postDelayed(playerCheck, PLAYER_GONE_MS);
    }

    // The removals below are posted: these run while the window walks its views.

    @Override
    protected void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        if (visibility != VISIBLE) post(endQuietly);
    }

    @Override
    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (activity.isInPictureInPictureMode()) post(endQuietly);
    }

    // ---- what the lock takes ----

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getActionMasked() == MotionEvent.ACTION_DOWN) hint();
        return true;
    }

    @Override
    public boolean onHoverEvent(MotionEvent event) {
        return true;
    }

    @Override
    public boolean onGenericMotionEvent(MotionEvent event) {
        return true;
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        return backKey(event) || super.dispatchKeyEvent(event);
    }

    /** Back is the only key taken; volume and media keys go on to Twitch. */
    private boolean backKey(KeyEvent event) {
        if (event.getKeyCode() != KeyEvent.KEYCODE_BACK) return false;
        if (event.getAction() == KeyEvent.ACTION_UP && !event.isCanceled()) hint();
        return true;
    }

    private void hint() {
        try {
            wake();
            Notice.show(activity, label("ロック中です。鍵のボタンを長押しすると解除します",
                    "Locked. Hold the lock button to unlock"));
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ui.touch-lock-hint", e);
        }
    }

    /** Shows the button in full, then lets it fade the way player controls do. */
    private void wake() {
        removeCallbacks(dim);
        button.animate().cancel();
        button.setAlpha(1f);
        postDelayed(dim, DIM_AFTER_MS);
    }

    // ---- where the button sits ----

    @Override
    public WindowInsets onApplyWindowInsets(WindowInsets insets) {
        requestLayout();
        return insets;
    }

    /** Near the top corner of the video in both orientations, clear of the bars, a cutout and the notice pill. */
    @Override
    @SuppressWarnings("deprecation")
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        int insetLeft = 0, insetTop = 0, insetRight = 0;
        // The window's own insets: the ones handed down may already have lost what Android laid out itself.
        WindowInsets insets = getRootWindowInsets();
        if (insets != null && Build.VERSION.SDK_INT >= 30) {
            android.graphics.Insets safe = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            insetLeft = safe.left;
            insetTop = safe.top;
            insetRight = safe.right;
        } else if (insets != null) {
            DisplayCutout cutout = Build.VERSION.SDK_INT >= 28 ? insets.getDisplayCutout() : null;
            insetLeft = Math.max(insets.getSystemWindowInsetLeft(), cutout == null ? 0 : cutout.getSafeInsetLeft());
            insetTop = Math.max(insets.getSystemWindowInsetTop(), cutout == null ? 0 : cutout.getSafeInsetTop());
            insetRight = Math.max(insets.getSystemWindowInsetRight(), cutout == null ? 0 : cutout.getSafeInsetRight());
        }
        int size = button.getMeasuredWidth(), margin = Ui.dp(activity, 12);
        int x = getLayoutDirection() == LAYOUT_DIRECTION_RTL
                ? right - left - insetRight - margin - size : insetLeft + margin;
        int y = insetTop + Ui.dp(activity, 72);
        button.layout(x, y, x + size, y + size);
    }

    /** A tap says how to unlock; a hold of a second, shown by a ring closing around the lock, unlocks. */
    private final class LockButton extends View {
        private final Paint disc = new Paint(Paint.ANTI_ALIAS_FLAG), ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Drawable icon;
        private final LockHold hold = new LockHold();
        private final Runnable due = () -> finish(hold.due(SystemClock.uptimeMillis()));
        private ValueAnimator closing;
        private float closed;

        LockButton(Context context) {
            super(context);
            icon = Icons.drawable(context, Icons.Kind.LOCK, Color.WHITE, 22);
            ring.setStyle(Paint.Style.STROKE);
            ring.setStrokeCap(Paint.Cap.ROUND);
            ring.setStrokeWidth(Ui.dp(context, 2.5f));
            setContentDescription(label("画面ロックを解除", "Unlock touches"));
            // TalkBack and a keyboard activate the button; a finger has to hold it.
            setOnClickListener(view -> finish(LockHold.Outcome.UNLOCK));
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            long now = SystemClock.uptimeMillis();
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    wake();
                    hold.press(now);
                    postDelayed(due, LockHold.HOLD_MS);
                    if (Motion.enabled()) {
                        closing = ValueAnimator.ofFloat(0, 1).setDuration(LockHold.HOLD_MS);
                        closing.setInterpolator(new LinearInterpolator());
                        closing.addUpdateListener(a -> {
                            closed = (float) a.getAnimatedValue();
                            invalidate();
                        });
                        closing.start();
                    }
                    invalidate();
                    break;
                case MotionEvent.ACTION_MOVE: {
                    int slop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
                    float x = event.getX(), y = event.getY();
                    if (x < -slop || y < -slop || x > getWidth() + slop || y > getHeight() + slop) release();
                    break;
                }
                case MotionEvent.ACTION_UP:
                    finish(hold.release(now));
                    break;
                case MotionEvent.ACTION_CANCEL:
                    release();
                    break;
                default:
                    break;
            }
            return true;
        }

        /** Ends a press without an outcome. */
        void release() {
            hold.cancel();
            removeCallbacks(due);
            if (closing != null) closing.cancel();
            closing = null;
            closed = 0;
            invalidate();
        }

        private void finish(LockHold.Outcome outcome) {
            try {
                release();
                if (outcome == LockHold.Outcome.UNLOCK) {
                    performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                    unlock(true);
                } else if (outcome == LockHold.Outcome.HINT) {
                    hint();
                }
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("ui.touch-lock-button", e);
            }
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f, cy = getHeight() / 2f, radius = Math.min(cx, cy) - Ui.dp(getContext(), 2);
            disc.setColor(hold.pressed() ? 0xCC000000 : 0x99000000);
            canvas.drawCircle(cx, cy, radius, disc);
            int half = icon.getIntrinsicWidth() / 2;
            icon.setBounds(Math.round(cx) - half, Math.round(cy) - half, Math.round(cx) + half, Math.round(cy) + half);
            icon.draw(canvas);
            if (!hold.pressed()) return;
            float edge = radius - ring.getStrokeWidth() / 2;
            ring.setColor(0x4DFFFFFF);
            canvas.drawCircle(cx, cy, edge, ring);
            ring.setColor(Color.WHITE);
            canvas.drawArc(cx - edge, cy - edge, cx + edge, cy + edge, -90, 360 * closed, false, ring);
        }
    }
}
