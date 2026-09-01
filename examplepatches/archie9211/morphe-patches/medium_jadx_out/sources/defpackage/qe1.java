package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class qe1 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ long b;
    public final /* synthetic */ long c;
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;

    public /* synthetic */ qe1(long j, oe1 oe1Var, int i, long j2, int i2) {
        this.b = j;
        this.e = oe1Var;
        this.d = i;
        this.c = j2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(385);
                s42.v(this.b, (oe1) obj3, this.d, this.c, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(this.d | 1);
                a4a.c((r28) obj3, this.b, this.c, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ qe1(r28 r28Var, long j, long j2, int i) {
        this.e = r28Var;
        this.b = j;
        this.c = j2;
        this.d = i;
    }
}
