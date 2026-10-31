package androidx.recyclerview.widget;

import android.annotation.SuppressLint;
import android.graphics.Canvas;
import android.view.View;
import android.view.animation.Interpolator;
import java.util.List;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public abstract class n0 {
    private static final int ABS_HORIZONTAL_DIR_FLAGS = 789516;
    public static final int DEFAULT_DRAG_ANIMATION_DURATION = 200;
    public static final int DEFAULT_SWIPE_ANIMATION_DURATION = 250;
    private static final long DRAG_SCROLL_ACCELERATION_LIMIT_TIME_MS = 2000;
    static final int RELATIVE_DIR_FLAGS = 3158064;
    private static final Interpolator sDragScrollInterpolator = new m0(0);
    private static final Interpolator sDragViewScrollCapInterpolator = new m0(1);
    private int mCachedMaxScrollSpeed = -1;

    public static int convertToRelativeDirection(int i5, int i11) {
        int i12;
        int i13 = i5 & ABS_HORIZONTAL_DIR_FLAGS;
        if (i13 == 0) {
            return i5;
        }
        int i14 = i5 & (~i13);
        if (i11 == 0) {
            i12 = i13 << 2;
        } else {
            int i15 = i13 << 1;
            i14 |= (-789517) & i15;
            i12 = (i15 & ABS_HORIZONTAL_DIR_FLAGS) << 2;
        }
        return i14 | i12;
    }

    public static s0 getDefaultUIUtil() {
        return t0.f15124a;
    }

    public static int makeFlag(int i5, int i11) {
        return i11 << (i5 * 8);
    }

    public static int makeMovementFlags(int i5, int i11) {
        return makeFlag(2, i5) | makeFlag(1, i11) | makeFlag(0, i11 | i5);
    }

    public boolean canDropOver(RecyclerView recyclerView, s2 s2Var, s2 s2Var2) {
        return true;
    }

    @SuppressLint({"UnknownNullness"})
    public s2 chooseDropTarget(s2 s2Var, List<s2> list, int i5, int i11) {
        int bottom;
        int iAbs;
        int top;
        int iAbs2;
        int left;
        int iAbs3;
        int right;
        int iAbs4;
        int width = s2Var.itemView.getWidth() + i5;
        int height = s2Var.itemView.getHeight() + i11;
        int left2 = i5 - s2Var.itemView.getLeft();
        int top2 = i11 - s2Var.itemView.getTop();
        int size = list.size();
        s2 s2Var2 = null;
        int i12 = -1;
        for (int i13 = 0; i13 < size; i13++) {
            s2 s2Var3 = list.get(i13);
            if (left2 > 0 && (right = s2Var3.itemView.getRight() - width) < 0 && s2Var3.itemView.getRight() > s2Var.itemView.getRight() && (iAbs4 = Math.abs(right)) > i12) {
                s2Var2 = s2Var3;
                i12 = iAbs4;
            }
            if (left2 < 0 && (left = s2Var3.itemView.getLeft() - i5) > 0 && s2Var3.itemView.getLeft() < s2Var.itemView.getLeft() && (iAbs3 = Math.abs(left)) > i12) {
                s2Var2 = s2Var3;
                i12 = iAbs3;
            }
            if (top2 < 0 && (top = s2Var3.itemView.getTop() - i11) > 0 && s2Var3.itemView.getTop() < s2Var.itemView.getTop() && (iAbs2 = Math.abs(top)) > i12) {
                s2Var2 = s2Var3;
                i12 = iAbs2;
            }
            if (top2 > 0 && (bottom = s2Var3.itemView.getBottom() - height) < 0 && s2Var3.itemView.getBottom() > s2Var.itemView.getBottom() && (iAbs = Math.abs(bottom)) > i12) {
                s2Var2 = s2Var3;
                i12 = iAbs;
            }
        }
        return s2Var2;
    }

    public void clearView(RecyclerView recyclerView, s2 s2Var) {
        View view = s2Var.itemView;
        Object tag = view.getTag(2131428244);
        if (tag instanceof Float) {
            float fFloatValue = ((Float) tag).floatValue();
            WeakHashMap weakHashMap = a5.a1.f250a;
            a5.s0.k(view, fFloatValue);
        }
        view.setTag(2131428244, null);
        view.setTranslationX(0.0f);
        view.setTranslationY(0.0f);
    }

    public int convertToAbsoluteDirection(int i5, int i11) {
        int i12;
        int i13 = i5 & RELATIVE_DIR_FLAGS;
        if (i13 == 0) {
            return i5;
        }
        int i14 = i5 & (~i13);
        if (i11 == 0) {
            i12 = i13 >> 2;
        } else {
            int i15 = i13 >> 1;
            i14 |= (-3158065) & i15;
            i12 = (i15 & RELATIVE_DIR_FLAGS) >> 2;
        }
        return i14 | i12;
    }

    public final int getAbsoluteMovementFlags(RecyclerView recyclerView, s2 s2Var) {
        int movementFlags = getMovementFlags(recyclerView, s2Var);
        WeakHashMap weakHashMap = a5.a1.f250a;
        return convertToAbsoluteDirection(movementFlags, recyclerView.getLayoutDirection());
    }

    public long getAnimationDuration(RecyclerView recyclerView, int i5, float f11, float f12) {
        u1 itemAnimator = recyclerView.getItemAnimator();
        return itemAnimator == null ? i5 == 8 ? 200L : 250L : i5 == 8 ? itemAnimator.getMoveDuration() : itemAnimator.getRemoveDuration();
    }

    public int getBoundingBoxMargin() {
        return 0;
    }

    public float getMoveThreshold(s2 s2Var) {
        return 0.5f;
    }

    public abstract int getMovementFlags(RecyclerView recyclerView, s2 s2Var);

    public float getSwipeEscapeVelocity(float f11) {
        return f11;
    }

    public float getSwipeThreshold(s2 s2Var) {
        return 0.5f;
    }

    public float getSwipeVelocityThreshold(float f11) {
        return f11;
    }

    public boolean hasDragFlag(RecyclerView recyclerView, s2 s2Var) {
        return (getAbsoluteMovementFlags(recyclerView, s2Var) & 16711680) != 0;
    }

    public boolean hasSwipeFlag(RecyclerView recyclerView, s2 s2Var) {
        return (getAbsoluteMovementFlags(recyclerView, s2Var) & 65280) != 0;
    }

    public int interpolateOutOfBoundsScroll(RecyclerView recyclerView, int i5, int i11, int i12, long j11) {
        if (this.mCachedMaxScrollSpeed == -1) {
            this.mCachedMaxScrollSpeed = recyclerView.getResources().getDimensionPixelSize(2131165589);
        }
        int interpolation = (int) (sDragScrollInterpolator.getInterpolation(j11 <= DRAG_SCROLL_ACCELERATION_LIMIT_TIME_MS ? j11 / 2000.0f : 1.0f) * ((int) (sDragViewScrollCapInterpolator.getInterpolation(Math.min(1.0f, (Math.abs(i11) * 1.0f) / i5)) * ((int) Math.signum(i11)) * this.mCachedMaxScrollSpeed)));
        return interpolation == 0 ? i11 > 0 ? 1 : -1 : interpolation;
    }

    public boolean isItemViewSwipeEnabled() {
        return true;
    }

    public boolean isLongPressDragEnabled() {
        return true;
    }

    public void onChildDraw(Canvas canvas, RecyclerView recyclerView, s2 s2Var, float f11, float f12, int i5, boolean z11) {
        View view = s2Var.itemView;
        if (z11 && view.getTag(2131428244) == null) {
            WeakHashMap weakHashMap = a5.a1.f250a;
            Float fValueOf = Float.valueOf(a5.s0.e(view));
            int childCount = recyclerView.getChildCount();
            float f13 = 0.0f;
            for (int i11 = 0; i11 < childCount; i11++) {
                View childAt = recyclerView.getChildAt(i11);
                if (childAt != view) {
                    WeakHashMap weakHashMap2 = a5.a1.f250a;
                    float fE = a5.s0.e(childAt);
                    if (fE > f13) {
                        f13 = fE;
                    }
                }
            }
            a5.s0.k(view, f13 + 1.0f);
            view.setTag(2131428244, fValueOf);
        }
        view.setTranslationX(f11);
        view.setTranslationY(f12);
    }

    public void onChildDrawOver(Canvas canvas, RecyclerView recyclerView, @SuppressLint({"UnknownNullness"}) s2 s2Var, float f11, float f12, int i5, boolean z11) {
        View view = s2Var.itemView;
    }

    public void onDraw(Canvas canvas, RecyclerView recyclerView, s2 s2Var, List<k0> list, int i5, float f11, float f12) {
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            k0 k0Var = list.get(i11);
            s2 s2Var2 = k0Var.f15020e;
            float f13 = k0Var.f15016a;
            float f14 = k0Var.f15018c;
            if (f13 == f14) {
                k0Var.f15024i = s2Var2.itemView.getTranslationX();
            } else {
                k0Var.f15024i = a2.c.a(f14, f13, k0Var.f15028m, f13);
            }
            float f15 = k0Var.f15017b;
            float f16 = k0Var.f15019d;
            if (f15 == f16) {
                k0Var.f15025j = s2Var2.itemView.getTranslationY();
            } else {
                k0Var.f15025j = a2.c.a(f16, f15, k0Var.f15028m, f15);
            }
            int iSave = canvas.save();
            onChildDraw(canvas, recyclerView, k0Var.f15020e, k0Var.f15024i, k0Var.f15025j, k0Var.f15021f, false);
            canvas.restoreToCount(iSave);
        }
        if (s2Var != null) {
            int iSave2 = canvas.save();
            onChildDraw(canvas, recyclerView, s2Var, f11, f12, i5, true);
            canvas.restoreToCount(iSave2);
        }
    }

    public void onDrawOver(Canvas canvas, RecyclerView recyclerView, s2 s2Var, List<k0> list, int i5, float f11, float f12) {
        int size = list.size();
        boolean z11 = false;
        for (int i11 = 0; i11 < size; i11++) {
            k0 k0Var = list.get(i11);
            int iSave = canvas.save();
            onChildDrawOver(canvas, recyclerView, k0Var.f15020e, k0Var.f15024i, k0Var.f15025j, k0Var.f15021f, false);
            canvas.restoreToCount(iSave);
        }
        if (s2Var != null) {
            int iSave2 = canvas.save();
            onChildDrawOver(canvas, recyclerView, s2Var, f11, f12, i5, true);
            canvas.restoreToCount(iSave2);
        }
        for (int i12 = size - 1; i12 >= 0; i12--) {
            k0 k0Var2 = list.get(i12);
            boolean z12 = k0Var2.f15027l;
            if (z12 && !k0Var2.f15023h) {
                list.remove(i12);
            } else if (!z12) {
                z11 = true;
            }
        }
        if (z11) {
            recyclerView.invalidate();
        }
    }

    public abstract boolean onMove(RecyclerView recyclerView, s2 s2Var, s2 s2Var2);

    /* JADX WARN: Multi-variable type inference failed */
    public void onMoved(RecyclerView recyclerView, s2 s2Var, int i5, s2 s2Var2, int i11, int i12, int i13) {
        z1 layoutManager = recyclerView.getLayoutManager();
        if (layoutManager instanceof q0) {
            ((q0) layoutManager).prepareForDrop(s2Var.itemView, s2Var2.itemView, i12, i13);
            return;
        }
        if (layoutManager.canScrollHorizontally()) {
            if (layoutManager.getDecoratedLeft(s2Var2.itemView) <= recyclerView.getPaddingLeft()) {
                recyclerView.scrollToPosition(i11);
            }
            if (layoutManager.getDecoratedRight(s2Var2.itemView) >= recyclerView.getWidth() - recyclerView.getPaddingRight()) {
                recyclerView.scrollToPosition(i11);
            }
        }
        if (layoutManager.canScrollVertically()) {
            if (layoutManager.getDecoratedTop(s2Var2.itemView) <= recyclerView.getPaddingTop()) {
                recyclerView.scrollToPosition(i11);
            }
            if (layoutManager.getDecoratedBottom(s2Var2.itemView) >= recyclerView.getHeight() - recyclerView.getPaddingBottom()) {
                recyclerView.scrollToPosition(i11);
            }
        }
    }

    public void onSelectedChanged(s2 s2Var, int i5) {
    }

    public abstract void onSwiped(s2 s2Var, int i5);
}
