package androidx.recyclerview.widget;

import android.graphics.PointF;
import android.util.Log;
import android.view.View;

/* loaded from: classes2.dex */
public abstract class n2 {
    private z1 mLayoutManager;
    private boolean mPendingInitialRun;
    private RecyclerView mRecyclerView;
    private final l2 mRecyclingAction;
    private boolean mRunning;
    private boolean mStarted;
    private int mTargetPosition = -1;
    private View mTargetView;

    public n2() {
        l2 l2Var = new l2();
        l2Var.f15046d = -1;
        l2Var.f15048f = false;
        l2Var.f15049g = 0;
        l2Var.f15043a = 0;
        l2Var.f15044b = 0;
        l2Var.f15045c = Integer.MIN_VALUE;
        l2Var.f15047e = null;
        this.mRecyclingAction = l2Var;
    }

    public PointF computeScrollVectorForPosition(int i5) {
        Object layoutManager = getLayoutManager();
        if (layoutManager instanceof m2) {
            return ((m2) layoutManager).computeScrollVectorForPosition(i5);
        }
        Log.w("RecyclerView", "You should override computeScrollVectorForPosition when the LayoutManager does not implement " + m2.class.getCanonicalName());
        return null;
    }

    public View findViewByPosition(int i5) {
        return this.mRecyclerView.mLayout.findViewByPosition(i5);
    }

    public int getChildCount() {
        return this.mRecyclerView.mLayout.getChildCount();
    }

    public int getChildPosition(View view) {
        return this.mRecyclerView.getChildLayoutPosition(view);
    }

    public z1 getLayoutManager() {
        return this.mLayoutManager;
    }

    public int getTargetPosition() {
        return this.mTargetPosition;
    }

    @Deprecated
    public void instantScrollToPosition(int i5) {
        this.mRecyclerView.scrollToPosition(i5);
    }

    public boolean isPendingInitialRun() {
        return this.mPendingInitialRun;
    }

    public boolean isRunning() {
        return this.mRunning;
    }

    public void normalize(PointF pointF) {
        float f11 = pointF.x;
        float f12 = pointF.y;
        float fSqrt = (float) Math.sqrt((f12 * f12) + (f11 * f11));
        pointF.x /= fSqrt;
        pointF.y /= fSqrt;
    }

    public void onAnimation(int i5, int i11) {
        PointF pointFComputeScrollVectorForPosition;
        RecyclerView recyclerView = this.mRecyclerView;
        if (this.mTargetPosition == -1 || recyclerView == null) {
            stop();
        }
        if (this.mPendingInitialRun && this.mTargetView == null && this.mLayoutManager != null && (pointFComputeScrollVectorForPosition = computeScrollVectorForPosition(this.mTargetPosition)) != null) {
            float f11 = pointFComputeScrollVectorForPosition.x;
            if (f11 != 0.0f || pointFComputeScrollVectorForPosition.y != 0.0f) {
                recyclerView.scrollStep((int) Math.signum(f11), (int) Math.signum(pointFComputeScrollVectorForPosition.y), null);
            }
        }
        this.mPendingInitialRun = false;
        View view = this.mTargetView;
        if (view != null) {
            if (getChildPosition(view) == this.mTargetPosition) {
                onTargetFound(this.mTargetView, recyclerView.mState, this.mRecyclingAction);
                this.mRecyclingAction.a(recyclerView);
                stop();
            } else {
                Log.e("RecyclerView", "Passed over target position while smooth scrolling.");
                this.mTargetView = null;
            }
        }
        if (this.mRunning) {
            onSeekTargetStep(i5, i11, recyclerView.mState, this.mRecyclingAction);
            l2 l2Var = this.mRecyclingAction;
            boolean z11 = l2Var.f15046d >= 0;
            l2Var.a(recyclerView);
            if (z11 && this.mRunning) {
                this.mPendingInitialRun = true;
                recyclerView.mViewFlinger.b();
            }
        }
    }

    public void onChildAttachedToWindow(View view) {
        if (getChildPosition(view) == getTargetPosition()) {
            this.mTargetView = view;
            int i5 = RecyclerView.HORIZONTAL;
        }
    }

    public abstract void onSeekTargetStep(int i5, int i11, o2 o2Var, l2 l2Var);

    public abstract void onStart();

    public abstract void onStop();

    public abstract void onTargetFound(View view, o2 o2Var, l2 l2Var);

    public void setTargetPosition(int i5) {
        this.mTargetPosition = i5;
    }

    public void start(RecyclerView recyclerView, z1 z1Var) {
        r2 r2Var = recyclerView.mViewFlinger;
        r2Var.f15115g.removeCallbacks(r2Var);
        r2Var.f15111c.abortAnimation();
        if (this.mStarted) {
            Log.w("RecyclerView", "An instance of " + getClass().getSimpleName() + " was started more than once. Each instance of" + getClass().getSimpleName() + " is intended to only be used once. You should create a new instance for each use.");
        }
        this.mRecyclerView = recyclerView;
        this.mLayoutManager = z1Var;
        int i5 = this.mTargetPosition;
        if (i5 == -1) {
            throw new IllegalArgumentException("Invalid target position");
        }
        recyclerView.mState.f15069a = i5;
        this.mRunning = true;
        this.mPendingInitialRun = true;
        this.mTargetView = findViewByPosition(getTargetPosition());
        onStart();
        this.mRecyclerView.mViewFlinger.b();
        this.mStarted = true;
    }

    public final void stop() {
        if (this.mRunning) {
            this.mRunning = false;
            onStop();
            this.mRecyclerView.mState.f15069a = -1;
            this.mTargetView = null;
            this.mTargetPosition = -1;
            this.mPendingInitialRun = false;
            this.mLayoutManager.onSmoothScrollerStopped(this);
            this.mLayoutManager = null;
            this.mRecyclerView = null;
        }
    }
}
