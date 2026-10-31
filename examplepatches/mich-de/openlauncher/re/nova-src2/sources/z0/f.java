package z0;

import a1.k;
import androidx.compose.ui.node.DelegatingNode;
import b3.m;
import e1.p0;
import e1.q0;
import e1.r0;
import p1.i0;
import t70.g2;
import z2.y;

/* loaded from: classes2.dex */
public final class f extends DelegatingNode implements m, k {

    /* renamed from: a, reason: collision with root package name */
    public y90.f f97883a;

    /* renamed from: b, reason: collision with root package name */
    public q0 f97884b;

    /* renamed from: c, reason: collision with root package name */
    public r0 f97885c;

    /* renamed from: d, reason: collision with root package name */
    public p0 f97886d;

    /* renamed from: e, reason: collision with root package name */
    public g2 f97887e;

    /* renamed from: f, reason: collision with root package name */
    public final i0 f97888f = androidx.compose.runtime.d.d(new xu.d(this, 9));

    /* renamed from: g, reason: collision with root package name */
    public h2.c f97889g = h2.c.f59017e;

    public f(y90.f fVar, q0 q0Var, r0 r0Var, p0 p0Var) {
        this.f97883a = fVar;
        this.f97884b = q0Var;
        this.f97885c = r0Var;
        this.f97886d = p0Var;
    }

    @Override // a1.k
    public final w0.c i() {
        return (w0.c) this.f97888f.getValue();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        super.onAttach();
        this.f97883a.f97028a = this;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        this.f97883a.f97028a = null;
        super.onDetach();
    }

    @Override // a1.k
    public final long x(y yVar) {
        return z(yVar).d();
    }

    @Override // a1.k
    public final h2.c z(y yVar) {
        if (!getIsAttached()) {
            return this.f97889g;
        }
        h2.c cVar = (h2.c) this.f97886d.invoke(yVar);
        this.f97889g = cVar;
        return cVar;
    }
}
