package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jm4 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sm4 b;
    public final /* synthetic */ lm4 c;
    public final /* synthetic */ int d;

    public /* synthetic */ jm4(sm4 sm4Var, lm4 lm4Var, int i, int i2) {
        this.a = i2;
        this.b = sm4Var;
        this.c = lm4Var;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        lm4 lm4Var = this.c;
        sm4 sm4Var = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                k40.l(sm4Var, lm4Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                k40.q(sm4Var, lm4Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
