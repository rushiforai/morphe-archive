package e1;

import android.content.ClipData;
import c3.t1;
import c3.u1;
import e00.a5;
import e10.z2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;
import t0.a2;
import t0.b2;
import t0.w1;
import t70.g2;

/* loaded from: classes.dex */
public final class a1 {
    public boolean A;

    /* renamed from: a, reason: collision with root package name */
    public final a2 f51229a;

    /* renamed from: d, reason: collision with root package name */
    public t0.y0 f51232d;

    /* renamed from: f, reason: collision with root package name */
    public Function0 f51234f;

    /* renamed from: g, reason: collision with root package name */
    public u1 f51235g;

    /* renamed from: h, reason: collision with root package name */
    public t70.j0 f51236h;

    /* renamed from: i, reason: collision with root package name */
    public n f51237i;

    /* renamed from: j, reason: collision with root package name */
    public q2.a f51238j;

    /* renamed from: k, reason: collision with root package name */
    public g2.s f51239k;

    /* renamed from: l, reason: collision with root package name */
    public final p1.e1 f51240l;

    /* renamed from: m, reason: collision with root package name */
    public final p1.e1 f51241m;
    public long n;
    public m3.o0 o;

    /* renamed from: p, reason: collision with root package name */
    public long f51242p;

    /* renamed from: q, reason: collision with root package name */
    public final p1.e1 f51243q;

    /* renamed from: r, reason: collision with root package name */
    public final p1.e1 f51244r;

    /* renamed from: s, reason: collision with root package name */
    public int f51245s;

    /* renamed from: t, reason: collision with root package name */
    public r3.z f51246t;

    /* renamed from: u, reason: collision with root package name */
    public m0 f51247u;

    /* renamed from: v, reason: collision with root package name */
    public m3.o0 f51248v;

    /* renamed from: w, reason: collision with root package name */
    public final p1.e1 f51249w;

    /* renamed from: x, reason: collision with root package name */
    public final y90.f f51250x;

    /* renamed from: y, reason: collision with root package name */
    public final y0 f51251y;

    /* renamed from: z, reason: collision with root package name */
    public final w0 f51252z;

    /* renamed from: b, reason: collision with root package name */
    public r3.s f51230b = b2.f87929a;

    /* renamed from: c, reason: collision with root package name */
    public Function1 f51231c = new b00.m(27);

    /* renamed from: e, reason: collision with root package name */
    public final p1.e1 f51233e = androidx.compose.runtime.d.k(new r3.z((String) null, 0, 7));

    public a1(a2 a2Var) {
        this.f51229a = a2Var;
        Boolean bool = Boolean.TRUE;
        this.f51240l = androidx.compose.runtime.d.k(bool);
        this.f51241m = androidx.compose.runtime.d.k(bool);
        this.n = 0L;
        this.f51242p = 0L;
        this.f51243q = androidx.compose.runtime.d.k(null);
        this.f51244r = androidx.compose.runtime.d.k(null);
        this.f51245s = -1;
        this.f51246t = new r3.z((String) null, 0L, 7);
        this.f51249w = androidx.compose.runtime.d.k(null);
        this.f51250x = new y90.f(5);
        this.f51251y = new y0(this);
        w0 w0Var = new w0();
        w0Var.f51407c = this;
        w0Var.f51405a = true;
        this.f51252z = w0Var;
    }

    public static final void a(a1 a1Var, m3.o0 o0Var) {
        m3.g gVarN;
        String str;
        t70.j0 j0Var;
        if (o0Var == null) {
            return;
        }
        long j11 = o0Var.f75946a;
        n nVar = a1Var.f51237i;
        if (nVar == null || (gVarN = a1Var.n()) == null || (str = gVarN.f75880b) == null) {
            return;
        }
        r3.s sVar = a1Var.f51230b;
        long jU = z2.u(sVar.o((int) (j11 >> 32)), sVar.o((int) (j11 & 4294967295L)));
        if (str.length() <= 0 || m3.o0.c(jU) || (j0Var = a1Var.f51236h) == null) {
            return;
        }
        t70.m0.t(j0Var, null, null, new a5(nVar, str, jU, o0Var, a1Var, sVar, null), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(a1 a1Var, ContinuationImpl continuationImpl) {
        x0 x0Var;
        String str;
        m3.o0 o0Var;
        if (continuationImpl instanceof x0) {
            x0Var = (x0) continuationImpl;
            int i5 = x0Var.f51415v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x0Var.f51415v = i5 - Integer.MIN_VALUE;
            } else {
                x0Var = new x0(a1Var, continuationImpl);
            }
        }
        Object obj = x0Var.f51413t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x0Var.f51415v;
        if (i11 == 0) {
            ResultKt.b(obj);
            m3.g gVarN = a1Var.n();
            if (gVarN != null && (str = gVarN.f75880b) != null && (o0Var = a1Var.f51248v) != null) {
                long j11 = o0Var.f75946a;
                n nVar = a1Var.f51237i;
                if (nVar != null) {
                    long jU = z2.u(a1Var.f51230b.o((int) (j11 >> 32)), a1Var.f51230b.o((int) (j11 & 4294967295L)));
                    x0Var.f51415v = 1;
                    if (nVar.c(str, jU, x0Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    public static final void c(a1 a1Var, h2.b bVar) {
        ((s2) a1Var.f51244r).setValue(bVar);
    }

    public static final void d(a1 a1Var, t0.j0 j0Var) {
        ((s2) a1Var.f51243q).setValue(j0Var);
    }

    public static final long e(a1 a1Var, r3.z zVar, long j11, boolean z11, boolean z12, a5.i iVar, boolean z13) {
        w1 w1VarD;
        char c11;
        q2.a aVar;
        t0.y0 y0Var = a1Var.f51232d;
        if (y0Var == null || (w1VarD = y0Var.d()) == null) {
            return m3.o0.f75944b;
        }
        r3.s sVar = a1Var.f51230b;
        long j12 = zVar.f85472b;
        m3.g gVar = zVar.f85471a;
        int i5 = m3.o0.f75945c;
        long jU = z2.u(sVar.o((int) (j12 >> 32)), a1Var.f51230b.o((int) (j12 & 4294967295L)));
        boolean z14 = false;
        int iB = w1VarD.b(j11, false);
        int i11 = (z12 || z11) ? iB : (int) (jU >> 32);
        int i12 = (!z12 || z11) ? iB : (int) (jU & 4294967295L);
        m0 m0Var = a1Var.f51247u;
        int i13 = -1;
        if (z11 || m0Var == null) {
            c11 = ' ';
        } else {
            c11 = ' ';
            int i14 = a1Var.f51245s;
            if (i14 != -1) {
                i13 = i14;
            }
        }
        m0 m0VarA = f0.a(w1VarD.f88262a, i11, i12, i13, jU, z11, z12);
        if (m0VarA.r(m0Var)) {
            a1Var.f51247u = m0VarA;
            a1Var.f51245s = iB;
            s sVarD = iVar.d(m0VarA);
            long jU2 = z2.u(a1Var.f51230b.m(sVarD.c().a()), a1Var.f51230b.m(sVarD.b().a()));
            if (!m3.o0.b(jU2, j12)) {
                boolean z15 = m3.o0.g(jU2) != m3.o0.g(j12) && m3.o0.b(z2.u((int) (4294967295L & jU2), (int) (jU2 >> c11)), j12);
                boolean z16 = m3.o0.c(jU2) && m3.o0.c(j12);
                if (z13 && gVar.f75880b.length() > 0 && !z15 && !z16 && (aVar = a1Var.f51238j) != null) {
                    aVar.a(9);
                }
                a1Var.f51231c.invoke(g(gVar, jU2));
                a1Var.f51248v = new m3.o0(jU2);
                if (!z13) {
                    a1Var.u(!m3.o0.c(jU2));
                }
                t0.y0 y0Var2 = a1Var.f51232d;
                if (y0Var2 != null) {
                    ((s2) y0Var2.f88293q).setValue(Boolean.valueOf(z13));
                }
                t0.y0 y0Var3 = a1Var.f51232d;
                if (y0Var3 != null) {
                    ((s2) y0Var3.f88291m).setValue(Boolean.valueOf(!m3.o0.c(jU2) && mk.v.K(a1Var, true)));
                }
                t0.y0 y0Var4 = a1Var.f51232d;
                if (y0Var4 != null) {
                    ((s2) y0Var4.n).setValue(Boolean.valueOf(!m3.o0.c(jU2) && mk.v.K(a1Var, false)));
                }
                t0.y0 y0Var5 = a1Var.f51232d;
                if (y0Var5 != null) {
                    if (m3.o0.c(jU2) && mk.v.K(a1Var, true)) {
                        z14 = true;
                    }
                    ((s2) y0Var5.o).setValue(Boolean.valueOf(z14));
                }
                return jU2;
            }
        }
        return j12;
    }

    public static r3.z g(m3.g gVar, long j11) {
        return new r3.z(gVar, j11, (m3.o0) null);
    }

    public final g2 f(boolean z11) {
        t70.j0 j0Var = this.f51236h;
        Continuation continuation = null;
        if (j0Var != null) {
            return t70.m0.t(j0Var, null, t70.l0.f88816d, new s0(this, z11, continuation, 0), 1);
        }
        return null;
    }

    public final void h() {
        t70.j0 j0Var = this.f51236h;
        if (j0Var != null) {
            t70.m0.t(j0Var, null, t70.l0.f88816d, new u0(this, null, 0), 1);
        }
    }

    public final void i(h2.b bVar) {
        if (!m3.o0.c(o().f85472b)) {
            t0.y0 y0Var = this.f51232d;
            w1 w1VarD = y0Var != null ? y0Var.d() : null;
            int iE = (bVar == null || w1VarD == null) ? m3.o0.e(o().f85472b) : this.f51230b.m(w1VarD.b(bVar.f59016a, true));
            r3.z zVarB = r3.z.b(o(), null, z2.u(iE, iE), 5);
            this.f51231c.invoke(zVarB);
            this.f51248v = new m3.o0(zVarB.f85472b);
        }
        r((bVar == null || o().f85471a.f75880b.length() <= 0) ? t0.k0.f88058a : t0.k0.f88060c);
        u(false);
    }

    public final void j(boolean z11) {
        g2.s sVar;
        t0.y0 y0Var = this.f51232d;
        if (y0Var != null && !y0Var.b() && (sVar = this.f51239k) != null) {
            g2.s.c(sVar);
        }
        this.f51246t = o();
        u(z11);
        r(t0.k0.f88059b);
    }

    public final h2.b k() {
        return (h2.b) ((s2) this.f51244r).getValue();
    }

    public final boolean l() {
        return ((Boolean) ((s2) this.f51241m).getValue()).booleanValue();
    }

    public final long m(boolean z11) {
        w1 w1VarD;
        long j11;
        t0.y0 y0Var = this.f51232d;
        if (y0Var == null || (w1VarD = y0Var.d()) == null) {
            return 9205357640488583168L;
        }
        m3.l0 l0Var = w1VarD.f88262a;
        m3.g gVarN = n();
        if (gVarN == null) {
            return 9205357640488583168L;
        }
        if (!Intrinsics.b(gVarN.f75880b, l0Var.f75927a.f75914a.f75880b)) {
            return 9205357640488583168L;
        }
        r3.z zVarO = o();
        if (z11) {
            long j12 = zVarO.f85472b;
            int i5 = m3.o0.f75945c;
            j11 = j12 >> 32;
        } else {
            long j13 = zVarO.f85472b;
            int i11 = m3.o0.f75945c;
            j11 = j13 & 4294967295L;
        }
        return p10.c0.F(l0Var, this.f51230b.o((int) j11), z11, m3.o0.g(o().f85472b));
    }

    public final m3.g n() {
        t0.f1 f1Var;
        t0.y0 y0Var = this.f51232d;
        if (y0Var == null || (f1Var = y0Var.f88279a) == null) {
            return null;
        }
        return f1Var.f87982a;
    }

    public final r3.z o() {
        return (r3.z) ((s2) this.f51233e).getValue();
    }

    public final void p() {
        this.f51250x.e();
    }

    public final void q() {
        t70.j0 j0Var = this.f51236h;
        if (j0Var != null) {
            t70.m0.t(j0Var, null, t70.l0.f88816d, new u0(this, null, 1), 1);
        }
    }

    public final void r(t0.k0 k0Var) {
        t0.y0 y0Var = this.f51232d;
        if (y0Var != null) {
            if (y0Var.a() == k0Var) {
                y0Var = null;
            }
            if (y0Var != null) {
                ((s2) y0Var.f88289k).setValue(k0Var);
            }
        }
    }

    public final void s() {
        t0.y0 y0Var;
        z1.f fVarL = o2.f.l();
        Function1 function1E = fVarL != null ? fVarL.e() : null;
        z1.f fVarQ = o2.f.q(fVarL);
        try {
            if (l() && ((y0Var = this.f51232d) == null || ((Boolean) ((s2) y0Var.f88293q).getValue()).booleanValue())) {
                Unit unit = Unit.f71706a;
                o2.f.w(fVarL, fVarQ, function1E);
                this.f51250x.f();
            }
        } finally {
            o2.f.w(fVarL, fVarQ, function1E);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object t(ContinuationImpl continuationImpl) {
        z0 z0Var;
        t1 t1Var;
        a1 a1Var;
        if (continuationImpl instanceof z0) {
            z0Var = (z0) continuationImpl;
            int i5 = z0Var.f51428w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z0Var.f51428w = i5 - Integer.MIN_VALUE;
            } else {
                z0Var = new z0(this, continuationImpl);
            }
        }
        Object t1Var2 = z0Var.f51426u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z0Var.f51428w;
        if (i11 == 0) {
            ResultKt.b(t1Var2);
            u1 u1Var = this.f51235g;
            t1Var = null;
            if (u1Var == null) {
                a1Var = this;
                ((s2) a1Var.f51249w).setValue(t1Var);
                return Unit.f71706a;
            }
            z0Var.f51425t = this;
            z0Var.f51428w = 1;
            ClipData primaryClip = ((c3.i) u1Var).f19319a.f19327a.getPrimaryClip();
            t1Var2 = primaryClip != null ? new t1(primaryClip) : null;
            if (t1Var2 == coroutineSingletons) {
                return coroutineSingletons;
            }
            a1Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            a1Var = z0Var.f51425t;
            ResultKt.b(t1Var2);
        }
        t1Var = (t1) t1Var2;
        ((s2) a1Var.f51249w).setValue(t1Var);
        return Unit.f71706a;
    }

    public final void u(boolean z11) {
        t0.y0 y0Var = this.f51232d;
        if (y0Var != null) {
            ((s2) y0Var.f88290l).setValue(Boolean.valueOf(z11));
        }
        if (z11) {
            s();
        } else {
            p();
        }
    }
}
