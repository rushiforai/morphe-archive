package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hs implements b55 {
    public final /* synthetic */ int a = 2;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;

    public /* synthetic */ hs(int i, boolean z, r28 r28Var, m45 m45Var, int i2) {
        this.e = i;
        this.b = z;
        this.d = r28Var;
        this.c = m45Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = this.e;
        r28 r28Var = this.d;
        m45 m45Var = this.c;
        boolean z = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                g01.B(tr7.y(i2 | 1), (x12) obj, m45Var, r28Var, z);
                break;
            case 1:
                ((Integer) obj2).getClass();
                vv2.q(tr7.y(i2 | 1), (x12) obj, m45Var, r28Var, z);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY = tr7.y(1);
                iq7.i(this.e, this.b, this.d, this.c, (x12) obj, iY);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ hs(r28 r28Var, m45 m45Var, boolean z, int i) {
        this.d = r28Var;
        this.c = m45Var;
        this.b = z;
        this.e = i;
    }

    public /* synthetic */ hs(boolean z, m45 m45Var, r28 r28Var, int i) {
        this.b = z;
        this.c = m45Var;
        this.d = r28Var;
        this.e = i;
    }
}
