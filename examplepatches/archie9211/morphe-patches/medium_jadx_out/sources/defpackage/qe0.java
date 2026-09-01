package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class qe0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ te0 b;
    public final /* synthetic */ cv9 c;
    public final /* synthetic */ int d;

    public /* synthetic */ qe0(te0 te0Var, cv9 cv9Var, int i, int i2) {
        this.a = i2;
        this.b = te0Var;
        this.c = cv9Var;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        cv9 cv9Var = this.c;
        te0 te0Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                yi2.G(te0Var, cv9Var, x12Var, tr7.y(i2 | 1));
                break;
            case 1:
                yi2.l(te0Var, cv9Var, x12Var, tr7.y(i2 | 1));
                break;
            case 2:
                yi2.x(te0Var, cv9Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                yi2.i(te0Var, cv9Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
