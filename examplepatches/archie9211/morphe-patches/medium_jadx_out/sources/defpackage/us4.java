package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class us4 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ r28 c;
    public final /* synthetic */ m45 d;

    public /* synthetic */ us4(boolean z, m45 m45Var, r28 r28Var, int i) {
        this.b = z;
        this.d = m45Var;
        this.c = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        m45 m45Var = this.d;
        r28 r28Var = this.c;
        boolean z = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                g01.g(tr7.y(1), x12Var, m45Var, r28Var, z);
                break;
            default:
                dm2.e(tr7.y(49), x12Var, m45Var, r28Var, z);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ us4(boolean z, r28 r28Var, m45 m45Var, int i) {
        this.b = z;
        this.c = r28Var;
        this.d = m45Var;
    }
}
