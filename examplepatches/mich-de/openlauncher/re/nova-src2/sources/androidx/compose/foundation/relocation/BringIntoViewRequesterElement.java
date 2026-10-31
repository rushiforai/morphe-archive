package androidx.compose.foundation.relocation;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import q0.b;
import q0.c;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/relocation/BringIntoViewRequesterElement;", "Lb3/j1;", "Lq0/c;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class BringIntoViewRequesterElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final b f14011b;

    public BringIntoViewRequesterElement(b bVar) {
        this.f14011b = bVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        c cVar = new c();
        cVar.f83314a = this.f14011b;
        return cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof BringIntoViewRequesterElement) {
            return Intrinsics.b(this.f14011b, ((BringIntoViewRequesterElement) obj).f14011b);
        }
        return false;
    }

    public final int hashCode() {
        return this.f14011b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("bringIntoViewRequester");
        q2Var.b().b("bringIntoViewRequester", this.f14011b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        c cVar = (c) modifier$Node;
        b bVar = cVar.f83314a;
        if (bVar instanceof b) {
            bVar.f83313a.j(cVar);
        }
        b bVar2 = this.f14011b;
        if (bVar2 instanceof b) {
            bVar2.f83313a.b(cVar);
        }
        cVar.f83314a = bVar2;
    }
}
