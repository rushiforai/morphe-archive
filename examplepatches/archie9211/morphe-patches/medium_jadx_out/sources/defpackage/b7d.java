package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b7d implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ long f;
    public final /* synthetic */ long g;
    public final /* synthetic */ mz1 h;

    public /* synthetic */ b7d(boolean z, m45 m45Var, r28 r28Var, boolean z2, long j, long j2, mz1 mz1Var, int i, int i2) {
        this.a = i2;
        this.b = z;
        this.c = m45Var;
        this.d = r28Var;
        this.e = z2;
        this.f = j;
        this.g = j2;
        this.h = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(12582913);
                e7d.a(this.b, this.c, this.d, this.e, this.f, this.g, this.h, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(12582913);
                f7d.a(this.b, this.c, this.d, this.e, this.f, this.g, this.h, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }
}
