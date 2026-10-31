package androidx.compose.ui.focus;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import g2.s;
import g2.u;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/focus/FocusRequesterElement;", "Lb3/j1;", "Lg2/u;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
final /* data */ class FocusRequesterElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final s f14133b;

    public FocusRequesterElement(s sVar) {
        this.f14133b = sVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        u uVar = new u();
        uVar.f56903a = this.f14133b;
        return uVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof FocusRequesterElement) && Intrinsics.b(this.f14133b, ((FocusRequesterElement) obj).f14133b);
    }

    public final int hashCode() {
        return this.f14133b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("focusRequester");
        q2Var.b().b("focusRequester", this.f14133b);
    }

    public final String toString() {
        return "FocusRequesterElement(focusRequester=" + this.f14133b + ')';
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        u uVar = (u) modifier$Node;
        uVar.f56903a.f56902a.j(uVar);
        s sVar = this.f14133b;
        uVar.f56903a = sVar;
        sVar.f56902a.b(uVar);
    }
}
