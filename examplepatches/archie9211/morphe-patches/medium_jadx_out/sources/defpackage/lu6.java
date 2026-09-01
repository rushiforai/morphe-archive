package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lu6 implements ku6 {
    public final /* synthetic */ gz8 a;
    public final /* synthetic */ boolean b;

    public lu6(gz8 gz8Var, boolean z) {
        this.a = gz8Var;
        this.b = z;
    }

    @Override // defpackage.ku6
    public final int a() {
        gz8 gz8Var = this.a;
        return (int) (gz8Var.n().e == hw8.Vertical ? gz8Var.n().g() & 4294967295L : gz8Var.n().g() >> 32);
    }

    @Override // defpackage.ku6
    public final float b() {
        return ok7.z(this.a);
    }

    @Override // defpackage.ku6
    public final int c() {
        gz8 gz8Var = this.a;
        return (-gz8Var.n().f) + gz8Var.n().d;
    }

    @Override // defpackage.ku6
    public final float d() {
        gz8 gz8Var = this.a;
        return jz8.a(gz8Var.n(), gz8Var.o());
    }

    @Override // defpackage.ku6
    public final pr1 e() {
        boolean z = this.b;
        gz8 gz8Var = this.a;
        return z ? new pr1(gz8Var.o(), 1) : new pr1(1, gz8Var.o());
    }

    @Override // defpackage.ku6
    public final Object f(int i, qu6 qu6Var) {
        gz8 gz8Var = this.a;
        gz8Var.getClass();
        Object objB = gz8Var.b(s78.Default, new fz8(gz8Var, i, null, 0), qu6Var);
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        c1e c1eVar = c1e.a;
        if (objB != tb2Var) {
            objB = c1eVar;
        }
        return objB == tb2Var ? objB : c1eVar;
    }
}
