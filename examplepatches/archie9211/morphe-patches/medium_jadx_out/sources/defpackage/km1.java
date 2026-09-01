package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class km1 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ long c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ int f;
    public final /* synthetic */ int g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    public /* synthetic */ km1(int i, rm1 rm1Var, long j, xm1 xm1Var, m45 m45Var, r28 r28Var, boolean z, int i2) {
        this.f = i;
        this.h = rm1Var;
        this.c = j;
        this.i = xm1Var;
        this.d = m45Var;
        this.b = r28Var;
        this.e = z;
        this.g = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = this.f;
        c1e c1eVar = c1e.a;
        Object obj3 = this.d;
        Object obj4 = this.i;
        Object obj5 = this.h;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(this.g | 1);
                sgg.j(this.f, (rm1) obj5, this.c, (xm1) obj4, (m45) obj3, this.b, this.e, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                no7.b(this.b, this.c, (cu0) obj5, (m45) obj3, this.e, (mz1) obj4, (x12) obj, iY2, this.g);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                eq7.b(this.e, (m45) obj3, this.b, this.c, (yrb) obj5, (mz1) obj4, (x12) obj, iY3, this.g);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(i2 | 1);
                ((ufc) obj5).a((m68) obj4, this.b, (qfc) obj3, this.e, this.c, (x12) obj, iY4, this.g);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ km1(r28 r28Var, long j, cu0 cu0Var, m45 m45Var, boolean z, mz1 mz1Var, int i, int i2) {
        this.b = r28Var;
        this.c = j;
        this.h = cu0Var;
        this.d = m45Var;
        this.e = z;
        this.i = mz1Var;
        this.f = i;
        this.g = i2;
    }

    public /* synthetic */ km1(ufc ufcVar, m68 m68Var, r28 r28Var, qfc qfcVar, boolean z, long j, int i, int i2) {
        this.h = ufcVar;
        this.i = m68Var;
        this.b = r28Var;
        this.d = qfcVar;
        this.e = z;
        this.c = j;
        this.f = i;
        this.g = i2;
    }

    public /* synthetic */ km1(boolean z, m45 m45Var, r28 r28Var, long j, yrb yrbVar, mz1 mz1Var, int i, int i2) {
        this.e = z;
        this.d = m45Var;
        this.b = r28Var;
        this.c = j;
        this.h = yrbVar;
        this.i = mz1Var;
        this.f = i;
        this.g = i2;
    }
}
