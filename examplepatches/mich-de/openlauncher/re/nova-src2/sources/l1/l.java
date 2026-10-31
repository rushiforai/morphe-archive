package l1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class l {

    /* renamed from: a, reason: collision with root package name */
    public static final float f73568a = 280;

    /* renamed from: b, reason: collision with root package name */
    public static final float f73569b = 560;

    /* renamed from: c, reason: collision with root package name */
    public static final float f73570c = 8;

    /* renamed from: d, reason: collision with root package name */
    public static final float f73571d = 12;

    /* renamed from: e, reason: collision with root package name */
    public static final k0.p1 f73572e;

    /* renamed from: f, reason: collision with root package name */
    public static final k0.p1 f73573f;

    /* renamed from: g, reason: collision with root package name */
    public static final k0.p1 f73574g;

    static {
        float f11 = 24;
        f73572e = new k0.p1(f11, f11, f11, f11);
        float f12 = 16;
        androidx.compose.foundation.layout.d.c(0.0f, 0.0f, f12, 7);
        f73573f = androidx.compose.foundation.layout.d.c(0.0f, 0.0f, f12, 7);
        f73574g = androidx.compose.foundation.layout.d.c(0.0f, 0.0f, f11, 7);
    }

    public static final void a(x1.e eVar, b2.t tVar, Function2 function2, Function2 function22, i2.v0 v0Var, long j11, float f11, long j12, long j13, long j14, long j15, p1.o oVar, int i5) {
        b2.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(1522575799);
        int i11 = i5 | 48 | (tVar3.h(null) ? 256 : 128) | (tVar3.h(function2) ? 2048 : 1024) | (tVar3.h(function22) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (tVar3.f(v0Var) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX) | (tVar3.e(j11) ? 1048576 : 524288) | (tVar3.c(f11) ? 8388608 : 4194304) | (tVar3.e(j12) ? 67108864 : 33554432) | (tVar3.e(j13) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456);
        int i12 = (tVar3.e(j14) ? (char) 4 : (char) 2) | (tVar3.e(j15) ? ' ' : (char) 16);
        if ((i11 & 306783379) == 306783378 && (i12 & 19) == 18 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
        } else {
            x1.e eVarD = x1.f.d(-2126308228, new c(function2, function22, j13, j14, j15, j12, eVar), tVar3);
            int i13 = i11 >> 12;
            int i14 = (i13 & 896) | (i13 & 112) | 12582918 | ((i11 >> 9) & 57344);
            b2.r rVar = b2.r.f17024a;
            t7.a(rVar, v0Var, j11, 0L, f11, 0.0f, null, eVarD, tVar3, i14, 104);
            tVar2 = rVar;
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new d(eVar, tVar2, function2, function22, v0Var, j11, f11, j12, j13, j14, j15, i5);
        }
    }

    public static final void b(x1.e eVar, p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(586821353);
        if ((i5 & 147) == 146 && tVar.E()) {
            tVar.V();
        } else {
            Object objP = tVar.P();
            if (objP == p1.n.f81514a) {
                objP = new f();
                tVar.m0(objP);
            }
            z2.r0 r0Var = (z2.r0) objP;
            int iHashCode = Long.hashCode(tVar.T);
            p1.n1 n1VarL = tVar.l();
            b2.t tVarI = fg.a.I(b2.r.f17024a, tVar);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar.f0();
            if (tVar.S) {
                tVar.k(function0);
            } else {
                tVar.p0();
            }
            p1.a0.j(r0Var, b3.k.f17275g, tVar);
            p1.a0.j(n1VarL, b3.k.f17274f, tVar);
            b3.i iVar = b3.k.f17278j;
            if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar, iHashCode, iVar);
            }
            p1.a0.j(tVarI, b3.k.f17272d, tVar);
            h6.c1.y(6, eVar, tVar, true);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new g(eVar, i5);
        }
    }

    public static final void c(Function0 function0, x1.e eVar, b2.t tVar, Function2 function2, Function2 function22, Function2 function23, i2.v0 v0Var, long j11, long j12, long j13, long j14, float f11, c4.y yVar, p1.o oVar, int i5, int i11) {
        int i12;
        x1.e eVar2;
        Function2 function24;
        int i13;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-919826268);
        if ((i5 & 6) == 0) {
            i12 = (tVar2.h(function0) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            eVar2 = eVar;
            i12 |= tVar2.h(eVar2) ? 32 : 16;
        } else {
            eVar2 = eVar;
        }
        if ((i5 & 384) == 0) {
            i12 |= tVar2.f(tVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            function24 = function2;
            i12 |= tVar2.h(function24) ? 2048 : 1024;
        } else {
            function24 = function2;
        }
        if ((i5 & 24576) == 0) {
            i12 |= tVar2.h(null) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i12 |= tVar2.h(function22) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((i5 & 1572864) == 0) {
            i12 |= tVar2.h(function23) ? 1048576 : 524288;
        }
        if ((i5 & 12582912) == 0) {
            i12 |= tVar2.f(v0Var) ? 8388608 : 4194304;
        }
        if ((i5 & 100663296) == 0) {
            i12 |= tVar2.e(j11) ? 67108864 : 33554432;
        }
        if ((i5 & 805306368) == 0) {
            i12 |= tVar2.e(j12) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
        }
        if ((i11 & 6) == 0) {
            i13 = i11 | (tVar2.e(j13) ? 4 : 2);
        } else {
            i13 = i11;
        }
        if ((i11 & 48) == 0) {
            i13 |= tVar2.e(j14) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            i13 |= tVar2.c(f11) ? 256 : 128;
        }
        if ((i11 & 3072) == 0) {
            i13 |= tVar2.f(yVar) ? 2048 : 1024;
        }
        int i14 = i13;
        if ((i12 & 306783379) == 306783378 && (i14 & 1171) == 1170 && tVar2.E()) {
            tVar2.V();
        } else {
            d(function0, tVar, yVar, x1.f.d(-1852840226, new i(function22, function23, v0Var, j11, f11, j12, j13, j14, function24, eVar2), tVar2), tVar2, (i12 & 14) | 3072 | ((i12 >> 3) & 112) | ((i14 >> 3) & 896));
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new j(function0, eVar, tVar, function2, function22, function23, v0Var, j11, j12, j13, j14, f11, yVar, i5, i11);
        }
    }

    public static final void d(Function0 function0, b2.t tVar, c4.y yVar, x1.e eVar, p1.o oVar, int i5) {
        int i11;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1922902937);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.h(function0) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.f(tVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.f(yVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.h(eVar) ? 2048 : 1024;
        }
        if ((i11 & 1171) == 1170 && tVar2.E()) {
            tVar2.V();
        } else {
            p7.u.g(function0, yVar, x1.f.d(905289008, new c4.n(2, tVar, eVar), tVar2), tVar2, ((i11 >> 3) & 112) | (i11 & 14) | 384);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new k(function0, tVar, yVar, eVar, i5, 0);
        }
    }
}
