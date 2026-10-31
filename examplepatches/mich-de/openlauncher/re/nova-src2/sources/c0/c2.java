package c0;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;
import p1.y2;

/* loaded from: classes.dex */
public final class c2 {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f18730a;

    /* renamed from: b, reason: collision with root package name */
    public final c2 f18731b;

    /* renamed from: c, reason: collision with root package name */
    public final String f18732c;

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f18733d;

    /* renamed from: e, reason: collision with root package name */
    public final p1.e1 f18734e;

    /* renamed from: f, reason: collision with root package name */
    public final p1.q2 f18735f = androidx.compose.runtime.d.h(0);

    /* renamed from: g, reason: collision with root package name */
    public final p1.q2 f18736g = androidx.compose.runtime.d.h(Long.MIN_VALUE);

    /* renamed from: h, reason: collision with root package name */
    public final p1.e1 f18737h;

    /* renamed from: i, reason: collision with root package name */
    public final SnapshotStateList f18738i;

    /* renamed from: j, reason: collision with root package name */
    public final SnapshotStateList f18739j;

    /* renamed from: k, reason: collision with root package name */
    public final p1.e1 f18740k;

    /* renamed from: l, reason: collision with root package name */
    public final p1.i0 f18741l;

    public c2(g2 g2Var, c2 c2Var, String str) {
        this.f18730a = g2Var;
        this.f18731b = c2Var;
        this.f18732c = str;
        this.f18733d = androidx.compose.runtime.d.k(g2Var.c());
        this.f18734e = androidx.compose.runtime.d.k(new x1(g2Var.c(), g2Var.c()));
        Boolean bool = Boolean.FALSE;
        this.f18737h = androidx.compose.runtime.d.k(bool);
        this.f18738i = new SnapshotStateList();
        this.f18739j = new SnapshotStateList();
        this.f18740k = androidx.compose.runtime.d.k(bool);
        this.f18741l = androidx.compose.runtime.d.d(new a7.f(this, 4));
        g2Var.h(this);
    }

    public final void a(Object obj, p1.o oVar, int i5) {
        int i11;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-1493585151);
        if ((i5 & 6) == 0) {
            i11 = ((i5 & 8) == 0 ? tVar.f(obj) : tVar.h(obj) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar.f(this) ? 32 : 16;
        }
        if (!tVar.S(i11 & 1, (i11 & 19) != 18)) {
            tVar.V();
        } else if (h()) {
            tVar.b0(467781377);
            tVar.p(false);
        } else {
            tVar.b0(466120769);
            q(obj);
            int i12 = i11 & 112;
            boolean z11 = i12 == 32;
            Object objP = tVar.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (z11 || objP == g1Var) {
                objP = androidx.compose.runtime.d.d(new as.c(this, 10));
                tVar.m0(objP);
            }
            if (((Boolean) ((y2) objP).getValue()).booleanValue()) {
                tVar.b0(466528884);
                Object objP2 = tVar.P();
                if (objP2 == g1Var) {
                    objP2 = p1.o0.i(EmptyCoroutineContext.f71803a, tVar);
                    tVar.m0(objP2);
                }
                t70.j0 j0Var = (t70.j0) objP2;
                boolean zH = tVar.h(j0Var) | (i12 == 32);
                Object objP3 = tVar.P();
                if (zH || objP3 == g1Var) {
                    objP3 = new b00.p0(5, j0Var, this);
                    tVar.m0(objP3);
                }
                p1.o0.a(j0Var, this, (Function1) objP3, tVar);
                tVar.p(false);
            } else {
                tVar.b0(467771457);
                tVar.p(false);
            }
            tVar.p(false);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b10.w(this, obj, i5, 4);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final long b() {
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        long jMax = 0;
        for (int i5 = 0; i5 < size; i5++) {
            jMax = Math.max(jMax, ((y1) snapshotStateList.get(i5)).d());
        }
        SnapshotStateList snapshotStateList2 = this.f18739j;
        int size2 = snapshotStateList2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            jMax = Math.max(jMax, ((c2) snapshotStateList2.get(i11)).b());
        }
        return jMax;
    }

    public final void c() {
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((y1) snapshotStateList.get(i5)).a();
        }
        SnapshotStateList snapshotStateList2 = this.f18739j;
        int size2 = snapshotStateList2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            ((c2) snapshotStateList2.get(i11)).c();
        }
    }

    public final boolean d() {
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (((y1) snapshotStateList.get(i5)).e() != null) {
                return true;
            }
        }
        SnapshotStateList snapshotStateList2 = this.f18739j;
        int size2 = snapshotStateList2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            if (((c2) snapshotStateList2.get(i11)).d()) {
                return true;
            }
        }
        return false;
    }

    public final long e() {
        c2 c2Var = this.f18731b;
        return c2Var != null ? c2Var.e() : this.f18735f.m();
    }

    public final w1 f() {
        return (w1) ((s2) this.f18734e).getValue();
    }

    public final Object g() {
        return ((s2) this.f18733d).getValue();
    }

    public final boolean h() {
        return ((Boolean) ((s2) this.f18740k).getValue()).booleanValue();
    }

    public final void i(long j11, boolean z11) {
        p1.q2 q2Var = this.f18736g;
        long jM = q2Var.m();
        g2 g2Var = this.f18730a;
        if (jM == Long.MIN_VALUE) {
            q2Var.p(j11);
            ((s2) ((p1.e1) g2Var.f18817a)).setValue(Boolean.TRUE);
        } else if (!((Boolean) ((s2) ((p1.e1) g2Var.f18817a)).getValue()).booleanValue()) {
            ((s2) ((p1.e1) g2Var.f18817a)).setValue(Boolean.TRUE);
        }
        ((s2) this.f18737h).setValue(Boolean.FALSE);
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        boolean z12 = true;
        for (int i5 = 0; i5 < size; i5++) {
            y1 y1Var = (y1) snapshotStateList.get(i5);
            if (!y1Var.g()) {
                y1Var.h(j11, z11);
            }
            if (!y1Var.g()) {
                z12 = false;
            }
        }
        SnapshotStateList snapshotStateList2 = this.f18739j;
        int size2 = snapshotStateList2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            c2 c2Var = (c2) snapshotStateList2.get(i11);
            p1.e1 e1Var = c2Var.f18733d;
            g2 g2Var2 = c2Var.f18730a;
            if (!Intrinsics.b(((s2) e1Var).getValue(), g2Var2.c())) {
                c2Var.i(j11, z11);
            }
            if (!Intrinsics.b(((s2) c2Var.f18733d).getValue(), g2Var2.c())) {
                z12 = false;
            }
        }
        if (z12) {
            j();
        }
    }

    public final void j() {
        this.f18736g.p(Long.MIN_VALUE);
        g2 g2Var = this.f18730a;
        if (g2Var instanceof r0) {
            ((r0) g2Var).g(((s2) this.f18733d).getValue());
        }
        o(0L);
        ((s2) ((p1.e1) g2Var.f18817a)).setValue(Boolean.FALSE);
        SnapshotStateList snapshotStateList = this.f18739j;
        int size = snapshotStateList.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((c2) snapshotStateList.get(i5)).j();
        }
    }

    public final void k(float f11) {
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((y1) snapshotStateList.get(i5)).j(f11);
        }
        SnapshotStateList snapshotStateList2 = this.f18739j;
        int size2 = snapshotStateList2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            ((c2) snapshotStateList2.get(i11)).k(f11);
        }
    }

    public final void l(Object obj, Object obj2) {
        this.f18736g.p(Long.MIN_VALUE);
        g2 g2Var = this.f18730a;
        ((s2) ((p1.e1) g2Var.f18817a)).setValue(Boolean.FALSE);
        boolean zH = h();
        p1.e1 e1Var = this.f18733d;
        if (!zH || !Intrinsics.b(g2Var.c(), obj) || !Intrinsics.b(((s2) e1Var).getValue(), obj2)) {
            if (!Intrinsics.b(g2Var.c(), obj) && (g2Var instanceof r0)) {
                ((r0) g2Var).g(obj);
            }
            ((s2) e1Var).setValue(obj2);
            ((s2) this.f18740k).setValue(Boolean.TRUE);
            ((s2) this.f18734e).setValue(new x1(obj, obj2));
        }
        SnapshotStateList snapshotStateList = this.f18739j;
        int size = snapshotStateList.size();
        for (int i5 = 0; i5 < size; i5++) {
            c2 c2Var = (c2) snapshotStateList.get(i5);
            Intrinsics.e(c2Var, "null cannot be cast to non-null type androidx.compose.animation.core.Transition<kotlin.Any>");
            if (c2Var.h()) {
                c2Var.l(c2Var.f18730a.c(), ((s2) c2Var.f18733d).getValue());
            }
        }
        SnapshotStateList snapshotStateList2 = this.f18738i;
        int size2 = snapshotStateList2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            ((y1) snapshotStateList2.get(i11)).k(0L);
        }
    }

    public final void m(long j11) {
        p1.q2 q2Var = this.f18736g;
        if (q2Var.m() == Long.MIN_VALUE) {
            q2Var.p(j11);
        }
        o(j11);
        ((s2) this.f18737h).setValue(Boolean.FALSE);
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((y1) snapshotStateList.get(i5)).k(j11);
        }
        SnapshotStateList snapshotStateList2 = this.f18739j;
        int size2 = snapshotStateList2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            c2 c2Var = (c2) snapshotStateList2.get(i11);
            if (!Intrinsics.b(((s2) c2Var.f18733d).getValue(), c2Var.f18730a.c())) {
                c2Var.m(j11);
            }
        }
    }

    public final void n(a1 a1Var) {
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((y1) snapshotStateList.get(i5)).m(a1Var);
        }
        SnapshotStateList snapshotStateList2 = this.f18739j;
        int size2 = snapshotStateList2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            ((c2) snapshotStateList2.get(i11)).n(a1Var);
        }
    }

    public final void o(long j11) {
        if (this.f18731b == null) {
            this.f18735f.p(j11);
        }
    }

    public final void p() {
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((y1) snapshotStateList.get(i5)).q();
        }
        SnapshotStateList snapshotStateList2 = this.f18739j;
        int size2 = snapshotStateList2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            ((c2) snapshotStateList2.get(i11)).p();
        }
    }

    public final void q(Object obj) {
        p1.e1 e1Var = this.f18733d;
        s2 s2Var = (s2) e1Var;
        if (Intrinsics.b(s2Var.getValue(), obj)) {
            return;
        }
        ((s2) this.f18734e).setValue(new x1(s2Var.getValue(), obj));
        g2 g2Var = this.f18730a;
        if (!Intrinsics.b(g2Var.c(), s2Var.getValue())) {
            g2Var.g(s2Var.getValue());
        }
        ((s2) e1Var).setValue(obj);
        if (this.f18736g.m() == Long.MIN_VALUE) {
            ((s2) this.f18737h).setValue(Boolean.TRUE);
        }
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((y1) snapshotStateList.get(i5)).i();
        }
    }

    public final String toString() {
        SnapshotStateList snapshotStateList = this.f18738i;
        int size = snapshotStateList.size();
        String str = "Transition animation values: ";
        for (int i5 = 0; i5 < size; i5++) {
            str = str + ((y1) snapshotStateList.get(i5)) + ", ";
        }
        return str;
    }
}
