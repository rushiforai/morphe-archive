package androidx.fragment.app;

import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class f1 implements e1 {

    /* renamed from: a, reason: collision with root package name */
    public final int f14551a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h1 f14552b;

    public f1(h1 h1Var, int i5) {
        this.f14552b = h1Var;
        this.f14551a = i5;
    }

    @Override // androidx.fragment.app.e1
    public final boolean a(ArrayList arrayList, ArrayList arrayList2) {
        h1 h1Var = this.f14552b;
        h0 h0Var = h1Var.f14592z;
        int i5 = this.f14551a;
        if (h0Var == null || i5 >= 0 || !h0Var.getChildFragmentManager().S(-1, 0)) {
            return h1Var.T(i5, 1, arrayList, arrayList2);
        }
        return false;
    }
}
