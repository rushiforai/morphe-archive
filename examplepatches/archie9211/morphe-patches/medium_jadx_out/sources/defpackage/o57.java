package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o57 extends n68 {
    public final gkf l;
    public iy6 m;
    public p57 n;

    public o57(gkf gkfVar) {
        this.l = gkfVar;
        if (gkfVar.a == null) {
            gkfVar.a = this;
        } else {
            ygf.f("There is already a listener registered");
            throw null;
        }
    }

    @Override // defpackage.g57
    public final void f() {
        gkf gkfVar = this.l;
        gkfVar.b = true;
        gkfVar.d = false;
        gkfVar.c = false;
        gkfVar.i.drainPermits();
        gkfVar.d();
    }

    @Override // defpackage.g57
    public final void g() {
        this.l.b = false;
    }

    @Override // defpackage.g57
    public final void i(kn8 kn8Var) {
        super.i(kn8Var);
        this.m = null;
        this.n = null;
    }

    public final void k() {
        iy6 iy6Var = this.m;
        p57 p57Var = this.n;
        if (iy6Var == null || p57Var == null) {
            return;
        }
        super.i(p57Var);
        d(iy6Var, p57Var);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(64);
        sb.append("LoaderInfo{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" #0 : ");
        Class<?> cls = this.l.getClass();
        sb.append(cls.getSimpleName());
        sb.append("{");
        sb.append(Integer.toHexString(System.identityHashCode(cls)));
        sb.append("}}");
        return sb.toString();
    }
}
