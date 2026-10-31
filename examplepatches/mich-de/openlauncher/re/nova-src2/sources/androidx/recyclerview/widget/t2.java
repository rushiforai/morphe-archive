package androidx.recyclerview.widget;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public final class t2 extends a5.b {

    /* renamed from: d, reason: collision with root package name */
    public final u2 f15127d;

    /* renamed from: e, reason: collision with root package name */
    public final WeakHashMap f15128e = new WeakHashMap();

    public t2(u2 u2Var) {
        this.f15127d = u2Var;
    }

    @Override // a5.b
    public final boolean a(View view, AccessibilityEvent accessibilityEvent) {
        a5.b bVar = (a5.b) this.f15128e.get(view);
        return bVar != null ? bVar.a(view, accessibilityEvent) : this.f258a.dispatchPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    @Override // a5.b
    public final vm.c b(View view) {
        a5.b bVar = (a5.b) this.f15128e.get(view);
        return bVar != null ? bVar.b(view) : super.b(view);
    }

    @Override // a5.b
    public final void c(View view, AccessibilityEvent accessibilityEvent) {
        a5.b bVar = (a5.b) this.f15128e.get(view);
        if (bVar != null) {
            bVar.c(view, accessibilityEvent);
        } else {
            super.c(view, accessibilityEvent);
        }
    }

    @Override // a5.b
    public final void d(View view, b5.g gVar) {
        u2 u2Var = this.f15127d;
        RecyclerView recyclerView = u2Var.f15141d;
        RecyclerView recyclerView2 = u2Var.f15141d;
        boolean zHasPendingAdapterUpdates = recyclerView.hasPendingAdapterUpdates();
        View.AccessibilityDelegate accessibilityDelegate = this.f258a;
        if (zHasPendingAdapterUpdates || recyclerView2.getLayoutManager() == null) {
            accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, gVar.k0());
            return;
        }
        recyclerView2.getLayoutManager().onInitializeAccessibilityNodeInfoForItem(view, gVar);
        a5.b bVar = (a5.b) this.f15128e.get(view);
        if (bVar != null) {
            bVar.d(view, gVar);
        } else {
            accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, gVar.k0());
        }
    }

    @Override // a5.b
    public final void e(View view, AccessibilityEvent accessibilityEvent) {
        a5.b bVar = (a5.b) this.f15128e.get(view);
        if (bVar != null) {
            bVar.e(view, accessibilityEvent);
        } else {
            super.e(view, accessibilityEvent);
        }
    }

    @Override // a5.b
    public final boolean f(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        a5.b bVar = (a5.b) this.f15128e.get(viewGroup);
        return bVar != null ? bVar.f(viewGroup, view, accessibilityEvent) : this.f258a.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
    }

    @Override // a5.b
    public final boolean g(View view, int i5, Bundle bundle) {
        u2 u2Var = this.f15127d;
        RecyclerView recyclerView = u2Var.f15141d;
        RecyclerView recyclerView2 = u2Var.f15141d;
        if (recyclerView.hasPendingAdapterUpdates() || recyclerView2.getLayoutManager() == null) {
            return super.g(view, i5, bundle);
        }
        a5.b bVar = (a5.b) this.f15128e.get(view);
        if (bVar != null) {
            if (bVar.g(view, i5, bundle)) {
                return true;
            }
        } else if (super.g(view, i5, bundle)) {
            return true;
        }
        return recyclerView2.getLayoutManager().performAccessibilityActionForItem(view, i5, bundle);
    }

    @Override // a5.b
    public final void h(View view, int i5) {
        a5.b bVar = (a5.b) this.f15128e.get(view);
        if (bVar != null) {
            bVar.h(view, i5);
        } else {
            super.h(view, i5);
        }
    }

    @Override // a5.b
    public final void i(View view, AccessibilityEvent accessibilityEvent) {
        a5.b bVar = (a5.b) this.f15128e.get(view);
        if (bVar != null) {
            bVar.i(view, accessibilityEvent);
        } else {
            super.i(view, accessibilityEvent);
        }
    }
}
