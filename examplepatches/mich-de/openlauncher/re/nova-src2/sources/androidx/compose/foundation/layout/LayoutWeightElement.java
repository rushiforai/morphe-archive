package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import k0.g1;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/LayoutWeightElement;", "Lb3/j1;", "Lk0/g1;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LayoutWeightElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final float f13941b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f13942c;

    public LayoutWeightElement(float f11, boolean z11) {
        this.f13941b = f11;
        this.f13942c = z11;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        g1 g1Var = new g1();
        g1Var.f70611a = this.f13941b;
        g1Var.f70612b = this.f13942c;
        return g1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        LayoutWeightElement layoutWeightElement = obj instanceof LayoutWeightElement ? (LayoutWeightElement) obj : null;
        return layoutWeightElement != null && this.f13941b == layoutWeightElement.f13941b && this.f13942c == layoutWeightElement.f13942c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f13942c) + (Float.hashCode(this.f13941b) * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("weight");
        float f11 = this.f13941b;
        q2Var.e(Float.valueOf(f11));
        q2Var.b().b("weight", Float.valueOf(f11));
        q2Var.b().b("fill", Boolean.valueOf(this.f13942c));
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        g1 g1Var = (g1) modifier$Node;
        g1Var.f70611a = this.f13941b;
        g1Var.f70612b = this.f13942c;
    }
}
