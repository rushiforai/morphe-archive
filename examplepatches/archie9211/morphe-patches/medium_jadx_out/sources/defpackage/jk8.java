package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jk8 implements obe {
    public final /* synthetic */ tk8 a;
    public final /* synthetic */ ek8 b;

    public jk8(ek8 ek8Var, tk8 tk8Var) {
        this.a = tk8Var;
        this.b = ek8Var;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "Mute is not supported in notifications");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        tk8 tk8Var = this.a;
        vx0.c0(f76.F(tk8Var), null, null, new yu((Object) tk8Var, (Object) str3, str, (Object) str2, (Object) sourceParameter, (n92) null, 15), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        tk8 tk8Var = this.a;
        tk8Var.g.e(sourceParameter, str, tk8Var.c, tk8Var.h);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        tk8 tk8Var = this.a;
        vx0.c0(f76.F(tk8Var), null, null, new b9(tk8Var, str, str2, sourceParameter, (n92) null, 28), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        tk8 tk8Var = this.a;
        vx0.c0(f76.F(tk8Var), null, null, new yu((Object) tk8Var, (Object) str3, str, (Object) str2, (Object) sourceParameter, (n92) null, 14), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        tk8 tk8Var = this.a;
        vx0.c0(f76.F(tk8Var), null, null, new b9(tk8Var, str, str2, sourceParameter, (n92) null, 27), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        tk8 tk8Var = this.a;
        vx0.c0(f76.F(tk8Var), null, null, new zo5(tk8Var, str, sourceParameter, null, 9), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.b.k(str, sourceParameter);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        tk8 tk8Var = this.a;
        if (tk8Var.j.add(str)) {
            tk8Var.e.x0(str, tk8Var.c, gp7.u(sourceParameter), tk8Var.h);
        }
    }
}
