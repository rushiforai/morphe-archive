package l1;

import androidx.compose.material3.MinimumInteractiveModifier;
import androidx.compose.ui.input.pointer.SuspendPointerInputElement;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.ClosedFloatingPointRange;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class w6 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f74180a = o1.z.f79195d;

    /* renamed from: b, reason: collision with root package name */
    public static final float f74181b;

    /* renamed from: c, reason: collision with root package name */
    public static final long f74182c;

    /* renamed from: d, reason: collision with root package name */
    public static final float f74183d;

    /* renamed from: e, reason: collision with root package name */
    public static final float f74184e;

    static {
        float f11 = o1.z.f79194c;
        f74181b = f11;
        f74182c = vm.d.a(f11, o1.z.f79193b);
        f74183d = o1.z.f79192a;
        f74184e = 2;
    }

    public static final void a(float f11, Function1 function1, b2.t tVar, boolean z11, Function0 function0, h6 h6Var, i0.i iVar, x1.e eVar, x1.e eVar2, ClosedFloatingPointRange closedFloatingPointRange, p1.o oVar, int i5, int i11) {
        int i12;
        h6 h6Var2;
        i0.i iVar2;
        x1.e eVar3;
        int i13;
        p1.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(1191170377);
        if ((i5 & 6) == 0) {
            i12 = (tVar3.c(f11) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar3.h(function1) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i12 |= tVar3.f(tVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i12 |= tVar3.g(z11) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i12 |= tVar3.h(function0) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            h6Var2 = h6Var;
            i12 |= tVar3.f(h6Var2) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        } else {
            h6Var2 = h6Var;
        }
        if ((1572864 & i5) == 0) {
            iVar2 = iVar;
            i12 |= tVar3.f(iVar2) ? 1048576 : 524288;
        } else {
            iVar2 = iVar;
        }
        if ((12582912 & i5) == 0) {
            i12 |= tVar3.d(0) ? 8388608 : 4194304;
        }
        if ((100663296 & i5) == 0) {
            eVar3 = eVar;
            i12 |= tVar3.h(eVar3) ? 67108864 : 33554432;
        } else {
            eVar3 = eVar;
        }
        if ((i5 & 805306368) == 0) {
            i12 |= tVar3.h(eVar2) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
        }
        if ((i11 & 6) == 0) {
            i13 = i11 | (tVar3.f(closedFloatingPointRange) ? 4 : 2);
        } else {
            i13 = i11;
        }
        if ((i12 & 306783379) == 306783378 && (i13 & 3) == 2 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar3;
        } else {
            tVar3.X();
            if ((i5 & 1) != 0 && !tVar3.B()) {
                tVar3.V();
            }
            tVar3.q();
            boolean z12 = ((29360128 & i12) == 8388608) | ((((i13 & 14) ^ 6) > 4 && tVar3.f(closedFloatingPointRange)) || (i13 & 6) == 4);
            Object objP = tVar3.P();
            if (z12 || objP == p1.n.f81514a) {
                objP = new x6(f11, function0, closedFloatingPointRange);
                tVar3.m0(objP);
            }
            x6 x6Var = (x6) objP;
            x6Var.f74242a = function0;
            x6Var.f74245d = function1;
            x6Var.d(f11);
            int i14 = ((i12 >> 3) & 1008) | ((i12 >> 6) & 57344);
            int i15 = i12 >> 9;
            tVar2 = tVar3;
            c(x6Var, tVar, z11, null, iVar2, eVar3, eVar2, tVar2, i14 | (458752 & i15) | (i15 & 3670016));
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new q6(f11, function1, tVar, z11, function0, h6Var2, iVar, eVar, eVar2, closedFloatingPointRange, i5, i11);
        }
    }

    public static final void b(float f11, Function1 function1, b2.t tVar, boolean z11, ClosedFloatingPointRange closedFloatingPointRange, Function0 function0, h6 h6Var, i0.i iVar, p1.o oVar, int i5) {
        int i11;
        ClosedFloatingPointRange closedFloatingPointRange2;
        i0.i iVar2;
        i0.i iVar3;
        ClosedFloatingPointRange closedFloatingPointRange3;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-202044027);
        int i12 = i5 | (tVar2.c(f11) ? 4 : 2) | (tVar2.h(function1) ? 32 : 16) | (tVar2.f(tVar) ? 256 : 128) | (tVar2.g(z11) ? 2048 : 1024) | 204800 | (tVar2.h(function0) ? 1048576 : 524288) | (tVar2.f(h6Var) ? 8388608 : 4194304) | 100663296;
        if ((38347923 & i12) == 38347922 && tVar2.E()) {
            tVar2.V();
            closedFloatingPointRange3 = closedFloatingPointRange;
            iVar3 = iVar;
        } else {
            tVar2.X();
            if ((i5 & 1) == 0 || tVar2.B()) {
                p70.a aVar = new p70.a(0.0f, 1.0f);
                i11 = i12 & (-57345);
                Object objP = tVar2.P();
                if (objP == p1.n.f81514a) {
                    objP = a2.c.d(tVar2);
                }
                closedFloatingPointRange2 = aVar;
                iVar2 = (i0.i) objP;
            } else {
                tVar2.V();
                i11 = i12 & (-57345);
                closedFloatingPointRange2 = closedFloatingPointRange;
                iVar2 = iVar;
            }
            tVar2.q();
            int i13 = 905969664 | (i11 & 14) | (i11 & 112) | (i11 & 896) | (i11 & 7168);
            int i14 = i11 >> 6;
            a(f11, function1, tVar, z11, function0, h6Var, iVar2, x1.f.d(308249025, new h2(iVar2, h6Var, z11), tVar2), x1.f.d(-1843234110, new o6(h6Var, z11), tVar2), closedFloatingPointRange2, tVar2, (i14 & 458752) | i13 | (57344 & i14) | 14155776, 0);
            iVar3 = iVar2;
            closedFloatingPointRange3 = closedFloatingPointRange2;
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new p6(f11, function1, tVar, z11, closedFloatingPointRange3, function0, h6Var, iVar3, i5);
        }
    }

    public static final void c(x6 x6Var, b2.t tVar, boolean z11, h6 h6Var, i0.i iVar, x1.e eVar, x1.e eVar2, p1.o oVar, int i5) {
        int i11;
        int i12;
        h6 h6VarE;
        h6 h6Var2;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1303883986);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.h(x6Var) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.f(tVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.g(z11) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar2.f(iVar) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.h(eVar) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i11 |= tVar2.h(eVar2) ? 1048576 : 524288;
        }
        if ((599187 & i11) == 599186 && tVar2.E()) {
            tVar2.V();
            h6Var2 = h6Var;
        } else {
            tVar2.X();
            if ((i5 & 1) == 0 || tVar2.B()) {
                m6 m6Var = m6.f73645a;
                i12 = i11 & (-7169);
                h6VarE = m6.e((d1) tVar2.j(g1.f73330a));
            } else {
                tVar2.V();
                i12 = i11 & (-7169);
                h6VarE = h6Var;
            }
            tVar2.q();
            int i13 = i12 >> 3;
            d(tVar, x6Var, z11, iVar, eVar, eVar2, tVar2, (i12 & 896) | (i13 & 14) | ((i12 << 3) & 112) | (i13 & 7168) | (57344 & i13) | (i13 & 458752));
            h6Var2 = h6VarE;
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new n6(x6Var, tVar, z11, h6Var2, iVar, eVar, eVar2, i5);
        }
    }

    public static final void d(b2.t tVar, x6 x6Var, boolean z11, i0.i iVar, x1.e eVar, x1.e eVar2, p1.o oVar, int i5) {
        int i11;
        b2.t suspendPointerInputElement;
        boolean z12;
        x6 x6Var2 = x6Var;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1390990089);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.h(x6Var2) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.g(z11) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.f(iVar) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar2.h(eVar) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.h(eVar2) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        int i12 = i11;
        if ((74899 & i12) == 74898 && tVar2.E()) {
            tVar2.V();
        } else {
            int i13 = 1;
            x6Var2.f74248g = tVar2.j(c3.z1.n) == y3.n.f96613b;
            Continuation continuation = null;
            b2.r rVar = b2.r.f17024a;
            if (z11) {
                g4 g4Var = new g4(x6Var2, continuation, i13);
                v2.m mVar = v2.f0.f91929a;
                suspendPointerInputElement = new SuspendPointerInputElement(x6Var2, iVar, new v2.e0(g4Var), 4);
            } else {
                suspendPointerInputElement = rVar;
            }
            g0.d1 d1Var = g0.d1.f56494b;
            boolean z13 = x6Var2.f74248g;
            boolean zBooleanValue = ((Boolean) ((p1.s2) x6Var2.f74251j).getValue()).booleanValue();
            boolean zH = tVar2.h(x6Var2);
            Object objP = tVar2.P();
            b2.t tVar3 = suspendPointerInputElement;
            p1.g1 g1Var = p1.n.f81514a;
            if (zH || objP == g1Var) {
                objP = new t6(x6Var2, null);
                tVar2.m0(objP);
            }
            b2.t tVarA = g0.i0.a(rVar, x6Var2, d1Var, z11, iVar, zBooleanValue, (Function3) objP, z13, 32);
            x6Var2 = x6Var2;
            p1.z2 z2Var = c3.f73102a;
            b2.t tVarThen = j3.n.b(androidx.compose.foundation.layout.e.m(tVar.then(MinimumInteractiveModifier.f14086b), f74181b, f74180a, 0.0f, 0.0f, 12), false, new u6(z11, x6Var2)).then(m1.c.f75672b);
            float fM = x6Var2.f74244c.m();
            ClosedFloatingPointRange closedFloatingPointRange = x6Var2.f74243b;
            b2.t tVarThen2 = androidx.compose.foundation.a.d(j3.n.b(tVarThen, true, new e0.v1(fM, new p70.a(((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue()), 0)), z11, iVar).then(tVar3).then(tVarA);
            boolean zH2 = tVar2.h(x6Var2);
            Object objP2 = tVar2.P();
            if (zH2 || objP2 == g1Var) {
                objP2 = new k0.n0(x6Var2, 1);
                tVar2.m0(objP2);
            }
            z2.r0 r0Var = (z2.r0) objP2;
            int iHashCode = Long.hashCode(tVar2.T);
            p1.n1 n1VarL = tVar2.l();
            b2.t tVarI = fg.a.I(tVarThen2, tVar2);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            b3.i iVar2 = b3.k.f17275g;
            p1.a0.j(r0Var, iVar2, tVar2);
            b3.i iVar3 = b3.k.f17274f;
            p1.a0.j(n1VarL, iVar3, tVar2);
            b3.i iVar4 = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar4);
            }
            b3.i iVar5 = b3.k.f17272d;
            p1.a0.j(tVarI, iVar5, tVar2);
            b2.t tVarY = androidx.compose.foundation.layout.e.y(androidx.compose.ui.layout.a.b(rVar, i6.f73446a));
            boolean zH3 = tVar2.h(x6Var2);
            Object objP3 = tVar2.P();
            if (zH3 || objP3 == g1Var) {
                z12 = false;
                objP3 = new r6(x6Var2, 0);
                tVar2.m0(objP3);
            } else {
                z12 = false;
            }
            b2.t tVarC = androidx.compose.ui.layout.a.c(tVarY, (Function1) objP3);
            b2.k kVar = b2.d.f16997a;
            z2.r0 r0VarD = k0.p.d(kVar, z12);
            int iHashCode2 = Long.hashCode(tVar2.T);
            p1.n1 n1VarL2 = tVar2.l();
            b2.t tVarI2 = fg.a.I(tVarC, tVar2);
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(r0VarD, iVar2, tVar2);
            p1.a0.j(n1VarL2, iVar3, tVar2);
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode2))) {
                a2.c.u(iHashCode2, tVar2, iHashCode2, iVar4);
            }
            p1.a0.j(tVarI2, iVar5, tVar2);
            int i14 = (i12 >> 3) & 14;
            eVar.invoke(x6Var2, tVar2, Integer.valueOf(((i12 >> 9) & 112) | i14));
            tVar2.p(true);
            b2.t tVarB = androidx.compose.ui.layout.a.b(rVar, i6.f73447b);
            z2.r0 r0VarD2 = k0.p.d(kVar, false);
            int iHashCode3 = Long.hashCode(tVar2.T);
            p1.n1 n1VarL3 = tVar2.l();
            b2.t tVarI3 = fg.a.I(tVarB, tVar2);
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(r0VarD2, iVar2, tVar2);
            p1.a0.j(n1VarL3, iVar3, tVar2);
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode3))) {
                a2.c.u(iHashCode3, tVar2, iHashCode3, iVar4);
            }
            p1.a0.j(tVarI3, iVar5, tVar2);
            eVar2.invoke(x6Var2, tVar2, Integer.valueOf(((i12 >> 12) & 112) | i14));
            tVar2.p(true);
            tVar2.p(true);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new p(tVar, x6Var2, z11, iVar, eVar, eVar2, i5);
        }
    }

    public static final float e(float f11, float[] fArr, float f12, float f13) {
        Float fValueOf;
        if (fArr.length == 0) {
            fValueOf = null;
        } else {
            float f14 = fArr[0];
            int length = fArr.length - 1;
            if (length == 0) {
                fValueOf = Float.valueOf(f14);
            } else {
                float fAbs = Math.abs(bh.g.d0(f12, f13, f14) - f11);
                IntProgressionIterator it = new IntRange(1, length, 1).iterator();
                while (it.f71911c) {
                    float f15 = fArr[it.nextInt()];
                    float fAbs2 = Math.abs(bh.g.d0(f12, f13, f15) - f11);
                    if (Float.compare(fAbs, fAbs2) > 0) {
                        f14 = f15;
                        fAbs = fAbs2;
                    }
                }
                fValueOf = Float.valueOf(f14);
            }
        }
        return fValueOf != null ? bh.g.d0(f12, f13, fValueOf.floatValue()) : f11;
    }
}
