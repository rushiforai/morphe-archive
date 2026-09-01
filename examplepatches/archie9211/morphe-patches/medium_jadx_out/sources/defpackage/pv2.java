package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pv2 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ long c;
    public final /* synthetic */ int d;
    public final /* synthetic */ int e;

    public /* synthetic */ pv2(int i, int i2, long j, String str) {
        this.a = 4;
        this.d = i;
        this.b = str;
        this.c = j;
        this.e = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = this.e;
        int i3 = this.d;
        c1e c1eVar = c1e.a;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                r28 r28Var = (r28) obj3;
                ((Integer) obj2).getClass();
                d46.h(tr7.y(i3 | 1), this.e, this.c, (x12) obj, r28Var);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i3 | 1);
                int i4 = this.e;
                long j = this.c;
                tr7.b(iY, i4, j, (x12) obj, (r28) obj3);
                break;
            case 2:
                r28 r28Var2 = (r28) obj3;
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                bo.g(this.d, iY2, this.c, (x12) obj, r28Var2);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i3 | 1);
                int i5 = this.e;
                long j2 = this.c;
                vx0.B(iY3, i5, j2, (x12) obj, (r28) obj3);
                break;
            default:
                ((Integer) obj2).intValue();
                int iY4 = tr7.y(i2 | 1);
                ht2.Q(this.d, (String) obj3, this.c, (x12) obj, iY4);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ pv2(long j, r28 r28Var, int i, int i2) {
        this.a = 3;
        this.c = j;
        this.b = r28Var;
        this.d = i;
        this.e = i2;
    }

    public /* synthetic */ pv2(r28 r28Var, long j, int i, int i2, int i3) {
        this.a = i3;
        this.b = r28Var;
        this.c = j;
        this.d = i;
        this.e = i2;
    }
}
