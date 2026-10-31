package androidx.recyclerview.widget;

import java.util.Arrays;

/* loaded from: classes.dex */
public final class d0 implements x1 {

    /* renamed from: a, reason: collision with root package name */
    public int f14920a;

    /* renamed from: b, reason: collision with root package name */
    public int f14921b;

    /* renamed from: c, reason: collision with root package name */
    public int[] f14922c;

    /* renamed from: d, reason: collision with root package name */
    public int f14923d;

    public final void a(int i5, int i11) {
        if (i5 < 0) {
            throw new IllegalArgumentException("Layout positions must be non-negative");
        }
        if (i11 < 0) {
            throw new IllegalArgumentException("Pixel distance must be non-negative");
        }
        int i12 = this.f14923d;
        int i13 = i12 * 2;
        int[] iArr = this.f14922c;
        if (iArr == null) {
            int[] iArr2 = new int[4];
            this.f14922c = iArr2;
            Arrays.fill(iArr2, -1);
        } else if (i13 >= iArr.length) {
            int[] iArr3 = new int[i12 * 4];
            this.f14922c = iArr3;
            System.arraycopy(iArr, 0, iArr3, 0, iArr.length);
        }
        int[] iArr4 = this.f14922c;
        iArr4[i13] = i5;
        iArr4[i13 + 1] = i11;
        this.f14923d++;
    }

    public final void b(RecyclerView recyclerView, boolean z11) {
        this.f14923d = 0;
        int[] iArr = this.f14922c;
        if (iArr != null) {
            Arrays.fill(iArr, -1);
        }
        z1 z1Var = recyclerView.mLayout;
        if (recyclerView.mAdapter == null || z1Var == null || !z1Var.isItemPrefetchEnabled()) {
            return;
        }
        if (z11) {
            if (!recyclerView.mAdapterHelper.g()) {
                z1Var.collectInitialPrefetchPositions(recyclerView.mAdapter.getItemCount(), this);
            }
        } else if (!recyclerView.hasPendingAdapterUpdates()) {
            z1Var.collectAdjacentPrefetchPositions(this.f14920a, this.f14921b, recyclerView.mState, this);
        }
        int i5 = this.f14923d;
        if (i5 > z1Var.mPrefetchMaxCountObserved) {
            z1Var.mPrefetchMaxCountObserved = i5;
            z1Var.mPrefetchMaxObservedInInitialPrefetch = z11;
            recyclerView.mRecycler.n();
        }
    }
}
