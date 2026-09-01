package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class l35 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ q35 b;
    public final /* synthetic */ ew9 c;

    public /* synthetic */ l35(q35 q35Var, ew9 ew9Var, int i, int i2) {
        this.a = i2;
        this.b = q35Var;
        this.c = ew9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ew9 ew9Var = this.c;
        q35 q35Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                t40.j(q35Var, ew9Var, x12Var, tr7.y(1));
                break;
            default:
                t40.k(q35Var, ew9Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
