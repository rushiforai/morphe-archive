package androidx.compose.ui.input.pointer;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import v2.a;
import v2.o;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/input/pointer/PointerHoverIconModifierElement;", "Lb3/j1;", "Lv2/o;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class PointerHoverIconModifierElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final a f14151b;

    public PointerHoverIconModifierElement(a aVar) {
        this.f14151b = aVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new o(this.f14151b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof PointerHoverIconModifierElement) && this.f14151b.equals(((PointerHoverIconModifierElement) obj).f14151b);
    }

    public final int hashCode() {
        return Boolean.hashCode(false) + (this.f14151b.f91908b * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("pointerHoverIcon");
        q2Var.b().b("icon", this.f14151b);
        q2Var.b().b("overrideDescendants", Boolean.FALSE);
    }

    public final String toString() {
        return "PointerHoverIconModifierElement(icon=" + this.f14151b + ", overrideDescendants=false)";
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        o oVar = (o) modifier$Node;
        a aVar = oVar.f91932b;
        a aVar2 = this.f14151b;
        if (Intrinsics.b(aVar, aVar2)) {
            return;
        }
        oVar.f91932b = aVar2;
        if (oVar.f91933c) {
            oVar.E();
        }
    }
}
