package androidx.compose.foundation;

import a5.d1;
import androidx.compose.ui.Modifier$Node;
import b.c9;
import b3.j1;
import c3.q2;
import e0.a2;
import e0.x1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/ScrollingLayoutElement;", "Lb3/j1;", "Le0/x1;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ScrollingLayoutElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final a2 f13907b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f13908c;

    public ScrollingLayoutElement(a2 a2Var, boolean z11) {
        this.f13907b = a2Var;
        this.f13908c = z11;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        x1 x1Var = new x1();
        x1Var.f50160a = this.f13907b;
        x1Var.f50161b = this.f13908c;
        return x1Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ScrollingLayoutElement)) {
            return false;
        }
        ScrollingLayoutElement scrollingLayoutElement = (ScrollingLayoutElement) obj;
        return Intrinsics.b(this.f13907b, scrollingLayoutElement.f13907b) && this.f13908c == scrollingLayoutElement.f13908c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f13908c) + c9.f(this.f13907b.hashCode() * 31, 31, false);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "scroll";
        d1 d1Var = q2Var.f19407c;
        d1Var.b("state", this.f13907b);
        d1Var.b("reverseScrolling", Boolean.FALSE);
        d1Var.b("isVertical", Boolean.valueOf(this.f13908c));
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        x1 x1Var = (x1) modifier$Node;
        x1Var.f50160a = this.f13907b;
        x1Var.f50161b = this.f13908c;
    }
}
