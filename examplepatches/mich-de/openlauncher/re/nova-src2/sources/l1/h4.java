package l1;

import androidx.compose.ui.input.pointer.SuspendPointerInputElement;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class h4 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f73378a = 48;

    /* renamed from: b, reason: collision with root package name */
    public static final float f73379b = 24;

    /* renamed from: c, reason: collision with root package name */
    public static final long f73380c = i2.r0.f(0.5f, 0.0f);

    /* JADX WARN: Removed duplicated region for block: B:100:0x01cf A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:101:0x01d1  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0220  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0164  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0176  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x017e A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0180  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0191  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01ab  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01b4  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01c4  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01c7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(Function0 function0, b2.t tVar, f6 f6Var, float f11, i2.v0 v0Var, long j11, long j12, float f12, long j13, Function2 function2, Function2 function22, i4 i4Var, x1.e eVar, p1.o oVar, int i5) {
        int i11;
        float f13;
        i4 i4Var2;
        Function2 function23;
        float f14;
        int i12;
        long j14;
        b2.t tVar2;
        Function2 function24;
        long j15;
        long j16;
        i2.v0 v0Var2;
        long j17;
        boolean z11;
        boolean zH;
        Object objP;
        Function0 function02;
        Function0 function03;
        boolean z12;
        boolean z13;
        Object objP2;
        Object objP3;
        int i13;
        boolean z14;
        boolean zH2;
        Object objP4;
        p1.t tVar3;
        long j18;
        long j19;
        Function2 function25;
        Function2 function26;
        i4 i4Var3;
        b2.t tVar4;
        float f15;
        float f16;
        i2.v0 v0Var3;
        long j21;
        f6 f6Var2 = f6Var;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(2132719801);
        if ((i5 & 6) == 0) {
            i11 = (tVar5.h(function0) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        int i14 = i11 | 48;
        if ((i5 & 384) == 0) {
            i14 |= tVar5.f(f6Var2) ? 256 : 128;
        }
        int i15 = i14 | 3072;
        if ((i5 & 24576) == 0) {
            i15 = i14 | 11264;
        }
        if ((196608 & i5) == 0) {
            i15 |= SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i15 |= 524288;
        }
        int i16 = 12582912 | i15;
        if ((100663296 & i5) == 0) {
            i16 = 46137344 | i15;
        }
        int i17 = i16 | 805306368;
        if ((306783379 & i17) == 306783378 && tVar5.E()) {
            tVar5.V();
            f16 = f11;
            v0Var3 = v0Var;
            j18 = j11;
            j19 = j12;
            f15 = f12;
            j21 = j13;
            function25 = function2;
            function26 = function22;
            i4Var3 = i4Var;
            tVar3 = tVar5;
            tVar4 = tVar;
        } else {
            tVar5.X();
            if ((i5 & 1) == 0 || tVar5.B()) {
                float f17 = l0.f73576b;
                l0 l0Var = l0.f73575a;
                float f18 = o1.y.f79189a;
                i2.v0 v0VarA = a6.a(tVar5, 2);
                long jE = g1.e(tVar5, 40);
                long jB = g1.b(jE, tVar5);
                long jB2 = i2.s.b(0.32f, g1.e(tVar5, 30));
                x1.e eVar2 = l1.f73577a;
                i1 i1Var = i1.f73432z;
                f13 = 0;
                i4Var2 = n3.f73687a;
                function23 = eVar2;
                f14 = f17;
                i12 = i17 & (-239067137);
                j14 = jB2;
                tVar2 = b2.r.f17024a;
                function24 = i1Var;
                j15 = jB;
                j16 = jE;
                v0Var2 = v0VarA;
            } else {
                tVar5.V();
                f14 = f11;
                v0Var2 = v0Var;
                j16 = j11;
                j15 = j12;
                f13 = f12;
                function23 = function2;
                function24 = function22;
                i4Var2 = i4Var;
                i12 = i17 & (-239067137);
                tVar2 = tVar;
                j14 = j13;
            }
            tVar5.q();
            Object objP5 = tVar5.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (objP5 == g1Var) {
                p1.d0 d0Var = new p1.d0(p1.o0.i(EmptyCoroutineContext.f71803a, tVar5));
                tVar5.m0(d0Var);
                objP5 = d0Var;
            }
            t70.j0 j0Var = ((p1.d0) objP5).f81396a;
            int i18 = (i12 & 896) ^ 384;
            boolean z15 = true;
            if (i18 <= 256 || !tVar5.f(f6Var2)) {
                j17 = j14;
                if ((i12 & 384) != 256) {
                    z11 = false;
                }
                int i19 = i12 & 14;
                zH = z11 | tVar5.h(j0Var) | (i19 != 4);
                objP = tVar5.P();
                if (!zH || objP == g1Var) {
                    objP = new androidx.fragment.app.m(3, f6Var2, j0Var, function0);
                    tVar5.m0(objP);
                }
                function02 = (Function0) objP;
                boolean zH3 = tVar5.h(j0Var);
                if (i18 > 256 || !tVar5.f(f6Var2)) {
                    function03 = function02;
                    if ((i12 & 384) != 256) {
                        z12 = false;
                    }
                    z13 = zH3 | z12 | (i19 == 4);
                    objP2 = tVar5.P();
                    if (z13 || objP2 == g1Var) {
                        objP2 = new b0.i(5, j0Var, f6Var2, function0);
                        tVar5.m0(objP2);
                    }
                    Function1 function1 = (Function1) objP2;
                    objP3 = tVar5.P();
                    if (objP3 == g1Var) {
                        objP3 = c0.f.a(0.0f);
                        tVar5.m0(objP3);
                    }
                    c0.e eVar3 = (c0.e) objP3;
                    if (i18 > 256 || !tVar5.f(f6Var2)) {
                        i13 = i18;
                        if ((i12 & 384) != 256) {
                            z14 = false;
                        }
                        zH2 = (i19 == 4) | z14 | tVar5.h(j0Var) | tVar5.h(eVar3);
                        objP4 = tVar5.P();
                        if (zH2 || objP4 == g1Var) {
                            objP4 = new c4.b(f6Var2, j0Var, eVar3, function0);
                            tVar5.m0(objP4);
                        }
                        int i21 = i13;
                        int i22 = i12;
                        tVar3 = tVar5;
                        long j22 = j17;
                        y3 y3Var = new y3(j22, function03, f6Var2, eVar3, j0Var, function1, tVar2, f14, v0Var2, j16, j15, f13, function23, function24, eVar);
                        f6Var2 = f6Var2;
                        i4 i4Var4 = i4Var2;
                        p5.f((Function0) objP4, i4Var4, eVar3, x1.f.d(-314673510, y3Var, tVar3), tVar3, 3632);
                        if (f6Var2.f73301b.h().f75679a.containsKey(g6.f73349b)) {
                            if ((i21 <= 256 || !tVar3.f(f6Var2)) && (i22 & 384) != 256) {
                                z15 = false;
                            }
                            Object objP6 = tVar3.P();
                            if (z15 || objP6 == g1Var) {
                                objP6 = new w3(f6Var2, null, 2);
                                tVar3.m0(objP6);
                            }
                            p1.o0.f(f6Var2, (Function2) objP6, tVar3);
                        }
                        j18 = j16;
                        j19 = j15;
                        function25 = function23;
                        function26 = function24;
                        i4Var3 = i4Var4;
                        tVar4 = tVar2;
                        f15 = f13;
                        f16 = f14;
                        v0Var3 = v0Var2;
                        j21 = j22;
                    } else {
                        i13 = i18;
                    }
                    z14 = true;
                    zH2 = (i19 == 4) | z14 | tVar5.h(j0Var) | tVar5.h(eVar3);
                    objP4 = tVar5.P();
                    if (zH2) {
                        objP4 = new c4.b(f6Var2, j0Var, eVar3, function0);
                        tVar5.m0(objP4);
                        int i212 = i13;
                        int i222 = i12;
                        tVar3 = tVar5;
                        long j222 = j17;
                        y3 y3Var2 = new y3(j222, function03, f6Var2, eVar3, j0Var, function1, tVar2, f14, v0Var2, j16, j15, f13, function23, function24, eVar);
                        f6Var2 = f6Var2;
                        i4 i4Var42 = i4Var2;
                        p5.f((Function0) objP4, i4Var42, eVar3, x1.f.d(-314673510, y3Var2, tVar3), tVar3, 3632);
                        if (f6Var2.f73301b.h().f75679a.containsKey(g6.f73349b)) {
                        }
                        j18 = j16;
                        j19 = j15;
                        function25 = function23;
                        function26 = function24;
                        i4Var3 = i4Var42;
                        tVar4 = tVar2;
                        f15 = f13;
                        f16 = f14;
                        v0Var3 = v0Var2;
                        j21 = j222;
                    }
                } else {
                    function03 = function02;
                }
                z12 = true;
                z13 = zH3 | z12 | (i19 == 4);
                objP2 = tVar5.P();
                if (z13) {
                    objP2 = new b0.i(5, j0Var, f6Var2, function0);
                    tVar5.m0(objP2);
                    Function1 function12 = (Function1) objP2;
                    objP3 = tVar5.P();
                    if (objP3 == g1Var) {
                    }
                    c0.e eVar32 = (c0.e) objP3;
                    if (i18 > 256) {
                        i13 = i18;
                        if ((i12 & 384) != 256) {
                            z14 = true;
                        }
                        zH2 = (i19 == 4) | z14 | tVar5.h(j0Var) | tVar5.h(eVar32);
                        objP4 = tVar5.P();
                        if (zH2) {
                        }
                    }
                }
            } else {
                j17 = j14;
            }
            z11 = true;
            int i192 = i12 & 14;
            zH = z11 | tVar5.h(j0Var) | (i192 != 4);
            objP = tVar5.P();
            if (!zH) {
                objP = new androidx.fragment.app.m(3, f6Var2, j0Var, function0);
                tVar5.m0(objP);
                function02 = (Function0) objP;
                boolean zH32 = tVar5.h(j0Var);
                if (i18 > 256) {
                    function03 = function02;
                    if ((i12 & 384) != 256) {
                        z12 = true;
                    }
                    z13 = zH32 | z12 | (i192 == 4);
                    objP2 = tVar5.P();
                    if (z13) {
                    }
                }
            }
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new z3(function0, tVar4, f6Var2, f16, v0Var3, j18, j19, f15, j21, function25, function26, i4Var3, eVar, i5);
        }
    }

    public static final void b(c0.e eVar, t70.j0 j0Var, Function0 function0, Function1 function1, b2.t tVar, f6 f6Var, float f11, i2.v0 v0Var, long j11, long j12, float f12, Function2 function2, Function2 function22, x1.e eVar2, p1.o oVar, int i5) {
        p1.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-1676960531);
        int i11 = i5 | (tVar3.h(eVar) ? 32 : 16) | (tVar3.h(j0Var) ? 256 : 128) | (tVar3.h(function0) ? 2048 : 1024);
        boolean zH = tVar3.h(function1);
        int i12 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
        int i13 = i11 | (zH ? ReaderJsonLexerKt.BATCH_SIZE : 8192) | (tVar3.f(tVar) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX) | (tVar3.f(f6Var) ? 1048576 : 524288) | (tVar3.c(f11) ? 8388608 : 4194304) | (tVar3.f(v0Var) ? 67108864 : 33554432) | (tVar3.e(j11) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456);
        int i14 = (tVar3.e(j12) ? 4 : 2) | (tVar3.c(f12) ? 32 : 16) | (tVar3.h(function2) ? 256 : 128) | (tVar3.h(function22) ? 2048 : 1024);
        if (tVar3.h(eVar2)) {
            i12 = ReaderJsonLexerKt.BATCH_SIZE;
        }
        int i15 = i14 | i12;
        if ((i13 & 306783379) == 306783378 && (i15 & 9363) == 9362 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar3;
        } else {
            tVar3.X();
            if ((i5 & 1) != 0 && !tVar3.B()) {
                tVar3.V();
            }
            tVar3.q();
            String strW = t2.c.w(tVar3, 2132018131);
            b2.t tVarE = androidx.compose.foundation.layout.e.e(androidx.compose.foundation.layout.e.v(androidx.compose.foundation.layout.b.f13968a.a(tVar, b2.d.f16998b), 0.0f, f11, 1), 1.0f);
            int i16 = (i13 & 3670016) ^ 1572864;
            boolean z11 = (i16 > 1048576 && tVar3.f(f6Var)) || (i13 & 1572864) == 1048576;
            Object objP = tVar3.P();
            boolean z12 = z11;
            Object obj = p1.n.f81514a;
            if (z12 || objP == obj) {
                g0.d1 d1Var = g0.d1.f56493a;
                float f13 = d6.f73190a;
                objP = new b6(f6Var, function1);
                tVar3.m0(objP);
            }
            b2.t tVarA = androidx.compose.ui.input.nestedscroll.a.a(tVarE, (u2.a) objP, null);
            f1.y yVar = f6Var.f73301b;
            f1.y yVar2 = f6Var.f73301b;
            g0.d1 d1Var2 = g0.d1.f56493a;
            boolean z13 = (i16 > 1048576 && tVar3.f(f6Var)) || (i13 & 1572864) == 1048576;
            Object objP2 = tVar3.P();
            if (z13 || objP2 == obj) {
                objP2 = new b0.g(f6Var, 5);
                tVar3.m0(objP2);
            }
            b2.t tVarC = androidx.compose.material3.internal.a.c(tVarA, yVar, (Function2) objP2);
            f1.x xVar = (f1.x) yVar2.n;
            boolean zC = f6Var.c();
            boolean z14 = ((p1.s2) yVar2.f54119i).getValue() != null;
            boolean z15 = (i13 & 57344) == 16384;
            Object objP3 = tVar3.P();
            if (z15 || objP3 == obj) {
                objP3 = new gy.i1(function1, null, 2);
                tVar3.m0(objP3);
            }
            b2.t tVarA2 = g0.i0.a(tVarC, xVar, d1Var2, zC, null, z14, (Function3) objP3, false, 168);
            boolean zF = tVar3.f(strW);
            Object objP4 = tVar3.P();
            if (zF || objP4 == obj) {
                objP4 = new j3.o(strW, 3);
                tVar3.m0(objP4);
            }
            b2.t tVarB = j3.n.b(tVarA2, false, (Function1) objP4);
            boolean z16 = ((i13 & 112) == 32 || tVar3.h(eVar)) | ((i16 > 1048576 && tVar3.f(f6Var)) || (i13 & 1572864) == 1048576);
            Object objP5 = tVar3.P();
            if (z16 || objP5 == obj) {
                objP5 = new b0.e(10, f6Var, eVar);
                tVar3.m0(objP5);
            }
            int i17 = i13 >> 21;
            int i18 = i15 << 9;
            tVar2 = tVar3;
            t7.a(androidx.compose.ui.graphics.a.a(tVarB, (Function1) objP5), v0Var, j11, j12, f12, 0.0f, null, x1.f.d(-692668920, new d4(function22, eVar, function2, f6Var, function0, j0Var, eVar2), tVar3), tVar2, (i17 & 896) | (i17 & 112) | 12582912 | (i18 & 7168) | (i18 & 57344), 96);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new e4(eVar, j0Var, function0, function1, tVar, f6Var, f11, v0Var, j11, j12, f12, function2, function22, eVar2, i5);
        }
    }

    public static final void c(long j11, Function0 function0, boolean z11, p1.o oVar, int i5) {
        int i11;
        boolean z12;
        boolean z13;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(951870469);
        if ((i5 & 6) == 0) {
            i11 = (tVar.e(j11) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar.h(function0) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar.g(z11) ? 256 : 128;
        }
        if ((i11 & 147) == 146 && tVar.E()) {
            tVar.V();
        } else if (j11 != 16) {
            Continuation continuation = null;
            p1.y2 y2VarB = c0.h.b(z11 ? 1.0f : 0.0f, new c0.h2(0, (c0.a0) null, 7), null, null, tVar, 48, 28);
            String strW = t2.c.w(tVar, 2132017628);
            tVar.b0(-1785653838);
            b2.t tVarB = b2.r.f17024a;
            p1.g1 g1Var = p1.n.f81514a;
            if (z11) {
                int i12 = i11 & 112;
                boolean z14 = i12 == 32;
                Object objP = tVar.P();
                if (z14 || objP == g1Var) {
                    objP = new g4(function0, continuation, 0);
                    tVar.m0(objP);
                }
                b2.t tVarThen = tVarB.then(new SuspendPointerInputElement(function0, null, new v2.e0((Function2) objP), 6));
                boolean zF = tVar.f(strW) | (i12 == 32);
                Object objP2 = tVar.P();
                if (zF || objP2 == g1Var) {
                    objP2 = new b0.e(11, strW, function0);
                    tVar.m0(objP2);
                }
                z12 = true;
                tVarB = j3.n.b(tVarThen, true, (Function1) objP2);
                z13 = false;
            } else {
                z12 = true;
                z13 = false;
            }
            tVar.p(z13);
            b2.t tVarThen2 = androidx.compose.foundation.layout.e.f13973c.then(tVarB);
            boolean zF2 = tVar.f(y2VarB) | ((i11 & 14) == 4 ? z12 : false);
            Object objP3 = tVar.P();
            if (zF2 || objP3 == g1Var) {
                objP3 = new b0.u(j11, y2VarB);
                tVar.m0(objP3);
            }
            ic.b.g(0, tVarThen2, (Function1) objP3, tVar);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new f4(j11, function0, z11, i5);
        }
    }

    public static final float d(i2.a0 a0Var, float f11) {
        i2.s0 s0Var = (i2.s0) a0Var;
        float fD = h2.e.d(s0Var.o);
        if (Float.isNaN(fD) || fD == 0.0f) {
            return 1.0f;
        }
        return 1.0f - (bh.g.d0(0.0f, Math.min(s0Var.f61162p.getDensity() * f73378a, fD), f11) / fD);
    }

    public static final float e(i2.a0 a0Var, float f11) {
        i2.s0 s0Var = (i2.s0) a0Var;
        float fB = h2.e.b(s0Var.o);
        if (Float.isNaN(fB) || fB == 0.0f) {
            return 1.0f;
        }
        return 1.0f - (bh.g.d0(0.0f, Math.min(s0Var.f61162p.getDensity() * f73379b, fB), f11) / fB);
    }

    public static final f6 f(int i5, p1.o oVar, int i11) {
        boolean z11 = true;
        boolean z12 = (i11 & 1) == 0;
        x xVar = x.o;
        int i12 = (i5 & 14) | 384;
        float f11 = d6.f73190a;
        p1.t tVar = (p1.t) oVar;
        y3.c cVar = (y3.c) tVar.j(c3.z1.f19497h);
        Object[] objArr = {Boolean.valueOf(z12), xVar, Boolean.FALSE};
        ab.c0 c0Var = new ab.c0(7, i1.E, new e6(z12, cVar, xVar));
        if ((((i12 & 14) ^ 6) <= 4 || !tVar.g(z12)) && (i12 & 6) != 4) {
            z11 = false;
        }
        boolean zF = tVar.f(cVar) | z11 | tVar.f(xVar) | tVar.g(false);
        Object objP = tVar.P();
        if (zF || objP == p1.n.f81514a) {
            objP = new c6(z12, cVar, g6.f73348a, xVar);
            tVar.m0(objP);
        }
        return (f6) y1.j.e(objArr, c0Var, (Function0) objP, tVar, 0, 4);
    }
}
