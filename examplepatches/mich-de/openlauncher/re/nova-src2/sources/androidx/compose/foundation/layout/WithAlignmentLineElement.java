package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import k0.a2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import z2.n;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/WithAlignmentLineElement;", "Lb3/j1;", "Lk0/a2;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class WithAlignmentLineElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final n f13963b;

    public WithAlignmentLineElement(n nVar) {
        this.f13963b = nVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        a2 a2Var = new a2();
        a2Var.f70562a = this.f13963b;
        return a2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        WithAlignmentLineElement withAlignmentLineElement = obj instanceof WithAlignmentLineElement ? (WithAlignmentLineElement) obj : null;
        if (withAlignmentLineElement == null) {
            return false;
        }
        return Intrinsics.b(this.f13963b, withAlignmentLineElement.f13963b);
    }

    public final int hashCode() {
        return this.f13963b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "alignBy";
        q2Var.f19406b = this.f13963b;
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((a2) modifier$Node).f70562a = this.f13963b;
    }
}
