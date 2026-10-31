package androidx.compose.ui.focus;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import g2.p;
import g2.r;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/focus/FocusPropertiesElement;", "Lb3/j1;", "Lg2/r;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final /* data */ class FocusPropertiesElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final p f14132b;

    public FocusPropertiesElement(p pVar) {
        this.f14132b = pVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        r rVar = new r();
        rVar.f56898a = this.f14132b;
        return rVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof FocusPropertiesElement) && Intrinsics.b(this.f14132b, ((FocusPropertiesElement) obj).f14132b);
    }

    public final int hashCode() {
        return this.f14132b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "focusProperties";
        q2Var.f19407c.b("scope", this.f14132b);
    }

    public final String toString() {
        return "FocusPropertiesElement(scope=" + this.f14132b + ')';
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((r) modifier$Node).f56898a = this.f14132b;
    }
}
