package androidx.compose.foundation.lazy.layout;

import a5.d1;
import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c0.c0;
import c0.l1;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import n0.h;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/lazy/layout/LazyLayoutAnimateItemElement;", "Lb3/j1;", "Ln0/h;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class LazyLayoutAnimateItemElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final c0 f13981b;

    /* renamed from: c, reason: collision with root package name */
    public final l1 f13982c;

    /* renamed from: d, reason: collision with root package name */
    public final c0 f13983d;

    public LazyLayoutAnimateItemElement(c0 c0Var, l1 l1Var, c0 c0Var2) {
        this.f13981b = c0Var;
        this.f13982c = l1Var;
        this.f13983d = c0Var2;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        h hVar = new h();
        hVar.f77422a = this.f13981b;
        hVar.f77423b = this.f13982c;
        hVar.f77424c = this.f13983d;
        return hVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LazyLayoutAnimateItemElement)) {
            return false;
        }
        LazyLayoutAnimateItemElement lazyLayoutAnimateItemElement = (LazyLayoutAnimateItemElement) obj;
        return Intrinsics.b(this.f13981b, lazyLayoutAnimateItemElement.f13981b) && this.f13982c.equals(lazyLayoutAnimateItemElement.f13982c) && Intrinsics.b(this.f13983d, lazyLayoutAnimateItemElement.f13983d);
    }

    public final int hashCode() {
        c0 c0Var = this.f13981b;
        int iHashCode = (this.f13982c.hashCode() + ((c0Var == null ? 0 : c0Var.hashCode()) * 31)) * 31;
        c0 c0Var2 = this.f13983d;
        return iHashCode + (c0Var2 != null ? c0Var2.hashCode() : 0);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "animateItem";
        d1 d1Var = q2Var.f19407c;
        d1Var.b("fadeInSpec", this.f13981b);
        d1Var.b("placementSpec", this.f13982c);
        d1Var.b("fadeOutSpec", this.f13983d);
    }

    public final String toString() {
        return "LazyLayoutAnimateItemElement(fadeInSpec=" + this.f13981b + ", placementSpec=" + this.f13982c + ", fadeOutSpec=" + this.f13983d + ')';
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        h hVar = (h) modifier$Node;
        hVar.f77422a = this.f13981b;
        hVar.f77423b = this.f13982c;
        hVar.f77424c = this.f13983d;
    }
}
