package hy;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import b.i8;
import c0.h2;
import c3.z1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import e0.v1;
import gy.a1;
import gy.b1;
import gy.c1;
import gy.e2;
import gy.l1;
import gy.y0;
import i2.t0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.List;
import k0.i2;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.ClosedFloatingPointRange;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import p1.e1;
import p1.g1;
import p1.n1;
import p1.o0;
import p1.t1;
import z2.r0;

/* loaded from: classes4.dex */
public abstract class u {

    /* renamed from: a, reason: collision with root package name */
    public static final float f61044a = 10;

    /* renamed from: b, reason: collision with root package name */
    public static final float f61045b = 24;

    /* renamed from: c, reason: collision with root package name */
    public static final float f61046c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final float f61047d = 6;

    /* renamed from: e, reason: collision with root package name */
    public static final float f61048e = 12;

    /* renamed from: f, reason: collision with root package name */
    public static final b2.t f61049f = androidx.compose.foundation.layout.e.i(androidx.compose.foundation.layout.e.v(b2.r.f17024a, 144, 0.0f, 2), 0.0f, 48, 1);

    /* renamed from: g, reason: collision with root package name */
    public static final h2 f61050g = new h2(100, (c0.a0) null, 6);

    public static final void a(Function1 function1, ClosedFloatingPointRange closedFloatingPointRange, e1 e1Var, float f11, p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(427483874);
        int i11 = i5 | (tVar.h(function1) ? 4 : 2) | (tVar.f(closedFloatingPointRange) ? 32 : 16) | (tVar.c(f11) ? 2048 : 1024);
        if ((i11 & 1171) == 1170 && tVar.E()) {
            tVar.V();
        } else {
            tVar.b0(285765627);
            boolean z11 = ((i11 & 14) == 4) | ((i11 & 112) == 32) | ((i11 & 7168) == 2048);
            Object objP = tVar.P();
            if (z11 || objP == p1.n.f81514a) {
                objP = new a1(closedFloatingPointRange, function1, f11, e1Var, 1);
                tVar.m0(objP);
            }
            tVar.p(false);
            o0.h((Function0) objP, tVar);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b1(function1, closedFloatingPointRange, e1Var, f11, i5, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:117:0x0228  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x023d  */
    /* JADX WARN: Removed duplicated region for block: B:122:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x010b  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0157  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(final float f11, final Function1 function1, b2.t tVar, boolean z11, final ClosedFloatingPointRange closedFloatingPointRange, final int i5, Function0 function0, i0.i iVar, h hVar, Function4 function4, p1.o oVar, final int i11, final int i12) {
        int i13;
        Function0 function02;
        int i14;
        h hVarA;
        int i15;
        Function4 function42;
        int i16;
        g1 g1Var;
        Object objP;
        int i17;
        p1.t tVar2;
        g1 g1Var2;
        int i18;
        Function0 function03;
        Function4 function4D;
        b2.t tVar3;
        h hVar2;
        i0.i iVar2;
        boolean z12;
        Function0 function04;
        final Function0 function05;
        final i0.i iVar3;
        final boolean z13;
        t1 t1VarU;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(1111354126);
        if ((i11 & 6) == 0) {
            i13 = (tVar4.c(f11) ? 4 : 2) | i11;
        } else {
            i13 = i11;
        }
        if ((i11 & 48) == 0) {
            i13 |= tVar4.h(function1) ? 32 : 16;
        }
        int i19 = i13 | 3456;
        if ((i11 & 24576) == 0) {
            i19 |= tVar4.f(closedFloatingPointRange) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i11) == 0) {
            i19 |= tVar4.d(i5) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        int i21 = i12 & 64;
        if (i21 != 0) {
            i19 |= 1572864;
        } else {
            if ((1572864 & i11) == 0) {
                function02 = function0;
                i19 |= tVar4.h(function02) ? 1048576 : 524288;
            }
            i14 = i19 | 12582912;
            if ((100663296 & i11) != 0) {
                if ((i12 & 256) == 0) {
                    hVarA = hVar;
                    int i22 = tVar4.f(hVarA) ? 67108864 : 33554432;
                    i14 |= i22;
                } else {
                    hVarA = hVar;
                }
                i14 |= i22;
            } else {
                hVarA = hVar;
            }
            i15 = i12 & EventBridgeChannel.QUEUE_CAPACITY;
            if (i15 != 0) {
                if ((805306368 & i11) == 0) {
                    function42 = function4;
                    i14 |= tVar4.h(function42) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
                }
                if ((306783379 & i14) == 306783378 && tVar4.E()) {
                    tVar4.V();
                    tVar3 = tVar;
                    z13 = z11;
                    iVar3 = iVar;
                    function05 = function02;
                } else {
                    tVar4.X();
                    i16 = i11 & 1;
                    g1Var = p1.n.f81514a;
                    if (i16 != 0 || tVar4.B()) {
                        Function0 function06 = i21 == 0 ? null : function0;
                        tVar4.b0(1928774216);
                        objP = tVar4.P();
                        if (objP == g1Var) {
                            objP = a2.c.d(tVar4);
                        }
                        i0.i iVar4 = (i0.i) objP;
                        tVar4.p(false);
                        if ((i12 & 256) == 0) {
                            i17 = i15;
                            g1Var2 = g1Var;
                            hVarA = b0.a(null, 0L, 0L, 0L, tVar4, 31);
                            tVar2 = tVar4;
                            i14 &= -234881025;
                        } else {
                            i17 = i15;
                            tVar2 = tVar4;
                            g1Var2 = g1Var;
                        }
                        b2.r rVar = b2.r.f17024a;
                        if (i17 == 0) {
                            Function0 function07 = function06;
                            i18 = i14;
                            function03 = function07;
                            function4D = x1.f.d(-774384250, new l(hVarA), tVar2);
                        } else {
                            Function0 function08 = function06;
                            i18 = i14;
                            function03 = function08;
                            function4D = function4;
                        }
                        tVar3 = rVar;
                        hVar2 = hVarA;
                        iVar2 = iVar4;
                        z12 = true;
                    } else {
                        tVar4.V();
                        if ((i12 & 256) != 0) {
                            i14 &= -234881025;
                        }
                        z12 = z11;
                        i18 = i14;
                        tVar2 = tVar4;
                        function4D = function42;
                        g1Var2 = g1Var;
                        tVar3 = tVar;
                        function03 = function0;
                        hVar2 = hVarA;
                        iVar2 = iVar;
                    }
                    tVar2.q();
                    if (i5 >= 0) {
                        throw new IllegalArgumentException("steps should be >= 0");
                    }
                    e1 e1VarM = androidx.compose.runtime.d.m(function1, tVar2);
                    tVar2.b0(1928796956);
                    boolean z14 = (i18 & 458752) == 131072;
                    Object objP2 = tVar2.P();
                    if (z14 || objP2 == g1Var2) {
                        if (i5 == 0) {
                            objP2 = EmptyList.f71733a;
                        } else {
                            int i23 = i5 + 2;
                            ArrayList arrayList = new ArrayList(i23);
                            int i24 = 0;
                            while (i24 < i23) {
                                arrayList.add(Float.valueOf(i24 / (i5 + 1)));
                                i24++;
                                function03 = function03;
                            }
                            objP2 = arrayList;
                        }
                        function04 = function03;
                        tVar2.m0(objP2);
                    } else {
                        function04 = function03;
                    }
                    List list = (List) objP2;
                    tVar2.p(false);
                    float f12 = f61044a * 2;
                    boolean z15 = z12;
                    b2.t tVarD = androidx.compose.foundation.a.d(j3.n.b(j3.n.b(androidx.compose.foundation.layout.e.m(tVar3, f12, f12, 0.0f, 0.0f, 12), false, new y0(z15, closedFloatingPointRange, i5, list, kotlin.ranges.a.d0(f11, ((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue()), function1, 1)), true, new v1(f11, closedFloatingPointRange, i5)), z15, iVar2);
                    i0.i iVar5 = iVar2;
                    h hVar3 = hVar2;
                    Function4 function43 = function4D;
                    Function0 function09 = function04;
                    p pVar = new p(closedFloatingPointRange, f11, list, function09, iVar5, z15, hVar3, function43, e1VarM);
                    hVarA = hVar3;
                    function42 = function43;
                    function05 = function09;
                    iVar3 = iVar5;
                    tVar4 = tVar2;
                    i2.a(tVarD, null, x1.f.d(-1374444296, pVar, tVar2), tVar4, 3072, 6);
                    z13 = z15;
                }
                final h hVar4 = hVarA;
                final Function4 function44 = function42;
                t1VarU = tVar4.u();
                if (t1VarU != null) {
                    final b2.t tVar5 = tVar3;
                    t1VarU.f81583d = new Function2() { // from class: hy.i
                        @Override // kotlin.jvm.functions.Function2
                        public final Object invoke(Object obj, Object obj2) {
                            ((Integer) obj2).getClass();
                            u.b(f11, function1, tVar5, z13, closedFloatingPointRange, i5, function05, iVar3, hVar4, function44, (p1.o) obj, p1.a0.l(i11 | 1), i12);
                            return Unit.f71706a;
                        }
                    };
                    return;
                }
                return;
            }
            i14 |= 805306368;
            function42 = function4;
            if ((306783379 & i14) == 306783378) {
                tVar4.X();
                i16 = i11 & 1;
                g1Var = p1.n.f81514a;
                if (i16 != 0) {
                    if (i21 == 0) {
                    }
                    tVar4.b0(1928774216);
                    objP = tVar4.P();
                    if (objP == g1Var) {
                    }
                    i0.i iVar42 = (i0.i) objP;
                    tVar4.p(false);
                    if ((i12 & 256) == 0) {
                    }
                    b2.r rVar2 = b2.r.f17024a;
                    if (i17 == 0) {
                    }
                    tVar3 = rVar2;
                    hVar2 = hVarA;
                    iVar2 = iVar42;
                    z12 = true;
                    tVar2.q();
                    if (i5 >= 0) {
                    }
                }
            }
            final h hVar42 = hVarA;
            final Function4 function442 = function42;
            t1VarU = tVar4.u();
            if (t1VarU != null) {
            }
        }
        function02 = function0;
        i14 = i19 | 12582912;
        if ((100663296 & i11) != 0) {
        }
        i15 = i12 & EventBridgeChannel.QUEUE_CAPACITY;
        if (i15 != 0) {
        }
        function42 = function4;
        if ((306783379 & i14) == 306783378) {
        }
        final h hVar422 = hVarA;
        final Function4 function4422 = function42;
        t1VarU = tVar4.u();
        if (t1VarU != null) {
        }
    }

    public static final void c(boolean z11, float f11, h hVar, float f12, i0.i iVar, b2.t tVar, Function4 function4, p1.o oVar, int i5) {
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-2128575945);
        int i11 = i5 | (tVar2.g(z11) ? 4 : 2) | (tVar2.c(f11) ? 32 : 16) | (tVar2.f(hVar) ? 256 : 128) | (tVar2.c(f12) ? 2048 : 1024) | (tVar2.f(iVar) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (tVar2.f(tVar) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX) | (tVar2.h(function4) ? 1048576 : 524288);
        if ((599187 & i11) == 599186 && tVar2.E()) {
            tVar2.V();
        } else {
            b2.t tVarThen = tVar.then(f61049f);
            r0 r0VarD = k0.p.d(b2.d.f16997a, false);
            int iHashCode = Long.hashCode(tVar2.T);
            n1 n1VarL = tVar2.l();
            b2.t tVarI = fg.a.I(tVarThen, tVar2);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(r0VarD, b3.k.f17275g, tVar2);
            p1.a0.j(n1VarL, b3.k.f17274f, tVar2);
            b3.i iVar2 = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar2);
            }
            p1.a0.j(tVarI, b3.k.f17272d, tVar2);
            float fMo98toDpu2uoSUM = ((y3.c) tVar2.j(z1.f19497h)).mo98toDpu2uoSUM(f12);
            float f13 = f61044a * 2;
            b2.t tVarA = androidx.compose.foundation.layout.b.f13968a.a(b2.r.f17024a, b2.d.f17000d);
            function4.invoke(tVarA, Float.valueOf(f11), tVar2, Integer.valueOf((i11 & 112) | ((i11 >> 12) & 896)));
            d(tVarA, (fMo98toDpu2uoSUM - f13) * f11, iVar, hVar, z11, f13, tVar2, ((i11 >> 6) & 896) | 196608 | ((i11 << 3) & 7168) | ((i11 << 12) & 57344));
            tVar2.p(true);
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c1(z11, f11, hVar, f12, iVar, tVar, function4, i5);
        }
    }

    public static final void d(final b2.t tVar, final float f11, final i0.i iVar, final h hVar, final boolean z11, final float f12, p1.o oVar, final int i5) {
        int i11;
        b2.t tVarB;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(899679594);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.c(f11) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.f(iVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.f(hVar) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar2.g(z11) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.c(f12) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((74899 & i11) == 74898 && tVar2.E()) {
            tVar2.V();
        } else {
            b2.t tVarN = androidx.compose.foundation.layout.d.n(tVar, f11, 0.0f, 0.0f, 0.0f, 14);
            r0 r0VarD = k0.p.d(b2.d.f16997a, false);
            int iHashCode = Long.hashCode(tVar2.T);
            n1 n1VarL = tVar2.l();
            b2.t tVarI = fg.a.I(tVarN, tVar2);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(r0VarD, b3.k.f17275g, tVar2);
            p1.a0.j(n1VarL, b3.k.f17274f, tVar2);
            b3.i iVar2 = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar2);
            }
            p1.a0.j(tVarI, b3.k.f17272d, tVar2);
            tVar2.b0(-1555558334);
            Object objP = tVar2.P();
            g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = new SnapshotStateList();
                tVar2.m0(objP);
            }
            SnapshotStateList snapshotStateList = (SnapshotStateList) objP;
            tVar2.p(false);
            tVar2.b0(-1555554874);
            boolean z12 = (i11 & 896) == 256;
            Object objP2 = tVar2.P();
            if (z12 || objP2 == g1Var) {
                objP2 = new l1(iVar, snapshotStateList, null, 1);
                tVar2.m0(objP2);
            }
            tVar2.p(false);
            o0.f(iVar, (Function2) objP2, tVar2);
            float f13 = !snapshotStateList.isEmpty() ? f61047d : f61046c;
            b2.t tVarA = androidx.compose.foundation.d.a(androidx.compose.foundation.e.a(androidx.compose.foundation.layout.e.q(b2.r.f17024a, f12, f12), iVar, k1.k.a(false, f61045b, 0L, tVar2, 54, 4)), iVar);
            if (!z11) {
                f13 = 0;
            }
            s0.g gVar = s0.h.f86511a;
            b2.t tVarD0 = u90.b.d0(tVarA, f13, gVar, 24);
            float f14 = 2;
            hVar.getClass();
            tVar2.b0(-841003573);
            e1 e1VarM = androidx.compose.runtime.d.m(new i2.s(z11 ? hVar.f60974c : i2.s.f61146l), tVar2);
            tVar2.p(false);
            b2.t tVarO = x7.f.o(tVarD0, f14, ((i2.s) e1VarM.getValue()).f61148a, gVar);
            tVar2.b0(-483732476);
            e1 e1VarM2 = androidx.compose.runtime.d.m(new i2.s(z11 ? hVar.f60975d : hVar.f60976e), tVar2);
            tVar2.p(false);
            long j11 = ((i2.s) e1VarM2.getValue()).f61148a;
            tVar2.b0(-1555511266);
            if (i2.s.c(j11) < 1.0f) {
                y3.c cVar = (y3.c) tVar2.j(z1.f19497h);
                tVar2.b0(-693930091);
                boolean zF = tVar2.f(cVar);
                Object objP3 = tVar2.P();
                if (zF || objP3 == g1Var) {
                    objP3 = new e2(cVar.mo96roundToPx0680j_4(f12 / 3));
                    tVar2.m0(objP3);
                }
                tVar2.p(false);
                tVarB = androidx.compose.foundation.a.b(androidx.compose.foundation.a.a(tVarO, (t0) objP3, gVar, 4), j11, gVar);
            } else {
                tVarB = androidx.compose.foundation.a.b(tVarO, j11, gVar);
            }
            tVar2.p(false);
            i2.b(tVarB, tVar2);
            tVar2.p(true);
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2() { // from class: hy.k
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    u.d(tVar, f11, iVar, hVar, z11, f12, (p1.o) obj, p1.a0.l(i5 | 1));
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final void e(b2.t tVar, h hVar, final float f11, final float f12, p1.o oVar, int i5) {
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1041331153);
        int i11 = i5 | (tVar2.f(tVar) ? 4 : 2) | (tVar2.f(hVar) ? 32 : 16) | (tVar2.g(true) ? 256 : 128) | (tVar2.c(f11) ? 2048 : 1024) | (tVar2.c(f12) ? 16384 : UserMetadata.MAX_INTERNAL_KEY_SIZE);
        if ((i11 & 9363) == 9362 && tVar2.E()) {
            tVar2.V();
        } else {
            e1 e1VarA = hVar.a(tVar2);
            List list = hVar.f60973b;
            final long j11 = ((i2.s) e1VarA.getValue()).f61148a;
            tVar2.b0(-409440427);
            boolean zF = tVar2.f(list);
            Object objP = tVar2.P();
            g1 g1Var = p1.n.f81514a;
            if (zF || objP == g1Var) {
                objP = i8.y(list);
                tVar2.m0(objP);
            }
            final i2.p pVar = (i2.p) objP;
            tVar2.p(false);
            tVar2.b0(-409435868);
            boolean zF2 = ((57344 & i11) == 16384) | tVar2.f(pVar) | ((i11 & 7168) == 2048) | tVar2.e(j11);
            Object objP2 = tVar2.P();
            if (zF2 || objP2 == g1Var) {
                objP2 = new Function1() { // from class: hy.j
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj) {
                        k2.f fVar = (k2.f) obj;
                        float f13 = f11;
                        float fIntBitsToFloat = Float.intBitsToFloat((int) (fVar.mo93getCenterF1C5BW0() & 4294967295L));
                        float f14 = 2;
                        float f15 = f12;
                        float f16 = f15 / 2.0f;
                        k2.f.C(fVar, pVar, (Float.floatToRawIntBits(r12) << 32) | (Float.floatToRawIntBits(fIntBitsToFloat - r16) & 4294967295L), (Float.floatToRawIntBits(Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() >> 32)) - f13) << 32) | (Float.floatToRawIntBits(f15) & 4294967295L), (Float.floatToRawIntBits(f16) << 32) | (Float.floatToRawIntBits(f16) & 4294967295L), null, 240);
                        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (fVar.mo93getCenterF1C5BW0() & 4294967295L)) - (f15 / f14);
                        long jFloatToRawIntBits = (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(f13 / 2.0f) << 32);
                        long jFloatToRawIntBits2 = (Float.floatToRawIntBits(f15) & 4294967295L) | (Float.floatToRawIntBits(Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() >> 32)) - f13) << 32);
                        k2.k kVar = new k2.k(fVar.mo102toPx0680j_4(f14), 0.0f, 0, 0, 30);
                        fVar.mo92drawRoundRectuAw5IA(j11, (Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE & 2) != 0 ? 0L : jFloatToRawIntBits, jFloatToRawIntBits2, (Float.floatToRawIntBits(f16) & 4294967295L) | (Float.floatToRawIntBits(f16) << 32), (Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE & 16) != 0 ? k2.j.f70871a : kVar, 1.0f, null, 3);
                        return Unit.f71706a;
                    }
                };
                tVar2.m0(objP2);
            }
            tVar2.p(false);
            ic.b.g(i11 & 14, tVar, (Function1) objP2, tVar2);
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new gy.z1(tVar, hVar, f11, f12, i5, 1);
        }
    }

    public static final float f(float f11, float f12, float f13) {
        float f14 = f12 - f11;
        return kotlin.ranges.a.d0(f14 == 0.0f ? 0.0f : (f13 - f11) / f14, 0.0f, 1.0f);
    }

    public static final float g(float f11, float f12, float f13) {
        return (f13 * f12) + ((1 - f13) * f11);
    }
}
