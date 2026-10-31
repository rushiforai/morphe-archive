package p0;

import androidx.compose.ui.node.LayoutNode;
import e0.f1;
import g0.b2;
import g0.d1;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.math.MathKt;
import n0.k0;
import n0.l0;
import n0.m0;
import n0.o0;
import p1.e1;
import p1.g1;
import p1.i0;
import p1.m2;
import p1.o2;
import p1.s2;
import z2.l1;

/* loaded from: classes2.dex */
public abstract class y implements b2 {
    public long A;
    public final k0 B;
    public final e1 C;
    public final e1 D;
    public final e1 E;
    public final e1 F;
    public final e1 G;
    public final e1 H;

    /* renamed from: a, reason: collision with root package name */
    public boolean f81227a;

    /* renamed from: b, reason: collision with root package name */
    public q f81228b;

    /* renamed from: c, reason: collision with root package name */
    public final e1 f81229c;

    /* renamed from: d, reason: collision with root package name */
    public final ox.q f81230d;

    /* renamed from: e, reason: collision with root package name */
    public int f81231e;

    /* renamed from: f, reason: collision with root package name */
    public int f81232f;

    /* renamed from: g, reason: collision with root package name */
    public long f81233g;

    /* renamed from: h, reason: collision with root package name */
    public long f81234h;

    /* renamed from: i, reason: collision with root package name */
    public float f81235i;

    /* renamed from: j, reason: collision with root package name */
    public float f81236j;

    /* renamed from: k, reason: collision with root package name */
    public final g0.l f81237k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f81238l;

    /* renamed from: m, reason: collision with root package name */
    public int f81239m;
    public m0 n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final e1 f81240p;

    /* renamed from: q, reason: collision with root package name */
    public y3.c f81241q;

    /* renamed from: r, reason: collision with root package name */
    public final i0.i f81242r;

    /* renamed from: s, reason: collision with root package name */
    public final o2 f81243s;

    /* renamed from: t, reason: collision with root package name */
    public final o2 f81244t;

    /* renamed from: u, reason: collision with root package name */
    public final i0 f81245u;

    /* renamed from: v, reason: collision with root package name */
    public final o0 f81246v;

    /* renamed from: w, reason: collision with root package name */
    public final n0.j f81247w;

    /* renamed from: x, reason: collision with root package name */
    public final n0.d f81248x;

    /* renamed from: y, reason: collision with root package name */
    public final e1 f81249y;

    /* renamed from: z, reason: collision with root package name */
    public final w f81250z;

    public y(int i5, float f11) {
        double d5 = f11;
        if (-0.5d > d5 || d5 > 0.5d) {
            j0.b.a("currentPageOffsetFraction " + f11 + " is not within the range -0.5 to 0.5");
        }
        this.f81229c = androidx.compose.runtime.d.k(new h2.b(0L));
        this.f81230d = new ox.q(i5, f11, this);
        this.f81231e = i5;
        this.f81233g = Long.MAX_VALUE;
        final int i11 = 0;
        this.f81237k = new g0.l(new Function1(this) { // from class: p0.t

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ y f81208b;

            {
                this.f81208b = this;
            }

            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Removed duplicated region for block: B:40:0x00b3  */
            /* JADX WARN: Removed duplicated region for block: B:41:0x00c0  */
            /* JADX WARN: Removed duplicated region for block: B:49:0x00f2  */
            /* JADX WARN: Type inference failed for: r0v4 */
            /* JADX WARN: Type inference failed for: r0v5 */
            /* JADX WARN: Type inference failed for: r0v7 */
            /* JADX WARN: Type inference failed for: r15v1, types: [java.lang.Float] */
            /* JADX WARN: Type inference failed for: r15v3, types: [java.lang.Number] */
            /* JADX WARN: Type inference failed for: r15v4, types: [java.lang.Long] */
            @Override // kotlin.jvm.functions.Function1
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final Object invoke(Object obj) {
                q qVar;
                int i12 = i11;
                q qVar2 = null;
                y yVar = this.f81208b;
                switch (i12) {
                    case 0:
                        ?? ValueOf = (Float) obj;
                        float fFloatValue = ValueOf.floatValue();
                        long jX = jk.b.x(yVar);
                        float f12 = yVar.f81235i + fFloatValue;
                        long jC = MathKt.c(f12);
                        yVar.f81235i = f12 - jC;
                        if (Math.abs(fFloatValue) >= 1.0E-4f) {
                            long j11 = jX + jC;
                            long jG0 = kotlin.ranges.a.g0(j11, yVar.f81234h, yVar.f81233g);
                            ?? r02 = j11 != jG0;
                            long j12 = jG0 - jX;
                            float f13 = j12;
                            yVar.f81236j = f13;
                            if (Math.abs(j12) != 0) {
                                ((s2) yVar.G).setValue(Boolean.valueOf(f13 > 0.0f));
                                ((s2) yVar.H).setValue(Boolean.valueOf(f13 < 0.0f));
                            }
                            int i13 = (int) j12;
                            int i14 = -i13;
                            q qVarD = ((q) ((s2) yVar.f81240p).getValue()).d(i14);
                            if (qVarD == null || (qVar = yVar.f81228b) == null) {
                                qVar2 = qVarD;
                                if (qVar2 == null) {
                                    yVar.h(qVar2, yVar.f81227a, true);
                                    yVar.C.setValue(Unit.f71706a);
                                } else {
                                    ox.q qVar3 = yVar.f81230d;
                                    ((m2) qVar3.f81104d).p(qVar3.e() + (((y) qVar3.f81102b).o() != 0 ? i13 / r3.o() : 0.0f));
                                    l1 l1Var = (l1) ((s2) yVar.f81249y).getValue();
                                    if (l1Var != null) {
                                        l1Var.forceRemeasure();
                                    }
                                }
                                if (r02 != false) {
                                    ValueOf = Long.valueOf(j12);
                                }
                                fFloatValue = ValueOf.floatValue();
                            } else {
                                q qVarD2 = qVar.d(i14);
                                if (qVarD2 != null) {
                                    yVar.f81228b = qVarD2;
                                    qVar2 = qVarD;
                                }
                                if (qVar2 == null) {
                                }
                                if (r02 != false) {
                                }
                                fFloatValue = ValueOf.floatValue();
                            }
                        }
                        return Float.valueOf(fFloatValue);
                    default:
                        l0 l0Var = (l0) obj;
                        z1.f fVarL = o2.f.l();
                        Function1 function1E = fVarL != null ? fVarL.e() : null;
                        z1.f fVarQ = o2.f.q(fVarL);
                        try {
                            l0Var.b(yVar.f81231e);
                            Unit unit = Unit.f71706a;
                            o2.f.w(fVarL, fVarQ, function1E);
                            return Unit.f71706a;
                        } catch (Throwable th2) {
                            o2.f.w(fVarL, fVarQ, function1E);
                            throw th2;
                        }
                }
            }
        });
        this.f81238l = true;
        this.f81239m = -1;
        this.f81240p = androidx.compose.runtime.d.j(b0.f81130b, g1.f81422b);
        this.f81241q = b0.f81131c;
        this.f81242r = new i0.i();
        this.f81243s = androidx.compose.runtime.d.g(-1);
        this.f81244t = androidx.compose.runtime.d.g(i5);
        g1 g1Var = g1.f81425e;
        this.f81245u = androidx.compose.runtime.d.e(new c(this, 2), g1Var);
        androidx.compose.runtime.d.e(new c(this, 3), g1Var);
        final int i12 = 1;
        this.f81246v = new o0(new Function1(this) { // from class: p0.t

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ y f81208b;

            {
                this.f81208b = this;
            }

            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Removed duplicated region for block: B:40:0x00b3  */
            /* JADX WARN: Removed duplicated region for block: B:41:0x00c0  */
            /* JADX WARN: Removed duplicated region for block: B:49:0x00f2  */
            /* JADX WARN: Type inference failed for: r0v4 */
            /* JADX WARN: Type inference failed for: r0v5 */
            /* JADX WARN: Type inference failed for: r0v7 */
            /* JADX WARN: Type inference failed for: r15v1, types: [java.lang.Float] */
            /* JADX WARN: Type inference failed for: r15v3, types: [java.lang.Number] */
            /* JADX WARN: Type inference failed for: r15v4, types: [java.lang.Long] */
            @Override // kotlin.jvm.functions.Function1
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final Object invoke(Object obj) {
                q qVar;
                int i122 = i12;
                q qVar2 = null;
                y yVar = this.f81208b;
                switch (i122) {
                    case 0:
                        ?? ValueOf = (Float) obj;
                        float fFloatValue = ValueOf.floatValue();
                        long jX = jk.b.x(yVar);
                        float f12 = yVar.f81235i + fFloatValue;
                        long jC = MathKt.c(f12);
                        yVar.f81235i = f12 - jC;
                        if (Math.abs(fFloatValue) >= 1.0E-4f) {
                            long j11 = jX + jC;
                            long jG0 = kotlin.ranges.a.g0(j11, yVar.f81234h, yVar.f81233g);
                            ?? r02 = j11 != jG0;
                            long j12 = jG0 - jX;
                            float f13 = j12;
                            yVar.f81236j = f13;
                            if (Math.abs(j12) != 0) {
                                ((s2) yVar.G).setValue(Boolean.valueOf(f13 > 0.0f));
                                ((s2) yVar.H).setValue(Boolean.valueOf(f13 < 0.0f));
                            }
                            int i13 = (int) j12;
                            int i14 = -i13;
                            q qVarD = ((q) ((s2) yVar.f81240p).getValue()).d(i14);
                            if (qVarD == null || (qVar = yVar.f81228b) == null) {
                                qVar2 = qVarD;
                                if (qVar2 == null) {
                                    yVar.h(qVar2, yVar.f81227a, true);
                                    yVar.C.setValue(Unit.f71706a);
                                } else {
                                    ox.q qVar3 = yVar.f81230d;
                                    ((m2) qVar3.f81104d).p(qVar3.e() + (((y) qVar3.f81102b).o() != 0 ? i13 / r3.o() : 0.0f));
                                    l1 l1Var = (l1) ((s2) yVar.f81249y).getValue();
                                    if (l1Var != null) {
                                        l1Var.forceRemeasure();
                                    }
                                }
                                if (r02 != false) {
                                    ValueOf = Long.valueOf(j12);
                                }
                                fFloatValue = ValueOf.floatValue();
                            } else {
                                q qVarD2 = qVar.d(i14);
                                if (qVarD2 != null) {
                                    yVar.f81228b = qVarD2;
                                    qVar2 = qVarD;
                                }
                                if (qVar2 == null) {
                                }
                                if (r02 != false) {
                                }
                                fFloatValue = ValueOf.floatValue();
                            }
                        }
                        return Float.valueOf(fFloatValue);
                    default:
                        l0 l0Var = (l0) obj;
                        z1.f fVarL = o2.f.l();
                        Function1 function1E = fVarL != null ? fVarL.e() : null;
                        z1.f fVarQ = o2.f.q(fVarL);
                        try {
                            l0Var.b(yVar.f81231e);
                            Unit unit = Unit.f71706a;
                            o2.f.w(fVarL, fVarQ, function1E);
                            return Unit.f71706a;
                        } catch (Throwable th2) {
                            o2.f.w(fVarL, fVarQ, function1E);
                            throw th2;
                        }
                }
            }
        });
        this.f81247w = new n0.j();
        this.f81248x = new n0.d();
        this.f81249y = androidx.compose.runtime.d.k(null);
        this.f81250z = new w(this);
        this.A = y3.b.b(0, 0, 15);
        this.B = new k0();
        this.C = n0.z.f();
        this.D = n0.z.f();
        Boolean bool = Boolean.FALSE;
        this.E = androidx.compose.runtime.d.k(bool);
        this.F = androidx.compose.runtime.d.k(bool);
        this.G = androidx.compose.runtime.d.k(bool);
        this.H = androidx.compose.runtime.d.k(bool);
    }

    public static int i(boolean z11, q qVar) {
        List list = qVar.f81189a;
        int i5 = qVar.f81196h;
        if (!z11) {
            return (((f) ((g) b70.g.W0(list))).f81154a - i5) - 1;
        }
        int i11 = i5 + 1;
        return i11 < 0 ? LayoutNode.NotPlacedPlaceOrder : ((f) ((g) b70.g.h1(list))).f81154a + i11;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x007d, code lost:
    
        if (r8.d(r6, r7, r0) == r1) goto L27;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object t(y yVar, f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        x xVar;
        if (continuationImpl instanceof x) {
            xVar = (x) continuationImpl;
            int i5 = xVar.f81226y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xVar.f81226y = i5 - Integer.MIN_VALUE;
            } else {
                xVar = new x(yVar, continuationImpl);
            }
        }
        Object obj = xVar.f81224w;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = xVar.f81226y;
        if (i11 == 0) {
            ResultKt.b(obj);
            xVar.f81221t = yVar;
            xVar.f81222u = f1Var;
            xVar.f81223v = (SuspendLambda) function2;
            xVar.f81226y = 1;
            Object objA = yVar.f81248x.a(xVar);
            if (objA != obj2) {
                objA = Unit.f71706a;
            }
            if (objA != obj2) {
            }
            return obj2;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar = xVar.f81221t;
            ResultKt.b(obj);
            yVar.f81243s.p(-1);
            return Unit.f71706a;
        }
        function2 = (Function2) xVar.f81223v;
        f1Var = xVar.f81222u;
        yVar = xVar.f81221t;
        ResultKt.b(obj);
        if (!yVar.f81237k.b()) {
            yVar.f81244t.p(yVar.k());
        }
        g0.l lVar = yVar.f81237k;
        xVar.f81221t = yVar;
        xVar.f81222u = null;
        xVar.f81223v = null;
        xVar.f81226y = 2;
    }

    @Override // g0.b2
    public final float a(float f11) {
        return this.f81237k.a(f11);
    }

    @Override // g0.b2
    public final boolean b() {
        return this.f81237k.b();
    }

    @Override // g0.b2
    public final boolean c() {
        return ((Boolean) ((s2) this.F).getValue()).booleanValue();
    }

    @Override // g0.b2
    public final Object d(f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        return t(this, f1Var, function2, continuationImpl);
    }

    @Override // g0.b2
    public final boolean e() {
        return ((Boolean) ((s2) this.E).getValue()).booleanValue();
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x00b1, code lost:
    
        if (d(e0.f1.f49976a, r5, r0) == r1) goto L40;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(int i5, c0.l1 l1Var, Continuation continuation) {
        u uVar;
        if (continuation instanceof u) {
            uVar = (u) continuation;
            int i11 = uVar.f81213x;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                uVar.f81213x = i11 - Integer.MIN_VALUE;
            } else {
                uVar = new u(this, continuation);
            }
        }
        Object obj = uVar.f81211v;
        Object obj2 = CoroutineSingletons.f71806a;
        int i12 = uVar.f81213x;
        if (i12 == 0) {
            ResultKt.b(obj);
            if ((i5 == k() && this.f81230d.e() == 0.0f) || m() == 0) {
                return Unit.f71706a;
            }
            uVar.f81210u = l1Var;
            uVar.f81209t = i5;
            uVar.f81213x = 1;
            Object objA = this.f81248x.a(uVar);
            if (objA != obj2) {
                objA = Unit.f71706a;
            }
            if (objA == obj2) {
            }
            return obj2;
        }
        if (i12 != 1) {
            if (i12 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        i5 = uVar.f81209t;
        l1Var = uVar.f81210u;
        ResultKt.b(obj);
        c0.l1 l1Var2 = l1Var;
        double d5 = 0.0f;
        if (-0.5d > d5 || d5 > 0.5d) {
            j0.b.a("pageOffsetFraction 0.0 is not within the range -0.5 to 0.5");
        }
        Function2 vVar = new v(this, j(i5), 0.0f * o(), l1Var2, null);
        uVar.f81210u = null;
        uVar.f81213x = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:71:0x0129 A[Catch: all -> 0x0169, TryCatch #0 {all -> 0x0169, blocks: (B:53:0x00c8, B:57:0x00d7, B:60:0x00e0, B:63:0x00ed, B:65:0x00f9, B:77:0x0134, B:71:0x0129, B:68:0x0111), top: B:89:0x00c8 }] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0133  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0134 A[Catch: all -> 0x0169, TRY_LEAVE, TryCatch #0 {all -> 0x0169, blocks: (B:53:0x00c8, B:57:0x00d7, B:60:0x00e0, B:63:0x00ed, B:65:0x00f9, B:77:0x0134, B:71:0x0129, B:68:0x0111), top: B:89:0x00c8 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void h(q qVar, boolean z11, boolean z12) {
        List list = qVar.f81189a;
        int i5 = qVar.f81200l;
        f fVar = qVar.f81197i;
        f fVar2 = qVar.f81198j;
        float f11 = qVar.f81199k;
        this.f81246v.f77458e = list.size();
        if (!z11 && this.f81227a) {
            this.f81228b = qVar;
            return;
        }
        boolean z13 = true;
        if (z11) {
            this.f81227a = true;
        }
        ox.q qVar2 = this.f81230d;
        if (z12) {
            ((m2) qVar2.f81104d).p(f11);
        } else {
            qVar2.getClass();
            qVar2.f81105e = fVar2 != null ? fVar2.f81157d : null;
            if (qVar2.f81101a || !list.isEmpty()) {
                qVar2.f81101a = true;
                int i11 = fVar2 != null ? fVar2.f81154a : 0;
                ((o2) qVar2.f81103c).p(i11);
                ((n0.i0) qVar2.f81106f).a(i11);
                ((m2) qVar2.f81104d).p(f11);
            }
            if (this.f81239m != -1 && !list.isEmpty()) {
                if (this.f81239m != i(this.o, qVar)) {
                    this.f81239m = -1;
                    m0 m0Var = this.n;
                    if (m0Var != null) {
                        m0Var.cancel();
                    }
                    this.n = null;
                }
            }
        }
        ((s2) this.f81240p).setValue(qVar);
        ((s2) this.E).setValue(Boolean.valueOf(qVar.f81201m));
        ((s2) this.F).setValue(Boolean.valueOf(((fVar != null ? fVar.f81154a : 0) == 0 && i5 == 0) ? false : true));
        if (fVar != null) {
            this.f81231e = fVar.f81154a;
        }
        this.f81232f = i5;
        z1.f fVarL = o2.f.l();
        Function1 function1E = fVarL != null ? fVarL.e() : null;
        z1.f fVarQ = o2.f.q(fVarL);
        try {
            if (this.f81238l && qVar.f81196h < m() && Math.abs(this.f81236j) > 0.5f) {
                float f12 = this.f81236j;
                if (l().f81193e == d1.f56493a) {
                    if (Math.signum(f12) != Math.signum(-Float.intBitsToFloat((int) (q() & 4294967295L)))) {
                        if (!r()) {
                            z13 = false;
                        }
                    }
                    if (!z13) {
                        s(this.f81236j, qVar);
                        Unit unit = Unit.f71706a;
                    }
                } else {
                    if (Math.signum(f12) == Math.signum(-Float.intBitsToFloat((int) (q() >> 32)))) {
                    }
                    if (!z13) {
                    }
                }
            }
            this.f81233g = b0.b(qVar, m());
            m();
            int iE = (int) (qVar.f81193e == d1.f56494b ? qVar.e() >> 32 : qVar.e() & 4294967295L);
            qVar.n.getClass();
            this.f81234h = kotlin.ranges.a.e0(0, 0, iE);
        } finally {
            o2.f.w(fVarL, fVarQ, function1E);
        }
    }

    public final int j(int i5) {
        if (m() > 0) {
            return kotlin.ranges.a.e0(i5, 0, m() - 1);
        }
        return 0;
    }

    public final int k() {
        return ((o2) this.f81230d.f81103c).m();
    }

    public final q l() {
        return (q) ((s2) this.f81240p).getValue();
    }

    public abstract int m();

    public final int n() {
        return ((q) ((s2) this.f81240p).getValue()).f81190b;
    }

    public final int o() {
        return ((q) ((s2) this.f81240p).getValue()).f81191c + n();
    }

    public final int p() {
        return ((Number) this.f81245u.getValue()).intValue();
    }

    public final long q() {
        return ((h2.b) ((s2) this.f81229c).getValue()).f59016a;
    }

    public final boolean r() {
        return ((int) Float.intBitsToFloat((int) (q() >> 32))) == 0 && ((int) Float.intBitsToFloat((int) (q() & 4294967295L))) == 0;
    }

    public final void s(float f11, q qVar) {
        m0 m0Var;
        m0 m0Var2;
        m0 m0Var3;
        List list = qVar.f81189a;
        if (this.f81238l && !list.isEmpty()) {
            boolean z11 = f11 > 0.0f;
            int i5 = i(z11, qVar);
            if (i5 < 0 || i5 >= m()) {
                return;
            }
            if (i5 != this.f81239m) {
                if (this.o != z11 && (m0Var3 = this.n) != null) {
                    m0Var3.cancel();
                }
                this.o = z11;
                this.f81239m = i5;
                this.n = this.f81246v.a(i5, this.A, true, null);
            }
            if (z11) {
                if ((((f) ((g) b70.g.h1(list))).f81163j + (qVar.f81190b + qVar.f81191c)) - qVar.f81195g >= f11 || (m0Var2 = this.n) == null) {
                    return;
                }
                m0Var2.a();
                return;
            }
            if (qVar.f81194f - ((f) ((g) b70.g.W0(list))).f81163j >= (-f11) || (m0Var = this.n) == null) {
                return;
            }
            m0Var.a();
        }
    }

    public final void u(int i5, float f11, boolean z11) {
        ox.q qVar = this.f81230d;
        ((o2) qVar.f81103c).p(i5);
        ((n0.i0) qVar.f81106f).a(i5);
        ((m2) qVar.f81104d).p(f11);
        qVar.f81105e = null;
        if (!z11) {
            this.D.setValue(Unit.f71706a);
            return;
        }
        l1 l1Var = (l1) ((s2) this.f81249y).getValue();
        if (l1Var != null) {
            l1Var.forceRemeasure();
        }
    }
}
