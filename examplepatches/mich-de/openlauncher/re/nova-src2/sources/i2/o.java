package i2;

import androidx.compose.ui.Modifier$Node;
import b3.p2;
import kotlin.jvm.functions.Function1;
import z2.i1;

/* loaded from: classes.dex */
public final class o extends Modifier$Node implements b3.e0, p2 {

    /* renamed from: a, reason: collision with root package name */
    public Function1 f61131a;

    public o(Function1 function1) {
        this.f61131a = function1;
    }

    @Override // b3.p2
    public final void applySemantics(j3.b0 b0Var) {
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // b3.p2
    public final boolean isImportantForBounds() {
        return false;
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        i1 i1VarH = q0Var.H(j11);
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new b4.d(7, i1VarH, this));
    }

    public final String toString() {
        return "BlockGraphicsLayerModifier(block=" + this.f61131a + ')';
    }
}
