package io.sentry;

/* loaded from: classes4.dex */
public final class a4 implements t {

    /* renamed from: a, reason: collision with root package name */
    public final String f66748a;

    /* renamed from: b, reason: collision with root package name */
    public final String f66749b;

    public a4() {
        String property = System.getProperty("java.version");
        String property2 = System.getProperty("java.vendor");
        this.f66748a = property;
        this.f66749b = property2;
    }

    @Override // io.sentry.t
    public final b3 a(b3 b3Var, x xVar) {
        c(b3Var);
        return b3Var;
    }

    @Override // io.sentry.t
    public final io.sentry.protocol.b0 b(io.sentry.protocol.b0 b0Var, x xVar) {
        c(b0Var);
        return b0Var;
    }

    public final void c(r2 r2Var) {
        io.sentry.protocol.c cVar = r2Var.f67683b;
        if (((io.sentry.protocol.w) cVar.d(io.sentry.protocol.w.class, "runtime")) == null) {
            cVar.put("runtime", new io.sentry.protocol.w());
        }
        io.sentry.protocol.w wVar = (io.sentry.protocol.w) cVar.d(io.sentry.protocol.w.class, "runtime");
        if (wVar != null && wVar.f67625a == null && wVar.f67626b == null) {
            wVar.f67625a = this.f66749b;
            wVar.f67626b = this.f66748a;
        }
    }
}
