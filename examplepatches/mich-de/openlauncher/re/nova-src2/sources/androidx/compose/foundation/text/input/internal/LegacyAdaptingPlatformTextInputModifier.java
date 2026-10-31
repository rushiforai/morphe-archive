package androidx.compose.foundation.text.input.internal;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c1.c;
import c1.n;
import c3.q2;
import e1.a1;
import j0.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import t0.y0;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/text/input/internal/LegacyAdaptingPlatformTextInputModifier;", "Lb3/j1;", "Lc1/n;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final /* data */ class LegacyAdaptingPlatformTextInputModifier extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final c f14057b;

    /* renamed from: c, reason: collision with root package name */
    public final y0 f14058c;

    /* renamed from: d, reason: collision with root package name */
    public final a1 f14059d;

    public LegacyAdaptingPlatformTextInputModifier(c cVar, y0 y0Var, a1 a1Var) {
        this.f14057b = cVar;
        this.f14058c = y0Var;
        this.f14059d = a1Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new n(this.f14057b, this.f14058c, this.f14059d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LegacyAdaptingPlatformTextInputModifier)) {
            return false;
        }
        LegacyAdaptingPlatformTextInputModifier legacyAdaptingPlatformTextInputModifier = (LegacyAdaptingPlatformTextInputModifier) obj;
        return Intrinsics.b(this.f14057b, legacyAdaptingPlatformTextInputModifier.f14057b) && Intrinsics.b(this.f14058c, legacyAdaptingPlatformTextInputModifier.f14058c) && Intrinsics.b(this.f14059d, legacyAdaptingPlatformTextInputModifier.f14059d);
    }

    public final int hashCode() {
        return this.f14059d.hashCode() + ((this.f14058c.hashCode() + (this.f14057b.hashCode() * 31)) * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
    }

    public final String toString() {
        return "LegacyAdaptingPlatformTextInputModifier(serviceAdapter=" + this.f14057b + ", legacyTextFieldState=" + this.f14058c + ", textFieldSelectionManager=" + this.f14059d + ')';
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) throws Throwable {
        n nVar = (n) modifier$Node;
        if (nVar.getIsAttached()) {
            nVar.f19100a.d();
            nVar.f19100a.k(nVar);
        }
        nVar.f19100a = this.f14057b;
        if (nVar.getIsAttached()) {
            c cVar = nVar.f19100a;
            if (cVar.f19073a != null) {
                b.c("Expected textInputModifierNode to be null");
            }
            cVar.f19073a = nVar;
        }
        nVar.f19101b = this.f14058c;
        nVar.f19102c = this.f14059d;
    }
}
