package androidx.recyclerview.widget;

import android.view.View;

/* loaded from: classes.dex */
public final class k1 implements i3, s1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ RecyclerView f15030a;

    public /* synthetic */ k1(RecyclerView recyclerView) {
        this.f15030a = recyclerView;
    }

    public void a(a aVar) {
        int i5 = aVar.f14873a;
        RecyclerView recyclerView = this.f15030a;
        if (i5 == 1) {
            recyclerView.mLayout.onItemsAdded(recyclerView, aVar.f14874b, aVar.f14876d);
            return;
        }
        if (i5 == 2) {
            recyclerView.mLayout.onItemsRemoved(recyclerView, aVar.f14874b, aVar.f14876d);
        } else if (i5 == 4) {
            recyclerView.mLayout.onItemsUpdated(recyclerView, aVar.f14874b, aVar.f14876d, aVar.f14875c);
        } else {
            if (i5 != 8) {
                return;
            }
            recyclerView.mLayout.onItemsMoved(recyclerView, aVar.f14874b, aVar.f14876d, 1);
        }
    }

    public void b(int i5) {
        RecyclerView recyclerView = this.f15030a;
        View childAt = recyclerView.getChildAt(i5);
        if (childAt != null) {
            recyclerView.dispatchChildDetached(childAt);
            childAt.clearAnimation();
        }
        recyclerView.removeViewAt(i5);
    }
}
