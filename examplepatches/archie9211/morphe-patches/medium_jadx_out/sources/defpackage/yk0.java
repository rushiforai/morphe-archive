package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class yk0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ hl0 b;

    public /* synthetic */ yk0(hl0 hl0Var, int i, int i2) {
        this.a = i2;
        this.b = hl0Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        hl0 hl0Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                d46.c(hl0Var, x12Var, tr7.y(1));
                break;
            default:
                f76.e(hl0Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
