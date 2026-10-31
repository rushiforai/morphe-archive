package androidx.compose.foundation.lazy.layout;

import androidx.compose.ui.Modifier$Node;
import b.c9;
import b3.j1;
import c3.q2;
import g0.d1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import n0.j;
import n0.m;
import n0.n;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsModifierElement;", "Lb3/j1;", "Ln0/m;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class LazyLayoutBeyondBoundsModifierElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final n f13984b;

    /* renamed from: c, reason: collision with root package name */
    public final j f13985c;

    /* renamed from: d, reason: collision with root package name */
    public final d1 f13986d;

    public LazyLayoutBeyondBoundsModifierElement(n nVar, j jVar, d1 d1Var) {
        this.f13984b = nVar;
        this.f13985c = jVar;
        this.f13986d = d1Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        m mVar = new m();
        mVar.f77451a = this.f13984b;
        mVar.f77452b = this.f13985c;
        mVar.f77453c = this.f13986d;
        return mVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LazyLayoutBeyondBoundsModifierElement)) {
            return false;
        }
        LazyLayoutBeyondBoundsModifierElement lazyLayoutBeyondBoundsModifierElement = (LazyLayoutBeyondBoundsModifierElement) obj;
        return Intrinsics.b(this.f13984b, lazyLayoutBeyondBoundsModifierElement.f13984b) && Intrinsics.b(this.f13985c, lazyLayoutBeyondBoundsModifierElement.f13985c) && this.f13986d == lazyLayoutBeyondBoundsModifierElement.f13986d;
    }

    public final int hashCode() {
        return this.f13986d.hashCode() + c9.f((this.f13985c.hashCode() + (this.f13984b.hashCode() * 31)) * 31, 31, false);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        m mVar = (m) modifier$Node;
        mVar.f77451a = this.f13984b;
        mVar.f77452b = this.f13985c;
        mVar.f77453c = this.f13986d;
    }
}
