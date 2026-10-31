package l1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.WeakHashMap;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class u5 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f74077a = 16;

    /* JADX WARN: Removed duplicated region for block: B:100:0x0140  */
    /* JADX WARN: Removed duplicated region for block: B:101:0x0143  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0155  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x01a8  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0211  */
    /* JADX WARN: Removed duplicated region for block: B:128:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0109  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0137  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x013c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(b2.t tVar, Function2 function2, Function2 function22, Function2 function23, Function2 function24, int i5, long j11, long j12, k0.g2 g2Var, x1.e eVar, p1.o oVar, int i11, int i12) {
        int i13;
        Function2 function25;
        int i14;
        Function2 function26;
        int i15;
        Function2 function27;
        int i16;
        Function2 function28;
        int i17;
        long j13;
        int i18;
        x1.e eVar2;
        Function2 function29;
        Function2 function210;
        Function2 function211;
        Function2 function212;
        long jB;
        b2.t tVar2;
        int i19;
        int i21;
        long j14;
        k0.g2 g2Var2;
        boolean zF;
        Object objP;
        m1.g0 g0Var;
        boolean zF2;
        Object objP2;
        long j15;
        p1.t tVar3;
        b2.t tVar4;
        Function2 function213;
        k0.g2 g2Var3;
        Function2 function214;
        int i22;
        long j16;
        Function2 function215;
        Function2 function216;
        p1.t1 t1VarU;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(-1219521777);
        int i23 = i12 & 1;
        if (i23 != 0) {
            i13 = i11 | 6;
        } else if ((i11 & 6) == 0) {
            i13 = (tVar5.f(tVar) ? 4 : 2) | i11;
        } else {
            i13 = i11;
        }
        int i24 = i12 & 2;
        if (i24 != 0) {
            i13 |= 48;
        } else {
            if ((i11 & 48) == 0) {
                function25 = function2;
                i13 |= tVar5.h(function25) ? 32 : 16;
            }
            i14 = i12 & 4;
            if (i14 == 0) {
                i13 |= 384;
            } else {
                if ((i11 & 384) == 0) {
                    function26 = function22;
                    i13 |= tVar5.h(function26) ? 256 : 128;
                }
                i15 = i12 & 8;
                if (i15 != 0) {
                    i13 |= 3072;
                } else {
                    if ((i11 & 3072) == 0) {
                        function27 = function23;
                        i13 |= tVar5.h(function27) ? 2048 : 1024;
                    }
                    i16 = i12 & 16;
                    if (i16 != 0) {
                        if ((i11 & 24576) == 0) {
                            function28 = function24;
                            i13 |= tVar5.h(function28) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        }
                        i17 = i13 | 196608;
                        if ((1572864 & i11) == 0) {
                            j13 = j11;
                            i17 |= ((i12 & 64) == 0 && tVar5.e(j13)) ? 1048576 : 524288;
                        } else {
                            j13 = j11;
                        }
                        if ((i11 & 12582912) == 0) {
                            i17 |= 4194304;
                        }
                        if ((i11 & 100663296) == 0) {
                            i17 |= 33554432;
                        }
                        if ((i11 & 805306368) == 0) {
                            i18 = 12582912;
                            eVar2 = eVar;
                            i17 |= tVar5.h(eVar2) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
                        } else {
                            i18 = 12582912;
                            eVar2 = eVar;
                        }
                        if ((i17 & 306783379) == 306783378 && tVar5.E()) {
                            tVar5.V();
                            function214 = function26;
                            tVar3 = tVar5;
                            function215 = function27;
                            function216 = function28;
                            j16 = j12;
                            g2Var3 = g2Var;
                            j15 = j13;
                            function213 = function25;
                            tVar4 = tVar;
                            i22 = i5;
                        } else {
                            tVar5.X();
                            if ((i11 & 1) != 0 || tVar5.B()) {
                                b2.t tVar6 = i23 == 0 ? b2.r.f17024a : tVar;
                                function29 = i24 == 0 ? n1.f73680a : function25;
                                function210 = i14 == 0 ? n1.f73681b : function26;
                                function211 = i15 == 0 ? n1.f73682c : function27;
                                function212 = i16 == 0 ? n1.f73683d : function28;
                                if ((i12 & 64) != 0) {
                                    j13 = ((d1) tVar5.j(g1.f73330a)).n;
                                    i17 &= -3670017;
                                }
                                jB = g1.b(j13, tVar5);
                                WeakHashMap weakHashMap = k0.h2.f70617v;
                                tVar2 = tVar6;
                                i19 = i17 & (-264241153);
                                i21 = 2;
                                j14 = j13;
                                g2Var2 = k0.e.e(tVar5).f70624g;
                            } else {
                                tVar5.V();
                                if ((i12 & 64) != 0) {
                                    i17 &= -3670017;
                                }
                                i19 = i17 & (-264241153);
                                j14 = j13;
                                function29 = function25;
                                function210 = function26;
                                function211 = function27;
                                function212 = function28;
                                tVar2 = tVar;
                                i21 = i5;
                                jB = j12;
                                g2Var2 = g2Var;
                            }
                            tVar5.q();
                            zF = tVar5.f(g2Var2);
                            int i25 = i21;
                            objP = tVar5.P();
                            long j17 = j14;
                            p1.g1 g1Var = p1.n.f81514a;
                            if (!zF || objP == g1Var) {
                                objP = new m1.g0(g2Var2);
                                tVar5.m0(objP);
                            }
                            g0Var = (m1.g0) objP;
                            zF2 = tVar5.f(g0Var) | tVar5.f(g2Var2);
                            objP2 = tVar5.P();
                            if (!zF2 || objP2 == g1Var) {
                                objP2 = new b0.e(14, g0Var, g2Var2);
                                tVar5.m0(objP2);
                            }
                            Function2 function217 = function29;
                            Function2 function218 = function210;
                            Function2 function219 = function211;
                            Function2 function220 = function212;
                            long j18 = jB;
                            k0.g2 g2Var4 = g2Var2;
                            t7.a(fg.a.i(tVar2, new b00.r0((Function1) objP2, 16)), null, j17, j18, 0.0f, 0.0f, null, x1.f.d(-1979205334, new b0.l(i25, function217, eVar2, function219, function220, g0Var, function218), tVar5), tVar5, ((i19 >> 12) & 896) | i18, 114);
                            j15 = j17;
                            tVar3 = tVar5;
                            tVar4 = tVar2;
                            function213 = function217;
                            g2Var3 = g2Var4;
                            function214 = function218;
                            i22 = i25;
                            j16 = j18;
                            function215 = function219;
                            function216 = function220;
                        }
                        t1VarU = tVar3.u();
                        if (t1VarU != null) {
                            t1VarU.f81583d = new s5(tVar4, function213, function214, function215, function216, i22, j15, j16, g2Var3, eVar, i11, i12);
                            return;
                        }
                        return;
                    }
                    i13 |= 24576;
                    function28 = function24;
                    i17 = i13 | 196608;
                    if ((1572864 & i11) == 0) {
                    }
                    if ((i11 & 12582912) == 0) {
                    }
                    if ((i11 & 100663296) == 0) {
                    }
                    if ((i11 & 805306368) == 0) {
                    }
                    if ((i17 & 306783379) == 306783378) {
                        tVar5.X();
                        if ((i11 & 1) != 0) {
                            if (i23 == 0) {
                            }
                            if (i24 == 0) {
                            }
                            if (i14 == 0) {
                            }
                            if (i15 == 0) {
                            }
                            if (i16 == 0) {
                            }
                            if ((i12 & 64) != 0) {
                            }
                            jB = g1.b(j13, tVar5);
                            WeakHashMap weakHashMap2 = k0.h2.f70617v;
                            tVar2 = tVar6;
                            i19 = i17 & (-264241153);
                            i21 = 2;
                            j14 = j13;
                            g2Var2 = k0.e.e(tVar5).f70624g;
                            tVar5.q();
                            zF = tVar5.f(g2Var2);
                            int i252 = i21;
                            objP = tVar5.P();
                            long j172 = j14;
                            p1.g1 g1Var2 = p1.n.f81514a;
                            if (!zF) {
                                objP = new m1.g0(g2Var2);
                                tVar5.m0(objP);
                                g0Var = (m1.g0) objP;
                                zF2 = tVar5.f(g0Var) | tVar5.f(g2Var2);
                                objP2 = tVar5.P();
                                if (!zF2) {
                                    objP2 = new b0.e(14, g0Var, g2Var2);
                                    tVar5.m0(objP2);
                                    Function2 function2172 = function29;
                                    Function2 function2182 = function210;
                                    Function2 function2192 = function211;
                                    Function2 function2202 = function212;
                                    long j182 = jB;
                                    k0.g2 g2Var42 = g2Var2;
                                    t7.a(fg.a.i(tVar2, new b00.r0((Function1) objP2, 16)), null, j172, j182, 0.0f, 0.0f, null, x1.f.d(-1979205334, new b0.l(i252, function2172, eVar2, function2192, function2202, g0Var, function2182), tVar5), tVar5, ((i19 >> 12) & 896) | i18, 114);
                                    j15 = j172;
                                    tVar3 = tVar5;
                                    tVar4 = tVar2;
                                    function213 = function2172;
                                    g2Var3 = g2Var42;
                                    function214 = function2182;
                                    i22 = i252;
                                    j16 = j182;
                                    function215 = function2192;
                                    function216 = function2202;
                                }
                            }
                        }
                    }
                    t1VarU = tVar3.u();
                    if (t1VarU != null) {
                    }
                }
                function27 = function23;
                i16 = i12 & 16;
                if (i16 != 0) {
                }
                function28 = function24;
                i17 = i13 | 196608;
                if ((1572864 & i11) == 0) {
                }
                if ((i11 & 12582912) == 0) {
                }
                if ((i11 & 100663296) == 0) {
                }
                if ((i11 & 805306368) == 0) {
                }
                if ((i17 & 306783379) == 306783378) {
                }
                t1VarU = tVar3.u();
                if (t1VarU != null) {
                }
            }
            function26 = function22;
            i15 = i12 & 8;
            if (i15 != 0) {
            }
            function27 = function23;
            i16 = i12 & 16;
            if (i16 != 0) {
            }
            function28 = function24;
            i17 = i13 | 196608;
            if ((1572864 & i11) == 0) {
            }
            if ((i11 & 12582912) == 0) {
            }
            if ((i11 & 100663296) == 0) {
            }
            if ((i11 & 805306368) == 0) {
            }
            if ((i17 & 306783379) == 306783378) {
            }
            t1VarU = tVar3.u();
            if (t1VarU != null) {
            }
        }
        function25 = function2;
        i14 = i12 & 4;
        if (i14 == 0) {
        }
        function26 = function22;
        i15 = i12 & 8;
        if (i15 != 0) {
        }
        function27 = function23;
        i16 = i12 & 16;
        if (i16 != 0) {
        }
        function28 = function24;
        i17 = i13 | 196608;
        if ((1572864 & i11) == 0) {
        }
        if ((i11 & 12582912) == 0) {
        }
        if ((i11 & 100663296) == 0) {
        }
        if ((i11 & 805306368) == 0) {
        }
        if ((i17 & 306783379) == 306783378) {
        }
        t1VarU = tVar3.u();
        if (t1VarU != null) {
        }
    }

    public static final void b(int i5, Function2 function2, x1.e eVar, Function2 function22, Function2 function23, k0.g2 g2Var, Function2 function24, p1.o oVar, int i11) {
        int i12;
        x1.e eVar2;
        k0.g2 g2Var2;
        Function2 function25;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-975511942);
        if ((i11 & 6) == 0) {
            i12 = (tVar.d(i5) ? 4 : 2) | i11;
        } else {
            i12 = i11;
        }
        if ((i11 & 48) == 0) {
            i12 |= tVar.h(function2) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            eVar2 = eVar;
            i12 |= tVar.h(eVar2) ? 256 : 128;
        } else {
            eVar2 = eVar;
        }
        if ((i11 & 3072) == 0) {
            i12 |= tVar.h(function22) ? 2048 : 1024;
        }
        if ((i11 & 24576) == 0) {
            i12 |= tVar.h(function23) ? 16384 : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i11) == 0) {
            g2Var2 = g2Var;
            i12 |= tVar.f(g2Var2) ? 131072 : SQLiteDatabase.OPEN_FULLMUTEX;
        } else {
            g2Var2 = g2Var;
        }
        if ((1572864 & i11) == 0) {
            function25 = function24;
            i12 |= tVar.h(function25) ? 1048576 : 524288;
        } else {
            function25 = function24;
        }
        if ((i12 & 599187) == 599186 && tVar.E()) {
            tVar.V();
        } else {
            boolean z11 = ((i12 & 896) == 256) | ((i12 & 112) == 32) | ((i12 & 7168) == 2048) | ((458752 & i12) == 131072) | ((57344 & i12) == 16384) | ((i12 & 14) == 4) | ((3670016 & i12) == 1048576);
            Object objP = tVar.P();
            if (z11 || objP == p1.n.f81514a) {
                b0.l lVar = new b0.l(function2, function22, function23, i5, g2Var2, function25, eVar2, 4);
                tVar.m0(lVar);
                objP = lVar;
            }
            z2.r1.a(null, (Function2) objP, tVar, 0, 1);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new u0(i5, function2, eVar, function22, function23, g2Var, function24, i11);
        }
    }
}
