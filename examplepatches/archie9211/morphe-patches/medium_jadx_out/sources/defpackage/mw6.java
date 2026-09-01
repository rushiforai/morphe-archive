package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mw6 implements ku6 {
    public final /* synthetic */ pw6 a;

    public mw6(pw6 pw6Var) {
        this.a = pw6Var;
    }

    @Override // defpackage.ku6
    public final int a() {
        pw6 pw6Var = this.a;
        return (int) (pw6Var.g().u == hw8.Vertical ? pw6Var.g().n & 4294967295L : pw6Var.g().n >> 32);
    }

    @Override // defpackage.ku6
    public final float b() {
        pw6 pw6Var = this.a;
        return (((h49) pw6Var.c.d).g() * 500) + ((h49) pw6Var.c.f).g();
    }

    @Override // defpackage.ku6
    public final int c() {
        pw6 pw6Var = this.a;
        return pw6Var.g().q + pw6Var.g().r;
    }

    @Override // defpackage.ku6
    public final float d() {
        pw6 pw6Var = this.a;
        int iG = ((h49) pw6Var.c.d).g();
        int iG2 = ((h49) pw6Var.c.f).g();
        return pw6Var.d() ? (iG * 500) + iG2 + 100.0f : (iG * 500) + iG2;
    }

    @Override // defpackage.ku6
    public final pr1 e() {
        return new pr1(-1, -1);
    }

    @Override // defpackage.ku6
    public final Object f(int i, qu6 qu6Var) {
        mya myaVar = pw6.x;
        pw6 pw6Var = this.a;
        pw6Var.getClass();
        Object objB = pw6Var.b(s78.Default, new m1(pw6Var, i, null, 27), qu6Var);
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        c1e c1eVar = c1e.a;
        if (objB != tb2Var) {
            objB = c1eVar;
        }
        return objB == tb2Var ? objB : c1eVar;
    }
}
