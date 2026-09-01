package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class hx8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ kx8 b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ int d;

    public /* synthetic */ hx8(kx8 kx8Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = kx8Var;
        this.c = r28Var;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        r28 r28Var = this.c;
        kx8 kx8Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                ur7.g(kx8Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                ur7.s(kx8Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
