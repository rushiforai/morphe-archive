package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import k0.l;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/AspectRatioElement;", "Lb3/j1;", "Lk0/l;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
final class AspectRatioElement extends j1 {
    @Override // b3.j1
    public final Modifier$Node create() {
        l lVar = new l();
        lVar.f70664a = 2.7692308f;
        return lVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if ((obj instanceof AspectRatioElement ? (AspectRatioElement) obj : null) == null) {
            return false;
        }
        ((AspectRatioElement) obj).getClass();
        return true;
    }

    public final int hashCode() {
        return Boolean.hashCode(false) + (Float.hashCode(2.7692308f) * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        Unit unit = Unit.f71706a;
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((l) modifier$Node).f70664a = 2.7692308f;
    }
}
