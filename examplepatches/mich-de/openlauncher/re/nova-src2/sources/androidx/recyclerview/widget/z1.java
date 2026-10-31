package androidx.recyclerview.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.ArrayList;
import java.util.Objects;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public abstract class z1 {
    boolean mAutoMeasure;
    i mChildHelper;
    private int mHeight;
    private int mHeightMode;
    g3 mHorizontalBoundCheck;
    private final f3 mHorizontalBoundCheckCallback;
    boolean mIsAttachedToWindow;
    private boolean mItemPrefetchEnabled;
    private boolean mMeasurementCacheEnabled;
    int mPrefetchMaxCountObserved;
    boolean mPrefetchMaxObservedInInitialPrefetch;
    RecyclerView mRecyclerView;
    boolean mRequestedSimpleAnimations;
    n2 mSmoothScroller;
    g3 mVerticalBoundCheck;
    private final f3 mVerticalBoundCheckCallback;
    private int mWidth;
    private int mWidthMode;

    public z1() {
        w1 w1Var = new w1(this, 0);
        this.mHorizontalBoundCheckCallback = w1Var;
        w1 w1Var2 = new w1(this, 1);
        this.mVerticalBoundCheckCallback = w1Var2;
        this.mHorizontalBoundCheck = new g3(w1Var);
        this.mVerticalBoundCheck = new g3(w1Var2);
        this.mRequestedSimpleAnimations = false;
        this.mIsAttachedToWindow = false;
        this.mAutoMeasure = false;
        this.mMeasurementCacheEnabled = true;
        this.mItemPrefetchEnabled = true;
    }

    public static int chooseSize(int i5, int i11, int i12) {
        int mode = View.MeasureSpec.getMode(i5);
        int size = View.MeasureSpec.getSize(i5);
        return mode != Integer.MIN_VALUE ? mode != 1073741824 ? Math.max(i11, i12) : size : Math.min(size, Math.max(i11, i12));
    }

    /* JADX WARN: Removed duplicated region for block: B:5:0x000c A[PHI: r3
      0x000c: PHI (r3v5 int) = (r3v0 int), (r3v2 int), (r3v0 int) binds: [B:7:0x0010, B:11:0x0016, B:4:0x000a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000e  */
    @Deprecated
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int getChildMeasureSpec(int i5, int i11, int i12, boolean z11) {
        int i13 = i5 - i11;
        int i14 = 0;
        int iMax = Math.max(0, i13);
        if (z11) {
            if (i12 >= 0) {
                i14 = 1073741824;
            } else {
                i12 = 0;
            }
        } else if (i12 < 0) {
            if (i12 == -1) {
                i12 = iMax;
                i14 = 1073741824;
            } else if (i12 == -2) {
                i14 = Integer.MIN_VALUE;
                i12 = iMax;
            }
        }
        return View.MeasureSpec.makeMeasureSpec(i12, i14);
    }

    public static y1 getProperties(Context context, AttributeSet attributeSet, int i5, int i11) {
        y1 y1Var = new y1();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, x6.a.f95108a, i5, i11);
        y1Var.f15183a = typedArrayObtainStyledAttributes.getInt(0, 1);
        y1Var.f15184b = typedArrayObtainStyledAttributes.getInt(10, 1);
        y1Var.f15185c = typedArrayObtainStyledAttributes.getBoolean(9, false);
        y1Var.f15186d = typedArrayObtainStyledAttributes.getBoolean(11, false);
        typedArrayObtainStyledAttributes.recycle();
        return y1Var;
    }

    public static boolean m(int i5, int i11, int i12) {
        int mode = View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i11);
        if (i12 > 0 && i5 != i12) {
            return false;
        }
        if (mode == Integer.MIN_VALUE) {
            return size >= i5;
        }
        if (mode != 0) {
            return mode == 1073741824 && size == i5;
        }
        return true;
    }

    @SuppressLint({"UnknownNullness"})
    public void addDisappearingView(View view) {
        addDisappearingView(view, -1);
    }

    @SuppressLint({"UnknownNullness"})
    public void addView(View view) {
        addView(view, -1);
    }

    public void assertInLayoutOrScroll(String str) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            recyclerView.assertInLayoutOrScroll(str);
        }
    }

    public void assertNotInLayoutOrScroll(String str) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            recyclerView.assertNotInLayoutOrScroll(str);
        }
    }

    public void attachView(View view, int i5, a2 a2Var) {
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        if (childViewHolderInt.isRemoved()) {
            z.c1 c1Var = this.mRecyclerView.mViewInfoStore.f15009a;
            h3 h3VarA = (h3) c1Var.get(childViewHolderInt);
            if (h3VarA == null) {
                h3VarA = h3.a();
                c1Var.put(childViewHolderInt, h3VarA);
            }
            h3VarA.f14990a |= 1;
        } else {
            this.mRecyclerView.mViewInfoStore.c(childViewHolderInt);
        }
        this.mChildHelper.b(view, i5, a2Var, childViewHolderInt.isRemoved());
    }

    public void calculateItemDecorationsForChild(View view, Rect rect) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null) {
            rect.set(0, 0, 0, 0);
        } else {
            rect.set(recyclerView.getItemDecorInsetsForChild(view));
        }
    }

    public abstract boolean canScrollHorizontally();

    public abstract boolean canScrollVertically();

    public boolean checkLayoutParams(a2 a2Var) {
        return a2Var != null;
    }

    public void collectAdjacentPrefetchPositions(int i5, int i11, o2 o2Var, x1 x1Var) {
    }

    public void collectInitialPrefetchPositions(int i5, x1 x1Var) {
    }

    public abstract int computeHorizontalScrollExtent(o2 o2Var);

    public abstract int computeHorizontalScrollOffset(o2 o2Var);

    public abstract int computeHorizontalScrollRange(o2 o2Var);

    public abstract int computeVerticalScrollExtent(o2 o2Var);

    public abstract int computeVerticalScrollOffset(o2 o2Var);

    public abstract int computeVerticalScrollRange(o2 o2Var);

    public void detachAndScrapAttachedViews(h2 h2Var) {
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            n(h2Var, childCount, getChildAt(childCount));
        }
    }

    public void detachAndScrapView(View view, h2 h2Var) {
        n(h2Var, this.mChildHelper.j(view), view);
    }

    public void detachAndScrapViewAt(int i5, h2 h2Var) {
        n(h2Var, i5, getChildAt(i5));
    }

    public void detachView(View view) {
        int iJ = this.mChildHelper.j(view);
        if (iJ >= 0) {
            this.mChildHelper.c(iJ);
        }
    }

    public void detachViewAt(int i5) {
        getChildAt(i5);
        this.mChildHelper.c(i5);
    }

    public void dispatchAttachedToWindow(RecyclerView recyclerView) {
        this.mIsAttachedToWindow = true;
        onAttachedToWindow(recyclerView);
    }

    public void dispatchDetachedFromWindow(RecyclerView recyclerView, h2 h2Var) {
        this.mIsAttachedToWindow = false;
        onDetachedFromWindow(recyclerView, h2Var);
    }

    @SuppressLint({"UnknownNullness"})
    public void endAnimation(View view) {
        u1 u1Var = this.mRecyclerView.mItemAnimator;
        if (u1Var != null) {
            u1Var.endAnimation(RecyclerView.getChildViewHolderInt(view));
        }
    }

    public View findContainingItemView(View view) {
        View viewFindContainingItemView;
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null || (viewFindContainingItemView = recyclerView.findContainingItemView(view)) == null || this.mChildHelper.f14995c.contains(viewFindContainingItemView)) {
            return null;
        }
        return viewFindContainingItemView;
    }

    public View findViewByPosition(int i5) {
        int childCount = getChildCount();
        for (int i11 = 0; i11 < childCount; i11++) {
            View childAt = getChildAt(i11);
            s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(childAt);
            if (childViewHolderInt != null && childViewHolderInt.getLayoutPosition() == i5 && !childViewHolderInt.shouldIgnore() && (this.mRecyclerView.mState.f15075g || !childViewHolderInt.isRemoved())) {
                return childAt;
            }
        }
        return null;
    }

    public abstract a2 generateDefaultLayoutParams();

    @SuppressLint({"UnknownNullness"})
    public a2 generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof a2 ? new a2((a2) layoutParams) : layoutParams instanceof ViewGroup.MarginLayoutParams ? new a2((ViewGroup.MarginLayoutParams) layoutParams) : new a2(layoutParams);
    }

    public int getBaseline() {
        return -1;
    }

    public int getBottomDecorationHeight(View view) {
        return ((a2) view.getLayoutParams()).f14881b.bottom;
    }

    public View getChildAt(int i5) {
        i iVar = this.mChildHelper;
        if (iVar != null) {
            return iVar.d(i5);
        }
        return null;
    }

    public int getChildCount() {
        i iVar = this.mChildHelper;
        if (iVar != null) {
            return iVar.e();
        }
        return 0;
    }

    public boolean getClipToPadding() {
        RecyclerView recyclerView = this.mRecyclerView;
        return recyclerView != null && recyclerView.mClipToPadding;
    }

    public int getColumnCountForAccessibility(h2 h2Var, o2 o2Var) {
        return -1;
    }

    public int getDecoratedBottom(View view) {
        return getBottomDecorationHeight(view) + view.getBottom();
    }

    public void getDecoratedBoundsWithMargins(View view, Rect rect) {
        RecyclerView.getDecoratedBoundsWithMarginsInt(view, rect);
    }

    public int getDecoratedLeft(View view) {
        return view.getLeft() - getLeftDecorationWidth(view);
    }

    public int getDecoratedMeasuredHeight(View view) {
        Rect rect = ((a2) view.getLayoutParams()).f14881b;
        return view.getMeasuredHeight() + rect.top + rect.bottom;
    }

    public int getDecoratedMeasuredWidth(View view) {
        Rect rect = ((a2) view.getLayoutParams()).f14881b;
        return view.getMeasuredWidth() + rect.left + rect.right;
    }

    public int getDecoratedRight(View view) {
        return getRightDecorationWidth(view) + view.getRight();
    }

    public int getDecoratedTop(View view) {
        return view.getTop() - getTopDecorationHeight(view);
    }

    public View getFocusedChild() {
        View focusedChild;
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null || (focusedChild = recyclerView.getFocusedChild()) == null || this.mChildHelper.f14995c.contains(focusedChild)) {
            return null;
        }
        return focusedChild;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getHeightMode() {
        return this.mHeightMode;
    }

    public int getItemCount() {
        RecyclerView recyclerView = this.mRecyclerView;
        m1 adapter = recyclerView != null ? recyclerView.getAdapter() : null;
        if (adapter != null) {
            return adapter.getItemCount();
        }
        return 0;
    }

    public int getItemViewType(View view) {
        return RecyclerView.getChildViewHolderInt(view).getItemViewType();
    }

    public int getLayoutDirection() {
        RecyclerView recyclerView = this.mRecyclerView;
        WeakHashMap weakHashMap = a5.a1.f250a;
        return recyclerView.getLayoutDirection();
    }

    public int getLeftDecorationWidth(View view) {
        return ((a2) view.getLayoutParams()).f14881b.left;
    }

    public int getMinimumHeight() {
        RecyclerView recyclerView = this.mRecyclerView;
        WeakHashMap weakHashMap = a5.a1.f250a;
        return recyclerView.getMinimumHeight();
    }

    public int getMinimumWidth() {
        RecyclerView recyclerView = this.mRecyclerView;
        WeakHashMap weakHashMap = a5.a1.f250a;
        return recyclerView.getMinimumWidth();
    }

    public int getPaddingBottom() {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            return recyclerView.getPaddingBottom();
        }
        return 0;
    }

    public int getPaddingEnd() {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null) {
            return 0;
        }
        WeakHashMap weakHashMap = a5.a1.f250a;
        return recyclerView.getPaddingEnd();
    }

    public int getPaddingLeft() {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            return recyclerView.getPaddingLeft();
        }
        return 0;
    }

    public int getPaddingRight() {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            return recyclerView.getPaddingRight();
        }
        return 0;
    }

    public int getPaddingStart() {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null) {
            return 0;
        }
        WeakHashMap weakHashMap = a5.a1.f250a;
        return recyclerView.getPaddingStart();
    }

    public int getPaddingTop() {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            return recyclerView.getPaddingTop();
        }
        return 0;
    }

    public int getPosition(View view) {
        return ((a2) view.getLayoutParams()).f14880a.getLayoutPosition();
    }

    public int getRightDecorationWidth(View view) {
        return ((a2) view.getLayoutParams()).f14881b.right;
    }

    public int getRowCountForAccessibility(h2 h2Var, o2 o2Var) {
        return -1;
    }

    public int getSelectionModeForAccessibility(h2 h2Var, o2 o2Var) {
        return 0;
    }

    public int getTopDecorationHeight(View view) {
        return ((a2) view.getLayoutParams()).f14881b.top;
    }

    public void getTransformedBoundingBox(View view, boolean z11, Rect rect) {
        Matrix matrix;
        if (z11) {
            Rect rect2 = ((a2) view.getLayoutParams()).f14881b;
            rect.set(-rect2.left, -rect2.top, view.getWidth() + rect2.right, view.getHeight() + rect2.bottom);
        } else {
            rect.set(0, 0, view.getWidth(), view.getHeight());
        }
        if (this.mRecyclerView != null && (matrix = view.getMatrix()) != null && !matrix.isIdentity()) {
            RectF rectF = this.mRecyclerView.mTempRectF;
            rectF.set(rect);
            matrix.mapRect(rectF);
            rect.set((int) Math.floor(rectF.left), (int) Math.floor(rectF.top), (int) Math.ceil(rectF.right), (int) Math.ceil(rectF.bottom));
        }
        rect.offset(view.getLeft(), view.getTop());
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getWidthMode() {
        return this.mWidthMode;
    }

    public boolean hasFlexibleChildInBothOrientations() {
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            ViewGroup.LayoutParams layoutParams = getChildAt(i5).getLayoutParams();
            if (layoutParams.width < 0 && layoutParams.height < 0) {
                return true;
            }
        }
        return false;
    }

    public boolean hasFocus() {
        RecyclerView recyclerView = this.mRecyclerView;
        return recyclerView != null && recyclerView.hasFocus();
    }

    public void ignoreView(View view) {
        ViewParent parent = view.getParent();
        RecyclerView recyclerView = this.mRecyclerView;
        if (parent != recyclerView || recyclerView.indexOfChild(view) == -1) {
            throw new IllegalArgumentException(a2.c.j(this.mRecyclerView, new StringBuilder("View should be fully attached to be ignored")));
        }
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        childViewHolderInt.addFlags(128);
        this.mRecyclerView.mViewInfoStore.d(childViewHolderInt);
    }

    public boolean isAttachedToWindow() {
        return this.mIsAttachedToWindow;
    }

    public abstract boolean isAutoMeasureEnabled();

    public boolean isFocused() {
        RecyclerView recyclerView = this.mRecyclerView;
        return recyclerView != null && recyclerView.isFocused();
    }

    public final boolean isItemPrefetchEnabled() {
        return this.mItemPrefetchEnabled;
    }

    public boolean isLayoutHierarchical(h2 h2Var, o2 o2Var) {
        return false;
    }

    public boolean isMeasurementCacheEnabled() {
        return this.mMeasurementCacheEnabled;
    }

    public boolean isSmoothScrolling() {
        n2 n2Var = this.mSmoothScroller;
        return n2Var != null && n2Var.isRunning();
    }

    public boolean isViewPartiallyVisible(View view, boolean z11, boolean z12) {
        boolean z13 = this.mHorizontalBoundCheck.b(view) && this.mVerticalBoundCheck.b(view);
        return z11 ? z13 : !z13;
    }

    public final void l(View view, int i5, boolean z11) {
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        if (z11 || childViewHolderInt.isRemoved()) {
            z.c1 c1Var = this.mRecyclerView.mViewInfoStore.f15009a;
            h3 h3VarA = (h3) c1Var.get(childViewHolderInt);
            if (h3VarA == null) {
                h3VarA = h3.a();
                c1Var.put(childViewHolderInt, h3VarA);
            }
            h3VarA.f14990a |= 1;
        } else {
            this.mRecyclerView.mViewInfoStore.c(childViewHolderInt);
        }
        a2 a2Var = (a2) view.getLayoutParams();
        if (childViewHolderInt.wasReturnedFromScrap() || childViewHolderInt.isScrap()) {
            if (childViewHolderInt.isScrap()) {
                childViewHolderInt.unScrap();
            } else {
                childViewHolderInt.clearReturnedFromScrapFlag();
            }
            this.mChildHelper.b(view, i5, view.getLayoutParams(), false);
        } else if (view.getParent() == this.mRecyclerView) {
            int iJ = this.mChildHelper.j(view);
            if (i5 == -1) {
                i5 = this.mChildHelper.e();
            }
            if (iJ == -1) {
                StringBuilder sb2 = new StringBuilder("Added View has RecyclerView as parent but view is not a real child. Unfiltered index:");
                sb2.append(this.mRecyclerView.indexOfChild(view));
                throw new IllegalStateException(a2.c.j(this.mRecyclerView, sb2));
            }
            if (iJ != i5) {
                this.mRecyclerView.mLayout.moveView(iJ, i5);
            }
        } else {
            this.mChildHelper.a(view, i5, false);
            a2Var.f14882c = true;
            n2 n2Var = this.mSmoothScroller;
            if (n2Var != null && n2Var.isRunning()) {
                this.mSmoothScroller.onChildAttachedToWindow(view);
            }
        }
        if (a2Var.f14883d) {
            if (RecyclerView.sVerboseLoggingEnabled) {
                Objects.toString(a2Var.f14880a);
            }
            childViewHolderInt.itemView.invalidate();
            a2Var.f14883d = false;
        }
    }

    public void layoutDecorated(View view, int i5, int i11, int i12, int i13) {
        Rect rect = ((a2) view.getLayoutParams()).f14881b;
        view.layout(i5 + rect.left, i11 + rect.top, i12 - rect.right, i13 - rect.bottom);
    }

    public void layoutDecoratedWithMargins(View view, int i5, int i11, int i12, int i13) {
        a2 a2Var = (a2) view.getLayoutParams();
        Rect rect = a2Var.f14881b;
        view.layout(i5 + rect.left + ((ViewGroup.MarginLayoutParams) a2Var).leftMargin, i11 + rect.top + ((ViewGroup.MarginLayoutParams) a2Var).topMargin, (i12 - rect.right) - ((ViewGroup.MarginLayoutParams) a2Var).rightMargin, (i13 - rect.bottom) - ((ViewGroup.MarginLayoutParams) a2Var).bottomMargin);
    }

    public void measureChild(View view, int i5, int i11) {
        a2 a2Var = (a2) view.getLayoutParams();
        Rect itemDecorInsetsForChild = this.mRecyclerView.getItemDecorInsetsForChild(view);
        int i12 = itemDecorInsetsForChild.left + itemDecorInsetsForChild.right + i5;
        int i13 = itemDecorInsetsForChild.top + itemDecorInsetsForChild.bottom + i11;
        int childMeasureSpec = getChildMeasureSpec(getWidth(), getWidthMode(), getPaddingRight() + getPaddingLeft() + i12, ((ViewGroup.MarginLayoutParams) a2Var).width, canScrollHorizontally());
        int childMeasureSpec2 = getChildMeasureSpec(getHeight(), getHeightMode(), getPaddingBottom() + getPaddingTop() + i13, ((ViewGroup.MarginLayoutParams) a2Var).height, canScrollVertically());
        if (shouldMeasureChild(view, childMeasureSpec, childMeasureSpec2, a2Var)) {
            view.measure(childMeasureSpec, childMeasureSpec2);
        }
    }

    public void measureChildWithMargins(View view, int i5, int i11) {
        a2 a2Var = (a2) view.getLayoutParams();
        Rect itemDecorInsetsForChild = this.mRecyclerView.getItemDecorInsetsForChild(view);
        int i12 = itemDecorInsetsForChild.left + itemDecorInsetsForChild.right + i5;
        int i13 = itemDecorInsetsForChild.top + itemDecorInsetsForChild.bottom + i11;
        int childMeasureSpec = getChildMeasureSpec(getWidth(), getWidthMode(), getPaddingRight() + getPaddingLeft() + ((ViewGroup.MarginLayoutParams) a2Var).leftMargin + ((ViewGroup.MarginLayoutParams) a2Var).rightMargin + i12, ((ViewGroup.MarginLayoutParams) a2Var).width, canScrollHorizontally());
        int childMeasureSpec2 = getChildMeasureSpec(getHeight(), getHeightMode(), getPaddingBottom() + getPaddingTop() + ((ViewGroup.MarginLayoutParams) a2Var).topMargin + ((ViewGroup.MarginLayoutParams) a2Var).bottomMargin + i13, ((ViewGroup.MarginLayoutParams) a2Var).height, canScrollVertically());
        if (shouldMeasureChild(view, childMeasureSpec, childMeasureSpec2, a2Var)) {
            view.measure(childMeasureSpec, childMeasureSpec2);
        }
    }

    public void moveView(int i5, int i11) {
        View childAt = getChildAt(i5);
        if (childAt != null) {
            detachViewAt(i5);
            attachView(childAt, i11);
        } else {
            throw new IllegalArgumentException("Cannot move a child from non-existing index:" + i5 + this.mRecyclerView.toString());
        }
    }

    public final void n(h2 h2Var, int i5, View view) {
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        if (childViewHolderInt.shouldIgnore()) {
            if (RecyclerView.sVerboseLoggingEnabled) {
                childViewHolderInt.toString();
            }
        } else if (childViewHolderInt.isInvalid() && !childViewHolderInt.isRemoved() && !this.mRecyclerView.mAdapter.hasStableIds()) {
            removeViewAt(i5);
            h2Var.j(childViewHolderInt);
        } else {
            detachViewAt(i5);
            h2Var.k(view);
            this.mRecyclerView.mViewInfoStore.c(childViewHolderInt);
        }
    }

    public void offsetChildrenHorizontal(int i5) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            recyclerView.offsetChildrenHorizontal(i5);
        }
    }

    public void offsetChildrenVertical(int i5) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            recyclerView.offsetChildrenVertical(i5);
        }
    }

    public void onAdapterChanged(m1 m1Var, m1 m1Var2) {
    }

    public boolean onAddFocusables(RecyclerView recyclerView, ArrayList<View> arrayList, int i5, int i11) {
        return false;
    }

    public void onAttachedToWindow(RecyclerView recyclerView) {
    }

    @Deprecated
    public void onDetachedFromWindow(RecyclerView recyclerView) {
    }

    public abstract void onDetachedFromWindow(RecyclerView recyclerView, h2 h2Var);

    public View onFocusSearchFailed(View view, int i5, h2 h2Var, o2 o2Var) {
        return null;
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        RecyclerView recyclerView = this.mRecyclerView;
        onInitializeAccessibilityEvent(recyclerView.mRecycler, recyclerView.mState, accessibilityEvent);
    }

    public void onInitializeAccessibilityNodeInfo(b5.g gVar) {
        RecyclerView recyclerView = this.mRecyclerView;
        onInitializeAccessibilityNodeInfo(recyclerView.mRecycler, recyclerView.mState, gVar);
    }

    public void onInitializeAccessibilityNodeInfoForItem(View view, b5.g gVar) {
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        if (childViewHolderInt == null || childViewHolderInt.isRemoved()) {
            return;
        }
        i iVar = this.mChildHelper;
        if (iVar.f14995c.contains(childViewHolderInt.itemView)) {
            return;
        }
        RecyclerView recyclerView = this.mRecyclerView;
        onInitializeAccessibilityNodeInfoForItem(recyclerView.mRecycler, recyclerView.mState, view, gVar);
    }

    public View onInterceptFocusSearch(View view, int i5) {
        return null;
    }

    public void onItemsAdded(RecyclerView recyclerView, int i5, int i11) {
    }

    public void onItemsChanged(RecyclerView recyclerView) {
    }

    public void onItemsMoved(RecyclerView recyclerView, int i5, int i11, int i12) {
    }

    public void onItemsRemoved(RecyclerView recyclerView, int i5, int i11) {
    }

    public void onItemsUpdated(RecyclerView recyclerView, int i5, int i11) {
    }

    public abstract void onLayoutChildren(h2 h2Var, o2 o2Var);

    public abstract void onLayoutCompleted(o2 o2Var);

    public void onMeasure(h2 h2Var, o2 o2Var, int i5, int i11) {
        this.mRecyclerView.defaultOnMeasure(i5, i11);
    }

    @Deprecated
    public boolean onRequestChildFocus(RecyclerView recyclerView, View view, View view2) {
        return isSmoothScrolling() || recyclerView.isComputingLayout();
    }

    public void onRestoreInstanceState(Parcelable parcelable) {
    }

    public Parcelable onSaveInstanceState() {
        return null;
    }

    public void onScrollStateChanged(int i5) {
    }

    public void onSmoothScrollerStopped(n2 n2Var) {
        if (this.mSmoothScroller == n2Var) {
            this.mSmoothScroller = null;
        }
    }

    public boolean performAccessibilityAction(int i5, Bundle bundle) {
        RecyclerView recyclerView = this.mRecyclerView;
        return performAccessibilityAction(recyclerView.mRecycler, recyclerView.mState, i5, bundle);
    }

    public boolean performAccessibilityActionForItem(h2 h2Var, o2 o2Var, View view, int i5, Bundle bundle) {
        return false;
    }

    public void postOnAnimation(Runnable runnable) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            WeakHashMap weakHashMap = a5.a1.f250a;
            recyclerView.postOnAnimation(runnable);
        }
    }

    public void removeAllViews() {
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            this.mChildHelper.k(childCount);
        }
    }

    public void removeAndRecycleAllViews(h2 h2Var) {
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            if (!RecyclerView.getChildViewHolderInt(getChildAt(childCount)).shouldIgnore()) {
                removeAndRecycleViewAt(childCount, h2Var);
            }
        }
    }

    public void removeAndRecycleScrapInt(h2 h2Var) {
        ArrayList arrayList = h2Var.f14981a;
        int size = arrayList.size();
        for (int i5 = size - 1; i5 >= 0; i5--) {
            View view = ((s2) arrayList.get(i5)).itemView;
            s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
            if (!childViewHolderInt.shouldIgnore()) {
                childViewHolderInt.setIsRecyclable(false);
                if (childViewHolderInt.isTmpDetached()) {
                    this.mRecyclerView.removeDetachedView(view, false);
                }
                u1 u1Var = this.mRecyclerView.mItemAnimator;
                if (u1Var != null) {
                    u1Var.endAnimation(childViewHolderInt);
                }
                childViewHolderInt.setIsRecyclable(true);
                s2 childViewHolderInt2 = RecyclerView.getChildViewHolderInt(view);
                childViewHolderInt2.mScrapContainer = null;
                childViewHolderInt2.mInChangeScrap = false;
                childViewHolderInt2.clearReturnedFromScrapFlag();
                h2Var.j(childViewHolderInt2);
            }
        }
        arrayList.clear();
        ArrayList arrayList2 = h2Var.f14982b;
        if (arrayList2 != null) {
            arrayList2.clear();
        }
        if (size > 0) {
            this.mRecyclerView.invalidate();
        }
    }

    public void removeAndRecycleView(View view, h2 h2Var) {
        removeView(view);
        h2Var.i(view);
    }

    public void removeAndRecycleViewAt(int i5, h2 h2Var) {
        View childAt = getChildAt(i5);
        removeViewAt(i5);
        h2Var.i(childAt);
    }

    public boolean removeCallbacks(Runnable runnable) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            return recyclerView.removeCallbacks(runnable);
        }
        return false;
    }

    public void removeDetachedView(View view) {
        this.mRecyclerView.removeDetachedView(view, false);
    }

    @SuppressLint({"UnknownNullness"})
    public void removeView(View view) {
        i iVar = this.mChildHelper;
        k1 k1Var = iVar.f14993a;
        int i5 = iVar.f14996d;
        if (i5 == 1) {
            throw new IllegalStateException("Cannot call removeView(At) within removeView(At)");
        }
        if (i5 == 2) {
            throw new IllegalStateException("Cannot call removeView(At) within removeViewIfHidden");
        }
        try {
            iVar.f14996d = 1;
            iVar.f14997e = view;
            int iIndexOfChild = k1Var.f15030a.indexOfChild(view);
            if (iIndexOfChild >= 0) {
                if (iVar.f14994b.f(iIndexOfChild)) {
                    iVar.l(view);
                }
                k1Var.b(iIndexOfChild);
            }
            iVar.f14996d = 0;
            iVar.f14997e = null;
        } catch (Throwable th2) {
            iVar.f14996d = 0;
            iVar.f14997e = null;
            throw th2;
        }
    }

    public void removeViewAt(int i5) {
        if (getChildAt(i5) != null) {
            this.mChildHelper.k(i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x00b6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean requestChildRectangleOnScreen(RecyclerView recyclerView, View view, Rect rect, boolean z11, boolean z12) {
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int width = getWidth() - getPaddingRight();
        int height = getHeight() - getPaddingBottom();
        int left = (view.getLeft() + rect.left) - view.getScrollX();
        int top = (view.getTop() + rect.top) - view.getScrollY();
        int iWidth = rect.width() + left;
        int iHeight = rect.height() + top;
        int i5 = left - paddingLeft;
        int iMin = Math.min(0, i5);
        int i11 = top - paddingTop;
        int iMin2 = Math.min(0, i11);
        int i12 = iWidth - width;
        int iMax = Math.max(0, i12);
        int iMax2 = Math.max(0, iHeight - height);
        if (getLayoutDirection() != 1) {
            if (iMin == 0) {
                iMin = Math.min(i5, iMax);
            }
            iMax = iMin;
        } else if (iMax == 0) {
            iMax = Math.max(iMin, i12);
        }
        if (iMin2 == 0) {
            iMin2 = Math.min(i11, iMax2);
        }
        int[] iArr = {iMax, iMin2};
        int i13 = iArr[0];
        int i14 = iArr[1];
        if (z12) {
            View focusedChild = recyclerView.getFocusedChild();
            if (focusedChild != null) {
                int paddingLeft2 = getPaddingLeft();
                int paddingTop2 = getPaddingTop();
                int width2 = getWidth() - getPaddingRight();
                int height2 = getHeight() - getPaddingBottom();
                Rect rect2 = this.mRecyclerView.mTempRect;
                getDecoratedBoundsWithMargins(focusedChild, rect2);
                if (rect2.left - i13 < width2 && rect2.right - i13 > paddingLeft2 && rect2.top - i14 < height2 && rect2.bottom - i14 > paddingTop2) {
                }
            }
        } else if (i13 != 0 || i14 != 0) {
            if (z11) {
                recyclerView.scrollBy(i13, i14);
            } else {
                recyclerView.smoothScrollBy(i13, i14);
            }
            return true;
        }
        return false;
    }

    public void requestLayout() {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView != null) {
            recyclerView.requestLayout();
        }
    }

    public void requestSimpleAnimationsInNextLayout() {
        this.mRequestedSimpleAnimations = true;
    }

    public abstract int scrollHorizontallyBy(int i5, h2 h2Var, o2 o2Var);

    public abstract void scrollToPosition(int i5);

    public abstract int scrollVerticallyBy(int i5, h2 h2Var, o2 o2Var);

    @Deprecated
    public void setAutoMeasureEnabled(boolean z11) {
        this.mAutoMeasure = z11;
    }

    public void setExactMeasureSpecsFrom(RecyclerView recyclerView) {
        setMeasureSpecs(View.MeasureSpec.makeMeasureSpec(recyclerView.getWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(recyclerView.getHeight(), 1073741824));
    }

    public final void setItemPrefetchEnabled(boolean z11) {
        if (z11 != this.mItemPrefetchEnabled) {
            this.mItemPrefetchEnabled = z11;
            this.mPrefetchMaxCountObserved = 0;
            RecyclerView recyclerView = this.mRecyclerView;
            if (recyclerView != null) {
                recyclerView.mRecycler.n();
            }
        }
    }

    public void setMeasureSpecs(int i5, int i11) {
        this.mWidth = View.MeasureSpec.getSize(i5);
        int mode = View.MeasureSpec.getMode(i5);
        this.mWidthMode = mode;
        if (mode == 0 && !RecyclerView.ALLOW_SIZE_IN_UNSPECIFIED_SPEC) {
            this.mWidth = 0;
        }
        this.mHeight = View.MeasureSpec.getSize(i11);
        int mode2 = View.MeasureSpec.getMode(i11);
        this.mHeightMode = mode2;
        if (mode2 != 0 || RecyclerView.ALLOW_SIZE_IN_UNSPECIFIED_SPEC) {
            return;
        }
        this.mHeight = 0;
    }

    public void setMeasuredDimension(Rect rect, int i5, int i11) {
        setMeasuredDimension(chooseSize(i5, getPaddingRight() + getPaddingLeft() + rect.width(), getMinimumWidth()), chooseSize(i11, getPaddingBottom() + getPaddingTop() + rect.height(), getMinimumHeight()));
    }

    public void setMeasuredDimensionFromChildren(int i5, int i11) {
        int childCount = getChildCount();
        if (childCount == 0) {
            this.mRecyclerView.defaultOnMeasure(i5, i11);
            return;
        }
        int i12 = Integer.MIN_VALUE;
        int i13 = Integer.MAX_VALUE;
        int i14 = Integer.MIN_VALUE;
        int i15 = Integer.MAX_VALUE;
        for (int i16 = 0; i16 < childCount; i16++) {
            View childAt = getChildAt(i16);
            Rect rect = this.mRecyclerView.mTempRect;
            getDecoratedBoundsWithMargins(childAt, rect);
            int i17 = rect.left;
            if (i17 < i15) {
                i15 = i17;
            }
            int i18 = rect.right;
            if (i18 > i12) {
                i12 = i18;
            }
            int i19 = rect.top;
            if (i19 < i13) {
                i13 = i19;
            }
            int i21 = rect.bottom;
            if (i21 > i14) {
                i14 = i21;
            }
        }
        this.mRecyclerView.mTempRect.set(i15, i13, i12, i14);
        setMeasuredDimension(this.mRecyclerView.mTempRect, i5, i11);
    }

    public void setMeasurementCacheEnabled(boolean z11) {
        this.mMeasurementCacheEnabled = z11;
    }

    public void setRecyclerView(RecyclerView recyclerView) {
        if (recyclerView == null) {
            this.mRecyclerView = null;
            this.mChildHelper = null;
            this.mWidth = 0;
            this.mHeight = 0;
        } else {
            this.mRecyclerView = recyclerView;
            this.mChildHelper = recyclerView.mChildHelper;
            this.mWidth = recyclerView.getWidth();
            this.mHeight = recyclerView.getHeight();
        }
        this.mWidthMode = 1073741824;
        this.mHeightMode = 1073741824;
    }

    public boolean shouldMeasureChild(View view, int i5, int i11, a2 a2Var) {
        return (!view.isLayoutRequested() && this.mMeasurementCacheEnabled && m(view.getWidth(), i5, ((ViewGroup.MarginLayoutParams) a2Var).width) && m(view.getHeight(), i11, ((ViewGroup.MarginLayoutParams) a2Var).height)) ? false : true;
    }

    public boolean shouldMeasureTwice() {
        return false;
    }

    public boolean shouldReMeasureChild(View view, int i5, int i11, a2 a2Var) {
        return (this.mMeasurementCacheEnabled && m(view.getMeasuredWidth(), i5, ((ViewGroup.MarginLayoutParams) a2Var).width) && m(view.getMeasuredHeight(), i11, ((ViewGroup.MarginLayoutParams) a2Var).height)) ? false : true;
    }

    public abstract void smoothScrollToPosition(RecyclerView recyclerView, o2 o2Var, int i5);

    @SuppressLint({"UnknownNullness"})
    public void startSmoothScroll(n2 n2Var) {
        n2 n2Var2 = this.mSmoothScroller;
        if (n2Var2 != null && n2Var != n2Var2 && n2Var2.isRunning()) {
            this.mSmoothScroller.stop();
        }
        this.mSmoothScroller = n2Var;
        n2Var.start(this.mRecyclerView, this);
    }

    public void stopIgnoringView(View view) {
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        childViewHolderInt.stopIgnoring();
        childViewHolderInt.resetInternal();
        childViewHolderInt.addFlags(4);
    }

    public void stopSmoothScroller() {
        n2 n2Var = this.mSmoothScroller;
        if (n2Var != null) {
            n2Var.stop();
        }
    }

    public boolean supportsPredictiveItemAnimations() {
        return false;
    }

    @SuppressLint({"UnknownNullness"})
    public void addDisappearingView(View view, int i5) {
        l(view, i5, true);
    }

    @SuppressLint({"UnknownNullness"})
    public void addView(View view, int i5) {
        l(view, i5, false);
    }

    public void onInitializeAccessibilityEvent(h2 h2Var, o2 o2Var, AccessibilityEvent accessibilityEvent) {
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null || accessibilityEvent == null) {
            return;
        }
        boolean z11 = true;
        if (!recyclerView.canScrollVertically(1) && !this.mRecyclerView.canScrollVertically(-1) && !this.mRecyclerView.canScrollHorizontally(-1) && !this.mRecyclerView.canScrollHorizontally(1)) {
            z11 = false;
        }
        accessibilityEvent.setScrollable(z11);
        m1 m1Var = this.mRecyclerView.mAdapter;
        if (m1Var != null) {
            accessibilityEvent.setItemCount(m1Var.getItemCount());
        }
    }

    public void onInitializeAccessibilityNodeInfo(h2 h2Var, o2 o2Var, b5.g gVar) {
        if (this.mRecyclerView.canScrollVertically(-1) || this.mRecyclerView.canScrollHorizontally(-1)) {
            gVar.a(UserMetadata.MAX_INTERNAL_KEY_SIZE);
            gVar.Y(true);
        }
        if (this.mRecyclerView.canScrollVertically(1) || this.mRecyclerView.canScrollHorizontally(1)) {
            gVar.a(u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            gVar.Y(true);
        }
        gVar.A(b5.f.j(getRowCountForAccessibility(h2Var, o2Var), getColumnCountForAccessibility(h2Var, o2Var), getSelectionModeForAccessibility(h2Var, o2Var), isLayoutHierarchical(h2Var, o2Var)));
    }

    public void onItemsUpdated(RecyclerView recyclerView, int i5, int i11, Object obj) {
        onItemsUpdated(recyclerView, i5, i11);
    }

    public boolean onRequestChildFocus(RecyclerView recyclerView, o2 o2Var, View view, View view2) {
        return onRequestChildFocus(recyclerView, view, view2);
    }

    public boolean performAccessibilityAction(h2 h2Var, o2 o2Var, int i5, Bundle bundle) {
        int paddingTop;
        int paddingLeft;
        int i11;
        int i12;
        if (this.mRecyclerView == null) {
            return false;
        }
        int height = getHeight();
        int width = getWidth();
        Rect rect = new Rect();
        if (this.mRecyclerView.getMatrix().isIdentity() && this.mRecyclerView.getGlobalVisibleRect(rect)) {
            height = rect.height();
            width = rect.width();
        }
        if (i5 == 4096) {
            paddingTop = this.mRecyclerView.canScrollVertically(1) ? (height - getPaddingTop()) - getPaddingBottom() : 0;
            if (this.mRecyclerView.canScrollHorizontally(1)) {
                paddingLeft = (width - getPaddingLeft()) - getPaddingRight();
                i11 = paddingTop;
                i12 = paddingLeft;
            }
            i11 = paddingTop;
            i12 = 0;
        } else if (i5 != 8192) {
            i12 = 0;
            i11 = 0;
        } else {
            paddingTop = this.mRecyclerView.canScrollVertically(-1) ? -((height - getPaddingTop()) - getPaddingBottom()) : 0;
            if (this.mRecyclerView.canScrollHorizontally(-1)) {
                paddingLeft = -((width - getPaddingLeft()) - getPaddingRight());
                i11 = paddingTop;
                i12 = paddingLeft;
            }
            i11 = paddingTop;
            i12 = 0;
        }
        if (i11 == 0 && i12 == 0) {
            return false;
        }
        this.mRecyclerView.smoothScrollBy(i12, i11, null, Integer.MIN_VALUE, true);
        return true;
    }

    public boolean performAccessibilityActionForItem(View view, int i5, Bundle bundle) {
        RecyclerView recyclerView = this.mRecyclerView;
        return performAccessibilityActionForItem(recyclerView.mRecycler, recyclerView.mState, view, i5, bundle);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int getChildMeasureSpec(int i5, int i11, int i12, int i13, boolean z11) {
        int iMax = Math.max(0, i5 - i12);
        if (z11) {
            if (i13 < 0) {
                if (i13 != -1 || (i11 != Integer.MIN_VALUE && (i11 == 0 || i11 != 1073741824))) {
                    i11 = 0;
                    i13 = 0;
                } else {
                    i13 = iMax;
                }
            }
            i11 = 1073741824;
        } else if (i13 >= 0) {
            i11 = 1073741824;
        } else if (i13 != -1) {
            if (i13 == -2) {
                if (i11 == Integer.MIN_VALUE || i11 == 1073741824) {
                    i13 = iMax;
                    i11 = Integer.MIN_VALUE;
                } else {
                    i13 = iMax;
                    i11 = 0;
                }
            }
        }
        return View.MeasureSpec.makeMeasureSpec(i13, i11);
    }

    @SuppressLint({"UnknownNullness"})
    public a2 generateLayoutParams(Context context, AttributeSet attributeSet) {
        return new a2(context, attributeSet);
    }

    public void onInitializeAccessibilityNodeInfoForItem(h2 h2Var, o2 o2Var, View view, b5.g gVar) {
    }

    public void setMeasuredDimension(int i5, int i11) {
        this.mRecyclerView.setMeasuredDimension(i5, i11);
    }

    public void attachView(View view, int i5) {
        attachView(view, i5, (a2) view.getLayoutParams());
    }

    public void attachView(View view) {
        attachView(view, -1);
    }

    public boolean requestChildRectangleOnScreen(RecyclerView recyclerView, View view, Rect rect, boolean z11) {
        return requestChildRectangleOnScreen(recyclerView, view, rect, z11, false);
    }
}
