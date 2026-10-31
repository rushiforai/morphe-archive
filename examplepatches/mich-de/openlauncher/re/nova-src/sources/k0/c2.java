package k0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c2 implements g2 {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f70580a;

    /* renamed from: b, reason: collision with root package name */
    public final g2 f70581b;

    public c2(g2 g2Var, g2 g2Var2) {
        this.f70580a = g2Var;
        this.f70581b = g2Var2;
    }

    @Override // k0.g2
    public final int a(y3.c cVar, y3.n nVar) {
        return Math.max(this.f70580a.a(cVar, nVar), this.f70581b.a(cVar, nVar));
    }

    @Override // k0.g2
    public final int b(y3.c cVar, y3.n nVar) {
        return Math.max(this.f70580a.b(cVar, nVar), this.f70581b.b(cVar, nVar));
    }

    @Override // k0.g2
    public final int c(y3.c cVar) {
        return Math.max(this.f70580a.c(cVar), this.f70581b.c(cVar));
    }

    @Override // k0.g2
    public final int d(y3.c cVar) {
        return Math.max(this.f70580a.d(cVar), this.f70581b.d(cVar));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c2)) {
            return false;
        }
        c2 c2Var = (c2) obj;
        return Intrinsics.b(c2Var.f70580a, this.f70580a) && Intrinsics.b(c2Var.f70581b, this.f70581b);
    }

    public final int hashCode() {
        return (this.f70581b.hashCode() * 31) + this.f70580a.hashCode();
    }

    public final String toString() {
        return "(" + this.f70580a + " ∪ " + this.f70581b + ')';
    }
}
