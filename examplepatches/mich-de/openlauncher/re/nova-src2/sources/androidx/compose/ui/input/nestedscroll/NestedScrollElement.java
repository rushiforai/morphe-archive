package androidx.compose.ui.input.nestedscroll;

import a3.e;
import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import u2.f;
import x7.h;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/input/nestedscroll/NestedScrollElement;", "Lb3/j1;", "Lu2/f;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class NestedScrollElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final u2.a f14148b;

    /* renamed from: c, reason: collision with root package name */
    public final h f14149c;

    public NestedScrollElement(u2.a aVar, h hVar) {
        this.f14148b = aVar;
        this.f14149c = hVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new f(this.f14148b, this.f14149c);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof NestedScrollElement)) {
            return false;
        }
        NestedScrollElement nestedScrollElement = (NestedScrollElement) obj;
        return Intrinsics.b(nestedScrollElement.f14148b, this.f14148b) && Intrinsics.b(nestedScrollElement.f14149c, this.f14149c);
    }

    public final int hashCode() {
        int iHashCode = this.f14148b.hashCode() * 31;
        h hVar = this.f14149c;
        return iHashCode + (hVar != null ? hVar.hashCode() : 0);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("nestedScroll");
        q2Var.b().b("connection", this.f14148b);
        q2Var.b().b("dispatcher", this.f14149c);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        f fVar = (f) modifier$Node;
        fVar.f90452a = this.f14148b;
        h hVar = fVar.f90453b;
        if (((f) hVar.f95137b) == fVar) {
            hVar.f95137b = null;
        }
        h hVar2 = this.f14149c;
        if (hVar2 == null) {
            fVar.f90453b = new h(9);
        } else if (!hVar2.equals(hVar)) {
            fVar.f90453b = hVar2;
        }
        if (fVar.getIsAttached()) {
            h hVar3 = fVar.f90453b;
            hVar3.f95137b = fVar;
            hVar3.f95138c = null;
            fVar.f90454c = null;
            hVar3.f95139d = new e(fVar, 27);
            hVar3.f95140e = fVar.getCoroutineScope();
        }
    }
}
