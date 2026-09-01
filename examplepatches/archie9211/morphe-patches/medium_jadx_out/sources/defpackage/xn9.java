package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xn9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ tve b;
    public final /* synthetic */ lo9 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ int e;

    public /* synthetic */ xn9(tve tveVar, lo9 lo9Var, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = tveVar;
        this.c = lo9Var;
        this.d = r28Var;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.e;
        r28 r28Var = this.d;
        lo9 lo9Var = this.c;
        tve tveVar = this.b;
        x12 x12Var = (x12) obj;
        ((Integer) obj2).getClass();
        switch (i) {
            case 0:
                mo7.h(tveVar, lo9Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
            default:
                mo7.B(tveVar, lo9Var, r28Var, x12Var, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
