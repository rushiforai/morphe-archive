package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ye0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ff0 b;
    public final /* synthetic */ iv9 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;

    public /* synthetic */ ye0(ff0 ff0Var, iv9 iv9Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = ff0Var;
        this.c = iv9Var;
        this.d = r28Var;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        r28 r28Var = this.d;
        iv9 iv9Var = this.c;
        ff0 ff0Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                ht2.B(ff0Var, iv9Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 1:
                ht2.K(ff0Var, iv9Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 2:
                ht2.p(ff0Var, iv9Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 3:
                ht2.m(ff0Var, iv9Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                ht2.o(ff0Var, iv9Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
