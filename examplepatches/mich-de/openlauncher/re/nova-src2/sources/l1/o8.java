package l1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class o8 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f73755a = 90;

    /* renamed from: b, reason: collision with root package name */
    public static final c0.h2 f73756b;

    /* renamed from: c, reason: collision with root package name */
    public static final c0.h2 f73757c;

    static {
        c0.w wVar = c0.b0.f18710a;
        f73756b = c0.f.i(androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION, 0, wVar, 2);
        f73757c = c0.f.i(androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION, 0, wVar, 2);
    }

    public static final void a(float f11, int i5, int i11, long j11, long j12, b2.t tVar, Function2 function2, Function3 function3, p1.o oVar, x1.e eVar) {
        int i12;
        Function3 function3D;
        long j13;
        long j14;
        Function2 function22;
        Function3 function32;
        long j15;
        Function2 function23;
        long j16;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-497821003);
        int i13 = i11 | (tVar2.d(i5) ? 4 : 2) | 1770624;
        if ((4793491 & i13) == 4793490 && tVar2.E()) {
            tVar2.V();
            j16 = j11;
            j15 = j12;
            function23 = function2;
            function32 = function3;
        } else {
            tVar2.X();
            if ((i11 & 1) == 0 || tVar2.B()) {
                e8 e8Var = e8.f73260a;
                long jE = g1.e(tVar2, o1.u.f79174b);
                long jE2 = g1.e(tVar2, o1.u.f79176d);
                i12 = i13 & (-8065);
                function3D = x1.f.d(-913748678, new f8(i5, 0), tVar2);
                j13 = jE2;
                j14 = jE;
                function22 = r1.f73894b;
            } else {
                tVar2.V();
                j14 = j11;
                j13 = j12;
                function22 = function2;
                i12 = i13 & (-8065);
                function3D = function3;
            }
            tVar2.q();
            b(i5, function3D, tVar, j14, j13, f11, function22, eVar, mk.v.N(tVar2), tVar2, (i12 & 14) | 14352816);
            function32 = function3D;
            j15 = j13;
            function23 = function22;
            j16 = j14;
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new g8(f11, i5, i11, j16, j15, tVar, function23, function32, eVar);
        }
    }

    public static final void b(int i5, Function3 function3, b2.t tVar, long j11, long j12, float f11, Function2 function2, x1.e eVar, e0.a2 a2Var, p1.o oVar, int i11) {
        int i12;
        p1.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-955409947);
        if ((i11 & 6) == 0) {
            i12 = (tVar3.d(i5) ? 4 : 2) | i11;
        } else {
            i12 = i11;
        }
        if ((i11 & 48) == 0) {
            i12 |= tVar3.h(function3) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            i12 |= tVar3.f(tVar) ? 256 : 128;
        }
        if ((i11 & 3072) == 0) {
            i12 |= tVar3.e(j11) ? 2048 : 1024;
        }
        if ((i11 & 24576) == 0) {
            i12 |= tVar3.e(j12) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i11) == 0) {
            i12 |= tVar3.c(f11) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i11) == 0) {
            i12 |= tVar3.h(function2) ? 1048576 : 524288;
        }
        if ((i11 & 12582912) == 0) {
            i12 |= tVar3.h(eVar) ? 8388608 : 4194304;
        }
        if ((100663296 & i11) == 0) {
            i12 |= tVar3.f(a2Var) ? 67108864 : 33554432;
        }
        if ((38347923 & i12) == 38347922 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar3;
        } else {
            tVar3.X();
            if ((i11 & 1) != 0 && !tVar3.B()) {
                tVar3.V();
            }
            tVar3.q();
            int i13 = ((i12 >> 6) & 14) | 12582912;
            int i14 = i12 >> 3;
            tVar2 = tVar3;
            t7.a(tVar, null, j11, j12, 0.0f, 0.0f, null, x1.f.d(-1572959552, new j8(a2Var, f11, eVar, function2, function3, i5), tVar3), tVar2, i13 | (i14 & 896) | (i14 & 7168), 114);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new k8(i5, function3, tVar, j11, j12, f11, function2, eVar, a2Var, i11);
        }
    }

    public static final void c(int i5, b2.t tVar, long j11, long j12, Function3 function3, Function2 function2, x1.e eVar, p1.o oVar, int i11) {
        Function3 function3D;
        Function2 function22;
        long j13;
        long j14;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1199178586);
        if (((i11 | (tVar2.d(i5) ? 4 : 2) | 222336) & 599187) == 599186 && tVar2.E()) {
            tVar2.V();
            j14 = j11;
            j13 = j12;
            function3D = function3;
            function22 = function2;
        } else {
            tVar2.X();
            if ((i11 & 1) == 0 || tVar2.B()) {
                e8 e8Var = e8.f73260a;
                long jE = g1.e(tVar2, o1.u.f79174b);
                long jE2 = g1.e(tVar2, o1.u.f79176d);
                function3D = x1.f.d(-2052073983, new f8(i5, 1), tVar2);
                function22 = r1.f73893a;
                j13 = jE2;
                j14 = jE;
            } else {
                tVar2.V();
                j14 = j11;
                j13 = j12;
                function3D = function3;
                function22 = function2;
            }
            tVar2.q();
            d(tVar, j14, j13, function3D, function22, eVar, tVar2, 224262);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new l8(i5, tVar, j14, j13, function3D, function22, eVar, i11);
        }
    }

    public static final void d(b2.t tVar, long j11, long j12, Function3 function3, Function2 function2, x1.e eVar, p1.o oVar, int i5) {
        int i11;
        p1.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-160898917);
        if ((i5 & 6) == 0) {
            i11 = (tVar3.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar3.e(j11) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar3.e(j12) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar3.h(function3) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar3.h(function2) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar3.h(eVar) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((74899 & i11) == 74898 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar3;
        } else {
            int i12 = i11 << 3;
            tVar2 = tVar3;
            t7.a(j3.n.b(tVar, false, new qx.z0(2)), null, j11, j12, 0.0f, 0.0f, null, x1.f.d(-1617702432, new j3(eVar, function2, function3), tVar3), tVar2, (i12 & 896) | 12582912 | (i12 & 7168), 114);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new l8(tVar, j11, j12, function3, function2, eVar, i5);
        }
    }
}
