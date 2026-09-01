package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class cs5 implements ikc {
    public final qt5 a;
    public final x05 b;
    public boolean c;
    public final /* synthetic */ hs5 d;

    public cs5(hs5 hs5Var, qt5 qt5Var) {
        qt5Var.getClass();
        this.d = hs5Var;
        this.a = qt5Var;
        this.b = new x05(((yua) hs5Var.c.c).a.b());
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.b;
    }

    public final void f(yi5 yi5Var) {
        up8 up8Var;
        ba2 ba2Var;
        yi5Var.getClass();
        hs5 hs5Var = this.d;
        int i = hs5Var.d;
        if (i == 6) {
            return;
        }
        if (i != 5) {
            throw new IllegalStateException("state: " + hs5Var.d);
        }
        x05 x05Var = this.b;
        fmd fmdVar = x05Var.e;
        x05Var.e = fmd.d;
        fmdVar.a();
        fmdVar.b();
        hs5Var.d = 6;
        if (yi5Var.size() <= 0 || (up8Var = hs5Var.a) == null || (ba2Var = up8Var.j) == null) {
            return;
        }
        bt5.b(ba2Var, this.a, yi5Var);
    }

    @Override // defpackage.ikc
    public long q0(kz0 kz0Var, long j) throws IOException {
        hs5 hs5Var = this.d;
        kz0Var.getClass();
        try {
            return ((yua) hs5Var.c.c).q0(kz0Var, j);
        } catch (IOException e) {
            hs5Var.b.e();
            this.f(hs5.f);
            throw e;
        }
    }
}
