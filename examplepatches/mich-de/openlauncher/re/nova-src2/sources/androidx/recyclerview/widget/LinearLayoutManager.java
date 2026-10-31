package androidx.recyclerview.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.PointF;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;

/* loaded from: classes.dex */
public class LinearLayoutManager extends z1 implements q0, m2 {
    static final boolean DEBUG = false;
    public static final int HORIZONTAL = 0;
    public static final int INVALID_OFFSET = Integer.MIN_VALUE;
    private static final float MAX_SCROLL_FACTOR = 0.33333334f;
    private static final String TAG = "LinearLayoutManager";
    public static final int VERTICAL = 1;
    final v0 mAnchorInfo;
    private int mInitialPrefetchItemCount;
    private boolean mLastStackFromEnd;
    private final w0 mLayoutChunkResult;
    private x0 mLayoutState;
    int mOrientation;
    f1 mOrientationHelper;
    SavedState mPendingSavedState;
    int mPendingScrollPosition;
    int mPendingScrollPositionOffset;
    private boolean mRecycleChildrenOnDetach;
    private int[] mReusableIntPair;
    private boolean mReverseLayout;
    boolean mShouldReverseLayout;
    private boolean mSmoothScrollbarEnabled;
    private boolean mStackFromEnd;

    @SuppressLint({"BanParcelableUsage"})
    /* loaded from: classes2.dex */
    public static class SavedState implements Parcelable {
        public static final Parcelable.Creator<SavedState> CREATOR = new y0();

        /* renamed from: a, reason: collision with root package name */
        public int f14835a;

        /* renamed from: b, reason: collision with root package name */
        public int f14836b;

        /* renamed from: c, reason: collision with root package name */
        public boolean f14837c;

        public SavedState() {
        }

        public final boolean b() {
            return this.f14835a >= 0;
        }

        public final void d() {
            this.f14835a = -1;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeInt(this.f14835a);
            parcel.writeInt(this.f14836b);
            parcel.writeInt(this.f14837c ? 1 : 0);
        }

        public SavedState(SavedState savedState) {
            this.f14835a = savedState.f14835a;
            this.f14836b = savedState.f14836b;
            this.f14837c = savedState.f14837c;
        }
    }

    public LinearLayoutManager() {
        this(1, false);
    }

    public final void A(int i5, int i11) {
        this.mLayoutState.f15171c = this.mOrientationHelper.g() - i11;
        x0 x0Var = this.mLayoutState;
        x0Var.f15173e = this.mShouldReverseLayout ? -1 : 1;
        x0Var.f15172d = i5;
        x0Var.f15174f = 1;
        x0Var.f15170b = i11;
        x0Var.f15175g = Integer.MIN_VALUE;
    }

    public final void B(int i5, int i11) {
        this.mLayoutState.f15171c = i11 - this.mOrientationHelper.k();
        x0 x0Var = this.mLayoutState;
        x0Var.f15172d = i5;
        x0Var.f15173e = this.mShouldReverseLayout ? 1 : -1;
        x0Var.f15174f = -1;
        x0Var.f15170b = i11;
        x0Var.f15175g = Integer.MIN_VALUE;
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public void assertNotInLayoutOrScroll(String str) {
        if (this.mPendingSavedState == null) {
            super.assertNotInLayoutOrScroll(str);
        }
    }

    public void calculateExtraLayoutSpace(o2 o2Var, int[] iArr) {
        int i5;
        int extraLayoutSpace = getExtraLayoutSpace(o2Var);
        if (this.mLayoutState.f15174f == -1) {
            i5 = 0;
        } else {
            i5 = extraLayoutSpace;
            extraLayoutSpace = 0;
        }
        iArr[0] = extraLayoutSpace;
        iArr[1] = i5;
    }

    @Override // androidx.recyclerview.widget.z1
    public boolean canScrollHorizontally() {
        return this.mOrientation == 0;
    }

    @Override // androidx.recyclerview.widget.z1
    public boolean canScrollVertically() {
        return this.mOrientation == 1;
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public void collectAdjacentPrefetchPositions(int i5, int i11, o2 o2Var, x1 x1Var) {
        if (this.mOrientation != 0) {
            i5 = i11;
        }
        if (getChildCount() == 0 || i5 == 0) {
            return;
        }
        ensureLayoutState();
        z(i5 > 0 ? 1 : -1, Math.abs(i5), true, o2Var);
        collectPrefetchPositionsForLayoutState(o2Var, this.mLayoutState, x1Var);
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public void collectInitialPrefetchPositions(int i5, x1 x1Var) {
        boolean z11;
        int i11;
        SavedState savedState = this.mPendingSavedState;
        if (savedState == null || !savedState.b()) {
            y();
            z11 = this.mShouldReverseLayout;
            i11 = this.mPendingScrollPosition;
            if (i11 == -1) {
                i11 = z11 ? i5 - 1 : 0;
            }
        } else {
            SavedState savedState2 = this.mPendingSavedState;
            z11 = savedState2.f14837c;
            i11 = savedState2.f14835a;
        }
        int i12 = z11 ? -1 : 1;
        for (int i13 = 0; i13 < this.mInitialPrefetchItemCount && i11 >= 0 && i11 < i5; i13++) {
            ((d0) x1Var).a(i11, 0);
            i11 += i12;
        }
    }

    public void collectPrefetchPositionsForLayoutState(o2 o2Var, x0 x0Var, x1 x1Var) {
        int i5 = x0Var.f15172d;
        if (i5 < 0 || i5 >= o2Var.b()) {
            return;
        }
        ((d0) x1Var).a(i5, Math.max(0, x0Var.f15175g));
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public int computeHorizontalScrollExtent(o2 o2Var) {
        return o(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public int computeHorizontalScrollOffset(o2 o2Var) {
        return p(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public int computeHorizontalScrollRange(o2 o2Var) {
        return q(o2Var);
    }

    @Override // androidx.recyclerview.widget.m2
    @SuppressLint({"UnknownNullness"})
    public PointF computeScrollVectorForPosition(int i5) {
        if (getChildCount() == 0) {
            return null;
        }
        int i11 = (i5 < getPosition(getChildAt(0))) != this.mShouldReverseLayout ? -1 : 1;
        return this.mOrientation == 0 ? new PointF(i11, 0.0f) : new PointF(0.0f, i11);
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public int computeVerticalScrollExtent(o2 o2Var) {
        return o(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public int computeVerticalScrollOffset(o2 o2Var) {
        return p(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public int computeVerticalScrollRange(o2 o2Var) {
        return q(o2Var);
    }

    public int convertFocusDirectionToLayoutDirection(int i5) {
        return i5 != 1 ? i5 != 2 ? i5 != 17 ? i5 != 33 ? i5 != 66 ? (i5 == 130 && this.mOrientation == 1) ? 1 : Integer.MIN_VALUE : this.mOrientation == 0 ? 1 : Integer.MIN_VALUE : this.mOrientation == 1 ? -1 : Integer.MIN_VALUE : this.mOrientation == 0 ? -1 : Integer.MIN_VALUE : (this.mOrientation != 1 && isLayoutRTL()) ? -1 : 1 : (this.mOrientation != 1 && isLayoutRTL()) ? 1 : -1;
    }

    public x0 createLayoutState() {
        x0 x0Var = new x0();
        x0Var.f15169a = true;
        x0Var.f15176h = 0;
        x0Var.f15177i = 0;
        x0Var.f15179k = null;
        return x0Var;
    }

    public void ensureLayoutState() {
        if (this.mLayoutState == null) {
            this.mLayoutState = createLayoutState();
        }
    }

    public int fill(h2 h2Var, x0 x0Var, o2 o2Var, boolean z11) {
        int i5;
        int i11 = x0Var.f15171c;
        int i12 = x0Var.f15175g;
        if (i12 != Integer.MIN_VALUE) {
            if (i11 < 0) {
                x0Var.f15175g = i12 + i11;
            }
            w(h2Var, x0Var);
        }
        int i13 = x0Var.f15171c + x0Var.f15176h;
        w0 w0Var = this.mLayoutChunkResult;
        while (true) {
            if ((!x0Var.f15180l && i13 <= 0) || (i5 = x0Var.f15172d) < 0 || i5 >= o2Var.b()) {
                break;
            }
            w0Var.f15157a = 0;
            w0Var.f15158b = false;
            w0Var.f15159c = false;
            w0Var.f15160d = false;
            layoutChunk(h2Var, o2Var, x0Var, w0Var);
            if (!w0Var.f15158b) {
                int i14 = x0Var.f15170b;
                int i15 = w0Var.f15157a;
                x0Var.f15170b = (x0Var.f15174f * i15) + i14;
                if (!w0Var.f15159c || x0Var.f15179k != null || !o2Var.f15075g) {
                    x0Var.f15171c -= i15;
                    i13 -= i15;
                }
                int i16 = x0Var.f15175g;
                if (i16 != Integer.MIN_VALUE) {
                    int i17 = i16 + i15;
                    x0Var.f15175g = i17;
                    int i18 = x0Var.f15171c;
                    if (i18 < 0) {
                        x0Var.f15175g = i17 + i18;
                    }
                    w(h2Var, x0Var);
                }
                if (z11 && w0Var.f15160d) {
                    break;
                }
            } else {
                break;
            }
        }
        return i11 - x0Var.f15171c;
    }

    public int findFirstCompletelyVisibleItemPosition() {
        View viewFindOneVisibleChild = findOneVisibleChild(0, getChildCount(), true, false);
        if (viewFindOneVisibleChild == null) {
            return -1;
        }
        return getPosition(viewFindOneVisibleChild);
    }

    public View findFirstVisibleChildClosestToEnd(boolean z11, boolean z12) {
        return this.mShouldReverseLayout ? findOneVisibleChild(0, getChildCount(), z11, z12) : findOneVisibleChild(getChildCount() - 1, -1, z11, z12);
    }

    public View findFirstVisibleChildClosestToStart(boolean z11, boolean z12) {
        return this.mShouldReverseLayout ? findOneVisibleChild(getChildCount() - 1, -1, z11, z12) : findOneVisibleChild(0, getChildCount(), z11, z12);
    }

    public int findFirstVisibleItemPosition() {
        View viewFindOneVisibleChild = findOneVisibleChild(0, getChildCount(), false, true);
        if (viewFindOneVisibleChild == null) {
            return -1;
        }
        return getPosition(viewFindOneVisibleChild);
    }

    public int findLastCompletelyVisibleItemPosition() {
        View viewFindOneVisibleChild = findOneVisibleChild(getChildCount() - 1, -1, true, false);
        if (viewFindOneVisibleChild == null) {
            return -1;
        }
        return getPosition(viewFindOneVisibleChild);
    }

    public int findLastVisibleItemPosition() {
        View viewFindOneVisibleChild = findOneVisibleChild(getChildCount() - 1, -1, false, true);
        if (viewFindOneVisibleChild == null) {
            return -1;
        }
        return getPosition(viewFindOneVisibleChild);
    }

    public View findOnePartiallyOrCompletelyInvisibleChild(int i5, int i11) {
        int i12;
        int i13;
        ensureLayoutState();
        if (i11 <= i5 && i11 >= i5) {
            return getChildAt(i5);
        }
        if (this.mOrientationHelper.e(getChildAt(i5)) < this.mOrientationHelper.k()) {
            i12 = 16644;
            i13 = 16388;
        } else {
            i12 = 4161;
            i13 = 4097;
        }
        return this.mOrientation == 0 ? this.mHorizontalBoundCheck.a(i5, i11, i12, i13) : this.mVerticalBoundCheck.a(i5, i11, i12, i13);
    }

    public View findOneVisibleChild(int i5, int i11, boolean z11, boolean z12) {
        ensureLayoutState();
        int i12 = Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE;
        int i13 = z11 ? 24579 : 320;
        if (!z12) {
            i12 = 0;
        }
        return this.mOrientation == 0 ? this.mHorizontalBoundCheck.a(i5, i11, i13, i12) : this.mVerticalBoundCheck.a(i5, i11, i13, i12);
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0079  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public View findReferenceChild(h2 h2Var, o2 o2Var, boolean z11, boolean z12) {
        int i5;
        int childCount;
        int i11;
        ensureLayoutState();
        int childCount2 = getChildCount();
        if (z12) {
            childCount = getChildCount() - 1;
            i5 = -1;
            i11 = -1;
        } else {
            i5 = childCount2;
            childCount = 0;
            i11 = 1;
        }
        int iB = o2Var.b();
        int iK = this.mOrientationHelper.k();
        int iG = this.mOrientationHelper.g();
        View view = null;
        View view2 = null;
        View view3 = null;
        while (childCount != i5) {
            View childAt = getChildAt(childCount);
            int position = getPosition(childAt);
            int iE = this.mOrientationHelper.e(childAt);
            int iB2 = this.mOrientationHelper.b(childAt);
            if (position >= 0 && position < iB) {
                if (!((a2) childAt.getLayoutParams()).f14880a.isRemoved()) {
                    boolean z13 = iB2 <= iK && iE < iK;
                    boolean z14 = iE >= iG && iB2 > iG;
                    if (!z13 && !z14) {
                        return childAt;
                    }
                    if (z11) {
                        if (z14) {
                            view2 = childAt;
                        } else if (view == null) {
                            view = childAt;
                        }
                    } else if (!z13) {
                        if (view == null) {
                        }
                    }
                } else if (view3 == null) {
                    view3 = childAt;
                }
            }
            childCount += i11;
        }
        return view != null ? view : view2 != null ? view2 : view3;
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public View findViewByPosition(int i5) {
        int childCount = getChildCount();
        if (childCount == 0) {
            return null;
        }
        int position = i5 - getPosition(getChildAt(0));
        if (position >= 0 && position < childCount) {
            View childAt = getChildAt(position);
            if (getPosition(childAt) == i5) {
                return childAt;
            }
        }
        return super.findViewByPosition(i5);
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public a2 generateDefaultLayoutParams() {
        return new a2(-2, -2);
    }

    @Deprecated
    public int getExtraLayoutSpace(o2 o2Var) {
        if (o2Var.f15069a != -1) {
            return this.mOrientationHelper.l();
        }
        return 0;
    }

    public int getInitialPrefetchItemCount() {
        return this.mInitialPrefetchItemCount;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public boolean getRecycleChildrenOnDetach() {
        return this.mRecycleChildrenOnDetach;
    }

    public boolean getReverseLayout() {
        return this.mReverseLayout;
    }

    public boolean getStackFromEnd() {
        return this.mStackFromEnd;
    }

    @Override // androidx.recyclerview.widget.z1
    public boolean isAutoMeasureEnabled() {
        return true;
    }

    public boolean isLayoutRTL() {
        return getLayoutDirection() == 1;
    }

    public boolean isSmoothScrollbarEnabled() {
        return this.mSmoothScrollbarEnabled;
    }

    public void layoutChunk(h2 h2Var, o2 o2Var, x0 x0Var, w0 w0Var) {
        int i5;
        int i11;
        int i12;
        int i13;
        int paddingLeft;
        int iD;
        int i14;
        int i15;
        View viewB = x0Var.b(h2Var);
        if (viewB == null) {
            w0Var.f15158b = true;
            return;
        }
        a2 a2Var = (a2) viewB.getLayoutParams();
        if (x0Var.f15179k == null) {
            if (this.mShouldReverseLayout == (x0Var.f15174f == -1)) {
                addView(viewB);
            } else {
                addView(viewB, 0);
            }
        } else {
            if (this.mShouldReverseLayout == (x0Var.f15174f == -1)) {
                addDisappearingView(viewB);
            } else {
                addDisappearingView(viewB, 0);
            }
        }
        measureChildWithMargins(viewB, 0, 0);
        w0Var.f15157a = this.mOrientationHelper.c(viewB);
        if (this.mOrientation == 1) {
            if (isLayoutRTL()) {
                iD = getWidth() - getPaddingRight();
                paddingLeft = iD - this.mOrientationHelper.d(viewB);
            } else {
                paddingLeft = getPaddingLeft();
                iD = this.mOrientationHelper.d(viewB) + paddingLeft;
            }
            if (x0Var.f15174f == -1) {
                i15 = x0Var.f15170b;
                i14 = i15 - w0Var.f15157a;
            } else {
                i14 = x0Var.f15170b;
                i15 = w0Var.f15157a + i14;
            }
            int i16 = paddingLeft;
            i13 = i14;
            i12 = i16;
            i11 = i15;
            i5 = iD;
        } else {
            int paddingTop = getPaddingTop();
            int iD2 = this.mOrientationHelper.d(viewB) + paddingTop;
            if (x0Var.f15174f == -1) {
                int i17 = x0Var.f15170b;
                i12 = i17 - w0Var.f15157a;
                i5 = i17;
                i11 = iD2;
            } else {
                int i18 = x0Var.f15170b;
                i5 = w0Var.f15157a + i18;
                i11 = iD2;
                i12 = i18;
            }
            i13 = paddingTop;
        }
        layoutDecoratedWithMargins(viewB, i12, i13, i5, i11);
        if (a2Var.f14880a.isRemoved() || a2Var.f14880a.isUpdated()) {
            w0Var.f15159c = true;
        }
        w0Var.f15160d = viewB.hasFocusable();
    }

    public final int o(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        ensureLayoutState();
        return c.a(o2Var, this.mOrientationHelper, findFirstVisibleChildClosestToStart(!this.mSmoothScrollbarEnabled, true), findFirstVisibleChildClosestToEnd(!this.mSmoothScrollbarEnabled, true), this, this.mSmoothScrollbarEnabled);
    }

    public void onAnchorReady(h2 h2Var, o2 o2Var, v0 v0Var, int i5) {
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public void onDetachedFromWindow(RecyclerView recyclerView, h2 h2Var) {
        onDetachedFromWindow(recyclerView);
        if (this.mRecycleChildrenOnDetach) {
            removeAndRecycleAllViews(h2Var);
            h2Var.f14981a.clear();
            h2Var.g();
        }
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public View onFocusSearchFailed(View view, int i5, h2 h2Var, o2 o2Var) {
        int iConvertFocusDirectionToLayoutDirection;
        y();
        if (getChildCount() != 0 && (iConvertFocusDirectionToLayoutDirection = convertFocusDirectionToLayoutDirection(i5)) != Integer.MIN_VALUE) {
            ensureLayoutState();
            z(iConvertFocusDirectionToLayoutDirection, (int) (this.mOrientationHelper.l() * MAX_SCROLL_FACTOR), false, o2Var);
            x0 x0Var = this.mLayoutState;
            x0Var.f15175g = Integer.MIN_VALUE;
            x0Var.f15169a = false;
            fill(h2Var, x0Var, o2Var, true);
            View viewFindOnePartiallyOrCompletelyInvisibleChild = iConvertFocusDirectionToLayoutDirection == -1 ? this.mShouldReverseLayout ? findOnePartiallyOrCompletelyInvisibleChild(getChildCount() - 1, -1) : findOnePartiallyOrCompletelyInvisibleChild(0, getChildCount()) : this.mShouldReverseLayout ? findOnePartiallyOrCompletelyInvisibleChild(0, getChildCount()) : findOnePartiallyOrCompletelyInvisibleChild(getChildCount() - 1, -1);
            View viewU = iConvertFocusDirectionToLayoutDirection == -1 ? u() : t();
            if (!viewU.hasFocusable()) {
                return viewFindOnePartiallyOrCompletelyInvisibleChild;
            }
            if (viewFindOnePartiallyOrCompletelyInvisibleChild != null) {
                return viewU;
            }
        }
        return null;
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        if (getChildCount() > 0) {
            accessibilityEvent.setFromIndex(findFirstVisibleItemPosition());
            accessibilityEvent.setToIndex(findLastVisibleItemPosition());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:116:0x0204  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0181  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01b2  */
    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onLayoutChildren(h2 h2Var, o2 o2Var) {
        View viewFindReferenceChild;
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        int iR;
        int i15;
        View viewFindViewByPosition;
        int iE;
        int iG;
        int i16 = -1;
        if (!(this.mPendingSavedState == null && this.mPendingScrollPosition == -1) && o2Var.b() == 0) {
            removeAndRecycleAllViews(h2Var);
            return;
        }
        SavedState savedState = this.mPendingSavedState;
        if (savedState != null && savedState.b()) {
            this.mPendingScrollPosition = this.mPendingSavedState.f14835a;
        }
        ensureLayoutState();
        this.mLayoutState.f15169a = false;
        y();
        View focusedChild = getFocusedChild();
        v0 v0Var = this.mAnchorInfo;
        if (!v0Var.f15151e || this.mPendingScrollPosition != -1 || this.mPendingSavedState != null) {
            v0Var.d();
            v0 v0Var2 = this.mAnchorInfo;
            v0Var2.f15150d = this.mShouldReverseLayout ^ this.mStackFromEnd;
            if (o2Var.f15075g || (i5 = this.mPendingScrollPosition) == -1) {
                if (getChildCount() != 0) {
                    View focusedChild2 = getFocusedChild();
                    if (focusedChild2 != null) {
                        a2 a2Var = (a2) focusedChild2.getLayoutParams();
                        if (a2Var.f14880a.isRemoved() || a2Var.f14880a.getLayoutPosition() < 0 || a2Var.f14880a.getLayoutPosition() >= o2Var.b()) {
                            boolean z11 = this.mLastStackFromEnd;
                            boolean z12 = this.mStackFromEnd;
                            if (z11 == z12 && (viewFindReferenceChild = findReferenceChild(h2Var, o2Var, v0Var2.f15150d, z12)) != null) {
                                v0Var2.b(getPosition(viewFindReferenceChild), viewFindReferenceChild);
                                if (!o2Var.f15075g && supportsPredictiveItemAnimations()) {
                                    int iE2 = this.mOrientationHelper.e(viewFindReferenceChild);
                                    int iB = this.mOrientationHelper.b(viewFindReferenceChild);
                                    int iK = this.mOrientationHelper.k();
                                    int iG2 = this.mOrientationHelper.g();
                                    boolean z13 = iB <= iK && iE2 < iK;
                                    boolean z14 = iE2 >= iG2 && iB > iG2;
                                    if (z13 || z14) {
                                        if (v0Var2.f15150d) {
                                            iK = iG2;
                                        }
                                        v0Var2.f15149c = iK;
                                    }
                                }
                            } else {
                                v0Var2.a();
                                v0Var2.f15148b = this.mStackFromEnd ? o2Var.b() - 1 : 0;
                            }
                        } else {
                            v0Var2.c(getPosition(focusedChild2), focusedChild2);
                        }
                        this.mAnchorInfo.f15151e = true;
                    }
                }
            } else if (i5 < 0 || i5 >= o2Var.b()) {
                this.mPendingScrollPosition = -1;
                this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
                if (getChildCount() != 0) {
                }
            } else {
                v0Var2.f15148b = this.mPendingScrollPosition;
                SavedState savedState2 = this.mPendingSavedState;
                if (savedState2 != null && savedState2.b()) {
                    boolean z15 = this.mPendingSavedState.f14837c;
                    v0Var2.f15150d = z15;
                    if (z15) {
                        v0Var2.f15149c = this.mOrientationHelper.g() - this.mPendingSavedState.f14836b;
                    } else {
                        v0Var2.f15149c = this.mOrientationHelper.k() + this.mPendingSavedState.f14836b;
                    }
                } else if (this.mPendingScrollPositionOffset == Integer.MIN_VALUE) {
                    View viewFindViewByPosition2 = findViewByPosition(this.mPendingScrollPosition);
                    if (viewFindViewByPosition2 == null) {
                        if (getChildCount() > 0) {
                            v0Var2.f15150d = (this.mPendingScrollPosition < getPosition(getChildAt(0))) == this.mShouldReverseLayout;
                        }
                        v0Var2.a();
                    } else if (this.mOrientationHelper.c(viewFindViewByPosition2) > this.mOrientationHelper.l()) {
                        v0Var2.a();
                    } else if (this.mOrientationHelper.e(viewFindViewByPosition2) - this.mOrientationHelper.k() < 0) {
                        v0Var2.f15149c = this.mOrientationHelper.k();
                        v0Var2.f15150d = false;
                    } else if (this.mOrientationHelper.g() - this.mOrientationHelper.b(viewFindViewByPosition2) < 0) {
                        v0Var2.f15149c = this.mOrientationHelper.g();
                        v0Var2.f15150d = true;
                    } else {
                        v0Var2.f15149c = v0Var2.f15150d ? this.mOrientationHelper.m() + this.mOrientationHelper.b(viewFindViewByPosition2) : this.mOrientationHelper.e(viewFindViewByPosition2);
                    }
                } else {
                    boolean z16 = this.mShouldReverseLayout;
                    v0Var2.f15150d = z16;
                    if (z16) {
                        v0Var2.f15149c = this.mOrientationHelper.g() - this.mPendingScrollPositionOffset;
                    } else {
                        v0Var2.f15149c = this.mOrientationHelper.k() + this.mPendingScrollPositionOffset;
                    }
                }
                this.mAnchorInfo.f15151e = true;
            }
        } else if (focusedChild != null && (this.mOrientationHelper.e(focusedChild) >= this.mOrientationHelper.g() || this.mOrientationHelper.b(focusedChild) <= this.mOrientationHelper.k())) {
            this.mAnchorInfo.c(getPosition(focusedChild), focusedChild);
        }
        x0 x0Var = this.mLayoutState;
        x0Var.f15174f = x0Var.f15178j >= 0 ? 1 : -1;
        int[] iArr = this.mReusableIntPair;
        iArr[0] = 0;
        iArr[1] = 0;
        calculateExtraLayoutSpace(o2Var, iArr);
        int iK2 = this.mOrientationHelper.k() + Math.max(0, this.mReusableIntPair[0]);
        int iH = this.mOrientationHelper.h() + Math.max(0, this.mReusableIntPair[1]);
        if (o2Var.f15075g && (i15 = this.mPendingScrollPosition) != -1 && this.mPendingScrollPositionOffset != Integer.MIN_VALUE && (viewFindViewByPosition = findViewByPosition(i15)) != null) {
            if (this.mShouldReverseLayout) {
                iG = this.mOrientationHelper.g() - this.mOrientationHelper.b(viewFindViewByPosition);
                iE = this.mPendingScrollPositionOffset;
            } else {
                iE = this.mOrientationHelper.e(viewFindViewByPosition) - this.mOrientationHelper.k();
                iG = this.mPendingScrollPositionOffset;
            }
            int i17 = iG - iE;
            if (i17 > 0) {
                iK2 += i17;
            } else {
                iH -= i17;
            }
        }
        v0 v0Var3 = this.mAnchorInfo;
        if (!v0Var3.f15150d ? !this.mShouldReverseLayout : this.mShouldReverseLayout) {
            i16 = 1;
        }
        onAnchorReady(h2Var, o2Var, v0Var3, i16);
        detachAndScrapAttachedViews(h2Var);
        this.mLayoutState.f15180l = resolveIsInfinite();
        this.mLayoutState.getClass();
        this.mLayoutState.f15177i = 0;
        v0 v0Var4 = this.mAnchorInfo;
        if (v0Var4.f15150d) {
            B(v0Var4.f15148b, v0Var4.f15149c);
            x0 x0Var2 = this.mLayoutState;
            x0Var2.f15176h = iK2;
            fill(h2Var, x0Var2, o2Var, false);
            x0 x0Var3 = this.mLayoutState;
            i12 = x0Var3.f15170b;
            int i18 = x0Var3.f15172d;
            int i19 = x0Var3.f15171c;
            if (i19 > 0) {
                iH += i19;
            }
            v0 v0Var5 = this.mAnchorInfo;
            A(v0Var5.f15148b, v0Var5.f15149c);
            x0 x0Var4 = this.mLayoutState;
            x0Var4.f15176h = iH;
            x0Var4.f15172d += x0Var4.f15173e;
            fill(h2Var, x0Var4, o2Var, false);
            x0 x0Var5 = this.mLayoutState;
            i11 = x0Var5.f15170b;
            int i21 = x0Var5.f15171c;
            if (i21 > 0) {
                B(i18, i12);
                x0 x0Var6 = this.mLayoutState;
                x0Var6.f15176h = i21;
                fill(h2Var, x0Var6, o2Var, false);
                i12 = this.mLayoutState.f15170b;
            }
        } else {
            A(v0Var4.f15148b, v0Var4.f15149c);
            x0 x0Var7 = this.mLayoutState;
            x0Var7.f15176h = iH;
            fill(h2Var, x0Var7, o2Var, false);
            x0 x0Var8 = this.mLayoutState;
            i11 = x0Var8.f15170b;
            int i22 = x0Var8.f15172d;
            int i23 = x0Var8.f15171c;
            if (i23 > 0) {
                iK2 += i23;
            }
            v0 v0Var6 = this.mAnchorInfo;
            B(v0Var6.f15148b, v0Var6.f15149c);
            x0 x0Var9 = this.mLayoutState;
            x0Var9.f15176h = iK2;
            x0Var9.f15172d += x0Var9.f15173e;
            fill(h2Var, x0Var9, o2Var, false);
            x0 x0Var10 = this.mLayoutState;
            int i24 = x0Var10.f15170b;
            int i25 = x0Var10.f15171c;
            if (i25 > 0) {
                A(i22, i11);
                x0 x0Var11 = this.mLayoutState;
                x0Var11.f15176h = i25;
                fill(h2Var, x0Var11, o2Var, false);
                i11 = this.mLayoutState.f15170b;
            }
            i12 = i24;
        }
        if (getChildCount() > 0) {
            if (this.mShouldReverseLayout ^ this.mStackFromEnd) {
                int iR2 = r(i11, h2Var, o2Var, true);
                i13 = i12 + iR2;
                i14 = i11 + iR2;
                iR = s(i13, h2Var, o2Var, false);
            } else {
                int iS = s(i12, h2Var, o2Var, true);
                i13 = i12 + iS;
                i14 = i11 + iS;
                iR = r(i14, h2Var, o2Var, false);
            }
            i12 = i13 + iR;
            i11 = i14 + iR;
        }
        if (o2Var.f15079k && getChildCount() != 0 && !o2Var.f15075g && supportsPredictiveItemAnimations()) {
            List list = h2Var.f14984d;
            int size = list.size();
            int position = getPosition(getChildAt(0));
            int iC = 0;
            int iC2 = 0;
            for (int i26 = 0; i26 < size; i26++) {
                s2 s2Var = (s2) list.get(i26);
                if (!s2Var.isRemoved()) {
                    if ((s2Var.getLayoutPosition() < position) != this.mShouldReverseLayout) {
                        iC += this.mOrientationHelper.c(s2Var.itemView);
                    } else {
                        iC2 += this.mOrientationHelper.c(s2Var.itemView);
                    }
                }
            }
            this.mLayoutState.f15179k = list;
            if (iC > 0) {
                B(getPosition(u()), i12);
                x0 x0Var12 = this.mLayoutState;
                x0Var12.f15176h = iC;
                x0Var12.f15171c = 0;
                x0Var12.a(null);
                fill(h2Var, this.mLayoutState, o2Var, false);
            }
            if (iC2 > 0) {
                A(getPosition(t()), i11);
                x0 x0Var13 = this.mLayoutState;
                x0Var13.f15176h = iC2;
                x0Var13.f15171c = 0;
                x0Var13.a(null);
                fill(h2Var, this.mLayoutState, o2Var, false);
            }
            this.mLayoutState.f15179k = null;
        }
        if (o2Var.f15075g) {
            this.mAnchorInfo.d();
        } else {
            f1 f1Var = this.mOrientationHelper;
            f1Var.f14957b = f1Var.l();
        }
        this.mLastStackFromEnd = this.mStackFromEnd;
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public void onLayoutCompleted(o2 o2Var) {
        this.mPendingSavedState = null;
        this.mPendingScrollPosition = -1;
        this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
        this.mAnchorInfo.d();
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof SavedState) {
            SavedState savedState = (SavedState) parcelable;
            this.mPendingSavedState = savedState;
            if (this.mPendingScrollPosition != -1) {
                savedState.d();
            }
            requestLayout();
        }
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public Parcelable onSaveInstanceState() {
        SavedState savedState = this.mPendingSavedState;
        if (savedState != null) {
            return new SavedState(savedState);
        }
        SavedState savedState2 = new SavedState();
        if (getChildCount() <= 0) {
            savedState2.d();
            return savedState2;
        }
        ensureLayoutState();
        boolean z11 = this.mLastStackFromEnd ^ this.mShouldReverseLayout;
        savedState2.f14837c = z11;
        if (z11) {
            View viewT = t();
            savedState2.f14836b = this.mOrientationHelper.g() - this.mOrientationHelper.b(viewT);
            savedState2.f14835a = getPosition(viewT);
            return savedState2;
        }
        View viewU = u();
        savedState2.f14835a = getPosition(viewU);
        savedState2.f14836b = this.mOrientationHelper.e(viewU) - this.mOrientationHelper.k();
        return savedState2;
    }

    public final int p(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        ensureLayoutState();
        return c.b(o2Var, this.mOrientationHelper, findFirstVisibleChildClosestToStart(!this.mSmoothScrollbarEnabled, true), findFirstVisibleChildClosestToEnd(!this.mSmoothScrollbarEnabled, true), this, this.mSmoothScrollbarEnabled, this.mShouldReverseLayout);
    }

    @Override // androidx.recyclerview.widget.q0
    public void prepareForDrop(View view, View view2, int i5, int i11) {
        assertNotInLayoutOrScroll("Cannot drop a view during a scroll or layout calculation");
        ensureLayoutState();
        y();
        int position = getPosition(view);
        int position2 = getPosition(view2);
        char c11 = position < position2 ? (char) 1 : (char) 65535;
        if (this.mShouldReverseLayout) {
            if (c11 == 1) {
                scrollToPositionWithOffset(position2, this.mOrientationHelper.g() - (this.mOrientationHelper.c(view) + this.mOrientationHelper.e(view2)));
                return;
            } else {
                scrollToPositionWithOffset(position2, this.mOrientationHelper.g() - this.mOrientationHelper.b(view2));
                return;
            }
        }
        if (c11 == 65535) {
            scrollToPositionWithOffset(position2, this.mOrientationHelper.e(view2));
        } else {
            scrollToPositionWithOffset(position2, this.mOrientationHelper.b(view2) - this.mOrientationHelper.c(view));
        }
    }

    public final int q(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        ensureLayoutState();
        return c.c(o2Var, this.mOrientationHelper, findFirstVisibleChildClosestToStart(!this.mSmoothScrollbarEnabled, true), findFirstVisibleChildClosestToEnd(!this.mSmoothScrollbarEnabled, true), this, this.mSmoothScrollbarEnabled);
    }

    public final int r(int i5, h2 h2Var, o2 o2Var, boolean z11) {
        int iG;
        int iG2 = this.mOrientationHelper.g() - i5;
        if (iG2 <= 0) {
            return 0;
        }
        int i11 = -scrollBy(-iG2, h2Var, o2Var);
        int i12 = i5 + i11;
        if (!z11 || (iG = this.mOrientationHelper.g() - i12) <= 0) {
            return i11;
        }
        this.mOrientationHelper.p(iG);
        return iG + i11;
    }

    public boolean resolveIsInfinite() {
        return this.mOrientationHelper.i() == 0 && this.mOrientationHelper.f() == 0;
    }

    public final int s(int i5, h2 h2Var, o2 o2Var, boolean z11) {
        int iK;
        int iK2 = i5 - this.mOrientationHelper.k();
        if (iK2 <= 0) {
            return 0;
        }
        int i11 = -scrollBy(iK2, h2Var, o2Var);
        int i12 = i5 + i11;
        if (!z11 || (iK = i12 - this.mOrientationHelper.k()) <= 0) {
            return i11;
        }
        this.mOrientationHelper.p(-iK);
        return i11 - iK;
    }

    public int scrollBy(int i5, h2 h2Var, o2 o2Var) {
        if (getChildCount() == 0 || i5 == 0) {
            return 0;
        }
        ensureLayoutState();
        this.mLayoutState.f15169a = true;
        int i11 = i5 > 0 ? 1 : -1;
        int iAbs = Math.abs(i5);
        z(i11, iAbs, true, o2Var);
        x0 x0Var = this.mLayoutState;
        int iFill = fill(h2Var, x0Var, o2Var, false) + x0Var.f15175g;
        if (iFill < 0) {
            return 0;
        }
        if (iAbs > iFill) {
            i5 = i11 * iFill;
        }
        this.mOrientationHelper.p(-i5);
        this.mLayoutState.f15178j = i5;
        return i5;
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public int scrollHorizontallyBy(int i5, h2 h2Var, o2 o2Var) {
        if (this.mOrientation == 1) {
            return 0;
        }
        return scrollBy(i5, h2Var, o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public void scrollToPosition(int i5) {
        this.mPendingScrollPosition = i5;
        this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
        SavedState savedState = this.mPendingSavedState;
        if (savedState != null) {
            savedState.d();
        }
        requestLayout();
    }

    public void scrollToPositionWithOffset(int i5, int i11) {
        this.mPendingScrollPosition = i5;
        this.mPendingScrollPositionOffset = i11;
        SavedState savedState = this.mPendingSavedState;
        if (savedState != null) {
            savedState.d();
        }
        requestLayout();
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public int scrollVerticallyBy(int i5, h2 h2Var, o2 o2Var) {
        if (this.mOrientation == 0) {
            return 0;
        }
        return scrollBy(i5, h2Var, o2Var);
    }

    public void setInitialPrefetchItemCount(int i5) {
        this.mInitialPrefetchItemCount = i5;
    }

    public void setOrientation(int i5) {
        if (i5 != 0 && i5 != 1) {
            throw new IllegalArgumentException(b.c0.h(i5, "invalid orientation:"));
        }
        assertNotInLayoutOrScroll(null);
        if (i5 != this.mOrientation || this.mOrientationHelper == null) {
            f1 f1VarA = f1.a(this, i5);
            this.mOrientationHelper = f1VarA;
            this.mAnchorInfo.f15147a = f1VarA;
            this.mOrientation = i5;
            requestLayout();
        }
    }

    public void setRecycleChildrenOnDetach(boolean z11) {
        this.mRecycleChildrenOnDetach = z11;
    }

    public void setReverseLayout(boolean z11) {
        assertNotInLayoutOrScroll(null);
        if (z11 == this.mReverseLayout) {
            return;
        }
        this.mReverseLayout = z11;
        requestLayout();
    }

    public void setSmoothScrollbarEnabled(boolean z11) {
        this.mSmoothScrollbarEnabled = z11;
    }

    public void setStackFromEnd(boolean z11) {
        assertNotInLayoutOrScroll(null);
        if (this.mStackFromEnd == z11) {
            return;
        }
        this.mStackFromEnd = z11;
        requestLayout();
    }

    @Override // androidx.recyclerview.widget.z1
    public boolean shouldMeasureTwice() {
        return (getHeightMode() == 1073741824 || getWidthMode() == 1073741824 || !hasFlexibleChildInBothOrientations()) ? false : true;
    }

    @Override // androidx.recyclerview.widget.z1
    @SuppressLint({"UnknownNullness"})
    public void smoothScrollToPosition(RecyclerView recyclerView, o2 o2Var, int i5) {
        z0 z0Var = new z0(recyclerView.getContext());
        z0Var.setTargetPosition(i5);
        startSmoothScroll(z0Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public boolean supportsPredictiveItemAnimations() {
        return this.mPendingSavedState == null && this.mLastStackFromEnd == this.mStackFromEnd;
    }

    public final View t() {
        return getChildAt(this.mShouldReverseLayout ? 0 : getChildCount() - 1);
    }

    public final View u() {
        return getChildAt(this.mShouldReverseLayout ? getChildCount() - 1 : 0);
    }

    public final void v() {
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            View childAt = getChildAt(i5);
            getPosition(childAt);
            this.mOrientationHelper.e(childAt);
        }
    }

    public void validateChildOrder() {
        getChildCount();
        if (getChildCount() < 1) {
            return;
        }
        int position = getPosition(getChildAt(0));
        int iE = this.mOrientationHelper.e(getChildAt(0));
        if (this.mShouldReverseLayout) {
            for (int i5 = 1; i5 < getChildCount(); i5++) {
                View childAt = getChildAt(i5);
                int position2 = getPosition(childAt);
                int iE2 = this.mOrientationHelper.e(childAt);
                if (position2 < position) {
                    v();
                    StringBuilder sb2 = new StringBuilder("detected invalid position. loc invalid? ");
                    sb2.append(iE2 < iE);
                    throw new RuntimeException(sb2.toString());
                }
                if (iE2 > iE) {
                    v();
                    throw new RuntimeException("detected invalid location");
                }
            }
            return;
        }
        for (int i11 = 1; i11 < getChildCount(); i11++) {
            View childAt2 = getChildAt(i11);
            int position3 = getPosition(childAt2);
            int iE3 = this.mOrientationHelper.e(childAt2);
            if (position3 < position) {
                v();
                StringBuilder sb3 = new StringBuilder("detected invalid position. loc invalid? ");
                sb3.append(iE3 < iE);
                throw new RuntimeException(sb3.toString());
            }
            if (iE3 < iE) {
                v();
                throw new RuntimeException("detected invalid location");
            }
        }
    }

    public final void w(h2 h2Var, x0 x0Var) {
        if (!x0Var.f15169a || x0Var.f15180l) {
            return;
        }
        int i5 = x0Var.f15175g;
        int i11 = x0Var.f15177i;
        if (x0Var.f15174f == -1) {
            int childCount = getChildCount();
            if (i5 < 0) {
                return;
            }
            int iF = (this.mOrientationHelper.f() - i5) + i11;
            if (this.mShouldReverseLayout) {
                for (int i12 = 0; i12 < childCount; i12++) {
                    View childAt = getChildAt(i12);
                    if (this.mOrientationHelper.e(childAt) < iF || this.mOrientationHelper.o(childAt) < iF) {
                        x(h2Var, 0, i12);
                        return;
                    }
                }
                return;
            }
            int i13 = childCount - 1;
            for (int i14 = i13; i14 >= 0; i14--) {
                View childAt2 = getChildAt(i14);
                if (this.mOrientationHelper.e(childAt2) < iF || this.mOrientationHelper.o(childAt2) < iF) {
                    x(h2Var, i13, i14);
                    return;
                }
            }
            return;
        }
        if (i5 < 0) {
            return;
        }
        int i15 = i5 - i11;
        int childCount2 = getChildCount();
        if (!this.mShouldReverseLayout) {
            for (int i16 = 0; i16 < childCount2; i16++) {
                View childAt3 = getChildAt(i16);
                if (this.mOrientationHelper.b(childAt3) > i15 || this.mOrientationHelper.n(childAt3) > i15) {
                    x(h2Var, 0, i16);
                    return;
                }
            }
            return;
        }
        int i17 = childCount2 - 1;
        for (int i18 = i17; i18 >= 0; i18--) {
            View childAt4 = getChildAt(i18);
            if (this.mOrientationHelper.b(childAt4) > i15 || this.mOrientationHelper.n(childAt4) > i15) {
                x(h2Var, i17, i18);
                return;
            }
        }
    }

    public final void x(h2 h2Var, int i5, int i11) {
        if (i5 == i11) {
            return;
        }
        if (i11 <= i5) {
            while (i5 > i11) {
                removeAndRecycleViewAt(i5, h2Var);
                i5--;
            }
        } else {
            for (int i12 = i11 - 1; i12 >= i5; i12--) {
                removeAndRecycleViewAt(i12, h2Var);
            }
        }
    }

    public final void y() {
        if (this.mOrientation == 1 || !isLayoutRTL()) {
            this.mShouldReverseLayout = this.mReverseLayout;
        } else {
            this.mShouldReverseLayout = !this.mReverseLayout;
        }
    }

    public final void z(int i5, int i11, boolean z11, o2 o2Var) {
        int iK;
        this.mLayoutState.f15180l = resolveIsInfinite();
        this.mLayoutState.f15174f = i5;
        int[] iArr = this.mReusableIntPair;
        iArr[0] = 0;
        iArr[1] = 0;
        calculateExtraLayoutSpace(o2Var, iArr);
        int iMax = Math.max(0, this.mReusableIntPair[0]);
        int iMax2 = Math.max(0, this.mReusableIntPair[1]);
        boolean z12 = i5 == 1;
        x0 x0Var = this.mLayoutState;
        int i12 = z12 ? iMax2 : iMax;
        x0Var.f15176h = i12;
        if (!z12) {
            iMax = iMax2;
        }
        x0Var.f15177i = iMax;
        if (z12) {
            x0Var.f15176h = this.mOrientationHelper.h() + i12;
            View viewT = t();
            x0 x0Var2 = this.mLayoutState;
            x0Var2.f15173e = this.mShouldReverseLayout ? -1 : 1;
            int position = getPosition(viewT);
            x0 x0Var3 = this.mLayoutState;
            x0Var2.f15172d = position + x0Var3.f15173e;
            x0Var3.f15170b = this.mOrientationHelper.b(viewT);
            iK = this.mOrientationHelper.b(viewT) - this.mOrientationHelper.g();
        } else {
            View viewU = u();
            x0 x0Var4 = this.mLayoutState;
            x0Var4.f15176h = this.mOrientationHelper.k() + x0Var4.f15176h;
            x0 x0Var5 = this.mLayoutState;
            x0Var5.f15173e = this.mShouldReverseLayout ? 1 : -1;
            int position2 = getPosition(viewU);
            x0 x0Var6 = this.mLayoutState;
            x0Var5.f15172d = position2 + x0Var6.f15173e;
            x0Var6.f15170b = this.mOrientationHelper.e(viewU);
            iK = (-this.mOrientationHelper.e(viewU)) + this.mOrientationHelper.k();
        }
        x0 x0Var7 = this.mLayoutState;
        x0Var7.f15171c = i11;
        if (z11) {
            x0Var7.f15171c = i11 - iK;
        }
        x0Var7.f15175g = iK;
    }

    public LinearLayoutManager(int i5, boolean z11) {
        this.mOrientation = 1;
        this.mReverseLayout = false;
        this.mShouldReverseLayout = false;
        this.mStackFromEnd = false;
        this.mSmoothScrollbarEnabled = true;
        this.mPendingScrollPosition = -1;
        this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
        this.mPendingSavedState = null;
        this.mAnchorInfo = new v0();
        this.mLayoutChunkResult = new w0();
        this.mInitialPrefetchItemCount = 2;
        this.mReusableIntPair = new int[2];
        setOrientation(i5);
        setReverseLayout(z11);
    }

    @SuppressLint({"UnknownNullness"})
    public LinearLayoutManager(Context context, AttributeSet attributeSet, int i5, int i11) {
        this.mOrientation = 1;
        this.mReverseLayout = false;
        this.mShouldReverseLayout = false;
        this.mStackFromEnd = false;
        this.mSmoothScrollbarEnabled = true;
        this.mPendingScrollPosition = -1;
        this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
        this.mPendingSavedState = null;
        this.mAnchorInfo = new v0();
        this.mLayoutChunkResult = new w0();
        this.mInitialPrefetchItemCount = 2;
        this.mReusableIntPair = new int[2];
        y1 properties = z1.getProperties(context, attributeSet, i5, i11);
        setOrientation(properties.f15183a);
        setReverseLayout(properties.f15185c);
        setStackFromEnd(properties.f15186d);
    }
}
