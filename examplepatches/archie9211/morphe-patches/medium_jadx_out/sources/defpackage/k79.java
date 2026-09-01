package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class k79 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ float c;
    public final /* synthetic */ int d;
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ k79(s79 s79Var, pkf pkfVar, r28 r28Var, float f, int i, int i2) {
        this.f = s79Var;
        this.g = pkfVar;
        this.b = r28Var;
        this.c = f;
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
                hp7.n((s79) obj4, (pkf) obj3, this.b, this.c, (x12) obj, iY, this.e);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                br7.k((nhc) obj4, this.b, this.c, (c55) obj3, (x12) obj, iY2, this.e);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ k79(nhc nhcVar, r28 r28Var, float f, c55 c55Var, int i, int i2) {
        this.f = nhcVar;
        this.b = r28Var;
        this.c = f;
        this.g = c55Var;
        this.d = i;
        this.e = i2;
    }
}
