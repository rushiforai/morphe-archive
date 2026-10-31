package t0;

import androidx.compose.ui.node.LayoutNode;
import b.u4;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class c2 implements z2.c0 {

    /* renamed from: a, reason: collision with root package name */
    public final u1 f87956a;

    /* renamed from: b, reason: collision with root package name */
    public final int f87957b;

    /* renamed from: c, reason: collision with root package name */
    public final r3.f0 f87958c;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f87959d;

    public c2(u1 u1Var, int i5, r3.f0 f0Var, Function0 function0) {
        this.f87956a = u1Var;
        this.f87957b = i5;
        this.f87958c = f0Var;
        this.f87959d = function0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c2)) {
            return false;
        }
        c2 c2Var = (c2) obj;
        return Intrinsics.b(this.f87956a, c2Var.f87956a) && this.f87957b == c2Var.f87957b && Intrinsics.b(this.f87958c, c2Var.f87958c) && Intrinsics.b(this.f87959d, c2Var.f87959d);
    }

    public final int hashCode() {
        return this.f87959d.hashCode() + ((this.f87958c.hashCode() + u4.a(this.f87957b, this.f87956a.hashCode() * 31, 31)) * 31);
    }

    @Override // z2.c0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo295measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        z2.i1 i1VarH = q0Var.H(y3.a.a(j11, 0, 0, 0, LayoutNode.NotPlacedPlaceOrder, 7));
        int iMin = Math.min(i1VarH.f98082b, y3.a.g(j11));
        return t0Var.y(i1VarH.f98081a, iMin, b70.h.f17594a, new b10.y(this, i1VarH, iMin, 2));
    }

    public final String toString() {
        return "VerticalScrollLayoutModifier(scrollerPosition=" + this.f87956a + ", cursorOffset=" + this.f87957b + ", transformedText=" + this.f87958c + ", textLayoutResultProvider=" + this.f87959d + ')';
    }
}
