package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class yr7 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ float b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    public /* synthetic */ yr7(float f, x45 x45Var, r28 r28Var, boolean z, hp1 hp1Var, m45 m45Var, qfc qfcVar, int i) {
        this.b = f;
        this.e = x45Var;
        this.d = r28Var;
        this.c = z;
        this.f = hp1Var;
        this.g = m45Var;
        this.h = qfcVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.h;
        Object obj4 = this.g;
        Object obj5 = this.f;
        Object obj6 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(385);
                zr7.a(this.b, (x45) obj6, this.d, this.c, (hp1) obj5, (m45) obj4, (qfc) obj3, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                n01.g((tce) obj6, (zbe) obj5, (mya) obj4, (kv6) obj3, this.b, this.c, this.d, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ yr7(tce tceVar, zbe zbeVar, mya myaVar, kv6 kv6Var, float f, boolean z, r28 r28Var, int i) {
        this.e = tceVar;
        this.f = zbeVar;
        this.g = myaVar;
        this.h = kv6Var;
        this.b = f;
        this.c = z;
        this.d = r28Var;
    }
}
