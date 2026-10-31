package androidx.recyclerview.widget;

import java.util.ArrayList;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public final class j2 extends o1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ RecyclerView f15008a;

    public j2(RecyclerView recyclerView) {
        this.f15008a = recyclerView;
    }

    public final void a() {
        boolean z11 = RecyclerView.POST_UPDATES_ON_ANIMATION;
        RecyclerView recyclerView = this.f15008a;
        if (!z11 || !recyclerView.mHasFixedSize || !recyclerView.mIsAttached) {
            recyclerView.mAdapterUpdateDuringMeasure = true;
            recyclerView.requestLayout();
        } else {
            Runnable runnable = recyclerView.mUpdateChildViewsRunnable;
            WeakHashMap weakHashMap = a5.a1.f250a;
            recyclerView.postOnAnimation(runnable);
        }
    }

    @Override // androidx.recyclerview.widget.o1
    public final void onChanged() {
        RecyclerView recyclerView = this.f15008a;
        recyclerView.assertNotInLayoutOrScroll(null);
        recyclerView.mState.f15074f = true;
        recyclerView.processDataSetCompletelyChanged(true);
        if (recyclerView.mAdapterHelper.g()) {
            return;
        }
        recyclerView.requestLayout();
    }

    @Override // androidx.recyclerview.widget.o1
    public final void onItemRangeChanged(int i5, int i11, Object obj) {
        RecyclerView recyclerView = this.f15008a;
        recyclerView.assertNotInLayoutOrScroll(null);
        b bVar = recyclerView.mAdapterHelper;
        ArrayList arrayList = bVar.f14885b;
        if (i11 < 1) {
            return;
        }
        arrayList.add(bVar.h(obj, 4, i5, i11));
        bVar.f14889f |= 4;
        if (arrayList.size() == 1) {
            a();
        }
    }

    @Override // androidx.recyclerview.widget.o1
    public final void onItemRangeInserted(int i5, int i11) {
        RecyclerView recyclerView = this.f15008a;
        recyclerView.assertNotInLayoutOrScroll(null);
        b bVar = recyclerView.mAdapterHelper;
        ArrayList arrayList = bVar.f14885b;
        if (i11 < 1) {
            return;
        }
        arrayList.add(bVar.h(null, 1, i5, i11));
        bVar.f14889f |= 1;
        if (arrayList.size() == 1) {
            a();
        }
    }

    @Override // androidx.recyclerview.widget.o1
    public final void onItemRangeMoved(int i5, int i11, int i12) {
        RecyclerView recyclerView = this.f15008a;
        recyclerView.assertNotInLayoutOrScroll(null);
        b bVar = recyclerView.mAdapterHelper;
        ArrayList arrayList = bVar.f14885b;
        if (i5 == i11) {
            return;
        }
        if (i12 != 1) {
            throw new IllegalArgumentException("Moving more than 1 item is not supported yet");
        }
        arrayList.add(bVar.h(null, 8, i5, i11));
        bVar.f14889f |= 8;
        if (arrayList.size() == 1) {
            a();
        }
    }

    @Override // androidx.recyclerview.widget.o1
    public final void onItemRangeRemoved(int i5, int i11) {
        RecyclerView recyclerView = this.f15008a;
        recyclerView.assertNotInLayoutOrScroll(null);
        b bVar = recyclerView.mAdapterHelper;
        ArrayList arrayList = bVar.f14885b;
        if (i11 < 1) {
            return;
        }
        arrayList.add(bVar.h(null, 2, i5, i11));
        bVar.f14889f |= 2;
        if (arrayList.size() == 1) {
            a();
        }
    }

    @Override // androidx.recyclerview.widget.o1
    public final void onStateRestorationPolicyChanged() {
        m1 m1Var;
        RecyclerView recyclerView = this.f15008a;
        if (recyclerView.mPendingSavedState == null || (m1Var = recyclerView.mAdapter) == null || !m1Var.canRestoreState()) {
            return;
        }
        recyclerView.requestLayout();
    }
}
