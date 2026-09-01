package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b5b implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ int d;

    public /* synthetic */ b5b(m45 m45Var, m45 m45Var2, int i, int i2) {
        this.a = i2;
        this.b = m45Var;
        this.c = m45Var2;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        m45 m45Var = this.c;
        m45 m45Var2 = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                jq7.d(m45Var2, m45Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                br7.h(m45Var2, m45Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
