package androidx.compose.animation;

import androidx.compose.ui.Modifier$Node;
import b0.r1;
import b2.d;
import b2.k;
import b3.j1;
import c0.c0;
import c3.q2;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/animation/SizeAnimationModifierElement;", "Lb3/j1;", "Lb0/r1;", "animation"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final /* data */ class SizeAnimationModifierElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final c0 f13868b;

    public SizeAnimationModifierElement(c0 c0Var) {
        this.f13868b = c0Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new r1(this.f13868b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SizeAnimationModifierElement) || !Intrinsics.b(this.f13868b, ((SizeAnimationModifierElement) obj).f13868b)) {
            return false;
        }
        k kVar = d.f16997a;
        return kVar.equals(kVar);
    }

    public final int hashCode() {
        return (Float.hashCode(-1.0f) + (Float.hashCode(-1.0f) * 31) + (this.f13868b.hashCode() * 31)) * 31;
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("animateContentSize");
        q2Var.b().b("animationSpec", this.f13868b);
        q2Var.b().b("alignment", d.f16997a);
        q2Var.b().b("finishedListener", null);
    }

    public final String toString() {
        return "SizeAnimationModifierElement(animationSpec=" + this.f13868b + ", alignment=" + d.f16997a + ", finishedListener=null)";
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        r1 r1Var = (r1) modifier$Node;
        r1Var.f16222a = this.f13868b;
        r1Var.f16223b = d.f16997a;
    }
}
