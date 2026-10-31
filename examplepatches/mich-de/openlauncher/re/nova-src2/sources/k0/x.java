package k0;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class x implements z2.r0, s1 {

    /* renamed from: a, reason: collision with root package name */
    public final j f70770a;

    /* renamed from: b, reason: collision with root package name */
    public final b2.e f70771b;

    public x(j jVar, b2.e eVar) {
        this.f70770a = jVar;
        this.f70771b = eVar;
    }

    @Override // z2.r0
    public final int a(z2.t tVar, List list, int i5) {
        return d.h(i5, tVar.mo96roundToPx0680j_4(this.f70770a.a()), list);
    }

    @Override // z2.r0
    public final int b(z2.t tVar, List list, int i5) {
        return d.f(i5, tVar.mo96roundToPx0680j_4(this.f70770a.a()), list);
    }

    @Override // z2.r0
    public final int c(z2.t tVar, List list, int i5) {
        return d.g(i5, tVar.mo96roundToPx0680j_4(this.f70770a.a()), list);
    }

    @Override // z2.r0
    public final int d(z2.t tVar, List list, int i5) {
        return d.e(i5, tVar.mo96roundToPx0680j_4(this.f70770a.a()), list);
    }

    @Override // z2.r0
    public final z2.s0 e(z2.t0 t0Var, List list, long j11) {
        return t1.a(this, y3.a.i(j11), y3.a.j(j11), y3.a.g(j11), y3.a.h(j11), t0Var.mo96roundToPx0680j_4(this.f70770a.a()), t0Var, list, new z2.i1[list.size()], 0, list.size(), null, 0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return Intrinsics.b(this.f70770a, xVar.f70770a) && Intrinsics.b(this.f70771b, xVar.f70771b);
    }

    @Override // k0.s1
    public final int f(z2.i1 i1Var) {
        return i1Var.f98082b;
    }

    @Override // k0.s1
    public final long g(int i5, int i11, int i12, boolean z11) {
        return !z11 ? y3.b.a(0, i12, i5, i11) : v4.a.g(0, i12, i5, i11);
    }

    @Override // k0.s1
    public final int h(z2.i1 i1Var) {
        return i1Var.f98081a;
    }

    public final int hashCode() {
        return this.f70771b.hashCode() + (this.f70770a.hashCode() * 31);
    }

    @Override // k0.s1
    public final void i(int i5, int[] iArr, int[] iArr2, z2.t0 t0Var) {
        this.f70770a.b(t0Var, i5, iArr, iArr2);
    }

    @Override // k0.s1
    public final z2.s0 j(z2.i1[] i1VarArr, z2.t0 t0Var, int i5, int[] iArr, int i11, int i12, int[] iArr2, int i13, int i14, int i15) {
        return t0Var.y(i12, i11, b70.h.f17594a, new q(i1VarArr, this, i12, i5, t0Var, iArr));
    }

    public final String toString() {
        return "ColumnMeasurePolicy(verticalArrangement=" + this.f70770a + ", horizontalAlignment=" + this.f70771b + ')';
    }
}
