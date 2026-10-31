package androidx.compose.foundation.lazy.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import n0.o0;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0083\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/lazy/layout/TraversablePrefetchStateModifierElement;", "Lb3/j1;", "Ln0/j1;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final /* data */ class TraversablePrefetchStateModifierElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final o0 f13992b;

    public TraversablePrefetchStateModifierElement(o0 o0Var) {
        this.f13992b = o0Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new n0.j1(this.f13992b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof TraversablePrefetchStateModifierElement) && Intrinsics.b(this.f13992b, ((TraversablePrefetchStateModifierElement) obj).f13992b);
    }

    public final int hashCode() {
        return this.f13992b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("traversablePrefetchState");
        q2Var.e(this.f13992b);
    }

    public final String toString() {
        return "TraversablePrefetchStateModifierElement(prefetchState=" + this.f13992b + ')';
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((n0.j1) modifier$Node).f77441a = this.f13992b;
    }
}
