package defpackage;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.recyclerview.widget.RecyclerView;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iya extends l4 {
    public final jya d;
    public final WeakHashMap e = new WeakHashMap();

    public iya(jya jyaVar) {
        this.d = jyaVar;
    }

    @Override // defpackage.l4
    public final boolean a(View view, AccessibilityEvent accessibilityEvent) {
        l4 l4Var = (l4) this.e.get(view);
        return l4Var != null ? l4Var.a(view, accessibilityEvent) : this.a.dispatchPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    @Override // defpackage.l4
    public final zg7 b(View view) {
        l4 l4Var = (l4) this.e.get(view);
        return l4Var != null ? l4Var.b(view) : super.b(view);
    }

    @Override // defpackage.l4
    public final void c(View view, AccessibilityEvent accessibilityEvent) {
        l4 l4Var = (l4) this.e.get(view);
        if (l4Var != null) {
            l4Var.c(view, accessibilityEvent);
        } else {
            super.c(view, accessibilityEvent);
        }
    }

    @Override // defpackage.l4
    public final void d(View view, y4 y4Var) {
        AccessibilityNodeInfo accessibilityNodeInfo = y4Var.a;
        jya jyaVar = this.d;
        RecyclerView recyclerView = jyaVar.d;
        RecyclerView recyclerView2 = jyaVar.d;
        boolean zM = recyclerView.M();
        View.AccessibilityDelegate accessibilityDelegate = this.a;
        if (zM || recyclerView2.getLayoutManager() == null) {
            accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfo);
            return;
        }
        recyclerView2.getLayoutManager().Y(view, y4Var);
        l4 l4Var = (l4) this.e.get(view);
        if (l4Var != null) {
            l4Var.d(view, y4Var);
        } else {
            accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfo);
        }
    }

    @Override // defpackage.l4
    public final void e(View view, AccessibilityEvent accessibilityEvent) {
        l4 l4Var = (l4) this.e.get(view);
        if (l4Var != null) {
            l4Var.e(view, accessibilityEvent);
        } else {
            super.e(view, accessibilityEvent);
        }
    }

    @Override // defpackage.l4
    public final boolean f(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        l4 l4Var = (l4) this.e.get(viewGroup);
        return l4Var != null ? l4Var.f(viewGroup, view, accessibilityEvent) : this.a.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
    }

    @Override // defpackage.l4
    public final boolean g(View view, int i, Bundle bundle) {
        jya jyaVar = this.d;
        RecyclerView recyclerView = jyaVar.d;
        RecyclerView recyclerView2 = jyaVar.d;
        if (recyclerView.M() || recyclerView2.getLayoutManager() == null) {
            return super.g(view, i, bundle);
        }
        l4 l4Var = (l4) this.e.get(view);
        if (l4Var != null) {
            if (l4Var.g(view, i, bundle)) {
                return true;
            }
        } else if (super.g(view, i, bundle)) {
            return true;
        }
        yxa yxaVar = recyclerView2.getLayoutManager().b.c;
        return false;
    }

    @Override // defpackage.l4
    public final void h(View view, int i) {
        l4 l4Var = (l4) this.e.get(view);
        if (l4Var != null) {
            l4Var.h(view, i);
        } else {
            super.h(view, i);
        }
    }

    @Override // defpackage.l4
    public final void i(View view, AccessibilityEvent accessibilityEvent) {
        l4 l4Var = (l4) this.e.get(view);
        if (l4Var != null) {
            l4Var.i(view, accessibilityEvent);
        } else {
            super.i(view, accessibilityEvent);
        }
    }
}
