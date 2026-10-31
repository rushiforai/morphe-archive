package gy;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import c0.h2;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import k0.i2;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.ClosedFloatingPointRange;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import p1.z2;

/* loaded from: classes4.dex */
public abstract class t1 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f58549a = 4;

    /* renamed from: b, reason: collision with root package name */
    public static final float f58550b = 1;

    /* renamed from: c, reason: collision with root package name */
    public static final float f58551c = 6;

    /* renamed from: d, reason: collision with root package name */
    public static final b2.t f58552d = androidx.compose.foundation.layout.e.i(androidx.compose.foundation.layout.e.v(b2.r.f17024a, 144, 0.0f, 2), 0.0f, 48, 1);

    /* renamed from: e, reason: collision with root package name */
    public static final h2 f58553e = new h2(100, (c0.a0) null, 6);

    public static final void a(Function1 function1, ClosedFloatingPointRange closedFloatingPointRange, p1.e1 e1Var, float f11, p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-125279842);
        int i11 = i5 | (tVar.h(function1) ? 4 : 2) | (tVar.f(closedFloatingPointRange) ? 32 : 16) | (tVar.c(f11) ? 2048 : 1024);
        if ((i11 & 1171) == 1170 && tVar.E()) {
            tVar.V();
        } else {
            tVar.b0(92995728);
            boolean z11 = ((i11 & 14) == 4) | ((i11 & 112) == 32) | ((i11 & 7168) == 2048);
            Object objP = tVar.P();
            if (z11 || objP == p1.n.f81514a) {
                objP = new a1(closedFloatingPointRange, function1, f11, e1Var, 0);
                tVar.m0(objP);
            }
            tVar.p(false);
            p1.o0.h((Function0) objP, tVar);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b1(function1, closedFloatingPointRange, e1Var, f11, i5, 0);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0127  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0132  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x0148  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x014d  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x022d  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x0240  */
    /* JADX WARN: Removed duplicated region for block: B:140:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x00fa  */
    /* JADX WARN: Type inference failed for: r0v29, types: [kotlin.collections.EmptyList] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void b(final float f11, final Function1 function1, final b2.t tVar, boolean z11, final ClosedFloatingPointRange closedFloatingPointRange, int i5, i0.i iVar, j jVar, p1.o oVar, final int i11, final int i12) {
        final boolean z12;
        int i13;
        int i14;
        int i15;
        i0.i iVar2;
        j jVarM;
        int i16;
        i0.i iVar3;
        boolean z13;
        p1.t tVar2;
        int i17;
        boolean z14;
        int i18;
        ArrayList arrayList;
        final int i19;
        p1.t1 t1VarU;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(628222387);
        int i21 = (i11 & 6) == 0 ? (tVar3.c(f11) ? 4 : 2) | i11 : i11;
        if ((i11 & 48) == 0) {
            i21 |= tVar3.h(function1) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            i21 |= tVar3.f(tVar) ? 256 : 128;
        }
        int i22 = i12 & 8;
        if (i22 != 0) {
            i21 |= 3072;
        } else {
            if ((i11 & 3072) == 0) {
                z12 = z11;
                i21 |= tVar3.g(z12) ? 2048 : 1024;
            }
            if ((i11 & 24576) == 0) {
                i21 |= tVar3.f(closedFloatingPointRange) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
            }
            i13 = i12 & 32;
            if (i13 == 0) {
                i21 |= 196608;
            } else {
                if ((196608 & i11) == 0) {
                    i14 = i5;
                    i21 |= tVar3.d(i14) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
                }
                if ((i12 & 64) != 0) {
                    i21 |= 1572864;
                } else if ((i11 & 1572864) == 0) {
                    i21 |= tVar3.h(null) ? 1048576 : 524288;
                }
                i15 = i12 & 128;
                if (i15 == 0) {
                    if ((12582912 & i11) == 0) {
                        iVar2 = iVar;
                        i21 |= tVar3.f(iVar2) ? 8388608 : 4194304;
                    }
                    if ((100663296 & i11) != 0) {
                        if ((i12 & 256) == 0) {
                            jVarM = jVar;
                            int i23 = tVar3.f(jVarM) ? 67108864 : 33554432;
                            i21 |= i23;
                        } else {
                            jVarM = jVar;
                        }
                        i21 |= i23;
                    } else {
                        jVarM = jVar;
                    }
                    int i24 = i21;
                    if ((i21 & 38347923) == 38347922 || !tVar3.E()) {
                        tVar3.X();
                        i16 = i11 & 1;
                        p1.g1 g1Var = p1.n.f81514a;
                        if (i16 != 0 || tVar3.B()) {
                            if (i22 != 0) {
                                z12 = true;
                            }
                            int i25 = i13 == 0 ? 0 : i5;
                            if (i15 == 0) {
                                tVar3.b0(1864515533);
                                Object objP = tVar3.P();
                                if (objP == g1Var) {
                                    objP = a2.c.d(tVar3);
                                }
                                iVar3 = (i0.i) objP;
                                tVar3.p(false);
                            } else {
                                iVar3 = iVar2;
                            }
                            if ((i12 & 256) == 0) {
                                z13 = true;
                                tVar2 = tVar3;
                                i17 = i25;
                                jVarM = i30.j.m(0L, 0L, 0L, 0L, tVar3, 1023);
                                z14 = z12;
                                i18 = i24 & (-234881025);
                                iVar2 = iVar3;
                            } else {
                                z13 = true;
                                tVar2 = tVar3;
                                i17 = i25;
                                iVar2 = iVar3;
                                z14 = z12;
                                i18 = i24;
                            }
                        } else {
                            tVar3.V();
                            if ((i12 & 256) != 0) {
                                i18 = i24 & (-234881025);
                                i17 = i5;
                                z13 = true;
                            } else {
                                i17 = i5;
                                z13 = true;
                                i18 = i24;
                            }
                            tVar2 = tVar3;
                            z14 = z12;
                        }
                        tVar2.q();
                        if (i17 >= 0) {
                            throw new IllegalArgumentException("steps should be >= 0");
                        }
                        p1.e1 e1VarM = androidx.compose.runtime.d.m(function1, tVar2);
                        tVar2.b0(1864523105);
                        boolean z15 = (i18 & 458752) == 131072 ? z13 : false;
                        Object objP2 = tVar2.P();
                        Object obj = objP2;
                        if (z15 || objP2 == g1Var) {
                            if (i17 == 0) {
                                arrayList = EmptyList.f71733a;
                            } else {
                                int i26 = i17 + 2;
                                arrayList = new ArrayList(i26);
                                for (int i27 = 0; i27 < i26; i27++) {
                                    arrayList.add(Float.valueOf(i27 / (i17 + 1)));
                                }
                            }
                            tVar2.m0(arrayList);
                            obj = arrayList;
                        }
                        List list = (List) obj;
                        tVar2.p(false);
                        z2 z2Var = v1.f58563a;
                        int i28 = i17;
                        b2.t tVarD = androidx.compose.foundation.a.d(j3.n.b(j3.n.b(androidx.compose.foundation.layout.e.m(fg.a.i(tVar, l.f58419d), ny.b.f78674i, ny.b.f78672g, 0.0f, 0.0f, 12), false, new y0(z14, closedFloatingPointRange, i17, list, kotlin.ranges.a.d0(f11, ((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue()), function1, 0)), true, new e0.v1(f11, closedFloatingPointRange, i28)), z14, iVar2);
                        boolean z16 = z14;
                        tVar3 = tVar2;
                        i2.a(tVarD, null, x1.f.d(415852937, new k1(closedFloatingPointRange, f11, list, iVar2, z16, jVarM, e1VarM), tVar2), tVar3, 3072, 6);
                        z12 = z16;
                        i19 = i28;
                    } else {
                        tVar3.V();
                        i19 = i14;
                    }
                    final i0.i iVar4 = iVar2;
                    final j jVar2 = jVarM;
                    t1VarU = tVar3.u();
                    if (t1VarU == null) {
                        t1VarU.f81583d = new Function2() { // from class: gy.x0
                            @Override // kotlin.jvm.functions.Function2
                            public final Object invoke(Object obj2, Object obj3) {
                                ((Integer) obj3).getClass();
                                t1.b(f11, function1, tVar, z12, closedFloatingPointRange, i19, iVar4, jVar2, (p1.o) obj2, p1.a0.l(i11 | 1), i12);
                                return Unit.f71706a;
                            }
                        };
                        return;
                    }
                    return;
                }
                i21 |= 12582912;
                iVar2 = iVar;
                if ((100663296 & i11) != 0) {
                }
                int i242 = i21;
                if ((i21 & 38347923) == 38347922) {
                    tVar3.X();
                    i16 = i11 & 1;
                    p1.g1 g1Var2 = p1.n.f81514a;
                    if (i16 != 0) {
                        if (i22 != 0) {
                        }
                        if (i13 == 0) {
                        }
                        if (i15 == 0) {
                        }
                        if ((i12 & 256) == 0) {
                        }
                        tVar2.q();
                        if (i17 >= 0) {
                        }
                    }
                }
                final i0.i iVar42 = iVar2;
                final j jVar22 = jVarM;
                t1VarU = tVar3.u();
                if (t1VarU == null) {
                }
            }
            i14 = i5;
            if ((i12 & 64) != 0) {
            }
            i15 = i12 & 128;
            if (i15 == 0) {
            }
            iVar2 = iVar;
            if ((100663296 & i11) != 0) {
            }
            int i2422 = i21;
            if ((i21 & 38347923) == 38347922) {
            }
            final i0.i iVar422 = iVar2;
            final j jVar222 = jVarM;
            t1VarU = tVar3.u();
            if (t1VarU == null) {
            }
        }
        z12 = z11;
        if ((i11 & 24576) == 0) {
        }
        i13 = i12 & 32;
        if (i13 == 0) {
        }
        i14 = i5;
        if ((i12 & 64) != 0) {
        }
        i15 = i12 & 128;
        if (i15 == 0) {
        }
        iVar2 = iVar;
        if ((100663296 & i11) != 0) {
        }
        int i24222 = i21;
        if ((i21 & 38347923) == 38347922) {
        }
        final i0.i iVar4222 = iVar2;
        final j jVar2222 = jVarM;
        t1VarU = tVar3.u();
        if (t1VarU == null) {
        }
    }

    public static final void c(boolean z11, float f11, List list, j jVar, float f12, i0.i iVar, b2.t tVar, p1.o oVar, int i5) {
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-42556010);
        int i11 = i5 | (tVar2.g(z11) ? 4 : 2) | (tVar2.c(f11) ? 32 : 16) | (tVar2.h(list) ? 256 : 128) | (tVar2.f(jVar) ? 2048 : 1024) | (tVar2.c(f12) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (tVar2.f(iVar) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX) | (tVar2.f(tVar) ? 1048576 : 524288);
        if ((599187 & i11) == 599186 && tVar2.E()) {
            tVar2.V();
        } else {
            b2.t tVarThen = tVar.then(f58552d);
            z2.r0 r0VarD = k0.p.d(b2.d.f16997a, false);
            int iHashCode = Long.hashCode(tVar2.T);
            p1.n1 n1VarL = tVar2.l();
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
            y3.c cVar = (y3.c) tVar2.j(c3.z1.f19497h);
            float fMo102toPx0680j_4 = cVar.mo102toPx0680j_4(ny.b.f78667b);
            float f13 = ny.b.f78674i;
            float fMo102toPx0680j_42 = cVar.mo102toPx0680j_4(f13) / 2;
            float fMo98toDpu2uoSUM = cVar.mo98toDpu2uoSUM(f12);
            float f14 = ny.b.f78672g;
            float f15 = (fMo98toDpu2uoSUM - f13) * f11;
            b2.t tVarA = androidx.compose.foundation.layout.b.f13968a.a(b2.r.f17024a, b2.d.f17000d);
            int i12 = i11 << 9;
            e(tVarA.then(androidx.compose.foundation.layout.e.f13973c), jVar, z11, f11, list, fMo102toPx0680j_42, fMo102toPx0680j_4, tVar2, ((i11 << 6) & 896) | ((i11 >> 6) & 112) | 3072 | (i12 & 57344) | (i12 & 458752));
            d(tVarA, f15, iVar, jVar, z11, f13, f14, tVar2, ((i11 >> 9) & 896) | 1769472 | (i11 & 7168) | ((i11 << 12) & 57344));
            tVar2.p(true);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c1(z11, f11, list, jVar, f12, iVar, tVar, i5);
        }
    }

    public static final void d(b2.t tVar, float f11, i0.i iVar, j jVar, boolean z11, float f12, float f13, p1.o oVar, int i5) {
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1711749854);
        int i11 = (tVar2.f(tVar) ? 4 : 2) | i5 | (tVar2.c(f11) ? 32 : 16);
        if ((i5 & 384) == 0) {
            i11 |= tVar2.f(iVar) ? 256 : 128;
        }
        int i12 = i11 | (tVar2.f(jVar) ? 2048 : 1024);
        if ((i5 & 24576) == 0) {
            i12 |= tVar2.g(z11) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((599187 & i12) == 599186 && tVar2.E()) {
            tVar2.V();
        } else {
            b2.t tVarN = androidx.compose.foundation.layout.d.n(tVar, f11, 0.0f, 0.0f, 0.0f, 14);
            z2.r0 r0VarD = k0.p.d(b2.d.f16997a, false);
            int iHashCode = Long.hashCode(tVar2.T);
            p1.n1 n1VarL = tVar2.l();
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
            tVar2.b0(1482615741);
            Object objP = tVar2.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = new SnapshotStateList();
                tVar2.m0(objP);
            }
            SnapshotStateList snapshotStateList = (SnapshotStateList) objP;
            tVar2.p(false);
            tVar2.b0(1482619201);
            boolean z12 = (i12 & 896) == 256;
            Object objP2 = tVar2.P();
            if (z12 || objP2 == g1Var) {
                objP2 = new l1(iVar, snapshotStateList, null, 0);
                tVar2.m0(objP2);
            }
            tVar2.p(false);
            p1.o0.f(iVar, (Function2) objP2, tVar2);
            float fMax = Math.max(f13, f12) + f58549a;
            float f14 = !snapshotStateList.isEmpty() ? f58551c : f58550b;
            b2.t tVarA = androidx.compose.foundation.d.a(androidx.compose.foundation.e.a(androidx.compose.foundation.layout.e.q(b2.r.f17024a, f13, f12), iVar, k1.k.a(false, fMax, 0L, tVar2, 6, 4)), iVar);
            if (!z11) {
                f14 = 0;
            }
            s0.g gVar = ny.b.f78673h;
            b2.t tVarD0 = u90.b.d0(tVarA, f14, gVar, 24);
            jVar.getClass();
            tVar2.b0(-1927350036);
            p1.e1 e1VarM = androidx.compose.runtime.d.m(new i2.s(z11 ? jVar.f58370a : jVar.f58371b), tVar2);
            tVar2.p(false);
            i2.b(androidx.compose.foundation.a.b(tVarD0, ((i2.s) e1VarM.getValue()).f61148a, gVar), tVar2);
            tVar2.p(true);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new d1(tVar, f11, iVar, jVar, z11, f12, f13, i5);
        }
    }

    public static final void e(b2.t tVar, j jVar, boolean z11, final float f11, final List list, float f12, final float f13, p1.o oVar, int i5) {
        int i11;
        final float f14;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1266289931);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.f(jVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.g(z11) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.c(0.0f) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar2.c(f11) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.h(list) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            f14 = f12;
            i11 |= tVar2.c(f14) ? 1048576 : 524288;
        } else {
            f14 = f12;
        }
        if ((12582912 & i5) == 0) {
            i11 |= tVar2.c(f13) ? 8388608 : 4194304;
        }
        int i12 = i11;
        if ((4793491 & i12) == 4793490 && tVar2.E()) {
            tVar2.V();
        } else {
            final p1.e1 e1VarB = jVar.b(z11, false, tVar2);
            final p1.e1 e1VarB2 = jVar.b(z11, true, tVar2);
            final p1.e1 e1VarA = jVar.a(z11, false, tVar2);
            final p1.e1 e1VarA2 = jVar.a(z11, true, tVar2);
            tVar2.b0(1528249119);
            boolean zF = ((3670016 & i12) == 1048576) | tVar2.f(e1VarB) | ((29360128 & i12) == 8388608) | ((57344 & i12) == 16384) | ((i12 & 7168) == 2048) | tVar2.f(e1VarB2) | tVar2.h(list) | tVar2.f(e1VarA) | tVar2.f(e1VarA2);
            Object objP = tVar2.P();
            if (zF || objP == p1.n.f81514a) {
                Function1 function1 = new Function1() { // from class: gy.e1
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj) {
                        long j11;
                        long j12;
                        k2.f fVar = (k2.f) obj;
                        boolean z12 = fVar.getLayoutDirection() == y3.n.f96613b;
                        float fIntBitsToFloat = Float.intBitsToFloat((int) (fVar.mo93getCenterF1C5BW0() & 4294967295L));
                        long jFloatToRawIntBits = (Float.floatToRawIntBits(r4) << 32) | (Float.floatToRawIntBits(fIntBitsToFloat) & 4294967295L);
                        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() >> 32)) - f14;
                        long jFloatToRawIntBits2 = (Float.floatToRawIntBits(Float.intBitsToFloat((int) (fVar.mo93getCenterF1C5BW0() & 4294967295L))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat2) << 32);
                        if (z12) {
                            j12 = jFloatToRawIntBits;
                            j11 = jFloatToRawIntBits2;
                        } else {
                            j11 = jFloatToRawIntBits;
                            j12 = j11;
                        }
                        if (!z12) {
                            j12 = jFloatToRawIntBits2;
                        }
                        long j13 = ((i2.s) e1VarB.getValue()).f61148a;
                        float f15 = f13;
                        fVar.mo85drawLineNGM6Ib0(j13, j11, j12, f15, (480 & 16) != 0 ? 0 : 1, (480 & 32) != 0 ? null : null, 1.0f, null, 3);
                        int i13 = (int) (j11 >> 32);
                        float fIntBitsToFloat3 = Float.intBitsToFloat(i13);
                        int i14 = (int) (j12 >> 32);
                        float fIntBitsToFloat4 = Float.intBitsToFloat(i14) - Float.intBitsToFloat(i13);
                        float f16 = f11;
                        float fIntBitsToFloat5 = ((Float.intBitsToFloat(i14) - Float.intBitsToFloat(i13)) * 0.0f) + Float.intBitsToFloat(i13);
                        long j14 = j11;
                        long j15 = j12;
                        fVar.mo85drawLineNGM6Ib0(((i2.s) e1VarB2.getValue()).f61148a, (Float.floatToRawIntBits(Float.intBitsToFloat((int) (fVar.mo93getCenterF1C5BW0() & 4294967295L))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat5) << 32), (Float.floatToRawIntBits((fIntBitsToFloat4 * f16) + fIntBitsToFloat3) << 32) | (Float.floatToRawIntBits(Float.intBitsToFloat((int) (fVar.mo93getCenterF1C5BW0() & 4294967295L))) & 4294967295L), f15, (480 & 16) != 0 ? 0 : 1, (480 & 32) != 0 ? null : null, 1.0f, null, 3);
                        List list2 = list;
                        LinkedHashMap linkedHashMap = new LinkedHashMap();
                        for (Object obj2 : list2) {
                            float fFloatValue = ((Number) obj2).floatValue();
                            Boolean boolValueOf = Boolean.valueOf(fFloatValue > f16 || fFloatValue < 0.0f);
                            Object arrayList = linkedHashMap.get(boolValueOf);
                            if (arrayList == null) {
                                arrayList = new ArrayList();
                                linkedHashMap.put(boolValueOf, arrayList);
                            }
                            ((List) arrayList).add(obj2);
                        }
                        for (Map.Entry entry : linkedHashMap.entrySet()) {
                            boolean zBooleanValue = ((Boolean) entry.getKey()).booleanValue();
                            List list3 = (List) entry.getValue();
                            ArrayList arrayList2 = new ArrayList(b70.c.u0(list3, 10));
                            Iterator it = list3.iterator();
                            while (it.hasNext()) {
                                float fIntBitsToFloat6 = Float.intBitsToFloat((int) (ab.e0.I(((Number) it.next()).floatValue(), j14, j15) >> 32));
                                arrayList2.add(new h2.b((Float.floatToRawIntBits(Float.intBitsToFloat((int) (fVar.mo93getCenterF1C5BW0() & 4294967295L))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat6) << 32)));
                            }
                            float f17 = f15;
                            fVar.mo88drawPointsF8ZwMP8(arrayList2, 0, ((i2.s) (zBooleanValue ? e1VarA : e1VarA2).getValue()).f61148a, f17, 1, null, 1.0f, null, 3);
                            f15 = f17;
                        }
                        return Unit.f71706a;
                    }
                };
                tVar2.m0(function1);
                objP = function1;
            }
            tVar2.p(false);
            ic.b.g(i12 & 14, tVar, (Function1) objP, tVar2);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new d1(tVar, jVar, z11, f11, list, f12, f13, i5);
        }
    }

    public static final float f(float f11, float f12, float f13) {
        return (f13 * f12) + ((1.0f - f13) * f11);
    }
}
