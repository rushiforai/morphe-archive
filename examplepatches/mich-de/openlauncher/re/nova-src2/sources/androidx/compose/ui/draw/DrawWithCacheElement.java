package androidx.compose.ui.draw;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import f2.b;
import f2.c;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/draw/DrawWithCacheElement;", "Lb3/j1;", "Lf2/b;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class DrawWithCacheElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f14117b;

    public DrawWithCacheElement(Function1 function1) {
        this.f14117b = function1;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new b(new c(), this.f14117b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof DrawWithCacheElement) {
            return this.f14117b == ((DrawWithCacheElement) obj).f14117b;
        }
        return false;
    }

    public final int hashCode() {
        return this.f14117b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "drawWithCache";
        q2Var.f19407c.b("onBuildDrawCache", this.f14117b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        b bVar = (b) modifier$Node;
        bVar.f54229c = this.f14117b;
        bVar.B();
    }
}
