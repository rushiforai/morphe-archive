package m0;

import b00.i1;
import cw.l2;
import e0.f1;
import g0.b2;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import n0.i0;
import n0.k0;
import n0.l0;
import n0.m0;
import n0.o0;
import p1.e1;
import p1.g1;
import p1.o2;
import p1.s2;
import z2.l1;

/* loaded from: classes.dex */
public final class b0 implements b2 {

    /* renamed from: x, reason: collision with root package name */
    public static final ab.c0 f75392x = y1.j.b(new i1(15, (byte) 0), new lm.h(1));

    /* renamed from: a, reason: collision with root package name */
    public final a f75393a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f75394b;

    /* renamed from: c, reason: collision with root package name */
    public q f75395c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f75396d;

    /* renamed from: e, reason: collision with root package name */
    public final e20.r f75397e;

    /* renamed from: f, reason: collision with root package name */
    public final e1 f75398f;

    /* renamed from: g, reason: collision with root package name */
    public final i0.i f75399g;

    /* renamed from: h, reason: collision with root package name */
    public float f75400h;

    /* renamed from: i, reason: collision with root package name */
    public final g0.l f75401i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f75402j;

    /* renamed from: k, reason: collision with root package name */
    public l1 f75403k;

    /* renamed from: l, reason: collision with root package name */
    public final z f75404l;

    /* renamed from: m, reason: collision with root package name */
    public final n0.d f75405m;
    public final androidx.compose.foundation.lazy.layout.c n;
    public final n0.j o;

    /* renamed from: p, reason: collision with root package name */
    public final o0 f75406p;

    /* renamed from: q, reason: collision with root package name */
    public final y f75407q;

    /* renamed from: r, reason: collision with root package name */
    public final k0 f75408r;

    /* renamed from: s, reason: collision with root package name */
    public final e1 f75409s;

    /* renamed from: t, reason: collision with root package name */
    public final e1 f75410t;

    /* renamed from: u, reason: collision with root package name */
    public final e1 f75411u;

    /* renamed from: v, reason: collision with root package name */
    public final e1 f75412v;

    /* renamed from: w, reason: collision with root package name */
    public final m.w f75413w;

    public b0(final int i5, int i11) {
        a aVar = new a();
        aVar.f75382a = -1;
        aVar.f75385d = -1;
        this.f75393a = aVar;
        e20.r rVar = new e20.r();
        rVar.f52080b = androidx.compose.runtime.d.g(i5);
        rVar.f52081c = androidx.compose.runtime.d.g(i11);
        rVar.f52083e = new i0(i5, 30, 100);
        this.f75397e = rVar;
        this.f75398f = androidx.compose.runtime.d.j(d0.f75418a, g1.f81422b);
        this.f75399g = new i0.i();
        this.f75401i = new g0.l(new b00.t(this, 23));
        this.f75402j = true;
        this.f75404l = new z(this, 0);
        this.f75405m = new n0.d();
        this.n = new androidx.compose.foundation.lazy.layout.c();
        this.o = new n0.j();
        this.f75406p = new o0(new Function1(this) { // from class: m0.w
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                l0 l0Var = (l0) obj;
                z1.f fVarL = o2.f.l();
                o2.f.w(fVarL, o2.f.q(fVarL), fVarL != null ? fVarL.e() : null);
                int iA = l0Var.a() == -1 ? 2 : l0Var.a();
                for (int i12 = 0; i12 < iA; i12++) {
                    l0Var.b(i5 + i12);
                }
                return Unit.f71706a;
            }
        });
        this.f75407q = new y(this);
        this.f75408r = new k0();
        this.f75409s = n0.z.f();
        Boolean bool = Boolean.FALSE;
        this.f75410t = androidx.compose.runtime.d.k(bool);
        this.f75411u = androidx.compose.runtime.d.k(bool);
        this.f75412v = n0.z.f();
        this.f75413w = new m.w(1);
    }

    public static Object j(b0 b0Var, int i5, SuspendLambda suspendLambda) {
        b0Var.getClass();
        Object objD = b0Var.d(f1.f49976a, new ky.g(b0Var, i5, 0, null), suspendLambda);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    @Override // g0.b2
    public final float a(float f11) {
        return this.f75401i.a(f11);
    }

    @Override // g0.b2
    public final boolean b() {
        return this.f75401i.b();
    }

    @Override // g0.b2
    public final boolean c() {
        return ((Boolean) ((s2) this.f75411u).getValue()).booleanValue();
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x005f, code lost:
    
        if (r5.f75401i.d(r6, r7, r0) == r1) goto L21;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // g0.b2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        a0 a0Var;
        Function2 function22;
        if (continuationImpl instanceof a0) {
            a0Var = (a0) continuationImpl;
            int i5 = a0Var.f75391x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a0Var.f75391x = i5 - Integer.MIN_VALUE;
            } else {
                a0Var = new a0(this, continuationImpl);
            }
        }
        Object obj = a0Var.f75389v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a0Var.f75391x;
        if (i11 == 0) {
            ResultKt.b(obj);
            a0Var.f75387t = f1Var;
            a0Var.f75388u = (SuspendLambda) function2;
            a0Var.f75391x = 1;
            function22 = function2;
            if (this.f75405m.a(a0Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        Function2 function23 = (Function2) a0Var.f75388u;
        f1Var = a0Var.f75387t;
        ResultKt.b(obj);
        function22 = function23;
        a0Var.f75387t = null;
        a0Var.f75388u = null;
        a0Var.f75391x = 2;
    }

    @Override // g0.b2
    public final boolean e() {
        return ((Boolean) ((s2) this.f75410t).getValue()).booleanValue();
    }

    public final Object f(int i5, int i11, ContinuationImpl continuationImpl) {
        Object objD = d(f1.f49976a, new x(this, i5, i11, null), continuationImpl);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    public final void g(q qVar, boolean z11, boolean z12) {
        String str;
        long j11;
        List list = qVar.f75476k;
        int i5 = qVar.n;
        int i11 = qVar.f75467b;
        r rVar = qVar.f75466a;
        this.f75406p.f77458e = list.size();
        m.w wVar = this.f75413w;
        e20.r rVar2 = this.f75397e;
        if (!z11 && this.f75394b) {
            this.f75395c = qVar;
            z1.f fVarL = o2.f.l();
            Function1 function1E = fVarL != null ? fVarL.e() : null;
            z1.f fVarQ = o2.f.q(fVarL);
            try {
                if (wVar.x() && rVar != null && rVar.f75481a == rVar2.c() && i11 == rVar2.d()) {
                    wVar.E();
                }
                Unit unit = Unit.f71706a;
                o2.f.w(fVarL, fVarQ, function1E);
                return;
            } catch (Throwable th2) {
                o2.f.w(fVarL, fVarQ, function1E);
                throw th2;
            }
        }
        if (z11) {
            this.f75394b = true;
        }
        ((s2) this.f75411u).setValue(Boolean.valueOf(((rVar != null ? rVar.f75481a : 0) == 0 && i11 == 0) ? false : true));
        ((s2) this.f75410t).setValue(Boolean.valueOf(qVar.f75468c));
        this.f75400h -= qVar.f75469d;
        ((s2) this.f75398f).setValue(qVar);
        if (z12) {
            rVar2.getClass();
            if (!(((float) i11) >= 0.0f)) {
                j0.b.c("scrollOffset should be non-negative");
            }
            ((o2) rVar2.f52081c).p(i11);
        } else {
            r rVar3 = (r) b70.g.Y0(list);
            r rVar4 = (r) b70.g.i1(list);
            if (rVar3 != null) {
                str = "scrollOffset should be non-negative";
                j11 = rVar3.f75481a;
            } else {
                str = "scrollOffset should be non-negative";
                j11 = -1;
            }
            l2.J(j11, "firstVisibleItem:index");
            l2.J(rVar4 != null ? rVar4.f75481a : -1L, "lastVisibleItem:index");
            rVar2.getClass();
            rVar2.f52082d = rVar != null ? rVar.f75491k : null;
            if (rVar2.f52079a || i5 > 0) {
                rVar2.f52079a = true;
                if (!(((float) i11) >= 0.0f)) {
                    j0.b.c(str);
                }
                rVar2.i(rVar != null ? rVar.f75481a : 0, i11);
            }
            if (this.f75402j) {
                a aVar = this.f75393a;
                int i12 = aVar.f75382a;
                boolean z13 = aVar.f75384c;
                if (i12 != -1 && !list.isEmpty() && i12 != a.a(qVar, z13)) {
                    aVar.f75382a = -1;
                    m0 m0Var = aVar.f75383b;
                    if (m0Var != null) {
                        m0Var.cancel();
                    }
                    aVar.f75383b = null;
                }
                int i13 = aVar.f75385d;
                if (i13 != -1 && aVar.f75386e != 0.0f && i13 != i5 && !list.isEmpty()) {
                    int iA = a.a(qVar, aVar.f75386e < 0.0f);
                    if (iA >= 0 && iA < i5) {
                        aVar.f75382a = iA;
                        aVar.f75383b = s.a(this.f75407q, iA);
                    }
                }
                aVar.f75385d = i5;
            }
        }
        if (z11) {
            wVar.F(qVar.f75471f, qVar.f75474i, qVar.f75473h);
        }
    }

    public final q h() {
        return (q) ((s2) this.f75398f).getValue();
    }

    public final void i(float f11, q qVar) {
        m0 m0Var;
        m0 m0Var2;
        if (this.f75402j) {
            List list = qVar.f75476k;
            List list2 = qVar.f75476k;
            boolean zIsEmpty = list.isEmpty();
            a aVar = this.f75393a;
            if (!zIsEmpty) {
                boolean z11 = f11 < 0.0f;
                int iA = a.a(qVar, z11);
                if (iA >= 0 && iA < qVar.n) {
                    if (iA != aVar.f75382a) {
                        if (aVar.f75384c != z11) {
                            aVar.f75382a = -1;
                            m0 m0Var3 = aVar.f75383b;
                            if (m0Var3 != null) {
                                m0Var3.cancel();
                            }
                            aVar.f75383b = null;
                        }
                        aVar.f75384c = z11;
                        aVar.f75382a = iA;
                        aVar.f75383b = s.a(this.f75407q, iA);
                    }
                    if (z11) {
                        r rVar = (r) ((h) b70.g.h1(list2));
                        if (((rVar.o + rVar.f75494p) + qVar.f75480q) - qVar.f75478m < (-f11) && (m0Var2 = aVar.f75383b) != null) {
                            m0Var2.a();
                        }
                    } else if (qVar.f75477l - ((r) ((h) b70.g.W0(list2))).o < f11 && (m0Var = aVar.f75383b) != null) {
                        m0Var.a();
                    }
                }
            }
            aVar.f75386e = f11;
        }
    }

    public final void k(int i5, int i11) {
        e20.r rVar = this.f75397e;
        if (rVar.c() != i5 || rVar.d() != i11) {
            androidx.compose.foundation.lazy.layout.c cVar = this.n;
            cVar.e();
            cVar.f13994b = null;
            cVar.f13995c = -1;
        }
        rVar.i(i5, i11);
        rVar.f52082d = null;
        l1 l1Var = this.f75403k;
        if (l1Var != null) {
            l1Var.forceRemeasure();
        }
    }
}
