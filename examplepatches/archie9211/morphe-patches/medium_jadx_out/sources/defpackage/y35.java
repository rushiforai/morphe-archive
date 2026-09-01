package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class y35 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sw5 b;
    public final /* synthetic */ r28 c;

    public /* synthetic */ y35(sw5 sw5Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = sw5Var;
        this.c = r28Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        r28 r28Var = this.c;
        sw5 sw5Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                vc2.g(sw5Var, r28Var, x12Var, tr7.y(1));
                break;
            default:
                vc2.c(sw5Var, r28Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
