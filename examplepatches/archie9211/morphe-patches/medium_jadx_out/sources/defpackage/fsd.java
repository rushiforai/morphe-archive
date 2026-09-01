package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fsd implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dsd b;

    public /* synthetic */ fsd(dsd dsdVar, int i) {
        this.a = i;
        this.b = dsdVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        dsd dsdVar = this.b;
        switch (i) {
            case 0:
                return new gsd(dsdVar, 1);
            default:
                return new gsd(dsdVar, 0);
        }
    }
}
