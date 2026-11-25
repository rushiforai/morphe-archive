package dev.materialtidal.extension.tidal.gestures;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.os.Build;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.animation.Interpolator;

import androidx.recyclerview.widget.RecyclerView;

/**
 * Attaches Material 3 Expressive horizontal swipe gestures to any vertical {@link RecyclerView}
 * whose rows carry a bound TIDAL Track tag.
 */
public final class TrackSwipeController {

    private static final int TAG_TRACK = 0x7A4D5401;
    private static final int TAG_CONTROLLER = 0x7A4D5402;
    private static final int TAG_ATTACH_LISTENER = 0x7A4D5403;
    private static final int MAX_DECORATION_POST_ATTEMPTS = 6;

    private static final Interpolator SPRING_SETTLE_INTERPOLATOR = t -> {
        // Underdamped spring curve settling smoothly to 1.0 at t=1.
        if (t <= 0f) return 0f;
        if (t >= 1f) return 1f;
        return 1f - (float) (Math.exp(-7.5 * t) * Math.cos(11.0 * t));
    };

    private final RecyclerView recyclerView;
    private final MaterialExpressiveSwipeRenderer renderer = new MaterialExpressiveSwipeRenderer();
    private final int touchSlop;
    private final float density;
    private final float edgeSlopPx;

    private View activeChild;
    private Object activeTrack;
    private int activeAction = TrackSwipeConfig.ACTION_NONE;
    private boolean activeTrackIsFavorite;
    private int activePointerId = MotionEvent.INVALID_POINTER_ID;
    private float downX;
    private float downY;
    private float initialTranslationX;
    private boolean isDragging;
    private boolean trackingCancelled;
    private boolean thresholdCrossed;

    private final RecyclerView.ItemDecoration itemDecoration;
    private final Runnable installDecorationRunnable;
    private boolean decorationInstalled;
    private boolean decorationPostPending;
    private int decorationInstallAttempts;
    private View settlingChild;

    private ValueAnimator settleAnimator;
    private ValueAnimator popAnimator;
    private float pulseBoost;
    private int lastVisualAction = TrackSwipeConfig.ACTION_NONE;
    private boolean lastVisualFavorite;

    private TrackSwipeController(RecyclerView recyclerView) {
        this.recyclerView = recyclerView;
        Context ctx = recyclerView.getContext();
        this.touchSlop = ViewConfiguration.get(ctx).getScaledTouchSlop();
        this.density = ctx.getResources().getDisplayMetrics().density;
        this.edgeSlopPx = 24f * this.density;
        this.itemDecoration = new RecyclerView.ItemDecoration() {
            @Override
            public void onDraw(Canvas c, RecyclerView parent, RecyclerView.State state) {
                drawDecorations(c, parent);
            }
        };
        this.installDecorationRunnable = () -> {
            decorationPostPending = false;
            if (decorationInstalled) {
                return;
            }
            if (!tryInstallDecorationNow() && decorationInstallAttempts < MAX_DECORATION_POST_ATTEMPTS) {
                decorationInstallAttempts++;
                scheduleDecorationInstall();
            }
        };
    }

    public static void bindRow(View itemView, Object track) {
        if (itemView == null) {
            return;
        }
        itemView.setTag(TAG_TRACK, track);

        ViewParent parent = itemView.getParent();
        if (parent instanceof RecyclerView) {
            RecyclerView rv = (RecyclerView) parent;
            TrackSwipeController existing = getController(rv);
            if (existing != null && existing.settlingChild == itemView) {
                existing.cancelSettleAnimator();
            }
            if (existing == null || existing.activeChild != itemView) {
                itemView.setTranslationX(0f);
            }
            if (track != null) {
                attachToRecyclerView(rv);
            }
            return;
        }

        itemView.setTranslationX(0f);
        if (track == null) {
            return;
        }

        if (itemView.getTag(TAG_ATTACH_LISTENER) != null) {
            return;
        }

        View.OnAttachStateChangeListener attachListener = new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                v.removeOnAttachStateChangeListener(this);
                v.setTag(TAG_ATTACH_LISTENER, null);
                ViewParent vp = v.getParent();
                if (vp instanceof RecyclerView && v.getTag(TAG_TRACK) != null) {
                    attachToRecyclerView((RecyclerView) vp);
                }
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
            }
        };
        itemView.setTag(TAG_ATTACH_LISTENER, attachListener);
        itemView.addOnAttachStateChangeListener(attachListener);
    }

    private static TrackSwipeController getController(RecyclerView rv) {
        Object tag = rv.getTag(TAG_CONTROLLER);
        return (tag instanceof TrackSwipeController) ? (TrackSwipeController) tag : null;
    }

    private static void attachToRecyclerView(RecyclerView rv) {
        if (rv == null || rv.getTag(TAG_CONTROLLER) != null) {
            return;
        }
        if (isExcludedRecyclerView(rv)) {
            return;
        }

        TrackSwipeController controller = new TrackSwipeController(rv);
        rv.setTag(TAG_CONTROLLER, controller);
        controller.install();
    }

    private static boolean isExcludedRecyclerView(RecyclerView rv) {
        int id = rv.getId();
        if (id == View.NO_ID) {
            return false;
        }
        try {
            String entry = rv.getResources().getResourceEntryName(id);
            if (entry != null) {
                String lower = entry.toLowerCase();
                return lower.contains("playqueue")
                        || lower.contains("play_queue")
                        || lower.contains("edit_playlist");
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private void install() {
        recyclerView.addOnItemTouchListener(new RecyclerView.OnItemTouchListener() {
            @Override
            public boolean onInterceptTouchEvent(RecyclerView rv, MotionEvent e) {
                return handleInterceptTouch(e);
            }

            @Override
            public void onTouchEvent(RecyclerView rv, MotionEvent e) {
                handleTouch(e);
            }

            @Override
            public void onRequestDisallowInterceptTouchEvent(boolean disallowIntercept) {
                if (disallowIntercept) {
                    resetTracking(true);
                }
            }
        });

        recyclerView.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
            @Override
            public void onChildViewAttachedToWindow(View view) {
            }

            @Override
            public void onChildViewDetachedFromWindow(View view) {
                if (view == activeChild) {
                    cancelSettleAnimator();
                    activeChild = null;
                    activeTrack = null;
                    isDragging = false;
                    trackingCancelled = true;
                } else if (view == settlingChild) {
                    cancelSettleAnimator();
                }
                view.setTranslationX(0f);
            }
        });

        ensureDecorationInstalled();
    }

    private void ensureDecorationInstalled() {
        if (decorationInstalled) {
            return;
        }
        if (!tryInstallDecorationNow()) {
            scheduleDecorationInstall();
        }
    }

    private boolean tryInstallDecorationNow() {
        if (decorationInstalled) {
            return true;
        }
        if (recyclerView.isComputingLayout()) {
            return false;
        }
        try {
            recyclerView.addItemDecoration(itemDecoration);
            decorationInstalled = true;
            return true;
        } catch (IllegalStateException ignored) {
            return false;
        }
    }

    private void scheduleDecorationInstall() {
        if (decorationInstalled || decorationPostPending) {
            return;
        }
        decorationPostPending = true;
        recyclerView.post(installDecorationRunnable);
    }

    private boolean isVerticalList() {
        RecyclerView.LayoutManager lm = recyclerView.getLayoutManager();
        return lm != null && lm.canScrollVertically() && !lm.canScrollHorizontally();
    }

    private float getThresholdPx() {
        int dp = Math.max(36, TrackSwipeConfig.getSwipeThresholdDp());
        return dp * density;
    }

    private int getActionForDelta(float dx) {
        if (dx > 0f) {
            return TrackSwipeConfig.getSwipeRightAction();
        }
        if (dx < 0f) {
            return TrackSwipeConfig.getSwipeLeftAction();
        }
        return TrackSwipeConfig.ACTION_NONE;
    }

    private boolean handleInterceptTouch(MotionEvent e) {
        int action = e.getActionMasked();

        if (action == MotionEvent.ACTION_DOWN) {
            ensureDecorationInstalled();
            trackingCancelled = false;
            isDragging = false;
            thresholdCrossed = false;
            activeAction = TrackSwipeConfig.ACTION_NONE;
            activeChild = null;
            activeTrack = null;

            if (!isVerticalList()) {
                trackingCancelled = true;
                return false;
            }

            float x = e.getX();
            float y = e.getY();
            if (x < edgeSlopPx || x > recyclerView.getWidth() - edgeSlopPx) {
                trackingCancelled = true;
                return false;
            }

            View child = recyclerView.findChildViewUnder(x, y);
            Object track = (child != null) ? child.getTag(TAG_TRACK) : null;
            if (child == null || track == null) {
                trackingCancelled = true;
                return false;
            }

            cancelSettleAnimator();
            activeChild = child;
            activeTrack = track;
            activeTrackIsFavorite = TidalActionBridge.isFavoriteTrack(track);
            activePointerId = e.getPointerId(0);
            downX = x;
            downY = y;
            initialTranslationX = child.getTranslationX();
            return false;
        }

        if (trackingCancelled || activeChild == null) {
            return false;
        }

        if (action == MotionEvent.ACTION_MOVE) {
            int idx = e.findPointerIndex(activePointerId);
            if (idx < 0) {
                return false;
            }
            float dx = e.getX(idx) - downX;
            float dy = e.getY(idx) - downY;

            if (Math.abs(dy) > touchSlop && Math.abs(dy) * 1.35f >= Math.abs(dx)) {
                trackingCancelled = true;
                activeChild = null;
                activeTrack = null;
                return false;
            }

            if (Math.abs(dx) > touchSlop && Math.abs(dx) > Math.abs(dy) * 1.35f) {
                int candidateAction = getActionForDelta(dx);
                if (candidateAction == TrackSwipeConfig.ACTION_NONE) {
                    trackingCancelled = true;
                    activeChild = null;
                    activeTrack = null;
                    return false;
                }

                ensureDecorationInstalled();
                isDragging = true;
                activeAction = candidateAction;
                lastVisualAction = candidateAction;
                lastVisualFavorite = activeTrackIsFavorite;

                ViewParent parent = recyclerView.getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                }
                updateDragTranslation(dx);
                return true;
            }
        } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            resetTracking(false);
        }

        return false;
    }

    private void handleTouch(MotionEvent e) {
        if (trackingCancelled || activeChild == null) {
            return;
        }

        int action = e.getActionMasked();
        switch (action) {
            case MotionEvent.ACTION_MOVE: {
                int idx = e.findPointerIndex(activePointerId);
                if (idx < 0) {
                    return;
                }
                float dx = e.getX(idx) - downX;
                updateDragTranslation(dx);
                break;
            }
            case MotionEvent.ACTION_UP: {
                boolean triggered = thresholdCrossed;
                View targetView = activeChild;
                Object targetTrack = activeTrack;
                int targetAction = activeAction;

                if (triggered && targetTrack != null && targetAction != TrackSwipeConfig.ACTION_NONE) {
                    if (TrackSwipeConfig.isHapticEnabled()) {
                        performConfirmHaptic(targetView);
                    }
                    TidalActionBridge.performAction(targetView, targetTrack, targetAction);
                }
                snapBack(targetView);
                clearActiveRefs();
                break;
            }
            case MotionEvent.ACTION_CANCEL: {
                snapBack(activeChild);
                clearActiveRefs();
                break;
            }
            case MotionEvent.ACTION_POINTER_UP: {
                int pointerIdx = e.getActionIndex();
                if (e.getPointerId(pointerIdx) == activePointerId) {
                    int newIdx = (pointerIdx == 0) ? 1 : 0;
                    if (newIdx < e.getPointerCount()) {
                        downX = e.getX(newIdx) - (activeChild.getTranslationX() - initialTranslationX);
                        downY = e.getY(newIdx);
                        activePointerId = e.getPointerId(newIdx);
                    }
                }
                break;
            }
            default:
                break;
        }
    }

    private void updateDragTranslation(float rawDx) {
        if (activeChild == null) {
            return;
        }

        float totalRawDx = initialTranslationX + rawDx;
        int dirAction = getActionForDelta(totalRawDx);
        if (dirAction == TrackSwipeConfig.ACTION_NONE) {
            totalRawDx = 0f;
        } else {
            activeAction = dirAction;
            lastVisualAction = dirAction;
            lastVisualFavorite = activeTrackIsFavorite;
        }

        float threshold = getThresholdPx();
        float absDx = Math.abs(totalRawDx);
        float dampedAbs;
        if (absDx <= threshold) {
            dampedAbs = absDx;
        } else {
            float maxExtra = threshold * 0.5f;
            float over = absDx - threshold;
            dampedAbs = threshold + maxExtra * (float) Math.tanh(over / (threshold * 0.85f));
        }

        float finalDx = Math.copySign(dampedAbs, totalRawDx);
        activeChild.setTranslationX(finalDx);

        boolean nowCrossed = dampedAbs >= threshold && activeAction != TrackSwipeConfig.ACTION_NONE;
        if (nowCrossed != thresholdCrossed) {
            thresholdCrossed = nowCrossed;
            if (nowCrossed) {
                triggerPopPulse();
                if (TrackSwipeConfig.isHapticEnabled()) {
                    activeChild.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                }
            } else if (TrackSwipeConfig.isHapticEnabled()) {
                activeChild.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
            }
        }

        recyclerView.invalidate();
    }

    private void drawDecorations(Canvas c, RecyclerView parent) {
        int count = parent.getChildCount();
        float threshold = getThresholdPx();
        for (int i = 0; i < count; i++) {
            View child = parent.getChildAt(i);
            float tx = child.getTranslationX();
            if (Math.abs(tx) > 0.5f) {
                int action;
                boolean fav;
                float boost;
                if (child == activeChild && activeAction != TrackSwipeConfig.ACTION_NONE) {
                    action = activeAction;
                    fav = activeTrackIsFavorite;
                    boost = pulseBoost;
                } else {
                    action = lastVisualAction != TrackSwipeConfig.ACTION_NONE
                            ? lastVisualAction
                            : getActionForDelta(tx);
                    fav = lastVisualFavorite;
                    boost = pulseBoost;
                }
                renderer.drawBehindRow(c, child, tx, threshold, action, fav, boost);
            }
        }
    }

    private void triggerPopPulse() {
        if (popAnimator != null) {
            popAnimator.cancel();
        }
        popAnimator = ValueAnimator.ofFloat(0f, 1f, 0f);
        popAnimator.setDuration(220L);
        popAnimator.addUpdateListener(anim -> {
            pulseBoost = (float) anim.getAnimatedValue();
            recyclerView.invalidate();
        });
        popAnimator.start();
    }

    private void snapBack(View target) {
        if (target == null) {
            return;
        }
        float startX = target.getTranslationX();
        if (Math.abs(startX) < 0.5f) {
            target.setTranslationX(0f);
            recyclerView.invalidate();
            return;
        }

        cancelSettleAnimator();
        settlingChild = target;
        settleAnimator = ValueAnimator.ofFloat(startX, 0f);
        settleAnimator.setDuration(340L);
        settleAnimator.setInterpolator(SPRING_SETTLE_INTERPOLATOR);
        settleAnimator.addUpdateListener(anim -> {
            target.setTranslationX((float) anim.getAnimatedValue());
            recyclerView.invalidate();
        });
        settleAnimator.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                if (settleAnimator == animation) {
                    settleAnimator = null;
                }
                if (settlingChild == target) {
                    settlingChild = null;
                }
                target.setTranslationX(0f);
                recyclerView.invalidate();
            }

            @Override
            public void onAnimationCancel(Animator animation) {
                if (settleAnimator == animation) {
                    settleAnimator = null;
                }
                if (settlingChild == target) {
                    settlingChild = null;
                }
                target.setTranslationX(0f);
                recyclerView.invalidate();
            }
        });
        settleAnimator.start();
    }

    private void cancelSettleAnimator() {
        if (settleAnimator != null) {
            ValueAnimator anim = settleAnimator;
            settleAnimator = null;
            anim.cancel();
        }
        settlingChild = null;
    }

    private void resetTracking(boolean animateBack) {
        if (animateBack && activeChild != null) {
            snapBack(activeChild);
        }
        clearActiveRefs();
        trackingCancelled = true;
    }

    private void clearActiveRefs() {
        isDragging = false;
        thresholdCrossed = false;
        activePointerId = MotionEvent.INVALID_POINTER_ID;
        activeAction = TrackSwipeConfig.ACTION_NONE;
        activeChild = null;
        activeTrack = null;
    }

    private static void performConfirmHaptic(View v) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            v.performHapticFeedback(HapticFeedbackConstants.CONFIRM);
        } else {
            v.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
        }
    }
}
