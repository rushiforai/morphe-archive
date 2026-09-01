package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lq implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ long c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ r28 e;
    public final /* synthetic */ int f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    public /* synthetic */ lq(boolean z, m45 m45Var, r28 r28Var, long j, yrb yrbVar, hd9 hd9Var, mz1 mz1Var, int i) {
        this.a = 0;
        this.d = z;
        this.b = m45Var;
        this.e = r28Var;
        this.c = j;
        this.g = yrbVar;
        this.h = hd9Var;
        this.i = mz1Var;
        this.f = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.f;
        Object obj3 = this.i;
        Object obj4 = this.h;
        Object obj5 = this.g;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                pq.a(this.d, this.b, this.e, this.c, (yrb) obj5, (hd9) obj4, (mz1) obj3, (x12) obj, iY);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                fo7.p(this.b, (String) obj5, (xn7) obj4, (g11) obj3, this.c, this.d, this.e, (x12) obj, iY2);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                mo7.r(this.b, (String) obj5, (yn7) obj4, (ay2) obj3, this.c, this.d, this.e, (x12) obj, iY3);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ lq(m45 m45Var, String str, Enum r3, Object obj, long j, boolean z, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = m45Var;
        this.g = str;
        this.h = r3;
        this.i = obj;
        this.c = j;
        this.d = z;
        this.e = r28Var;
        this.f = i;
    }
}
