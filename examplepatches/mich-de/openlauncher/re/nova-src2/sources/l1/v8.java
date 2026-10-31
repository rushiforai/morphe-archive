package l1;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public final class v8 {

    /* renamed from: a, reason: collision with root package name */
    public static final v8 f74139a = new v8();

    /* renamed from: b, reason: collision with root package name */
    public static final float f74140b = 56;

    /* renamed from: c, reason: collision with root package name */
    public static final float f74141c = 280;

    /* renamed from: d, reason: collision with root package name */
    public static final float f74142d = 1;

    /* renamed from: e, reason: collision with root package name */
    public static final float f74143e = 2;

    public static q8 c(p1.o oVar, int i5) {
        return e((d1) ((p1.t) oVar).j(g1.f73330a), oVar);
    }

    public static q8 d(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, long j21, e1.g1 g1Var, long j22, long j23, long j24, long j25, long j26, long j27, long j28, long j29, long j31, long j32, long j33, long j34, long j35, long j36, long j37, long j38, long j39, long j40, long j41, long j42, long j43, long j44, long j45, long j46, long j47, long j48, long j49, long j51, p1.o oVar, int i5, int i11, int i12) {
        long j52;
        long j53;
        long j54 = (i11 & 4) != 0 ? i2.s.f61147m : j13;
        long j55 = (i11 & 8) != 0 ? i2.s.f61147m : j14;
        long j56 = (i11 & 128) != 0 ? i2.s.f61147m : j18;
        long j57 = (i11 & 256) != 0 ? i2.s.f61147m : j19;
        long j58 = (i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? i2.s.f61147m : j21;
        e1.g1 g1Var2 = (i11 & 1024) != 0 ? null : g1Var;
        long j59 = (i11 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? i2.s.f61147m : j24;
        long j61 = j54;
        long j62 = (i11 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? i2.s.f61147m : j25;
        long j63 = (i11 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? i2.s.f61147m : j26;
        long j64 = (i11 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? i2.s.f61147m : j27;
        long j65 = (i11 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? i2.s.f61147m : j28;
        long j66 = (i11 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? i2.s.f61147m : j29;
        long j67 = (i11 & 524288) != 0 ? i2.s.f61147m : j31;
        long j68 = (i11 & 1048576) != 0 ? i2.s.f61147m : j32;
        long j69 = (i11 & 2097152) != 0 ? i2.s.f61147m : j33;
        long j71 = (i11 & 4194304) != 0 ? i2.s.f61147m : j34;
        long j72 = (i11 & 8388608) != 0 ? i2.s.f61147m : j35;
        long j73 = (i11 & 16777216) != 0 ? i2.s.f61147m : j36;
        long j74 = (i11 & 33554432) != 0 ? i2.s.f61147m : j37;
        long j75 = (i11 & 67108864) != 0 ? i2.s.f61147m : j38;
        long j76 = (i11 & 134217728) != 0 ? i2.s.f61147m : j39;
        long j77 = (i11 & 268435456) != 0 ? i2.s.f61147m : j40;
        long j78 = (i11 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 ? i2.s.f61147m : j41;
        long j79 = (i11 & 1073741824) != 0 ? i2.s.f61147m : j42;
        long j81 = i2.s.f61147m;
        long j82 = (i12 & 16) != 0 ? j81 : j43;
        long j83 = (i12 & 32) != 0 ? j81 : j44;
        long j84 = (i12 & 64) != 0 ? j81 : j45;
        long j85 = (i12 & 128) != 0 ? j81 : j46;
        long j86 = (i12 & 256) != 0 ? j81 : j47;
        long j87 = (i12 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? j81 : j48;
        long j88 = (i12 & 1024) != 0 ? j81 : j49;
        long j89 = (i12 & 2048) != 0 ? j81 : j51;
        q8 q8VarE = e((d1) ((p1.t) oVar).j(g1.f73330a), oVar);
        if (j11 != 16) {
            j53 = j11;
            j52 = 16;
        } else {
            j52 = 16;
            j53 = q8VarE.f73851a;
        }
        long j90 = j12 != j52 ? j12 : q8VarE.f73852b;
        long j91 = j61 != j52 ? j61 : q8VarE.f73853c;
        if (j55 == j52) {
            j55 = q8VarE.f73854d;
        }
        long j92 = j55;
        long j93 = j15 != j52 ? j15 : q8VarE.f73855e;
        long j94 = j16 != j52 ? j16 : q8VarE.f73856f;
        long j95 = j17 != j52 ? j17 : q8VarE.f73857g;
        if (j56 == j52) {
            j56 = q8VarE.f73858h;
        }
        long j96 = j56;
        if (j57 == j52) {
            j57 = q8VarE.f73859i;
        }
        long j97 = j57;
        if (j58 == j52) {
            j58 = q8VarE.f73860j;
        }
        long j98 = j58;
        if (g1Var2 == null) {
            g1Var2 = q8VarE.f73861k;
        }
        e1.g1 g1Var3 = g1Var2;
        long j99 = j22 != j52 ? j22 : q8VarE.f73862l;
        long j100 = j23 != j52 ? j23 : q8VarE.f73863m;
        if (j59 == j52) {
            j59 = q8VarE.n;
        }
        long j101 = j59;
        if (j62 == j52) {
            j62 = q8VarE.o;
        }
        return new q8(j53, j90, j91, j92, j93, j94, j95, j96, j97, j98, g1Var3, j99, j100, j101, j62, j63 != j52 ? j63 : q8VarE.f73864p, j64 != j52 ? j64 : q8VarE.f73865q, j65 != j52 ? j65 : q8VarE.f73866r, j66 != j52 ? j66 : q8VarE.f73867s, j67 != j52 ? j67 : q8VarE.f73868t, j68 != j52 ? j68 : q8VarE.f73869u, j69 != j52 ? j69 : q8VarE.f73870v, j71 != j52 ? j71 : q8VarE.f73871w, j72 != j52 ? j72 : q8VarE.f73872x, j73 != j52 ? j73 : q8VarE.f73873y, j74 != j52 ? j74 : q8VarE.f73874z, j75 != j52 ? j75 : q8VarE.A, j76 != j52 ? j76 : q8VarE.B, j77 != j52 ? j77 : q8VarE.C, j78 != j52 ? j78 : q8VarE.D, j79 != j52 ? j79 : q8VarE.E, j81 != j52 ? j81 : q8VarE.F, j81 != j52 ? j81 : q8VarE.G, j81 != j52 ? j81 : q8VarE.H, j81 != j52 ? j81 : q8VarE.I, j82 != j52 ? j82 : q8VarE.J, j83 != j52 ? j83 : q8VarE.K, j84 != j52 ? j84 : q8VarE.L, j85 != j52 ? j85 : q8VarE.M, j86 != j52 ? j86 : q8VarE.N, j87 != j52 ? j87 : q8VarE.O, j88 != j52 ? j88 : q8VarE.P, j89 != j52 ? j89 : q8VarE.Q);
    }

    public static q8 e(d1 d1Var, p1.o oVar) {
        q8 q8Var = d1Var.Y;
        p1.t tVar = (p1.t) oVar;
        tVar.b0(27085453);
        if (q8Var == null) {
            q8 q8Var2 = new q8(g1.d(d1Var, 18), g1.d(d1Var, 18), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 18), g1.d(d1Var, 39), g1.d(d1Var, 39), g1.d(d1Var, 39), g1.d(d1Var, 39), g1.d(d1Var, 26), g1.d(d1Var, 2), (e1.g1) tVar.j(e1.h1.f51306a), g1.d(d1Var, 26), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 2), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 19), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 2), g1.d(d1Var, 26), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 2), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 19), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 18)), g1.d(d1Var, 2), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 19)), g1.d(d1Var, 19), g1.d(d1Var, 19), g1.d(d1Var, 19), i2.s.b(0.38f, g1.d(d1Var, 19)), g1.d(d1Var, 19));
            d1Var.Y = q8Var2;
            q8Var = q8Var2;
        }
        tVar.p(false);
        return q8Var;
    }

    public static k0.p1 f() {
        float f11 = m1.r0.f75747b;
        return new k0.p1(f11, m1.r0.f75749d, f11, 0);
    }

    public final void a(boolean z11, i0.i iVar, q8 q8Var, i2.v0 v0Var, p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-818661242);
        int i11 = i5 | (tVar.g(z11) ? 4 : 2) | (tVar.g(false) ? 32 : 16) | (tVar.f(iVar) ? 256 : 128) | (tVar.f(q8Var) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (tVar.f(v0Var) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX);
        if ((38347923 & i11) == 38347922 && tVar.E()) {
            tVar.V();
        } else {
            tVar.X();
            if ((i5 & 1) != 0 && !tVar.B()) {
                tVar.V();
            }
            tVar.q();
            u8 u8Var = new u8(new m4(0, 1, p1.y2.class, b0.n1.a(!z11 ? q8Var.f73857g : ((Boolean) cw.l2.o(iVar, tVar, (i11 >> 6) & 14).getValue()).booleanValue() ? q8Var.f73855e : q8Var.f73856f, c0.f.i(PerAppFeatureCatalog.MAX_TOOLS, 0, null, 6), tVar, 48, 12), "value", "getValue()Ljava/lang/Object;"));
            float f11 = m1.r0.f75747b;
            k0.p.a(fg.a.i(androidx.compose.ui.draw.a.b(b2.r.f17024a, new b0.e(17, v0Var, u8Var)), new h2(iVar, z11, q8Var)), tVar, 0);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new r8(this, z11, iVar, q8Var, v0Var, i5);
        }
    }

    public final void b(String str, Function2 function2, boolean z11, r3.i0 i0Var, i0.i iVar, Function2 function22, Function2 function23, i2.v0 v0Var, q8 q8Var, k0.o1 o1Var, Function2 function24, p1.o oVar, int i5) {
        String str2;
        int i11;
        r3.i0 i0Var2;
        k0.o1 p1Var;
        int i12;
        Function2 function2D;
        k0.o1 o1Var2;
        Function2 function25;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(289640444);
        if ((i5 & 6) == 0) {
            str2 = str;
            i11 = (tVar.f(str2) ? 4 : 2) | i5;
        } else {
            str2 = str;
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar.h(function2) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar.g(z11) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar.g(false) ? 2048 : 1024;
        }
        int i13 = i5 & 24576;
        int i14 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
        if (i13 == 0) {
            i0Var2 = i0Var;
            i11 |= tVar.f(i0Var2) ? 16384 : 8192;
        } else {
            i0Var2 = i0Var;
        }
        int i15 = i5 & 196608;
        int i16 = SQLiteDatabase.OPEN_SHAREDCACHE;
        if (i15 == 0) {
            i11 |= tVar.f(iVar) ? 131072 : 65536;
        }
        if ((i5 & 1572864) == 0) {
            i11 |= tVar.g(false) ? 1048576 : 524288;
        }
        if ((i5 & 12582912) == 0) {
            i11 |= tVar.h(null) ? 8388608 : 4194304;
        }
        if ((i5 & 100663296) == 0) {
            i11 |= tVar.h(function22) ? 67108864 : 33554432;
        }
        if ((i5 & 805306368) == 0) {
            i11 |= tVar.h(null) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
        }
        int i17 = 100663296 | (tVar.h(function23) ? 4 : 2) | (tVar.h(null) ? 32 : 16) | (tVar.h(null) ? 256 : 128) | (tVar.h(null) ? 2048 : 1024);
        if (tVar.f(v0Var)) {
            i14 = 16384;
        }
        int i18 = i17 | i14;
        if (!tVar.f(q8Var)) {
            i16 = 65536;
        }
        int i19 = i18 | i16 | 13107200;
        if ((306783379 & i11) == 306783378 && (38347923 & i19) == 38347922 && tVar.E()) {
            tVar.V();
            o1Var2 = o1Var;
            function25 = function24;
        } else {
            tVar.X();
            if ((i5 & 1) == 0 || tVar.B()) {
                float f11 = m1.r0.f75747b;
                p1Var = new k0.p1(f11, f11, f11, f11);
                i12 = i19 & (-3670017);
                function2D = x1.f.d(-435523791, new s8(z11, iVar, q8Var, v0Var), tVar);
            } else {
                tVar.V();
                i12 = i19 & (-3670017);
                p1Var = o1Var;
                function2D = function24;
            }
            tVar.q();
            int i21 = i11 << 3;
            int i22 = i11 >> 3;
            int i23 = (i22 & 7168) | (i21 & 896) | (i21 & 112) | 6;
            int i24 = i11 >> 9;
            int i25 = i12 << 21;
            int i26 = ((i12 << 3) & 3670016) | ((i12 >> 9) & 14) | ((i11 >> 6) & 112) | (i11 & 896) | (i24 & 7168) | (i22 & 57344) | 12582912;
            r3.i0 i0Var3 = i0Var2;
            k0.o1 o1Var3 = p1Var;
            m1.r0.a(m1.s0.f75759a, str2, function2, i0Var3, null, function22, null, function23, false, z11, false, iVar, o1Var3, q8Var, function2D, tVar, i23 | (i24 & 57344) | (i24 & 458752) | (i24 & 3670016) | (i25 & 29360128) | (i25 & 234881024) | (i25 & 1879048192), i26);
            o1Var2 = o1Var3;
            function25 = function2D;
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new t8(this, str, function2, z11, i0Var, iVar, function22, function23, v0Var, q8Var, o1Var2, function25, i5);
        }
    }
}
