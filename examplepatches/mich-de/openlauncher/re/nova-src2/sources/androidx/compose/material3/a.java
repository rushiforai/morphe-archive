package androidx.compose.material3;

import a2.c;
import androidx.compose.foundation.layout.b;
import androidx.compose.foundation.layout.e;
import androidx.compose.foundation.selection.d;
import b2.r;
import b2.t;
import b3.k;
import b3.l;
import c0.a0;
import c0.h2;
import c0.j1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import i0.i;
import i2.r0;
import i2.s;
import i2.v0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import j3.h;
import k0.p;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import l1.a6;
import l1.c3;
import l1.d1;
import l1.g1;
import l1.q5;
import l1.u7;
import l1.v7;
import l1.y0;
import o1.b0;
import p1.n;
import p1.n1;
import p1.o;
import p1.t1;
import p1.z2;
import x7.f;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final float f14089a;

    /* renamed from: b, reason: collision with root package name */
    public static final float f14090b;

    /* renamed from: c, reason: collision with root package name */
    public static final float f14091c;

    /* renamed from: d, reason: collision with root package name */
    public static final float f14092d;

    /* renamed from: e, reason: collision with root package name */
    public static final float f14093e;

    /* renamed from: f, reason: collision with root package name */
    public static final j1 f14094f;

    /* renamed from: g, reason: collision with root package name */
    public static final h2 f14095g;

    static {
        float f11 = b0.f78959b;
        f14089a = f11;
        f14090b = b0.f78964g;
        f14091c = b0.f78963f;
        float f12 = b0.f78961d;
        f14092d = f12;
        f14093e = (f12 - f11) / 2;
        f14094f = new j1();
        f14095g = new h2(100, (a0) null, 6);
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01ac  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x01c1  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01fe  */
    /* JADX WARN: Removed duplicated region for block: B:90:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(boolean z11, Function1 function1, t tVar, boolean z12, u7 u7Var, o oVar, int i5, int i11) {
        int i12;
        t tVar2;
        int i13;
        boolean z13;
        u7 u7Var2;
        int i14;
        int i15;
        boolean z14;
        p1.t tVar3;
        u7 u7Var3;
        boolean z15;
        t tVar4;
        int i16;
        u7 u7Var4;
        int i17;
        Object objP;
        i iVar;
        int i18;
        boolean z16;
        u7 u7Var5;
        t tVar5;
        t1 t1VarU;
        int i19;
        p1.t tVar6 = (p1.t) oVar;
        tVar6.d0(1580463220);
        if ((i5 & 6) == 0) {
            i12 = (tVar6.g(z11) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar6.h(function1) ? 32 : 16;
        }
        int i21 = i11 & 4;
        if (i21 != 0) {
            i12 |= 384;
        } else {
            if ((i5 & 384) == 0) {
                tVar2 = tVar;
                i12 |= tVar6.f(tVar2) ? 256 : 128;
            }
            int i22 = i12 | 3072;
            i13 = i11 & 16;
            if (i13 != 0) {
                if ((i5 & 24576) == 0) {
                    z13 = z12;
                    i22 |= tVar6.g(z13) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
                }
                if ((196608 & i5) == 0) {
                    if ((i11 & 32) == 0) {
                        u7Var2 = u7Var;
                        if (tVar6.f(u7Var2)) {
                            i19 = SQLiteDatabase.OPEN_SHAREDCACHE;
                        }
                        i22 |= i19;
                    } else {
                        u7Var2 = u7Var;
                    }
                    i19 = SQLiteDatabase.OPEN_FULLMUTEX;
                    i22 |= i19;
                } else {
                    u7Var2 = u7Var;
                }
                i14 = i22 | 1572864;
                if ((599187 & i14) == 599186 && tVar6.E()) {
                    tVar6.V();
                    tVar5 = tVar2;
                    u7Var5 = u7Var2;
                    z16 = z13;
                } else {
                    tVar6.X();
                    i15 = i5 & 1;
                    t tVarA = r.f17024a;
                    if (i15 != 0 || tVar6.B()) {
                        if (i21 != 0) {
                            tVar2 = tVarA;
                        }
                        if (i13 != 0) {
                            z13 = true;
                        }
                        if ((i11 & 32) == 0) {
                            d1 d1Var = (d1) tVar6.j(g1.f73330a);
                            u7Var3 = d1Var.W;
                            long j11 = d1Var.f73161p;
                            if (u7Var3 == null) {
                                float f11 = b0.f78958a;
                                long jD = g1.d(d1Var, 10);
                                long jD2 = g1.d(d1Var, 26);
                                long j12 = s.f61146l;
                                i17 = -458753;
                                z14 = z13;
                                tVar3 = tVar6;
                                u7 u7Var6 = new u7(jD, jD2, j12, g1.d(d1Var, 11), g1.d(d1Var, 24), g1.d(d1Var, 39), g1.d(d1Var, 24), g1.d(d1Var, 39), r0.h(s.b(1.0f, g1.d(d1Var, 35)), j11), r0.h(s.b(0.12f, g1.d(d1Var, 18)), j11), j12, r0.h(s.b(0.38f, g1.d(d1Var, 18)), j11), r0.h(s.b(0.38f, g1.d(d1Var, 18)), j11), r0.h(s.b(0.12f, g1.d(d1Var, 39)), j11), r0.h(s.b(0.12f, g1.d(d1Var, 18)), j11), r0.h(s.b(0.38f, g1.d(d1Var, 39)), j11));
                                d1Var.W = u7Var6;
                                u7Var3 = u7Var6;
                            } else {
                                z14 = z13;
                                i17 = -458753;
                                tVar3 = tVar6;
                            }
                            i14 &= i17;
                        } else {
                            z14 = z13;
                            tVar3 = tVar6;
                            u7Var3 = u7Var2;
                        }
                        z15 = z14;
                        tVar4 = tVar2;
                        i16 = i14;
                        u7Var4 = u7Var3;
                    } else {
                        tVar6.V();
                        if ((i11 & 32) != 0) {
                            i14 &= -458753;
                        }
                        tVar4 = tVar2;
                        i16 = i14;
                        u7Var4 = u7Var2;
                        tVar3 = tVar6;
                        z15 = z13;
                    }
                    tVar3.q();
                    tVar6 = tVar3;
                    tVar6.b0(783532531);
                    objP = tVar6.P();
                    if (objP == n.f81514a) {
                        objP = c.d(tVar6);
                    }
                    i iVar2 = (i) objP;
                    tVar6.p(false);
                    if (function1 == null) {
                        z2 z2Var = c3.f73102a;
                        i18 = 2;
                        iVar = iVar2;
                        tVarA = d.a(MinimumInteractiveModifier.f14086b, z11, iVar, z15, new h(2), function1);
                    } else {
                        iVar = iVar2;
                        i18 = 2;
                    }
                    t tVarL = e.l(e.x(tVar4.then(tVarA), b2.d.f17001e, i18), f14091c, f14092d);
                    float f12 = b0.f78958a;
                    int i23 = i16 << 3;
                    int i24 = i16 >> 6;
                    b(tVarL, z11, z15, u7Var4, iVar, a6.a(tVar6, 5), tVar6, (i23 & 112) | (i24 & 896) | (i24 & 7168) | (i23 & 57344));
                    z16 = z15;
                    u7Var5 = u7Var4;
                    tVar5 = tVar4;
                }
                t1VarU = tVar6.u();
                if (t1VarU != null) {
                    t1VarU.f81583d = new y0(z11, function1, tVar5, z16, u7Var5, i5, i11, 2);
                    return;
                }
                return;
            }
            i22 = i12 | 27648;
            z13 = z12;
            if ((196608 & i5) == 0) {
            }
            i14 = i22 | 1572864;
            if ((599187 & i14) == 599186) {
                tVar6.X();
                i15 = i5 & 1;
                t tVarA2 = r.f17024a;
                if (i15 != 0) {
                    if (i21 != 0) {
                    }
                    if (i13 != 0) {
                    }
                    if ((i11 & 32) == 0) {
                    }
                    z15 = z14;
                    tVar4 = tVar2;
                    i16 = i14;
                    u7Var4 = u7Var3;
                    tVar3.q();
                    tVar6 = tVar3;
                    tVar6.b0(783532531);
                    objP = tVar6.P();
                    if (objP == n.f81514a) {
                    }
                    i iVar22 = (i) objP;
                    tVar6.p(false);
                    if (function1 == null) {
                    }
                    t tVarL2 = e.l(e.x(tVar4.then(tVarA2), b2.d.f17001e, i18), f14091c, f14092d);
                    float f122 = b0.f78958a;
                    int i232 = i16 << 3;
                    int i242 = i16 >> 6;
                    b(tVarL2, z11, z15, u7Var4, iVar, a6.a(tVar6, 5), tVar6, (i232 & 112) | (i242 & 896) | (i242 & 7168) | (i232 & 57344));
                    z16 = z15;
                    u7Var5 = u7Var4;
                    tVar5 = tVar4;
                }
            }
            t1VarU = tVar6.u();
            if (t1VarU != null) {
            }
        }
        tVar2 = tVar;
        int i222 = i12 | 3072;
        i13 = i11 & 16;
        if (i13 != 0) {
        }
        z13 = z12;
        if ((196608 & i5) == 0) {
        }
        i14 = i222 | 1572864;
        if ((599187 & i14) == 599186) {
        }
        t1VarU = tVar6.u();
        if (t1VarU != null) {
        }
    }

    public static final void b(t tVar, boolean z11, boolean z12, u7 u7Var, i iVar, v0 v0Var, o oVar, int i5) {
        int i11;
        long j11;
        long j12;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1594099146);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.g(z11) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.g(z12) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.f(u7Var) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar2.h(null) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.f(iVar) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((1572864 & i5) == 0) {
            i11 |= tVar2.f(v0Var) ? 1048576 : 524288;
        }
        if ((i11 & 599187) == 599186 && tVar2.E()) {
            tVar2.V();
        } else {
            long j13 = z12 ? z11 ? u7Var.f74081b : u7Var.f74085f : z11 ? u7Var.f74089j : u7Var.n;
            long j14 = z12 ? z11 ? u7Var.f74080a : u7Var.f74084e : z11 ? u7Var.f74088i : u7Var.f74092m;
            float f11 = b0.f78958a;
            v0 v0VarA = a6.a(tVar2, 5);
            float f12 = b0.f78962e;
            if (z12) {
                j11 = j13;
                j12 = z11 ? u7Var.f74082c : u7Var.f74086g;
            } else {
                j11 = j13;
                j12 = z11 ? u7Var.f74090k : u7Var.o;
            }
            t tVarB = androidx.compose.foundation.a.b(f.o(tVar, f12, j12, v0VarA), j11, v0VarA);
            z2.r0 r0VarD = p.d(b2.d.f16997a, false);
            int iHashCode = Long.hashCode(tVar2.T);
            n1 n1VarL = tVar2.l();
            t tVarI = fg.a.I(tVarB, tVar2);
            l.Po.getClass();
            Function0 function0 = k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            b3.i iVar2 = k.f17275g;
            p1.a0.j(r0VarD, iVar2, tVar2);
            b3.i iVar3 = k.f17274f;
            p1.a0.j(n1VarL, iVar3, tVar2);
            b3.i iVar4 = k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                c.u(iHashCode, tVar2, iHashCode, iVar4);
            }
            b3.i iVar5 = k.f17272d;
            p1.a0.j(tVarI, iVar5, tVar2);
            t tVarB2 = androidx.compose.foundation.a.b(androidx.compose.foundation.e.a(b.f13968a.a(r.f17024a, b2.d.f17000d).then(new ThumbElement(iVar, z11)), iVar, q5.a(false, b0.f78960c / 2, 0L, tVar2, 54, 4)), j14, v0Var);
            z2.r0 r0VarD2 = p.d(b2.d.f17001e, false);
            int iHashCode2 = Long.hashCode(tVar2.T);
            n1 n1VarL2 = tVar2.l();
            t tVarI2 = fg.a.I(tVarB2, tVar2);
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(r0VarD2, iVar2, tVar2);
            p1.a0.j(n1VarL2, iVar3, tVar2);
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode2))) {
                c.u(iHashCode2, tVar2, iHashCode2, iVar4);
            }
            p1.a0.j(tVarI2, iVar5, tVar2);
            tVar2.b0(1163457794);
            tVar2.p(false);
            tVar2.p(true);
            tVar2.p(true);
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new v7(tVar, z11, z12, u7Var, iVar, v0Var, i5);
        }
    }
}
