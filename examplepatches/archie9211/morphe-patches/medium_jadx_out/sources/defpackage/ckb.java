package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ckb extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dkb b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ckb(dkb dkbVar, int i) {
        super(1);
        this.a = i;
        this.b = dkbVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        dkb dkbVar = this.b;
        switch (i) {
            case 0:
                return Double.valueOf(dkbVar.n.a(iq7.t(((Number) obj).doubleValue(), dkbVar.e, dkbVar.f)));
            default:
                return Double.valueOf(iq7.t(dkbVar.k.a(((Number) obj).doubleValue()), dkbVar.e, dkbVar.f));
        }
    }
}
