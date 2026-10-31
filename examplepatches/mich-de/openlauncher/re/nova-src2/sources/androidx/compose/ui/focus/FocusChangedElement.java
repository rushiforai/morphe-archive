package androidx.compose.ui.focus;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import g2.c;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/focus/FocusChangedElement;", "Lb3/j1;", "Lg2/c;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class FocusChangedElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f14129b;

    public FocusChangedElement(Function1 function1) {
        this.f14129b = function1;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        c cVar = new c();
        cVar.f56857a = this.f14129b;
        return cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof FocusChangedElement) {
            return this.f14129b == ((FocusChangedElement) obj).f14129b;
        }
        return false;
    }

    public final int hashCode() {
        return this.f14129b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("onFocusChanged");
        q2Var.b().b("onFocusChanged", this.f14129b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((c) modifier$Node).f56857a = this.f14129b;
    }
}
