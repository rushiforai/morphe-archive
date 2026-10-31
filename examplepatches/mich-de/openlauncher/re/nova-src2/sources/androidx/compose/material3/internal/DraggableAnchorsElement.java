package androidx.compose.material3.internal;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import f1.y;
import g0.d1;
import kotlin.Metadata;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import m1.s;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u0000*\u0004\b\u0000\u0010\u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00030\u0002¨\u0006\u0004"}, d2 = {"Landroidx/compose/material3/internal/DraggableAnchorsElement;", "T", "Lb3/j1;", "Lm1/s;", "material3_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
final class DraggableAnchorsElement<T> extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final y f14096b;

    /* renamed from: c, reason: collision with root package name */
    public final Function2 f14097c;

    public DraggableAnchorsElement(y yVar, Function2 function2) {
        d1 d1Var = d1.f56493a;
        this.f14096b = yVar;
        this.f14097c = function2;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        d1 d1Var = d1.f56493a;
        s sVar = new s();
        sVar.f75755a = this.f14096b;
        sVar.f75756b = this.f14097c;
        sVar.f75757c = d1Var;
        return sVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DraggableAnchorsElement)) {
            return false;
        }
        DraggableAnchorsElement draggableAnchorsElement = (DraggableAnchorsElement) obj;
        if (!Intrinsics.b(this.f14096b, draggableAnchorsElement.f14096b) || this.f14097c != draggableAnchorsElement.f14097c) {
            return false;
        }
        d1 d1Var = d1.f56493a;
        return true;
    }

    public final int hashCode() {
        return d1.f56493a.hashCode() + ((this.f14097c.hashCode() + (this.f14096b.hashCode() * 31)) * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        s sVar = (s) modifier$Node;
        sVar.f75755a = this.f14096b;
        sVar.f75756b = this.f14097c;
        sVar.f75757c = d1.f56493a;
    }
}
