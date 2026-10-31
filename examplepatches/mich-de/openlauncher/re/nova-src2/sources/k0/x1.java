package k0;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class x1 implements z2.r0, s1 {

    /* renamed from: a, reason: collision with root package name */
    public final h f70776a;

    /* renamed from: b, reason: collision with root package name */
    public final b2.j f70777b;

    public x1(h hVar, b2.j jVar) {
        this.f70776a = hVar;
        this.f70777b = jVar;
    }

    @Override // z2.r0
    public final int a(z2.t tVar, List list, int i5) {
        return d.d(i5, tVar.mo96roundToPx0680j_4(this.f70776a.a()), list);
    }

    @Override // z2.r0
    public final int b(z2.t tVar, List list, int i5) {
        return d.b(i5, tVar.mo96roundToPx0680j_4(this.f70776a.a()), list);
    }

    @Override // z2.r0
    public final int c(z2.t tVar, List list, int i5) {
        return d.c(i5, tVar.mo96roundToPx0680j_4(this.f70776a.a()), list);
    }

    @Override // z2.r0
    public final int d(z2.t tVar, List list, int i5) {
        return d.a(i5, tVar.mo96roundToPx0680j_4(this.f70776a.a()), list);
    }

    @Override // z2.r0
    public final z2.s0 e(z2.t0 t0Var, List list, long j11) {
        return t1.a(this, y3.a.j(j11), y3.a.i(j11), y3.a.h(j11), y3.a.g(j11), t0Var.mo96roundToPx0680j_4(this.f70776a.a()), t0Var, list, new z2.i1[list.size()], 0, list.size(), null, 0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x1)) {
            return false;
        }
        x1 x1Var = (x1) obj;
        return Intrinsics.b(this.f70776a, x1Var.f70776a) && Intrinsics.b(this.f70777b, x1Var.f70777b);
    }

    @Override // k0.s1
    public final int f(z2.i1 i1Var) {
        return i1Var.f98081a;
    }

    @Override // k0.s1
    public final long g(int i5, int i11, int i12, boolean z11) {
        return !z11 ? y3.b.a(i5, i11, 0, i12) : v4.a.h(i5, i11, 0, i12);
    }

    @Override // k0.s1
    public final int h(z2.i1 i1Var) {
        return i1Var.f98082b;
    }

    public final int hashCode() {
        return this.f70777b.hashCode() + (this.f70776a.hashCode() * 31);
    }

    @Override // k0.s1
    public final void i(int i5, int[] iArr, int[] iArr2, z2.t0 t0Var) {
        this.f70776a.k(t0Var, i5, iArr, t0Var.getLayoutDirection(), iArr2);
    }

    @Override // k0.s1
    public final z2.s0 j(z2.i1[] i1VarArr, z2.t0 t0Var, int i5, int[] iArr, int i11, int i12, int[] iArr2, int i13, int i14, int i15) {
        return t0Var.y(i11, i12, b70.h.f17594a, new w1(i1VarArr, this, i12, i5, iArr));
    }

    public final String toString() {
        return "RowMeasurePolicy(horizontalArrangement=" + this.f70776a + ", verticalAlignment=" + this.f70777b + ')';
    }
}
