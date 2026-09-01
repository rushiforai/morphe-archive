package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class zk4 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;

    public /* synthetic */ zk4(m45 m45Var, m45 m45Var2, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = m45Var;
        this.c = m45Var2;
        this.d = r28Var;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        r28 r28Var = this.d;
        m45 m45Var = this.c;
        m45 m45Var2 = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                nk7.p(m45Var2, m45Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 1:
                guc.e(m45Var2, m45Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 2:
                pwd.m(m45Var2, m45Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            case 3:
                yo7.g(m45Var2, m45Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                gq7.e(m45Var2, m45Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
