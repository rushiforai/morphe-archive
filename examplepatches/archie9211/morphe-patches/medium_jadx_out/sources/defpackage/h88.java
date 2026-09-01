package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h88 implements cs1 {
    public final /* synthetic */ uza a;
    public final /* synthetic */ x88 b;

    public h88(x88 x88Var, uza uzaVar) {
        this.a = uzaVar;
        this.b = x88Var;
    }

    @Override // defpackage.cs1
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        x88 x88Var = this.b;
        if (z) {
            vx0.c0(f76.F(x88Var), null, null, new w88(x88Var, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(x88Var), null, null, new w88(x88Var, str, sourceParameter, n92Var, 3), 3);
        }
    }

    @Override // defpackage.cs1
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "MutedScreen doesn't support following publications");
    }

    @Override // defpackage.cs1
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.a.a(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.cs1
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        x88 x88Var = this.b;
        if (x88Var.p.add(str)) {
            x88Var.d.g(str, x88Var.b, gp7.u(sourceParameter), x88Var.k);
        }
    }
}
