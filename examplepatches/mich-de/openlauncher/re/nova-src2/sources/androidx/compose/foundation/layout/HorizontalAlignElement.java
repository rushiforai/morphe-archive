package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b2.i;
import b3.j1;
import c3.q2;
import k0.v0;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/HorizontalAlignElement;", "Lb3/j1;", "Lk0/v0;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class HorizontalAlignElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final i f13938b;

    public HorizontalAlignElement(i iVar) {
        this.f13938b = iVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        v0 v0Var = new v0();
        v0Var.f70757a = this.f13938b;
        return v0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        HorizontalAlignElement horizontalAlignElement = obj instanceof HorizontalAlignElement ? (HorizontalAlignElement) obj : null;
        if (horizontalAlignElement == null) {
            return false;
        }
        return this.f13938b.equals(horizontalAlignElement.f13938b);
    }

    public final int hashCode() {
        return Float.hashCode(this.f13938b.f17012a);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "align";
        q2Var.f19406b = this.f13938b;
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((v0) modifier$Node).f70757a = this.f13938b;
    }
}
