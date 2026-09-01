package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ta0 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ int c;
    public final /* synthetic */ int d;
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;

    public /* synthetic */ ta0(int i, Integer num, int i2, int i3, r28 r28Var, int i4) {
        this.c = i;
        this.f = num;
        this.d = i2;
        this.e = i3;
        this.b = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(24577);
                r40.l(this.c, (Integer) obj3, this.d, this.e, this.b, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(this.d | 1);
                rr7.i((az5) obj3, this.b, this.c, (x12) obj, iY2, this.e);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ta0(az5 az5Var, r28 r28Var, int i, int i2, int i3) {
        this.f = az5Var;
        this.b = r28Var;
        this.c = i;
        this.d = i2;
        this.e = i3;
    }
}
