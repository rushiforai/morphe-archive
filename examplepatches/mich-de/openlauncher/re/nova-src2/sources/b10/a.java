package b10;

import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import l1.b3;
import l1.g9;

/* loaded from: classes4.dex */
public final class a implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f16526b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f16527c = new a(1);

    /* renamed from: d, reason: collision with root package name */
    public static final a f16528d = new a(2);

    /* renamed from: e, reason: collision with root package name */
    public static final a f16529e = new a(3);

    /* renamed from: f, reason: collision with root package name */
    public static final a f16530f = new a(4);

    /* renamed from: g, reason: collision with root package name */
    public static final a f16531g = new a(5);

    /* renamed from: h, reason: collision with root package name */
    public static final a f16532h = new a(6);

    /* renamed from: i, reason: collision with root package name */
    public static final a f16533i = new a(7);

    /* renamed from: j, reason: collision with root package name */
    public static final a f16534j = new a(8);

    /* renamed from: k, reason: collision with root package name */
    public static final a f16535k = new a(9);

    /* renamed from: l, reason: collision with root package name */
    public static final a f16536l = new a(10);

    /* renamed from: m, reason: collision with root package name */
    public static final a f16537m = new a(11);
    public static final a n = new a(12);
    public static final a o = new a(13);

    /* renamed from: p, reason: collision with root package name */
    public static final a f16538p = new a(14);

    /* renamed from: q, reason: collision with root package name */
    public static final a f16539q = new a(15);

    /* renamed from: r, reason: collision with root package name */
    public static final a f16540r = new a(16);

    /* renamed from: s, reason: collision with root package name */
    public static final a f16541s = new a(17);

    /* renamed from: t, reason: collision with root package name */
    public static final a f16542t = new a(18);

    /* renamed from: u, reason: collision with root package name */
    public static final a f16543u = new a(19);

    /* renamed from: v, reason: collision with root package name */
    public static final a f16544v = new a(20);

    /* renamed from: w, reason: collision with root package name */
    public static final a f16545w = new a(21);

    /* renamed from: x, reason: collision with root package name */
    public static final a f16546x = new a(22);

    /* renamed from: y, reason: collision with root package name */
    public static final a f16547y = new a(23);

    /* renamed from: z, reason: collision with root package name */
    public static final a f16548z = new a(24);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16549a;

    public /* synthetic */ a(int i5) {
        this.f16549a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x02a7  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x02d8  */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0309  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x033a  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x036c  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x03c0  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x03f6  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x042c  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x0457  */
    /* JADX WARN: Removed duplicated region for block: B:181:0x0482  */
    /* JADX WARN: Removed duplicated region for block: B:190:0x04ad  */
    /* JADX WARN: Removed duplicated region for block: B:199:0x04db  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:212:0x0574  */
    /* JADX WARN: Removed duplicated region for block: B:221:0x05c2  */
    /* JADX WARN: Removed duplicated region for block: B:230:0x0610  */
    /* JADX WARN: Removed duplicated region for block: B:239:0x065f  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x013f  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01f4  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x023b  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0270  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f16549a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        o2.g gVarC = zg.a.f98524d;
                        if (gVarC == null) {
                            o2.e eVar = new o2.e("Filled.ArrowBack", 24.0f, 24.0f, 24.0f, 24.0f, 0L, 0, false, 96);
                            EmptyList emptyList = o2.k0.f79316a;
                            i2.x0 x0Var = new i2.x0(i2.s.f61136b);
                            o2.h hVar = new o2.h(0);
                            hVar.o(20.0f, 11.0f);
                            hVar.k(7.83f);
                            hVar.n(5.59f, -5.59f);
                            hVar.m(12.0f, 4.0f);
                            hVar.n(-8.0f, 8.0f);
                            hVar.n(8.0f, 8.0f);
                            hVar.n(1.41f, -1.41f);
                            hVar.m(7.83f, 13.0f);
                            hVar.k(20.0f);
                            hVar.u(-2.0f);
                            hVar.g();
                            o2.e.b(eVar, hVar.f79265a, x0Var, 1.0f, null);
                            gVarC = eVar.c();
                            zg.a.f98524d = gVarC;
                        }
                        b3.b(gVarC, x7.f.Y(oVar, 2132019343), null, 0L, oVar, 0, 12);
                    }
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        g9.b(x7.f.Y(oVar2, 2132019295), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 0, 0, 131070);
                    }
                }
                break;
            case 2:
                p1.o oVar3 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar3 = (p1.t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        g9.b(x7.f.Y(oVar3, 2132017545), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 0, 0, 131070);
                    }
                }
                break;
            case 3:
                p1.o oVar4 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar4 = (p1.t) oVar4;
                    if (tVar4.E()) {
                        tVar4.V();
                    } else {
                        g9.b(x7.f.Y(oVar4, 2132019029), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar4, 0, 0, 131070);
                    }
                }
                break;
            case 4:
                p1.o oVar5 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar5 = (p1.t) oVar5;
                    if (tVar5.E()) {
                        tVar5.V();
                    } else {
                        o2.g gVarC2 = android.support.v4.media.session.b.f13595a;
                        if (gVarC2 == null) {
                            o2.e eVar2 = new o2.e("Filled.ArrowForward", 24.0f, 24.0f, 24.0f, 24.0f, 0L, 0, false, 96);
                            EmptyList emptyList2 = o2.k0.f79316a;
                            i2.x0 x0Var2 = new i2.x0(i2.s.f61136b);
                            o2.h hVar2 = new o2.h(0);
                            hVar2.o(12.0f, 4.0f);
                            hVar2.n(-1.41f, 1.41f);
                            hVar2.m(16.17f, 11.0f);
                            hVar2.k(4.0f);
                            hVar2.u(2.0f);
                            hVar2.l(12.17f);
                            hVar2.n(-5.58f, 5.59f);
                            hVar2.m(12.0f, 20.0f);
                            hVar2.n(8.0f, -8.0f);
                            hVar2.g();
                            o2.e.b(eVar2, hVar2.f79265a, x0Var2, 1.0f, null);
                            gVarC2 = eVar2.c();
                            android.support.v4.media.session.b.f13595a = gVarC2;
                        }
                        b3.b(gVarC2, x7.f.Y(oVar5, 2132019340), null, 0L, oVar5, 0, 12);
                    }
                }
                break;
            case 5:
                p1.o oVar6 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar6 = (p1.t) oVar6;
                    if (tVar6.E()) {
                        tVar6.V();
                    } else {
                        ky.l.j(2132017675, 2132017676, null, oVar6, 0, 4);
                    }
                }
                break;
            case 6:
                p1.o oVar7 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar7 = (p1.t) oVar7;
                    if (tVar7.E()) {
                        tVar7.V();
                    } else {
                        ky.l.j(2132019457, 0, null, oVar7, 0, 6);
                    }
                }
                break;
            case 7:
                p1.o oVar8 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar8 = (p1.t) oVar8;
                    if (tVar8.E()) {
                        tVar8.V();
                    } else {
                        ky.l.j(2132019457, 0, null, oVar8, 0, 6);
                    }
                }
                break;
            case 8:
                p1.o oVar9 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar9 = (p1.t) oVar9;
                    if (tVar9.E()) {
                        tVar9.V();
                    } else {
                        ky.l.j(2132019197, 0, null, oVar9, 0, 6);
                    }
                }
                break;
            case 9:
                p1.o oVar10 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar10 = (p1.t) oVar10;
                    if (tVar10.E()) {
                        tVar10.V();
                    } else {
                        b3.b(com.google.android.gms.internal.consent_sdk.e0.B(), x7.f.Y(oVar10, 2132019091), null, i2.s.b(0.6f, i2.s.f61140f), oVar10, 3072, 4);
                    }
                }
                break;
            case 10:
                p1.o oVar11 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar11 = (p1.t) oVar11;
                    if (tVar11.E()) {
                        tVar11.V();
                    } else {
                        b3.b(com.google.android.gms.internal.consent_sdk.e0.B(), x7.f.Y(oVar11, 2132019091), null, i2.s.b(0.6f, i2.s.f61140f), oVar11, 3072, 4);
                    }
                }
                break;
            case 11:
                p1.o oVar12 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar12 = (p1.t) oVar12;
                    if (tVar12.E()) {
                        tVar12.V();
                    } else {
                        g9.b("Nova Launcher 8", androidx.compose.foundation.layout.d.n(b2.r.f17024a, 8, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, null, null, null, 0L, null, null, 0L, 2, false, 1, 0, null, null, oVar12, 54, 3120, 120828);
                    }
                }
                break;
            case 12:
                p1.o oVar13 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar13 = (p1.t) oVar13;
                    if (tVar13.E()) {
                        tVar13.V();
                    } else {
                        ky.l.i(48, 4, null, x7.f.Y(oVar13, 2132019218), "This will replace existing custom drawer background, label and scroll indicator colors", oVar13);
                    }
                }
                break;
            case 13:
                p1.o oVar14 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar14 = (p1.t) oVar14;
                    if (tVar14.E()) {
                        tVar14.V();
                    } else {
                        ky.l.i(48, 4, null, x7.f.Y(oVar14, 2132017913), "This will replace existing folder background and label colors", oVar14);
                    }
                }
                break;
            case 14:
                p1.o oVar15 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar15 = (p1.t) oVar15;
                    if (tVar15.E()) {
                        tVar15.V();
                    } else {
                        ky.l.i(48, 4, null, x7.f.Y(oVar15, 2132019010), "This will replace any color configuration for the search bar and search window", oVar15);
                    }
                }
                break;
            case 15:
                p1.o oVar16 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar16 = (p1.t) oVar16;
                    if (tVar16.E()) {
                        tVar16.V();
                    } else {
                        ky.l.i(48, 4, null, x7.f.Y(oVar16, 2132019236), "This will replace any color configuration for app notification badges", oVar16);
                    }
                }
                break;
            case 16:
                p1.o oVar17 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar17 = (p1.t) oVar17;
                    if (tVar17.E()) {
                        tVar17.V();
                    } else {
                        bh.g.h(ul.b.V(2131231928, oVar17, 0), null, androidx.compose.foundation.layout.e.f13973c, null, null, 0.0f, null, oVar17, 432, 120);
                    }
                }
                break;
            case 17:
                p1.o oVar18 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar18 = (p1.t) oVar18;
                    if (tVar18.E()) {
                        tVar18.V();
                    } else {
                        b3.b(cl.k0.t(), x7.f.Y(oVar18, 2132019442), null, 0L, oVar18, 0, 12);
                    }
                }
                break;
            case 18:
                p1.o oVar19 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar19 = (p1.t) oVar19;
                    if (tVar19.E()) {
                        tVar19.V();
                    } else {
                        g9.b("Welcome to Nova Launcher 8. This is a major update to Nova but we've migrated your settings over so you should feel right at home. Here's a highlight of some new features to try out.", null, i2.s.f61140f, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar19, 390, 0, 131066);
                    }
                }
                break;
            case 19:
                p1.o oVar20 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar20 = (p1.t) oVar20;
                    if (tVar20.E()) {
                        tVar20.V();
                    } else {
                        long j11 = i2.s.f61140f;
                        i2.q0 q0Var = i2.r0.f61135a;
                        b2.r rVar = b2.r.f17024a;
                        b2.t tVarThen = androidx.compose.foundation.a.b(rVar, j11, q0Var).then(androidx.compose.foundation.layout.e.f13973c);
                        z2.r0 r0VarD = k0.p.d(b2.d.f17001e, false);
                        p1.t tVar21 = (p1.t) oVar20;
                        int iHashCode = Long.hashCode(tVar21.T);
                        p1.n1 n1VarL = tVar21.l();
                        b2.t tVarI = fg.a.I(tVarThen, oVar20);
                        b3.l.Po.getClass();
                        Function0 function0 = b3.k.f17270b;
                        tVar21.f0();
                        if (tVar21.S) {
                            tVar21.k(function0);
                        } else {
                            tVar21.p0();
                        }
                        p1.a0.j(r0VarD, b3.k.f17275g, oVar20);
                        p1.a0.j(n1VarL, b3.k.f17274f, oVar20);
                        b3.i iVar = b3.k.f17278j;
                        if (tVar21.S || !Intrinsics.b(tVar21.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar21, iHashCode, iVar);
                        }
                        p1.a0.j(tVarI, b3.k.f17272d, oVar20);
                        bh.g.h(ul.b.V(2131231792, oVar20, 0), null, androidx.compose.foundation.layout.e.o(rVar, 56), null, null, 0.0f, new i2.n(((l1.d1) ((p1.t) oVar20).j(l1.g1.f73330a)).f73148a, 5), oVar20, 432, 56);
                        tVar21.p(true);
                    }
                }
                break;
            case 20:
                p1.o oVar21 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar22 = (p1.t) oVar21;
                    if (tVar22.E()) {
                        tVar22.V();
                    } else {
                        ky.l.j(2132019520, 0, null, oVar21, 0, 6);
                    }
                }
                break;
            case 21:
                p1.o oVar22 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar23 = (p1.t) oVar22;
                    if (tVar23.E()) {
                        tVar23.V();
                    } else {
                        ky.l.j(2132017675, 0, null, oVar22, 0, 6);
                    }
                }
                break;
            case 22:
                p1.o oVar23 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar24 = (p1.t) oVar23;
                    if (tVar24.E()) {
                        tVar24.V();
                    } else {
                        ky.l.j(2132020388, 0, null, oVar23, 0, 6);
                    }
                }
                break;
            case 23:
                p1.o oVar24 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar25 = (p1.t) oVar24;
                    if (tVar25.E()) {
                        tVar25.V();
                    } else {
                        g9.b("Set where to enable this and we'll do the rest. Enabling these will replace your existing color settings.", null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar24, 6, 0, 131070);
                    }
                }
                break;
            default:
                p1.o oVar25 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar26 = (p1.t) oVar25;
                    if (tVar26.E()) {
                        tVar26.V();
                    } else {
                        ky.l.i(48, 4, null, x7.f.Y(oVar25, 2132019012), "Use Material You colors instead of the traditional Nova red", oVar25);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
