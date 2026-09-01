package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wo extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ int c;
    public final /* synthetic */ j55 d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ j55 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wo(j55 j55Var, Object obj, j55 j55Var2, int i, int i2, int i3) {
        super(2);
        this.a = i3;
        this.d = j55Var;
        this.e = obj;
        this.f = j55Var2;
        this.b = i;
        this.c = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.b;
        j55 j55Var = this.f;
        Object obj3 = this.e;
        j55 j55Var2 = this.d;
        switch (i) {
            case 0:
                ((Number) obj2).intValue();
                m40.h((m45) j55Var2, (pb3) obj3, (mz1) j55Var, (x12) obj, tr7.y(i2 | 1), this.c);
                break;
            default:
                ((Number) obj2).intValue();
                vc2.a((x45) j55Var2, (r28) obj3, (x45) j55Var, (x12) obj, tr7.y(i2 | 1), this.c);
                break;
        }
        return c1eVar;
    }
}
