package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class wp7 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ m3c e;
    public final /* synthetic */ long f;
    public final /* synthetic */ long g;
    public final /* synthetic */ float h;
    public final /* synthetic */ mz1 i;
    public final /* synthetic */ int j;
    public final /* synthetic */ int k;
    public final /* synthetic */ Object l;
    public final /* synthetic */ Object m;

    public /* synthetic */ wp7(m45 m45Var, r28 r28Var, boolean z, m3c m3cVar, long j, long j2, cu0 cu0Var, float f, m68 m68Var, mz1 mz1Var, int i, int i2) {
        this.b = m45Var;
        this.c = r28Var;
        this.d = z;
        this.e = m3cVar;
        this.f = j;
        this.g = j2;
        this.l = cu0Var;
        this.h = f;
        this.m = m68Var;
        this.i = mz1Var;
        this.j = i;
        this.k = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.j;
        Object obj3 = this.m;
        Object obj4 = this.l;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                xp7.b(this.d, this.b, this.c, this.f, (yrb) obj4, (hd9) obj3, this.e, this.g, this.h, this.i, (x12) obj, iY, this.k);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                br7.j(this.b, this.c, this.d, this.e, this.f, this.g, (cu0) obj4, this.h, (m68) obj3, this.i, (x12) obj, iY2, this.k);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ wp7(boolean z, m45 m45Var, r28 r28Var, long j, yrb yrbVar, hd9 hd9Var, m3c m3cVar, long j2, float f, mz1 mz1Var, int i, int i2) {
        this.d = z;
        this.b = m45Var;
        this.c = r28Var;
        this.f = j;
        this.l = yrbVar;
        this.m = hd9Var;
        this.e = m3cVar;
        this.g = j2;
        this.h = f;
        this.i = mz1Var;
        this.j = i;
        this.k = i2;
    }
}
