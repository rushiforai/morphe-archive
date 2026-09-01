package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mw8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ r28 e;

    public /* synthetic */ mw8(m45 m45Var, m45 m45Var2, m45 m45Var3, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = m45Var;
        this.c = m45Var2;
        this.d = m45Var3;
        this.e = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                br7.d(this.b, this.c, this.d, this.e, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                br7.e(this.b, this.c, this.d, this.e, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }
}
