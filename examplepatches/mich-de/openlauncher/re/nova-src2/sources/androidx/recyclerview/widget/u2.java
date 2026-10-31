package androidx.recyclerview.widget;

import android.os.Bundle;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;

/* loaded from: classes.dex */
public class u2 extends a5.b {

    /* renamed from: d, reason: collision with root package name */
    public final RecyclerView f15141d;

    /* renamed from: e, reason: collision with root package name */
    public final t2 f15142e;

    public u2(RecyclerView recyclerView) {
        this.f15141d = recyclerView;
        a5.b bVarJ = j();
        if (bVarJ == null || !(bVarJ instanceof t2)) {
            this.f15142e = new t2(this);
        } else {
            this.f15142e = (t2) bVarJ;
        }
    }

    @Override // a5.b
    public final void c(View view, AccessibilityEvent accessibilityEvent) {
        super.c(view, accessibilityEvent);
        if (!(view instanceof RecyclerView) || this.f15141d.hasPendingAdapterUpdates()) {
            return;
        }
        RecyclerView recyclerView = (RecyclerView) view;
        if (recyclerView.getLayoutManager() != null) {
            recyclerView.getLayoutManager().onInitializeAccessibilityEvent(accessibilityEvent);
        }
    }

    @Override // a5.b
    public final void d(View view, b5.g gVar) {
        this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
        RecyclerView recyclerView = this.f15141d;
        if (recyclerView.hasPendingAdapterUpdates() || recyclerView.getLayoutManager() == null) {
            return;
        }
        recyclerView.getLayoutManager().onInitializeAccessibilityNodeInfo(gVar);
    }

    @Override // a5.b
    public final boolean g(View view, int i5, Bundle bundle) {
        if (super.g(view, i5, bundle)) {
            return true;
        }
        RecyclerView recyclerView = this.f15141d;
        if (recyclerView.hasPendingAdapterUpdates() || recyclerView.getLayoutManager() == null) {
            return false;
        }
        return recyclerView.getLayoutManager().performAccessibilityAction(i5, bundle);
    }

    public a5.b j() {
        return this.f15142e;
    }
}
