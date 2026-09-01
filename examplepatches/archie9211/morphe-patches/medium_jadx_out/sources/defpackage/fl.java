package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fl implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ul b;

    public /* synthetic */ fl(ul ulVar, int i) {
        this.a = i;
        this.b = ulVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ul ulVar = this.b;
        switch (i) {
            case 0:
                Object value = ulVar.h.getValue();
                if (value != null) {
                    return value;
                }
                float fG = ulVar.f.g();
                k49 k49Var = ulVar.c;
                if (Float.isNaN(fG)) {
                    return k49Var.getValue();
                }
                float fC = ulVar.b().c(k49Var.getValue());
                if (Float.isNaN(fC) || fG == fC) {
                    return k49Var.getValue();
                }
                Object objA = ulVar.b().a(fG);
                return objA == null ? k49Var.getValue() : objA;
            case 1:
                return ulVar.b();
            case 2:
                return new f09(ulVar.b(), ulVar.e.getValue());
            default:
                return (j45) ulVar.c.getValue();
        }
    }
}
