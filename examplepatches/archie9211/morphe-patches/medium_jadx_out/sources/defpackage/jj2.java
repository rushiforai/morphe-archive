package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jj2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dsd b;

    public /* synthetic */ jj2(dsd dsdVar, int i) {
        this.a = i;
        this.b = dsdVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        dsd dsdVar = this.b;
        switch (i) {
            case 0:
                return dsdVar.d.getValue();
            default:
                return dsdVar.f();
        }
    }
}
