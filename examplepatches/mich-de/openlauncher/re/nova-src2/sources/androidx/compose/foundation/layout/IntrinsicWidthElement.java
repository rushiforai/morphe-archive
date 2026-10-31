package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import k0.c1;
import k0.e1;
import kotlin.Metadata;
import kotlin.Unit;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/IntrinsicWidthElement;", "Lb3/j1;", "Lk0/e1;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class IntrinsicWidthElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final c1 f13940b;

    public IntrinsicWidthElement(c1 c1Var) {
        this.f13940b = c1Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        e1 e1Var = new e1();
        e1Var.f70595a = this.f13940b;
        e1Var.f70596b = true;
        return e1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        IntrinsicWidthElement intrinsicWidthElement = obj instanceof IntrinsicWidthElement ? (IntrinsicWidthElement) obj : null;
        return intrinsicWidthElement != null && this.f13940b == intrinsicWidthElement.f13940b;
    }

    public final int hashCode() {
        return Boolean.hashCode(true) + (this.f13940b.hashCode() * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        Unit unit = Unit.f71706a;
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        e1 e1Var = (e1) modifier$Node;
        e1Var.f70595a = this.f13940b;
        e1Var.f70596b = true;
    }
}
