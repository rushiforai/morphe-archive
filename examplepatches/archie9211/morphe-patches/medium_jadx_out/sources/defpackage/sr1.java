package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class sr1 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ int d;
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ sr1(m45 m45Var, r28 r28Var, boolean z, mz1 mz1Var, int i, int i2) {
        this.a = 2;
        this.f = m45Var;
        this.b = r28Var;
        this.c = z;
        this.g = mz1Var;
        this.d = i;
        this.e = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        Object obj3 = this.g;
        Object obj4 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                vc2.n((lt1) obj4, (cs1) obj3, this.b, this.c, (x12) obj, iY, this.e);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                hlg.i((String) obj4, (String) obj3, this.b, this.c, (x12) obj, iY2, this.e);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                f49.k((m45) obj4, this.b, this.c, (mz1) obj3, (x12) obj, iY3, this.e);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(i2 | 1);
                pgb.e(this.c, (String) obj4, (lgb) obj3, this.b, (x12) obj, iY4, this.e);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(i2 | 1);
                rr7.s((hne) obj4, (obe) obj3, this.b, this.c, (x12) obj, iY5, this.e);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ sr1(Object obj, Object obj2, r28 r28Var, boolean z, int i, int i2, int i3) {
        this.a = i3;
        this.f = obj;
        this.g = obj2;
        this.b = r28Var;
        this.c = z;
        this.d = i;
        this.e = i2;
    }

    public /* synthetic */ sr1(boolean z, String str, lgb lgbVar, r28 r28Var, int i, int i2) {
        this.a = 3;
        this.c = z;
        this.f = str;
        this.g = lgbVar;
        this.b = r28Var;
        this.d = i;
        this.e = i2;
    }
}
