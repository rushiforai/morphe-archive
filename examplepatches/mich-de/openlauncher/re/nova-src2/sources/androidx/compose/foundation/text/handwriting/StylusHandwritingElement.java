package androidx.compose.foundation.text.handwriting;

import androidx.compose.ui.Modifier$Node;
import b1.c;
import b3.j1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/text/handwriting/StylusHandwritingElement;", "Lb3/j1;", "Lb1/c;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class StylusHandwritingElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f14047b;

    public StylusHandwritingElement(Function0 function0) {
        this.f14047b = function0;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new c(this.f14047b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof StylusHandwritingElement) {
            return this.f14047b == ((StylusHandwritingElement) obj).f14047b;
        }
        return false;
    }

    public final int hashCode() {
        return this.f14047b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "stylusHandwriting";
        q2Var.f19407c.b("onHandwritingSlopExceeded", this.f14047b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((c) modifier$Node).f16522a = this.f14047b;
    }
}
