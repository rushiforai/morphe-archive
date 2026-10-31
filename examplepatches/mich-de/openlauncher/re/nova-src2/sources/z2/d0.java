package z2;

import androidx.compose.ui.Modifier$Node;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public final class d0 extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public Function3 f98033a;

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final s0 mo25measure3p2s80s(t0 t0Var, q0 q0Var, long j11) {
        return (s0) this.f98033a.invoke(t0Var, q0Var, new y3.a(j11));
    }

    public final String toString() {
        return "LayoutModifierImpl(measureBlock=" + this.f98033a + ')';
    }
}
