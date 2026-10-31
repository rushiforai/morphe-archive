package l1;

import androidx.compose.ui.Modifier$Node;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class l9 extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public i0.i f73612a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f73613b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f73614c;

    /* renamed from: d, reason: collision with root package name */
    public c0.e f73615d;

    /* renamed from: e, reason: collision with root package name */
    public c0.e f73616e;

    /* renamed from: f, reason: collision with root package name */
    public float f73617f;

    /* renamed from: g, reason: collision with root package name */
    public float f73618g;

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        float fMo102toPx0680j_4 = t0Var.mo102toPx0680j_4(this.f73614c ? o1.b0.f78958a : ((q0Var.b(y3.a.h(j11)) != 0 && q0Var.F(y3.a.g(j11)) != 0) || this.f73613b) ? androidx.compose.material3.a.f14089a : androidx.compose.material3.a.f14090b);
        c0.e eVar = this.f73616e;
        int iFloatValue = (int) (eVar != null ? ((Number) eVar.e()).floatValue() : fMo102toPx0680j_4);
        if (!((iFloatValue >= 0) & (iFloatValue >= 0))) {
            y3.j.a("width and height must be >= 0");
        }
        z2.i1 i1VarH = q0Var.H(y3.b.h(iFloatValue, iFloatValue, iFloatValue, iFloatValue));
        float fMo102toPx0680j_42 = t0Var.mo102toPx0680j_4((androidx.compose.material3.a.f14092d - t0Var.mo98toDpu2uoSUM(fMo102toPx0680j_4)) / 2.0f);
        float fMo102toPx0680j_43 = t0Var.mo102toPx0680j_4((androidx.compose.material3.a.f14091c - androidx.compose.material3.a.f14089a) - androidx.compose.material3.a.f14093e);
        boolean z11 = this.f73614c;
        if (z11 && this.f73613b) {
            fMo102toPx0680j_42 = fMo102toPx0680j_43 - t0Var.mo102toPx0680j_4(o1.b0.f78962e);
        } else if (z11 && !this.f73613b) {
            fMo102toPx0680j_42 = t0Var.mo102toPx0680j_4(o1.b0.f78962e);
        } else if (this.f73613b) {
            fMo102toPx0680j_42 = fMo102toPx0680j_43;
        }
        c0.e eVar2 = this.f73616e;
        Continuation continuation = null;
        if (!Intrinsics.a(eVar2 != null ? (Float) ((p1.s2) eVar2.f18758e).getValue() : null, fMo102toPx0680j_4)) {
            t70.m0.t(getCoroutineScope(), null, null, new h9(this, fMo102toPx0680j_4, continuation, 0), 3);
        }
        c0.e eVar3 = this.f73615d;
        if (!Intrinsics.a(eVar3 != null ? (Float) ((p1.s2) eVar3.f18758e).getValue() : null, fMo102toPx0680j_42)) {
            t70.m0.t(getCoroutineScope(), null, null, new h9(this, fMo102toPx0680j_42, continuation, 1), 3);
        }
        if (Float.isNaN(this.f73618g) && Float.isNaN(this.f73617f)) {
            this.f73618g = fMo102toPx0680j_4;
            this.f73617f = fMo102toPx0680j_42;
        }
        return t0Var.y(iFloatValue, iFloatValue, b70.h.f17594a, new i9(i1VarH, this, fMo102toPx0680j_42));
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        t70.m0.t(getCoroutineScope(), null, null, new k9(this, null), 3);
    }
}
