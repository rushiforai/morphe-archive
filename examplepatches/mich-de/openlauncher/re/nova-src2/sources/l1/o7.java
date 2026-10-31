package l1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class o7 {

    /* renamed from: d, reason: collision with root package name */
    public static final float f73752d;

    /* renamed from: f, reason: collision with root package name */
    public static final float f73754f;

    /* renamed from: a, reason: collision with root package name */
    public static final float f73749a = 600;

    /* renamed from: b, reason: collision with root package name */
    public static final float f73750b = 30;

    /* renamed from: c, reason: collision with root package name */
    public static final float f73751c = 16;

    /* renamed from: e, reason: collision with root package name */
    public static final float f73753e = 6;

    static {
        float f11 = 8;
        f73752d = f11;
        f73754f = f11;
    }

    public static final void a(b2.t tVar, Function2 function2, Function2 function22, i2.v0 v0Var, long j11, long j12, long j13, long j14, x1.e eVar, p1.o oVar, int i5) {
        int i11;
        Function2 function23;
        Function2 function24;
        i2.v0 v0Var2;
        int i12;
        x1.e eVar2;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1235788955);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            function23 = function2;
            i11 |= tVar2.h(function23) ? 32 : 16;
        } else {
            function23 = function2;
        }
        if ((i5 & 384) == 0) {
            function24 = function22;
            i11 |= tVar2.h(function24) ? 256 : 128;
        } else {
            function24 = function22;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.g(false) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            v0Var2 = v0Var;
            i11 |= tVar2.f(v0Var2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        } else {
            v0Var2 = v0Var;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.e(j11) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i11 |= tVar2.e(j12) ? 1048576 : 524288;
        }
        if ((12582912 & i5) == 0) {
            i11 |= tVar2.e(j13) ? 8388608 : 4194304;
        }
        int i13 = i11;
        if ((100663296 & i5) == 0) {
            i12 = i13 | (tVar2.e(j14) ? 67108864 : 33554432);
        } else {
            i12 = i13;
        }
        if ((805306368 & i5) == 0) {
            eVar2 = eVar;
            i12 |= tVar2.h(eVar2) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
        } else {
            eVar2 = eVar;
        }
        if ((306783379 & i12) == 306783378 && tVar2.E()) {
            tVar2.V();
        } else {
            tVar2.X();
            if ((i5 & 1) != 0 && !tVar2.B()) {
                tVar2.V();
            }
            tVar2.q();
            float f11 = o1.a0.f78927a;
            x1.e eVarD = x1.f.d(-1829663446, new k7(function23, eVar2, function24, j13, j14), tVar2);
            int i14 = i12 >> 9;
            t7.a(tVar, v0Var2, j11, j12, 0.0f, f11, null, eVarD, tVar2, (i12 & 14) | 12779520 | (i14 & 112) | (i14 & 896) | (i14 & 7168), 80);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new l7(tVar, function2, function22, v0Var, j11, j12, j13, j14, eVar, i5);
        }
    }

    public static final void b(y6 y6Var, b2.t tVar, i2.v0 v0Var, long j11, long j12, long j13, long j14, long j15, p1.o oVar, int i5) {
        int i11;
        long jE;
        b2.t tVar2;
        i2.v0 v0Var2;
        int i12;
        long j16;
        long j17;
        long j18;
        long j19;
        p1.t tVar3;
        b2.t tVar4;
        long j21;
        i2.v0 v0Var3;
        long j22;
        long j23;
        long j24;
        long j25;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(274621471);
        if ((i5 & 6) == 0) {
            i11 = (tVar5.f(y6Var) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        int i13 = i11 | 432;
        if ((i5 & 3072) == 0) {
            i13 = i11 | 1456;
        }
        if ((i5 & 24576) == 0) {
            i13 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i13 |= SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i13 |= 524288;
        }
        if ((12582912 & i5) == 0) {
            i13 |= 4194304;
        }
        if ((100663296 & i5) == 0) {
            i13 |= 33554432;
        }
        if ((38347923 & i13) == 38347922 && tVar5.E()) {
            tVar5.V();
            tVar4 = tVar;
            v0Var3 = v0Var;
            j22 = j11;
            j23 = j12;
            j21 = j13;
            j24 = j14;
            j25 = j15;
            tVar3 = tVar5;
        } else {
            tVar5.X();
            if ((i5 & 1) == 0 || tVar5.B()) {
                i2.v0 v0VarA = a6.a(tVar5, o1.a0.f78928b);
                long jE2 = g1.e(tVar5, 6);
                long jE3 = g1.e(tVar5, o1.a0.f78930d);
                jE = g1.e(tVar5, 5);
                long jE4 = g1.e(tVar5, 5);
                long jE5 = g1.e(tVar5, o1.a0.f78929c);
                tVar2 = b2.r.f17024a;
                v0Var2 = v0VarA;
                i12 = i13 & (-268434433);
                j16 = jE2;
                j17 = jE3;
                j18 = jE4;
                j19 = jE5;
            } else {
                tVar5.V();
                i12 = i13 & (-268434433);
                tVar2 = tVar;
                v0Var2 = v0Var;
                j16 = j11;
                j17 = j12;
                jE = j13;
                j18 = j14;
                j19 = j15;
            }
            tVar5.q();
            d7 d7Var = (d7) y6Var;
            String str = d7Var.f73192a.f73259b;
            tVar5.b0(1561344786);
            x1.e eVarD = str != null ? x1.f.d(-1378313599, new n7(jE, y6Var, str), tVar5) : null;
            tVar5.p(false);
            tVar5.b0(1561358724);
            d7Var.f73192a.getClass();
            x1.e eVarD2 = x1.f.d(-1812633777, new b7(y6Var, 2), tVar5);
            tVar5.p(false);
            tVar3 = tVar5;
            a(androidx.compose.foundation.layout.d.j(tVar2, 12), eVarD, eVarD2, v0Var2, j16, j17, j18, j19, x1.f.d(-1266389126, new b7(y6Var, 1), tVar5), tVar3, ((i12 << 3) & 7168) | 805306368);
            tVar4 = tVar2;
            j21 = jE;
            v0Var3 = v0Var2;
            j22 = j16;
            j23 = j17;
            j24 = j18;
            j25 = j19;
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new m7(y6Var, tVar4, v0Var3, j22, j23, j21, j24, j25, i5);
        }
    }

    public static final void c(x1.e eVar, Function2 function2, Function2 function22, m3.p0 p0Var, long j11, long j12, p1.o oVar, int i5) {
        int i11;
        m3.p0 p0Var2;
        int i12;
        Function2 function23;
        boolean z11;
        long j13 = j11;
        long j14 = j12;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-903235475);
        if ((i5 & 6) == 0) {
            i11 = (tVar.h(eVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar.h(function2) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar.h(function22) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar.f(p0Var) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar.e(j13) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar.e(j14) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((74899 & i11) == 74898 && tVar.E()) {
            tVar.V();
            function23 = function22;
            p0Var2 = p0Var;
        } else {
            float f11 = function22 == null ? f73752d : 0;
            b2.r rVar = b2.r.f17024a;
            b2.t tVarN = androidx.compose.foundation.layout.d.n(rVar, f73751c, 0.0f, f11, 0.0f, 10);
            Object objP = tVar.P();
            if (objP == p1.n.f81514a) {
                objP = new i7();
                tVar.m0(objP);
            }
            z2.r0 r0Var = (z2.r0) objP;
            int iHashCode = Long.hashCode(tVar.T);
            p1.n1 n1VarL = tVar.l();
            b2.t tVarI = fg.a.I(tVarN, tVar);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar.f0();
            int i13 = i11;
            if (tVar.S) {
                tVar.k(function0);
            } else {
                tVar.p0();
            }
            b3.i iVar = b3.k.f17275g;
            p1.a0.j(r0Var, iVar, tVar);
            b3.i iVar2 = b3.k.f17274f;
            p1.a0.j(n1VarL, iVar2, tVar);
            b3.i iVar3 = b3.k.f17278j;
            if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar, iHashCode, iVar3);
            }
            b3.i iVar4 = b3.k.f17272d;
            p1.a0.j(tVarI, iVar4, tVar);
            b2.t tVarL = androidx.compose.foundation.layout.d.l(androidx.compose.ui.layout.a.b(rVar, "text"), 0.0f, f73753e, 1);
            b2.k kVar = b2.d.f16997a;
            z2.r0 r0VarD = k0.p.d(kVar, false);
            int iHashCode2 = Long.hashCode(tVar.T);
            p1.n1 n1VarL2 = tVar.l();
            b2.t tVarI2 = fg.a.I(tVarL, tVar);
            tVar.f0();
            if (tVar.S) {
                tVar.k(function0);
            } else {
                tVar.p0();
            }
            p1.a0.j(r0VarD, iVar, tVar);
            p1.a0.j(n1VarL2, iVar2, tVar);
            if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode2))) {
                a2.c.u(iHashCode2, tVar, iHashCode2, iVar3);
            }
            p1.a0.j(tVarI2, iVar4, tVar);
            eVar.invoke(tVar, Integer.valueOf(i13 & 14));
            tVar.p(true);
            tVar.b0(-904778058);
            if (function2 != null) {
                b2.t tVarB = androidx.compose.ui.layout.a.b(rVar, "action");
                z2.r0 r0VarD2 = k0.p.d(kVar, false);
                i12 = 8;
                int iHashCode3 = Long.hashCode(tVar.T);
                p1.n1 n1VarL3 = tVar.l();
                b2.t tVarI3 = fg.a.I(tVarB, tVar);
                tVar.f0();
                if (tVar.S) {
                    tVar.k(function0);
                } else {
                    tVar.p0();
                }
                p1.a0.j(r0VarD2, iVar, tVar);
                p1.a0.j(n1VarL3, iVar2, tVar);
                if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode3))) {
                    a2.c.u(iHashCode3, tVar, iHashCode3, iVar3);
                }
                p1.a0.j(tVarI3, iVar4, tVar);
                j13 = j11;
                p0Var2 = p0Var;
                p1.a0.b(new p1.r1[]{a2.c.t(j13, s1.f73932a), g9.f73360a.a(p0Var2)}, function2, tVar, (i13 & 112) | 8);
                tVar.p(true);
            } else {
                p0Var2 = p0Var;
                j13 = j11;
                i12 = 8;
            }
            boolean z12 = false;
            tVar.p(false);
            tVar.b0(-904766579);
            if (function22 != null) {
                b2.t tVarB2 = androidx.compose.ui.layout.a.b(rVar, "dismissAction");
                z2.r0 r0VarD3 = k0.p.d(kVar, false);
                int i14 = i12;
                int iHashCode4 = Long.hashCode(tVar.T);
                p1.n1 n1VarL4 = tVar.l();
                b2.t tVarI4 = fg.a.I(tVarB2, tVar);
                tVar.f0();
                if (tVar.S) {
                    tVar.k(function0);
                } else {
                    tVar.p0();
                }
                p1.a0.j(r0VarD3, iVar, tVar);
                p1.a0.j(n1VarL4, iVar2, tVar);
                if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode4))) {
                    a2.c.u(iHashCode4, tVar, iHashCode4, iVar3);
                }
                p1.a0.j(tVarI4, iVar4, tVar);
                j14 = j12;
                function23 = function22;
                p1.a0.a(a2.c.t(j14, s1.f73932a), function23, tVar, i14 | ((i13 >> 3) & 112));
                z11 = true;
                tVar.p(true);
                z12 = false;
            } else {
                function23 = function22;
                j14 = j12;
                z11 = true;
            }
            tVar.p(z12);
            tVar.p(z11);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new l8(eVar, function2, function23, p0Var2, j13, j14, i5);
        }
    }
}
