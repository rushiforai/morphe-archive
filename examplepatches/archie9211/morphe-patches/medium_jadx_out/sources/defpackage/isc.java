package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class isc implements qqc {
    public final /* synthetic */ zsc a;
    public final /* synthetic */ hsc b;

    public isc(zsc zscVar, hsc hscVar) {
        this.a = zscVar;
        this.b = hscVar;
    }

    @Override // defpackage.qqc
    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        zsc zscVar = this.a;
        qy2 qy2Var = zscVar.f;
        String str2 = zscVar.i;
        qy2Var.a(str, str2, gp7.u(sourceParameter), str2);
        this.b.a(str, sourceParameter);
    }

    @Override // defpackage.qqc
    public final void b(String str, SourceParameter sourceParameter) {
        str.getClass();
    }
}
