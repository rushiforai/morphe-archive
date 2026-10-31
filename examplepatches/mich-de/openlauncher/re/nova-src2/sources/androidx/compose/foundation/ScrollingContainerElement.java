package androidx.compose.foundation;

import androidx.compose.ui.Modifier$Node;
import b.c9;
import b3.j1;
import c3.q2;
import e0.n1;
import g0.b2;
import g0.d1;
import g0.m0;
import i0.i;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/ScrollingContainerElement;", "Lb3/j1;", "Le0/b2;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class ScrollingContainerElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final b2 f13899b;

    /* renamed from: c, reason: collision with root package name */
    public final d1 f13900c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f13901d;

    /* renamed from: e, reason: collision with root package name */
    public final m0 f13902e;

    /* renamed from: f, reason: collision with root package name */
    public final i f13903f;

    /* renamed from: g, reason: collision with root package name */
    public final g0.c f13904g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f13905h;

    /* renamed from: i, reason: collision with root package name */
    public final n1 f13906i;

    public ScrollingContainerElement(n1 n1Var, g0.c cVar, m0 m0Var, d1 d1Var, b2 b2Var, i iVar, boolean z11, boolean z12) {
        this.f13899b = b2Var;
        this.f13900c = d1Var;
        this.f13901d = z11;
        this.f13902e = m0Var;
        this.f13903f = iVar;
        this.f13904g = cVar;
        this.f13905h = z12;
        this.f13906i = n1Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        e0.b2 b2Var = new e0.b2();
        b2Var.f49911a = this.f13899b;
        b2Var.f49912b = this.f13900c;
        b2Var.f49913c = this.f13901d;
        b2Var.f49914d = this.f13902e;
        b2Var.f49915e = this.f13903f;
        b2Var.f49916f = this.f13904g;
        b2Var.f49917g = this.f13905h;
        b2Var.f49918h = this.f13906i;
        return b2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || ScrollingContainerElement.class != obj.getClass()) {
            return false;
        }
        ScrollingContainerElement scrollingContainerElement = (ScrollingContainerElement) obj;
        return Intrinsics.b(this.f13899b, scrollingContainerElement.f13899b) && this.f13900c == scrollingContainerElement.f13900c && this.f13901d == scrollingContainerElement.f13901d && Intrinsics.b(this.f13902e, scrollingContainerElement.f13902e) && Intrinsics.b(this.f13903f, scrollingContainerElement.f13903f) && Intrinsics.b(this.f13904g, scrollingContainerElement.f13904g) && this.f13905h == scrollingContainerElement.f13905h && Intrinsics.b(this.f13906i, scrollingContainerElement.f13906i);
    }

    public final int hashCode() {
        int iF = c9.f(c9.f((this.f13900c.hashCode() + (this.f13899b.hashCode() * 31)) * 31, 31, this.f13901d), 31, false);
        m0 m0Var = this.f13902e;
        int iHashCode = (iF + (m0Var != null ? m0Var.hashCode() : 0)) * 31;
        i iVar = this.f13903f;
        int iHashCode2 = (iHashCode + (iVar != null ? iVar.hashCode() : 0)) * 31;
        g0.c cVar = this.f13904g;
        int iF2 = c9.f((iHashCode2 + (cVar != null ? cVar.hashCode() : 0)) * 31, 31, this.f13905h);
        n1 n1Var = this.f13906i;
        return iF2 + (n1Var != null ? n1Var.hashCode() : 0);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "scrollingContainer";
        a5.d1 d1Var = q2Var.f19407c;
        d1Var.b("state", this.f13899b);
        d1Var.b("orientation", this.f13900c);
        d1Var.b("enabled", Boolean.valueOf(this.f13901d));
        d1Var.b("reverseScrolling", Boolean.FALSE);
        d1Var.b("flingBehavior", this.f13902e);
        d1Var.b("interactionSource", this.f13903f);
        d1Var.b("bringIntoViewSpec", this.f13904g);
        d1Var.b("useLocalOverscrollFactory", Boolean.valueOf(this.f13905h));
        d1Var.b("overscrollEffect", this.f13906i);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        i iVar = this.f13903f;
        ((e0.b2) modifier$Node).E(this.f13906i, this.f13904g, this.f13902e, this.f13900c, this.f13899b, iVar, this.f13905h, this.f13901d);
    }
}
