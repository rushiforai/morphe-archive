package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lrd implements nn0 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ lrd(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.nn0
    public final void a() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((mrd) obj).k = true;
                break;
            case 1:
                ((mrd) obj).k = true;
                break;
            case 2:
                ((mrd) obj).k = true;
                break;
            default:
                tn0 tn0Var = (tn0) obj;
                boolean z = tn0Var.r.i() == 1.0f;
                if (z != tn0Var.x) {
                    tn0Var.x = z;
                    tn0Var.o.invalidateSelf();
                }
                break;
        }
    }
}
