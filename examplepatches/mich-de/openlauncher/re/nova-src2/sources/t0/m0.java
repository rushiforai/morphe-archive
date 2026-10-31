package t0;

import androidx.compose.ui.node.LayoutNode;
import b.u4;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class m0 implements z2.c0 {

    /* renamed from: a, reason: collision with root package name */
    public final u1 f88089a;

    /* renamed from: b, reason: collision with root package name */
    public final int f88090b;

    /* renamed from: c, reason: collision with root package name */
    public final r3.f0 f88091c;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f88092d;

    public m0(u1 u1Var, int i5, r3.f0 f0Var, Function0 function0) {
        this.f88089a = u1Var;
        this.f88090b = i5;
        this.f88091c = f0Var;
        this.f88092d = function0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m0)) {
            return false;
        }
        m0 m0Var = (m0) obj;
        return Intrinsics.b(this.f88089a, m0Var.f88089a) && this.f88090b == m0Var.f88090b && Intrinsics.b(this.f88091c, m0Var.f88091c) && Intrinsics.b(this.f88092d, m0Var.f88092d);
    }

    public final int hashCode() {
        return this.f88092d.hashCode() + ((this.f88091c.hashCode() + u4.a(this.f88090b, this.f88089a.hashCode() * 31, 31)) * 31);
    }

    @Override // z2.c0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo295measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        long j12;
        if (q0Var.F(y3.a.g(j11)) < y3.a.h(j11)) {
            j12 = j11;
        } else {
            j12 = j11;
            j11 = y3.a.a(j12, 0, LayoutNode.NotPlacedPlaceOrder, 0, 0, 13);
        }
        z2.i1 i1VarH = q0Var.H(j11);
        int iMin = Math.min(i1VarH.f98081a, y3.a.h(j12));
        return t0Var.y(iMin, i1VarH.f98082b, b70.h.f17594a, new b00.n0(iMin, 2, this, t0Var, i1VarH));
    }

    public final String toString() {
        return "HorizontalScrollLayoutModifier(scrollerPosition=" + this.f88089a + ", cursorOffset=" + this.f88090b + ", transformedText=" + this.f88091c + ", textLayoutResultProvider=" + this.f88092d + ')';
    }
}
