package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class be1 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ long b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ be1(long j, oe1 oe1Var, az5 az5Var, int i, int i2) {
        this.b = j;
        this.d = oe1Var;
        this.e = az5Var;
        this.c = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        Object obj4 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(3073);
                g01.o(this.b, (oe1) obj4, (az5) obj3, this.c, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(this.c | 1);
                fo7.v(this.b, (mkd) obj4, (b55) obj3, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ be1(long j, mkd mkdVar, b55 b55Var, int i) {
        this.b = j;
        this.d = mkdVar;
        this.e = b55Var;
        this.c = i;
    }
}
