package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cc implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ gc b;
    public final /* synthetic */ int c;

    public /* synthetic */ cc(gc gcVar, int i, int i2) {
        this.a = i2;
        this.b = gcVar;
        this.c = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.c;
        gc gcVar = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                k50.c(gcVar, x12Var, tr7.y(i2 | 1));
                break;
            case 1:
                k50.b(gcVar, x12Var, tr7.y(i2 | 1));
                break;
            case 2:
                k50.g(gcVar, x12Var, tr7.y(i2 | 1));
                break;
            case 3:
                k50.e(gcVar, x12Var, tr7.y(i2 | 1));
                break;
            case 4:
                k50.k(gcVar, x12Var, tr7.y(i2 | 1));
                break;
            case 5:
                k50.m(gcVar, x12Var, tr7.y(i2 | 1));
                break;
            case 6:
                k50.j(gcVar, x12Var, tr7.y(i2 | 1));
                break;
            default:
                k50.l(gcVar, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
