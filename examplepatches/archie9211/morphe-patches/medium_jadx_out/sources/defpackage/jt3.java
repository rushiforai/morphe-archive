package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class jt3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ nt3 b;
    public final /* synthetic */ int c;

    public /* synthetic */ jt3(nt3 nt3Var, int i, int i2) {
        this.a = i2;
        this.b = nt3Var;
        this.c = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.c;
        nt3 nt3Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                rx0.o(nt3Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                rx0.a(nt3Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
