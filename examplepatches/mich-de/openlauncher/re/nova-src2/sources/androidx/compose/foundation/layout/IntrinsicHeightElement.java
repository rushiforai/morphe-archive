package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import k0.b1;
import k0.c1;
import kotlin.Metadata;
import kotlin.Unit;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/IntrinsicHeightElement;", "Lb3/j1;", "Lk0/b1;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class IntrinsicHeightElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final c1 f13939b;

    public IntrinsicHeightElement(c1 c1Var) {
        this.f13939b = c1Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        b1 b1Var = new b1();
        b1Var.f70567a = this.f13939b;
        b1Var.f70568b = true;
        return b1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        IntrinsicHeightElement intrinsicHeightElement = obj instanceof IntrinsicHeightElement ? (IntrinsicHeightElement) obj : null;
        return intrinsicHeightElement != null && this.f13939b == intrinsicHeightElement.f13939b;
    }

    public final int hashCode() {
        return Boolean.hashCode(true) + (this.f13939b.hashCode() * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        Unit unit = Unit.f71706a;
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        b1 b1Var = (b1) modifier$Node;
        b1Var.f70567a = this.f13939b;
        b1Var.f70568b = true;
    }
}
