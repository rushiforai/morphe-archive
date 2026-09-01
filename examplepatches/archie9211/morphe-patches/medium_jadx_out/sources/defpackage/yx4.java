package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yx4 implements cs1 {
    public final /* synthetic */ uza a;
    public final /* synthetic */ sza b;

    public yx4(sza szaVar, uza uzaVar) {
        this.a = uzaVar;
        this.b = szaVar;
    }

    @Override // defpackage.cs1
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "FollowingScreen doesn't support muting publications");
    }

    @Override // defpackage.cs1
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        sza szaVar = this.b;
        if (z) {
            vx0.c0(f76.F(szaVar), null, null, new oza(szaVar, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(szaVar), null, null, new oza(szaVar, str, sourceParameter, n92Var, 2), 3);
        }
    }

    @Override // defpackage.cs1
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.a.a(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.cs1
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        sza szaVar = this.b;
        if (szaVar.t.add(str)) {
            szaVar.d.g(str, szaVar.b, gp7.u(sourceParameter), szaVar.n);
        }
    }
}
