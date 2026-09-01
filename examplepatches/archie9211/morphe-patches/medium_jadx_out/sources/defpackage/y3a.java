package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class y3a implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ long c;
    public final /* synthetic */ long d;
    public final /* synthetic */ float e;
    public final /* synthetic */ int f;
    public final /* synthetic */ int g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ j55 i;

    public /* synthetic */ y3a(m45 m45Var, r28 r28Var, long j, long j2, int i, float f, x45 x45Var, int i2) {
        this.h = m45Var;
        this.b = r28Var;
        this.c = j;
        this.d = j2;
        this.f = i;
        this.e = f;
        this.i = x45Var;
        this.g = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        j55 j55Var = this.i;
        Object obj3 = this.h;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(this.g | 1);
                z3a.c((m45) obj3, this.b, this.c, this.d, this.f, this.e, (x45) j55Var, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(this.f | 1);
                br7.i(this.b, (m3c) obj3, this.c, this.d, this.e, (mz1) j55Var, (x12) obj, iY2, this.g);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ y3a(r28 r28Var, m3c m3cVar, long j, long j2, float f, mz1 mz1Var, int i, int i2) {
        this.b = r28Var;
        this.h = m3cVar;
        this.c = j;
        this.d = j2;
        this.e = f;
        this.i = mz1Var;
        this.f = i;
        this.g = i2;
    }
}
