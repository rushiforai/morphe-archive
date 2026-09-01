package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class g1a implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ i1a c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;

    public /* synthetic */ g1a(boolean z, i1a i1aVar, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = z;
        this.c = i1aVar;
        this.d = r28Var;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        r28 r28Var = this.d;
        i1a i1aVar = this.c;
        boolean z = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                vx0.w(z, i1aVar, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                vx0.b(z, i1aVar, r28Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
