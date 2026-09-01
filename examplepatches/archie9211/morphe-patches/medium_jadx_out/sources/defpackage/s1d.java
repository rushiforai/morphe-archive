package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class s1d implements obe {
    public final /* synthetic */ pkf a;
    public final /* synthetic */ j2d b;

    public s1d(j2d j2dVar, pkf pkfVar) {
        this.a = pkfVar;
        this.b = j2dVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "SuggestionsScreen doesn't support muting users");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        j2d j2dVar = this.b;
        vx0.c0(f76.F(j2dVar), null, null, new i2d(j2dVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        j2d j2dVar = this.b;
        j2dVar.j.e(sourceParameter, str, j2dVar.b, j2dVar.o);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        j2d j2dVar = this.b;
        vx0.c0(f76.F(j2dVar), null, null, new h2d(j2dVar, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        j2d j2dVar = this.b;
        vx0.c0(f76.F(j2dVar), null, null, new i2d(j2dVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        j2d j2dVar = this.b;
        vx0.c0(f76.F(j2dVar), null, null, new h2d(j2dVar, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        j2d j2dVar = this.b;
        vx0.c0(f76.F(j2dVar), null, null, new g2d(j2dVar, str, sourceParameter, null, 4), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        ((uza) this.a.a).b(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        j2d j2dVar = this.b;
        if (j2dVar.u.add(str)) {
            j2dVar.m.x0(str, j2dVar.b, gp7.u(sourceParameter), j2dVar.o);
        }
    }
}
