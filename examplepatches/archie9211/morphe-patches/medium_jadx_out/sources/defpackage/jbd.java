package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jbd implements ye1 {
    public final /* synthetic */ odd a;
    public final /* synthetic */ u8d b;
    public final /* synthetic */ Context c;

    public jbd(odd oddVar, u8d u8dVar, Context context) {
        this.a = oddVar;
        this.b = u8dVar;
        this.c = context;
    }

    @Override // defpackage.ye1
    public final void D(int i, String str) {
        str.getClass();
    }

    @Override // defpackage.ye1
    public final void c(String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        n92 n92Var = null;
        odd oddVar = this.a;
        if (z) {
            vx0.c0(f76.F(oddVar), null, null, new zcd(oddVar, str, str2, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(oddVar), null, null, new zcd(oddVar, str, str2, n92Var, 3), 3);
        }
    }

    @Override // defpackage.ye1
    public final void f(String str, String str2) {
        str.getClass();
        this.b.b(str, str2);
    }

    @Override // defpackage.ye1
    public final void g(String str, String str2) {
        str.getClass();
        odd oddVar = this.a;
        vx0.c0(f76.F(oddVar), null, null, new zcd(oddVar, str, str2, null, 2), 3);
    }

    @Override // defpackage.ye1
    public final void j(rg1 rg1Var, boolean z) {
        rg1Var.getClass();
        odd oddVar = this.a;
        vx0.c0(f76.F(oddVar), null, null, new lj1(z, oddVar, rg1Var, (n92) null, 14), 3);
    }

    @Override // defpackage.ye1
    public final void m(eg1 eg1Var, String str) {
        eg1Var.getClass();
        String str2 = eg1Var.b;
        str2.getClass();
        odd oddVar = this.a;
        oddVar.o.h(str2, oddVar.c, str, oddVar.P);
        j7c.a(this.c, eg1Var);
    }

    @Override // defpackage.ye1
    public final void n(rg1 rg1Var) {
        rg1Var.getClass();
        odd oddVar = this.a;
        vx0.c0(f76.F(oddVar), null, null, new edd(oddVar, rg1Var, null, 1), 3);
    }

    @Override // defpackage.ye1
    public final void o(String str, String str2) {
        str.getClass();
        odd oddVar = this.a;
        if (oddVar.C.add(str)) {
            ev6.L(oddVar.o, str, oddVar.c, str2, oddVar.P);
        }
    }

    @Override // defpackage.ye1
    public final void s(String str, String str2) {
        str.getClass();
        odd oddVar = this.a;
        vx0.c0(f76.F(oddVar), null, null, new zcd(oddVar, str, str2, null, 1), 3);
    }
}
