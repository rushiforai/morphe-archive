package androidx.recyclerview.widget;

import android.annotation.SuppressLint;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.widget.Scroller;
import androidx.compose.ui.node.LayoutNode;

/* loaded from: classes2.dex */
public abstract class x2 extends c2 {
    static final float MILLISECONDS_PER_INCH = 100.0f;
    private Scroller mGravityScroller;
    RecyclerView mRecyclerView;
    private final e2 mScrollListener = new w2(this);

    public void attachToRecyclerView(RecyclerView recyclerView) {
        RecyclerView recyclerView2 = this.mRecyclerView;
        if (recyclerView2 == recyclerView) {
            return;
        }
        if (recyclerView2 != null) {
            recyclerView2.removeOnScrollListener(this.mScrollListener);
            this.mRecyclerView.setOnFlingListener(null);
        }
        this.mRecyclerView = recyclerView;
        if (recyclerView != null) {
            if (recyclerView.getOnFlingListener() != null) {
                throw new IllegalStateException("An instance of OnFlingListener already set.");
            }
            this.mRecyclerView.addOnScrollListener(this.mScrollListener);
            this.mRecyclerView.setOnFlingListener(this);
            this.mGravityScroller = new Scroller(this.mRecyclerView.getContext(), new DecelerateInterpolator());
            snapToTargetExistingView();
        }
    }

    public abstract int[] calculateDistanceToFinalSnap(z1 z1Var, View view);

    @SuppressLint({"UnknownNullness"})
    public int[] calculateScrollDistance(int i5, int i11) {
        this.mGravityScroller.fling(0, 0, i5, i11, Integer.MIN_VALUE, LayoutNode.NotPlacedPlaceOrder, Integer.MIN_VALUE, LayoutNode.NotPlacedPlaceOrder);
        return new int[]{this.mGravityScroller.getFinalX(), this.mGravityScroller.getFinalY()};
    }

    public abstract n2 createScroller(z1 z1Var);

    @Deprecated
    public z0 createSnapScroller(z1 z1Var) {
        if (z1Var instanceof m2) {
            return new g1(this, this.mRecyclerView.getContext(), 1);
        }
        return null;
    }

    public abstract View findSnapView(z1 z1Var);

    public abstract int findTargetSnapPosition(z1 z1Var, int i5, int i11);

    @Override // androidx.recyclerview.widget.c2
    public boolean onFling(int i5, int i11) {
        n2 n2VarCreateScroller;
        int iFindTargetSnapPosition;
        z1 layoutManager = this.mRecyclerView.getLayoutManager();
        if (layoutManager == null || this.mRecyclerView.getAdapter() == null) {
            return false;
        }
        int minFlingVelocity = this.mRecyclerView.getMinFlingVelocity();
        if ((Math.abs(i11) <= minFlingVelocity && Math.abs(i5) <= minFlingVelocity) || !(layoutManager instanceof m2) || (n2VarCreateScroller = createScroller(layoutManager)) == null || (iFindTargetSnapPosition = findTargetSnapPosition(layoutManager, i5, i11)) == -1) {
            return false;
        }
        n2VarCreateScroller.setTargetPosition(iFindTargetSnapPosition);
        layoutManager.startSmoothScroll(n2VarCreateScroller);
        return true;
    }

    public void snapToTargetExistingView() {
        z1 layoutManager;
        View viewFindSnapView;
        RecyclerView recyclerView = this.mRecyclerView;
        if (recyclerView == null || (layoutManager = recyclerView.getLayoutManager()) == null || (viewFindSnapView = findSnapView(layoutManager)) == null) {
            return;
        }
        int[] iArrCalculateDistanceToFinalSnap = calculateDistanceToFinalSnap(layoutManager, viewFindSnapView);
        int i5 = iArrCalculateDistanceToFinalSnap[0];
        if (i5 == 0 && iArrCalculateDistanceToFinalSnap[1] == 0) {
            return;
        }
        this.mRecyclerView.smoothScrollBy(i5, iArrCalculateDistanceToFinalSnap[1]);
    }
}
