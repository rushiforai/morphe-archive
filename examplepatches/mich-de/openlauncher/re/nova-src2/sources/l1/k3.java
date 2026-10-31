package l1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class k3 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f73530a;

    /* renamed from: b, reason: collision with root package name */
    public static final float f73531b;

    /* renamed from: c, reason: collision with root package name */
    public static final float f73532c = 12;

    /* renamed from: d, reason: collision with root package name */
    public static final float f73533d = 8;

    /* renamed from: e, reason: collision with root package name */
    public static final float f73534e = 112;

    /* renamed from: f, reason: collision with root package name */
    public static final float f73535f = 280;

    static {
        float f11 = 48;
        f73530a = f11;
        f73531b = f11;
    }

    public static final void a(b2.t tVar, c0.r0 r0Var, p1.e1 e1Var, e0.a2 a2Var, i2.v0 v0Var, long j11, float f11, float f12, x1.e eVar, p1.o oVar, int i5) {
        Float f13;
        p1.s2 s2Var;
        boolean z11;
        c0.h2 h2VarI;
        boolean z12;
        int i11;
        p1.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-151448888);
        int i12 = i5 | (tVar3.f(tVar) ? 4 : 2) | (tVar3.f(r0Var) ? 32 : 16) | (tVar3.f(a2Var) ? 2048 : 1024) | (tVar3.f(v0Var) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (tVar3.e(j11) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX) | (tVar3.c(f11) ? 1048576 : 524288) | (tVar3.c(f12) ? 8388608 : 4194304) | (tVar3.f(null) ? 67108864 : 33554432) | (tVar3.h(eVar) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456);
        if ((i12 & 306783379) == 306783378 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar3;
        } else {
            c0.c2 c2VarD = c0.f2.d(r0Var, "DropDownMenu", tVar3, (((i12 >> 3) & 14) | 48) & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
            FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
            c0.i2 i2Var = c0.f.f18784i;
            c0.g2 g2Var = c2VarD.f18730a;
            p1.e1 e1Var2 = c2VarD.f18733d;
            boolean zBooleanValue = ((Boolean) g2Var.c()).booleanValue();
            tVar3.b0(2139028452);
            float f14 = zBooleanValue ? 1.0f : 0.8f;
            tVar3.p(false);
            Float fValueOf = Float.valueOf(f14);
            p1.s2 s2Var2 = (p1.s2) e1Var2;
            boolean zBooleanValue2 = ((Boolean) s2Var2.getValue()).booleanValue();
            tVar3.b0(2139028452);
            float f15 = zBooleanValue2 ? 1.0f : 0.8f;
            tVar3.p(false);
            Float fValueOf2 = Float.valueOf(f15);
            c0.w1 w1VarF = c2VarD.f();
            tVar3.b0(1033023423);
            Boolean bool = Boolean.FALSE;
            Boolean bool2 = Boolean.TRUE;
            if (w1VarF.c(bool, bool2)) {
                f13 = fValueOf2;
                s2Var = s2Var2;
                h2VarI = c0.f.i(120, 0, c0.b0.f18711b, 2);
                z12 = false;
                z11 = true;
            } else {
                f13 = fValueOf2;
                s2Var = s2Var2;
                z11 = true;
                h2VarI = c0.f.i(1, 74, null, 4);
                z12 = false;
            }
            tVar3.p(z12);
            c0.y1 y1VarC = c0.f2.c(c2VarD, fValueOf, f13, h2VarI, i2Var, tVar3, 0);
            boolean zBooleanValue3 = ((Boolean) c2VarD.f18730a.c()).booleanValue();
            tVar3.b0(-249413128);
            float f16 = zBooleanValue3 ? 1.0f : 0.0f;
            tVar3.p(false);
            Float fValueOf3 = Float.valueOf(f16);
            boolean zBooleanValue4 = ((Boolean) s2Var.getValue()).booleanValue();
            tVar3.b0(-249413128);
            float f17 = zBooleanValue4 ? 1.0f : 0.0f;
            tVar3.p(false);
            Float fValueOf4 = Float.valueOf(f17);
            c0.w1 w1VarF2 = c2VarD.f();
            tVar3.b0(-1355418157);
            c0.h2 h2VarI2 = w1VarF2.c(bool, bool2) ? c0.f.i(30, 0, null, 6) : c0.f.i(75, 0, null, 6);
            tVar3.p(false);
            c0.y1 y1VarC2 = c0.f2.c(c2VarD, fValueOf3, fValueOf4, h2VarI2, i2Var, tVar3, 0);
            boolean zBooleanValue5 = ((Boolean) tVar3.j(c3.p2.f19399a)).booleanValue();
            boolean zG = tVar3.g(zBooleanValue5) | tVar3.f(y1VarC) | ((i12 & 112) != 32 ? false : z11) | tVar3.f(y1VarC2);
            Object objP = tVar3.P();
            if (zG || objP == p1.n.f81514a) {
                i11 = 0;
                i3 i3Var = new i3(zBooleanValue5, r0Var, e1Var, y1VarC, y1VarC2);
                tVar3.m0(i3Var);
                objP = i3Var;
            } else {
                i11 = 0;
            }
            int i13 = i12 >> 9;
            int i14 = i12 >> 6;
            t7.a(androidx.compose.ui.graphics.a.a(b2.r.f17024a, (Function1) objP), v0Var, j11, 0L, f11, f12, null, x1.f.d(1573559053, new j3(i11, tVar, a2Var, eVar), tVar3), tVar3, (i13 & 896) | (i13 & 112) | 12582912 | (57344 & i14) | (458752 & i14) | (i14 & 3670016), 8);
            tVar2 = tVar3;
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new n(tVar, r0Var, e1Var, a2Var, v0Var, j11, f11, f12, eVar, i5);
        }
    }

    public static final void b(x1.e eVar, Function0 function0, b2.t tVar, boolean z11, h3 h3Var, k0.o1 o1Var, p1.o oVar, int i5) {
        int i11;
        b2.t tVar2;
        int i12;
        p1.t tVar3;
        boolean z12 = z11;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(-1564716777);
        if ((i5 & 6) == 0) {
            i11 = (tVar4.h(eVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar4.h(function0) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            tVar2 = tVar;
            i11 |= tVar4.f(tVar2) ? 256 : 128;
        } else {
            tVar2 = tVar;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar4.h(null) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar4.h(null) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar4.g(z12) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i11 |= tVar4.f(h3Var) ? 1048576 : 524288;
        }
        if ((12582912 & i5) == 0) {
            i11 |= tVar4.f(o1Var) ? 8388608 : 4194304;
        }
        int i13 = i11;
        if ((100663296 & i5) == 0) {
            i12 = (tVar4.f(null) ? 67108864 : 33554432) | i13;
        } else {
            i12 = i13;
        }
        if ((i12 & 38347923) == 38347922 && tVar4.E()) {
            tVar4.V();
            tVar3 = tVar4;
        } else {
            tVar3 = tVar4;
            b2.t tVarB = androidx.compose.foundation.c.b(tVar2, null, q5.a(true, 0.0f, 0L, tVar4, 6, 6), z12, null, null, function0, 24);
            z12 = z12;
            b2.t tVarI = androidx.compose.foundation.layout.d.i(androidx.compose.foundation.layout.e.s(androidx.compose.foundation.layout.e.e(tVarB, 1.0f), f73534e, f73535f, 0.0f, 8), o1Var);
            k0.x1 x1VarA = k0.v1.a(k0.k.f70655a, b2.d.f17007k, tVar3, 48);
            int iHashCode = Long.hashCode(tVar3.T);
            p1.n1 n1VarL = tVar3.l();
            b2.t tVarI2 = fg.a.I(tVarI, tVar3);
            b3.l.Po.getClass();
            Function0 function02 = b3.k.f17270b;
            tVar3.f0();
            if (tVar3.S) {
                tVar3.k(function02);
            } else {
                tVar3.p0();
            }
            p1.a0.j(x1VarA, b3.k.f17275g, tVar3);
            p1.a0.j(n1VarL, b3.k.f17274f, tVar3);
            b3.i iVar = b3.k.f17278j;
            if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar3, iHashCode, iVar);
            }
            p1.a0.j(tVarI2, b3.k.f17272d, tVar3);
            g9.a(((p9) tVar3.j(q9.f73875a)).f73810m, x1.f.d(1065051884, new d2(h3Var, z12, eVar), tVar3), tVar3, 48);
            tVar3.p(true);
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new p(eVar, function0, tVar, z12, h3Var, o1Var, i5, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final long c(y3.l lVar, y3.l lVar2) {
        float fMin;
        int i5 = lVar2.f96607a;
        int i11 = lVar2.f96610d;
        int i12 = lVar2.f96607a;
        int i13 = lVar2.f96609c;
        int i14 = lVar2.f96608b;
        int i15 = lVar.f96609c;
        int i16 = lVar.f96608b;
        int i17 = lVar.f96610d;
        int i18 = lVar.f96607a;
        float fMin2 = 1.0f;
        if (i5 < i15) {
            if (i13 <= i18) {
                fMin = 1.0f;
            } else if (lVar2.h() == 0) {
                fMin = 0.0f;
            } else {
                fMin = (((Math.min(lVar.f96609c, i13) + Math.max(i18, i12)) / 2) - i12) / lVar2.h();
            }
        }
        if (i14 < i17) {
            if (i11 > i16) {
                if (lVar2.c() == 0) {
                    fMin2 = 0.0f;
                } else {
                    fMin2 = (((Math.min(i17, i11) + Math.max(i16, i14)) / 2) - i14) / lVar2.c();
                }
            }
        }
        return i2.r0.f(fMin, fMin2);
    }
}
