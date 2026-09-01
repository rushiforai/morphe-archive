package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class bx1 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ lid b;
    public final /* synthetic */ mz1 c;
    public final /* synthetic */ int d;

    public /* synthetic */ bx1(lid lidVar, mz1 mz1Var, int i, int i2) {
        this.a = i2;
        this.b = lidVar;
        this.c = mz1Var;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        mz1 mz1Var = this.c;
        lid lidVar = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                guc.b(lidVar, mz1Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                d46.f(lidVar, mz1Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
