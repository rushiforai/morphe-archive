package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uv6 implements ku6 {
    public final /* synthetic */ ur6 a;

    public uv6(ur6 ur6Var) {
        this.a = ur6Var;
    }

    @Override // defpackage.ku6
    public final int a() {
        ur6 ur6Var = this.a;
        return (int) (ur6Var.g().q == hw8.Vertical ? ur6Var.g().g() & 4294967295L : ur6Var.g().g() >> 32);
    }

    @Override // defpackage.ku6
    public final float b() {
        ur6 ur6Var = this.a;
        return (ur6Var.d.b.g() * 500) + ur6Var.d.c.g();
    }

    @Override // defpackage.ku6
    public final int c() {
        ur6 ur6Var = this.a;
        return (-ur6Var.g().n) + ur6Var.g().r;
    }

    @Override // defpackage.ku6
    public final float d() {
        ur6 ur6Var = this.a;
        int iG = ur6Var.d.b.g();
        int iG2 = ur6Var.d.c.g();
        return ur6Var.d() ? (iG * 500) + iG2 + 100.0f : (iG * 500) + iG2;
    }

    @Override // defpackage.ku6
    public final pr1 e() {
        return new pr1(-1, -1);
    }

    @Override // defpackage.ku6
    public final Object f(int i, qu6 qu6Var) {
        mya myaVar = ur6.w;
        ur6 ur6Var = this.a;
        ur6Var.getClass();
        Object objB = ur6Var.b(s78.Default, new m1(ur6Var, i, null, 25), qu6Var);
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        c1e c1eVar = c1e.a;
        if (objB != tb2Var) {
            objB = c1eVar;
        }
        return objB == tb2Var ? objB : c1eVar;
    }
}
