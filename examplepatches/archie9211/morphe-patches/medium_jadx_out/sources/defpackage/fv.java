package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fv extends co6 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ dsd b;
    public final /* synthetic */ x45 c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ mz1 e;
    public final /* synthetic */ int f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fv(dsd dsdVar, x45 x45Var, r28 r28Var, zz3 zz3Var, k54 k54Var, mz1 mz1Var, int i) {
        super(2);
        this.b = dsdVar;
        this.c = x45Var;
        this.d = r28Var;
        this.g = zz3Var;
        this.h = k54Var;
        this.e = mz1Var;
        this.f = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.f;
        Object obj3 = this.h;
        Object obj4 = this.g;
        switch (i) {
            case 0:
                ((Number) obj2).intValue();
                int iY = tr7.y(i2 | 1);
                dsd dsdVar = this.b;
                r28 r28Var = this.d;
                x45 x45Var = this.c;
                ht2.f(dsdVar, r28Var, x45Var, (xd) obj3, (x45) obj4, this.e, (x12) obj, iY);
                break;
            default:
                ((Number) obj2).intValue();
                int iY2 = tr7.y(i2 | 1);
                dsd dsdVar2 = this.b;
                x45 x45Var2 = this.c;
                r28 r28Var2 = this.d;
                vv2.e(dsdVar2, x45Var2, r28Var2, (zz3) obj4, (k54) obj3, this.e, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fv(dsd dsdVar, r28 r28Var, x45 x45Var, xd xdVar, x45 x45Var2, mz1 mz1Var, int i) {
        super(2);
        this.b = dsdVar;
        this.d = r28Var;
        this.c = x45Var;
        this.h = xdVar;
        this.g = x45Var2;
        this.e = mz1Var;
        this.f = i;
    }
}
