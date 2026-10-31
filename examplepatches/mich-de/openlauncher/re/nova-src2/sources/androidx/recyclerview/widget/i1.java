package androidx.recyclerview.widget;

/* loaded from: classes.dex */
public final class i1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15001a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ RecyclerView f15002b;

    public /* synthetic */ i1(RecyclerView recyclerView, int i5) {
        this.f15001a = i5;
        this.f15002b = recyclerView;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f15001a) {
            case 0:
                RecyclerView recyclerView = this.f15002b;
                if (recyclerView.mFirstLayoutComplete && !recyclerView.isLayoutRequested()) {
                    if (!recyclerView.mIsAttached) {
                        recyclerView.requestLayout();
                        break;
                    } else if (!recyclerView.mLayoutSuppressed) {
                        recyclerView.consumePendingUpdateOperations();
                        break;
                    } else {
                        recyclerView.mLayoutWasDefered = true;
                        break;
                    }
                }
                break;
            default:
                RecyclerView recyclerView2 = this.f15002b;
                u1 u1Var = recyclerView2.mItemAnimator;
                if (u1Var != null) {
                    u1Var.runPendingAnimations();
                }
                recyclerView2.mPostedAnimatorRunner = false;
                break;
        }
    }
}
