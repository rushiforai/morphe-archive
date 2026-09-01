package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dp0 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ vjd b;

    public /* synthetic */ dp0(vjd vjdVar, int i) {
        this.a = i;
        this.b = vjdVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        pjd pjdVar;
        int i = this.a;
        int i2 = 2;
        vjd vjdVar = this.b;
        switch (i) {
            case 0:
                return Boolean.valueOf(vjdVar != null ? ((Boolean) new dp0(vjdVar, i2).invoke()).booleanValue() : false);
            case 1:
                return Boolean.valueOf(vjdVar != null ? ((Boolean) new dp0(vjdVar, i2).invoke()).booleanValue() : false);
            default:
                mx mxVar = vjdVar.b;
                qjd qjdVar = (qjd) vjdVar.a.getValue();
                return Boolean.valueOf(g76.L(mxVar, (qjdVar == null || (pjdVar = qjdVar.a) == null) ? null : pjdVar.a));
        }
    }
}
