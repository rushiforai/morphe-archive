package androidx.compose.foundation;

import a5.d1;
import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import e0.t0;
import i0.i;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/HoverableElement;", "Lb3/j1;", "Le0/t0;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class HoverableElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final i f13893b;

    public HoverableElement(i iVar) {
        this.f13893b = iVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        t0 t0Var = new t0();
        t0Var.f50130a = this.f13893b;
        return t0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof HoverableElement) && Intrinsics.b(((HoverableElement) obj).f13893b, this.f13893b);
    }

    public final int hashCode() {
        return this.f13893b.hashCode() * 31;
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "hoverable";
        d1 d1Var = q2Var.f19407c;
        d1Var.b("interactionSource", this.f13893b);
        d1Var.b("enabled", Boolean.TRUE);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        t0 t0Var = (t0) modifier$Node;
        i iVar = t0Var.f50130a;
        i iVar2 = this.f13893b;
        if (Intrinsics.b(iVar, iVar2)) {
            return;
        }
        t0Var.E();
        t0Var.f50130a = iVar2;
    }
}
