package l1;

import androidx.compose.ui.node.LayoutNode;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class a9 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f73034a = 0;

    /* JADX WARN: Removed duplicated region for block: B:101:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0179  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x017c  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x017f  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0186  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0199  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x01af  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x01e8  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x0258  */
    /* JADX WARN: Removed duplicated region for block: B:129:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x016a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(String str, Function1 function1, b2.t tVar, boolean z11, boolean z12, m3.p0 p0Var, Function2 function2, Function2 function22, r3.i0 i0Var, t0.w0 w0Var, t0.v0 v0Var, int i5, int i11, i2.v0 v0Var2, q8 q8Var, p1.o oVar, int i12, int i13, int i14) {
        b2.t tVar2;
        int i15;
        boolean z13;
        int i16;
        Function2 function23;
        int i17;
        int i18;
        Function2 function24;
        int i19;
        t0.w0 w0Var2;
        int i21;
        int i22;
        m3.p0 p0Var2;
        int i23;
        int i24;
        i2.v0 v0Var3;
        boolean z14;
        int i25;
        Function2 function25;
        r3.i0 i0Var2;
        Function2 function26;
        q8 q8VarC;
        boolean z15;
        t0.w0 w0Var3;
        t0.v0 v0Var4;
        b2.t tVar3;
        Object objP;
        long jB;
        boolean z16;
        boolean z17;
        t0.w0 w0Var4;
        t0.v0 v0Var5;
        int i26;
        int i27;
        r3.i0 i0Var3;
        Function2 function27;
        i2.v0 v0Var6;
        q8 q8Var2;
        Function2 function28;
        p1.t1 t1VarU;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(-676242365);
        int i28 = (tVar4.f(str) ? 4 : 2) | i12;
        if ((i12 & 48) == 0) {
            i28 |= tVar4.h(function1) ? 32 : 16;
        }
        int i29 = i14 & 4;
        if (i29 != 0) {
            i28 |= 384;
        } else {
            if ((i12 & 384) == 0) {
                tVar2 = tVar;
                i28 |= tVar4.f(tVar2) ? 256 : 128;
            }
            int i31 = i28 | 3072;
            i15 = i14 & 16;
            if (i15 == 0) {
                i31 = i28 | 27648;
            } else {
                if ((i12 & 24576) == 0) {
                    z13 = z12;
                    i31 |= tVar4.g(z13) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
                }
                int i32 = 1638400 | i31;
                i16 = i14 & 128;
                if (i16 != 0) {
                    i32 = 14221312 | i31;
                } else {
                    if ((12582912 & i12) == 0) {
                        function23 = function2;
                        i32 |= tVar4.h(function23) ? 8388608 : 4194304;
                    }
                    i17 = i32 | 100663296;
                    i18 = i14 & EventBridgeChannel.QUEUE_CAPACITY;
                    if (i18 != 0) {
                        if ((805306368 & i12) == 0) {
                            function24 = function22;
                            i17 |= tVar4.h(function24) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
                        }
                        int i33 = i13 | 28086;
                        i19 = i14 & SQLiteDatabase.OPEN_NOMUTEX;
                        if (i19 != 0) {
                            i33 = 224694;
                            w0Var2 = w0Var;
                        } else {
                            w0Var2 = w0Var;
                            if ((i13 & 196608) == 0) {
                                i33 |= tVar4.f(w0Var2) ? SQLiteDatabase.OPEN_SHAREDCACHE : 65536;
                            }
                        }
                        i21 = i14 & SQLiteDatabase.OPEN_FULLMUTEX;
                        if (i21 != 0) {
                            i22 = i33 | 1572864;
                        } else {
                            i22 = i33 | (tVar4.f(v0Var) ? 1048576 : 524288);
                        }
                        int i34 = i22 | 851443712;
                        int i35 = 22 | (((i14 & 4194304) == 0 && tVar4.f(q8Var)) ? (char) 256 : (char) 128);
                        if ((i17 & 306783379) == 306783378 && (i34 & 306783379) == 306783378 && (i35 & 147) == 146 && tVar4.E()) {
                            tVar4.V();
                            p0Var2 = p0Var;
                            i0Var3 = i0Var;
                            i27 = i11;
                            q8Var2 = q8Var;
                            w0Var4 = w0Var2;
                            tVar3 = tVar2;
                            function28 = function23;
                            function27 = function24;
                            v0Var5 = v0Var;
                            i26 = i5;
                            v0Var6 = v0Var2;
                            z17 = z13;
                            z16 = z11;
                        } else {
                            tVar4.X();
                            if ((i12 & 1) != 0 || tVar4.B()) {
                                b2.t tVar5 = i29 == 0 ? b2.r.f17024a : tVar2;
                                if (i15 != 0) {
                                    z13 = false;
                                }
                                p0Var2 = (m3.p0) tVar4.j(g9.f73360a);
                                if (i16 != 0) {
                                    function23 = null;
                                }
                                if (i18 != 0) {
                                    function24 = null;
                                }
                                if (i19 != 0) {
                                    w0Var2 = t0.w0.f88258d;
                                }
                                t0.v0 v0Var7 = i21 == 0 ? t0.v0.f88238g : v0Var;
                                v8 v8Var = v8.f74139a;
                                i2.v0 v0VarA = a6.a(tVar4, 4);
                                i23 = i14 & 4194304;
                                r3.g0 g0Var = r3.h0.f85443a;
                                i24 = LayoutNode.NotPlacedPlaceOrder;
                                if (i23 == 0) {
                                    v0Var3 = v0VarA;
                                    q8VarC = v8.c(tVar4, 6);
                                    z14 = true;
                                    i25 = 1;
                                    function25 = function23;
                                    i0Var2 = g0Var;
                                    function26 = function24;
                                } else {
                                    v0Var3 = v0VarA;
                                    z14 = true;
                                    i25 = 1;
                                    function25 = function23;
                                    i0Var2 = g0Var;
                                    function26 = function24;
                                    q8VarC = q8Var;
                                }
                                z15 = z13;
                                w0Var3 = w0Var2;
                                v0Var4 = v0Var7;
                                tVar3 = tVar5;
                            } else {
                                tVar4.V();
                                z14 = z11;
                                p0Var2 = p0Var;
                                i0Var2 = i0Var;
                                i24 = i5;
                                i25 = i11;
                                v0Var3 = v0Var2;
                                q8VarC = q8Var;
                                w0Var3 = w0Var2;
                                tVar3 = tVar2;
                                function25 = function23;
                                function26 = function24;
                                v0Var4 = v0Var;
                                z15 = z13;
                            }
                            tVar4.q();
                            tVar4.b0(-508515290);
                            objP = tVar4.P();
                            if (objP == p1.n.f81514a) {
                                objP = a2.c.d(tVar4);
                            }
                            i0.i iVar = (i0.i) objP;
                            tVar4.p(false);
                            tVar4.b0(-508509180);
                            jB = p0Var2.b();
                            if (jB == 16) {
                                jB = q8VarC.a(z14, false, ((Boolean) cw.l2.o(iVar, tVar4, 0).getValue()).booleanValue());
                            }
                            tVar4.p(false);
                            p1.a0.a(e1.h1.f51306a.a(q8VarC.f73861k), x1.f.d(1859145987, new x8(tVar3, q8VarC, str, function1, z14, z15, p0Var2.d(new m3.p0(jB, 0L, null, null, 0L, 0, 0L, 16777214)), w0Var3, v0Var4, i24, i25, i0Var2, iVar, function25, function26, v0Var3), tVar4), tVar4, 56);
                            z16 = z14;
                            z17 = z15;
                            w0Var4 = w0Var3;
                            v0Var5 = v0Var4;
                            i26 = i24;
                            i27 = i25;
                            i0Var3 = i0Var2;
                            function27 = function26;
                            v0Var6 = v0Var3;
                            q8Var2 = q8VarC;
                            function28 = function25;
                        }
                        t1VarU = tVar4.u();
                        if (t1VarU != null) {
                            t1VarU.f81583d = new y8(str, function1, tVar3, z16, z17, p0Var2, function28, function27, i0Var3, w0Var4, v0Var5, i26, i27, v0Var6, q8Var2, i12, i13, i14);
                            return;
                        }
                        return;
                    }
                    i17 = i32 | 905969664;
                    function24 = function22;
                    int i332 = i13 | 28086;
                    i19 = i14 & SQLiteDatabase.OPEN_NOMUTEX;
                    if (i19 != 0) {
                    }
                    i21 = i14 & SQLiteDatabase.OPEN_FULLMUTEX;
                    if (i21 != 0) {
                    }
                    int i342 = i22 | 851443712;
                    int i352 = 22 | (((i14 & 4194304) == 0 && tVar4.f(q8Var)) ? (char) 256 : (char) 128);
                    if ((i17 & 306783379) == 306783378) {
                        tVar4.X();
                        if ((i12 & 1) != 0) {
                            if (i29 == 0) {
                            }
                            if (i15 != 0) {
                            }
                            p0Var2 = (m3.p0) tVar4.j(g9.f73360a);
                            if (i16 != 0) {
                            }
                            if (i18 != 0) {
                            }
                            if (i19 != 0) {
                            }
                            if (i21 == 0) {
                            }
                            v8 v8Var2 = v8.f74139a;
                            i2.v0 v0VarA2 = a6.a(tVar4, 4);
                            i23 = i14 & 4194304;
                            r3.g0 g0Var2 = r3.h0.f85443a;
                            i24 = LayoutNode.NotPlacedPlaceOrder;
                            if (i23 == 0) {
                            }
                            z15 = z13;
                            w0Var3 = w0Var2;
                            v0Var4 = v0Var7;
                            tVar3 = tVar5;
                            tVar4.q();
                            tVar4.b0(-508515290);
                            objP = tVar4.P();
                            if (objP == p1.n.f81514a) {
                            }
                            i0.i iVar2 = (i0.i) objP;
                            tVar4.p(false);
                            tVar4.b0(-508509180);
                            jB = p0Var2.b();
                            if (jB == 16) {
                            }
                            tVar4.p(false);
                            p1.a0.a(e1.h1.f51306a.a(q8VarC.f73861k), x1.f.d(1859145987, new x8(tVar3, q8VarC, str, function1, z14, z15, p0Var2.d(new m3.p0(jB, 0L, null, null, 0L, 0, 0L, 16777214)), w0Var3, v0Var4, i24, i25, i0Var2, iVar2, function25, function26, v0Var3), tVar4), tVar4, 56);
                            z16 = z14;
                            z17 = z15;
                            w0Var4 = w0Var3;
                            v0Var5 = v0Var4;
                            i26 = i24;
                            i27 = i25;
                            i0Var3 = i0Var2;
                            function27 = function26;
                            v0Var6 = v0Var3;
                            q8Var2 = q8VarC;
                            function28 = function25;
                        }
                    }
                    t1VarU = tVar4.u();
                    if (t1VarU != null) {
                    }
                }
                function23 = function2;
                i17 = i32 | 100663296;
                i18 = i14 & EventBridgeChannel.QUEUE_CAPACITY;
                if (i18 != 0) {
                }
                function24 = function22;
                int i3322 = i13 | 28086;
                i19 = i14 & SQLiteDatabase.OPEN_NOMUTEX;
                if (i19 != 0) {
                }
                i21 = i14 & SQLiteDatabase.OPEN_FULLMUTEX;
                if (i21 != 0) {
                }
                int i3422 = i22 | 851443712;
                int i3522 = 22 | (((i14 & 4194304) == 0 && tVar4.f(q8Var)) ? (char) 256 : (char) 128);
                if ((i17 & 306783379) == 306783378) {
                }
                t1VarU = tVar4.u();
                if (t1VarU != null) {
                }
            }
            z13 = z12;
            int i322 = 1638400 | i31;
            i16 = i14 & 128;
            if (i16 != 0) {
            }
            function23 = function2;
            i17 = i322 | 100663296;
            i18 = i14 & EventBridgeChannel.QUEUE_CAPACITY;
            if (i18 != 0) {
            }
            function24 = function22;
            int i33222 = i13 | 28086;
            i19 = i14 & SQLiteDatabase.OPEN_NOMUTEX;
            if (i19 != 0) {
            }
            i21 = i14 & SQLiteDatabase.OPEN_FULLMUTEX;
            if (i21 != 0) {
            }
            int i34222 = i22 | 851443712;
            int i35222 = 22 | (((i14 & 4194304) == 0 && tVar4.f(q8Var)) ? (char) 256 : (char) 128);
            if ((i17 & 306783379) == 306783378) {
            }
            t1VarU = tVar4.u();
            if (t1VarU != null) {
            }
        }
        tVar2 = tVar;
        int i312 = i28 | 3072;
        i15 = i14 & 16;
        if (i15 == 0) {
        }
        z13 = z12;
        int i3222 = 1638400 | i312;
        i16 = i14 & 128;
        if (i16 != 0) {
        }
        function23 = function2;
        i17 = i3222 | 100663296;
        i18 = i14 & EventBridgeChannel.QUEUE_CAPACITY;
        if (i18 != 0) {
        }
        function24 = function22;
        int i332222 = i13 | 28086;
        i19 = i14 & SQLiteDatabase.OPEN_NOMUTEX;
        if (i19 != 0) {
        }
        i21 = i14 & SQLiteDatabase.OPEN_FULLMUTEX;
        if (i21 != 0) {
        }
        int i342222 = i22 | 851443712;
        int i352222 = 22 | (((i14 & 4194304) == 0 && tVar4.f(q8Var)) ? (char) 256 : (char) 128);
        if ((i17 & 306783379) == 306783378) {
        }
        t1VarU = tVar4.u();
        if (t1VarU != null) {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r9v2 */
    /* JADX WARN: Type inference failed for: r9v28 */
    /* JADX WARN: Type inference failed for: r9v3, types: [boolean, int] */
    public static final void b(Function2 function2, Function2 function22, Function3 function3, Function2 function23, Function2 function24, Function2 function25, Function2 function26, boolean z11, float f11, x1.e eVar, Function2 function27, k0.o1 o1Var, p1.o oVar, int i5, int i11) {
        int i12;
        int i13;
        k0.o1 o1Var2;
        y3.n nVar;
        float f12;
        float f13;
        Function3 function32;
        Function2 function28;
        boolean z12;
        Function3 function33;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-1830307184);
        int i14 = i5 & 6;
        b2.r rVar = b2.r.f17024a;
        if (i14 == 0) {
            i12 = i5 | (tVar.f(rVar) ? 4 : 2);
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar.h(function2) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i12 |= tVar.h(function22) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i12 |= tVar.h(function3) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i12 |= tVar.h(function23) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i12 |= tVar.h(function24) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i12 |= tVar.h(function25) ? 1048576 : 524288;
        }
        if ((12582912 & i5) == 0) {
            i12 |= tVar.h(function26) ? 8388608 : 4194304;
        }
        if ((100663296 & i5) == 0) {
            i12 |= tVar.g(z11) ? 67108864 : 33554432;
        }
        if ((i5 & 805306368) == 0) {
            i12 |= tVar.c(f11) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
        }
        if ((i11 & 6) == 0) {
            i13 = i11 | (tVar.h(eVar) ? 4 : 2);
        } else {
            i13 = i11;
        }
        if ((i11 & 48) == 0) {
            i13 |= tVar.h(function27) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            o1Var2 = o1Var;
            i13 |= tVar.f(o1Var2) ? 256 : 128;
        } else {
            o1Var2 = o1Var;
        }
        int i15 = i13;
        if ((i12 & 306783379) == 306783378 && (i15 & 147) == 146 && tVar.E()) {
            tVar.V();
            function28 = function27;
            f13 = f11;
            function33 = function3;
        } else {
            boolean z13 = ((i12 & 234881024) == 67108864) | ((i12 & 1879048192) == 536870912) | ((i15 & 896) == 256);
            Object objP = tVar.P();
            if (z13 || objP == p1.n.f81514a) {
                objP = new c9(z11, f11, o1Var2);
                tVar.m0(objP);
            }
            c9 c9Var = (c9) objP;
            y3.n nVar2 = (y3.n) tVar.j(c3.z1.n);
            int iHashCode = Long.hashCode(tVar.T);
            p1.n1 n1VarL = tVar.l();
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
            p1.a0.j(c9Var, iVar, tVar);
            b3.i iVar2 = b3.k.f17274f;
            p1.a0.j(n1VarL, iVar2, tVar);
            b3.i iVar3 = b3.k.f17278j;
            if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar, iHashCode, iVar3);
            }
            b3.i iVar4 = b3.k.f17272d;
            p1.a0.j(tVarI, iVar4, tVar);
            eVar.invoke(tVar, Integer.valueOf(i15 & 14));
            tVar.b0(1341517187);
            b2.k kVar = b2.d.f17001e;
            if (function23 != null) {
                b2.t tVarThen = androidx.compose.ui.layout.a.b(rVar, "Leading").then(m1.r0.f75754i);
                z2.r0 r0VarD = k0.p.d(kVar, false);
                int iHashCode2 = Long.hashCode(tVar.T);
                p1.n1 n1VarL2 = tVar.l();
                b2.t tVarI2 = fg.a.I(tVarThen, tVar);
                tVar.f0();
                nVar = nVar2;
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
                com.google.android.gms.internal.measurement.k2.u((i12 >> 12) & 14, function23, tVar, true);
            } else {
                nVar = nVar2;
            }
            ?? r92 = 0;
            tVar.p(false);
            tVar.b0(1341526310);
            if (function24 != null) {
                b2.t tVarThen2 = androidx.compose.ui.layout.a.b(rVar, "Trailing").then(m1.r0.f75754i);
                z2.r0 r0VarD2 = k0.p.d(kVar, false);
                int iHashCode3 = Long.hashCode(tVar.T);
                p1.n1 n1VarL3 = tVar.l();
                b2.t tVarI3 = fg.a.I(tVarThen2, tVar);
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
                com.google.android.gms.internal.measurement.k2.u((i12 >> 15) & 14, function24, tVar, true);
                r92 = 0;
            }
            tVar.p(r92);
            o1Var2 = o1Var;
            y3.n nVar3 = nVar;
            float fE = androidx.compose.foundation.layout.d.e(o1Var2, nVar3);
            float fD = androidx.compose.foundation.layout.d.d(o1Var2, nVar3);
            if (function23 != null) {
                fE -= m1.r0.f75748c;
                float f14 = (float) r92;
                if (fE < f14) {
                    fE = f14;
                }
            }
            float f15 = fE;
            if (function24 != null) {
                fD -= m1.r0.f75748c;
                float f16 = (float) r92;
                if (fD < f16) {
                    fD = f16;
                }
            }
            tVar.b0(1341556924);
            b2.k kVar2 = b2.d.f16997a;
            if (function25 != null) {
                b2.t tVarN = androidx.compose.foundation.layout.d.n(androidx.compose.foundation.layout.e.w(androidx.compose.foundation.layout.e.i(androidx.compose.ui.layout.a.b(rVar, "Prefix"), m1.r0.f75751f, 0.0f, 2)), f15, 0.0f, m1.r0.f75750e, 0.0f, 10);
                z2.r0 r0VarD3 = k0.p.d(kVar2, false);
                int iHashCode4 = Long.hashCode(tVar.T);
                p1.n1 n1VarL4 = tVar.l();
                b2.t tVarI4 = fg.a.I(tVarN, tVar);
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
                com.google.android.gms.internal.measurement.k2.u((i12 >> 18) & 14, function25, tVar, true);
            }
            tVar.p(false);
            tVar.b0(1341568890);
            if (function26 != null) {
                float f17 = fD;
                b2.t tVarN2 = androidx.compose.foundation.layout.d.n(androidx.compose.foundation.layout.e.w(androidx.compose.foundation.layout.e.i(androidx.compose.ui.layout.a.b(rVar, "Suffix"), m1.r0.f75751f, 0.0f, 2)), m1.r0.f75750e, 0.0f, f17, 0.0f, 10);
                f12 = f17;
                z2.r0 r0VarD4 = k0.p.d(kVar2, false);
                int iHashCode5 = Long.hashCode(tVar.T);
                p1.n1 n1VarL5 = tVar.l();
                b2.t tVarI5 = fg.a.I(tVarN2, tVar);
                tVar.f0();
                if (tVar.S) {
                    tVar.k(function0);
                } else {
                    tVar.p0();
                }
                p1.a0.j(r0VarD4, iVar, tVar);
                p1.a0.j(n1VarL5, iVar2, tVar);
                if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode5))) {
                    a2.c.u(iHashCode5, tVar, iHashCode5, iVar3);
                }
                p1.a0.j(tVarI5, iVar4, tVar);
                com.google.android.gms.internal.measurement.k2.u((i12 >> 21) & 14, function26, tVar, true);
            } else {
                f12 = fD;
            }
            tVar.p(false);
            tVar.b0(1341581092);
            if (function22 != null) {
                f13 = f11;
                b2.t tVarN3 = androidx.compose.foundation.layout.d.n(androidx.compose.foundation.layout.e.w(androidx.compose.foundation.layout.e.i(androidx.compose.ui.layout.a.b(rVar, "Label"), bh.g.d0(m1.r0.f75751f, m1.r0.f75752g, f13), 0.0f, 2)), f15, 0.0f, f12, 0.0f, 10);
                z2.r0 r0VarD5 = k0.p.d(kVar2, false);
                int iHashCode6 = Long.hashCode(tVar.T);
                p1.n1 n1VarL6 = tVar.l();
                b2.t tVarI6 = fg.a.I(tVarN3, tVar);
                tVar.f0();
                if (tVar.S) {
                    tVar.k(function0);
                } else {
                    tVar.p0();
                }
                p1.a0.j(r0VarD5, iVar, tVar);
                p1.a0.j(n1VarL6, iVar2, tVar);
                if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode6))) {
                    a2.c.u(iHashCode6, tVar, iHashCode6, iVar3);
                }
                p1.a0.j(tVarI6, iVar4, tVar);
                com.google.android.gms.internal.measurement.k2.u((i12 >> 6) & 14, function22, tVar, true);
            } else {
                f13 = f11;
            }
            tVar.p(false);
            b2.t tVarN4 = androidx.compose.foundation.layout.d.n(androidx.compose.foundation.layout.e.w(androidx.compose.foundation.layout.e.i(rVar, m1.r0.f75751f, 0.0f, 2)), function25 == null ? f15 : 0, 0.0f, function26 == null ? f12 : 0, 0.0f, 10);
            tVar.b0(1341611627);
            if (function3 != null) {
                Function3 function34 = function3;
                function34.invoke(androidx.compose.ui.layout.a.b(rVar, "Hint").then(tVarN4), tVar, Integer.valueOf((i12 >> 6) & 112));
                function32 = function34;
            } else {
                function32 = function3;
            }
            tVar.p(false);
            b2.t tVarThen3 = androidx.compose.ui.layout.a.b(rVar, "TextField").then(tVarN4);
            z2.r0 r0VarD6 = k0.p.d(kVar2, true);
            int iHashCode7 = Long.hashCode(tVar.T);
            p1.n1 n1VarL7 = tVar.l();
            b2.t tVarI7 = fg.a.I(tVarThen3, tVar);
            tVar.f0();
            if (tVar.S) {
                tVar.k(function0);
            } else {
                tVar.p0();
            }
            p1.a0.j(r0VarD6, iVar, tVar);
            p1.a0.j(n1VarL7, iVar2, tVar);
            if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode7))) {
                a2.c.u(iHashCode7, tVar, iHashCode7, iVar3);
            }
            p1.a0.j(tVarI7, iVar4, tVar);
            function2.invoke(tVar, Integer.valueOf((i12 >> 3) & 14));
            tVar.p(true);
            tVar.b0(1341622624);
            if (function27 != null) {
                b2.t tVarI8 = androidx.compose.foundation.layout.d.i(androidx.compose.foundation.layout.e.w(androidx.compose.foundation.layout.e.i(androidx.compose.ui.layout.a.b(rVar, "Supporting"), m1.r0.f75753h, 0.0f, 2)), v8.f());
                z2.r0 r0VarD7 = k0.p.d(kVar2, false);
                int iHashCode8 = Long.hashCode(tVar.T);
                p1.n1 n1VarL8 = tVar.l();
                b2.t tVarI9 = fg.a.I(tVarI8, tVar);
                tVar.f0();
                if (tVar.S) {
                    tVar.k(function0);
                } else {
                    tVar.p0();
                }
                p1.a0.j(r0VarD7, iVar, tVar);
                p1.a0.j(n1VarL8, iVar2, tVar);
                if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode8))) {
                    a2.c.u(iHashCode8, tVar, iHashCode8, iVar3);
                }
                p1.a0.j(tVarI9, iVar4, tVar);
                function28 = function27;
                z12 = true;
                com.google.android.gms.internal.measurement.k2.u((i15 >> 3) & 14, function28, tVar, true);
            } else {
                function28 = function27;
                z12 = true;
            }
            tVar.p(false);
            tVar.p(z12);
            function33 = function32;
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new z8(function2, function22, function33, function23, function24, function25, function26, z11, f13, eVar, function28, o1Var2, i5, i11);
        }
    }

    public static final int c(int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17, float f11, long j11, float f12, k0.o1 o1Var) {
        boolean z11 = i11 > 0;
        float fA = (o1Var.a() + o1Var.d()) * f12;
        if (z11) {
            fA = bh.g.d0(m1.r0.f75747b * 2 * f12, fA, f11);
        }
        int[] iArr = {i16, i14, i15, bh.g.e0(f11, i11, 0)};
        for (int i18 = 0; i18 < 4; i18++) {
            i5 = Math.max(i5, iArr[i18]);
        }
        return Math.max(y3.a.i(j11), Math.max(i12, Math.max(i13, MathKt.b(fA + bh.g.e0(f11, 0, i11) + i5))) + i17);
    }

    public static final int d(boolean z11, int i5, int i11, z2.i1 i1Var) {
        if (!z11) {
            return i11;
        }
        return h6.c1.g(1, 0.0f, (i5 - i1Var.f98082b) / 2.0f);
    }
}
