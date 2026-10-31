package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b2.f;
import b3.j1;
import c3.q2;
import k0.m;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/BoxChildDataElement;", "Lb3/j1;", "Lk0/m;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class BoxChildDataElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final f f13933b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f13934c;

    public BoxChildDataElement(f fVar, boolean z11) {
        this.f13933b = fVar;
        this.f13934c = z11;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        m mVar = new m();
        mVar.f70675a = this.f13933b;
        mVar.f70676b = this.f13934c;
        return mVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        BoxChildDataElement boxChildDataElement = obj instanceof BoxChildDataElement ? (BoxChildDataElement) obj : null;
        return boxChildDataElement != null && Intrinsics.b(this.f13933b, boxChildDataElement.f13933b) && this.f13934c == boxChildDataElement.f13934c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f13934c) + (this.f13933b.hashCode() * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        Unit unit = Unit.f71706a;
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        m mVar = (m) modifier$Node;
        mVar.f70675a = this.f13933b;
        mVar.f70676b = this.f13934c;
    }
}
