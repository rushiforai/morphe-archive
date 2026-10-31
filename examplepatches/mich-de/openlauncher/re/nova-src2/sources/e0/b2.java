package e0;

import androidx.compose.ui.node.DelegatingNode;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class b2 extends DelegatingNode implements b3.m, b3.z1 {

    /* renamed from: a, reason: collision with root package name */
    public g0.b2 f49911a;

    /* renamed from: b, reason: collision with root package name */
    public g0.d1 f49912b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f49913c;

    /* renamed from: d, reason: collision with root package name */
    public g0.m0 f49914d;

    /* renamed from: e, reason: collision with root package name */
    public i0.i f49915e;

    /* renamed from: f, reason: collision with root package name */
    public g0.c f49916f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f49917g;

    /* renamed from: h, reason: collision with root package name */
    public n1 f49918h;

    /* renamed from: i, reason: collision with root package name */
    public g0.a2 f49919i;

    /* renamed from: j, reason: collision with root package name */
    public b3.n f49920j;

    /* renamed from: k, reason: collision with root package name */
    public l f49921k;

    /* renamed from: l, reason: collision with root package name */
    public k f49922l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f49923m;

    public final void B() {
        b3.n nVar = this.f49920j;
        if (nVar != null) {
            if (nVar.getNode().getIsAttached()) {
                return;
            }
            delegate(nVar);
            return;
        }
        if (this.f49917g) {
            b3.g.f(this, new d00.t(this, 9));
        }
        Object obj = this.f49917g ? this.f49922l : this.f49918h;
        if (obj != null) {
            DelegatingNode delegatingNode = ((k) obj).f50043i;
            if (delegatingNode.getNode().getIsAttached()) {
                return;
            }
            this.f49920j = delegate(delegatingNode);
        }
    }

    public final boolean D() {
        y3.n layoutDirection = y3.n.f96612a;
        if (getIsAttached()) {
            layoutDirection = b3.o.f(this).getLayoutDirection();
        }
        return layoutDirection != y3.n.f96613b || this.f49912b == g0.d1.f56493a;
    }

    public final void E(n1 n1Var, g0.c cVar, g0.m0 m0Var, g0.d1 d1Var, g0.b2 b2Var, i0.i iVar, boolean z11, boolean z12) {
        boolean z13;
        this.f49911a = b2Var;
        this.f49912b = d1Var;
        boolean z14 = true;
        if (this.f49917g != z11) {
            this.f49917g = z11;
            z13 = true;
        } else {
            z13 = false;
        }
        if (Intrinsics.b(this.f49918h, n1Var)) {
            z14 = false;
        } else {
            this.f49918h = n1Var;
        }
        if (z13 || (z14 && !z11)) {
            b3.n nVar = this.f49920j;
            if (nVar != null) {
                undelegate(nVar);
            }
            this.f49920j = null;
            B();
        }
        this.f49913c = z12;
        this.f49914d = m0Var;
        this.f49915e = iVar;
        this.f49916f = cVar;
        boolean zD = D();
        this.f49923m = zD;
        g0.a2 a2Var = this.f49919i;
        if (a2Var != null) {
            a2Var.P(this.f49917g ? this.f49922l : this.f49918h, cVar, m0Var, d1Var, b2Var, iVar, z12, zD);
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // b3.z1
    public final void k() {
        l lVar = (l) b3.g.c(this, o1.f50088a);
        if (Intrinsics.b(lVar, this.f49921k)) {
            return;
        }
        this.f49921k = lVar;
        this.f49922l = null;
        b3.n nVar = this.f49920j;
        if (nVar != null) {
            undelegate(nVar);
        }
        this.f49920j = null;
        B();
        g0.a2 a2Var = this.f49919i;
        if (a2Var != null) {
            g0.b2 b2Var = this.f49911a;
            g0.d1 d1Var = this.f49912b;
            n1 n1Var = this.f49917g ? this.f49922l : this.f49918h;
            a2Var.P(n1Var, this.f49916f, this.f49914d, d1Var, b2Var, this.f49915e, this.f49913c, this.f49923m);
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        this.f49923m = D();
        B();
        if (this.f49919i == null) {
            g0.b2 b2Var = this.f49911a;
            n1 n1Var = this.f49917g ? this.f49922l : this.f49918h;
            this.f49919i = (g0.a2) delegate(new g0.a2(n1Var, this.f49916f, this.f49914d, this.f49912b, b2Var, this.f49915e, this.f49913c, this.f49923m));
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        b3.n nVar = this.f49920j;
        if (nVar != null) {
            undelegate(nVar);
        }
    }

    @Override // androidx.compose.ui.node.DelegatingNode, androidx.compose.ui.Modifier$Node
    public final void onLayoutDirectionChange() {
        boolean zD = D();
        if (this.f49923m != zD) {
            this.f49923m = zD;
            g0.b2 b2Var = this.f49911a;
            g0.d1 d1Var = this.f49912b;
            boolean z11 = this.f49917g;
            n1 n1Var = z11 ? this.f49922l : this.f49918h;
            E(n1Var, this.f49916f, this.f49914d, d1Var, b2Var, this.f49915e, z11, this.f49913c);
        }
    }
}
