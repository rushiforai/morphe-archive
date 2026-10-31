package androidx.compose.foundation.gestures;

import androidx.compose.ui.Modifier$Node;
import b.c9;
import b3.j1;
import c3.q2;
import g0.a2;
import g0.b2;
import g0.d1;
import i0.i;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/gestures/ScrollableElement;", "Lb3/j1;", "Lg0/a2;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class ScrollableElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final b2 f13924b;

    /* renamed from: c, reason: collision with root package name */
    public final d1 f13925c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f13926d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f13927e;

    /* renamed from: f, reason: collision with root package name */
    public final i f13928f;

    public ScrollableElement(b2 b2Var, d1 d1Var, boolean z11, boolean z12, i iVar) {
        this.f13924b = b2Var;
        this.f13925c = d1Var;
        this.f13926d = z11;
        this.f13927e = z12;
        this.f13928f = iVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new a2(null, null, null, this.f13925c, this.f13924b, this.f13928f, this.f13926d, this.f13927e);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ScrollableElement)) {
            return false;
        }
        ScrollableElement scrollableElement = (ScrollableElement) obj;
        return Intrinsics.b(this.f13924b, scrollableElement.f13924b) && this.f13925c == scrollableElement.f13925c && this.f13926d == scrollableElement.f13926d && this.f13927e == scrollableElement.f13927e && Intrinsics.b(this.f13928f, scrollableElement.f13928f);
    }

    public final int hashCode() {
        int iF = c9.f(c9.f((this.f13925c.hashCode() + (this.f13924b.hashCode() * 31)) * 961, 31, this.f13926d), 961, this.f13927e);
        i iVar = this.f13928f;
        return (iF + (iVar != null ? iVar.hashCode() : 0)) * 31;
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("scrollable");
        q2Var.b().b("orientation", this.f13925c);
        q2Var.b().b("state", this.f13924b);
        q2Var.b().b("overscrollEffect", null);
        q2Var.b().b("enabled", Boolean.valueOf(this.f13926d));
        q2Var.b().b("reverseDirection", Boolean.valueOf(this.f13927e));
        q2Var.b().b("flingBehavior", null);
        q2Var.b().b("interactionSource", this.f13928f);
        q2Var.b().b("bringIntoViewSpec", null);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        ((a2) modifier$Node).P(null, null, null, this.f13925c, this.f13924b, this.f13928f, this.f13926d, this.f13927e);
    }
}
