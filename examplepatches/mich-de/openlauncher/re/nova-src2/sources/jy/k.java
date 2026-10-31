package jy;

import b2.r;
import b2.t;
import c4.y;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import d20.v;
import h6.c1;
import i2.v0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import k0.p1;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import l1.d1;
import l1.g1;
import l1.s1;
import l1.t7;
import p1.a0;
import p1.n;
import p1.n1;
import p1.o;
import p1.t1;
import p1.z2;
import p7.u;
import z2.r0;

/* loaded from: classes4.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final float f70493a;

    /* renamed from: b, reason: collision with root package name */
    public static final float f70494b = 12;

    /* renamed from: c, reason: collision with root package name */
    public static final p1 f70495c;

    /* renamed from: d, reason: collision with root package name */
    public static final p1 f70496d;

    /* renamed from: e, reason: collision with root package name */
    public static final p1 f70497e;

    /* renamed from: f, reason: collision with root package name */
    public static final float f70498f;

    /* renamed from: g, reason: collision with root package name */
    public static final float f70499g;

    static {
        float f11 = 8;
        f70493a = f11;
        float f12 = 0;
        f70495c = new p1(f12, 24, f12, f11);
        float f13 = 16;
        androidx.compose.foundation.layout.d.c(0.0f, 0.0f, f13, 7);
        f70496d = androidx.compose.foundation.layout.d.c(f13, f13, f13, 2);
        f70497e = androidx.compose.foundation.layout.d.c(0.0f, 0.0f, 18, 7);
        f70498f = 280;
        f70499g = 560;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0112  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0195  */
    /* JADX WARN: Removed duplicated region for block: B:88:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(final Function0 function0, final x1.e eVar, t tVar, Function2 function2, Function2 function22, v0 v0Var, long j11, float f11, long j12, long j13, long j14, y yVar, final x1.e eVar2, o oVar, final int i5, final int i11, final int i12) {
        int i13;
        final Function2 function23;
        int i14;
        Function2 function24;
        int i15;
        int i16;
        int i17;
        float f12;
        Function2 function25;
        char c11;
        long j15;
        long j16;
        long j17;
        int i18;
        y yVar2;
        v0 v0Var2;
        t tVar2;
        long j18;
        Function2 function26;
        final Function2 function27;
        final v0 v0Var3;
        final float f13;
        y yVar3;
        t1 t1VarU;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(399770991);
        if ((i5 & 6) == 0) {
            i13 = (tVar3.h(function0) ? 4 : 2) | i5;
        } else {
            i13 = i5;
        }
        if ((i5 & 48) == 0) {
            i13 |= tVar3.h(eVar) ? 32 : 16;
        }
        int i19 = i13 | 384;
        int i21 = i12 & 8;
        if (i21 != 0) {
            i19 = i13 | 3456;
        } else {
            if ((i5 & 3072) == 0) {
                function23 = function2;
                i19 |= tVar3.h(function23) ? 2048 : 1024;
            }
            int i22 = i19 | 24576;
            i14 = i12 & 32;
            if (i14 != 0) {
                if ((196608 & i5) == 0) {
                    function24 = function22;
                    i22 |= tVar3.h(function24) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
                }
                if ((1572864 & i5) == 0) {
                    i22 |= 524288;
                }
                if ((12582912 & i5) == 0) {
                    i22 |= 4194304;
                }
                i15 = 100663296 | i22;
                if ((805306368 & i5) == 0) {
                    i15 = 369098752 | i22;
                }
                int i23 = (i11 & 6) == 0 ? i11 | 2 : i11;
                if ((i11 & 48) == 0) {
                    i23 |= 16;
                }
                i16 = i23 | 384;
                if ((i11 & 3072) == 0) {
                    i16 |= tVar3.h(eVar2) ? 2048 : 1024;
                }
                if ((306783379 & i15) == 306783378 && (i16 & 1171) == 1170 && tVar3.E()) {
                    tVar3.V();
                    tVar2 = tVar;
                    j15 = j11;
                    f13 = f11;
                    j16 = j12;
                    j18 = j13;
                    j17 = j14;
                    yVar3 = yVar;
                    function27 = function24;
                    v0Var3 = v0Var;
                } else {
                    tVar3.X();
                    if ((i5 & 1) != 0 || tVar3.B()) {
                        if (i21 != 0) {
                            function23 = null;
                        }
                        if (i14 != 0) {
                            function24 = null;
                        }
                        s0.g gVarC = s0.h.c((float) 28.0d);
                        z2 z2Var = g1.f73330a;
                        long j19 = ((d1) tVar3.j(z2Var)).f73161p;
                        Function2 function28 = function23;
                        long j21 = ((d1) tVar3.j(z2Var)).f73153f;
                        long j22 = ((d1) tVar3.j(z2Var)).f73162q;
                        long j23 = ((d1) tVar3.j(z2Var)).f73164s;
                        i17 = i16 & (-127);
                        f12 = 6;
                        function25 = function24;
                        c11 = 3;
                        j15 = j19;
                        j16 = j21;
                        j17 = j23;
                        i18 = i15 & (-1912078337);
                        yVar2 = new y(3);
                        v0Var2 = gVarC;
                        tVar2 = r.f17024a;
                        j18 = j22;
                        function26 = function28;
                    } else {
                        tVar3.V();
                        int i24 = i16 & (-127);
                        v0Var2 = v0Var;
                        j15 = j11;
                        f12 = f11;
                        j16 = j12;
                        j18 = j13;
                        j17 = j14;
                        function26 = function23;
                        i18 = i15 & (-1912078337);
                        i17 = i24;
                        tVar2 = tVar;
                        yVar2 = yVar;
                        function25 = function24;
                        c11 = 3;
                    }
                    tVar3.q();
                    u.g(function0, yVar2, x1.f.d(825563974, new f(tVar2, function25, eVar2, v0Var2, j15, f12, j16, j18, j17, function26, eVar), tVar3), tVar3, (i18 & 14) | 384 | ((i17 >> 3) & 112));
                    function27 = function25;
                    v0Var3 = v0Var2;
                    f13 = f12;
                    yVar3 = yVar2;
                    function23 = function26;
                }
                t1VarU = tVar3.u();
                if (t1VarU != null) {
                    final t tVar4 = tVar2;
                    final long j24 = j18;
                    final y yVar4 = yVar3;
                    final long j25 = j15;
                    final long j26 = j17;
                    final long j27 = j16;
                    t1VarU.f81583d = new Function2() { // from class: jy.c
                        @Override // kotlin.jvm.functions.Function2
                        public final Object invoke(Object obj, Object obj2) {
                            ((Integer) obj2).getClass();
                            int iL = a0.l(i5 | 1);
                            int iL2 = a0.l(i11);
                            k.a(function0, eVar, tVar4, function23, function27, v0Var3, j25, f13, j27, j24, j26, yVar4, eVar2, (o) obj, iL, iL2, i12);
                            return Unit.f71706a;
                        }
                    };
                    return;
                }
                return;
            }
            i22 = 221184 | i19;
            function24 = function22;
            if ((1572864 & i5) == 0) {
            }
            if ((12582912 & i5) == 0) {
            }
            i15 = 100663296 | i22;
            if ((805306368 & i5) == 0) {
            }
            if ((i11 & 6) == 0) {
            }
            if ((i11 & 48) == 0) {
            }
            i16 = i23 | 384;
            if ((i11 & 3072) == 0) {
            }
            if ((306783379 & i15) == 306783378) {
                tVar3.X();
                if ((i5 & 1) != 0) {
                    if (i21 != 0) {
                    }
                    if (i14 != 0) {
                    }
                    s0.g gVarC2 = s0.h.c((float) 28.0d);
                    z2 z2Var2 = g1.f73330a;
                    long j192 = ((d1) tVar3.j(z2Var2)).f73161p;
                    Function2 function282 = function23;
                    long j212 = ((d1) tVar3.j(z2Var2)).f73153f;
                    long j222 = ((d1) tVar3.j(z2Var2)).f73162q;
                    long j232 = ((d1) tVar3.j(z2Var2)).f73164s;
                    i17 = i16 & (-127);
                    f12 = 6;
                    function25 = function24;
                    c11 = 3;
                    j15 = j192;
                    j16 = j212;
                    j17 = j232;
                    i18 = i15 & (-1912078337);
                    yVar2 = new y(3);
                    v0Var2 = gVarC2;
                    tVar2 = r.f17024a;
                    j18 = j222;
                    function26 = function282;
                    tVar3.q();
                    u.g(function0, yVar2, x1.f.d(825563974, new f(tVar2, function25, eVar2, v0Var2, j15, f12, j16, j18, j17, function26, eVar), tVar3), tVar3, (i18 & 14) | 384 | ((i17 >> 3) & 112));
                    function27 = function25;
                    v0Var3 = v0Var2;
                    f13 = f12;
                    yVar3 = yVar2;
                    function23 = function26;
                }
            }
            t1VarU = tVar3.u();
            if (t1VarU != null) {
            }
        }
        function23 = function2;
        int i222 = i19 | 24576;
        i14 = i12 & 32;
        if (i14 != 0) {
        }
        function24 = function22;
        if ((1572864 & i5) == 0) {
        }
        if ((12582912 & i5) == 0) {
        }
        i15 = 100663296 | i222;
        if ((805306368 & i5) == 0) {
        }
        if ((i11 & 6) == 0) {
        }
        if ((i11 & 48) == 0) {
        }
        i16 = i23 | 384;
        if ((i11 & 3072) == 0) {
        }
        if ((306783379 & i15) == 306783378) {
        }
        t1VarU = tVar3.u();
        if (t1VarU != null) {
        }
    }

    public static final void b(final x1.e eVar, final t tVar, final Function2 function2, final x1.e eVar2, final v0 v0Var, final long j11, final float f11, final long j12, final long j13, final long j14, final long j15, o oVar, final int i5) {
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(380375409);
        int i11 = i5 | (tVar2.f(tVar) ? 32 : 16) | (tVar2.h(null) ? 256 : 128) | (tVar2.h(function2) ? 2048 : 1024) | (tVar2.h(eVar2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (tVar2.f(v0Var) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX) | (tVar2.e(j11) ? 1048576 : 524288) | (tVar2.c(f11) ? 8388608 : 4194304) | (tVar2.e(j12) ? 67108864 : 33554432) | (tVar2.e(j13) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456);
        int i12 = (tVar2.e(j14) ? (char) 4 : (char) 2) | (tVar2.e(j15) ? ' ' : (char) 16);
        if ((i11 & 306783379) == 306783378 && (i12 & 19) == 18 && tVar2.E()) {
            tVar2.V();
        } else {
            int i13 = ((i11 >> 3) & 14) | 12582912;
            int i14 = i11 >> 12;
            t7.a(tVar, v0Var, j11, 0L, f11, 0.0f, null, x1.f.d(-1672783348, new h(function2, eVar2, j13, j14, j15, j12, eVar), tVar2), tVar2, i13 | (i14 & 112) | (i14 & 896) | ((i11 >> 9) & 57344), 104);
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2(tVar, function2, eVar2, v0Var, j11, f11, j12, j13, j14, j15, i5) { // from class: jy.d

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ t f70452b;

                /* renamed from: c, reason: collision with root package name */
                public final /* synthetic */ Function2 f70453c;

                /* renamed from: d, reason: collision with root package name */
                public final /* synthetic */ x1.e f70454d;

                /* renamed from: e, reason: collision with root package name */
                public final /* synthetic */ v0 f70455e;

                /* renamed from: f, reason: collision with root package name */
                public final /* synthetic */ long f70456f;

                /* renamed from: g, reason: collision with root package name */
                public final /* synthetic */ float f70457g;

                /* renamed from: h, reason: collision with root package name */
                public final /* synthetic */ long f70458h;

                /* renamed from: i, reason: collision with root package name */
                public final /* synthetic */ long f70459i;

                /* renamed from: j, reason: collision with root package name */
                public final /* synthetic */ long f70460j;

                /* renamed from: k, reason: collision with root package name */
                public final /* synthetic */ long f70461k;

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iL = a0.l(7);
                    k.b(this.f70451a, this.f70452b, this.f70453c, this.f70454d, this.f70455e, this.f70456f, this.f70457g, this.f70458h, this.f70459i, this.f70460j, this.f70461k, (o) obj, iL);
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final void c(x1.e eVar, o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(138565542);
        if ((i5 & 147) == 146 && tVar.E()) {
            tVar.V();
        } else {
            tVar.b0(2004052308);
            Object objP = tVar.P();
            if (objP == n.f81514a) {
                objP = new j();
                tVar.m0(objP);
            }
            r0 r0Var = (r0) objP;
            tVar.p(false);
            int iHashCode = Long.hashCode(tVar.T);
            n1 n1VarL = tVar.l();
            t tVarI = fg.a.I(r.f17024a, tVar);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar.f0();
            if (tVar.S) {
                tVar.k(function0);
            } else {
                tVar.p0();
            }
            a0.j(r0Var, b3.k.f17275g, tVar);
            a0.j(n1VarL, b3.k.f17274f, tVar);
            b3.i iVar = b3.k.f17278j;
            if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar, iHashCode, iVar);
            }
            a0.j(tVarI, b3.k.f17272d, tVar);
            c1.y(6, eVar, tVar, true);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new v(eVar, i5);
        }
    }

    public static final void d(long j11, x1.e eVar, o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(1646838415);
        if ((((tVar.e(j11) ? 4 : 2) | i5) & 19) == 18 && tVar.E()) {
            tVar.V();
        } else {
            a0.a(a2.c.t(j11, s1.f73932a), eVar, tVar, 56);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new e(j11, eVar, i5);
        }
    }
}
