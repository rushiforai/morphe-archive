package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zjb implements aj3 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dkb b;

    public /* synthetic */ zjb(dkb dkbVar, int i) {
        this.a = i;
        this.b = dkbVar;
    }

    @Override // defpackage.aj3
    public final double a(double d) {
        int i = this.a;
        dkb dkbVar = this.b;
        switch (i) {
            case 0:
                return iq7.t(dkbVar.k.a(d), dkbVar.e, dkbVar.f);
            default:
                return dkbVar.n.a(iq7.t(d, dkbVar.e, dkbVar.f));
        }
    }
}
