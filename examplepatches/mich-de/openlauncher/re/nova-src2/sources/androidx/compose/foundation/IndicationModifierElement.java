package androidx.compose.foundation;

import a5.d1;
import androidx.compose.ui.Modifier$Node;
import b3.j1;
import b3.n;
import c3.q2;
import e0.a1;
import e0.b1;
import i0.i;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/IndicationModifierElement;", "Lb3/j1;", "Le0/a1;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
final class IndicationModifierElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final i f13894b;

    /* renamed from: c, reason: collision with root package name */
    public final b1 f13895c;

    public IndicationModifierElement(i iVar, b1 b1Var) {
        this.f13894b = iVar;
        this.f13895c = b1Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        n nVarA = this.f13895c.a(this.f13894b);
        a1 a1Var = new a1();
        a1Var.f49895a = nVarA;
        a1Var.delegate(nVarA);
        return a1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof IndicationModifierElement)) {
            return false;
        }
        IndicationModifierElement indicationModifierElement = (IndicationModifierElement) obj;
        return Intrinsics.b(this.f13894b, indicationModifierElement.f13894b) && Intrinsics.b(this.f13895c, indicationModifierElement.f13895c);
    }

    public final int hashCode() {
        return this.f13895c.hashCode() + (this.f13894b.hashCode() * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "indication";
        d1 d1Var = q2Var.f19407c;
        d1Var.b("interactionSource", this.f13894b);
        d1Var.b("indication", this.f13895c);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        a1 a1Var = (a1) modifier$Node;
        n nVarA = this.f13895c.a(this.f13894b);
        a1Var.undelegate(a1Var.f49895a);
        a1Var.f49895a = nVarA;
        a1Var.delegate(nVarA);
    }
}
