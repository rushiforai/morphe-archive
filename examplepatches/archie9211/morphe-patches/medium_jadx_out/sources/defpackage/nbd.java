package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nbd implements obe {
    public final /* synthetic */ u8d a;
    public final /* synthetic */ odd b;

    public nbd(u8d u8dVar, odd oddVar) {
        this.a = u8dVar;
        this.b = oddVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        throw new ei8("Mute action is not handled in Tag screen");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        odd oddVar = this.b;
        vx0.c0(f76.F(oddVar), null, null, new hdd(oddVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        odd oddVar = this.b;
        oddVar.v.e(sourceParameter, str, oddVar.c, oddVar.P);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        odd oddVar = this.b;
        vx0.c0(f76.F(oddVar), null, null, new bdd(oddVar, str, str2, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        odd oddVar = this.b;
        vx0.c0(f76.F(oddVar), null, null, new hdd(oddVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        odd oddVar = this.b;
        vx0.c0(f76.F(oddVar), null, null, new bdd(oddVar, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        odd oddVar = this.b;
        vx0.c0(f76.F(oddVar), null, null, new add(oddVar, str, sourceParameter, null, 6), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.a.e(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        odd oddVar = this.b;
        if (oddVar.E.add(str)) {
            oddVar.r.x0(str, oddVar.c, gp7.u(sourceParameter), oddVar.P);
        }
    }
}
