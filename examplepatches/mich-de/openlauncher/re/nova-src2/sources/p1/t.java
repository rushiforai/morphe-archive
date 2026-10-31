package p1;

import android.os.Trace;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.android.gms.internal.measurement.v6;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;

/* loaded from: classes.dex */
public final class t implements o {
    public int A;
    public int B;
    public boolean C;
    public final s D;
    public final ArrayList E;
    public boolean F;
    public f2 G;
    public g2 H;
    public k2 I;
    public boolean J;
    public n1 K;
    public q1.a L;
    public final q1.b M;
    public a N;
    public q1.c O;
    public rl.g P;
    public final a2.i Q;
    public final CoroutineContext R;
    public boolean S;
    public long T;
    public y U;

    /* renamed from: a, reason: collision with root package name */
    public final i50.c f81553a;

    /* renamed from: b, reason: collision with root package name */
    public final w f81554b;

    /* renamed from: c, reason: collision with root package name */
    public final g2 f81555c;

    /* renamed from: d, reason: collision with root package name */
    public final z.r0 f81556d;

    /* renamed from: e, reason: collision with root package name */
    public final q1.a f81557e;

    /* renamed from: f, reason: collision with root package name */
    public final q1.a f81558f;

    /* renamed from: g, reason: collision with root package name */
    public final v6 f81559g;

    /* renamed from: h, reason: collision with root package name */
    public final z f81560h;

    /* renamed from: j, reason: collision with root package name */
    public m1 f81562j;

    /* renamed from: k, reason: collision with root package name */
    public int f81563k;

    /* renamed from: l, reason: collision with root package name */
    public int f81564l;

    /* renamed from: m, reason: collision with root package name */
    public int f81565m;
    public int[] o;

    /* renamed from: p, reason: collision with root package name */
    public z.a0 f81566p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f81567q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f81568r;

    /* renamed from: v, reason: collision with root package name */
    public z.c0 f81572v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f81573w;

    /* renamed from: y, reason: collision with root package name */
    public boolean f81575y;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f81561i = new ArrayList();
    public final fa.t n = new fa.t((char) 0, 3);

    /* renamed from: s, reason: collision with root package name */
    public final ArrayList f81569s = new ArrayList();

    /* renamed from: t, reason: collision with root package name */
    public final fa.t f81570t = new fa.t((char) 0, 3);

    /* renamed from: u, reason: collision with root package name */
    public n1 f81571u = x1.j.f94960g;

    /* renamed from: x, reason: collision with root package name */
    public final fa.t f81574x = new fa.t((char) 0, 3);

    /* renamed from: z, reason: collision with root package name */
    public int f81576z = -1;

    public t(i50.c cVar, w wVar, g2 g2Var, z.r0 r0Var, q1.a aVar, q1.a aVar2, v6 v6Var, z zVar) {
        this.f81553a = cVar;
        this.f81554b = wVar;
        this.f81555c = g2Var;
        this.f81556d = r0Var;
        this.f81557e = aVar;
        this.f81558f = aVar2;
        this.f81559g = v6Var;
        this.f81560h = zVar;
        this.C = wVar.f() || wVar.d();
        this.D = new s(this, 0);
        this.E = new ArrayList();
        f2 f2VarD = g2Var.d();
        f2VarD.c();
        this.G = f2VarD;
        g2 g2Var2 = new g2();
        if (wVar.f()) {
            g2Var2.c();
        }
        if (wVar.d()) {
            g2Var2.f81437k = new z.c0();
        }
        this.H = g2Var2;
        k2 k2VarE = g2Var2.e();
        k2VarE.e(true);
        this.I = k2VarE;
        this.M = new q1.b(this, aVar);
        f2 f2VarD2 = this.H.d();
        try {
            a aVarA = f2VarD2.a(0);
            f2VarD2.c();
            this.N = aVarA;
            this.O = new q1.c();
            this.Q = new a2.i(this);
            CoroutineContext coroutineContextJ = wVar.j();
            CoroutineContext coroutineContextC = C();
            this.R = coroutineContextJ.plus(coroutineContextC == null ? EmptyCoroutineContext.f71803a : coroutineContextC);
        } catch (Throwable th2) {
            f2VarD2.c();
            throw th2;
        }
    }

    public static final int R(t tVar, int i5, boolean z11, int i11) {
        f2 f2Var = tVar.G;
        if (f2Var.j(i5)) {
            int i12 = f2Var.i(i5);
            Object objP = f2Var.p(f2Var.f81410b, i5);
            if (i12 == 206 && Intrinsics.b(objP, u.f81591e)) {
                Object objH = f2Var.h(i5, 0);
                r rVar = objH instanceof r ? (r) objH : null;
                if (rVar != null) {
                    for (t tVar2 : rVar.f81532a.f14107e) {
                        g2 g2Var = tVar2.f81555c;
                        if (g2Var.f81428b > 0 && (g2Var.f81427a[1] & 67108864) != 0) {
                            z zVar = tVar2.f81560h;
                            synchronized (zVar.f81671d) {
                                zVar.r();
                                z.o0 o0Var = zVar.n;
                                zVar.n = ab.e0.u();
                                try {
                                    zVar.f81687v.i0(o0Var);
                                    Unit unit = Unit.f71706a;
                                } finally {
                                }
                            }
                            q1.a aVar = new q1.a();
                            tVar2.L = aVar;
                            f2 f2VarD = tVar2.f81555c.d();
                            try {
                                tVar2.G = f2VarD;
                                q1.b bVar = tVar2.M;
                                q1.a aVar2 = bVar.f83367b;
                                try {
                                    bVar.f83367b = aVar;
                                    tVar2.Q(0);
                                    q1.b bVar2 = tVar2.M;
                                    bVar2.b();
                                    if (bVar2.f83368c) {
                                        bVar2.f83367b.f83364b.q0(q1.c0.f83381c);
                                        if (bVar2.f83368c) {
                                            bVar2.d(false);
                                            bVar2.d(false);
                                            bVar2.f83367b.f83364b.q0(q1.m.f83403c);
                                            bVar2.f83368c = false;
                                        }
                                    }
                                } finally {
                                }
                            } finally {
                                f2VarD.c();
                            }
                        }
                        tVar.f81554b.q(tVar2.f81560h);
                    }
                }
                return f2Var.o(i5);
            }
            if (!f2Var.l(i5)) {
                return f2Var.o(i5);
            }
        } else if (f2Var.d(i5)) {
            int i13 = f2Var.f81410b[(i5 * 5) + 3] + i5;
            int iR = 0;
            for (int i14 = i5 + 1; i14 < i13; i14 += f2Var.f81410b[(i14 * 5) + 3]) {
                boolean zL = f2Var.l(i14);
                if (zL) {
                    tVar.M.c();
                    q1.b bVar3 = tVar.M;
                    Object objN = f2Var.n(i14);
                    bVar3.c();
                    bVar3.f83373h.add(objN);
                }
                iR += R(tVar, i14, zL || z11, zL ? 0 : i11 + iR);
                if (zL) {
                    tVar.M.c();
                    tVar.M.a();
                }
            }
            if (!f2Var.l(i5)) {
                return iR;
            }
        } else if (!f2Var.l(i5)) {
            return f2Var.o(i5);
        }
        return 1;
    }

    public final t1 A() {
        if (this.A != 0) {
            return null;
        }
        ArrayList arrayList = this.E;
        if (arrayList.isEmpty()) {
            return null;
        }
        return (t1) h6.c1.l(arrayList, 1);
    }

    public final boolean B() {
        if (!E() || this.f81573w) {
            return true;
        }
        t1 t1VarA = A();
        return (t1VarA == null || (t1VarA.f81581b & 4) == 0) ? false : true;
    }

    public final a2.i C() {
        if (this.C) {
            return this.Q;
        }
        return null;
    }

    public final boolean D() {
        return this.S;
    }

    public final boolean E() {
        t1 t1VarA;
        return (this.S || this.f81575y || this.f81573w || (t1VarA = A()) == null || (t1VarA.f81581b & 8) != 0) ? false : true;
    }

    public final void F(ArrayList arrayList) {
        t tVar = this;
        q1.a aVar = tVar.f81558f;
        q1.b bVar = tVar.M;
        q1.a aVar2 = bVar.f83367b;
        try {
            bVar.f83367b = aVar;
            aVar.f83364b.q0(q1.a0.f83365c);
            int size = arrayList.size();
            int i5 = 0;
            while (i5 < size) {
                Pair pair = (Pair) arrayList.get(i5);
                d1 d1Var = (d1) pair.f71683a;
                a aVarA = d1Var.a();
                int iB = d1Var.d().b(aVarA);
                x1.g gVar = new x1.g();
                bVar.b();
                q1.m0 m0Var = bVar.f83367b.f83364b;
                m0Var.q0(q1.j.f83394c);
                fg.a.Q(m0Var, 0, gVar, 1, aVarA);
                if (Intrinsics.b(d1Var.d(), tVar.H)) {
                    if (!tVar.I.f81485w) {
                        u.c("Check failed");
                    }
                    tVar.y();
                }
                f2 f2VarD = d1Var.d().d();
                try {
                    f2VarD.r(iB);
                    bVar.f83371f = iB;
                    q1.a aVar3 = new q1.a();
                    tVar.K(null, null, null, EmptyList.f71733a, new p(tVar, aVar3, f2VarD, d1Var));
                    q1.a aVar4 = bVar.f83367b;
                    aVar4.getClass();
                    if (aVar3.f83364b.p0()) {
                        q1.m0 m0Var2 = aVar4.f83364b;
                        m0Var2.q0(q1.f.f83386c);
                        fg.a.Q(m0Var2, 0, aVar3, 1, gVar);
                    }
                    Unit unit = Unit.f71706a;
                    f2VarD.c();
                    bVar.f83367b.f83364b.q0(q1.c0.f83381c);
                    i5++;
                    tVar = this;
                } catch (Throwable th2) {
                    f2VarD.c();
                    throw th2;
                }
            }
            bVar.f83367b.f83364b.q0(q1.n.f83410c);
            bVar.f83371f = 0;
            bVar.f83367b = aVar2;
        } catch (Throwable th3) {
            bVar.f83367b = aVar2;
            throw th3;
        }
    }

    public final void G(n1 n1Var, Object obj) {
        Z(126665345, null);
        H();
        n0(obj);
        long j11 = this.T;
        try {
            this.T = 126665345;
            if (this.S) {
                k2.y(this.I);
            }
            boolean z11 = (this.S || Intrinsics.b(this.G.f(), n1Var)) ? false : true;
            if (z11) {
                N(n1Var);
            }
            W(u.f81589c, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, 0, n1Var);
            this.K = null;
            boolean z12 = this.f81573w;
            this.f81573w = z11;
            x1.k.b(this, new x1.e(new p00.n(obj, 1), true, 316014703));
            this.f81573w = z12;
        } finally {
        }
    }

    public final Object H() {
        boolean z11 = this.S;
        g1 g1Var = n.f81514a;
        if (!z11) {
            Object objM = this.G.m();
            if (!this.f81575y || (objM instanceof r)) {
                return objM;
            }
        } else if (this.f81568r) {
            u.c("A call to createNode(), emitNode() or useNode() expected");
            return g1Var;
        }
        return g1Var;
    }

    public final List I() {
        g2 g2Var;
        Integer numD;
        w wVar = this.f81554b;
        v vVarH = wVar.h();
        z zVar = vVarH != null ? (z) vVarH : null;
        if (zVar != null && (numD = a2.b.d((g2Var = zVar.f81673f), wVar)) != null) {
            f2 f2VarD = g2Var.d();
            try {
                return a2.b.f(f2VarD, numD.intValue(), 0);
            } finally {
                f2VarD.c();
            }
        }
        return EmptyList.f71733a;
    }

    public final int J(int i5) {
        int iQ = this.G.q(i5) + 1;
        int i11 = 0;
        while (iQ < i5) {
            if (!this.G.k(iQ)) {
                i11++;
            }
            iQ += i2.a(this.G.f81410b, iQ);
        }
        return i11;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0060 A[Catch: all -> 0x0027, TRY_LEAVE, TryCatch #1 {all -> 0x0027, blocks: (B:3:0x0005, B:6:0x0015, B:8:0x0023, B:12:0x002c, B:11:0x0029, B:15:0x0033, B:17:0x0039, B:19:0x003d, B:22:0x0045, B:24:0x004f, B:26:0x0055, B:27:0x0059, B:28:0x005a, B:30:0x0060, B:23:0x004b), top: B:37:0x0005, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object K(g0 g0Var, g0 g0Var2, Integer num, List list, Function0 function0) {
        Object objInvoke;
        boolean z11 = this.F;
        int i5 = this.f81563k;
        try {
            this.F = true;
            this.f81563k = 0;
            int size = list.size();
            for (int i11 = 0; i11 < size; i11++) {
                Pair pair = (Pair) list.get(i11);
                t1 t1Var = (t1) pair.f71683a;
                Object obj = pair.f71684b;
                if (obj != null) {
                    h0(t1Var, obj);
                } else {
                    h0(t1Var, null);
                }
            }
            if (g0Var == null) {
                objInvoke = function0.invoke();
            } else {
                int iIntValue = num != null ? num.intValue() : -1;
                z zVar = (z) g0Var;
                if (g0Var2 == null || g0Var2.equals(zVar) || iIntValue < 0) {
                    objInvoke = function0.invoke();
                } else {
                    zVar.f81683r = (z) g0Var2;
                    zVar.f81684s = iIntValue;
                    try {
                        objInvoke = function0.invoke();
                        zVar.f81683r = null;
                        zVar.f81684s = 0;
                    } catch (Throwable th2) {
                        zVar.f81683r = null;
                        zVar.f81684s = 0;
                        throw th2;
                    }
                }
                if (objInvoke == null) {
                }
            }
            this.F = z11;
            this.f81563k = i5;
            return objInvoke;
        } catch (Throwable th3) {
            this.F = z11;
            this.f81563k = i5;
            throw th3;
        }
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:10:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0272  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x0316  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x031f  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x032c  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0106  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void L() {
        t0 t0Var;
        int i5;
        int i11;
        long j11;
        int i12;
        int i13;
        boolean zA;
        int i14;
        int i15;
        int i16;
        long j12;
        z.h0 h0Var;
        int i17;
        int iE;
        t0 t0Var2;
        int i18;
        long j13;
        long j14;
        int iHashCode;
        Object objB;
        boolean z11 = this.F;
        boolean z12 = true;
        this.F = true;
        f2 f2Var = this.G;
        int i19 = f2Var.f81417i;
        int i21 = (i19 * 5) + 3;
        int i22 = f2Var.f81410b[i21] + i19;
        int i23 = this.f81563k;
        long j15 = this.T;
        int i24 = this.f81564l;
        int i25 = this.f81565m;
        int i26 = f2Var.f81415g;
        ArrayList arrayList = this.f81569s;
        int iE2 = u.e(i26, arrayList);
        if (iE2 < 0) {
            iE2 = -(iE2 + 1);
        }
        if (iE2 < arrayList.size()) {
            t0Var = (t0) arrayList.get(iE2);
            if (t0Var.f81578b >= i22) {
                t0Var = null;
            }
        }
        boolean z13 = false;
        int i27 = i19;
        while (t0Var != null) {
            boolean z14 = z12;
            t1 t1Var = t0Var.f81577a;
            int i28 = t0Var.f81578b;
            int iE3 = u.e(i28, arrayList);
            if (iE3 >= 0) {
            }
            Object obj = t0Var.f81579c;
            if (obj == null) {
                t1Var.getClass();
                i5 = i21;
            } else {
                int i29 = 8;
                z.o0 o0Var = t1Var.f81586g;
                if (o0Var == null) {
                    i5 = i21;
                } else {
                    i5 = i21;
                    if (obj instanceof i0) {
                        zA = t1.a((i0) obj, o0Var);
                        i11 = i23;
                        j11 = j15;
                        i12 = i24;
                        i13 = i25;
                    } else {
                        if (obj instanceof z.a1) {
                            z.a1 a1Var = (z.a1) obj;
                            if (a1Var.c()) {
                                Object[] objArr = a1Var.f97741b;
                                long[] jArr = a1Var.f97740a;
                                int length = jArr.length - 2;
                                if (length >= 0) {
                                    i12 = i24;
                                    i13 = i25;
                                    int i31 = 0;
                                    while (true) {
                                        long j16 = jArr[i31];
                                        i11 = i23;
                                        j11 = j15;
                                        if ((((~j16) << 7) & j16 & (-9187201950435737472L)) != -9187201950435737472L) {
                                            int i32 = 8 - ((~(i31 - length)) >>> 31);
                                            int i33 = 0;
                                            while (i33 < i32) {
                                                if ((j16 & 255) < 128) {
                                                    Object obj2 = objArr[(i31 << 3) + i33];
                                                    i14 = i33;
                                                    if (!(obj2 instanceof i0) || t1.a((i0) obj2, o0Var)) {
                                                        break;
                                                    }
                                                } else {
                                                    i14 = i33;
                                                }
                                                j16 >>= i29;
                                                i33 = i14 + 1;
                                            }
                                            if (i32 != i29) {
                                                break;
                                            }
                                            if (i31 == length) {
                                                break;
                                            }
                                            i31++;
                                            i23 = i11;
                                            j15 = j11;
                                            i29 = 8;
                                        }
                                    }
                                } else {
                                    i11 = i23;
                                    j11 = j15;
                                    i12 = i24;
                                    i13 = i25;
                                }
                                zA = false;
                            }
                        }
                        zA = z14 ? 1 : 0;
                    }
                    if (zA) {
                        long j17 = j11;
                        ArrayList arrayList2 = this.E;
                        arrayList2.add(t1Var);
                        this.f81559g.o();
                        u1 u1Var = t1Var.f81580a;
                        if (u1Var == null || (h0Var = t1Var.f81585f) == null) {
                            i15 = i19;
                            i16 = i22;
                            j12 = j17;
                        } else {
                            t1Var.f(z14);
                            try {
                                Object[] objArr2 = h0Var.f97830b;
                                int[] iArr = h0Var.f97831c;
                                long[] jArr2 = h0Var.f97829a;
                                int length2 = jArr2.length - 2;
                                if (length2 >= 0) {
                                    j12 = j17;
                                    int i34 = 0;
                                    while (true) {
                                        long j18 = jArr2[i34];
                                        i15 = i19;
                                        i16 = i22;
                                        if ((((~j18) << 7) & j18 & (-9187201950435737472L)) != -9187201950435737472L) {
                                            int i35 = 8 - ((~(i34 - length2)) >>> 31);
                                            for (int i36 = 0; i36 < i35; i36 = i17 + 1) {
                                                if ((j18 & 255) < 128) {
                                                    int i37 = (i34 << 3) + i36;
                                                    i17 = i36;
                                                    Object obj3 = objArr2[i37];
                                                    int i38 = iArr[i37];
                                                    u1Var.c(obj3);
                                                } else {
                                                    i17 = i36;
                                                }
                                                j18 >>= 8;
                                            }
                                            if (i35 != 8) {
                                                break;
                                            }
                                        }
                                        if (i34 == length2) {
                                            break;
                                        }
                                        i34++;
                                        i19 = i15;
                                        i22 = i16;
                                    }
                                } else {
                                    i15 = i19;
                                    i16 = i22;
                                    j12 = j17;
                                }
                                t1Var.f(false);
                            } catch (Throwable th2) {
                                t1Var.f(false);
                                throw th2;
                            }
                        }
                        z14 = true;
                        arrayList2.remove(arrayList2.size() - 1);
                    } else {
                        this.G.r(i28);
                        int i39 = this.G.f81415g;
                        O(i27, i39, i19);
                        int iQ = this.G.q(i39);
                        while (iQ != i19 && !this.G.l(iQ)) {
                            iQ = this.G.q(iQ);
                        }
                        int iO0 = this.G.l(iQ) ? 0 : i11;
                        if (iQ != i39) {
                            int iO02 = (o0(iQ) - this.G.o(i39)) + iO0;
                            while (iO0 < iO02 && iQ != i28) {
                                iQ++;
                                while (iQ < i28) {
                                    f2 f2Var2 = this.G;
                                    int i40 = f2Var2.f81410b[(iQ * 5) + 3] + iQ;
                                    if (i28 >= i40) {
                                        iO0 += f2Var2.l(iQ) ? z14 ? 1 : 0 : o0(iQ);
                                        iQ = i40;
                                    }
                                }
                                break;
                            }
                        }
                        this.f81563k = iO0;
                        this.f81565m = J(i39);
                        int iQ2 = this.G.q(i39);
                        long jRotateLeft = 0;
                        int i41 = 3;
                        int i42 = 0;
                        while (true) {
                            if (iQ2 < 0) {
                                i18 = i39;
                                j13 = j11;
                                break;
                            }
                            if (iQ2 == i19) {
                                j13 = j11;
                                jRotateLeft ^= Long.rotateLeft(j13, i42);
                                i18 = i39;
                                break;
                            }
                            j13 = j11;
                            f2 f2Var3 = this.G;
                            boolean zK = f2Var3.k(iQ2);
                            i18 = i39;
                            int[] iArr2 = f2Var3.f81410b;
                            if (zK) {
                                Object objP = f2Var3.p(iArr2, iQ2);
                                if (objP != null) {
                                    iHashCode = objP instanceof Enum ? ((Enum) objP).ordinal() : objP.hashCode();
                                    j14 = jRotateLeft;
                                } else {
                                    j14 = jRotateLeft;
                                    iHashCode = 0;
                                }
                            } else {
                                int i43 = f2Var3.i(iQ2);
                                j14 = jRotateLeft;
                                iHashCode = (i43 != 207 || (objB = f2Var3.b(iArr2, iQ2)) == null || objB.equals(n.f81514a)) ? i43 : objB.hashCode();
                            }
                            if (iHashCode == 126665345) {
                                jRotateLeft = j14 ^ Long.rotateLeft(iHashCode, i42);
                                break;
                            }
                            jRotateLeft = Long.rotateLeft(this.G.k(iQ2) ? 0 : J(iQ2), i42) ^ (j14 ^ Long.rotateLeft(iHashCode, i41));
                            i41 = (i41 + 6) % 64;
                            i42 = (i42 + 6) % 64;
                            iQ2 = this.G.q(iQ2);
                            j11 = j13;
                            i39 = i18;
                        }
                        this.T = jRotateLeft;
                        this.K = null;
                        Function2 function2 = t1Var.f81583d;
                        if (function2 == null) {
                            throw new IllegalStateException("Invalid restart scope");
                        }
                        function2.invoke(this, Integer.valueOf(z14 ? 1 : 0));
                        this.K = null;
                        f2 f2Var4 = this.G;
                        int i44 = f2Var4.f81410b[i5] + i19;
                        int i45 = f2Var4.f81415g;
                        if (!((i45 < i19 || i45 > i44) ? false : z14 ? 1 : 0)) {
                            u.c("Index " + i19 + " is not a parent of " + i45);
                        }
                        f2Var4.f81417i = i19;
                        f2Var4.f81416h = i44;
                        f2Var4.f81420l = 0;
                        f2Var4.f81421m = 0;
                        i15 = i19;
                        i16 = i22;
                        j12 = j13;
                        i27 = i18;
                        z13 = z14 ? 1 : 0;
                    }
                    iE = u.e(this.G.f81415g, arrayList);
                    if (iE < 0) {
                        iE = -(iE + 1);
                    }
                    if (iE >= arrayList.size()) {
                        t0Var2 = (t0) arrayList.get(iE);
                        i22 = i16;
                        if (t0Var2.f81578b < i22) {
                        }
                        t0Var = t0Var2;
                        z12 = z14;
                        i21 = i5;
                        i19 = i15;
                        i24 = i12;
                        i25 = i13;
                        i23 = i11;
                        j15 = j12;
                    } else {
                        i22 = i16;
                    }
                    t0Var2 = null;
                    t0Var = t0Var2;
                    z12 = z14;
                    i21 = i5;
                    i19 = i15;
                    i24 = i12;
                    i25 = i13;
                    i23 = i11;
                    j15 = j12;
                }
            }
            i11 = i23;
            j11 = j15;
            i12 = i24;
            i13 = i25;
            zA = z14 ? 1 : 0;
            if (zA) {
            }
            iE = u.e(this.G.f81415g, arrayList);
            if (iE < 0) {
            }
            if (iE >= arrayList.size()) {
            }
            t0Var2 = null;
            t0Var = t0Var2;
            z12 = z14;
            i21 = i5;
            i19 = i15;
            i24 = i12;
            i25 = i13;
            i23 = i11;
            j15 = j12;
        }
        int i46 = i19;
        int i47 = i23;
        long j19 = j15;
        int i48 = i24;
        int i49 = i25;
        if (z13) {
            O(i27, i46, i46);
            this.G.t();
            int iO03 = o0(i46);
            this.f81563k = i47 + iO03;
            this.f81564l = i48 + iO03;
            this.f81565m = i49;
        } else {
            U();
        }
        this.T = j19;
        this.F = z11;
    }

    public final void M() {
        int i5;
        Q(this.G.f81415g);
        q1.b bVar = this.M;
        bVar.d(false);
        fa.t tVar = bVar.f83369d;
        t tVar2 = bVar.f83366a;
        f2 f2Var = tVar2.G;
        if (f2Var.f81411c > 0 && tVar.e(-2) != (i5 = f2Var.f81417i)) {
            if (!bVar.f83368c && bVar.f83370e) {
                bVar.d(false);
                bVar.f83367b.f83364b.q0(q1.q.f83413c);
                bVar.f83368c = true;
            }
            if (i5 > 0) {
                a aVarA = f2Var.a(i5);
                tVar.g(i5);
                bVar.d(false);
                q1.m0 m0Var = bVar.f83367b.f83364b;
                m0Var.q0(q1.p.f83412c);
                fg.a.P(m0Var, 0, aVarA);
                bVar.f83368c = true;
            }
        }
        bVar.f83367b.f83364b.q0(q1.y.f83425c);
        int i11 = bVar.f83371f;
        f2 f2Var2 = tVar2.G;
        bVar.f83371f = f2Var2.f81410b[(f2Var2.f81415g * 5) + 3] + i11;
    }

    public final void N(n1 n1Var) {
        z.c0 c0Var = this.f81572v;
        if (c0Var == null) {
            c0Var = new z.c0();
            this.f81572v = c0Var;
        }
        c0Var.h(this.G.f81415g, n1Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void O(int i5, int i11, int i12) {
        f2 f2Var = this.G;
        if (i5 != i11) {
            if (i5 != i12 && i11 != i12) {
                if (f2Var.q(i5) == i11) {
                    i12 = i11;
                } else if (f2Var.q(i11) == i5) {
                    i12 = i5;
                } else if (f2Var.q(i5) == f2Var.q(i11)) {
                    i12 = f2Var.q(i5);
                } else {
                    int iQ = i5;
                    int i13 = 0;
                    while (iQ > 0 && iQ != i12) {
                        iQ = f2Var.q(iQ);
                        i13++;
                    }
                    int iQ2 = i11;
                    int i14 = 0;
                    while (iQ2 > 0 && iQ2 != i12) {
                        iQ2 = f2Var.q(iQ2);
                        i14++;
                    }
                    int i15 = i13 - i14;
                    int iQ3 = i5;
                    for (int i16 = 0; i16 < i15; i16++) {
                        iQ3 = f2Var.q(iQ3);
                    }
                    int i17 = i14 - i13;
                    int iQ4 = i11;
                    for (int i18 = 0; i18 < i17; i18++) {
                        iQ4 = f2Var.q(iQ4);
                    }
                    i12 = iQ3;
                    for (int iQ5 = iQ4; i12 != iQ5; iQ5 = f2Var.q(iQ5)) {
                        i12 = f2Var.q(i12);
                    }
                }
            }
        }
        while (i5 > 0 && i5 != i12) {
            if (f2Var.l(i5)) {
                this.M.a();
            }
            i5 = f2Var.q(i5);
        }
        o(i11, i12);
    }

    public final Object P() {
        boolean z11 = this.S;
        g1 g1Var = n.f81514a;
        if (!z11) {
            Object objM = this.G.m();
            if (!this.f81575y || (objM instanceof r)) {
                return objM instanceof a2 ? ((a2) objM).f81381a : objM;
            }
        } else if (this.f81568r) {
            u.c("A call to createNode(), emitNode() or useNode() expected");
            return g1Var;
        }
        return g1Var;
    }

    public final void Q(int i5) {
        boolean zL = this.G.l(i5);
        q1.b bVar = this.M;
        if (zL) {
            bVar.c();
            Object objN = this.G.n(i5);
            bVar.c();
            bVar.f83373h.add(objN);
        }
        R(this, i5, zL, 0);
        bVar.c();
        if (zL) {
            bVar.a();
        }
    }

    public final boolean S(int i5, boolean z11) {
        t1 t1VarA;
        if ((i5 & 1) == 0 && (this.S || this.f81575y)) {
            rl.g gVar = this.P;
            if (gVar != null && (t1VarA = A()) != null && gVar.a()) {
                int i11 = t1VarA.f81581b;
                if ((i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
                    return true;
                }
                int i12 = i11 | 1;
                t1VarA.f81581b = i12;
                t1VarA.f81581b = (this.f81575y ? i11 | Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE : i12 & (-129)) | 256;
                q1.m0 m0Var = this.M.f83367b.f83364b;
                m0Var.q0(q1.x.f83424c);
                fg.a.P(m0Var, 0, t1VarA);
                this.f81554b.p(t1VarA);
                return false;
            }
        } else if (!z11 && E()) {
            return false;
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00e2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void T() {
        int i5;
        long jRotateLeft;
        long jRotateLeft2;
        if (this.f81569s.isEmpty()) {
            this.f81564l = this.G.s() + this.f81564l;
            return;
        }
        f2 f2Var = this.G;
        int iG = f2Var.g();
        int[] iArr = f2Var.f81410b;
        int i11 = f2Var.f81415g;
        Object objP = i11 < f2Var.f81416h ? f2Var.p(iArr, i11) : null;
        Object objF = f2Var.f();
        int i12 = this.f81565m;
        g1 g1Var = n.f81514a;
        if (objP != null) {
            if (objP instanceof Enum) {
                jRotateLeft = Long.rotateLeft(((Enum) objP).ordinal() ^ Long.rotateLeft(this.T, 3), 3);
                i5 = 0;
            } else {
                i5 = 0;
                jRotateLeft = Long.rotateLeft(objP.hashCode() ^ Long.rotateLeft(this.T, 3), 3);
            }
            jRotateLeft2 = jRotateLeft ^ i5;
        } else {
            if (objF != null && iG == 207 && !objF.equals(g1Var)) {
                this.T = Long.rotateLeft(objF.hashCode() ^ Long.rotateLeft(this.T, 3), 3) ^ i12;
                a0(null, (iArr[(f2Var.f81415g * 5) + 1] & 1073741824) != 0);
                L();
                f2Var.e();
                if (objP == null) {
                    if (objP instanceof Enum) {
                        this.T = Long.rotateRight(Long.rotateRight(this.T ^ 0, 3) ^ ((Enum) objP).ordinal(), 3);
                        return;
                    } else {
                        this.T = Long.rotateRight(Long.rotateRight(this.T ^ 0, 3) ^ objP.hashCode(), 3);
                        return;
                    }
                }
                if (objF == null || iG != 207 || objF.equals(g1Var)) {
                    this.T = Long.rotateRight(iG ^ Long.rotateRight(this.T ^ i12, 3), 3);
                    return;
                } else {
                    this.T = Long.rotateRight(Long.rotateRight(this.T ^ i12, 3) ^ objF.hashCode(), 3);
                    return;
                }
            }
            jRotateLeft2 = Long.rotateLeft(Long.rotateLeft(this.T, 3) ^ iG, 3) ^ i12;
        }
        this.T = jRotateLeft2;
        a0(null, (iArr[(f2Var.f81415g * 5) + 1] & 1073741824) != 0);
        L();
        f2Var.e();
        if (objP == null) {
        }
    }

    public final void U() {
        f2 f2Var = this.G;
        int i5 = f2Var.f81417i;
        this.f81564l = i5 >= 0 ? f2Var.f81410b[(i5 * 5) + 1] & 67108863 : 0;
        f2Var.t();
    }

    public final void V() {
        if (this.f81564l != 0) {
            u.c("No nodes can be emitted before calling skipAndEndGroup");
        }
        if (this.S) {
            return;
        }
        t1 t1VarA = A();
        if (t1VarA != null) {
            int i5 = t1VarA.f81581b;
            if ((i5 & 128) == 0) {
                t1VarA.f81581b = i5 | 16;
            }
        }
        if (this.f81569s.isEmpty()) {
            U();
        } else {
            L();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00c6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void W(Object obj, int i5, int i11, Object obj2) {
        long jRotateLeft;
        long j11;
        boolean z11;
        m1 m1Var;
        int i12;
        int i13;
        Object[] objArr;
        Object[] objArr2;
        int i14;
        int i15;
        int i16;
        boolean z12;
        int i17;
        Object obj3 = obj;
        if (this.f81568r) {
            u.c("A call to createNode(), emitNode() or useNode() expected");
        }
        int i18 = this.f81565m;
        Object obj4 = n.f81514a;
        if (obj3 != null) {
            jRotateLeft = Long.rotateLeft(Long.rotateLeft(this.T, 3) ^ (obj3 instanceof Enum ? ((Enum) obj3).ordinal() : obj3.hashCode()), 3);
            j11 = 0;
        } else {
            if (obj2 != null && i5 == 207 && !obj2.equals(obj4)) {
                this.T = Long.rotateLeft(Long.rotateLeft(this.T, 3) ^ obj2.hashCode(), 3) ^ i18;
                if (obj3 == null) {
                    this.f81565m++;
                }
                boolean z13 = i11 == 0;
                if (!this.S) {
                    this.G.f81419k++;
                    k2 k2Var = this.I;
                    int i19 = k2Var.f81482t;
                    if (z13) {
                        k2Var.P(obj4, obj4, true, i5);
                    } else if (obj2 != null) {
                        if (obj3 == null) {
                            obj3 = obj4;
                        }
                        k2Var.P(obj3, obj2, false, i5);
                    } else {
                        if (obj3 == null) {
                            obj3 = obj4;
                        }
                        k2Var.P(obj3, obj4, false, i5);
                    }
                    m1 m1Var2 = this.f81562j;
                    if (m1Var2 != null) {
                        int i21 = (-2) - i19;
                        w0 w0Var = new w0(-1, i5, i21, -1);
                        m1Var2.f81511e.h(i21, new q0(-1, this.f81563k - m1Var2.f81508b, 0));
                        m1Var2.f81510d.add(w0Var);
                    }
                    x(z13, null);
                    return;
                }
                boolean z14 = i11 == 1 && this.f81575y;
                if (this.f81562j == null) {
                    int iG = this.G.g();
                    if (!z14 && iG == i5) {
                        f2 f2Var = this.G;
                        int i22 = f2Var.f81415g;
                        if (Intrinsics.b(obj3, i22 < f2Var.f81416h ? f2Var.p(f2Var.f81410b, i22) : null)) {
                            a0(obj2, z13);
                            z11 = z14;
                        }
                    }
                    f2 f2Var2 = this.G;
                    int[] iArr = f2Var2.f81410b;
                    ArrayList arrayList = new ArrayList();
                    if (f2Var2.f81419k <= 0) {
                        int i23 = f2Var2.f81415g;
                        while (i23 < f2Var2.f81416h) {
                            int i24 = i23 * 5;
                            int i25 = iArr[i24];
                            Object objP = f2Var2.p(iArr, i23);
                            int i26 = iArr[i24 + 1];
                            if ((i26 & 1073741824) != 0) {
                                z12 = z14;
                                i17 = 1;
                            } else {
                                z12 = z14;
                                i17 = i26 & 67108863;
                            }
                            arrayList.add(new w0(objP, i25, i23, i17));
                            i23 += iArr[i24 + 3];
                            z14 = z12;
                        }
                    }
                    z11 = z14;
                    this.f81562j = new m1(arrayList, this.f81563k);
                } else {
                    z11 = z14;
                }
                m1 m1Var3 = this.f81562j;
                if (m1Var3 != null) {
                    ArrayList arrayList2 = m1Var3.f81510d;
                    z.c0 c0Var = m1Var3.f81511e;
                    int i27 = m1Var3.f81508b;
                    Object v0Var = obj3 != null ? new v0(Integer.valueOf(i5), obj3) : Integer.valueOf(i5);
                    z.o0 o0Var = ((r1.a) m1Var3.f81512f.getValue()).f85068a;
                    Object objD = o0Var.d(v0Var);
                    if (objD == null) {
                        objD = null;
                    } else if (objD instanceof z.j0) {
                        z.j0 j0Var = (z.j0) objD;
                        Object objK = j0Var.k(0);
                        if (j0Var.d()) {
                            o0Var.k(v0Var);
                        }
                        if (j0Var.f97841b == 1) {
                            o0Var.m(v0Var, j0Var.a());
                        }
                        objD = objK;
                    } else {
                        o0Var.k(v0Var);
                    }
                    w0 w0Var2 = (w0) objD;
                    if (z11 || w0Var2 == null) {
                        this.G.f81419k++;
                        this.S = true;
                        this.K = null;
                        if (this.I.f81485w) {
                            k2 k2VarE = this.H.e();
                            this.I = k2VarE;
                            k2VarE.L();
                            this.J = false;
                            this.K = null;
                        }
                        this.I.d();
                        k2 k2Var2 = this.I;
                        int i28 = k2Var2.f81482t;
                        if (z13) {
                            k2Var2.P(obj4, obj4, true, i5);
                            i12 = 0;
                        } else if (obj2 != null) {
                            if (obj != null) {
                                obj4 = obj;
                            }
                            i12 = 0;
                            k2Var2.P(obj4, obj2, false, i5);
                        } else {
                            i12 = 0;
                            k2Var2.P(obj == null ? obj4 : obj, obj4, false, i5);
                        }
                        this.N = this.I.b(i28);
                        int i29 = (-2) - i28;
                        w0 w0Var3 = new w0(-1, i5, i29, -1);
                        c0Var.h(i29, new q0(-1, this.f81563k - i27, i12));
                        arrayList2.add(w0Var3);
                        m1Var = new m1(new ArrayList(), z13 ? i12 : this.f81563k);
                    } else {
                        int i31 = w0Var2.f81611c;
                        arrayList2.add(w0Var2);
                        q0 q0Var = (q0) c0Var.b(i31);
                        this.f81563k = (q0Var != null ? q0Var.f81527b : -1) + i27;
                        q0 q0Var2 = (q0) c0Var.b(i31);
                        int i32 = q0Var2 != null ? q0Var2.f81526a : -1;
                        int i33 = m1Var3.f81509c;
                        int i34 = i32 - i33;
                        int i35 = 8;
                        if (i32 > i33) {
                            Object[] objArr3 = c0Var.f97796c;
                            long[] jArr = c0Var.f97794a;
                            int length = jArr.length - 2;
                            if (length >= 0) {
                                int i36 = 0;
                                while (true) {
                                    long j12 = jArr[i36];
                                    if ((((~j12) << 7) & j12 & (-9187201950435737472L)) != -9187201950435737472L) {
                                        int i37 = 8 - ((~(i36 - length)) >>> 31);
                                        int i38 = 0;
                                        while (i38 < i37) {
                                            if ((j12 & 255) < 128) {
                                                i16 = i35;
                                                q0 q0Var3 = (q0) objArr3[(i36 << 3) + i38];
                                                i15 = i34;
                                                int i39 = q0Var3.f81526a;
                                                if (i39 == i32) {
                                                    q0Var3.f81526a = i33;
                                                } else if (i33 <= i39 && i39 < i32) {
                                                    q0Var3.f81526a = i39 + 1;
                                                }
                                            } else {
                                                i15 = i34;
                                                i16 = i35;
                                            }
                                            j12 >>= i16;
                                            i38++;
                                            i34 = i15;
                                            i35 = i16;
                                        }
                                        i13 = i34;
                                        if (i37 != i35) {
                                            break;
                                        }
                                    } else {
                                        i13 = i34;
                                    }
                                    if (i36 == length) {
                                        break;
                                    }
                                    i36++;
                                    i34 = i13;
                                    i35 = 8;
                                }
                            } else {
                                i13 = i34;
                            }
                        } else {
                            i13 = i34;
                            if (i33 > i32) {
                                Object[] objArr4 = c0Var.f97796c;
                                long[] jArr2 = c0Var.f97794a;
                                int length2 = jArr2.length - 2;
                                if (length2 >= 0) {
                                    int i40 = 0;
                                    while (true) {
                                        long j13 = jArr2[i40];
                                        if ((((~j13) << 7) & j13 & (-9187201950435737472L)) != -9187201950435737472L) {
                                            int i41 = 8 - ((~(i40 - length2)) >>> 31);
                                            int i42 = 0;
                                            while (i42 < i41) {
                                                if ((j13 & 255) >= 128) {
                                                    objArr2 = objArr4;
                                                } else {
                                                    q0 q0Var4 = (q0) objArr4[(i40 << 3) + i42];
                                                    int i43 = q0Var4.f81526a;
                                                    if (i43 == i32) {
                                                        q0Var4.f81526a = i33;
                                                        objArr2 = objArr4;
                                                    } else {
                                                        objArr2 = objArr4;
                                                        if (i32 + 1 <= i43 && i43 < i33) {
                                                            q0Var4.f81526a = i43 - 1;
                                                        }
                                                    }
                                                }
                                                j13 >>= 8;
                                                i42++;
                                                objArr4 = objArr2;
                                            }
                                            objArr = objArr4;
                                            if (i41 != 8) {
                                                break;
                                            }
                                        } else {
                                            objArr = objArr4;
                                        }
                                        if (i40 == length2) {
                                            break;
                                        }
                                        i40++;
                                        objArr4 = objArr;
                                    }
                                }
                            }
                        }
                        q1.b bVar = this.M;
                        int i44 = bVar.f83371f;
                        t tVar = bVar.f83366a;
                        bVar.f83371f = (i31 - tVar.G.f81415g) + i44;
                        this.G.r(i31);
                        if (i13 > 0) {
                            bVar.d(false);
                            fa.t tVar2 = bVar.f83369d;
                            f2 f2Var3 = tVar.G;
                            if (f2Var3.f81411c > 0 && tVar2.e(-2) != (i14 = f2Var3.f81417i)) {
                                if (!bVar.f83368c && bVar.f83370e) {
                                    bVar.d(false);
                                    bVar.f83367b.f83364b.q0(q1.q.f83413c);
                                    bVar.f83368c = true;
                                }
                                if (i14 > 0) {
                                    a aVarA = f2Var3.a(i14);
                                    tVar2.g(i14);
                                    bVar.d(false);
                                    q1.m0 m0Var = bVar.f83367b.f83364b;
                                    m0Var.q0(q1.p.f83412c);
                                    fg.a.P(m0Var, 0, aVarA);
                                    bVar.f83368c = true;
                                }
                            }
                            q1.m0 m0Var2 = bVar.f83367b.f83364b;
                            m0Var2.q0(q1.u.f83421c);
                            m0Var2.f83406d[m0Var2.f83407e - m0Var2.f83404b[m0Var2.f83405c - 1].f83395a] = i13;
                        }
                        a0(obj2, z13);
                        m1Var = null;
                    }
                } else {
                    m1Var = null;
                }
                x(z13, m1Var);
                return;
            }
            jRotateLeft = Long.rotateLeft(Long.rotateLeft(this.T, 3) ^ i5, 3);
            j11 = i18;
        }
        this.T = jRotateLeft ^ j11;
        if (obj3 == null) {
        }
        if (i11 == 0) {
        }
        if (!this.S) {
        }
    }

    public final void X() {
        W(null, -127, 0, null);
    }

    public final void Y(int i5, h1 h1Var) {
        W(h1Var, i5, 0, null);
    }

    public final void Z(int i5, Object obj) {
        W(obj, i5, 0, null);
    }

    public final void a() {
        i();
        this.f81561i.clear();
        this.n.f54485a = 0;
        this.f81570t.f54485a = 0;
        this.f81574x.f54485a = 0;
        this.f81572v = null;
        q1.c cVar = this.O;
        cVar.f83380c.m0();
        cVar.f83379b.m0();
        this.T = 0;
        this.A = 0;
        this.f81568r = false;
        this.S = false;
        this.f81575y = false;
        this.F = false;
        this.f81576z = -1;
        f2 f2Var = this.G;
        if (!f2Var.f81414f) {
            f2Var.c();
        }
        if (this.I.f81485w) {
            return;
        }
        y();
    }

    public final void a0(Object obj, boolean z11) {
        if (z11) {
            f2 f2Var = this.G;
            if (f2Var.f81419k <= 0) {
                if ((f2Var.f81410b[(f2Var.f81415g * 5) + 1] & 1073741824) == 0) {
                    o1.a("Expected a node group");
                }
                f2Var.u();
                return;
            }
            return;
        }
        if (obj != null && this.G.f() != obj) {
            q1.b bVar = this.M;
            bVar.getClass();
            bVar.d(false);
            q1.m0 m0Var = bVar.f83367b.f83364b;
            m0Var.q0(q1.f0.f83387c);
            fg.a.P(m0Var, 0, obj);
        }
        this.G.u();
    }

    public final void b(Object obj, Function2 function2) {
        if (this.S) {
            q1.m0 m0Var = this.O.f83379b;
            m0Var.q0(q1.g0.f83389c);
            fg.a.P(m0Var, 0, obj);
            Intrinsics.e(function2, "null cannot be cast to non-null type @[ExtensionFunctionType] kotlin.Function2<kotlin.Any?, kotlin.Any?, kotlin.Unit>");
            TypeIntrinsics.e(2, function2);
            fg.a.P(m0Var, 1, function2);
            return;
        }
        q1.b bVar = this.M;
        bVar.b();
        q1.m0 m0Var2 = bVar.f83367b.f83364b;
        m0Var2.q0(q1.g0.f83389c);
        Intrinsics.e(function2, "null cannot be cast to non-null type @[ExtensionFunctionType] kotlin.Function2<kotlin.Any?, kotlin.Any?, kotlin.Unit>");
        TypeIntrinsics.e(2, function2);
        fg.a.Q(m0Var2, 0, obj, 1, function2);
    }

    public final void b0(int i5) {
        int i11;
        int i12;
        if (this.f81562j != null) {
            W(null, i5, 0, null);
            return;
        }
        if (this.f81568r) {
            u.c("A call to createNode(), emitNode() or useNode() expected");
        }
        this.T = Long.rotateLeft(Long.rotateLeft(this.T, 3) ^ i5, 3) ^ this.f81565m;
        this.f81565m++;
        f2 f2Var = this.G;
        boolean z11 = this.S;
        g1 g1Var = n.f81514a;
        if (z11) {
            f2Var.f81419k++;
            this.I.P(g1Var, g1Var, false, i5);
            x(false, null);
            return;
        }
        if (f2Var.g() == i5 && ((i12 = f2Var.f81415g) >= f2Var.f81416h || (f2Var.f81410b[(i12 * 5) + 1] & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) == 0)) {
            f2Var.u();
            x(false, null);
            return;
        }
        if (f2Var.f81419k <= 0 && (i11 = f2Var.f81415g) != f2Var.f81416h) {
            int i13 = this.f81563k;
            M();
            this.M.e(i13, f2Var.s());
            u.a(i11, f2Var.f81415g, this.f81569s);
        }
        f2Var.f81419k++;
        this.S = true;
        this.K = null;
        if (this.I.f81485w) {
            k2 k2VarE = this.H.e();
            this.I = k2VarE;
            k2VarE.L();
            this.J = false;
            this.K = null;
        }
        k2 k2Var = this.I;
        k2Var.d();
        int i14 = k2Var.f81482t;
        k2Var.P(g1Var, g1Var, false, i5);
        this.N = k2Var.b(i14);
        x(false, null);
    }

    public final boolean c(float f11) {
        Object objH = H();
        if ((objH instanceof Float) && f11 == ((Number) objH).floatValue()) {
            return false;
        }
        n0(Float.valueOf(f11));
        return true;
    }

    public final void c0(int i5) {
        W(null, i5, 0, null);
    }

    public final boolean d(int i5) {
        Object objH = H();
        if ((objH instanceof Integer) && i5 == ((Number) objH).intValue()) {
            return false;
        }
        n0(Integer.valueOf(i5));
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0070  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final t d0(int i5) {
        t1 t1Var;
        boolean z11;
        b0(i5);
        boolean z12 = this.S;
        v6 v6Var = this.f81559g;
        ArrayList arrayList = this.E;
        z zVar = this.f81560h;
        if (z12) {
            t1 t1Var2 = new t1(zVar);
            arrayList.add(t1Var2);
            n0(t1Var2);
            t1Var2.f81584e = this.B;
            t1Var2.f81581b &= -17;
            v6Var.o();
            return this;
        }
        int i11 = this.G.f81417i;
        ArrayList arrayList2 = this.f81569s;
        int iE = u.e(i11, arrayList2);
        t0 t0Var = iE >= 0 ? (t0) arrayList2.remove(iE) : null;
        Object objM = this.G.m();
        if (Intrinsics.b(objM, n.f81514a)) {
            t1Var = new t1(zVar);
            n0(t1Var);
        } else {
            Intrinsics.e(objM, "null cannot be cast to non-null type androidx.compose.runtime.RecomposeScopeImpl");
            t1Var = (t1) objM;
        }
        if (t0Var == null) {
            int i12 = t1Var.f81581b;
            boolean z13 = (i12 & 64) != 0;
            if (z13) {
                t1Var.f81581b = i12 & (-65);
            }
            z11 = z13;
        }
        int i13 = t1Var.f81581b;
        t1Var.f81581b = z11 ? i13 | 8 : i13 & (-9);
        arrayList.add(t1Var);
        t1Var.f81584e = this.B;
        t1Var.f81581b &= -17;
        v6Var.o();
        int i14 = t1Var.f81581b;
        if ((i14 & 256) != 0) {
            t1Var.f81581b = (i14 & (-257)) | EventBridgeChannel.QUEUE_CAPACITY;
            q1.m0 m0Var = this.M.f83367b.f83364b;
            m0Var.q0(q1.d0.f83383c);
            fg.a.P(m0Var, 0, t1Var);
            if (!this.f81575y) {
                int i15 = t1Var.f81581b;
                if ((i15 & 128) != 0) {
                    this.f81575y = true;
                    t1Var.f81581b = i15 | 1024;
                }
            }
        }
        return this;
    }

    public final boolean e(long j11) {
        Object objH = H();
        if ((objH instanceof Long) && j11 == ((Number) objH).longValue()) {
            return false;
        }
        n0(Long.valueOf(j11));
        return true;
    }

    public final void e0(Object obj) {
        if (!this.S && this.G.g() == 207 && !Intrinsics.b(this.G.f(), obj) && this.f81576z < 0) {
            this.f81576z = this.G.f81415g;
            this.f81575y = true;
        }
        W(null, Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE, 0, obj);
    }

    public final boolean f(Object obj) {
        if (Intrinsics.b(H(), obj)) {
            return false;
        }
        n0(obj);
        return true;
    }

    public final void f0() {
        W(null, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 2, null);
        this.f81568r = true;
    }

    public final boolean g(boolean z11) {
        Object objH = H();
        if ((objH instanceof Boolean) && z11 == ((Boolean) objH).booleanValue()) {
            return false;
        }
        n0(Boolean.valueOf(z11));
        return true;
    }

    public final void g0() {
        this.f81565m = 0;
        this.G = this.f81555c.d();
        W(null, 100, 0, null);
        w wVar = this.f81554b;
        wVar.r();
        n1 n1VarI = wVar.i();
        this.f81574x.g(this.f81573w ? 1 : 0);
        this.f81573w = f(n1VarI);
        this.K = null;
        if (!this.f81567q) {
            this.f81567q = wVar.e();
        }
        if (!this.C) {
            this.C = wVar.f();
        }
        if (this.C) {
            z2 z2VarA = a2.j.a();
            Intrinsics.e(z2VarA, "null cannot be cast to non-null type androidx.compose.runtime.CompositionLocal<kotlin.Any?>");
            n1VarI = ((x1.j) n1VarI).h(z2VarA, new a3(C()));
        }
        this.f81571u = n1VarI;
        Set set = (Set) a0.h(n1VarI, a2.l.f115a);
        if (set != null) {
            y yVar = this.U;
            if (yVar == null) {
                yVar = new y(this.f81560h);
                this.U = yVar;
            }
            set.add(yVar);
            wVar.n(set);
        }
        W(null, Long.hashCode(wVar.g()), 0, null);
    }

    public final boolean h(Object obj) {
        if (H() == obj) {
            return false;
        }
        n0(obj);
        return true;
    }

    public final boolean h0(t1 t1Var, Object obj) {
        a aVar = t1Var.f81582c;
        if (aVar == null) {
            return false;
        }
        int iB = this.G.f81409a.b(aVar);
        if (!this.F || iB < this.G.f81415g) {
            return false;
        }
        ArrayList arrayList = this.f81569s;
        int iE = u.e(iB, arrayList);
        if (iE < 0) {
            int i5 = -(iE + 1);
            if (!(obj instanceof i0)) {
                obj = null;
            }
            arrayList.add(i5, new t0(t1Var, iB, obj));
            return true;
        }
        t0 t0Var = (t0) arrayList.get(iE);
        if (!(obj instanceof i0)) {
            t0Var.f81579c = null;
            return true;
        }
        Object obj2 = t0Var.f81579c;
        if (obj2 == null) {
            t0Var.f81579c = obj;
            return true;
        }
        if (obj2 instanceof z.p0) {
            ((z.p0) obj2).d(obj);
            return true;
        }
        z.p0 p0Var = z.b1.f97745a;
        z.p0 p0Var2 = new z.p0(2);
        p0Var2.j(obj2);
        p0Var2.j(obj);
        t0Var.f81579c = p0Var2;
        return true;
    }

    public final void i() {
        this.f81562j = null;
        this.f81563k = 0;
        this.f81564l = 0;
        this.T = 0L;
        this.f81568r = false;
        q1.b bVar = this.M;
        bVar.f83368c = false;
        bVar.f83369d.f54485a = 0;
        bVar.f83371f = 0;
        bVar.f83370e = true;
        bVar.f83372g = 0;
        bVar.f83373h.clear();
        bVar.f83374i = -1;
        bVar.f83375j = -1;
        bVar.f83376k = -1;
        bVar.f83377l = 0;
        this.E.clear();
        this.o = null;
        this.f81566p = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0086  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i0(z.o0 o0Var) {
        ArrayList arrayList = this.f81569s;
        for (int iK = ul.b.K(arrayList); -1 < iK; iK--) {
            t0 t0Var = (t0) arrayList.get(iK);
            a aVar = t0Var.f81577a.f81582c;
            if (aVar == null || !aVar.a()) {
                arrayList.remove(iK);
            } else {
                int i5 = t0Var.f81578b;
                int i11 = aVar.f81379a;
                if (i5 != i11) {
                    t0Var.f81578b = i11;
                }
            }
        }
        Object[] objArr = o0Var.f97867b;
        Object[] objArr2 = o0Var.f97868c;
        long[] jArr = o0Var.f97866a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i12 = 0;
            while (true) {
                long j11 = jArr[i12];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i13 = 8 - ((~(i12 - length)) >>> 31);
                    for (int i14 = 0; i14 < i13; i14++) {
                        if ((255 & j11) < 128) {
                            int i15 = (i12 << 3) + i14;
                            Object obj = objArr[i15];
                            Object obj2 = objArr2[i15];
                            Intrinsics.e(obj, "null cannot be cast to non-null type androidx.compose.runtime.RecomposeScopeImpl");
                            t1 t1Var = (t1) obj;
                            a aVar2 = t1Var.f81582c;
                            if (aVar2 != null) {
                                int i16 = aVar2.f81379a;
                                if (obj2 == g1.f81424d) {
                                    obj2 = null;
                                }
                                arrayList.add(new t0(t1Var, i16, obj2));
                            }
                        }
                        j11 >>= 8;
                    }
                    if (i13 != 8) {
                        break;
                    } else if (i12 == length) {
                        break;
                    } else {
                        i12++;
                    }
                }
            }
        }
        b70.c.y0(arrayList, u.f81592f);
    }

    public final Object j(androidx.compose.runtime.e eVar) {
        return a0.h(l(), eVar);
    }

    public final void j0(int i5, int i11) {
        if (o0(i5) != i11) {
            if (i5 < 0) {
                z.a0 a0Var = this.f81566p;
                if (a0Var == null) {
                    a0Var = new z.a0();
                    this.f81566p = a0Var;
                }
                a0Var.f(i5, i11);
                return;
            }
            int[] iArr = this.o;
            if (iArr == null) {
                iArr = new int[this.G.f81411c];
                u90.b.C(-1, 0, 6, iArr);
                this.o = iArr;
            }
            iArr[i5] = i11;
        }
    }

    public final void k(Function0 function0) {
        if (!this.f81568r) {
            u.c("A call to createNode(), emitNode() or useNode() expected was not expected");
        }
        this.f81568r = false;
        if (!this.S) {
            u.c("createNode() can only be called when inserting");
        }
        fa.t tVar = this.n;
        int i5 = ((int[]) tVar.f54486b)[tVar.f54485a - 1];
        k2 k2Var = this.I;
        a aVarB = k2Var.b(k2Var.f81484v);
        this.f81564l++;
        q1.c cVar = this.O;
        q1.m0 m0Var = cVar.f83379b;
        m0Var.q0(q1.r.f83414d);
        fg.a.P(m0Var, 0, function0);
        m0Var.f83406d[m0Var.f83407e - m0Var.f83404b[m0Var.f83405c - 1].f83395a] = i5;
        fg.a.P(m0Var, 1, aVarB);
        q1.m0 m0Var2 = cVar.f83380c;
        m0Var2.q0(q1.r.f83415e);
        m0Var2.f83406d[m0Var2.f83407e - m0Var2.f83404b[m0Var2.f83405c - 1].f83395a] = i5;
        fg.a.P(m0Var2, 0, aVarB);
    }

    public final void k0(int i5, int i11) {
        int iO0 = o0(i5);
        if (iO0 != i11) {
            int i12 = i11 - iO0;
            ArrayList arrayList = this.f81561i;
            int size = arrayList.size() - 1;
            while (i5 != -1) {
                int iO02 = o0(i5) + i12;
                j0(i5, iO02);
                int i13 = size;
                while (true) {
                    if (-1 < i13) {
                        m1 m1Var = (m1) arrayList.get(i13);
                        if (m1Var != null && m1Var.a(i5, iO02)) {
                            size = i13 - 1;
                            break;
                        }
                        i13--;
                    } else {
                        break;
                    }
                }
                if (i5 < 0) {
                    i5 = this.G.f81417i;
                } else if (this.G.l(i5)) {
                    return;
                } else {
                    i5 = this.G.q(i5);
                }
            }
        }
    }

    public final n1 l() {
        n1 n1Var;
        n1 n1Var2 = this.K;
        if (n1Var2 != null) {
            return n1Var2;
        }
        int iQ = this.G.f81417i;
        boolean z11 = this.S;
        h1 h1Var = u.f81589c;
        if (z11 && this.J) {
            int iD = this.I.f81484v;
            while (iD > 0) {
                k2 k2Var = this.I;
                if (k2Var.f81466b[k2Var.r(iD) * 5] == 202 && Intrinsics.b(this.I.s(iD), h1Var)) {
                    Object objQ = this.I.q(iD);
                    Intrinsics.e(objQ, "null cannot be cast to non-null type androidx.compose.runtime.PersistentCompositionLocalMap");
                    n1 n1Var3 = (n1) objQ;
                    this.K = n1Var3;
                    return n1Var3;
                }
                k2 k2Var2 = this.I;
                iD = k2Var2.D(k2Var2.f81466b, iD);
            }
        }
        if (this.G.f81411c > 0) {
            while (iQ > 0) {
                if (this.G.i(iQ) == 202) {
                    f2 f2Var = this.G;
                    if (Intrinsics.b(f2Var.p(f2Var.f81410b, iQ), h1Var)) {
                        z.c0 c0Var = this.f81572v;
                        if (c0Var == null || (n1Var = (n1) c0Var.b(iQ)) == null) {
                            f2 f2Var2 = this.G;
                            Object objB = f2Var2.b(f2Var2.f81410b, iQ);
                            Intrinsics.e(objB, "null cannot be cast to non-null type androidx.compose.runtime.PersistentCompositionLocalMap");
                            n1Var = (n1) objB;
                        }
                        this.K = n1Var;
                        return n1Var;
                    }
                }
                iQ = this.G.q(iQ);
            }
        }
        n1 n1Var4 = this.f81571u;
        this.K = n1Var4;
        return n1Var4;
    }

    public final x1.j l0(n1 n1Var, x1.j jVar) {
        x1.j jVar2 = (x1.j) n1Var;
        jVar2.getClass();
        x1.i iVar = new x1.i(jVar2);
        iVar.f94959g = jVar2;
        iVar.putAll(jVar);
        x1.j jVarBuild = iVar.build();
        Y(Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, u.f81590d);
        H();
        n0(jVarBuild);
        H();
        n0(jVar);
        p(false);
        return jVarBuild;
    }

    public final List m() {
        if (!this.C) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(a2.b.c(this.I));
        arrayList.addAll(a2.b.a(this.G));
        arrayList.addAll(I());
        return arrayList;
    }

    public final void m0(Object obj) {
        int i5;
        f2 f2Var;
        int i11;
        k2 k2Var;
        if (obj instanceof z1) {
            z1 z1Var = (z1) obj;
            a aVarA = null;
            if (this.S) {
                k2 k2Var2 = this.I;
                int i12 = k2Var2.f81482t;
                if (i12 > k2Var2.f81484v + 1) {
                    int i13 = i12 - 1;
                    int iD = k2Var2.D(k2Var2.f81466b, i13);
                    while (true) {
                        i11 = i13;
                        i13 = iD;
                        k2Var = this.I;
                        if (i13 == k2Var.f81484v || i13 < 0) {
                            break;
                        } else {
                            iD = k2Var.D(k2Var.f81466b, i13);
                        }
                    }
                    aVarA = k2Var.b(i11);
                }
            } else {
                f2 f2Var2 = this.G;
                int i14 = f2Var2.f81415g;
                if (i14 > f2Var2.f81417i + 1) {
                    int i15 = i14 - 1;
                    int iQ = f2Var2.q(i15);
                    while (true) {
                        i5 = i15;
                        i15 = iQ;
                        f2Var = this.G;
                        if (i15 == f2Var.f81417i || i15 < 0) {
                            break;
                        } else {
                            iQ = f2Var.q(i15);
                        }
                    }
                    aVarA = f2Var.a(i5);
                }
            }
            a2 a2Var = new a2(z1Var, aVarA);
            if (this.S) {
                q1.m0 m0Var = this.M.f83367b.f83364b;
                m0Var.q0(q1.w.f83423c);
                fg.a.P(m0Var, 0, a2Var);
            }
            this.f81556d.add(obj);
            obj = a2Var;
        }
        n0(obj);
    }

    public final void n(z.o0 o0Var, Function2 function2) {
        ArrayList arrayList = this.f81569s;
        if (this.F) {
            u.c("Reentrant composition is not supported");
        }
        this.f81559g.o();
        Trace.beginSection("Compose:recompose");
        try {
            this.B = Long.hashCode(z1.k.k().g());
            this.f81572v = null;
            i0(o0Var);
            this.f81563k = 0;
            this.F = true;
            try {
                g0();
                Object objH = H();
                if (objH != function2 && function2 != null) {
                    n0(function2);
                }
                s sVar = this.D;
                r1.e eVarC = androidx.compose.runtime.d.c();
                try {
                    eVarC.b(sVar);
                    h1 h1Var = u.f81587a;
                    if (function2 != null) {
                        Y(200, h1Var);
                        x1.k.b(this, function2);
                        p(false);
                    } else if (!this.f81573w || objH == null || objH.equals(n.f81514a)) {
                        T();
                    } else {
                        Y(200, h1Var);
                        TypeIntrinsics.e(2, objH);
                        x1.k.b(this, (Function2) objH);
                        p(false);
                    }
                    eVarC.k(eVarC.f85079c - 1);
                    w();
                    this.F = false;
                    arrayList.clear();
                    if (!this.I.f81485w) {
                        u.c("Check failed");
                    }
                    y();
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    eVarC.k(eVarC.f85079c - 1);
                    throw th2;
                }
            } finally {
            }
        } finally {
            Trace.endSection();
        }
    }

    public final void n0(Object obj) {
        if (this.S) {
            k2 k2Var = this.I;
            if (k2Var.n <= 0 || k2Var.f81473i == k2Var.f81475k) {
                k2Var.E(obj);
                return;
            }
            z.c0 c0Var = k2Var.f81481s;
            if (c0Var == null) {
                c0Var = new z.c0();
            }
            k2Var.f81481s = c0Var;
            int i5 = k2Var.f81484v;
            Object objB = c0Var.b(i5);
            if (objB == null) {
                objB = new z.j0();
                c0Var.h(i5, objB);
            }
            ((z.j0) objB).g(obj);
            return;
        }
        f2 f2Var = this.G;
        boolean z11 = f2Var.n;
        q1.b bVar = this.M;
        if (!z11) {
            a aVarA = f2Var.a(f2Var.f81417i);
            q1.m0 m0Var = bVar.f83367b.f83364b;
            m0Var.q0(q1.e.f83384c);
            fg.a.Q(m0Var, 0, aVarA, 1, obj);
            return;
        }
        int iC = (f2Var.f81420l - i2.c(f2Var.f81410b, f2Var.f81417i)) - 1;
        if (bVar.f83366a.G.f81417i - bVar.f83371f >= 0) {
            bVar.d(true);
            q1.m0 m0Var2 = bVar.f83367b.f83364b;
            m0Var2.q0(q1.r.f83417g);
            fg.a.P(m0Var2, 0, obj);
            m0Var2.f83406d[m0Var2.f83407e - m0Var2.f83404b[m0Var2.f83405c - 1].f83395a] = iC;
            return;
        }
        f2 f2Var2 = this.G;
        a aVarA2 = f2Var2.a(f2Var2.f81417i);
        q1.m0 m0Var3 = bVar.f83367b.f83364b;
        m0Var3.q0(q1.r.f83416f);
        fg.a.Q(m0Var3, 0, obj, 1, aVarA2);
        m0Var3.f83406d[m0Var3.f83407e - m0Var3.f83404b[m0Var3.f83405c - 1].f83395a] = iC;
    }

    public final void o(int i5, int i11) {
        if (i5 <= 0 || i5 == i11) {
            return;
        }
        o(this.G.q(i5), i11);
        if (this.G.l(i5)) {
            Object objN = this.G.n(i5);
            q1.b bVar = this.M;
            bVar.c();
            bVar.f83373h.add(objN);
        }
    }

    public final int o0(int i5) {
        int i11;
        if (i5 >= 0) {
            int[] iArr = this.o;
            return (iArr == null || (i11 = iArr[i5]) < 0) ? this.G.o(i5) : i11;
        }
        z.a0 a0Var = this.f81566p;
        if (a0Var == null || a0Var.a(i5) < 0) {
            return 0;
        }
        int iA = a0Var.a(i5);
        if (iA >= 0) {
            return a0Var.f97776c[iA];
        }
        android.support.v4.media.session.b.n0("Cannot find value for key " + i5);
        throw null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:150:0x03ab  */
    /* JADX WARN: Removed duplicated region for block: B:201:0x051e  */
    /* JADX WARN: Type inference failed for: r3v19 */
    /* JADX WARN: Type inference failed for: r3v29, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r3v32 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void p(boolean z11) {
        long jRotateRight;
        fa.t tVar;
        ArrayList arrayList;
        int i5;
        ?? r32;
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        fa.t tVar2;
        int i16;
        int i17;
        ArrayList arrayList2;
        LinkedHashSet linkedHashSet;
        int i18;
        int i19;
        ArrayList arrayList3;
        ArrayList arrayList4;
        HashSet hashSet;
        int i21;
        m1 m1Var;
        int i22;
        Object[] objArr;
        long[] jArr;
        int i23;
        Object[] objArr2;
        long[] jArr2;
        int i24;
        Object[] objArr3;
        long[] jArr3;
        int i25;
        Object[] objArr4;
        long[] jArr4;
        long jRotateRight2;
        fa.t tVar3 = this.n;
        int i26 = ((int[]) tVar3.f54486b)[tVar3.f54485a - 2] - 1;
        boolean z12 = this.S;
        g1 g1Var = n.f81514a;
        if (z12) {
            k2 k2Var = this.I;
            int i27 = k2Var.f81484v;
            int i28 = k2Var.f81466b[k2Var.r(i27) * 5];
            Object objS = this.I.s(i27);
            Object objQ = this.I.q(i27);
            if (objS != null) {
                jRotateRight2 = Long.rotateRight(this.T ^ 0, 3) ^ (objS instanceof Enum ? ((Enum) objS).ordinal() : objS.hashCode());
            } else if (objQ == null || i28 != 207 || objQ.equals(g1Var)) {
                jRotateRight2 = Long.rotateRight(this.T ^ i26, 3) ^ i28;
            } else {
                this.T = Long.rotateRight(Long.rotateRight(this.T ^ i26, 3) ^ objQ.hashCode(), 3);
            }
            this.T = Long.rotateRight(jRotateRight2, 3);
        } else {
            f2 f2Var = this.G;
            int i29 = f2Var.f81417i;
            int i31 = f2Var.i(i29);
            f2 f2Var2 = this.G;
            Object objP = f2Var2.p(f2Var2.f81410b, i29);
            f2 f2Var3 = this.G;
            Object objB = f2Var3.b(f2Var3.f81410b, i29);
            if (objP != null) {
                jRotateRight = Long.rotateRight(this.T ^ 0, 3) ^ (objP instanceof Enum ? ((Enum) objP).ordinal() : objP.hashCode());
            } else if (objB == null || i31 != 207 || objB.equals(g1Var)) {
                jRotateRight = Long.rotateRight(this.T ^ i26, 3) ^ i31;
            } else {
                this.T = Long.rotateRight(Long.rotateRight(this.T ^ i26, 3) ^ objB.hashCode(), 3);
            }
            this.T = Long.rotateRight(jRotateRight, 3);
        }
        int i32 = this.f81564l;
        m1 m1Var2 = this.f81562j;
        ArrayList arrayList5 = this.f81569s;
        q1.b bVar = this.M;
        if (m1Var2 != null) {
            z.c0 c0Var = m1Var2.f81511e;
            int i33 = m1Var2.f81508b;
            ArrayList arrayList6 = m1Var2.f81507a;
            if (arrayList6.size() > 0) {
                ArrayList arrayList7 = m1Var2.f81510d;
                HashSet hashSet2 = new HashSet(arrayList7.size());
                int size = arrayList7.size();
                for (int i34 = 0; i34 < size; i34++) {
                    hashSet2.add(arrayList7.get(i34));
                }
                i5 = -1;
                LinkedHashSet linkedHashSet2 = new LinkedHashSet();
                int size2 = arrayList7.size();
                int size3 = arrayList6.size();
                int i35 = 0;
                int i36 = 0;
                int i37 = 0;
                while (i35 < size3) {
                    w0 w0Var = (w0) arrayList6.get(i35);
                    if (hashSet2.contains(w0Var)) {
                        tVar2 = tVar3;
                        i16 = i35;
                        if (!linkedHashSet2.contains(w0Var)) {
                            int i38 = i36;
                            if (i38 < size2) {
                                w0 w0Var2 = (w0) arrayList7.get(i38);
                                if (w0Var2 != w0Var) {
                                    q0 q0Var = (q0) c0Var.b(w0Var2.f81611c);
                                    int i39 = q0Var != null ? q0Var.f81527b : -1;
                                    linkedHashSet2.add(w0Var2);
                                    i17 = i38;
                                    i21 = i37;
                                    m1Var = m1Var2;
                                    if (i39 != i21) {
                                        q0 q0Var2 = (q0) c0Var.b(w0Var2.f81611c);
                                        int i40 = q0Var2 != null ? q0Var2.f81528c : w0Var2.f81612d;
                                        linkedHashSet = linkedHashSet2;
                                        int i41 = i39 + i33;
                                        i18 = size2;
                                        int i42 = i21 + i33;
                                        if (i40 > 0) {
                                            i19 = i33;
                                            int i43 = bVar.f83377l;
                                            if (i43 > 0) {
                                                arrayList3 = arrayList6;
                                                if (bVar.f83375j == i41 - i43 && bVar.f83376k == i42 - i43) {
                                                    bVar.f83377l = i43 + i40;
                                                }
                                            } else {
                                                arrayList3 = arrayList6;
                                            }
                                            bVar.c();
                                            bVar.f83375j = i41;
                                            bVar.f83376k = i42;
                                            bVar.f83377l = i40;
                                        } else {
                                            i19 = i33;
                                            arrayList3 = arrayList6;
                                            bVar.getClass();
                                        }
                                        if (i39 > i21) {
                                            Object[] objArr5 = c0Var.f97796c;
                                            long[] jArr5 = c0Var.f97794a;
                                            int length = jArr5.length - 2;
                                            if (length >= 0) {
                                                arrayList4 = arrayList7;
                                                hashSet = hashSet2;
                                                int i44 = 0;
                                                while (true) {
                                                    long j11 = jArr5[i44];
                                                    int i45 = i40;
                                                    arrayList2 = arrayList5;
                                                    if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                                        int i46 = 8 - ((~(i44 - length)) >>> 31);
                                                        int i47 = 0;
                                                        while (i47 < i46) {
                                                            if ((j11 & 255) < 128) {
                                                                i25 = i47;
                                                                q0 q0Var3 = (q0) objArr5[(i44 << 3) + i47];
                                                                objArr4 = objArr5;
                                                                int i48 = q0Var3.f81527b;
                                                                jArr4 = jArr5;
                                                                if (i39 <= i48 && i48 < i39 + i45) {
                                                                    q0Var3.f81527b = (i48 - i39) + i21;
                                                                } else if (i21 <= i48 && i48 < i39) {
                                                                    q0Var3.f81527b = i48 + i45;
                                                                }
                                                            } else {
                                                                i25 = i47;
                                                                objArr4 = objArr5;
                                                                jArr4 = jArr5;
                                                            }
                                                            j11 >>= 8;
                                                            i47 = i25 + 1;
                                                            objArr5 = objArr4;
                                                            jArr5 = jArr4;
                                                        }
                                                        objArr3 = objArr5;
                                                        jArr3 = jArr5;
                                                        if (i46 != 8) {
                                                            break;
                                                        }
                                                    } else {
                                                        objArr3 = objArr5;
                                                        jArr3 = jArr5;
                                                    }
                                                    if (i44 == length) {
                                                        break;
                                                    }
                                                    i44++;
                                                    arrayList5 = arrayList2;
                                                    i40 = i45;
                                                    objArr5 = objArr3;
                                                    jArr5 = jArr3;
                                                }
                                            } else {
                                                arrayList2 = arrayList5;
                                            }
                                        } else {
                                            int i49 = i40;
                                            arrayList2 = arrayList5;
                                            arrayList4 = arrayList7;
                                            hashSet = hashSet2;
                                            if (i21 > i39) {
                                                Object[] objArr6 = c0Var.f97796c;
                                                long[] jArr6 = c0Var.f97794a;
                                                int length2 = jArr6.length - 2;
                                                if (length2 >= 0) {
                                                    int i51 = 0;
                                                    while (true) {
                                                        long j12 = jArr6[i51];
                                                        if ((((~j12) << 7) & j12 & (-9187201950435737472L)) != -9187201950435737472L) {
                                                            int i52 = 8 - ((~(i51 - length2)) >>> 31);
                                                            int i53 = 0;
                                                            while (i53 < i52) {
                                                                if ((j12 & 255) < 128) {
                                                                    objArr2 = objArr6;
                                                                    q0 q0Var4 = (q0) objArr6[(i51 << 3) + i53];
                                                                    jArr2 = jArr6;
                                                                    int i54 = q0Var4.f81527b;
                                                                    i24 = i39;
                                                                    if (i39 <= i54 && i54 < i24 + i49) {
                                                                        q0Var4.f81527b = (i54 - i24) + i21;
                                                                    } else if (i24 + 1 <= i54 && i54 < i21) {
                                                                        q0Var4.f81527b = i54 - i49;
                                                                    }
                                                                } else {
                                                                    objArr2 = objArr6;
                                                                    jArr2 = jArr6;
                                                                    i24 = i39;
                                                                }
                                                                j12 >>= 8;
                                                                i53++;
                                                                jArr6 = jArr2;
                                                                objArr6 = objArr2;
                                                                i39 = i24;
                                                            }
                                                            objArr = objArr6;
                                                            jArr = jArr6;
                                                            i23 = i39;
                                                            if (i52 != 8) {
                                                                break;
                                                            }
                                                        } else {
                                                            objArr = objArr6;
                                                            jArr = jArr6;
                                                            i23 = i39;
                                                        }
                                                        if (i51 == length2) {
                                                            break;
                                                        }
                                                        i51++;
                                                        jArr6 = jArr;
                                                        objArr6 = objArr;
                                                        i39 = i23;
                                                    }
                                                }
                                            }
                                        }
                                        i22 = i16;
                                    } else {
                                        arrayList2 = arrayList5;
                                        linkedHashSet = linkedHashSet2;
                                        i18 = size2;
                                        i19 = i33;
                                        arrayList3 = arrayList6;
                                    }
                                    arrayList4 = arrayList7;
                                    hashSet = hashSet2;
                                    i22 = i16;
                                } else {
                                    i17 = i38;
                                    arrayList2 = arrayList5;
                                    linkedHashSet = linkedHashSet2;
                                    i18 = size2;
                                    i19 = i33;
                                    arrayList3 = arrayList6;
                                    arrayList4 = arrayList7;
                                    hashSet = hashSet2;
                                    i21 = i37;
                                    m1Var = m1Var2;
                                    i22 = i16 + 1;
                                }
                                i36 = i17 + 1;
                                q0 q0Var5 = (q0) c0Var.b(w0Var2.f81611c);
                                int i55 = i21 + (q0Var5 != null ? q0Var5.f81528c : w0Var2.f81612d);
                                i35 = i22;
                                m1Var2 = m1Var;
                                linkedHashSet2 = linkedHashSet;
                                size2 = i18;
                                i33 = i19;
                                arrayList6 = arrayList3;
                                arrayList7 = arrayList4;
                                hashSet2 = hashSet;
                                arrayList5 = arrayList2;
                                i37 = i55;
                                tVar3 = tVar2;
                            } else {
                                i36 = i38;
                                tVar3 = tVar2;
                                i35 = i16;
                            }
                        }
                    } else {
                        tVar2 = tVar3;
                        q0 q0Var6 = (q0) c0Var.b(w0Var.f81611c);
                        int i56 = q0Var6 != null ? q0Var6.f81527b : -1;
                        int i57 = w0Var.f81611c;
                        i16 = i35;
                        bVar.e(i56 + i33, w0Var.f81612d);
                        m1Var2.a(i57, 0);
                        bVar.f83371f = (i57 - bVar.f83366a.G.f81415g) + bVar.f83371f;
                        this.G.r(i57);
                        M();
                        this.G.s();
                        u.a(i57, this.G.f81410b[(i57 * 5) + 3] + i57, arrayList5);
                    }
                    i35 = i16 + 1;
                    tVar3 = tVar2;
                }
                tVar = tVar3;
                arrayList = arrayList5;
                bVar.c();
                if (arrayList6.size() > 0) {
                    f2 f2Var4 = this.G;
                    bVar.f83371f = (f2Var4.f81416h - bVar.f83366a.G.f81415g) + bVar.f83371f;
                    f2Var4.t();
                }
            } else {
                tVar = tVar3;
                arrayList = arrayList5;
                i5 = -1;
            }
        }
        boolean z13 = this.S;
        if (!z13) {
            f2 f2Var5 = this.G;
            int i58 = f2Var5.f81421m - f2Var5.f81420l;
            if (i58 > 0) {
                if (i58 > 0) {
                    bVar.d(false);
                    fa.t tVar4 = bVar.f83369d;
                    f2 f2Var6 = bVar.f83366a.G;
                    if (f2Var6.f81411c > 0 && tVar4.e(-2) != (i15 = f2Var6.f81417i)) {
                        if (!bVar.f83368c && bVar.f83370e) {
                            bVar.d(false);
                            bVar.f83367b.f83364b.q0(q1.q.f83413c);
                            bVar.f83368c = true;
                        }
                        if (i15 > 0) {
                            a aVarA = f2Var6.a(i15);
                            tVar4.g(i15);
                            bVar.d(false);
                            q1.m0 m0Var = bVar.f83367b.f83364b;
                            m0Var.q0(q1.p.f83412c);
                            fg.a.P(m0Var, 0, aVarA);
                            bVar.f83368c = true;
                        }
                    }
                    q1.m0 m0Var2 = bVar.f83367b.f83364b;
                    m0Var2.q0(q1.e0.f83385c);
                    m0Var2.f83406d[m0Var2.f83407e - m0Var2.f83404b[m0Var2.f83405c - 1].f83395a] = i58;
                } else {
                    bVar.getClass();
                }
            }
        }
        int i59 = this.f81563k;
        while (true) {
            f2 f2Var7 = this.G;
            if (f2Var7.f81419k > 0 || (i14 = f2Var7.f81415g) == f2Var7.f81416h) {
                break;
            }
            M();
            bVar.e(i59, this.G.s());
            u.a(i14, this.G.f81415g, arrayList);
        }
        if (z13) {
            if (z11) {
                q1.c cVar = this.O;
                q1.m0 m0Var3 = cVar.f83380c;
                if (!m0Var3.p0()) {
                    u.c("Cannot end node insertion, there are no pending operations that can be realized.");
                }
                q1.m0 m0Var4 = cVar.f83379b;
                q1.j0[] j0VarArr = m0Var3.f83404b;
                int i61 = m0Var3.f83405c - 1;
                m0Var3.f83405c = i61;
                q1.j0 j0Var = j0VarArr[i61];
                j0VarArr[i61] = null;
                m0Var4.q0(j0Var);
                Object[] objArr7 = m0Var3.f83408f;
                Object[] objArr8 = m0Var4.f83408f;
                int i62 = m0Var4.f83409g;
                int i63 = j0Var.f83396b;
                int i64 = m0Var3.f83409g;
                int i65 = i64 - i63;
                System.arraycopy(objArr7, i65, objArr8, i62 - i63, i64 - i65);
                Object[] objArr9 = m0Var3.f83408f;
                int i66 = m0Var3.f83409g;
                Arrays.fill(objArr9, i66 - i63, i66, (Object) null);
                int[] iArr = m0Var3.f83406d;
                int[] iArr2 = m0Var4.f83406d;
                int i67 = m0Var4.f83407e;
                int i68 = j0Var.f83395a;
                int i69 = m0Var3.f83407e;
                u90.b.p(i67 - i68, i69 - i68, iArr, iArr2, i69);
                m0Var3.f83409g -= i63;
                m0Var3.f83407e -= i68;
                i32 = 1;
            }
            if (this.G.f81419k <= 0) {
                o1.a("Unbalanced begin/end empty");
            }
            r4.f81419k--;
            k2 k2Var2 = this.I;
            int i71 = k2Var2.f81484v;
            k2Var2.j();
            if (this.G.f81419k <= 0) {
                int i72 = (-2) - i71;
                this.I.k();
                this.I.e(true);
                a aVar = this.N;
                if (this.O.f83379b.o0()) {
                    g2 g2Var = this.H;
                    bVar.b();
                    bVar.d(false);
                    fa.t tVar5 = bVar.f83369d;
                    f2 f2Var8 = bVar.f83366a.G;
                    if (f2Var8.f81411c <= 0 || tVar5.e(-2) == (i13 = f2Var8.f81417i)) {
                        i12 = 1;
                        bVar.c();
                        q1.m0 m0Var5 = bVar.f83367b.f83364b;
                        m0Var5.q0(q1.s.f83419c);
                        fg.a.Q(m0Var5, 0, aVar, i12, g2Var);
                        r32 = 0;
                    } else {
                        if (!bVar.f83368c && bVar.f83370e) {
                            bVar.d(false);
                            bVar.f83367b.f83364b.q0(q1.q.f83413c);
                            bVar.f83368c = true;
                        }
                        if (i13 > 0) {
                            a aVarA2 = f2Var8.a(i13);
                            tVar5.g(i13);
                            bVar.d(false);
                            q1.m0 m0Var6 = bVar.f83367b.f83364b;
                            m0Var6.q0(q1.p.f83412c);
                            fg.a.P(m0Var6, 0, aVarA2);
                            i12 = 1;
                            bVar.f83368c = true;
                        }
                        bVar.c();
                        q1.m0 m0Var52 = bVar.f83367b.f83364b;
                        m0Var52.q0(q1.s.f83419c);
                        fg.a.Q(m0Var52, 0, aVar, i12, g2Var);
                        r32 = 0;
                    }
                } else {
                    g2 g2Var2 = this.H;
                    q1.c cVar2 = this.O;
                    bVar.b();
                    bVar.d(false);
                    fa.t tVar6 = bVar.f83369d;
                    f2 f2Var9 = bVar.f83366a.G;
                    if (f2Var9.f81411c > 0 && tVar6.e(-2) != (i11 = f2Var9.f81417i)) {
                        if (!bVar.f83368c && bVar.f83370e) {
                            bVar.d(false);
                            bVar.f83367b.f83364b.q0(q1.q.f83413c);
                            bVar.f83368c = true;
                        }
                        if (i11 > 0) {
                            a aVarA3 = f2Var9.a(i11);
                            tVar6.g(i11);
                            bVar.d(false);
                            q1.m0 m0Var7 = bVar.f83367b.f83364b;
                            m0Var7.q0(q1.p.f83412c);
                            fg.a.P(m0Var7, 0, aVarA3);
                            bVar.f83368c = true;
                        }
                    }
                    bVar.c();
                    q1.m0 m0Var8 = bVar.f83367b.f83364b;
                    m0Var8.q0(q1.t.f83420c);
                    int i73 = m0Var8.f83409g - m0Var8.f83404b[m0Var8.f83405c - 1].f83396b;
                    Object[] objArr10 = m0Var8.f83408f;
                    objArr10[i73] = aVar;
                    objArr10[i73 + 1] = g2Var2;
                    objArr10[i73 + 2] = cVar2;
                    this.O = new q1.c();
                    r32 = 0;
                }
                this.S = r32;
                if (this.f81555c.f81428b != 0) {
                    j0(i72, r32);
                    k0(i72, i32);
                }
            }
        } else {
            if (z11) {
                bVar.a();
            }
            int i74 = bVar.f83366a.G.f81417i;
            fa.t tVar7 = bVar.f83369d;
            int i75 = i5;
            if (tVar7.e(i75) > i74) {
                u.c("Missed recording an endGroup");
            }
            if (tVar7.e(i75) == i74) {
                bVar.d(false);
                tVar7.f();
                bVar.f83367b.f83364b.q0(q1.m.f83403c);
            }
            int i76 = this.G.f81417i;
            if (i32 != o0(i76)) {
                k0(i76, i32);
            }
            if (z11) {
                i32 = 1;
            }
            this.G.e();
            bVar.c();
        }
        m1 m1Var3 = (m1) this.f81561i.remove(r3.size() - 1);
        if (m1Var3 != null && !z13) {
            m1Var3.f81509c++;
        }
        this.f81562j = m1Var3;
        this.f81563k = tVar.f() + i32;
        this.f81565m = tVar.f();
        this.f81564l = tVar.f() + i32;
    }

    public final void p0() {
        if (!this.f81568r) {
            u.c("A call to createNode(), emitNode() or useNode() expected was not expected");
        }
        this.f81568r = false;
        if (this.S) {
            u.c("useNode() called while inserting");
        }
        f2 f2Var = this.G;
        Object objN = f2Var.n(f2Var.f81417i);
        q1.b bVar = this.M;
        bVar.c();
        bVar.f83373h.add(objN);
        if (this.f81575y && (objN instanceof k)) {
            bVar.b();
            bVar.f83367b.f83364b.q0(q1.i0.f83393c);
        }
    }

    public final void q() {
        p(false);
        t1 t1VarA = A();
        if (t1VarA != null) {
            int i5 = t1VarA.f81581b;
            if ((i5 & 1) != 0) {
                t1VarA.f81581b = i5 | 2;
            }
        }
    }

    public final void r() {
        p(true);
    }

    public final void s() {
        p(false);
    }

    public final void t() {
        p(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0082 A[EDGE_INSN: B:59:0x0082->B:28:0x0082 BREAK  A[LOOP:0: B:15:0x003e->B:27:0x007f], EDGE_INSN: B:60:0x0082->B:28:0x0082 BREAK  A[LOOP:0: B:15:0x003e->B:27:0x007f]] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final t1 u() {
        t1 t1Var;
        a aVarA;
        Function1 function1;
        int i5;
        ArrayList arrayList = this.E;
        final t1 t1Var2 = !arrayList.isEmpty() ? (t1) arrayList.remove(arrayList.size() - 1) : null;
        if (t1Var2 != null) {
            t1Var2.f81581b &= -9;
            this.f81559g.o();
            final int i11 = this.B;
            final z.h0 h0Var = t1Var2.f81585f;
            if (h0Var == null || (t1Var2.f81581b & 16) != 0) {
                function1 = null;
                q1.b bVar = this.M;
                if (function1 != null) {
                    q1.m0 m0Var = bVar.f83367b.f83364b;
                    m0Var.q0(q1.l.f83398c);
                    fg.a.Q(m0Var, 0, function1, 1, this.f81560h);
                }
                i5 = t1Var2.f81581b;
                if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
                    t1Var2.f81581b = i5 & (-513);
                    q1.m0 m0Var2 = bVar.f83367b.f83364b;
                    m0Var2.q0(q1.o.f83411c);
                    fg.a.P(m0Var2, 0, t1Var2);
                    int i12 = t1Var2.f81581b;
                    t1Var2.f81581b = i12 & (-129);
                    if ((i12 & 1024) != 0) {
                        t1Var2.f81581b = i12 & (-1153);
                        this.f81575y = false;
                    }
                }
            } else {
                Object[] objArr = h0Var.f97830b;
                int[] iArr = h0Var.f97831c;
                long[] jArr = h0Var.f97829a;
                int length = jArr.length - 2;
                if (length >= 0) {
                    int i13 = 0;
                    loop0: while (true) {
                        long j11 = jArr[i13];
                        if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                            int i14 = 8 - ((~(i13 - length)) >>> 31);
                            for (int i15 = 0; i15 < i14; i15++) {
                                if ((j11 & 255) < 128) {
                                    int i16 = (i13 << 3) + i15;
                                    Object obj = objArr[i16];
                                    if (iArr[i16] != i11) {
                                        function1 = new Function1() { // from class: p1.s1
                                            @Override // kotlin.jvm.functions.Function1
                                            public final Object invoke(Object obj2) {
                                                v vVar;
                                                v vVar2;
                                                int i17;
                                                v vVar3 = (v) obj2;
                                                t1 t1Var3 = t1Var2;
                                                int i18 = t1Var3.f81584e;
                                                int i19 = i11;
                                                if (i18 == i19) {
                                                    z.h0 h0Var2 = t1Var3.f81585f;
                                                    z.h0 h0Var3 = h0Var;
                                                    if (Intrinsics.b(h0Var3, h0Var2) && (vVar3 instanceof z)) {
                                                        long[] jArr2 = h0Var3.f97829a;
                                                        int length2 = jArr2.length - 2;
                                                        if (length2 >= 0) {
                                                            int i21 = 0;
                                                            while (true) {
                                                                long j12 = jArr2[i21];
                                                                if ((((~j12) << 7) & j12 & (-9187201950435737472L)) != -9187201950435737472L) {
                                                                    int i22 = 8;
                                                                    int i23 = 8 - ((~(i21 - length2)) >>> 31);
                                                                    int i24 = 0;
                                                                    while (i24 < i23) {
                                                                        if ((255 & j12) < 128) {
                                                                            int i25 = (i21 << 3) + i24;
                                                                            Object obj3 = h0Var3.f97830b[i25];
                                                                            boolean z11 = h0Var3.f97831c[i25] != i19;
                                                                            if (z11) {
                                                                                i17 = i22;
                                                                                z zVar = (z) vVar3;
                                                                                z.o0 o0Var = zVar.f81674g;
                                                                                ab.e0.R(o0Var, obj3, t1Var3);
                                                                                vVar2 = vVar3;
                                                                                if (obj3 instanceof i0) {
                                                                                    i0 i0Var = (i0) obj3;
                                                                                    if (!o0Var.b(i0Var)) {
                                                                                        ab.e0.T(zVar.f81677j, i0Var);
                                                                                    }
                                                                                    z.o0 o0Var2 = t1Var3.f81586g;
                                                                                    if (o0Var2 != null) {
                                                                                        o0Var2.k(obj3);
                                                                                    }
                                                                                }
                                                                            } else {
                                                                                vVar2 = vVar3;
                                                                                i17 = i22;
                                                                            }
                                                                            if (z11) {
                                                                                h0Var3.g(i25);
                                                                            }
                                                                        } else {
                                                                            vVar2 = vVar3;
                                                                            i17 = i22;
                                                                        }
                                                                        j12 >>= i17;
                                                                        i24++;
                                                                        i22 = i17;
                                                                        vVar3 = vVar2;
                                                                    }
                                                                    vVar = vVar3;
                                                                    if (i23 != i22) {
                                                                        break;
                                                                    }
                                                                } else {
                                                                    vVar = vVar3;
                                                                }
                                                                if (i21 == length2) {
                                                                    break;
                                                                }
                                                                i21++;
                                                                vVar3 = vVar;
                                                            }
                                                        }
                                                    }
                                                }
                                                return Unit.f71706a;
                                            }
                                        };
                                        break loop0;
                                    }
                                }
                                j11 >>= 8;
                            }
                            if (i14 != 8) {
                                break;
                            }
                            if (i13 == length) {
                                break;
                            }
                            i13++;
                        }
                    }
                    function1 = null;
                    q1.b bVar2 = this.M;
                    if (function1 != null) {
                    }
                    i5 = t1Var2.f81581b;
                    if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
                    }
                }
            }
        }
        if (t1Var2 != null) {
            int i17 = t1Var2.f81581b;
            if ((i17 & 16) == 0 && ((i17 & 1) != 0 || this.f81567q)) {
                if (t1Var2.f81582c == null) {
                    if (this.S) {
                        k2 k2Var = this.I;
                        aVarA = k2Var.b(k2Var.f81484v);
                    } else {
                        f2 f2Var = this.G;
                        aVarA = f2Var.a(f2Var.f81417i);
                    }
                    t1Var2.f81582c = aVarA;
                }
                t1Var2.f81581b &= -5;
                t1Var = t1Var2;
            } else {
                t1Var = null;
            }
        }
        p(false);
        return t1Var;
    }

    public final void v() {
        if (this.F || this.f81576z != 100) {
            o1.a("Cannot disable reuse from root if it was caused by other groups");
        }
        this.f81576z = -1;
        this.f81575y = false;
    }

    public final void w() {
        p(false);
        this.f81554b.c();
        p(false);
        q1.b bVar = this.M;
        if (bVar.f83368c) {
            bVar.d(false);
            bVar.d(false);
            bVar.f83367b.f83364b.q0(q1.m.f83403c);
            bVar.f83368c = false;
        }
        bVar.b();
        if (bVar.f83369d.f54485a != 0) {
            u.c("Missed recording an endGroup()");
        }
        if (!this.f81561i.isEmpty()) {
            u.c("Start/end imbalance");
        }
        i();
        this.G.c();
        this.f81573w = this.f81574x.f() != 0;
    }

    public final void x(boolean z11, m1 m1Var) {
        this.f81561i.add(this.f81562j);
        this.f81562j = m1Var;
        int i5 = this.f81564l;
        fa.t tVar = this.n;
        tVar.g(i5);
        tVar.g(this.f81565m);
        tVar.g(this.f81563k);
        if (z11) {
            this.f81563k = 0;
        }
        this.f81564l = 0;
        this.f81565m = 0;
    }

    public final void y() {
        g2 g2Var = new g2();
        if (this.C) {
            g2Var.c();
        }
        if (this.f81554b.d()) {
            g2Var.f81437k = new z.c0();
        }
        this.H = g2Var;
        k2 k2VarE = g2Var.e();
        k2VarE.e(true);
        this.I = k2VarE;
    }

    public final n1 z() {
        return l();
    }
}
