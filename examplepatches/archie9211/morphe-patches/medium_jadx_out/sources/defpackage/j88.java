package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j88 implements obe {
    public final /* synthetic */ uza a;
    public final /* synthetic */ x88 b;

    public j88(x88 x88Var, uza uzaVar) {
        this.a = uzaVar;
        this.b = x88Var;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        x88 x88Var = this.b;
        if (z) {
            vx0.c0(f76.F(x88Var), null, null, new w88(x88Var, str, sourceParameter, n92Var, 1), 3);
        } else {
            vx0.c0(f76.F(x88Var), null, null, new w88(x88Var, str, sourceParameter, n92Var, 2), 3);
        }
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        sourceParameter.getClass();
        throw new UnsupportedOperationException("MutedScreen doesn't support subscribing to newsletter");
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        throw new UnsupportedOperationException("MutedScreen doesn't support following users");
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        throw ho2.J(sourceParameter, str2, "MutedScreen doesn't support following users");
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        throw new UnsupportedOperationException("MutedScreen doesn't support subscribing to newsletter");
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        throw ho2.J(sourceParameter, str2, "MutedScreen doesn't support following users");
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        throw ho2.J(sourceParameter, str, "MutedScreen doesn't support following users");
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.a.b(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        x88 x88Var = this.b;
        if (x88Var.o.add(str)) {
            x88Var.e.x0(str, x88Var.b, gp7.u(sourceParameter), x88Var.k);
        }
    }
}
