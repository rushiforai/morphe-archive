package l1;

import androidx.compose.ui.semantics.ClearAndSetSemanticsElement;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class i0 {

    /* renamed from: a, reason: collision with root package name */
    public static final c0.w f73415a = new c0.w(0.8f, 0.0f, 0.8f, 0.15f);

    /* renamed from: b, reason: collision with root package name */
    public static final float f73416b = 28;

    /* renamed from: c, reason: collision with root package name */
    public static final float f73417c;

    /* renamed from: d, reason: collision with root package name */
    public static final float f73418d;

    static {
        float f11 = 4;
        f73417c = f11;
        f73418d = 16 - f11;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00ec  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x015e  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0197  */
    /* JADX WARN: Removed duplicated region for block: B:95:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(x1.e eVar, b2.t tVar, Function2 function2, Function3 function3, float f11, float f12, k0.g2 g2Var, m9 m9Var, a2 a2Var, p1.o oVar, int i5, int i11) {
        b2.t tVar2;
        int i12;
        Function2 function22;
        int i13;
        Function3 function32;
        int i14;
        m9 m9VarB;
        int i15;
        a2 a2Var2;
        int i16;
        float f13;
        float f14;
        Function2 function23;
        k0.g2 g2Var2;
        Function3 function33;
        m9 m9Var2;
        a2 a2Var3;
        b2.t tVar3;
        int i17;
        p1.t tVar4;
        float f15;
        float f16;
        Function2 function24;
        Function3 function34;
        k0.g2 g2Var3;
        a2 a2Var4;
        p1.t1 t1VarU;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(-630005584);
        int i18 = i11 & 2;
        if (i18 != 0) {
            i12 = i5 | 48;
            tVar2 = tVar;
        } else if ((i5 & 48) == 0) {
            tVar2 = tVar;
            i12 = (tVar5.f(tVar2) ? 32 : 16) | i5;
        } else {
            tVar2 = tVar;
            i12 = i5;
        }
        int i19 = i11 & 4;
        if (i19 != 0) {
            i12 |= 384;
        } else {
            if ((i5 & 384) == 0) {
                function22 = function2;
                i12 |= tVar5.h(function22) ? 256 : 128;
            }
            i13 = i11 & 8;
            if (i13 == 0) {
                i14 = i12 | 3072;
                function32 = function3;
            } else {
                function32 = function3;
                i14 = i12 | (tVar5.h(function32) ? 2048 : 1024);
            }
            int i21 = i14 | 745472;
            if ((i11 & 128) != 0) {
                m9VarB = m9Var;
                int i22 = tVar5.f(m9VarB) ? 8388608 : 4194304;
                int i23 = i21 | i22;
                i15 = i11 & 256;
                if (i15 != 0) {
                    i16 = i23 | 100663296;
                    a2Var2 = a2Var;
                } else {
                    a2Var2 = a2Var;
                    i16 = i23 | (tVar5.f(a2Var2) ? 67108864 : 33554432);
                }
                if ((38347923 & i16) == 38347922 && tVar5.E()) {
                    tVar5.V();
                    f16 = f12;
                    tVar4 = tVar5;
                    function24 = function22;
                    function34 = function32;
                    a2Var4 = a2Var2;
                    f15 = f11;
                    g2Var3 = g2Var;
                } else {
                    tVar5.X();
                    if ((i5 & 1) != 0 || tVar5.B()) {
                        b2.t tVar6 = i18 == 0 ? b2.r.f17024a : tVar2;
                        if (i19 != 0) {
                            function22 = k1.f73523b;
                        }
                        if (i13 != 0) {
                            function32 = k1.f73524c;
                        }
                        f13 = n9.f73713b;
                        f14 = n9.f73714c;
                        k0.h1 h1VarC = n9.c(tVar5);
                        int i24 = i16 & (-3670017);
                        if ((i11 & 128) != 0) {
                            m9VarB = n9.b((d1) tVar5.j(g1.f73330a));
                            i24 = i16 & (-33030145);
                        }
                        if (i15 == 0) {
                            tVar3 = tVar6;
                            a2Var3 = null;
                            function23 = function22;
                            g2Var2 = h1VarC;
                            function33 = function32;
                            m9Var2 = m9VarB;
                        } else {
                            function23 = function22;
                            g2Var2 = h1VarC;
                            function33 = function32;
                            m9Var2 = m9VarB;
                            a2Var3 = a2Var2;
                            tVar3 = tVar6;
                        }
                        i17 = i24;
                    } else {
                        tVar5.V();
                        i17 = i16 & (-3670017);
                        if ((i11 & 128) != 0) {
                            i17 = i16 & (-33030145);
                        }
                        f14 = f12;
                        g2Var2 = g2Var;
                        function23 = function22;
                        function33 = function32;
                        m9Var2 = m9VarB;
                        a2Var3 = a2Var2;
                        tVar3 = tVar2;
                        f13 = f11;
                    }
                    tVar5.q();
                    int i25 = i17 << 12;
                    tVar4 = tVar5;
                    d(tVar3, eVar, q9.a(tVar5, o1.c0.f78991c), f73416b, eVar, q9.a(tVar5, o1.e0.f79004c), function23, function33, (!y3.f.a(f13, Float.NaN) || y3.f.a(f13, Float.POSITIVE_INFINITY)) ? n9.f73713b : f13, (!y3.f.a(f14, Float.NaN) || y3.f.a(f14, Float.POSITIVE_INFINITY)) ? n9.f73714c : f14, g2Var2, m9Var2, a2Var3, tVar4, ((i17 >> 3) & 14) | 27696 | (3670016 & i25) | (i25 & 29360128), (i17 >> 18) & 1022);
                    f15 = f13;
                    f16 = f14;
                    tVar2 = tVar3;
                    function24 = function23;
                    function34 = function33;
                    g2Var3 = g2Var2;
                    m9VarB = m9Var2;
                    a2Var4 = a2Var3;
                }
                t1VarU = tVar4.u();
                if (t1VarU != null) {
                    t1VarU.f81583d = new r(eVar, tVar2, function24, function34, f15, f16, g2Var3, m9VarB, a2Var4, i5, i11);
                    return;
                }
                return;
            }
            m9VarB = m9Var;
            int i232 = i21 | i22;
            i15 = i11 & 256;
            if (i15 != 0) {
            }
            if ((38347923 & i16) == 38347922) {
                tVar5.X();
                if ((i5 & 1) != 0) {
                    if (i18 == 0) {
                    }
                    if (i19 != 0) {
                    }
                    if (i13 != 0) {
                    }
                    f13 = n9.f73713b;
                    f14 = n9.f73714c;
                    k0.h1 h1VarC2 = n9.c(tVar5);
                    int i242 = i16 & (-3670017);
                    if ((i11 & 128) != 0) {
                    }
                    if (i15 == 0) {
                    }
                    i17 = i242;
                    tVar5.q();
                    if (y3.f.a(f13, Float.NaN)) {
                        if (y3.f.a(f14, Float.NaN)) {
                            int i252 = i17 << 12;
                            tVar4 = tVar5;
                            d(tVar3, eVar, q9.a(tVar5, o1.c0.f78991c), f73416b, eVar, q9.a(tVar5, o1.e0.f79004c), function23, function33, (!y3.f.a(f13, Float.NaN) || y3.f.a(f13, Float.POSITIVE_INFINITY)) ? n9.f73713b : f13, (!y3.f.a(f14, Float.NaN) || y3.f.a(f14, Float.POSITIVE_INFINITY)) ? n9.f73714c : f14, g2Var2, m9Var2, a2Var3, tVar4, ((i17 >> 3) & 14) | 27696 | (3670016 & i252) | (i252 & 29360128), (i17 >> 18) & 1022);
                            f15 = f13;
                            f16 = f14;
                            tVar2 = tVar3;
                            function24 = function23;
                            function34 = function33;
                            g2Var3 = g2Var2;
                            m9VarB = m9Var2;
                            a2Var4 = a2Var3;
                        }
                    }
                }
            }
            t1VarU = tVar4.u();
            if (t1VarU != null) {
            }
        }
        function22 = function2;
        i13 = i11 & 8;
        if (i13 == 0) {
        }
        int i212 = i14 | 745472;
        if ((i11 & 128) != 0) {
        }
        int i2322 = i212 | i22;
        i15 = i11 & 256;
        if (i15 != 0) {
        }
        if ((38347923 & i16) == 38347922) {
        }
        t1VarU = tVar4.u();
        if (t1VarU != null) {
        }
    }

    public static final void b(b2.t tVar, x1.e eVar, m3.p0 p0Var, x1.e eVar2, Function3 function3, float f11, k0.g2 g2Var, m9 m9Var, p1.o oVar, int i5) {
        int i11;
        x1.e eVar3;
        m3.p0 p0Var2;
        x1.e eVar4;
        p1.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-342194911);
        if ((i5 & 6) == 0) {
            i11 = (tVar3.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            eVar3 = eVar;
            i11 |= tVar3.h(eVar3) ? 32 : 16;
        } else {
            eVar3 = eVar;
        }
        if ((i5 & 384) == 0) {
            p0Var2 = p0Var;
            i11 |= tVar3.f(p0Var2) ? 256 : 128;
        } else {
            p0Var2 = p0Var;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar3.g(false) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            eVar4 = eVar2;
            i11 |= tVar3.h(eVar4) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        } else {
            eVar4 = eVar2;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar3.h(function3) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i11 |= tVar3.c(f11) ? 1048576 : 524288;
        }
        if ((12582912 & i5) == 0) {
            i11 |= tVar3.f(g2Var) ? 8388608 : 4194304;
        }
        if ((100663296 & i5) == 0) {
            i11 |= tVar3.f(m9Var) ? 67108864 : 33554432;
        }
        if ((805306368 & i5) == 0) {
            i11 |= tVar3.f(null) ? 536870912 : 268435456;
        }
        if ((306783379 & i11) == 306783378 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar3;
        } else {
            if (Float.isNaN(f11) || f11 == Float.POSITIVE_INFINITY) {
                throw new IllegalArgumentException("The expandedHeight is expected to be specified and finite");
            }
            float fMo102toPx0680j_4 = ((y3.c) tVar3.j(c3.z1.f19497h)).mo102toPx0680j_4(f11);
            if (fMo102toPx0680j_4 < 0.0f) {
                fMo102toPx0680j_4 = 0.0f;
            }
            int i12 = i11 & 1879048192;
            boolean zC = (i12 == 536870912) | tVar3.c(fMo102toPx0680j_4);
            Object objP = tVar3.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (zC || objP == g1Var) {
                objP = new f1(fMo102toPx0680j_4);
                tVar3.m0(objP);
            }
            p1.o0.h((Function0) objP, tVar3);
            boolean z11 = i12 == 536870912;
            Object objP2 = tVar3.P();
            if (z11 || objP2 == g1Var) {
                objP2 = androidx.compose.runtime.d.d(new f1(0, 7));
                tVar3.m0(objP2);
            }
            p1.y2 y2VarA = b0.n1.a(i2.r0.l(c0.b0.f18712c.b(((Number) ((p1.y2) objP2).getValue()).floatValue()), m9Var.f73663a, m9Var.f73664b), c0.f.h(0.0f, 400.0f, null, 5), tVar3, 48, 12);
            x1.e eVarD = x1.f.d(1370231018, new v(function3, 0), tVar3);
            tVar3.b0(-1193605157);
            tVar3.p(false);
            tVar2 = tVar3;
            t7.a(tVar.then(b2.r.f17024a), null, ((i2.s) y2VarA.getValue()).f61148a, 0L, 0.0f, 0.0f, null, x1.f.d(-1943739546, new t(g2Var, f11, m9Var, eVar3, p0Var2, eVar4, eVarD), tVar3), tVar2, 12582912, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new u(tVar, eVar, p0Var, eVar2, function3, f11, g2Var, m9Var, i5);
        }
    }

    public static final void c(x1.e eVar, b2.t tVar, x1.e eVar2, Function3 function3, float f11, k0.g2 g2Var, m9 m9Var, p1.o oVar, int i5, int i11) {
        Function3 function32;
        int i12;
        float f12;
        int i13;
        Function3 function33;
        k0.g2 g2VarC;
        b2.t tVar2;
        p1.t tVar3;
        float f13;
        b2.t tVar4;
        Function3 function34;
        k0.g2 g2Var2;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(226148675);
        int i14 = i5 | 48;
        int i15 = i11 & 8;
        if (i15 != 0) {
            i12 = i5 | 3120;
            function32 = function3;
        } else {
            function32 = function3;
            i12 = i14 | (tVar5.h(function32) ? 2048 : 1024);
        }
        int i16 = i12 | 90112 | (tVar5.f(m9Var) ? 1048576 : 524288) | 12582912;
        if ((4793491 & i16) == 4793490 && tVar5.E()) {
            tVar5.V();
            tVar4 = tVar;
            f13 = f11;
            g2Var2 = g2Var;
            tVar3 = tVar5;
            function34 = function32;
        } else {
            tVar5.X();
            if ((i5 & 1) == 0 || tVar5.B()) {
                Function3 function35 = i15 != 0 ? k1.f73522a : function32;
                f12 = n9.f73712a;
                i13 = i16 & (-458753);
                function33 = function35;
                g2VarC = n9.c(tVar5);
                tVar2 = b2.r.f17024a;
            } else {
                tVar5.V();
                i13 = i16 & (-458753);
                tVar2 = tVar;
                g2VarC = g2Var;
                function33 = function32;
                f12 = f11;
            }
            tVar5.q();
            int i17 = i13 << 6;
            tVar3 = tVar5;
            b(tVar2, eVar, q9.a(tVar5, o1.e0.f79004c), eVar2, function33, (y3.f.a(f12, Float.NaN) || y3.f.a(f12, Float.POSITIVE_INFINITY)) ? n9.f73712a : f12, g2VarC, m9Var, tVar3, (i17 & 234881024) | (458752 & i17) | 27702 | 805306368);
            f13 = f12;
            tVar4 = tVar2;
            function34 = function33;
            g2Var2 = g2VarC;
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new w(eVar, tVar4, eVar2, function34, f13, g2Var2, m9Var, i5, i11);
        }
    }

    public static final void d(b2.t tVar, x1.e eVar, m3.p0 p0Var, float f11, x1.e eVar2, m3.p0 p0Var2, Function2 function2, Function3 function3, float f12, float f13, k0.g2 g2Var, m9 m9Var, a2 a2Var, p1.o oVar, int i5, int i11) {
        int i12;
        x1.e eVar3;
        int i13;
        p1.t tVar2;
        o9 o9Var;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(1169193376);
        if ((i5 & 6) == 0) {
            i12 = (tVar3.f(tVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar3.h(eVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i12 |= tVar3.f(p0Var) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i12 |= tVar3.c(f11) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            eVar3 = eVar2;
            i12 |= tVar3.h(eVar3) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        } else {
            eVar3 = eVar2;
        }
        if ((i5 & 196608) == 0) {
            i12 |= tVar3.f(p0Var2) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((i5 & 1572864) == 0) {
            i12 |= tVar3.h(function2) ? 1048576 : 524288;
        }
        if ((i5 & 12582912) == 0) {
            i12 |= tVar3.h(function3) ? 8388608 : 4194304;
        }
        if ((i5 & 100663296) == 0) {
            i12 |= tVar3.c(f12) ? 67108864 : 33554432;
        }
        if ((i5 & 805306368) == 0) {
            i12 |= tVar3.c(f13) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
        }
        if ((i11 & 6) == 0) {
            i13 = i11 | (tVar3.f(g2Var) ? 4 : 2);
        } else {
            i13 = i11;
        }
        if ((i11 & 48) == 0) {
            i13 |= tVar3.f(m9Var) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            i13 |= tVar3.f(a2Var) ? 256 : 128;
        }
        int i14 = i13;
        if ((i12 & 306783379) == 306783378 && (i14 & 147) == 146 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar3;
        } else {
            if (Float.isNaN(f12) || f12 == Float.POSITIVE_INFINITY) {
                throw new IllegalArgumentException("The collapsedHeight is expected to be specified and finite");
            }
            if (Float.isNaN(f13) || f13 == Float.POSITIVE_INFINITY) {
                throw new IllegalArgumentException("The expandedHeight is expected to be specified and finite");
            }
            if (Float.compare(f13, f12) < 0) {
                throw new IllegalArgumentException("The expandedHeight is expected to be greater or equal to the collapsedHeight");
            }
            Ref.FloatRef floatRef = new Ref.FloatRef();
            Ref.FloatRef floatRef2 = new Ref.FloatRef();
            Ref.IntRef intRef = new Ref.IntRef();
            y3.c cVar = (y3.c) tVar3.j(c3.z1.f19497h);
            floatRef.f71860a = cVar.mo102toPx0680j_4(f13);
            floatRef2.f71860a = cVar.mo102toPx0680j_4(f12);
            intRef.f71861a = cVar.mo96roundToPx0680j_4(f11);
            Unit unit = Unit.f71706a;
            int i15 = i14 & 896;
            boolean zC = (i15 == 256) | tVar3.c(floatRef2.f71860a) | tVar3.c(floatRef.f71860a);
            Object objP = tVar3.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (zC || objP == g1Var) {
                objP = new b0(a2Var, floatRef2, floatRef);
                tVar3.m0(objP);
            }
            p1.o0.h((Function0) objP, tVar3);
            float fA = (a2Var == null || (o9Var = (o9) a2Var.f73007a) == null) ? 0.0f : o9Var.a();
            long jL = i2.r0.l(c0.b0.f18712c.b(fA), m9Var.f73663a, m9Var.f73664b);
            x1.e eVarD = x1.f.d(-89435287, new v(function3, 1), tVar3);
            float fB = f73415a.b(fA);
            float f14 = 1.0f - fA;
            boolean z11 = fA < 0.5f;
            boolean z12 = !z11;
            tVar3.b0(1641266888);
            b2.t tVarA = b2.r.f17024a;
            if (a2Var != null) {
                g0.d1 d1Var = g0.d1.f56493a;
                boolean z13 = i15 == 256;
                Object objP2 = tVar3.P();
                if (z13 || objP2 == g1Var) {
                    objP2 = new androidx.fragment.app.p(a2Var, 18);
                    tVar3.m0(objP2);
                }
                g0.l0 l0VarB = g0.i0.b((Function1) objP2, tVar3);
                boolean z14 = i15 == 256;
                Object objP3 = tVar3.P();
                if (z14 || objP3 == g1Var) {
                    objP3 = new f0(a2Var, null);
                    tVar3.m0(objP3);
                }
                tVarA = g0.i0.a(tVarA, l0VarB, d1Var, false, null, false, (Function3) objP3, false, 188);
            }
            tVar3.p(false);
            tVar2 = tVar3;
            t7.a(tVar.then(tVarA), null, jL, 0L, 0.0f, 0.0f, null, x1.f.d(-1350062619, new d0(g2Var, f12, m9Var, eVar3, p0Var2, fB, z11, function2, eVarD, f13, a2Var, eVar, p0Var, f14, intRef, z12), tVar3), tVar2, 12582912, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new e0(tVar, eVar, p0Var, f11, eVar2, p0Var2, function2, function3, f12, f13, g2Var, m9Var, a2Var, i5, i11);
        }
    }

    public static final void e(b2.t tVar, x5 x5Var, long j11, long j12, long j13, x1.e eVar, m3.p0 p0Var, float f11, k0.j jVar, k0.h hVar, int i5, boolean z11, Function2 function2, x1.e eVar2, p1.o oVar, int i11, int i12) {
        int i13;
        int i14;
        b2.t clearAndSetSemanticsElement;
        p1.t tVar2;
        long j14 = j13;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-742442296);
        if ((i11 & 6) == 0) {
            i13 = i11 | (tVar3.f(tVar) ? 4 : 2);
        } else {
            i13 = i11;
        }
        if ((i11 & 48) == 0) {
            i13 |= (i11 & 64) == 0 ? tVar3.f(x5Var) : tVar3.h(x5Var) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            i13 |= tVar3.e(j11) ? 256 : 128;
        }
        if ((i11 & 3072) == 0) {
            i13 |= tVar3.e(j12) ? 2048 : 1024;
        }
        if ((i11 & 24576) == 0) {
            i13 |= tVar3.e(j14) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i11) == 0) {
            i13 |= tVar3.h(eVar) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((i11 & 1572864) == 0) {
            i13 |= tVar3.f(p0Var) ? 1048576 : 524288;
        }
        if ((12582912 & i11) == 0) {
            i13 |= tVar3.c(f11) ? 8388608 : 4194304;
        }
        if ((i11 & 100663296) == 0) {
            i13 |= tVar3.f(jVar) ? 67108864 : 33554432;
        }
        if ((i11 & 805306368) == 0) {
            i13 |= tVar3.f(hVar) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
        }
        if ((i12 & 6) == 0) {
            i14 = i12 | (tVar3.d(i5) ? 4 : 2);
        } else {
            i14 = i12;
        }
        if ((i12 & 48) == 0) {
            i14 |= tVar3.g(z11) ? 32 : 16;
        }
        if ((i12 & 384) == 0) {
            i14 |= tVar3.h(function2) ? 256 : 128;
        }
        if ((i12 & 3072) == 0) {
            i14 |= tVar3.h(eVar2) ? 2048 : 1024;
        }
        int i15 = i14;
        if ((i13 & 306783379) == 306783378 && (i15 & 1171) == 1170 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar3;
        } else {
            boolean z12 = ((i13 & 1879048192) == 536870912) | ((i13 & 112) == 32 || ((i13 & 64) != 0 && tVar3.h(x5Var))) | ((i13 & 234881024) == 67108864) | ((i15 & 14) == 4);
            Object objP = tVar3.P();
            if (z12 || objP == p1.n.f81514a) {
                objP = new z(x5Var, hVar, jVar, i5);
                tVar3.m0(objP);
            }
            z2.r0 r0Var = (z2.r0) objP;
            int iHashCode = Long.hashCode(tVar3.T);
            p1.n1 n1VarL = tVar3.l();
            b2.t tVarI = fg.a.I(tVar, tVar3);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function0);
            } else {
                tVar3.p0();
            }
            b3.i iVar = b3.k.f17275g;
            p1.a0.j(r0Var, iVar, tVar3);
            b3.i iVar2 = b3.k.f17274f;
            p1.a0.j(n1VarL, iVar2, tVar3);
            b3.i iVar3 = b3.k.f17278j;
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar3, iHashCode, iVar3);
            }
            b3.i iVar4 = b3.k.f17272d;
            p1.a0.j(tVarI, iVar4, tVar3);
            b2.r rVar = b2.r.f17024a;
            b2.t tVarB = androidx.compose.ui.layout.a.b(rVar, "navigationIcon");
            float f12 = f73417c;
            b2.t tVarN = androidx.compose.foundation.layout.d.n(tVarB, f12, 0.0f, 0.0f, 0.0f, 14);
            b2.k kVar = b2.d.f16997a;
            z2.r0 r0VarD = k0.p.d(kVar, false);
            int iHashCode2 = Long.hashCode(tVar3.T);
            p1.n1 n1VarL2 = tVar3.l();
            b2.t tVarI2 = fg.a.I(tVarN, tVar3);
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function0);
            } else {
                tVar3.p0();
            }
            p1.a0.j(r0VarD, iVar, tVar3);
            p1.a0.j(n1VarL2, iVar2, tVar3);
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode2))) {
                a2.c.u(iHashCode2, tVar3, iHashCode2, iVar3);
            }
            p1.a0.j(tVarI2, iVar4, tVar3);
            p1.m0 m0Var = s1.f73932a;
            p1.a0.a(a2.c.t(j11, m0Var), function2, tVar3, 8 | ((i15 >> 3) & 112));
            tVar3.p(true);
            b2.t tVarL = androidx.compose.foundation.layout.d.l(androidx.compose.ui.layout.a.b(rVar, "title"), f12, 0.0f, 2);
            if (z11) {
                x xVar = x.f74196k;
                AtomicInteger atomicInteger = j3.n.f68816a;
                clearAndSetSemanticsElement = new ClearAndSetSemanticsElement(xVar);
            } else {
                clearAndSetSemanticsElement = rVar;
            }
            b2.t tVarB2 = androidx.compose.ui.graphics.a.b(tVarL.then(clearAndSetSemanticsElement), 0.0f, 0.0f, f11, 0.0f, null, 131067);
            z2.r0 r0VarD2 = k0.p.d(kVar, false);
            int iHashCode3 = Long.hashCode(tVar3.T);
            p1.n1 n1VarL3 = tVar3.l();
            b2.t tVarI3 = fg.a.I(tVarB2, tVar3);
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function0);
            } else {
                tVar3.p0();
            }
            p1.a0.j(r0VarD2, iVar, tVar3);
            p1.a0.j(n1VarL3, iVar2, tVar3);
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode3))) {
                a2.c.u(iHashCode3, tVar3, iHashCode3, iVar3);
            }
            p1.a0.j(tVarI3, iVar4, tVar3);
            int i16 = i13 >> 9;
            p7.u.l(j12, p0Var, eVar, tVar3, (i16 & 14) | ((i13 >> 15) & 112) | (i16 & 896));
            tVar2 = tVar3;
            tVar2.p(true);
            b2.t tVarN2 = androidx.compose.foundation.layout.d.n(androidx.compose.ui.layout.a.b(rVar, "actionIcons"), 0.0f, 0.0f, f12, 0.0f, 11);
            z2.r0 r0VarD3 = k0.p.d(kVar, false);
            int iHashCode4 = Long.hashCode(tVar2.T);
            p1.n1 n1VarL4 = tVar2.l();
            b2.t tVarI4 = fg.a.I(tVarN2, tVar2);
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(r0VarD3, iVar, tVar2);
            p1.a0.j(n1VarL4, iVar2, tVar2);
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode4))) {
                a2.c.u(iHashCode4, tVar2, iHashCode4, iVar3);
            }
            p1.a0.j(tVarI4, iVar4, tVar2);
            j14 = j13;
            p1.a0.a(m0Var.a(new i2.s(j14)), eVar2, tVar2, 8 | ((i15 >> 6) & 112));
            tVar2.p(true);
            tVar2.p(true);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a0(tVar, x5Var, j11, j12, j14, eVar, p0Var, f11, jVar, hVar, i5, z11, function2, eVar2, i11, i12);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object f(o9 o9Var, float f11, c0.y yVar, c0.l1 l1Var, ContinuationImpl continuationImpl) {
        g0 g0Var;
        Ref.FloatRef floatRef;
        Ref.FloatRef floatRef2;
        if (continuationImpl instanceof g0) {
            g0Var = (g0) continuationImpl;
            int i5 = g0Var.f73329x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g0Var.f73329x = i5 - Integer.MIN_VALUE;
            } else {
                g0Var = new g0(continuationImpl);
            }
        }
        g0 g0Var2 = g0Var;
        Object obj = g0Var2.f73328w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g0Var2.f73329x;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (o9Var.a() < 0.01f || o9Var.a() == 1.0f) {
                return new y3.r(0L);
            }
            floatRef = new Ref.FloatRef();
            floatRef.f71860a = f11;
            if (yVar != null && Math.abs(f11) > 1.0f) {
                Ref.FloatRef floatRef3 = new Ref.FloatRef();
                c0.n nVarB = c0.f.b(28, 0.0f, f11);
                h0 h0Var = new h0(floatRef3, o9Var, floatRef);
                g0Var2.f73325t = o9Var;
                g0Var2.f73326u = l1Var;
                g0Var2.f73327v = floatRef;
                g0Var2.f73329x = 1;
                if (c0.s1.d(nVarB, yVar, false, h0Var, g0Var2) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            return new y3.r(p6.u.c(0.0f, floatRef.f71860a));
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            floatRef2 = (Ref.FloatRef) g0Var2.f73325t;
            ResultKt.b(obj);
            floatRef = floatRef2;
            return new y3.r(p6.u.c(0.0f, floatRef.f71860a));
        }
        Ref.FloatRef floatRef4 = g0Var2.f73327v;
        l1Var = g0Var2.f73326u;
        o9 o9Var2 = (o9) g0Var2.f73325t;
        ResultKt.b(obj);
        floatRef = floatRef4;
        o9Var = o9Var2;
        c0.l1 l1Var2 = l1Var;
        if (l1Var2 != null && o9Var.b() < 0.0f && o9Var.b() > o9Var.c()) {
            c0.n nVarB2 = c0.f.b(30, o9Var.b(), 0.0f);
            Float f12 = new Float(o9Var.a() < 0.5f ? 0.0f : o9Var.c());
            androidx.fragment.app.p pVar = new androidx.fragment.app.p(o9Var, 19);
            g0Var2.f73325t = floatRef;
            g0Var2.f73326u = null;
            g0Var2.f73327v = null;
            g0Var2.f73329x = 2;
            if (c0.s1.f(nVarB2, f12, l1Var2, false, pVar, g0Var2, 4) != coroutineSingletons) {
                floatRef2 = floatRef;
                floatRef = floatRef2;
            }
            return coroutineSingletons;
        }
        return new y3.r(p6.u.c(0.0f, floatRef.f71860a));
    }

    public static final o9 g(p1.o oVar) {
        Object[] objArr = new Object[0];
        ab.c0 c0Var = o9.f73758d;
        boolean zC = ((p1.t) oVar).c(-3.4028235E38f) | ((p1.t) oVar).c(0.0f) | ((p1.t) oVar).c(0.0f);
        p1.t tVar = (p1.t) oVar;
        Object objP = tVar.P();
        if (zC || objP == p1.n.f81514a) {
            objP = new f1(0, 8);
            tVar.m0(objP);
        }
        return (o9) y1.j.e(objArr, c0Var, (Function0) objP, tVar, 0, 4);
    }
}
