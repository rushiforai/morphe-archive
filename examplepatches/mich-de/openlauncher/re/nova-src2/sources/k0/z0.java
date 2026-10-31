package k0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class z0 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f70782a;

    /* renamed from: b, reason: collision with root package name */
    public final y3.c f70783b;

    public z0(g2 g2Var, y3.c cVar) {
        this.f70782a = g2Var;
        this.f70783b = cVar;
    }

    @Override // k0.o1
    public final float a() {
        g2 g2Var = this.f70782a;
        y3.c cVar = this.f70783b;
        return cVar.mo99toDpu2uoSUM(g2Var.c(cVar));
    }

    @Override // k0.o1
    public final float b(y3.n nVar) {
        g2 g2Var = this.f70782a;
        y3.c cVar = this.f70783b;
        return cVar.mo99toDpu2uoSUM(g2Var.a(cVar, nVar));
    }

    @Override // k0.o1
    public final float c(y3.n nVar) {
        g2 g2Var = this.f70782a;
        y3.c cVar = this.f70783b;
        return cVar.mo99toDpu2uoSUM(g2Var.b(cVar, nVar));
    }

    @Override // k0.o1
    public final float d() {
        g2 g2Var = this.f70782a;
        y3.c cVar = this.f70783b;
        return cVar.mo99toDpu2uoSUM(g2Var.d(cVar));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z0)) {
            return false;
        }
        z0 z0Var = (z0) obj;
        return Intrinsics.b(this.f70782a, z0Var.f70782a) && Intrinsics.b(this.f70783b, z0Var.f70783b);
    }

    public final int hashCode() {
        return this.f70783b.hashCode() + (this.f70782a.hashCode() * 31);
    }

    public final String toString() {
        return "InsetsPaddingValues(insets=" + this.f70782a + ", density=" + this.f70783b + ')';
    }
}
