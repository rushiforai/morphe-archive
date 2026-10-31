package e10;

import kotlin.UInt;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import l1.g9;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class p4 implements gy.u1 {

    /* renamed from: c, reason: collision with root package name */
    public static final p4 f51743c;

    /* renamed from: d, reason: collision with root package name */
    public static final p4 f51744d;

    /* renamed from: e, reason: collision with root package name */
    public static final p4 f51745e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ p4[] f51746f;

    /* renamed from: a, reason: collision with root package name */
    public final int f51747a;

    /* renamed from: b, reason: collision with root package name */
    public final int f51748b;

    static {
        p4 p4Var = new p4("COUNTLESS", 0, 2132017551, 2132017552);
        f51743c = p4Var;
        p4 p4Var2 = new p4("DOTS", 1, 2132017549, 2132017550);
        f51744d = p4Var2;
        p4 p4Var3 = new p4("NUMERIC", 2, 2132017553, 2132017554);
        f51745e = p4Var3;
        p4[] p4VarArr = {p4Var, p4Var2, p4Var3};
        f51746f = p4VarArr;
        EnumEntriesKt.a(p4VarArr);
    }

    public p4(String str, int i5, int i11, int i12) {
        this.f51747a = i11;
        this.f51748b = i12;
    }

    public static p4 valueOf(String str) {
        return (p4) Enum.valueOf(p4.class, str);
    }

    public static p4[] values() {
        return (p4[]) f51746f.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.b0(1131631197);
        k0.x1 x1VarA = k0.v1.a(k0.k.f70655a, b2.d.f17007k, tVar, 48);
        int iHashCode = Long.hashCode(tVar.T);
        p1.n1 n1VarL = tVar.l();
        b2.r rVar = b2.r.f17024a;
        b2.t tVarI = fg.a.I(rVar, tVar);
        b3.l.Po.getClass();
        Function0 function0 = b3.k.f17270b;
        tVar.f0();
        if (tVar.S) {
            tVar.k(function0);
        } else {
            tVar.p0();
        }
        p1.a0.j(x1VarA, b3.k.f17275g, tVar);
        p1.a0.j(n1VarL, b3.k.f17274f, tVar);
        b3.i iVar = b3.k.f17278j;
        if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
            a2.c.u(iHashCode, tVar, iHashCode, iVar);
        }
        p1.a0.j(tVarI, b3.k.f17272d, tVar);
        d(tVar, i5 & 14);
        k0.i2.b(androidx.compose.foundation.layout.e.o(rVar, 16), tVar);
        ic.b.p(this, tVar);
        tVar.p(true);
        tVar.p(false);
    }

    @Override // gy.w
    public final int b() {
        return this.f51747a;
    }

    @Override // gy.u1
    public final int c() {
        return this.f51748b;
    }

    public final void d(p1.o oVar, int i5) {
        int i11;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(167285328);
        if ((i5 & 6) == 0) {
            i11 = i5 | (tVar.f(this) ? 4 : 2);
        } else {
            i11 = i5;
        }
        if ((i11 & 3) == 2 && tVar.E()) {
            tVar.V();
        } else {
            p1.z2 z2Var = l1.g1.f73330a;
            int iR = i2.r0.r(((l1.d1) tVar.j(z2Var)).f73161p);
            UInt.Companion companion = UInt.f71696b;
            float fN = (float) v4.a.n(iR);
            int iOrdinal = ordinal();
            b2.r rVar = b2.r.f17024a;
            if (iOrdinal == 0) {
                tVar.b0(-1154120070);
                o2.g gVarV = cw.l2.v();
                long jB = i2.r0.b(ul.b.q0(fN, -1499549));
                s0.g gVar = s0.h.f86511a;
                l1.b3.b(gVarV, null, androidx.compose.foundation.layout.e.o(fg.a.g(androidx.compose.foundation.a.b(rVar, jB, gVar), gVar), 24), i2.r0.b(-1), tVar, 48, 0);
                tVar.p(false);
            } else if (iOrdinal == 1) {
                tVar.b0(-1154102414);
                k0.i2.b(androidx.compose.foundation.layout.e.o(androidx.compose.foundation.a.b(rVar, i2.r0.b(ul.b.q0(fN, -11751600)), s0.h.f86511a), 24), tVar);
                tVar.p(false);
            } else {
                if (iOrdinal != 2) {
                    throw com.google.android.gms.internal.measurement.k2.q(-1154121490, tVar, false);
                }
                tVar.b0(-1154090686);
                b2.t tVarO = androidx.compose.foundation.layout.e.o(androidx.compose.foundation.a.b(rVar, i2.r0.b(ul.b.q0(fN, -14575885)), s0.h.c(8)), 24);
                z2.r0 r0VarD = k0.p.d(b2.d.f17001e, false);
                int iHashCode = Long.hashCode(tVar.T);
                p1.n1 n1VarL = tVar.l();
                b2.t tVarI = fg.a.I(tVarO, tVar);
                b3.l.Po.getClass();
                Function0 function0 = b3.k.f17270b;
                tVar.f0();
                if (tVar.S) {
                    tVar.k(function0);
                } else {
                    tVar.p0();
                }
                p1.a0.j(r0VarD, b3.k.f17275g, tVar);
                p1.a0.j(n1VarL, b3.k.f17274f, tVar);
                b3.i iVar = b3.k.f17278j;
                if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
                    a2.c.u(iHashCode, tVar, iHashCode, iVar);
                }
                p1.a0.j(tVarI, b3.k.f17272d, tVar);
                g9.b("3", null, ((l1.d1) tVar.j(z2Var)).f73149b, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar, 6, 0, 131066);
                tVar = tVar;
                tVar.p(true);
                tVar.p(false);
            }
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new bv.g(this, i5, 6);
        }
    }
}
