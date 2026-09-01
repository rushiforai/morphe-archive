package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class w00 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ mz1 b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;
    public final /* synthetic */ float f;
    public final /* synthetic */ int g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    public /* synthetic */ w00(long j, long j2, float f, hy8 hy8Var, y3f y3fVar, r28 r28Var, mz1 mz1Var, int i) {
        this.d = j;
        this.e = j2;
        this.f = f;
        this.h = hy8Var;
        this.i = y3fVar;
        this.c = r28Var;
        this.b = mz1Var;
        this.g = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.g;
        Object obj3 = this.i;
        Object obj4 = this.h;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                b10.a(this.d, this.e, this.f, (hy8) obj4, (y3f) obj3, this.c, this.b, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                b10.c(this.b, this.c, (b55) obj4, (c55) obj3, this.d, this.e, this.f, (x12) obj, iY2);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                il7.i(this.c, (b55) obj4, (m3c) obj3, this.d, this.e, this.f, this.b, (x12) obj, iY3);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ w00(mz1 mz1Var, r28 r28Var, b55 b55Var, c55 c55Var, long j, long j2, float f, int i) {
        this.b = mz1Var;
        this.c = r28Var;
        this.h = b55Var;
        this.i = c55Var;
        this.d = j;
        this.e = j2;
        this.f = f;
        this.g = i;
    }

    public /* synthetic */ w00(r28 r28Var, b55 b55Var, m3c m3cVar, long j, long j2, float f, mz1 mz1Var, int i) {
        this.c = r28Var;
        this.h = b55Var;
        this.i = m3cVar;
        this.d = j;
        this.e = j2;
        this.f = f;
        this.b = mz1Var;
        this.g = i;
    }
}
