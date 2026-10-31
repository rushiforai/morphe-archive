package l1;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.IntCompanionObject;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class l5 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f73584a;

    /* renamed from: b, reason: collision with root package name */
    public static final b2.t f73585b;

    /* renamed from: c, reason: collision with root package name */
    public static final float f73586c = 240;

    /* renamed from: d, reason: collision with root package name */
    public static final float f73587d;

    /* renamed from: e, reason: collision with root package name */
    public static final float f73588e;

    /* renamed from: f, reason: collision with root package name */
    public static final c0.w f73589f;

    static {
        float f11 = 10;
        f73584a = f11;
        f73585b = androidx.compose.foundation.layout.d.l(j3.n.b(androidx.compose.ui.layout.b.a(b2.r.f17024a, j1.f73478m), true, x.f74202s), 0.0f, f11, 1);
        float f12 = o1.v.f79180c;
        f73587d = f12;
        f73588e = o1.v.f79181d - (f12 * 2);
        new c0.w(0.2f, 0.0f, 0.8f, 1.0f);
        new c0.w(0.4f, 0.0f, 1.0f, 1.0f);
        new c0.w(0.0f, 0.0f, 0.65f, 1.0f);
        new c0.w(0.1f, 0.0f, 0.45f, 1.0f);
        f73589f = new c0.w(0.4f, 0.0f, 0.2f, 1.0f);
    }

    public static final void a(Function0 function0, b2.t tVar, long j11, float f11, long j12, int i5, float f12, p1.o oVar, int i11) {
        float f13;
        b2.t tVar2;
        float f14;
        float f15;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-1798883595);
        int i12 = i11 | (tVar3.h(function0) ? 4 : 2) | (tVar3.e(j11) ? 256 : 128) | (tVar3.e(j12) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (tVar3.d(i5) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX) | 1572864;
        if ((599187 & i12) == 599186 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
            f15 = f12;
        } else {
            tVar3.X();
            if ((i11 & 1) == 0 || tVar3.B()) {
                f13 = c5.f73110f;
            } else {
                tVar3.V();
                f13 = f12;
            }
            tVar3.q();
            boolean z11 = (i12 & 14) == 4;
            Object objP = tVar3.P();
            Object obj = p1.n.f81514a;
            if (z11 || objP == obj) {
                objP = new c4(function0, 2);
                tVar3.m0(objP);
            }
            Function0 function02 = (Function0) objP;
            k2.k kVar = new k2.k(((y3.c) tVar3.j(c3.z1.f19497h)).mo102toPx0680j_4(f11), 0.0f, i5, 0, 26);
            boolean zF = tVar3.f(function02);
            Object objP2 = tVar3.P();
            if (zF || objP2 == obj) {
                objP2 = new x3(function02, 2);
                tVar3.m0(objP2);
            }
            tVar2 = tVar;
            b2.t tVarO = androidx.compose.foundation.layout.e.o(j3.n.b(tVar2, true, (Function1) objP2), f73588e);
            boolean zF2 = ((i12 & 458752) == 131072) | tVar3.f(function02) | ((((57344 & i12) ^ 24576) > 16384 && tVar3.e(j12)) || (i12 & 24576) == 16384) | tVar3.h(kVar) | ((((i12 & 896) ^ 384) > 256 && tVar3.e(j11)) || (i12 & 384) == 256);
            Object objP3 = tVar3.P();
            if (zF2 || objP3 == obj) {
                f14 = f13;
                objP3 = new d5(function02, i5, f14, f11, j12, kVar, j11);
                tVar3.m0(objP3);
            } else {
                f14 = f13;
            }
            ic.b.g(0, tVarO, (Function1) objP3, tVar3);
            f15 = f14;
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new e5(function0, tVar2, j11, f11, j12, i5, f15, i11);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x021d  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x021f  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x023d  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0247  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0273  */
    /* JADX WARN: Removed duplicated region for block: B:86:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(b2.t tVar, long j11, float f11, long j12, int i5, p1.o oVar, int i11, int i12) {
        b2.t tVar2;
        int i13;
        long jE;
        float f12;
        int i14;
        b2.t tVar3;
        long j13;
        int i15;
        int i16;
        long j14;
        float f13;
        k2.k kVar;
        long j15;
        c0.j0 j0VarB;
        c0.j0 j0VarA;
        c0.j0 j0VarA2;
        c0.j0 j0VarA3;
        boolean zE;
        Object objP;
        long j16;
        float f14;
        b2.t tVar4;
        long j17;
        float f15;
        long j18;
        int i17;
        p1.t1 t1VarU;
        Float fValueOf = Float.valueOf(290.0f);
        Float fValueOf2 = Float.valueOf(0.0f);
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(-115871647);
        int i18 = i12 & 1;
        if (i18 != 0) {
            i13 = i11 | 6;
            tVar2 = tVar;
        } else if ((i11 & 6) == 0) {
            tVar2 = tVar;
            i13 = (tVar5.f(tVar2) ? 4 : 2) | i11;
        } else {
            tVar2 = tVar;
            i13 = i11;
        }
        if ((i11 & 48) == 0) {
            jE = j11;
            i13 |= ((i12 & 2) == 0 && tVar5.e(jE)) ? 32 : 16;
        } else {
            jE = j11;
        }
        int i19 = i12 & 4;
        if (i19 == 0) {
            if ((i11 & 384) == 0) {
                f12 = f11;
                i13 |= tVar5.c(f12) ? 256 : 128;
            }
            if ((i11 & 3072) == 0) {
                i13 |= 1024;
            }
            i14 = i13 | 24576;
            if ((i14 & 9363) == 9362 || !tVar5.E()) {
                tVar5.X();
                if ((i11 & 1) != 0 || tVar5.B()) {
                    tVar3 = i18 == 0 ? b2.r.f17024a : tVar2;
                    if ((i12 & 2) != 0) {
                        float f16 = c5.f73105a;
                        float f17 = o1.v.f79178a;
                        jE = g1.e(tVar5, 26);
                        i14 &= -113;
                    }
                    if (i19 != 0) {
                        f12 = c5.f73105a;
                    }
                    float f18 = c5.f73105a;
                    j13 = i2.s.f61146l;
                    long j19 = jE;
                    i15 = i14 & (-7169);
                    i16 = c5.f73107c;
                    j14 = j19;
                } else {
                    tVar5.V();
                    if ((i12 & 2) != 0) {
                        i14 &= -113;
                    }
                    i15 = i14 & (-7169);
                    tVar3 = tVar2;
                    j14 = jE;
                    j13 = j12;
                    i16 = i5;
                }
                f13 = f12;
                tVar5.q();
                int i21 = i16;
                kVar = new k2.k(((y3.c) tVar5.j(c3.z1.f19497h)).mo102toPx0680j_4(f13), 0.0f, i21, 0, 26);
                c0.n0 n0VarC = c0.v.c(null, tVar5, 1);
                int i22 = i15;
                IntCompanionObject intCompanionObject = IntCompanionObject.f71856a;
                c0.i2 i2Var = c0.f.f18785j;
                bb.a aVar = c0.b0.f18713d;
                j15 = j13;
                j0VarB = c0.v.b(n0VarC, 0, 5, i2Var, c0.f.f(c0.f.i(6660, 0, aVar, 2), null, 6), null, tVar5, 33208, 16);
                j0VarA = c0.v.a(n0VarC, 0.0f, 286.0f, c0.f.f(c0.f.i(1332, 0, aVar, 2), null, 6), null, tVar5, 4536, 8);
                c0.p0 p0Var = new c0.p0();
                p0Var.f18916a = 1332;
                c0.o0 o0VarA = p0Var.a(fValueOf2, 0);
                c0.w wVar = f73589f;
                o0VarA.f18893b = wVar;
                p0Var.a(fValueOf, TTAdConstant.STYLE_SIZE_RADIO_2_3);
                Unit unit = Unit.f71706a;
                j0VarA2 = c0.v.a(n0VarC, 0.0f, 290.0f, c0.f.f(new c0.q0(p0Var), null, 6), null, tVar5, 4536, 8);
                c0.p0 p0Var2 = new c0.p0();
                p0Var2.f18916a = 1332;
                p0Var2.a(fValueOf2, TTAdConstant.STYLE_SIZE_RADIO_2_3).f18893b = wVar;
                p0Var2.a(fValueOf, p0Var2.f18916a);
                j0VarA3 = c0.v.a(n0VarC, 0.0f, 290.0f, c0.f.f(new c0.q0(p0Var2), null, 6), null, tVar5, 4536, 8);
                b2.t tVarO = androidx.compose.foundation.layout.e.o(j3.n.b(tVar3, true, new cv.n(29)), f73588e);
                zE = ((i22 & 896) != 256) | tVar5.e(j15) | tVar5.h(kVar) | tVar5.f(j0VarB) | tVar5.f(j0VarA2) | tVar5.f(j0VarA3) | tVar5.f(j0VarA) | ((((i22 & 112) ^ 48) <= 32 && tVar5.e(j14)) || (i22 & 48) == 32);
                objP = tVar5.P();
                if (zE || objP == p1.n.f81514a) {
                    j16 = j14;
                    f14 = f13;
                    objP = new f5(f14, j15, j16, j0VarB, j0VarA2, j0VarA3, j0VarA, kVar);
                    tVar5.m0(objP);
                } else {
                    j16 = j14;
                    f14 = f13;
                }
                ic.b.g(0, tVarO, (Function1) objP, tVar5);
                tVar4 = tVar3;
                j17 = j15;
                f15 = f14;
                j18 = j16;
                i17 = i21;
            } else {
                tVar5.V();
                j17 = j12;
                i17 = i5;
                tVar4 = tVar2;
                j18 = jE;
                f15 = f12;
            }
            t1VarU = tVar5.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new g5(tVar4, j18, f15, j17, i17, i11, i12);
                return;
            }
            return;
        }
        i13 |= 384;
        f12 = f11;
        if ((i11 & 3072) == 0) {
        }
        i14 = i13 | 24576;
        if ((i14 & 9363) == 9362) {
            tVar5.X();
            if ((i11 & 1) != 0) {
                if (i18 == 0) {
                }
                if ((i12 & 2) != 0) {
                }
                if (i19 != 0) {
                }
                float f182 = c5.f73105a;
                j13 = i2.s.f61146l;
                long j192 = jE;
                i15 = i14 & (-7169);
                i16 = c5.f73107c;
                j14 = j192;
                f13 = f12;
                tVar5.q();
                int i212 = i16;
                kVar = new k2.k(((y3.c) tVar5.j(c3.z1.f19497h)).mo102toPx0680j_4(f13), 0.0f, i212, 0, 26);
                c0.n0 n0VarC2 = c0.v.c(null, tVar5, 1);
                int i222 = i15;
                IntCompanionObject intCompanionObject2 = IntCompanionObject.f71856a;
                c0.i2 i2Var2 = c0.f.f18785j;
                bb.a aVar2 = c0.b0.f18713d;
                j15 = j13;
                j0VarB = c0.v.b(n0VarC2, 0, 5, i2Var2, c0.f.f(c0.f.i(6660, 0, aVar2, 2), null, 6), null, tVar5, 33208, 16);
                j0VarA = c0.v.a(n0VarC2, 0.0f, 286.0f, c0.f.f(c0.f.i(1332, 0, aVar2, 2), null, 6), null, tVar5, 4536, 8);
                c0.p0 p0Var3 = new c0.p0();
                p0Var3.f18916a = 1332;
                c0.o0 o0VarA2 = p0Var3.a(fValueOf2, 0);
                c0.w wVar2 = f73589f;
                o0VarA2.f18893b = wVar2;
                p0Var3.a(fValueOf, TTAdConstant.STYLE_SIZE_RADIO_2_3);
                Unit unit2 = Unit.f71706a;
                j0VarA2 = c0.v.a(n0VarC2, 0.0f, 290.0f, c0.f.f(new c0.q0(p0Var3), null, 6), null, tVar5, 4536, 8);
                c0.p0 p0Var22 = new c0.p0();
                p0Var22.f18916a = 1332;
                p0Var22.a(fValueOf2, TTAdConstant.STYLE_SIZE_RADIO_2_3).f18893b = wVar2;
                p0Var22.a(fValueOf, p0Var22.f18916a);
                j0VarA3 = c0.v.a(n0VarC2, 0.0f, 290.0f, c0.f.f(new c0.q0(p0Var22), null, 6), null, tVar5, 4536, 8);
                b2.t tVarO2 = androidx.compose.foundation.layout.e.o(j3.n.b(tVar3, true, new cv.n(29)), f73588e);
                if (((i222 & 112) ^ 48) <= 32) {
                    zE = ((i222 & 896) != 256) | tVar5.e(j15) | tVar5.h(kVar) | tVar5.f(j0VarB) | tVar5.f(j0VarA2) | tVar5.f(j0VarA3) | tVar5.f(j0VarA) | ((((i222 & 112) ^ 48) <= 32 && tVar5.e(j14)) || (i222 & 48) == 32);
                    objP = tVar5.P();
                    if (zE) {
                        j16 = j14;
                        f14 = f13;
                        objP = new f5(f14, j15, j16, j0VarB, j0VarA2, j0VarA3, j0VarA, kVar);
                        tVar5.m0(objP);
                        ic.b.g(0, tVarO2, (Function1) objP, tVar5);
                        tVar4 = tVar3;
                        j17 = j15;
                        f15 = f14;
                        j18 = j16;
                        i17 = i212;
                    }
                } else {
                    zE = ((i222 & 896) != 256) | tVar5.e(j15) | tVar5.h(kVar) | tVar5.f(j0VarB) | tVar5.f(j0VarA2) | tVar5.f(j0VarA3) | tVar5.f(j0VarA) | ((((i222 & 112) ^ 48) <= 32 && tVar5.e(j14)) || (i222 & 48) == 32);
                    objP = tVar5.P();
                    if (zE) {
                    }
                }
            }
        }
        t1VarU = tVar5.u();
        if (t1VarU == null) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0181  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0192 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0194  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x01b7  */
    /* JADX WARN: Removed duplicated region for block: B:124:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0102  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x013e  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0140  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0164  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void c(Function0 function0, b2.t tVar, long j11, long j12, int i5, float f11, Function1 function1, p1.o oVar, int i11, int i12) {
        float f12;
        Function1 function12;
        int i13;
        int i14;
        boolean z11;
        Object objP;
        Function0 function02;
        boolean zF;
        Object objP2;
        boolean zF2;
        float f13;
        Object j5Var;
        int i15;
        Function1 function13;
        int i16;
        float f14;
        Function1 function14;
        p1.t1 t1VarU;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-339970038);
        int i17 = i11 | (tVar2.h(function0) ? 4 : 2) | (tVar2.f(tVar) ? 32 : 16) | (tVar2.e(j11) ? 256 : 128) | (tVar2.e(j12) ? 2048 : 1024);
        int i18 = i17 | 24576;
        int i19 = i12 & 32;
        if (i19 == 0) {
            if ((i11 & 196608) == 0) {
                f12 = f11;
                i18 |= tVar2.c(f12) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
            }
            if ((i11 & 1572864) != 0) {
                if ((i12 & 64) == 0) {
                    function12 = function1;
                    int i21 = tVar2.h(function12) ? 1048576 : 524288;
                    i18 |= i21;
                } else {
                    function12 = function1;
                }
                i18 |= i21;
            } else {
                function12 = function1;
            }
            if ((i18 & 599187) == 599186 || !tVar2.E()) {
                tVar2.X();
                i13 = i11 & 1;
                Object obj = p1.n.f81514a;
                if (i13 != 0 || tVar2.B()) {
                    i14 = c5.f73106b;
                    if (i19 != 0) {
                        f12 = c5.f73109e;
                    }
                    if ((i12 & 64) != 0) {
                        boolean z12 = (((i18 & 896) ^ 384) > 256 && tVar2.e(j11)) || (i18 & 384) == 256;
                        Object objP3 = tVar2.P();
                        if (z12 || objP3 == obj) {
                            objP3 = new i5(j11, i14);
                            tVar2.m0(objP3);
                        }
                        i18 &= -3670017;
                        function12 = (Function1) objP3;
                    }
                } else {
                    tVar2.V();
                    if ((i12 & 64) != 0) {
                        i18 &= -3670017;
                    }
                    i14 = i5;
                }
                tVar2.q();
                z11 = (i18 & 14) != 4;
                objP = tVar2.P();
                if (!z11 || objP == obj) {
                    objP = new c4(function0, 3);
                    tVar2.m0(objP);
                }
                function02 = (Function0) objP;
                b2.t tVarThen = tVar.then(f73585b);
                zF = tVar2.f(function02);
                objP2 = tVar2.P();
                if (!zF || objP2 == obj) {
                    objP2 = new x3(function02, 3);
                    tVar2.m0(objP2);
                }
                b2.t tVarQ = androidx.compose.foundation.layout.e.q(j3.n.b(tVarThen, true, (Function1) objP2), f73586c, f73587d);
                zF2 = ((((i18 & 7168) ^ 3072) <= 2048 && tVar2.e(j12)) || (i18 & 3072) == 2048) | ((458752 & i18) != 131072) | tVar2.f(function02) | ((((i18 & 896) ^ 384) > 256 && tVar2.e(j11)) || (i18 & 384) == 256) | ((((3670016 & i18) ^ 1572864) > 1048576 && tVar2.f(function12)) || (i18 & 1572864) == 1048576);
                Object objP4 = tVar2.P();
                if (zF2 || objP4 == obj) {
                    f13 = f12;
                    i15 = i14;
                    function13 = function12;
                    j5Var = new j5(i15, f13, function02, j12, j11, function13);
                    tVar2.m0(j5Var);
                } else {
                    f13 = f12;
                    j5Var = objP4;
                    i15 = i14;
                    function13 = function12;
                }
                ic.b.g(0, tVarQ, (Function1) j5Var, tVar2);
                i16 = i15;
                f14 = f13;
                function14 = function13;
            } else {
                tVar2.V();
                i16 = i5;
                f14 = f12;
                function14 = function12;
            }
            t1VarU = tVar2.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new k5(function0, tVar, j11, j12, i16, f14, function14, i11, i12);
                return;
            }
            return;
        }
        i18 = 221184 | i17;
        f12 = f11;
        if ((i11 & 1572864) != 0) {
        }
        if ((i18 & 599187) == 599186) {
            tVar2.X();
            i13 = i11 & 1;
            Object obj2 = p1.n.f81514a;
            if (i13 != 0) {
                i14 = c5.f73106b;
                if (i19 != 0) {
                }
                if ((i12 & 64) != 0) {
                }
                tVar2.q();
                if ((i18 & 14) != 4) {
                }
                objP = tVar2.P();
                if (!z11) {
                    objP = new c4(function0, 3);
                    tVar2.m0(objP);
                    function02 = (Function0) objP;
                    b2.t tVarThen2 = tVar.then(f73585b);
                    zF = tVar2.f(function02);
                    objP2 = tVar2.P();
                    if (!zF) {
                        objP2 = new x3(function02, 3);
                        tVar2.m0(objP2);
                        b2.t tVarQ2 = androidx.compose.foundation.layout.e.q(j3.n.b(tVarThen2, true, (Function1) objP2), f73586c, f73587d);
                        if (((i18 & 7168) ^ 3072) <= 2048) {
                            if (((i18 & 896) ^ 384) > 256) {
                                if (((3670016 & i18) ^ 1572864) > 1048576) {
                                    zF2 = ((((i18 & 7168) ^ 3072) <= 2048 && tVar2.e(j12)) || (i18 & 3072) == 2048) | ((458752 & i18) != 131072) | tVar2.f(function02) | ((((i18 & 896) ^ 384) > 256 && tVar2.e(j11)) || (i18 & 384) == 256) | ((((3670016 & i18) ^ 1572864) > 1048576 && tVar2.f(function12)) || (i18 & 1572864) == 1048576);
                                    Object objP42 = tVar2.P();
                                    if (zF2) {
                                        f13 = f12;
                                        i15 = i14;
                                        function13 = function12;
                                        j5Var = new j5(i15, f13, function02, j12, j11, function13);
                                        tVar2.m0(j5Var);
                                        ic.b.g(0, tVarQ2, (Function1) j5Var, tVar2);
                                        i16 = i15;
                                        f14 = f13;
                                        function14 = function13;
                                    }
                                } else {
                                    zF2 = ((((i18 & 7168) ^ 3072) <= 2048 && tVar2.e(j12)) || (i18 & 3072) == 2048) | ((458752 & i18) != 131072) | tVar2.f(function02) | ((((i18 & 896) ^ 384) > 256 && tVar2.e(j11)) || (i18 & 384) == 256) | ((((3670016 & i18) ^ 1572864) > 1048576 && tVar2.f(function12)) || (i18 & 1572864) == 1048576);
                                    Object objP422 = tVar2.P();
                                    if (zF2) {
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        t1VarU = tVar2.u();
        if (t1VarU == null) {
        }
    }

    public static final void d(k2.f fVar, float f11, float f12, long j11, float f13, int i5) {
        float fD = h2.e.d(fVar.mo94getSizeNHjbRc());
        float fB = h2.e.b(fVar.mo94getSizeNHjbRc());
        float f14 = 2;
        float f15 = fB / f14;
        boolean z11 = fVar.getLayoutDirection() == y3.n.f96612a;
        float f16 = (z11 ? f11 : 1.0f - f12) * fD;
        float f17 = (z11 ? f12 : 1.0f - f11) * fD;
        if (i5 == 0 || fB > fD) {
            fVar.mo85drawLineNGM6Ib0(j11, ab.e0.h(f16, f15), ab.e0.h(f17, f15), f13, (480 & 16) != 0 ? 0 : 0, (480 & 32) != 0 ? null : null, 1.0f, null, 3);
            return;
        }
        float f18 = f13 / f14;
        p70.a aVar = new p70.a(f18, fD - f18);
        float fFloatValue = ((Number) kotlin.ranges.a.i0(Float.valueOf(f16), aVar)).floatValue();
        float fFloatValue2 = ((Number) kotlin.ranges.a.i0(Float.valueOf(f17), aVar)).floatValue();
        if (Math.abs(f12 - f11) > 0.0f) {
            fVar.mo85drawLineNGM6Ib0(j11, ab.e0.h(fFloatValue, f15), ab.e0.h(fFloatValue2, f15), f13, (480 & 16) != 0 ? 0 : i5, (480 & 32) != 0 ? null : null, 1.0f, null, 3);
        }
    }

    public static final void e(k2.f fVar, float f11, float f12, long j11, k2.k kVar) {
        float f13 = 2;
        float f14 = kVar.f70872a / f13;
        float fD = h2.e.d(fVar.mo94getSizeNHjbRc()) - (f13 * f14);
        fVar.mo80drawArcyD3GUKo(j11, f11, f12, false, (832 & 16) != 0 ? 0L : ab.e0.h(f14, f14), fg.a.b(fD, fD), (832 & 64) != 0 ? 1.0f : 0.0f, kVar, null, 3);
    }
}
