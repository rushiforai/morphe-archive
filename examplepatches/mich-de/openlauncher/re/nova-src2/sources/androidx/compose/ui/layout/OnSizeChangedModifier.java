package androidx.compose.ui.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import z2.e1;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/layout/OnSizeChangedModifier;", "Lb3/j1;", "Lz2/e1;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class OnSizeChangedModifier extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f14159b;

    public OnSizeChangedModifier(Function1 function1) {
        this.f14159b = function1;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new e1(this.f14159b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof OnSizeChangedModifier) {
            return this.f14159b == ((OnSizeChangedModifier) obj).f14159b;
        }
        return false;
    }

    public final int hashCode() {
        return this.f14159b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "onSizeChanged";
        q2Var.f19407c.b("onSizeChanged", this.f14159b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        e1 e1Var = (e1) modifier$Node;
        e1Var.f98048a = this.f14159b;
        long j11 = Integer.MIN_VALUE;
        e1Var.f98050c = (j11 & 4294967295L) | (j11 << 32);
    }
}
