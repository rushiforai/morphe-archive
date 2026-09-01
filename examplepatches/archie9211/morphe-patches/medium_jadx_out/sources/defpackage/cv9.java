package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cv9 implements ye1, vn8 {
    public final /* synthetic */ sw9 a;

    public /* synthetic */ cv9(sw9 sw9Var) {
        this.a = sw9Var;
    }

    @Override // defpackage.ye1
    public void D(int i, String str) {
        str.getClass();
    }

    @Override // defpackage.vn8
    public void a(UpsellInfo upsellInfo, SourceParameter sourceParameter) {
        upsellInfo.getClass();
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new kv9(sw9Var, upsellInfo, strU, null, 0), 3);
    }

    @Override // defpackage.vn8
    public void b(UpsellInfo upsellInfo, SourceParameter sourceParameter) {
        upsellInfo.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = this.a;
        if (sw9Var.w0) {
            return;
        }
        sw9Var.w0 = true;
        sw9Var.p.f(upsellInfo, sw9Var.D0, gp7.u(sourceParameter), sw9Var.d);
    }

    @Override // defpackage.ye1
    public void c(String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        sw9 sw9Var = this.a;
        if (z) {
            sw9Var.j(str, str2);
        } else {
            sw9Var.E(str, str2);
        }
    }

    public void d(String str, SourceParameter sourceParameter) {
        sw9 sw9Var = this.a;
        if (sw9Var.s0) {
            return;
        }
        sw9Var.s0 = true;
        sw9Var.l.i(str, sw9Var.d, gp7.u(sourceParameter), sw9Var.D0);
    }

    @Override // defpackage.ye1
    public void f(String str, String str2) {
        str.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 0), 3);
    }

    @Override // defpackage.ye1
    public void g(String str, String str2) {
        str.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 2), 3);
    }

    @Override // defpackage.ye1
    public void j(rg1 rg1Var, boolean z) {
        rg1Var.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new lj1(z, sw9Var, rg1Var, (n92) null, 6), 3);
    }

    @Override // defpackage.ye1
    public void m(eg1 eg1Var, String str) {
        eg1Var.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new mo5(sw9Var, eg1Var, str, null, 27), 3);
    }

    @Override // defpackage.ye1
    public void n(rg1 rg1Var) {
        rg1Var.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new bv9(sw9Var, rg1Var, null, 0), 3);
    }

    @Override // defpackage.ye1
    public void o(String str, String str2) {
        str.getClass();
        sw9 sw9Var = this.a;
        if (sw9Var.K0.add(str)) {
            ev6.L(sw9Var.k, str, sw9Var.d, str2, sw9Var.D0);
        }
    }

    @Override // defpackage.ye1
    public void s(String str, String str2) {
        str.getClass();
        sw9 sw9Var = this.a;
        vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str, str2, null, 1), 3);
    }
}
