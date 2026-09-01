package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class urd implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dsd b;

    public /* synthetic */ urd(dsd dsdVar, int i) {
        this.a = i;
        this.b = dsdVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        dsd dsdVar = this.b;
        switch (i) {
            case 0:
                return Boolean.valueOf((g76.L(dsdVar.d.getValue(), dsdVar.a.o0()) && dsdVar.g.g() == Long.MIN_VALUE && !((Boolean) dsdVar.h.getValue()).booleanValue()) ? false : true);
            default:
                return Long.valueOf(dsdVar.b());
        }
    }
}
