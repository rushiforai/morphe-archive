package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xa0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ za0 b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ int d;

    public /* synthetic */ xa0(za0 za0Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = za0Var;
        this.c = r28Var;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        r28 r28Var = this.c;
        za0 za0Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                t40.i(za0Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                t40.s(za0Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
