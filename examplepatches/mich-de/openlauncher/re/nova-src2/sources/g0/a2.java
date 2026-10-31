package g0;

import android.view.KeyEvent;
import android.view.ViewConfiguration;
import android.widget.EdgeEffect;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public final class a2 extends g0 implements t2.d, b3.p2, b3.m {

    /* renamed from: j, reason: collision with root package name */
    public e0.n1 f56453j;

    /* renamed from: k, reason: collision with root package name */
    public m0 f56454k;

    /* renamed from: l, reason: collision with root package name */
    public final x7.h f56455l;

    /* renamed from: m, reason: collision with root package name */
    public final o1 f56456m;
    public final j n;
    public final h2 o;

    /* renamed from: p, reason: collision with root package name */
    public final v1 f56457p;

    /* renamed from: q, reason: collision with root package name */
    public final g f56458q;

    /* renamed from: r, reason: collision with root package name */
    public e10.j2 f56459r;

    /* renamed from: s, reason: collision with root package name */
    public z1 f56460s;

    /* renamed from: t, reason: collision with root package name */
    public c1 f56461t;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v3, types: [g0.m0] */
    public a2(e0.n1 n1Var, c cVar, m0 m0Var, d1 d1Var, b2 b2Var, i0.i iVar, boolean z11, boolean z12) {
        super(androidx.compose.foundation.gestures.a.f13929a, z11, iVar, d1Var);
        this.f56453j = n1Var;
        this.f56454k = m0Var;
        x7.h hVar = new x7.h(9);
        this.f56455l = hVar;
        this.f56456m = (o1) delegate(new o1(z11));
        j jVar = new j(new c0.y(new vm.c(androidx.compose.foundation.gestures.a.f13932d)));
        this.n = jVar;
        e0.n1 n1Var2 = this.f56453j;
        ?? r12 = this.f56454k;
        h2 h2Var = new h2(b2Var, n1Var2, r12 == 0 ? jVar : r12, d1Var, z12, hVar, this, new a7.f(this, 14));
        this.o = h2Var;
        v1 v1Var = new v1(h2Var, z11);
        this.f56457p = v1Var;
        g gVar = (g) delegate(new g(d1Var, h2Var, z12, cVar));
        this.f56458q = gVar;
        delegate(new u2.f(v1Var, hVar));
        delegate(new g2.z(2, 4, null));
        q0.e eVar = new q0.e();
        eVar.f83318a = gVar;
        delegate(eVar);
        delegate(new e0.m0(new b00.t(this, 11)));
    }

    @Override // g0.g0
    public final Object H(e0 e0Var, f0 f0Var) {
        e0.f1 f1Var = e0.f1.f49977b;
        h2 h2Var = this.o;
        Object objF = h2Var.f(f1Var, new dm.c(e0Var, h2Var, (Continuation) null, 16), f0Var);
        return objF == CoroutineSingletons.f71806a ? objF : Unit.f71706a;
    }

    @Override // g0.g0
    public final void I(long j11) {
    }

    @Override // g0.g0
    public final void M(long j11) {
        t70.m0.t(this.f56455l.h(), null, null, new w1(this, j11, null, 0), 3);
    }

    @Override // g0.g0
    public final boolean N() {
        h2 h2Var = this.o;
        if (h2Var.f56557a.b()) {
            return true;
        }
        e0.n1 n1Var = h2Var.f56558b;
        if (n1Var == null) {
            return false;
        }
        e0.k0 k0Var = ((e0.k) n1Var).f50037c;
        EdgeEffect edgeEffect = k0Var.f50047d;
        if (edgeEffect != null && jk.b.C(edgeEffect) != 0.0f) {
            return true;
        }
        EdgeEffect edgeEffect2 = k0Var.f50048e;
        if (edgeEffect2 != null && jk.b.C(edgeEffect2) != 0.0f) {
            return true;
        }
        EdgeEffect edgeEffect3 = k0Var.f50049f;
        if (edgeEffect3 != null && jk.b.C(edgeEffect3) != 0.0f) {
            return true;
        }
        EdgeEffect edgeEffect4 = k0Var.f50050g;
        return (edgeEffect4 == null || jk.b.C(edgeEffect4) == 0.0f) ? false : true;
    }

    public final void P(e0.n1 n1Var, c cVar, m0 m0Var, d1 d1Var, b2 b2Var, i0.i iVar, boolean z11, boolean z12) {
        boolean z13;
        boolean z14 = true;
        boolean z15 = false;
        if (this.f56535c != z11) {
            this.f56457p.f56730b = z11;
            this.f56456m.f56645b = z11;
            z13 = true;
        } else {
            z13 = false;
        }
        m0 m0Var2 = m0Var == null ? this.n : m0Var;
        h2 h2Var = this.o;
        if (!Intrinsics.b(h2Var.f56557a, b2Var)) {
            h2Var.f56557a = b2Var;
            z15 = true;
        }
        h2Var.f56558b = n1Var;
        if (h2Var.f56560d != d1Var) {
            h2Var.f56560d = d1Var;
            z15 = true;
        }
        if (h2Var.f56561e != z12) {
            h2Var.f56561e = z12;
        } else {
            z14 = z15;
        }
        h2Var.f56559c = m0Var2;
        h2Var.f56562f = this.f56455l;
        g gVar = this.f56458q;
        gVar.f56523a = d1Var;
        gVar.f56525c = z12;
        gVar.f56526d = cVar;
        this.f56453j = n1Var;
        this.f56454k = m0Var;
        e10.h2 h2Var2 = androidx.compose.foundation.gestures.a.f13929a;
        d1 d1Var2 = h2Var.f56560d;
        d1 d1Var3 = d1.f56493a;
        if (d1Var2 != d1Var3) {
            d1Var3 = d1.f56494b;
        }
        O(h2Var2, z11, iVar, d1Var3, z14);
        if (z13) {
            this.f56459r = null;
            this.f56460s = null;
            b3.o.f(this).invalidateSemantics$ui_release();
        }
    }

    @Override // b3.p2
    public final void applySemantics(j3.b0 b0Var) {
        if (this.f56535c && (this.f56459r == null || this.f56460s == null)) {
            this.f56459r = new e10.j2(this, 2);
            this.f56460s = new z1(this, null);
        }
        e10.j2 j2Var = this.f56459r;
        if (j2Var != null) {
            KProperty[] kPropertyArr = j3.y.f68878a;
            ((j3.k) b0Var).f(j3.j.f68791d, new j3.a(null, j2Var));
        }
        z1 z1Var = this.f56460s;
        if (z1Var != null) {
            KProperty[] kPropertyArr2 = j3.y.f68878a;
            ((j3.k) b0Var).f(j3.j.f68792e, z1Var);
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // t2.d
    public final boolean n(KeyEvent keyEvent) {
        return false;
    }

    @Override // t2.d
    public final boolean o(KeyEvent keyEvent) {
        long jFloatToRawIntBits;
        int iFloatToRawIntBits;
        if (!this.f56535c) {
            return false;
        }
        long jV = t2.c.v(keyEvent);
        int i5 = t2.a.f88473p;
        if ((!t2.a.a(jV, p10.y1.O()) && !t2.a.a(t2.c.v(keyEvent), p10.y1.P())) || !p3.i.t(t2.c.x(keyEvent), 2) || t2.c.B(keyEvent)) {
            return false;
        }
        d1 d1Var = this.o.f56560d;
        d1 d1Var2 = d1.f56493a;
        g gVar = this.f56458q;
        if (d1Var == d1Var2) {
            int i11 = (int) (gVar.f56531i & 4294967295L);
            float f11 = t2.a.a(t2.c.v(keyEvent), p10.y1.P()) ? i11 : -i11;
            jFloatToRawIntBits = Float.floatToRawIntBits(0.0f);
            iFloatToRawIntBits = Float.floatToRawIntBits(f11);
        } else {
            int i12 = (int) (gVar.f56531i >> 32);
            jFloatToRawIntBits = Float.floatToRawIntBits(t2.a.a(t2.c.v(keyEvent), p10.y1.P()) ? i12 : -i12);
            iFloatToRawIntBits = Float.floatToRawIntBits(0.0f);
        }
        t70.m0.t(getCoroutineScope(), null, null, new w1(this, (jFloatToRawIntBits << 32) | (iFloatToRawIntBits & 4294967295L), null, 1), 3);
        return true;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        if (getIsAttached()) {
            y3.c density = b3.o.f(this).getDensity();
            j jVar = this.n;
            jVar.getClass();
            jVar.f56586a = new c0.y(new vm.c(density));
        }
        c1 c1Var = this.f56461t;
        if (c1Var != null) {
            c1Var.h(b3.o.f(this).getDensity());
        }
    }

    @Override // androidx.compose.ui.node.DelegatingNode, androidx.compose.ui.Modifier$Node
    public final void onDensityChange() {
        onCancelPointerInput();
        if (getIsAttached()) {
            y3.c density = b3.o.f(this).getDensity();
            j jVar = this.n;
            jVar.getClass();
            jVar.f56586a = new c0.y(new vm.c(density));
        }
        c1 c1Var = this.f56461t;
        if (c1Var != null) {
            c1Var.h(b3.o.f(this).getDensity());
        }
    }

    @Override // g0.g0, b3.l2
    /* renamed from: onPointerEvent-H0pRuoY */
    public final void mo26onPointerEventH0pRuoY(v2.m mVar, v2.n nVar, long j11) {
        List list = mVar.f91975a;
        int size = list.size();
        int i5 = 0;
        while (true) {
            if (i5 >= size) {
                break;
            }
            if (((Boolean) this.f56534b.invoke((v2.t) list.get(i5))).booleanValue()) {
                super.mo26onPointerEventH0pRuoY(mVar, nVar, j11);
                break;
            }
            i5++;
        }
        if (this.f56535c) {
            if (nVar == v2.n.f91980a && mVar.f91979e == 6) {
                if (this.f56461t == null) {
                    this.f56461t = new c1(this.o, new vm.c(ViewConfiguration.get(b3.g.g(this).getContext()), 12), new es.b0(this), b3.o.f(this).getDensity());
                }
                c1 c1Var = this.f56461t;
                if (c1Var != null) {
                    c1Var.e(getCoroutineScope());
                }
            }
            c1 c1Var2 = this.f56461t;
            if (c1Var2 != null) {
                c1Var2.d(mVar, nVar);
            }
        }
    }
}
