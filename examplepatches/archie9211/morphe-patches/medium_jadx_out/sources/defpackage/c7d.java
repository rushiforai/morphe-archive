package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class c7d implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;
    public final /* synthetic */ long c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ mz1 e;
    public final /* synthetic */ int f;

    public /* synthetic */ c7d(long j, long j2, boolean z, mz1 mz1Var, int i, int i2) {
        this.a = i2;
        this.b = j;
        this.c = j2;
        this.d = z;
        this.e = mz1Var;
        this.f = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                e7d.b(this.b, this.c, this.d, this.e, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                f7d.b(this.b, this.c, this.d, this.e, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }
}
