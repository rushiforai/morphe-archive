package id.ikuradachi.kageroll.extension.crunchyroll;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Adds a screen-lock toggle button to PlayerToolbar, blocks touch events on
 * InternalPlayerViewLayout while locked, renders a floating Unlock pill, and
 * guards rotation-based fullscreen changes while locked or orientation-locked.
 */
public final class ScreenLockHelper {

    public static final int FLAG_LOCK_BUTTON = 1;
    public static final int FLAG_ORIENTATION_LOCK_WHILE_LOCKED = 1 << 1;
    public static final int FLAG_ALWAYS_LOCK_ORIENTATION = 1 << 2;

    private static final int TOOLBAR_LOCK_BUTTON_TAG = 0x7e110003;
    private static final int UNLOCK_PILL_TAG = 0x7e110004;
    private static final long PILL_AUTO_HIDE_MS = 2500L;

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final Map<ViewGroup, LockState> LOCK_STATES = new WeakHashMap<>();
    private static volatile boolean anyPlayerLocked = false;

    private ScreenLockHelper() {
    }

    /**
     * Bitmask of enabled lock features. Patched at build time by ScreenLockPatch.
     */
    public static int getOptionsMask() {
        return FLAG_LOCK_BUTTON | FLAG_ORIENTATION_LOCK_WHILE_LOCKED;
    }

    private static final class LockState {
        boolean locked;
        boolean pillTouchTracking;
        LinearLayout unlockPill;
        Runnable hidePillRunnable;
        boolean detachHooked;
    }

    public static boolean shouldBlockRotationFullscreenChange() {
        int mask = getOptionsMask();
        if ((mask & FLAG_ALWAYS_LOCK_ORIENTATION) != 0) {
            return true;
        }
        return (mask & FLAG_ORIENTATION_LOCK_WHILE_LOCKED) != 0 && anyPlayerLocked;
    }

    public static void attachToolbarButton(final ViewGroup toolbar) {
        if (toolbar == null || (getOptionsMask() & FLAG_LOCK_BUTTON) == 0) {
            return;
        }
        if (toolbar.findViewById(TOOLBAR_LOCK_BUTTON_TAG) != null) {
            return;
        }

        // PlayerToolbar inflates layout/player_toolbar (LinearLayout) as its first child.
        ViewGroup row = findToolbarRow(toolbar);
        if (row == null) {
            return;
        }

        View referenceBtn = findReferenceToolbarIcon(row);
        Context context = toolbar.getContext();

        ImageButton lockBtn = new ImageButton(context);
        lockBtn.setId(TOOLBAR_LOCK_BUTTON_TAG);
        lockBtn.setContentDescription("Lock screen");
        lockBtn.setBackgroundColor(Color.TRANSPARENT);
        lockBtn.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        lockBtn.setImageDrawable(new LockIconDrawable(context, true));

        if (referenceBtn != null) {
            lockBtn.setPadding(
                    referenceBtn.getPaddingLeft(),
                    referenceBtn.getPaddingTop(),
                    referenceBtn.getPaddingRight(),
                    referenceBtn.getPaddingBottom()
            );
            ViewGroup.LayoutParams refLp = referenceBtn.getLayoutParams();
            if (refLp != null) {
                if (refLp instanceof LinearLayout.LayoutParams) {
                    LinearLayout.LayoutParams src = (LinearLayout.LayoutParams) refLp;
                    LinearLayout.LayoutParams copy = new LinearLayout.LayoutParams(src.width, src.height);
                    copy.gravity = src.gravity;
                    copy.setMargins(src.leftMargin, src.topMargin, src.rightMargin, src.bottomMargin);
                    lockBtn.setLayoutParams(copy);
                } else {
                    lockBtn.setLayoutParams(new ViewGroup.LayoutParams(refLp.width, refLp.height));
                }
            }
            int insertIndex = row.indexOfChild(referenceBtn);
            row.addView(lockBtn, Math.max(0, insertIndex));
        } else {
            int size = dpToPxInt(context, 40f);
            int pad = dpToPxInt(context, 8f);
            lockBtn.setPadding(pad, pad, pad, pad);
            lockBtn.setLayoutParams(new LinearLayout.LayoutParams(size, size));
            row.addView(lockBtn);
        }

        lockBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ViewGroup playerRoot = findPlayerRoot(toolbar);
                if (playerRoot != null) {
                    setLocked(playerRoot, true);
                }
            }
        });
    }

    public static boolean handleDispatchTouchEvent(final ViewGroup playerRoot, MotionEvent ev) {
        if (playerRoot == null || (getOptionsMask() & FLAG_LOCK_BUTTON) == 0) {
            return false;
        }

        final LockState state;
        synchronized (LOCK_STATES) {
            state = LOCK_STATES.get(playerRoot);
        }
        if (state == null || !state.locked) {
            return false;
        }

        if (ev == null) {
            return true;
        }

        LinearLayout pill = ensureUnlockPill(playerRoot, state);
        int action = ev.getActionMasked();
        boolean inPill = pill != null && pill.getVisibility() == View.VISIBLE
                && isPointInView(pill, ev.getX(), ev.getY(), dpToPx(playerRoot.getContext(), 12f));

        if (action == MotionEvent.ACTION_DOWN) {
            state.pillTouchTracking = inPill;
            if (!inPill) {
                showUnlockPillTemporarily(state);
            } else if (state.hidePillRunnable != null) {
                MAIN_HANDLER.removeCallbacks(state.hidePillRunnable);
            }
            return true;
        }

        if (action == MotionEvent.ACTION_UP) {
            boolean shouldUnlock = state.pillTouchTracking && inPill;
            state.pillTouchTracking = false;
            if (shouldUnlock) {
                setLocked(playerRoot, false);
            } else {
                showUnlockPillTemporarily(state);
            }
            return true;
        }

        if (action == MotionEvent.ACTION_CANCEL) {
            state.pillTouchTracking = false;
            return true;
        }

        return true;
    }

    private static void setLocked(final ViewGroup playerRoot, boolean locked) {
        LockState state;
        synchronized (LOCK_STATES) {
            state = LOCK_STATES.get(playerRoot);
            if (state == null) {
                state = new LockState();
                LOCK_STATES.put(playerRoot, state);
            }
            state.locked = locked;
            anyPlayerLocked = computeAnyLockedLocked();
        }

        if (!state.detachHooked) {
            state.detachHooked = true;
            playerRoot.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View v) {
                }

                @Override
                public void onViewDetachedFromWindow(View v) {
                    clearLockOnDetach(playerRoot);
                }
            });
        }

        if (locked) {
            hidePlayerControls(playerRoot);
            ensureUnlockPill(playerRoot, state);
            showUnlockPillTemporarily(state);
        } else {
            if (state.hidePillRunnable != null) {
                MAIN_HANDLER.removeCallbacks(state.hidePillRunnable);
            }
            if (state.unlockPill != null) {
                state.unlockPill.animate().cancel();
                state.unlockPill.setVisibility(View.GONE);
            }
            showPlayerControls(playerRoot);
        }
    }

    private static void clearLockOnDetach(ViewGroup playerRoot) {
        synchronized (LOCK_STATES) {
            LockState state = LOCK_STATES.get(playerRoot);
            if (state != null) {
                state.locked = false;
                state.pillTouchTracking = false;
                if (state.hidePillRunnable != null) {
                    MAIN_HANDLER.removeCallbacks(state.hidePillRunnable);
                }
                if (state.unlockPill != null) {
                    state.unlockPill.setVisibility(View.GONE);
                }
            }
            anyPlayerLocked = computeAnyLockedLocked();
        }
    }

    private static boolean computeAnyLockedLocked() {
        for (LockState s : LOCK_STATES.values()) {
            if (s != null && s.locked) {
                return true;
            }
        }
        return false;
    }

    private static LinearLayout ensureUnlockPill(final ViewGroup playerRoot, LockState state) {
        if (state.unlockPill != null && state.unlockPill.getParent() == playerRoot) {
            return state.unlockPill;
        }
        View existing = playerRoot.findViewById(UNLOCK_PILL_TAG);
        if (existing instanceof LinearLayout) {
            state.unlockPill = (LinearLayout) existing;
            return state.unlockPill;
        }

        Context context = playerRoot.getContext();
        LinearLayout pill = new LinearLayout(context);
        pill.setId(UNLOCK_PILL_TAG);
        pill.setOrientation(LinearLayout.HORIZONTAL);
        pill.setGravity(Gravity.CENTER_VERTICAL);
        int padH = dpToPxInt(context, 16f);
        int padV = dpToPxInt(context, 9f);
        pill.setPadding(padH, padV, padH, padV);
        pill.setVisibility(View.GONE);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.argb(215, 22, 22, 26));
        bg.setStroke(dpToPxInt(context, 1f), Color.argb(90, 255, 255, 255));
        bg.setCornerRadius(dpToPx(context, 24f));
        pill.setBackground(bg);

        ImageView icon = new ImageView(context);
        icon.setImageDrawable(new LockIconDrawable(context, false));
        int iconSize = dpToPxInt(context, 18f);
        LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(iconSize, iconSize);
        iconLp.rightMargin = dpToPxInt(context, 8f);
        pill.addView(icon, iconLp);

        TextView label = new TextView(context);
        label.setText("Unlock");
        label.setTextColor(Color.WHITE);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        pill.addView(label);

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL
        );
        lp.bottomMargin = dpToPxInt(context, 32f);
        playerRoot.addView(pill, lp);

        state.unlockPill = pill;
        return pill;
    }

    private static void showUnlockPillTemporarily(final LockState state) {
        final LinearLayout pill = state.unlockPill;
        if (pill == null) {
            return;
        }
        if (state.hidePillRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.hidePillRunnable);
        }
        pill.animate().cancel();
        pill.setAlpha(1f);
        pill.setVisibility(View.VISIBLE);
        pill.bringToFront();

        state.hidePillRunnable = new Runnable() {
            @Override
            public void run() {
                pill.animate()
                        .alpha(0f)
                        .setDuration(220L)
                        .withEndAction(new Runnable() {
                            @Override
                            public void run() {
                                pill.setVisibility(View.GONE);
                            }
                        })
                        .start();
            }
        };
        MAIN_HANDLER.postDelayed(state.hidePillRunnable, PILL_AUTO_HIDE_MS);
    }

    private static boolean isPointInView(View view, float x, float y, float slop) {
        return x >= (view.getLeft() - slop)
                && x <= (view.getRight() + slop)
                && y >= (view.getTop() - slop)
                && y <= (view.getBottom() + slop);
    }

    private static void hidePlayerControls(ViewGroup playerRoot) {
        if (invokeVisibilityPresenter(playerRoot, "W3")) {
            return;
        }
        try {
            playerRoot.getClass().getMethod("hideControls").invoke(playerRoot);
        } catch (Exception ignored) {
        }
    }

    private static void showPlayerControls(ViewGroup playerRoot) {
        if (invokeVisibilityPresenter(playerRoot, "T3")) {
            return;
        }
        try {
            playerRoot.getClass().getMethod("showControls").invoke(playerRoot);
        } catch (Exception ignored) {
        }
    }

    private static boolean invokeVisibilityPresenter(ViewGroup playerRoot, String vmMethodName) {
        try {
            for (Field f : playerRoot.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object presenter = f.get(playerRoot);
                if (presenter == null) continue;
                for (Field pf : presenter.getClass().getDeclaredFields()) {
                    pf.setAccessible(true);
                    Object vm = pf.get(presenter);
                    if (vm == null) continue;
                    try {
                        Method w3 = vm.getClass().getMethod("W3");
                        Method t3 = vm.getClass().getMethod("T3");
                        if (w3 != null && t3 != null) {
                            (vmMethodName.equals("W3") ? w3 : t3).invoke(vm);
                            return true;
                        }
                    } catch (NoSuchMethodException ignored) {
                    }
                }
            }
        } catch (Exception ignored) {
        }
        return false;
    }

    private static ViewGroup findToolbarRow(ViewGroup toolbar) {
        if (toolbar.getChildCount() > 0 && toolbar.getChildAt(0) instanceof ViewGroup) {
            ViewGroup inner = (ViewGroup) toolbar.getChildAt(0);
            if (inner instanceof LinearLayout) {
                return inner;
            }
        }
        return toolbar;
    }

    private static View findReferenceToolbarIcon(ViewGroup row) {
        for (int i = row.getChildCount() - 1; i >= 0; i--) {
            View child = row.getChildAt(i);
            if (child instanceof ImageView) {
                return child;
            }
        }
        return null;
    }

    private static ViewGroup findPlayerRoot(View view) {
        ViewParent parent = view.getParent();
        while (parent instanceof View) {
            String name = parent.getClass().getName();
            if (name.endsWith("InternalPlayerViewLayout") || parent instanceof FrameLayout && hasHideControlsMethod(parent)) {
                return (ViewGroup) parent;
            }
            parent = parent.getParent();
        }
        return null;
    }

    private static boolean hasHideControlsMethod(Object candidate) {
        try {
            candidate.getClass().getMethod("hideControls");
            return true;
        } catch (NoSuchMethodException ignored) {
            return false;
        }
    }

    private static float dpToPx(Context context, float dp) {
        return TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                context.getResources().getDisplayMetrics()
        );
    }

    private static int dpToPxInt(Context context, float dp) {
        return Math.round(dpToPx(context, dp));
    }

    private static final class LockIconDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final boolean locked;
        private final float strokeWidth;

        LockIconDrawable(Context context, boolean locked) {
            this.locked = locked;
            this.strokeWidth = dpToPx(context, 1.8f);
            this.paint.setColor(Color.WHITE);
            this.paint.setStrokeCap(Paint.Cap.ROUND);
            this.paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            int w = getBounds().width();
            int h = getBounds().height();
            if (w <= 0 || h <= 0) return;

            float cx = w * 0.5f;
            float bodyW = w * 0.58f;
            float bodyH = h * 0.44f;
            float left = cx - bodyW * 0.5f;
            float top = h * 0.46f;
            float right = cx + bodyW * 0.5f;
            float bottom = top + bodyH;

            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(strokeWidth);

            float shackleRadius = bodyW * 0.30f;
            float shackleTop = top - bodyH * 0.58f;
            Path shackle = new Path();
            if (locked) {
                shackle.moveTo(cx - shackleRadius, top);
                shackle.lineTo(cx - shackleRadius, shackleTop + shackleRadius);
                shackle.arcTo(
                        new RectF(cx - shackleRadius, shackleTop, cx + shackleRadius, shackleTop + shackleRadius * 2f),
                        180f, 180f, false
                );
                shackle.lineTo(cx + shackleRadius, top);
            } else {
                float shiftedCx = cx + shackleRadius * 0.7f;
                shackle.moveTo(shiftedCx - shackleRadius, top);
                shackle.lineTo(shiftedCx - shackleRadius, shackleTop + shackleRadius);
                shackle.arcTo(
                        new RectF(shiftedCx - shackleRadius, shackleTop, shiftedCx + shackleRadius, shackleTop + shackleRadius * 2f),
                        180f, 180f, false
                );
            }
            canvas.drawPath(shackle, paint);

            paint.setStyle(Paint.Style.FILL);
            RectF body = new RectF(left, top, right, bottom);
            float corner = w * 0.1f;
            canvas.drawRoundRect(body, corner, corner, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
