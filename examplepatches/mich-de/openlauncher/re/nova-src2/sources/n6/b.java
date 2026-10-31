package n6;

import h6.m0;
import h6.n0;

/* loaded from: classes2.dex */
public final class b extends m0 {

    /* renamed from: l, reason: collision with root package name */
    public final mg.d f77895l;

    /* renamed from: m, reason: collision with root package name */
    public Object f77896m;
    public c n;

    public b(mg.d dVar) {
        this.f77895l = dVar;
        if (dVar.f76284a != null) {
            throw new IllegalStateException("There is already a listener registered");
        }
        dVar.f76284a = this;
    }

    @Override // h6.j0
    public final void g() {
        mg.d dVar = this.f77895l;
        dVar.f76286c = true;
        dVar.f76288e = false;
        dVar.f76287d = false;
        dVar.f76293j.drainPermits();
        dVar.c();
    }

    @Override // h6.j0
    public final void h() {
        this.f77895l.f76286c = false;
    }

    @Override // h6.j0
    public final void i(n0 n0Var) {
        super.i(n0Var);
        this.f77896m = null;
        this.n = null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [h6.a0, java.lang.Object] */
    public final void l() {
        ?? r02 = this.f77896m;
        c cVar = this.n;
        if (r02 == 0 || cVar == null) {
            return;
        }
        super.i(cVar);
        e(r02, cVar);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder(64);
        sb2.append("LoaderInfo{");
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append(" #0 : ");
        Class<?> cls = this.f77895l.getClass();
        sb2.append(cls.getSimpleName());
        sb2.append("{");
        sb2.append(Integer.toHexString(System.identityHashCode(cls)));
        sb2.append("}}");
        return sb2.toString();
    }
}
