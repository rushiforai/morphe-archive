package androidx.compose.ui.platform;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.d3;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/platform/TestTagElement;", "Lb3/j1;", "Lc3/d3;", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class TestTagElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final String f14171b;

    public TestTagElement(String str) {
        this.f14171b = str;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        d3 d3Var = new d3();
        d3Var.f19257a = this.f14171b;
        return d3Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof TestTagElement)) {
            return false;
        }
        return Intrinsics.b(this.f14171b, ((TestTagElement) obj).f14171b);
    }

    public final int hashCode() {
        return this.f14171b.hashCode();
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "testTag";
        q2Var.f19407c.b("tag", this.f14171b);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((d3) modifier$Node).f19257a = this.f14171b;
    }
}
