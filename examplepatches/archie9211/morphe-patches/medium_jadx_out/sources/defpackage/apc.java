package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class apc implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dpc b;
    public final /* synthetic */ cpc c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;
    public final /* synthetic */ r28 f;
    public final /* synthetic */ int g;

    public /* synthetic */ apc(dpc dpcVar, cpc cpcVar, long j, long j2, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = dpcVar;
        this.c = cpcVar;
        this.d = j;
        this.e = j2;
        this.f = r28Var;
        this.g = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.g;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                ht2.N(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                ht2.M(this.b, this.c, this.d, this.e, this.f, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }
}
