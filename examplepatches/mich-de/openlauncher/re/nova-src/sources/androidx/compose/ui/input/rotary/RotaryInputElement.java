package androidx.compose.ui.input.rotary;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import c3.r;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/input/rotary/RotaryInputElement;", "Lb3/j1;", "Lx2/a;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class RotaryInputElement extends j1 {
    @Override // b3.j1
    public final Modifier$Node create() {
        r rVar = r.f19411l;
        x2.a aVar = new x2.a();
        aVar.f94984a = rVar;
        return aVar;
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof RotaryInputElement);
    }

    public final int hashCode() {
        return r.f19411l.hashCode() * 31;
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        r rVar = r.f19411l;
        q2Var.d("onRotaryScrollEvent");
        q2Var.b().b("onRotaryScrollEvent", rVar);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((x2.a) modifier$Node).f94984a = r.f19411l;
    }
}
