package androidx.compose.ui.graphics;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import b3.t1;
import c3.q2;
import i2.o;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/graphics/BlockGraphicsLayerElement;", "Lb3/j1;", "Li2/o;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class BlockGraphicsLayerElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f14135b;

    public BlockGraphicsLayerElement(Function1 function1) {
        this.f14135b = function1;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new o(this.f14135b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof BlockGraphicsLayerElement) {
            return this.f14135b == ((BlockGraphicsLayerElement) obj).f14135b;
        }
        return false;
    }

    public final int hashCode() {
        return this.f14135b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("graphicsLayer");
        q2Var.b().b("block", this.f14135b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        o oVar = (o) modifier$Node;
        oVar.f61131a = this.f14135b;
        t1 t1Var = b3.o.d(oVar, 2).f17359p;
        if (t1Var != null) {
            t1Var.V0(true, oVar.f61131a);
        }
    }
}
