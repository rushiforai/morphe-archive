package androidx.recyclerview.widget;

import android.view.animation.Interpolator;
import android.widget.OverScroller;
import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public final class r2 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public int f15109a;

    /* renamed from: b, reason: collision with root package name */
    public int f15110b;

    /* renamed from: c, reason: collision with root package name */
    public OverScroller f15111c;

    /* renamed from: d, reason: collision with root package name */
    public Interpolator f15112d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f15113e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f15114f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ RecyclerView f15115g;

    public r2(RecyclerView recyclerView) {
        this.f15115g = recyclerView;
        Interpolator interpolator = RecyclerView.sQuinticInterpolator;
        this.f15112d = interpolator;
        this.f15113e = false;
        this.f15114f = false;
        this.f15111c = new OverScroller(recyclerView.getContext(), interpolator);
    }

    public final void a(int i5, int i11) {
        RecyclerView recyclerView = this.f15115g;
        recyclerView.setScrollState(2);
        this.f15110b = 0;
        this.f15109a = 0;
        Interpolator interpolator = this.f15112d;
        Interpolator interpolator2 = RecyclerView.sQuinticInterpolator;
        if (interpolator != interpolator2) {
            this.f15112d = interpolator2;
            this.f15111c = new OverScroller(recyclerView.getContext(), interpolator2);
        }
        this.f15111c.fling(0, 0, i5, i11, Integer.MIN_VALUE, LayoutNode.NotPlacedPlaceOrder, Integer.MIN_VALUE, LayoutNode.NotPlacedPlaceOrder);
        b();
    }

    public final void b() {
        if (this.f15113e) {
            this.f15114f = true;
            return;
        }
        RecyclerView recyclerView = this.f15115g;
        recyclerView.removeCallbacks(this);
        WeakHashMap weakHashMap = a5.a1.f250a;
        recyclerView.postOnAnimation(this);
    }

    public final void c(int i5, int i11, Interpolator interpolator, int i12) {
        RecyclerView recyclerView = this.f15115g;
        if (i12 == Integer.MIN_VALUE) {
            int iAbs = Math.abs(i5);
            int iAbs2 = Math.abs(i11);
            boolean z11 = iAbs > iAbs2;
            int width = z11 ? recyclerView.getWidth() : recyclerView.getHeight();
            if (!z11) {
                iAbs = iAbs2;
            }
            i12 = Math.min((int) (((iAbs / width) + 1.0f) * 300.0f), 2000);
        }
        int i13 = i12;
        if (interpolator == null) {
            interpolator = RecyclerView.sQuinticInterpolator;
        }
        if (this.f15112d != interpolator) {
            this.f15112d = interpolator;
            this.f15111c = new OverScroller(recyclerView.getContext(), interpolator);
        }
        this.f15110b = 0;
        this.f15109a = 0;
        recyclerView.setScrollState(2);
        this.f15111c.startScroll(0, 0, i5, i11, i13);
        b();
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5;
        int i11;
        int i12;
        int i13;
        RecyclerView recyclerView = this.f15115g;
        if (recyclerView.mLayout == null) {
            recyclerView.removeCallbacks(this);
            this.f15111c.abortAnimation();
            return;
        }
        this.f15114f = false;
        this.f15113e = true;
        recyclerView.consumePendingUpdateOperations();
        OverScroller overScroller = this.f15111c;
        if (overScroller.computeScrollOffset()) {
            int currX = overScroller.getCurrX();
            int currY = overScroller.getCurrY();
            int i14 = currX - this.f15109a;
            int i15 = currY - this.f15110b;
            this.f15109a = currX;
            this.f15110b = currY;
            int iConsumeFlingInHorizontalStretch = recyclerView.consumeFlingInHorizontalStretch(i14);
            int iConsumeFlingInVerticalStretch = recyclerView.consumeFlingInVerticalStretch(i15);
            int[] iArr = recyclerView.mReusableIntPair;
            iArr[0] = 0;
            iArr[1] = 0;
            if (recyclerView.dispatchNestedPreScroll(iConsumeFlingInHorizontalStretch, iConsumeFlingInVerticalStretch, iArr, null, 1)) {
                int[] iArr2 = recyclerView.mReusableIntPair;
                iConsumeFlingInHorizontalStretch -= iArr2[0];
                iConsumeFlingInVerticalStretch -= iArr2[1];
            }
            if (recyclerView.getOverScrollMode() != 2) {
                recyclerView.considerReleasingGlowsOnScroll(iConsumeFlingInHorizontalStretch, iConsumeFlingInVerticalStretch);
            }
            if (recyclerView.mAdapter != null) {
                int[] iArr3 = recyclerView.mReusableIntPair;
                iArr3[0] = 0;
                iArr3[1] = 0;
                recyclerView.scrollStep(iConsumeFlingInHorizontalStretch, iConsumeFlingInVerticalStretch, iArr3);
                int[] iArr4 = recyclerView.mReusableIntPair;
                int i16 = iArr4[0];
                int i17 = iArr4[1];
                int i18 = iConsumeFlingInHorizontalStretch - i16;
                int i19 = iConsumeFlingInVerticalStretch - i17;
                n2 n2Var = recyclerView.mLayout.mSmoothScroller;
                if (n2Var != null && !n2Var.isPendingInitialRun() && n2Var.isRunning()) {
                    int iB = recyclerView.mState.b();
                    if (iB == 0) {
                        n2Var.stop();
                    } else if (n2Var.getTargetPosition() >= iB) {
                        n2Var.setTargetPosition(iB - 1);
                        n2Var.onAnimation(i16, i17);
                    } else {
                        n2Var.onAnimation(i16, i17);
                    }
                }
                i5 = i18;
                i12 = i16;
                i11 = i19;
                i13 = i17;
            } else {
                i5 = iConsumeFlingInHorizontalStretch;
                i11 = iConsumeFlingInVerticalStretch;
                i12 = 0;
                i13 = 0;
            }
            if (!recyclerView.mItemDecorations.isEmpty()) {
                recyclerView.invalidate();
            }
            int[] iArr5 = recyclerView.mReusableIntPair;
            iArr5[0] = 0;
            iArr5[1] = 0;
            recyclerView.dispatchNestedScroll(i12, i13, i5, i11, null, 1, iArr5);
            int[] iArr6 = recyclerView.mReusableIntPair;
            int i21 = i5 - iArr6[0];
            int i22 = i11 - iArr6[1];
            if (i12 != 0 || i13 != 0) {
                recyclerView.dispatchOnScrolled(i12, i13);
            }
            if (!recyclerView.awakenScrollBars()) {
                recyclerView.invalidate();
            }
            boolean z11 = overScroller.isFinished() || (((overScroller.getCurrX() == overScroller.getFinalX()) || i21 != 0) && ((overScroller.getCurrY() == overScroller.getFinalY()) || i22 != 0));
            n2 n2Var2 = recyclerView.mLayout.mSmoothScroller;
            if ((n2Var2 == null || !n2Var2.isPendingInitialRun()) && z11) {
                if (recyclerView.getOverScrollMode() != 2) {
                    int currVelocity = (int) overScroller.getCurrVelocity();
                    int i23 = i21 < 0 ? -currVelocity : i21 > 0 ? currVelocity : 0;
                    if (i22 < 0) {
                        currVelocity = -currVelocity;
                    } else if (i22 <= 0) {
                        currVelocity = 0;
                    }
                    recyclerView.absorbGlows(i23, currVelocity);
                }
                if (RecyclerView.ALLOW_THREAD_GAP_WORK) {
                    d0 d0Var = recyclerView.mPrefetchRegistry;
                    int[] iArr7 = d0Var.f14922c;
                    if (iArr7 != null) {
                        Arrays.fill(iArr7, -1);
                    }
                    d0Var.f14923d = 0;
                }
            } else {
                b();
                f0 f0Var = recyclerView.mGapWorker;
                if (f0Var != null) {
                    f0Var.a(recyclerView, i12, i13);
                }
            }
        }
        n2 n2Var3 = recyclerView.mLayout.mSmoothScroller;
        if (n2Var3 != null && n2Var3.isPendingInitialRun()) {
            n2Var3.onAnimation(0, 0);
        }
        this.f15113e = false;
        if (!this.f15114f) {
            recyclerView.setScrollState(0);
            recyclerView.stopNestedScroll(1);
        } else {
            recyclerView.removeCallbacks(this);
            WeakHashMap weakHashMap = a5.a1.f250a;
            recyclerView.postOnAnimation(this);
        }
    }
}
