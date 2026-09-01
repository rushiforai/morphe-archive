package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s91 implements jt4 {
    public final /* synthetic */ id1 a;

    public s91(id1 id1Var) {
        this.a = id1Var;
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new yu(id1Var, str3, sourceParameter, str, str2, (n92) null, 2), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        id1 id1Var = this.a;
        if (id1Var.I) {
            id1Var.h.i(str, id1Var.c, gp7.u(sourceParameter), id1Var.g());
            id1Var.I = false;
        }
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new nc1(id1Var, str2, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new b9(id1Var, str3, sourceParameter, str, str2, (n92) null, 10), 3);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new nc1(id1Var, str2, str, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new mc1(id1Var, str, sourceParameter, null, 3), 3);
    }
}
