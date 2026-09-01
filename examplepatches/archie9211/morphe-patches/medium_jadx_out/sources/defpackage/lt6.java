package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lt6 implements x45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ long b;
    public final /* synthetic */ Object c;

    public /* synthetic */ lt6(long j, upc upcVar) {
        this.b = j;
        this.c = upcVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                mt6 mt6Var = (mt6) obj2;
                mt6Var.e(k46.c(((k46) ((ou) obj).d()).a, this.b));
                mt6Var.c.invoke();
                break;
            default:
                ho2.r((zl3) obj, this.b, 0L, 0L, iq7.u(((Number) ((upc) obj2).getValue()).floatValue(), 0.0f, 1.0f), 118);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ lt6(mt6 mt6Var, long j) {
        this.c = mt6Var;
        this.b = j;
    }
}
