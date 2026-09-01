package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class t00 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mz1 b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ mz1 d;
    public final /* synthetic */ float e;
    public final /* synthetic */ float f;
    public final /* synthetic */ y3f g;
    public final /* synthetic */ qod h;
    public final /* synthetic */ uod i;
    public final /* synthetic */ int j;
    public final /* synthetic */ c55 k;

    public /* synthetic */ t00(mz1 mz1Var, r28 r28Var, mz1 mz1Var2, c55 c55Var, float f, float f2, y3f y3fVar, qod qodVar, uod uodVar, int i, int i2) {
        this.a = i2;
        this.b = mz1Var;
        this.c = r28Var;
        this.d = mz1Var2;
        this.k = c55Var;
        this.e = f;
        this.f = f2;
        this.g = y3fVar;
        this.h = qodVar;
        this.i = uodVar;
        this.j = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.j;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                a10.c(this.b, this.c, this.d, this.k, this.e, this.f, this.g, this.h, this.i, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                a10.b(this.b, this.c, this.d, (mz1) this.k, this.e, this.f, this.g, this.h, this.i, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }
}
