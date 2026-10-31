package l1;

import android.view.View;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.UUID;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class p5 {

    /* renamed from: a, reason: collision with root package name */
    public static final k1.e f73784a = new k1.e(0.16f, 0.1f, 0.08f, 0.1f);

    /* JADX WARN: Removed duplicated region for block: B:31:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x010e  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0187  */
    /* JADX WARN: Removed duplicated region for block: B:90:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(Function0 function0, x1.e eVar, b2.t tVar, Function2 function2, Function2 function22, Function2 function23, i2.v0 v0Var, long j11, long j12, long j13, long j14, float f11, c4.y yVar, p1.o oVar, int i5, int i11, int i12) {
        Function0 function02;
        int i13;
        Function2 function24;
        int i14;
        int i15;
        c4.y yVar2;
        int i16;
        float f12;
        long j15;
        Function2 function25;
        c4.y yVar3;
        b2.t tVar2;
        long j16;
        long j17;
        long j18;
        i2.v0 v0Var2;
        int i17;
        p1.t tVar3;
        b2.t tVar4;
        Function2 function26;
        i2.v0 v0Var3;
        long j19;
        long j21;
        long j22;
        long j23;
        float f13;
        c4.y yVar4;
        p1.t1 t1VarU;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(-2081346864);
        if ((i5 & 6) == 0) {
            function02 = function0;
            i13 = (tVar5.h(function02) ? 4 : 2) | i5;
        } else {
            function02 = function0;
            i13 = i5;
        }
        if ((i5 & 48) == 0) {
            i13 |= tVar5.h(eVar) ? 32 : 16;
        }
        int i18 = i13 | 384;
        int i19 = i12 & 8;
        if (i19 != 0) {
            i18 = i13 | 3456;
        } else {
            if ((i5 & 3072) == 0) {
                function24 = function2;
                i18 |= tVar5.h(function24) ? 2048 : 1024;
            }
            i14 = i18 | 24576;
            if ((196608 & i5) == 0) {
                i14 |= tVar5.h(function22) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
            }
            if ((1572864 & i5) == 0) {
                i14 |= tVar5.h(function23) ? 1048576 : 524288;
            }
            if ((12582912 & i5) == 0) {
                i14 |= 4194304;
            }
            if ((100663296 & i5) == 0) {
                i14 |= 33554432;
            }
            if ((805306368 & i5) == 0) {
                i14 |= 268435456;
            }
            int i21 = i11 | TTAdConstant.AD_ID_IS_NULL_CODE;
            i15 = i12 & UserMetadata.MAX_INTERNAL_KEY_SIZE;
            if (i15 != 0) {
                if ((i11 & 3072) == 0) {
                    yVar2 = yVar;
                    i21 |= tVar5.f(yVar2) ? 2048 : 1024;
                }
                if ((306783379 & i14) == 306783378 && (i21 & 1171) == 1170 && tVar5.E()) {
                    tVar5.V();
                    v0Var3 = v0Var;
                    j19 = j11;
                    j21 = j12;
                    j22 = j13;
                    f13 = f11;
                    tVar3 = tVar5;
                    function26 = function24;
                    yVar4 = yVar2;
                    tVar4 = tVar;
                    j23 = j14;
                } else {
                    tVar5.X();
                    if ((i5 & 1) != 0 || tVar5.B()) {
                        if (i19 != 0) {
                            function24 = null;
                        }
                        float f14 = a.f72988a;
                        i2.v0 v0VarA = a6.a(tVar5, o1.d.f78994a);
                        long jE = g1.e(tVar5, 38);
                        long jE2 = g1.e(tVar5, o1.d.f78999f);
                        i16 = i14 & (-2143289345);
                        long jE3 = g1.e(tVar5, o1.d.f78995b);
                        long jE4 = g1.e(tVar5, o1.d.f78997d);
                        int i22 = i21 & (-127);
                        float f15 = a.f72988a;
                        b2.r rVar = b2.r.f17024a;
                        if (i15 == 0) {
                            f12 = f15;
                            j15 = jE2;
                            function25 = function24;
                            yVar3 = new c4.y(7);
                        } else {
                            f12 = f15;
                            j15 = jE2;
                            function25 = function24;
                            yVar3 = yVar2;
                        }
                        tVar2 = rVar;
                        j16 = jE3;
                        j17 = jE;
                        j18 = jE4;
                        v0Var2 = v0VarA;
                        i17 = i22;
                    } else {
                        tVar5.V();
                        i16 = i14 & (-2143289345);
                        i17 = i21 & (-127);
                        v0Var2 = v0Var;
                        j17 = j11;
                        j15 = j12;
                        j18 = j14;
                        f12 = f11;
                        function25 = function24;
                        yVar3 = yVar2;
                        tVar2 = tVar;
                        j16 = j13;
                    }
                    tVar5.q();
                    tVar3 = tVar5;
                    l.c(function02, eVar, tVar2, function25, function22, function23, v0Var2, j17, j15, j16, j18, f12, yVar3, tVar3, i16 & 2147483646, i17 & 8190);
                    tVar4 = tVar2;
                    function26 = function25;
                    v0Var3 = v0Var2;
                    j19 = j17;
                    j21 = j15;
                    j22 = j16;
                    j23 = j18;
                    f13 = f12;
                    yVar4 = yVar3;
                }
                t1VarU = tVar3.u();
                if (t1VarU != null) {
                    t1VarU.f81583d = new m(function0, eVar, tVar4, function26, function22, function23, v0Var3, j19, j21, j22, j23, f13, yVar4, i5, i11, i12);
                    return;
                }
                return;
            }
            i21 = 3474;
            yVar2 = yVar;
            if ((306783379 & i14) == 306783378) {
                tVar5.X();
                if ((i5 & 1) != 0) {
                    if (i19 != 0) {
                    }
                    float f142 = a.f72988a;
                    i2.v0 v0VarA2 = a6.a(tVar5, o1.d.f78994a);
                    long jE5 = g1.e(tVar5, 38);
                    long jE22 = g1.e(tVar5, o1.d.f78999f);
                    i16 = i14 & (-2143289345);
                    long jE32 = g1.e(tVar5, o1.d.f78995b);
                    long jE42 = g1.e(tVar5, o1.d.f78997d);
                    int i222 = i21 & (-127);
                    float f152 = a.f72988a;
                    b2.r rVar2 = b2.r.f17024a;
                    if (i15 == 0) {
                    }
                    tVar2 = rVar2;
                    j16 = jE32;
                    j17 = jE5;
                    j18 = jE42;
                    v0Var2 = v0VarA2;
                    i17 = i222;
                    tVar5.q();
                    tVar3 = tVar5;
                    l.c(function02, eVar, tVar2, function25, function22, function23, v0Var2, j17, j15, j16, j18, f12, yVar3, tVar3, i16 & 2147483646, i17 & 8190);
                    tVar4 = tVar2;
                    function26 = function25;
                    v0Var3 = v0Var2;
                    j19 = j17;
                    j21 = j15;
                    j22 = j16;
                    j23 = j18;
                    f13 = f12;
                    yVar4 = yVar3;
                }
            }
            t1VarU = tVar3.u();
            if (t1VarU != null) {
            }
        }
        function24 = function2;
        i14 = i18 | 24576;
        if ((196608 & i5) == 0) {
        }
        if ((1572864 & i5) == 0) {
        }
        if ((12582912 & i5) == 0) {
        }
        if ((100663296 & i5) == 0) {
        }
        if ((805306368 & i5) == 0) {
        }
        int i212 = i11 | TTAdConstant.AD_ID_IS_NULL_CODE;
        i15 = i12 & UserMetadata.MAX_INTERNAL_KEY_SIZE;
        if (i15 != 0) {
        }
        yVar2 = yVar;
        if ((306783379 & i14) == 306783378) {
        }
        t1VarU = tVar3.u();
        if (t1VarU != null) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0038  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0132  */
    /* JADX WARN: Removed duplicated region for block: B:76:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(b2.t tVar, i2.v0 v0Var, s0 s0Var, t0 t0Var, e0.u uVar, x1.e eVar, p1.o oVar, int i5, int i11) {
        b2.t tVar2;
        int i12;
        i2.v0 v0VarA;
        s0 s0VarI;
        t0 t0VarH;
        int i13;
        e0.u uVar2;
        int i14;
        int i15;
        i2.v0 v0Var2;
        s0 s0Var2;
        t0 t0Var2;
        x1.e eVar2;
        i2.v0 v0Var3;
        s0 s0Var3;
        t0 t0Var3;
        p1.t1 t1VarU;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(1179621553);
        if ((i5 & 6) == 0) {
            tVar2 = tVar;
            i12 = i5 | (tVar3.f(tVar2) ? 4 : 2);
        } else {
            tVar2 = tVar;
            i12 = i5;
        }
        if ((i11 & 2) == 0) {
            v0VarA = v0Var;
            int i16 = tVar3.f(v0VarA) ? 32 : 16;
            int i17 = i12 | i16;
            if ((i11 & 4) != 0) {
                s0VarI = s0Var;
                int i18 = tVar3.f(s0VarI) ? 256 : 128;
                int i19 = i17 | i18;
                if ((i11 & 8) == 0) {
                    t0VarH = t0Var;
                    int i21 = tVar3.f(t0VarH) ? 2048 : 1024;
                    int i22 = i19 | i21;
                    i13 = i11 & 16;
                    if (i13 == 0) {
                        i14 = i22 | 24576;
                        uVar2 = uVar;
                    } else {
                        uVar2 = uVar;
                        i14 = i22 | (tVar3.f(uVar2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE);
                    }
                    if ((74899 & i14) == 74898 || !tVar3.E()) {
                        tVar3.X();
                        if ((i5 & 1) != 0 || tVar3.B()) {
                            if ((i11 & 2) != 0) {
                                v0VarA = a6.a(tVar3, o1.m.f79124b);
                                i14 &= -113;
                            }
                            if ((i11 & 4) != 0) {
                                s0VarI = i((d1) tVar3.j(g1.f73330a));
                                i14 &= -897;
                            }
                            if ((i11 & 8) != 0) {
                                t0VarH = h();
                                i14 &= -7169;
                            }
                            if (i13 == 0) {
                                i2.v0 v0Var4 = v0VarA;
                                i15 = i14;
                                v0Var2 = v0Var4;
                                s0Var2 = s0VarI;
                                t0Var2 = t0VarH;
                                uVar2 = null;
                            }
                            tVar3.q();
                            int i23 = i15;
                            eVar2 = eVar;
                            e0.u uVar3 = uVar2;
                            t7.a(tVar2, v0Var2, s0Var2.f73928a, s0Var2.f73929b, 0.0f, ((y3.f) t0Var2.a(true, null, tVar3, ((i23 >> 3) & 896) | 54).getValue()).f96602a, uVar3, x1.f.d(664103990, new g(eVar2, 1, (byte) 0), tVar3), tVar3, (i23 & 14) | 12582912 | (i23 & 112) | ((i23 << 6) & 3670016), 16);
                            v0Var3 = v0Var2;
                            uVar2 = uVar3;
                            s0Var3 = s0Var2;
                            t0Var3 = t0Var2;
                        } else {
                            tVar3.V();
                            if ((i11 & 2) != 0) {
                                i14 &= -113;
                            }
                            if ((i11 & 4) != 0) {
                                i14 &= -897;
                            }
                            if ((i11 & 8) != 0) {
                                i14 &= -7169;
                            }
                        }
                        i2.v0 v0Var5 = v0VarA;
                        i15 = i14;
                        v0Var2 = v0Var5;
                        s0Var2 = s0VarI;
                        t0Var2 = t0VarH;
                        tVar3.q();
                        int i232 = i15;
                        eVar2 = eVar;
                        e0.u uVar32 = uVar2;
                        t7.a(tVar2, v0Var2, s0Var2.f73928a, s0Var2.f73929b, 0.0f, ((y3.f) t0Var2.a(true, null, tVar3, ((i232 >> 3) & 896) | 54).getValue()).f96602a, uVar32, x1.f.d(664103990, new g(eVar2, 1, (byte) 0), tVar3), tVar3, (i232 & 14) | 12582912 | (i232 & 112) | ((i232 << 6) & 3670016), 16);
                        v0Var3 = v0Var2;
                        uVar2 = uVar32;
                        s0Var3 = s0Var2;
                        t0Var3 = t0Var2;
                    } else {
                        tVar3.V();
                        eVar2 = eVar;
                        t0Var3 = t0VarH;
                        s0Var3 = s0VarI;
                        v0Var3 = v0VarA;
                    }
                    t1VarU = tVar3.u();
                    if (t1VarU == null) {
                        t1VarU.f81583d = new u0(tVar, v0Var3, s0Var3, t0Var3, uVar2, eVar2, i5, i11);
                        return;
                    }
                    return;
                }
                t0VarH = t0Var;
                int i222 = i19 | i21;
                i13 = i11 & 16;
                if (i13 == 0) {
                }
                if ((74899 & i14) == 74898) {
                    tVar3.X();
                    if ((i5 & 1) != 0) {
                        if ((i11 & 2) != 0) {
                        }
                        if ((i11 & 4) != 0) {
                        }
                        if ((i11 & 8) != 0) {
                        }
                        if (i13 == 0) {
                            i2.v0 v0Var52 = v0VarA;
                            i15 = i14;
                            v0Var2 = v0Var52;
                            s0Var2 = s0VarI;
                            t0Var2 = t0VarH;
                        }
                        tVar3.q();
                        int i2322 = i15;
                        eVar2 = eVar;
                        e0.u uVar322 = uVar2;
                        t7.a(tVar2, v0Var2, s0Var2.f73928a, s0Var2.f73929b, 0.0f, ((y3.f) t0Var2.a(true, null, tVar3, ((i2322 >> 3) & 896) | 54).getValue()).f96602a, uVar322, x1.f.d(664103990, new g(eVar2, 1, (byte) 0), tVar3), tVar3, (i2322 & 14) | 12582912 | (i2322 & 112) | ((i2322 << 6) & 3670016), 16);
                        v0Var3 = v0Var2;
                        uVar2 = uVar322;
                        s0Var3 = s0Var2;
                        t0Var3 = t0Var2;
                    }
                }
                t1VarU = tVar3.u();
                if (t1VarU == null) {
                }
            } else {
                s0VarI = s0Var;
            }
            int i192 = i17 | i18;
            if ((i11 & 8) == 0) {
            }
            int i2222 = i192 | i21;
            i13 = i11 & 16;
            if (i13 == 0) {
            }
            if ((74899 & i14) == 74898) {
            }
            t1VarU = tVar3.u();
            if (t1VarU == null) {
            }
        } else {
            v0VarA = v0Var;
        }
        int i172 = i12 | i16;
        if ((i11 & 4) != 0) {
        }
        int i1922 = i172 | i18;
        if ((i11 & 8) == 0) {
        }
        int i22222 = i1922 | i21;
        i13 = i11 & 16;
        if (i13 == 0) {
        }
        if ((74899 & i14) == 74898) {
        }
        t1VarU = tVar3.u();
        if (t1VarU == null) {
        }
    }

    public static final void c(Function0 function0, b2.t tVar, boolean z11, i2.v0 v0Var, s0 s0Var, t0 t0Var, x1.e eVar, p1.o oVar, int i5) {
        t0 t0VarH;
        int i11;
        boolean z12;
        p1.t tVar2;
        t0 t0Var2;
        boolean z13;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-2024281376);
        int i12 = i5 | 384 | (tVar3.f(v0Var) ? 2048 : 1024) | (tVar3.f(s0Var) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | 14221312;
        if ((38347923 & i12) == 38347922 && tVar3.E()) {
            tVar3.V();
            z13 = z11;
            t0Var2 = t0Var;
            tVar2 = tVar3;
        } else {
            tVar3.X();
            if ((i5 & 1) == 0 || tVar3.B()) {
                t0VarH = h();
                i11 = i12 & (-458753);
                z12 = true;
            } else {
                tVar3.V();
                i11 = i12 & (-458753);
                z12 = z11;
                t0VarH = t0Var;
            }
            tVar3.q();
            tVar3.b0(1976524431);
            Object objP = tVar3.P();
            if (objP == p1.n.f81514a) {
                objP = a2.c.d(tVar3);
            }
            i0.i iVar = (i0.i) objP;
            tVar3.p(false);
            tVar2 = tVar3;
            t7.b(function0, tVar, z12, v0Var, z12 ? s0Var.f73928a : s0Var.f73930c, z12 ? s0Var.f73929b : s0Var.f73931d, 0.0f, ((y3.f) t0VarH.a(z12, iVar, tVar3, 6).getValue()).f96602a, null, iVar, x1.f.d(776921067, new g(eVar, 2, (byte) 0), tVar3), tVar2, (i11 & 8190) | 100663296, 64);
            t0Var2 = t0VarH;
            z13 = z12;
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new v0(function0, tVar, z13, v0Var, s0Var, t0Var2, eVar, i5);
        }
    }

    public static final void d(b2.t tVar, float f11, long j11, p1.o oVar, int i5, int i11) {
        int i12;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1562471785);
        int i13 = i11 & 1;
        if (i13 != 0) {
            i12 = i5 | 6;
        } else if ((i5 & 6) == 0) {
            i12 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i14 = i11 & 2;
        if (i14 != 0) {
            i12 |= 48;
        } else if ((i5 & 48) == 0) {
            i12 |= tVar2.c(f11) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i12 |= ((i11 & 4) == 0 && tVar2.e(j11)) ? 256 : 128;
        }
        if ((i12 & 147) == 146 && tVar2.E()) {
            tVar2.V();
        } else {
            tVar2.X();
            if ((i5 & 1) == 0 || tVar2.B()) {
                if (i13 != 0) {
                    tVar = b2.r.f17024a;
                }
                if (i14 != 0) {
                    f11 = u1.f74060a;
                }
                if ((i11 & 4) != 0) {
                    float f12 = u1.f74060a;
                    float f13 = o1.e.f79001a;
                    j11 = g1.e(tVar2, 25);
                }
            } else {
                tVar2.V();
            }
            tVar2.q();
            tVar2.b0(-433645095);
            float density = y3.f.a(f11, 0.0f) ? 1.0f / ((y3.c) tVar2.j(c3.z1.f19497h)).getDensity() : f11;
            tVar2.p(false);
            k0.p.a(androidx.compose.foundation.a.b(androidx.compose.foundation.layout.e.g(androidx.compose.foundation.layout.e.e(tVar, 1.0f), density), j11, i2.r0.f61135a), tVar2, 0);
        }
        b2.t tVar3 = tVar;
        float f14 = f11;
        long j12 = j11;
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new v1(tVar3, f14, j12, i5, i11);
        }
    }

    public static final void e(b2.t tVar, float f11, long j11, p1.o oVar, int i5, int i11) {
        b2.t tVar2;
        int i12;
        b2.t tVar3;
        float f12;
        b2.t tVar4;
        float f13;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(75144485);
        int i13 = i11 & 1;
        if (i13 != 0) {
            i12 = i5 | 6;
            tVar2 = tVar;
        } else {
            tVar2 = tVar;
            i12 = i5 | (tVar5.f(tVar2) ? 4 : 2);
        }
        long jE = j11;
        int i14 = i12 | 48 | (((i11 & 4) == 0 && tVar5.e(jE)) ? 256 : 128);
        if ((i14 & 147) == 146 && tVar5.E()) {
            tVar5.V();
            f13 = f11;
            tVar4 = tVar2;
        } else {
            tVar5.X();
            if ((i5 & 1) == 0 || tVar5.B()) {
                tVar3 = i13 != 0 ? b2.r.f17024a : tVar2;
                f12 = u1.f74060a;
                if ((i11 & 4) != 0) {
                    float f14 = o1.e.f79001a;
                    jE = g1.e(tVar5, 25);
                    i14 &= -897;
                }
            } else {
                tVar5.V();
                if ((i11 & 4) != 0) {
                    i14 &= -897;
                }
                tVar3 = tVar2;
                f12 = f11;
            }
            tVar5.q();
            b2.t tVarG = androidx.compose.foundation.layout.e.g(androidx.compose.foundation.layout.e.e(tVar3, 1.0f), f12);
            boolean z11 = (((i14 & 896) ^ 384) > 256 && tVar5.e(jE)) || (i14 & 384) == 256;
            Object objP = tVar5.P();
            if (z11 || objP == p1.n.f81514a) {
                objP = new w1(f12, jE);
                tVar5.m0(objP);
            }
            ic.b.g(0, tVarG, (Function1) objP, tVar5);
            tVar4 = tVar3;
            f13 = f12;
        }
        long j12 = jE;
        p1.t1 t1VarU = tVar5.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new x1(tVar4, f13, j12, i5, i11);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x014d  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0156  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0158  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0168  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void f(Function0 function0, i4 i4Var, c0.e eVar, x1.e eVar2, p1.o oVar, int i5) {
        int i11;
        i4 i4Var2;
        p1.g1 g1Var;
        y3.n nVar;
        p1.t tVar;
        Object obj;
        p1.g1 g1Var2;
        boolean zH;
        Object objP;
        p1.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(1254951810);
        if ((i5 & 6) == 0) {
            i11 = (tVar3.h(function0) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i4Var2 = i4Var;
            i11 |= tVar3.f(i4Var2) ? 32 : 16;
        } else {
            i4Var2 = i4Var;
        }
        if ((i5 & 384) == 0) {
            i11 |= (i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0 ? tVar3.f(eVar) : tVar3.h(eVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar3.h(eVar2) ? 2048 : 1024;
        }
        int i12 = i11;
        if ((i12 & 1171) == 1170 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar3;
        } else {
            View view = (View) tVar3.j(AndroidCompositionLocals_androidKt.f14170f);
            y3.c cVar = (y3.c) tVar3.j(c3.z1.f19497h);
            y3.n nVar2 = (y3.n) tVar3.j(c3.z1.n);
            androidx.compose.runtime.a aVarI = p1.a0.i(tVar3);
            p1.e1 e1VarM = androidx.compose.runtime.d.m(eVar2, tVar3);
            UUID uuid = (UUID) y1.j.e(new Object[0], null, f1.n, tVar3, 3072, 6);
            Object objP2 = tVar3.P();
            p1.g1 g1Var3 = p1.n.f81514a;
            if (objP2 == g1Var3) {
                p1.d0 d0Var = new p1.d0(p1.o0.i(EmptyCoroutineContext.f71803a, tVar3));
                tVar3.m0(d0Var);
                objP2 = d0Var;
            }
            t70.j0 j0Var = ((p1.d0) objP2).f81396a;
            boolean zM = io.sentry.config.a.M(tVar3);
            boolean zF = tVar3.f(view) | tVar3.f(cVar);
            Object objP3 = tVar3.P();
            if (zF || objP3 == g1Var3) {
                p1.t tVar4 = tVar3;
                g1Var = g1Var3;
                nVar = nVar2;
                v3 v3Var = new v3(function0, i4Var2, view, nVar, cVar, uuid, eVar, j0Var, zM);
                x1.e eVar3 = new x1.e(new c4.e(e1VarM, 3), true, -1560960657);
                t3 t3Var = v3Var.f74110g;
                t3Var.setParentCompositionContext(aVarI);
                ((p1.s2) t3Var.f74003f).setValue(eVar3);
                t3Var.f74005h = true;
                t3Var.createComposition();
                tVar4.m0(v3Var);
                obj = v3Var;
                tVar = tVar4;
            } else {
                tVar = tVar3;
                g1Var = g1Var3;
                nVar = nVar2;
                obj = objP3;
            }
            v3 v3Var2 = (v3) obj;
            boolean zH2 = tVar.h(v3Var2);
            Object objP4 = tVar.P();
            if (zH2) {
                g1Var2 = g1Var;
            } else {
                g1Var2 = g1Var;
                if (objP4 == g1Var2) {
                }
                p1.o0.b(v3Var2, (Function1) objP4, tVar);
                zH = tVar.h(v3Var2) | ((i12 & 14) != 4) | ((i12 & 112) != 32) | tVar.f(nVar);
                objP = tVar.P();
                if (!zH || objP == g1Var2) {
                    c4.b bVar = new c4.b(v3Var2, function0, i4Var, nVar, 3);
                    tVar.m0(bVar);
                    objP = bVar;
                }
                p1.o0.h((Function0) objP, tVar);
                tVar2 = tVar;
            }
            objP4 = new u3(v3Var2, 1);
            tVar.m0(objP4);
            p1.o0.b(v3Var2, (Function1) objP4, tVar);
            zH = tVar.h(v3Var2) | ((i12 & 14) != 4) | ((i12 & 112) != 32) | tVar.f(nVar);
            objP = tVar.P();
            if (!zH) {
                c4.b bVar2 = new c4.b(v3Var2, function0, i4Var, nVar, 3);
                tVar.m0(bVar2);
                objP = bVar2;
                p1.o0.h((Function0) objP, tVar);
                tVar2 = tVar;
            }
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new k(function0, i4Var, eVar, eVar2, i5, 1);
        }
    }

    public static s0 g(long j11, p1.o oVar) {
        long jB = g1.b(j11, oVar);
        long j12 = i2.s.f61147m;
        long jB2 = i2.s.b(0.38f, jB);
        s0 s0VarI = i((d1) ((p1.t) oVar).j(g1.f73330a));
        long j13 = j11 != 16 ? j11 : s0VarI.f73928a;
        if (jB == 16) {
            jB = s0VarI.f73929b;
        }
        long j14 = jB;
        if (j12 == 16) {
            j12 = s0VarI.f73930c;
        }
        long j15 = j12;
        if (jB2 == 16) {
            jB2 = s0VarI.f73931d;
        }
        return new s0(j13, j14, j15, jB2);
    }

    public static t0 h() {
        return new t0(o1.m.f79123a, o1.m.f79131i, o1.m.f79129g, o1.m.f79130h, o1.m.f79128f, o1.m.f79126d);
    }

    public static s0 i(d1 d1Var) {
        s0 s0Var = d1Var.O;
        if (s0Var != null) {
            return s0Var;
        }
        float f11 = o1.m.f79123a;
        s0 s0Var2 = new s0(g1.d(d1Var, 39), g1.a(d1Var, g1.d(d1Var, 39)), i2.r0.h(i2.s.b(o1.m.f79127e, g1.d(d1Var, o1.m.f79125c)), g1.d(d1Var, 39)), i2.s.b(0.38f, g1.a(d1Var, g1.d(d1Var, 39))));
        d1Var.O = s0Var2;
        return s0Var2;
    }
}
