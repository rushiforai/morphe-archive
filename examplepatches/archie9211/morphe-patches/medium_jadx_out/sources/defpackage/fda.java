package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fda implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ eda b;
    public final /* synthetic */ ek8 c;

    public /* synthetic */ fda(eda edaVar, ek8 ek8Var, int i, int i2) {
        this.a = i2;
        this.b = edaVar;
        this.c = ek8Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ek8 ek8Var = this.c;
        eda edaVar = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                gq7.b(edaVar, ek8Var, x12Var, tr7.y(1));
                break;
            default:
                gq7.f(edaVar, ek8Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }
}
