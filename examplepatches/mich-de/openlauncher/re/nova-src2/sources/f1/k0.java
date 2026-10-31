package f1;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class k0 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f53696a = 56;

    /* renamed from: b, reason: collision with root package name */
    public static final float f53697b;

    /* renamed from: c, reason: collision with root package name */
    public static final b2.t f53698c;

    /* renamed from: d, reason: collision with root package name */
    public static final b2.t f53699d;

    /* renamed from: e, reason: collision with root package name */
    public static final k0.j0 f53700e;

    static {
        float f11 = 4;
        f53697b = f11;
        b2.r rVar = b2.r.f17024a;
        f53698c = androidx.compose.foundation.layout.e.t(rVar, 16 - f11);
        f53699d = androidx.compose.foundation.layout.e.t(androidx.compose.foundation.layout.e.c(rVar, 1.0f), 72 - f11);
        f53700e = k0.i2.c(0);
    }

    public static final void a(final long j11, final long j12, final float f11, final k0.o1 o1Var, final k0.g2 g2Var, final b2.t tVar, final x1.e eVar, p1.o oVar, final int i5) {
        int i11;
        b2.t tVar2;
        p1.t tVar3;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(1222317265);
        if ((i5 & 6) == 0) {
            i11 = (tVar4.e(j11) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar4.e(j12) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar4.c(f11) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar4.f(o1Var) ? 2048 : 1024;
        }
        int i12 = i5 & 24576;
        i2.q0 q0Var = i2.r0.f61135a;
        if (i12 == 0) {
            i11 |= tVar4.f(q0Var) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar4.f(g2Var) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((i5 & 1572864) == 0) {
            tVar2 = tVar;
            i11 |= tVar4.f(tVar2) ? 1048576 : 524288;
        } else {
            tVar2 = tVar;
        }
        if ((12582912 & i5) == 0) {
            i11 |= tVar4.h(eVar) ? 8388608 : 4194304;
        }
        if (tVar4.S(i11 & 1, (4793491 & i11) != 4793490)) {
            int i13 = i11 << 6;
            tVar3 = tVar4;
            cw.l2.j(tVar2, q0Var, j11, j12, null, f11, x1.f.d(-1628734195, new j0(g2Var, o1Var, eVar, 1), tVar4), tVar3, 1572864 | ((i11 >> 18) & 14) | ((i11 >> 9) & 112) | (i13 & 896) | (i13 & 7168) | ((i11 << 9) & 458752), 16);
        } else {
            tVar3 = tVar4;
            tVar3.V();
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2() { // from class: f1.h0
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    k0.a(j11, j12, f11, o1Var, g2Var, tVar, eVar, (p1.o) obj, p1.a0.l(i5 | 1));
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final void b(final b2.t tVar, final long j11, long j12, final float f11, k0.o1 o1Var, final x1.e eVar, p1.o oVar, final int i5) {
        final long j13;
        final k0.o1 o1Var2;
        k0.o1 o1Var3;
        int i11;
        long j14;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-2030536439);
        int i12 = i5 | (tVar2.e(j11) ? 32 : 16) | 24704;
        if (tVar2.S(i12 & 1, (74899 & i12) != 74898)) {
            tVar2.X();
            if ((i5 & 1) == 0 || tVar2.B()) {
                long jB = u0.b(j11, tVar2);
                o1Var3 = e0.f53479b;
                i11 = i12 & (-897);
                j14 = jB;
            } else {
                tVar2.V();
                o1Var3 = o1Var;
                i11 = i12 & (-897);
                j14 = j12;
            }
            tVar2.q();
            a(j11, j14, f11, o1Var3, f53700e, tVar, eVar, tVar2, ((i11 >> 3) & 14) | 14380416);
            o1Var2 = o1Var3;
            j13 = j14;
        } else {
            tVar2.V();
            j13 = j12;
            o1Var2 = o1Var;
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2(j11, j13, f11, o1Var2, eVar, i5) { // from class: f1.i0

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ long f53631b;

                /* renamed from: c, reason: collision with root package name */
                public final /* synthetic */ long f53632c;

                /* renamed from: d, reason: collision with root package name */
                public final /* synthetic */ float f53633d;

                /* renamed from: e, reason: collision with root package name */
                public final /* synthetic */ k0.o1 f53634e;

                /* renamed from: f, reason: collision with root package name */
                public final /* synthetic */ x1.e f53635f;

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iL = p1.a0.l(199687);
                    k0.b(this.f53630a, this.f53631b, this.f53632c, this.f53633d, this.f53634e, this.f53635f, (p1.o) obj, iL);
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final void c(final x1.e eVar, final k0.g2 g2Var, final b2.t tVar, final Function2 function2, final Function3 function3, final long j11, final long j12, final float f11, p1.o oVar, final int i5) {
        int i11;
        k0.g2 g2Var2;
        b2.t tVar2;
        p1.t tVar3;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(138090236);
        if ((i5 & 6) == 0) {
            i11 = (tVar4.h(eVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            g2Var2 = g2Var;
            i11 |= tVar4.f(g2Var2) ? 32 : 16;
        } else {
            g2Var2 = g2Var;
        }
        if ((i5 & 384) == 0) {
            tVar2 = tVar;
            i11 |= tVar4.f(tVar2) ? 256 : 128;
        } else {
            tVar2 = tVar;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar4.h(function2) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar4.h(function3) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar4.e(j11) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i11 |= tVar4.e(j12) ? 1048576 : 524288;
        }
        if ((12582912 & i5) == 0) {
            i11 |= tVar4.c(f11) ? 8388608 : 4194304;
        }
        if (tVar4.S(i11 & 1, (4793491 & i11) != 4793490)) {
            tVar4.X();
            if ((i5 & 1) != 0 && !tVar4.B()) {
                tVar4.V();
            }
            tVar4.q();
            int i12 = i11 >> 15;
            int i13 = i11 << 12;
            tVar3 = tVar4;
            a(j11, j12, f11, e0.f53479b, g2Var2, tVar2, x1.f.d(-2019867954, new b10.f0(8, function2, eVar, function3), tVar4), tVar3, (i12 & 896) | (i12 & 14) | 12610560 | (i12 & 112) | (458752 & i13) | (i13 & 3670016));
        } else {
            tVar3 = tVar4;
            tVar3.V();
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2() { // from class: f1.g0
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    k0.c(eVar, g2Var, tVar, function2, function3, j11, j12, f11, (p1.o) obj, p1.a0.l(i5 | 1));
                    return Unit.f71706a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:67:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void d(float f11, int i5, int i11, long j11, long j12, b2.t tVar, Function2 function2, Function3 function3, p1.o oVar, x1.e eVar) {
        int i12;
        Function3 function32;
        long j13;
        b2.t tVar2;
        Function3 function33;
        p1.t1 t1VarU;
        long jB;
        int i13;
        Function3 function34;
        b2.t tVar3;
        p1.t tVar4 = (p1.t) oVar;
        tVar4.d0(-350082398);
        if ((i5 & 6) == 0) {
            i12 = (tVar4.h(eVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i14 = i12 | 48;
        if ((i5 & 384) == 0) {
            i14 |= tVar4.h(function2) ? 256 : 128;
        }
        int i15 = i11 & 8;
        if (i15 == 0) {
            if ((i5 & 3072) == 0) {
                function32 = function3;
                i14 |= tVar4.h(function32) ? 2048 : 1024;
            }
            if ((i5 & 24576) == 0) {
                i14 |= tVar4.e(j11) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
            }
            if ((196608 & i5) == 0) {
                i14 |= SQLiteDatabase.OPEN_FULLMUTEX;
            }
            if ((1572864 & i5) == 0) {
                i14 |= tVar4.c(f11) ? 1048576 : 524288;
            }
            if (tVar4.S(i14 & 1, (599187 & i14) == 599186)) {
                tVar4.V();
                j13 = j12;
                tVar2 = tVar;
                function33 = function32;
            } else {
                tVar4.X();
                if ((i5 & 1) == 0 || tVar4.B()) {
                    Function3 function35 = i15 != 0 ? w0.f54064a : function32;
                    jB = u0.b(j11, tVar4);
                    i13 = i14 & (-458753);
                    function34 = function35;
                    tVar3 = b2.r.f17024a;
                } else {
                    tVar4.V();
                    i13 = i14 & (-458753);
                    jB = j12;
                    tVar3 = tVar;
                    function34 = function32;
                }
                tVar4.q();
                int i16 = (i13 & 14) | 48;
                int i17 = i13 << 3;
                long j14 = jB;
                c(eVar, f53700e, tVar3, function2, function34, j11, j14, f11, tVar4, i16 | (i17 & 896) | (i17 & 7168) | (57344 & i17) | (458752 & i17) | (i17 & 29360128));
                function33 = function34;
                j13 = j14;
                tVar2 = tVar3;
            }
            t1VarU = tVar4.u();
            if (t1VarU == null) {
                t1VarU.f81583d = new f0(f11, i5, i11, j11, j13, tVar2, function2, function33, eVar);
                return;
            }
            return;
        }
        i14 |= 3072;
        function32 = function3;
        if ((i5 & 24576) == 0) {
        }
        if ((196608 & i5) == 0) {
        }
        if ((1572864 & i5) == 0) {
        }
        if (tVar4.S(i14 & 1, (599187 & i14) == 599186)) {
        }
        t1VarU = tVar4.u();
        if (t1VarU == null) {
        }
    }
}
