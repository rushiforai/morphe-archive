package androidx.recyclerview.widget;

import android.view.View;

/* loaded from: classes.dex */
public final class g3 {

    /* renamed from: a, reason: collision with root package name */
    public final f3 f14973a;

    /* renamed from: b, reason: collision with root package name */
    public final e3 f14974b;

    public g3(f3 f3Var) {
        this.f14973a = f3Var;
        e3 e3Var = new e3();
        e3Var.f14937a = 0;
        this.f14974b = e3Var;
    }

    public final View a(int i5, int i11, int i12, int i13) {
        f3 f3Var = this.f14973a;
        int iB = f3Var.b();
        int iC = f3Var.c();
        int i14 = i11 > i5 ? 1 : -1;
        View view = null;
        while (i5 != i11) {
            View viewD = f3Var.d(i5);
            int iA = f3Var.a(viewD);
            int iE = f3Var.e(viewD);
            e3 e3Var = this.f14974b;
            e3Var.f14938b = iB;
            e3Var.f14939c = iC;
            e3Var.f14940d = iA;
            e3Var.f14941e = iE;
            if (i12 != 0) {
                e3Var.f14937a = i12;
                if (e3Var.a()) {
                    return viewD;
                }
            }
            if (i13 != 0) {
                e3Var.f14937a = i13;
                if (e3Var.a()) {
                    view = viewD;
                }
            }
            i5 += i14;
        }
        return view;
    }

    public final boolean b(View view) {
        f3 f3Var = this.f14973a;
        int iB = f3Var.b();
        int iC = f3Var.c();
        int iA = f3Var.a(view);
        int iE = f3Var.e(view);
        e3 e3Var = this.f14974b;
        e3Var.f14938b = iB;
        e3Var.f14939c = iC;
        e3Var.f14940d = iA;
        e3Var.f14941e = iE;
        e3Var.f14937a = 24579;
        return e3Var.a();
    }
}
