package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b2.j;
import b3.j1;
import c3.q2;
import k0.f2;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/VerticalAlignElement;", "Lb3/j1;", "Lk0/f2;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class VerticalAlignElement extends j1 {
    @Override // b3.j1
    public final Modifier$Node create() {
        f2 f2Var = new f2();
        f2Var.f70605a = b2.d.f17007k;
        return f2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if ((obj instanceof VerticalAlignElement ? (VerticalAlignElement) obj : null) == null) {
            return false;
        }
        j jVar = b2.d.f17007k;
        return jVar.equals(jVar);
    }

    public final int hashCode() {
        return Float.hashCode(0.0f);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "align";
        q2Var.f19406b = b2.d.f17007k;
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((f2) modifier$Node).f70605a = b2.d.f17007k;
    }
}
