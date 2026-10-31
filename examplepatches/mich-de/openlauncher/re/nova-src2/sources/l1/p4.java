package l1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public final class p4 {

    /* renamed from: a, reason: collision with root package name */
    public static final p4 f73779a = new p4();

    /* renamed from: b, reason: collision with root package name */
    public static final float f73780b = 56;

    /* renamed from: c, reason: collision with root package name */
    public static final float f73781c = 280;

    /* renamed from: d, reason: collision with root package name */
    public static final float f73782d = 1;

    /* renamed from: e, reason: collision with root package name */
    public static final float f73783e = 2;

    public static q8 c(p1.o oVar) {
        p1.t tVar = (p1.t) oVar;
        d1 d1Var = (d1) tVar.j(g1.f73330a);
        q8 q8Var = d1Var.X;
        tVar.b0(1540400102);
        if (q8Var == null) {
            long jD = g1.d(d1Var, 18);
            long jD2 = g1.d(d1Var, 18);
            long jB = i2.s.b(0.38f, g1.d(d1Var, 18));
            long jD3 = g1.d(d1Var, 18);
            long j11 = i2.s.f61146l;
            q8 q8Var2 = new q8(jD, jD2, jB, jD3, j11, j11, j11, j11, g1.d(d1Var, 26), g1.d(d1Var, 2), (e1.g1) tVar.j(e1.h1.f51306a), g1.d(d1Var, 26), g1.d(d1Var, 24), i2.s.b(0.12f, g1.d(d1Var, 18)), g1.d(d1Var, 2), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 19), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 2), g1.d(d1Var, 26), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 2), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 19), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 2), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 19)), g1.d(d1Var, 19), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 19)), g1.d(d1Var, 19));
            d1Var.X = q8Var2;
            q8Var = q8Var2;
        }
        tVar.p(false);
        return q8Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00e2  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x00ec  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0195  */
    /* JADX WARN: Removed duplicated region for block: B:97:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(boolean z11, boolean z12, i0.i iVar, b2.t tVar, q8 q8Var, i2.v0 v0Var, float f11, float f12, p1.o oVar, int i5, int i11) {
        b2.t tVar2;
        int i12;
        float f13;
        float f14;
        float f15;
        b2.t tVar3;
        float f16;
        float f17;
        float f18;
        float f19;
        p1.t1 t1VarU;
        q8 q8Var2 = q8Var;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(1035477640);
        int i13 = (tVar4.g(z11) ? 4 : 2) | i5 | (tVar4.g(z12) ? 32 : 16) | (tVar4.f(iVar) ? 256 : 128);
        int i14 = i11 & 8;
        if (i14 == 0) {
            if ((i5 & 3072) == 0) {
                tVar2 = tVar;
                i13 |= tVar4.f(tVar2) ? 2048 : 1024;
            }
            i12 = i13 | (!tVar4.f(q8Var2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (!tVar4.f(v0Var) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX);
            if ((1572864 & i5) != 0) {
                if ((i11 & 64) == 0) {
                    f13 = f11;
                    int i15 = tVar4.c(f13) ? 1048576 : 524288;
                    i12 |= i15;
                } else {
                    f13 = f11;
                }
                i12 |= i15;
            } else {
                f13 = f11;
            }
            if ((12582912 & i5) != 0) {
                if ((i11 & 128) == 0) {
                    f14 = f12;
                    int i16 = tVar4.c(f14) ? 8388608 : 4194304;
                    i12 |= i16;
                } else {
                    f14 = f12;
                }
                i12 |= i16;
            } else {
                f14 = f12;
            }
            if ((38347923 & i12) == 38347922 || !tVar4.E()) {
                tVar4.X();
                if ((i5 & 1) != 0 || tVar4.B()) {
                    b2.t tVar5 = i14 == 0 ? b2.r.f17024a : tVar2;
                    if ((i11 & 64) == 0) {
                        i12 &= -3670017;
                        f15 = f73783e;
                    } else {
                        f15 = f13;
                    }
                    if ((i11 & 128) == 0) {
                        i12 &= -29360129;
                        tVar3 = tVar5;
                        f16 = f15;
                        f17 = f73782d;
                    } else {
                        float f21 = f14;
                        tVar3 = tVar5;
                        f16 = f15;
                        f17 = f21;
                    }
                } else {
                    tVar4.V();
                    if ((i11 & 64) != 0) {
                        i12 &= -3670017;
                    }
                    if ((i11 & 128) != 0) {
                        i12 &= -29360129;
                    }
                    float f22 = f14;
                    tVar3 = tVar2;
                    f17 = f22;
                    f16 = f13;
                }
                tVar4.q();
                int i17 = i12 >> 6;
                boolean zBooleanValue = ((Boolean) cw.l2.o(iVar, tVar4, i17 & 14).getValue()).booleanValue();
                p1.e1 e1VarD = m1.r0.d(z11, z12, zBooleanValue, q8Var2, f16, f17, tVar4, (i17 & 458752) | ((i12 >> 3) & 7168) | (i12 & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) | (57344 & i17));
                q8Var2 = q8Var2;
                tVar4 = tVar4;
                float f23 = f16;
                float f24 = f17;
                p1.y2 y2VarA = b0.n1.a(z11 ? q8Var2.f73857g : z12 ? q8Var2.f73858h : zBooleanValue ? q8Var2.f73855e : q8Var2.f73856f, c0.f.i(PerAppFeatureCatalog.MAX_TOOLS, 0, null, 6), tVar4, 48, 12);
                e0.u uVar = (e0.u) e1VarD.getValue();
                k0.p.a(androidx.compose.ui.draw.a.b(x7.f.p(tVar3, uVar.b(), uVar.a(), v0Var), new b0.e(17, v0Var, new u8(new m4(0, 0, p1.y2.class, y2VarA, "value", "getValue()Ljava/lang/Object;")))), tVar4, 0);
                tVar2 = tVar3;
                f18 = f23;
                f19 = f24;
            } else {
                tVar4.V();
                f18 = f13;
                f19 = f14;
            }
            t1VarU = tVar4.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new n4(this, z11, z12, iVar, tVar2, q8Var2, v0Var, f18, f19, i5, i11);
                return;
            }
            return;
        }
        i13 |= 3072;
        tVar2 = tVar;
        i12 = i13 | (!tVar4.f(q8Var2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (!tVar4.f(v0Var) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX);
        if ((1572864 & i5) != 0) {
        }
        if ((12582912 & i5) != 0) {
        }
        if ((38347923 & i12) == 38347922) {
            tVar4.X();
            if ((i5 & 1) != 0) {
                if (i14 == 0) {
                }
                if ((i11 & 64) == 0) {
                }
                if ((i11 & 128) == 0) {
                }
                tVar4.q();
                int i172 = i12 >> 6;
                boolean zBooleanValue2 = ((Boolean) cw.l2.o(iVar, tVar4, i172 & 14).getValue()).booleanValue();
                p1.e1 e1VarD2 = m1.r0.d(z11, z12, zBooleanValue2, q8Var2, f16, f17, tVar4, (i172 & 458752) | ((i12 >> 3) & 7168) | (i12 & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) | (57344 & i172));
                q8Var2 = q8Var2;
                tVar4 = tVar4;
                float f232 = f16;
                float f242 = f17;
                p1.y2 y2VarA2 = b0.n1.a(z11 ? q8Var2.f73857g : z12 ? q8Var2.f73858h : zBooleanValue2 ? q8Var2.f73855e : q8Var2.f73856f, c0.f.i(PerAppFeatureCatalog.MAX_TOOLS, 0, null, 6), tVar4, 48, 12);
                e0.u uVar2 = (e0.u) e1VarD2.getValue();
                k0.p.a(androidx.compose.ui.draw.a.b(x7.f.p(tVar3, uVar2.b(), uVar2.a(), v0Var), new b0.e(17, v0Var, new u8(new m4(0, 0, p1.y2.class, y2VarA2, "value", "getValue()Ljava/lang/Object;")))), tVar4, 0);
                tVar2 = tVar3;
                f18 = f232;
                f19 = f242;
            }
        }
        t1VarU = tVar4.u();
        if (t1VarU == null) {
        }
    }

    public final void b(String str, Function2 function2, boolean z11, boolean z12, r3.i0 i0Var, i0.i iVar, boolean z13, Function2 function22, Function2 function23, Function2 function24, Function2 function25, q8 q8Var, k0.o1 o1Var, x1.e eVar, p1.o oVar, int i5) {
        String str2;
        int i11;
        Function2 function26;
        boolean z14;
        boolean z15;
        r3.i0 i0Var2;
        k0.o1 p1Var;
        int i12;
        p1.t tVar;
        k0.o1 o1Var2;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-350442135);
        if ((i5 & 6) == 0) {
            str2 = str;
            i11 = (tVar2.f(str2) ? 4 : 2) | i5;
        } else {
            str2 = str;
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            function26 = function2;
            i11 |= tVar2.h(function26) ? 32 : 16;
        } else {
            function26 = function2;
        }
        if ((i5 & 384) == 0) {
            z14 = z11;
            i11 |= tVar2.g(z14) ? 256 : 128;
        } else {
            z14 = z11;
        }
        if ((i5 & 3072) == 0) {
            z15 = z12;
            i11 |= tVar2.g(z15) ? 2048 : 1024;
        } else {
            z15 = z12;
        }
        int i13 = i5 & 24576;
        int i14 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
        if (i13 == 0) {
            i0Var2 = i0Var;
            i11 |= tVar2.f(i0Var2) ? 16384 : 8192;
        } else {
            i0Var2 = i0Var;
        }
        if ((i5 & 196608) == 0) {
            i11 |= tVar2.f(iVar) ? SQLiteDatabase.OPEN_SHAREDCACHE : 65536;
        }
        if ((i5 & 1572864) == 0) {
            i11 |= tVar2.g(z13) ? 1048576 : 524288;
        }
        if ((i5 & 12582912) == 0) {
            i11 |= tVar2.h(function22) ? 8388608 : 4194304;
        }
        if ((i5 & 100663296) == 0) {
            i11 |= tVar2.h(function23) ? 67108864 : 33554432;
        }
        if ((i5 & 805306368) == 0) {
            i11 |= tVar2.h(function24) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
        }
        int i15 = 14155776 | (tVar2.h(function25) ? 4 : 2) | (tVar2.h(null) ? 32 : 16) | (tVar2.h(null) ? 256 : 128) | (tVar2.h(null) ? 2048 : 1024);
        if (tVar2.f(q8Var)) {
            i14 = 16384;
        }
        int i16 = i15 | i14 | SQLiteDatabase.OPEN_FULLMUTEX;
        if ((306783379 & i11) == 306783378 && (4793491 & i16) == 4793490 && tVar2.E()) {
            tVar2.V();
            o1Var2 = o1Var;
            tVar = tVar2;
        } else {
            tVar2.X();
            if ((i5 & 1) == 0 || tVar2.B()) {
                float f11 = m1.r0.f75747b;
                p1Var = new k0.p1(f11, f11, f11, f11);
                i12 = i16 & (-458753);
            } else {
                tVar2.V();
                i12 = i16 & (-458753);
                p1Var = o1Var;
            }
            tVar2.q();
            int i17 = i11 << 3;
            int i18 = i12;
            int i19 = i11 >> 3;
            tVar = tVar2;
            int i21 = (i19 & 7168) | (i17 & 112) | 6 | (i17 & 896);
            int i22 = i11 >> 9;
            int i23 = i18 << 21;
            int i24 = (i19 & 57344) | ((i18 >> 9) & 14) | ((i11 >> 6) & 112) | (i11 & 896) | (i22 & 7168) | ((i18 << 6) & 3670016) | 12582912;
            k0.o1 o1Var3 = p1Var;
            m1.r0.a(m1.s0.f75760b, str2, function26, i0Var2, function22, function23, function24, function25, z15, z14, z13, iVar, o1Var3, q8Var, eVar, tVar, i21 | (i22 & 57344) | (i22 & 458752) | (i22 & 3670016) | (i23 & 29360128) | (i23 & 234881024) | (i23 & 1879048192), i24);
            o1Var2 = o1Var3;
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new o4(this, str, function2, z11, z12, i0Var, iVar, z13, function22, function23, function24, function25, q8Var, o1Var2, eVar, i5);
        }
    }
}
