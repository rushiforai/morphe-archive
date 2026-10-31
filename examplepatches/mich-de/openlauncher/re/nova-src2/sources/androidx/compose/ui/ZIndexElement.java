package androidx.compose.ui;

import b2.x;
import b3.j1;
import c3.q2;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/ZIndexElement;", "Lb3/j1;", "Lb2/x;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class ZIndexElement extends j1 {
    @Override // b3.j1
    public final Modifier$Node create() {
        x xVar = new x();
        xVar.f17028a = 1.0f;
        return xVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ZIndexElement) && Float.compare(1.0f, 1.0f) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(1.0f);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "zIndex";
        q2Var.f19407c.b("zIndex", Float.valueOf(1.0f));
    }

    public final String toString() {
        return "ZIndexElement(zIndex=1.0)";
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((x) modifier$Node).f17028a = 1.0f;
    }
}
