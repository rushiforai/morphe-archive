package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jm1 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;

    public /* synthetic */ jm1(int i, boolean z, r28 r28Var, int i2) {
        this.c = i;
        this.b = z;
        this.d = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.c;
        Object obj3 = this.d;
        boolean z = this.b;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                sgg.i(i2, z, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                mq7.g(z, (b55) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ jm1(boolean z, b55 b55Var, int i) {
        this.b = z;
        this.d = b55Var;
        this.c = i;
    }
}
