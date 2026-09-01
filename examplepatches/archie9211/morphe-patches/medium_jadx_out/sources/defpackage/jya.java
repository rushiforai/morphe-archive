package defpackage;

import android.os.Bundle;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import androidx.recyclerview.widget.RecyclerView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jya extends l4 {
    public final RecyclerView d;
    public final iya e;

    public jya(RecyclerView recyclerView) {
        this.d = recyclerView;
        iya iyaVar = this.e;
        if (iyaVar != null) {
            this.e = iyaVar;
        } else {
            this.e = new iya(this);
        }
    }

    @Override // defpackage.l4
    public final void c(View view, AccessibilityEvent accessibilityEvent) {
        super.c(view, accessibilityEvent);
        if (!(view instanceof RecyclerView) || this.d.M()) {
            return;
        }
        RecyclerView recyclerView = (RecyclerView) view;
        if (recyclerView.getLayoutManager() != null) {
            recyclerView.getLayoutManager().V(accessibilityEvent);
        }
    }

    @Override // defpackage.l4
    public final void d(View view, y4 y4Var) {
        this.a.onInitializeAccessibilityNodeInfo(view, y4Var.a);
        RecyclerView recyclerView = this.d;
        if (recyclerView.M() || recyclerView.getLayoutManager() == null) {
            return;
        }
        sxa layoutManager = recyclerView.getLayoutManager();
        RecyclerView recyclerView2 = layoutManager.b;
        layoutManager.W(recyclerView2.c, recyclerView2.u0, y4Var);
    }

    @Override // defpackage.l4
    public final boolean g(View view, int i, Bundle bundle) {
        if (super.g(view, i, bundle)) {
            return true;
        }
        RecyclerView recyclerView = this.d;
        if (recyclerView.M() || recyclerView.getLayoutManager() == null) {
            return false;
        }
        return recyclerView.getLayoutManager().j0(i, bundle);
    }
}
