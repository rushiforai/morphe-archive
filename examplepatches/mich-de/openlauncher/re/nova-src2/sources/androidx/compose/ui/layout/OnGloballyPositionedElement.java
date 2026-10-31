package androidx.compose.ui.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import z2.d1;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/layout/OnGloballyPositionedElement;", "Lb3/j1;", "Lz2/d1;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class OnGloballyPositionedElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f14158b;

    public OnGloballyPositionedElement(Function1 function1) {
        this.f14158b = function1;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        d1 d1Var = new d1();
        d1Var.f98034a = this.f14158b;
        return d1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof OnGloballyPositionedElement) {
            return this.f14158b == ((OnGloballyPositionedElement) obj).f14158b;
        }
        return false;
    }

    public final int hashCode() {
        return this.f14158b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("onGloballyPositioned");
        q2Var.b().b("onGloballyPositioned", this.f14158b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((d1) modifier$Node).f98034a = this.f14158b;
    }
}
