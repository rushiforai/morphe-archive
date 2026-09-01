package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rfe implements nfe {
    public final /* synthetic */ oge a;
    public final /* synthetic */ nfe b;

    public rfe(oge ogeVar, nfe nfeVar) {
        this.a = ogeVar;
        this.b = nfeVar;
    }

    @Override // defpackage.nfe
    public final void C(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.b.C(sourceParameter);
    }

    @Override // defpackage.nfe, defpackage.qbe, defpackage.h8e, defpackage.dle
    public final void b(boolean z) {
        this.b.b(z);
    }

    @Override // defpackage.nfe
    public final void g(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.b.g(sourceParameter);
    }

    @Override // defpackage.nfe
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.b.o(str, sourceParameter);
    }
}
