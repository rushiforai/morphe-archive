package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cy4 implements obe {
    public final /* synthetic */ uza a;
    public final /* synthetic */ sza b;

    public cy4(sza szaVar, uza uzaVar) {
        this.a = uzaVar;
        this.b = szaVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "FollowingScreen doesn't support muting users");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        sza szaVar = this.b;
        vx0.c0(f76.F(szaVar), null, null, new qza(szaVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        sza szaVar = this.b;
        szaVar.k.e(sourceParameter, str, szaVar.b, szaVar.n);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        sza szaVar = this.b;
        vx0.c0(f76.F(szaVar), null, null, new pza(szaVar, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        sza szaVar = this.b;
        vx0.c0(f76.F(szaVar), null, null, new qza(szaVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        sza szaVar = this.b;
        vx0.c0(f76.F(szaVar), null, null, new pza(szaVar, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        sza szaVar = this.b;
        vx0.c0(f76.F(szaVar), null, null, new oza(szaVar, str, sourceParameter, null, 4), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.a.b(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        sza szaVar = this.b;
        if (szaVar.s.add(str)) {
            szaVar.f.x0(str, szaVar.b, gp7.u(sourceParameter), szaVar.n);
        }
    }
}
