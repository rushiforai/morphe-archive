package androidx.compose.ui.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.functions.Function3;
import z2.d0;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/layout/LayoutElement;", "Lb3/j1;", "Lz2/d0;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class LayoutElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Function3 f14156b;

    public LayoutElement(Function3 function3) {
        this.f14156b = function3;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        d0 d0Var = new d0();
        d0Var.f98033a = this.f14156b;
        return d0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof LayoutElement) {
            return this.f14156b == ((LayoutElement) obj).f14156b;
        }
        return false;
    }

    public final int hashCode() {
        return this.f14156b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("layout");
        q2Var.b().b("measure", this.f14156b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((d0) modifier$Node).f98033a = this.f14156b;
    }
}
