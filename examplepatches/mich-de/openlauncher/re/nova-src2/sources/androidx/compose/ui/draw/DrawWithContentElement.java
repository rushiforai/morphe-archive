package androidx.compose.ui.draw;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import f2.f;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/draw/DrawWithContentElement;", "Lb3/j1;", "Lf2/f;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class DrawWithContentElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f14118b;

    public DrawWithContentElement(Function1 function1) {
        this.f14118b = function1;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        f fVar = new f();
        fVar.f54233a = this.f14118b;
        return fVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof DrawWithContentElement) {
            return this.f14118b == ((DrawWithContentElement) obj).f14118b;
        }
        return false;
    }

    public final int hashCode() {
        return this.f14118b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "drawWithContent";
        q2Var.f19407c.b("onDraw", this.f14118b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((f) modifier$Node).f54233a = this.f14118b;
    }
}
