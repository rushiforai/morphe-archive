package l1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class b8 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f73065a;

    /* renamed from: b, reason: collision with root package name */
    public static final float f73066b;

    /* renamed from: c, reason: collision with root package name */
    public static final float f73067c;

    /* renamed from: d, reason: collision with root package name */
    public static final float f73068d;

    /* renamed from: e, reason: collision with root package name */
    public static final long f73069e;

    static {
        float f11 = o1.u.f79173a;
        f73065a = o1.u.f79175c;
        f73066b = 16;
        f73067c = 14;
        f73068d = 6;
        f73069e = w20.h.j(20);
    }

    public static final void a(boolean z11, Function0 function0, b2.t tVar, boolean z12, long j11, long j12, x1.e eVar, p1.o oVar, int i5) {
        int i11;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-202735880);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.g(z11) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.h(function0) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.f(tVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.g(z12) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar2.e(j11) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.e(j12) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i11 |= tVar2.f(null) ? 1048576 : 524288;
        }
        if ((12582912 & i5) == 0) {
            i11 |= tVar2.h(eVar) ? 8388608 : 4194304;
        }
        int i12 = i11;
        if ((i12 & 4793491) == 4793490 && tVar2.E()) {
            tVar2.V();
        } else {
            tVar2.X();
            if ((i5 & 1) != 0 && !tVar2.B()) {
                tVar2.V();
            }
            tVar2.q();
            int i13 = i12 >> 12;
            tVar2 = tVar2;
            c(j11, j12, z11, x1.f.d(-551896140, new x7(tVar, z11, q5.a(true, 0.0f, j11, tVar2, ((i12 >> 6) & 896) | 6, 2), z12, function0, eVar), tVar2), tVar2, (i13 & 112) | (i13 & 14) | 3072 | ((i12 << 6) & 896));
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new y7(z11, function0, tVar, z12, j11, j12, eVar, i5);
        }
    }

    public static final void b(boolean z11, Function0 function0, b2.t tVar, boolean z12, Function2 function2, long j11, long j12, p1.o oVar, int i5) {
        int i11;
        boolean z13;
        b2.t tVar2;
        long j13;
        long j14;
        b2.t tVar3;
        boolean z14;
        long j15;
        long j16;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(-350627181);
        int i12 = i5 | (tVar4.g(z11) ? 4 : 2) | (tVar4.h(function0) ? 32 : 16) | 105581952;
        if ((38347923 & i12) == 38347922 && tVar4.E()) {
            tVar4.V();
            tVar3 = tVar;
            z14 = z12;
            j15 = j11;
            j16 = j12;
        } else {
            tVar4.X();
            if ((i5 & 1) == 0 || tVar4.B()) {
                long j17 = ((i2.s) tVar4.j(s1.f73932a)).f61148a;
                i11 = i12 & (-33030145);
                z13 = true;
                tVar2 = b2.r.f17024a;
                j13 = j17;
                j14 = j13;
            } else {
                tVar4.V();
                i11 = i12 & (-33030145);
                tVar2 = tVar;
                z13 = z12;
                j13 = j11;
                j14 = j12;
            }
            tVar4.q();
            tVar4.b0(79583089);
            x1.e eVarD = function2 == null ? null : x1.f.d(708874428, new b(function2, 3), tVar4);
            tVar4.p(false);
            a(z11, function0, tVar2, z13, j13, j14, x1.f.d(1540996038, new b0.f(eVarD, 3), tVar4), tVar4, (i11 & 112) | (i11 & 14) | 12582912 | 1576320);
            tVar3 = tVar2;
            z14 = z13;
            j15 = j13;
            j16 = j14;
        }
        p1.t1 t1VarU = tVar4.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new w7(z11, function0, tVar3, z14, function2, j15, j16, i5);
        }
    }

    public static final void c(long j11, long j12, boolean z11, x1.e eVar, p1.o oVar, int i5) {
        int i11;
        long j13;
        int i12;
        boolean z12;
        c0.h2 h2VarI;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(735731848);
        if ((i5 & 6) == 0) {
            i11 = (tVar.e(j11) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            j13 = j12;
            i11 |= tVar.e(j13) ? 32 : 16;
        } else {
            j13 = j12;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar.g(z11) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar.h(eVar) ? 2048 : 1024;
        }
        if ((i11 & 1171) == 1170 && tVar.E()) {
            tVar.V();
        } else {
            int i13 = i11 >> 6;
            c0.c2 c2VarE = c0.f2.e(Boolean.valueOf(z11), null, tVar, i13 & 14, 2);
            p1.s2 s2Var = (p1.s2) c2VarE.f18733d;
            boolean zBooleanValue = ((Boolean) s2Var.getValue()).booleanValue();
            tVar.b0(-1997025499);
            long j14 = zBooleanValue ? j11 : j13;
            tVar.p(false);
            j2.c cVarE = i2.s.e(j14);
            boolean zF = tVar.f(cVarE);
            Object objP = tVar.P();
            if (zF || objP == p1.n.f81514a) {
                c0.i2 i2Var = new c0.i2(b0.c.f16065q, new androidx.fragment.app.p(cVarE, 6));
                tVar.m0(i2Var);
                objP = i2Var;
            }
            c0.i2 i2Var2 = (c0.i2) objP;
            boolean zBooleanValue2 = ((Boolean) c2VarE.f18730a.c()).booleanValue();
            tVar.b0(-1997025499);
            long j15 = zBooleanValue2 ? j11 : j13;
            tVar.p(false);
            i2.s sVar = new i2.s(j15);
            boolean zBooleanValue3 = ((Boolean) s2Var.getValue()).booleanValue();
            tVar.b0(-1997025499);
            long j16 = zBooleanValue3 ? j11 : j13;
            tVar.p(false);
            i2.s sVar2 = new i2.s(j16);
            c0.w1 w1VarF = c2VarE.f();
            tVar.b0(-899623535);
            if (w1VarF.c(Boolean.FALSE, Boolean.TRUE)) {
                i12 = i13;
                h2VarI = new c0.h2(PerAppFeatureCatalog.MAX_TOOLS, 100, c0.b0.f18713d);
                z12 = false;
            } else {
                i12 = i13;
                z12 = false;
                h2VarI = c0.f.i(100, 0, c0.b0.f18713d, 2);
            }
            tVar.p(z12);
            p1.a0.a(a2.c.t(((i2.s) c0.f2.c(c2VarE, sVar, sVar2, h2VarI, i2Var2, tVar, 0).getValue()).f61148a, s1.f73932a), eVar, tVar, (i12 & 112) | 8);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a8(j11, j13, z11, eVar, i5);
        }
    }

    public static final void d(Function2 function2, p1.o oVar, int i5) {
        int i11;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(514131524);
        if ((i5 & 6) == 0) {
            i11 = (tVar.h(function2) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar.h(null) ? 32 : 16;
        }
        if ((i11 & 19) == 18 && tVar.E()) {
            tVar.V();
        } else {
            int i12 = i11 & 14;
            boolean z11 = ((i11 & 112) == 32) | (i12 == 4);
            Object objP = tVar.P();
            if (z11 || objP == p1.n.f81514a) {
                objP = new k0.n0(function2, 2);
                tVar.m0(objP);
            }
            z2.r0 r0Var = (z2.r0) objP;
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
            tVar.b0(871566271);
            if (function2 != null) {
                b2.t tVarL = androidx.compose.foundation.layout.d.l(androidx.compose.ui.layout.a.b(rVar, "text"), f73066b, 0.0f, 2);
                z2.r0 r0VarD = k0.p.d(b2.d.f16997a, false);
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
                com.google.android.gms.internal.measurement.k2.u(i12, function2, tVar, true);
            }
            tVar.p(false);
            tVar.b0(871570579);
            tVar.p(false);
            tVar.p(true);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c3.y1(function2, i5, 1);
        }
    }
}
