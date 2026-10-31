package c1;

import androidx.compose.ui.Modifier$Node;
import e1.a1;
import p1.e1;
import p1.s2;
import t0.y0;
import z2.y;

/* loaded from: classes.dex */
public final class n extends Modifier$Node implements b3.m, b3.r, b3.n {

    /* renamed from: a, reason: collision with root package name */
    public c f19100a;

    /* renamed from: b, reason: collision with root package name */
    public y0 f19101b;

    /* renamed from: c, reason: collision with root package name */
    public a1 f19102c;

    /* renamed from: d, reason: collision with root package name */
    public final e1 f19103d = androidx.compose.runtime.d.k(null);

    public n(c cVar, y0 y0Var, a1 a1Var) {
        this.f19100a = cVar;
        this.f19101b = y0Var;
        this.f19102c = a1Var;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        c cVar = this.f19100a;
        if (cVar.f19073a != null) {
            j0.b.c("Expected textInputModifierNode to be null");
        }
        cVar.f19073a = this;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        this.f19100a.k(this);
    }

    @Override // b3.r
    public final void onGloballyPositioned(y yVar) {
        ((s2) this.f19103d).setValue(yVar);
    }
}
