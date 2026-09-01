package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mu6 implements ku6 {
    public final j83 a;
    public final /* synthetic */ kv6 b;
    public final /* synthetic */ boolean c;

    public mu6(kv6 kv6Var, boolean z) {
        this.b = kv6Var;
        this.c = z;
        this.a = bjc.b(new f91(kv6Var, 5));
    }

    @Override // defpackage.ku6
    public final int a() {
        kv6 kv6Var = this.b;
        return (int) (kv6Var.j().o == hw8.Vertical ? kv6Var.j().g() & 4294967295L : kv6Var.j().g() >> 32);
    }

    @Override // defpackage.ku6
    public final float b() {
        kv6 kv6Var = this.b;
        return (kv6Var.h() * 500) + kv6Var.i();
    }

    @Override // defpackage.ku6
    public final int c() {
        kv6 kv6Var = this.b;
        return (-kv6Var.j().l) + kv6Var.j().p;
    }

    @Override // defpackage.ku6
    public final float d() {
        kv6 kv6Var = this.b;
        int iH = kv6Var.h();
        int i = kv6Var.i();
        return kv6Var.d() ? (iH * 500) + i + 100.0f : (iH * 500) + i;
    }

    @Override // defpackage.ku6
    public final pr1 e() {
        boolean z = this.c;
        j83 j83Var = this.a;
        return z ? new pr1(((Number) j83Var.getValue()).intValue(), 1) : new pr1(1, ((Number) j83Var.getValue()).intValue());
    }

    @Override // defpackage.ku6
    public final Object f(int i, qu6 qu6Var) {
        Object objL = kv6.l(this.b, i, qu6Var);
        return objL == tb2.COROUTINE_SUSPENDED ? objL : c1e.a;
    }
}
