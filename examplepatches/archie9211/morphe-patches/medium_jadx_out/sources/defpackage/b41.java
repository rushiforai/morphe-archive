package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b41 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ String c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ r28 e;
    public final /* synthetic */ int f;

    public /* synthetic */ b41(m45 m45Var, r28 r28Var, boolean z, String str, int i, int i2) {
        this.d = m45Var;
        this.e = r28Var;
        this.b = z;
        this.c = str;
        this.f = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                kyd.f(this.d, this.e, this.b, this.c, (x12) obj, iY, this.f);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(this.f | 1);
                aq7.e(this.b, this.c, this.d, this.e, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ b41(boolean z, String str, m45 m45Var, r28 r28Var, int i) {
        this.b = z;
        this.c = str;
        this.d = m45Var;
        this.e = r28Var;
        this.f = i;
    }
}
