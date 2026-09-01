package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gw5 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ int d;

    public /* synthetic */ gw5(int i, m45 m45Var, r28 r28Var, int i2) {
        this.a = 0;
        this.d = i;
        this.b = m45Var;
        this.c = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        r28 r28Var = this.c;
        m45 m45Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                bgf.n(i2, m45Var, r28Var, x12Var, tr7.y(385));
                break;
            case 1:
                ek7.j(tr7.y(i2 | 1), x12Var, m45Var, r28Var);
                break;
            case 2:
                jq7.e(tr7.y(i2 | 1), x12Var, m45Var, r28Var);
                break;
            default:
                rr7.p(tr7.y(i2 | 1), x12Var, m45Var, r28Var);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ gw5(m45 m45Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = m45Var;
        this.c = r28Var;
        this.d = i;
    }

    public /* synthetic */ gw5(r28 r28Var, m45 m45Var, int i) {
        this.a = 2;
        this.c = r28Var;
        this.b = m45Var;
        this.d = i;
    }
}
