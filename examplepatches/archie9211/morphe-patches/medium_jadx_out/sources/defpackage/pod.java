package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pod {
    public final boolean a;
    public final z78 b;
    public final m78 c;
    public x51 d;

    public pod(boolean z, boolean z2, z78 z78Var) {
        this.a = z2;
        this.b = z78Var;
        this.c = new m78(Boolean.valueOf(z));
    }

    public final void a() {
        x51 x51Var;
        this.c.d.setValue(Boolean.FALSE);
        if (!this.a || (x51Var = this.d) == null) {
            return;
        }
        x51Var.l(null);
    }

    public final boolean b() {
        m78 m78Var = this.c;
        return ((Boolean) m78Var.c.getValue()).booleanValue() || ((Boolean) m78Var.d.getValue()).booleanValue();
    }

    public final Object c(s78 s78Var, p4d p4dVar) {
        n92 n92Var = null;
        ml mlVar = new ml(this, new mt2(this, n92Var, 4), s78Var, n92Var, 4);
        z78 z78Var = this.b;
        z78Var.getClass();
        Object objS = o7f.s(new nz(s78Var, z78Var, mlVar, n92Var, 10), p4dVar);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : c1e.a;
    }
}
