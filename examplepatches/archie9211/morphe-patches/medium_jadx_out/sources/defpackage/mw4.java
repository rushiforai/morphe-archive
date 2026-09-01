package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class mw4 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ kv6 b;
    public final /* synthetic */ r28 c;

    public /* synthetic */ mw4(kv6 kv6Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = kv6Var;
        this.c = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        r28 r28Var = this.c;
        kv6 kv6Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                vx0.k(kv6Var, r28Var, x12Var, tr7.y(1));
                break;
            default:
                f76.m(kv6Var, r28Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
