package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.MatchGroup;
import kotlin.text.MatcherMatchResult$groups$1;
import kotlin.text.Regex;
import l1.g9;
import l1.p9;
import l1.q9;

/* loaded from: classes4.dex */
public final class j0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50562a;

    /* renamed from: b, reason: collision with root package name */
    public static final j0 f50539b = new j0(0);

    /* renamed from: c, reason: collision with root package name */
    public static final j0 f50540c = new j0(1);

    /* renamed from: d, reason: collision with root package name */
    public static final j0 f50541d = new j0(2);

    /* renamed from: e, reason: collision with root package name */
    public static final j0 f50542e = new j0(3);

    /* renamed from: f, reason: collision with root package name */
    public static final j0 f50543f = new j0(4);

    /* renamed from: g, reason: collision with root package name */
    public static final j0 f50544g = new j0(5);

    /* renamed from: h, reason: collision with root package name */
    public static final j0 f50545h = new j0(6);

    /* renamed from: i, reason: collision with root package name */
    public static final j0 f50546i = new j0(7);

    /* renamed from: j, reason: collision with root package name */
    public static final j0 f50547j = new j0(8);

    /* renamed from: k, reason: collision with root package name */
    public static final j0 f50548k = new j0(9);

    /* renamed from: l, reason: collision with root package name */
    public static final j0 f50549l = new j0(10);

    /* renamed from: m, reason: collision with root package name */
    public static final j0 f50550m = new j0(11);
    public static final j0 n = new j0(12);
    public static final j0 o = new j0(13);

    /* renamed from: p, reason: collision with root package name */
    public static final j0 f50551p = new j0(14);

    /* renamed from: q, reason: collision with root package name */
    public static final j0 f50552q = new j0(15);

    /* renamed from: r, reason: collision with root package name */
    public static final j0 f50553r = new j0(16);

    /* renamed from: s, reason: collision with root package name */
    public static final j0 f50554s = new j0(17);

    /* renamed from: t, reason: collision with root package name */
    public static final j0 f50555t = new j0(18);

    /* renamed from: u, reason: collision with root package name */
    public static final j0 f50556u = new j0(19);

    /* renamed from: v, reason: collision with root package name */
    public static final j0 f50557v = new j0(20);

    /* renamed from: w, reason: collision with root package name */
    public static final j0 f50558w = new j0(21);

    /* renamed from: x, reason: collision with root package name */
    public static final j0 f50559x = new j0(22);

    /* renamed from: y, reason: collision with root package name */
    public static final j0 f50560y = new j0(23);

    /* renamed from: z, reason: collision with root package name */
    public static final j0 f50561z = new j0(24);
    public static final j0 A = new j0(25);
    public static final j0 B = new j0(26);
    public static final j0 C = new j0(27);
    public static final j0 D = new j0(28);
    public static final j0 E = new j0(29);

    public /* synthetic */ j0(int i5) {
        this.f50562a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:111:0x0213  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0242  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x02a0  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x02cc  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x02fa  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x0326  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x035c  */
    /* JADX WARN: Removed duplicated region for block: B:183:0x0427  */
    /* JADX WARN: Removed duplicated region for block: B:201:0x04f1  */
    /* JADX WARN: Removed duplicated region for block: B:210:0x051f  */
    /* JADX WARN: Removed duplicated region for block: B:219:0x054d  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x057b  */
    /* JADX WARN: Removed duplicated region for block: B:237:0x05c3  */
    /* JADX WARN: Removed duplicated region for block: B:246:0x05f1  */
    /* JADX WARN: Removed duplicated region for block: B:255:0x0620  */
    /* JADX WARN: Removed duplicated region for block: B:264:0x066f  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:273:0x06a4  */
    /* JADX WARN: Removed duplicated region for block: B:282:0x0706  */
    /* JADX WARN: Removed duplicated region for block: B:291:0x0733  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x018e  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01b4  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f50562a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        kotlin.text.b bVarE = new Regex("^(\\d\\d\\d\\d)-(\\d\\d?)-.*").e("2026-10-07 11:42");
                        int i5 = 2023;
                        if (bVarE != null) {
                            MatcherMatchResult$groups$1 matcherMatchResult$groups$1 = bVarE.f72035c;
                            if (matcherMatchResult$groups$1.c() == 3) {
                                try {
                                    MatchGroup matchGroupD = matcherMatchResult$groups$1.d(1);
                                    i5 = Integer.parseInt(matchGroupD != null ? matchGroupD.f72022a : "1970");
                                } catch (Throwable unused) {
                                }
                                MatchGroup matchGroupD2 = matcherMatchResult$groups$1.d(2);
                                if (Intrinsics.b(matchGroupD2 != null ? matchGroupD2.f72022a : null, "12")) {
                                    i5++;
                                }
                            }
                        }
                        ky.l.i(48, 4, null, b.c0.h(i5, "Copyright 2011-"), "Instabridge", oVar);
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
                        ky.l.i(54, 4, null, "Help translate!", "https://crowdin.com/project/nova", oVar2);
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
                        g9.b(x7.f.Y(oVar3, 2132020354), androidx.compose.foundation.layout.e.e(b2.r.f17024a, 1.0f), 0L, w20.h.j(20), null, q3.b0.f83535i, null, 0L, null, new x3.k(3), 0L, 0, false, 0, 0, null, null, oVar3, 199728, 0, 130516);
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
                        l1.b3.a(ul.b.V(2131231505, oVar4, 0), null, null, 0L, oVar4, 48, 12);
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
                        g9.b("Chicago, IL", e10.z2.z(b2.r.f17024a, 0.5f), 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar5, 54, 0, 131068);
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
                        ky.l.j(2132019163, 2132019164, null, oVar6, 0, 4);
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
                        ky.l.j(2132019515, 2132019516, null, oVar7, 0, 4);
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
                        l1.b3.b(ic.b.L(), null, androidx.compose.foundation.layout.d.n(b2.r.f17024a, 0.0f, 0.0f, 12, 0.0f, 11), ((l1.d1) ((p1.t) oVar8).j(l1.g1.f73330a)).f73148a, oVar8, 432, 0);
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
                        ky.l.j(2132019295, 2132019296, null, oVar9, 0, 4);
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
                        ky.l.j(2132019344, 2132019345, null, oVar10, 0, 4);
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
                        ky.l.j(2132019400, 2132019401, null, oVar11, 0, 4);
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
                        b2.t tVarL = androidx.compose.foundation.layout.d.l(b2.r.f17024a, 24, 0.0f, 2);
                        z2.r0 r0VarD = k0.p.d(b2.d.f16997a, false);
                        p1.t tVar13 = (p1.t) oVar12;
                        int iHashCode = Long.hashCode(tVar13.T);
                        p1.n1 n1VarL = tVar13.l();
                        b2.t tVarI = fg.a.I(tVarL, oVar12);
                        b3.l.Po.getClass();
                        Function0 function0 = b3.k.f17270b;
                        tVar13.f0();
                        if (tVar13.S) {
                            tVar13.k(function0);
                        } else {
                            tVar13.p0();
                        }
                        p1.a0.j(r0VarD, b3.k.f17275g, oVar12);
                        p1.a0.j(n1VarL, b3.k.f17274f, oVar12);
                        b3.i iVar = b3.k.f17278j;
                        if (tVar13.S || !Intrinsics.b(tVar13.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar13, iHashCode, iVar);
                        }
                        p1.a0.j(tVarI, b3.k.f17272d, oVar12);
                        g9.b(x7.f.Y(oVar12, 2132019393), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar12, 0, 0, 131070);
                        tVar13.p(true);
                    }
                }
                break;
            case 12:
                p1.o oVar13 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar14 = (p1.t) oVar13;
                    if (tVar14.E()) {
                        tVar14.V();
                    } else {
                        b2.t tVarL2 = androidx.compose.foundation.layout.d.l(b2.r.f17024a, 24, 0.0f, 2);
                        z2.r0 r0VarD2 = k0.p.d(b2.d.f16997a, false);
                        p1.t tVar15 = (p1.t) oVar13;
                        int iHashCode2 = Long.hashCode(tVar15.T);
                        p1.n1 n1VarL2 = tVar15.l();
                        b2.t tVarI2 = fg.a.I(tVarL2, oVar13);
                        b3.l.Po.getClass();
                        Function0 function02 = b3.k.f17270b;
                        tVar15.f0();
                        if (tVar15.S) {
                            tVar15.k(function02);
                        } else {
                            tVar15.p0();
                        }
                        p1.a0.j(r0VarD2, b3.k.f17275g, oVar13);
                        p1.a0.j(n1VarL2, b3.k.f17274f, oVar13);
                        b3.i iVar2 = b3.k.f17278j;
                        if (tVar15.S || !Intrinsics.b(tVar15.P(), Integer.valueOf(iHashCode2))) {
                            a2.c.u(iHashCode2, tVar15, iHashCode2, iVar2);
                        }
                        p1.a0.j(tVarI2, b3.k.f17272d, oVar13);
                        g9.b(x7.f.Y(oVar13, 2132019392), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar13, 0, 0, 131070);
                        tVar15.p(true);
                    }
                }
                break;
            case 13:
                p1.o oVar14 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar16 = (p1.t) oVar14;
                    if (tVar16.E()) {
                        tVar16.V();
                    } else {
                        l1.b3.a(ul.b.V(2131231833, oVar14, 0), null, null, 0L, oVar14, 48, 12);
                    }
                }
                break;
            case 14:
                p1.o oVar15 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar17 = (p1.t) oVar15;
                    if (tVar17.E()) {
                        tVar17.V();
                    } else {
                        ky.l.j(2132019041, 0, null, oVar15, 0, 6);
                    }
                }
                break;
            case 15:
                p1.o oVar16 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar18 = (p1.t) oVar16;
                    if (tVar18.E()) {
                        tVar18.V();
                    } else {
                        ky.l.j(2132019150, 2132019151, null, oVar16, 0, 4);
                    }
                }
                break;
            case 16:
                p1.o oVar17 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar19 = (p1.t) oVar17;
                    if (tVar19.E()) {
                        tVar19.V();
                    } else {
                        ky.l.j(2132019269, 0, null, oVar17, 0, 6);
                    }
                }
                break;
            case 17:
                p1.o oVar18 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar20 = (p1.t) oVar18;
                    if (tVar20.E()) {
                        tVar20.V();
                    } else {
                        p1.t tVar21 = (p1.t) oVar18;
                        g9.b("OVERRIDE", null, ((l1.d1) tVar21.j(l1.g1.f73330a)).f73148a, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, ((p9) tVar21.j(q9.f73875a)).n, oVar18, 6, 0, 65530);
                    }
                }
                break;
            case 18:
                p1.o oVar19 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar22 = (p1.t) oVar19;
                    if (tVar22.E()) {
                        tVar22.V();
                    } else {
                        k0.i2.b(androidx.compose.foundation.layout.e.g(b2.r.f17024a, 24), oVar19);
                    }
                }
                break;
            case 19:
                p1.o oVar20 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar23 = (p1.t) oVar20;
                    if (tVar23.E()) {
                        tVar23.V();
                    } else {
                        o2.g gVarG = p10.c0.G();
                        String strY = x7.f.Y(oVar20, 2132019504);
                        p1.t tVar24 = (p1.t) oVar20;
                        tVar24.b0(1200862521);
                        long jB = ((m3.p0) tVar24.j(g9.f73360a)).b();
                        if (jB == 16) {
                            jB = ((i2.s) tVar24.j(l1.s1.f73932a)).f61148a;
                        }
                        long j11 = jB;
                        tVar24.p(false);
                        l1.b3.b(gVarG, strY, null, j11, tVar24, 0, 4);
                    }
                }
                break;
            case 20:
                p1.o oVar21 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar25 = (p1.t) oVar21;
                    if (tVar25.E()) {
                        tVar25.V();
                    } else {
                        e10.z2.l(oVar21, 0);
                    }
                }
                break;
            case 21:
                p1.o oVar22 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar26 = (p1.t) oVar22;
                    if (tVar26.E()) {
                        tVar26.V();
                    } else {
                        e10.z2.c(0, 2, null, x7.f.Y(oVar22, 2132019298), oVar22);
                    }
                }
                break;
            case 22:
                p1.o oVar23 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar27 = (p1.t) oVar23;
                    if (tVar27.E()) {
                        tVar27.V();
                    } else {
                        e10.z2.d(null, 2132019166, 0, oVar23, 2);
                    }
                }
                break;
            case 23:
                p1.o oVar24 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar28 = (p1.t) oVar24;
                    if (tVar28.E()) {
                        tVar28.V();
                    } else {
                        e10.z2.l(oVar24, 0);
                    }
                }
                break;
            case 24:
                p1.o oVar25 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar29 = (p1.t) oVar25;
                    if (tVar29.E()) {
                        tVar29.V();
                    } else {
                        e10.z2.d(null, 2132019231, 0, oVar25, 2);
                    }
                }
                break;
            case 25:
                p1.o oVar26 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar30 = (p1.t) oVar26;
                    if (tVar30.E()) {
                        tVar30.V();
                    } else {
                        e10.z2.l(oVar26, 0);
                    }
                }
                break;
            case 26:
                p1.o oVar27 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar31 = (p1.t) oVar27;
                    if (tVar31.E()) {
                        tVar31.V();
                    } else {
                        e10.z2.c(0, 2, null, x7.f.Y(oVar27, 2132018765), oVar27);
                    }
                }
                break;
            case 27:
                p1.o oVar28 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar32 = (p1.t) oVar28;
                    if (tVar32.E()) {
                        tVar32.V();
                    } else {
                        ky.l.j(2132017793, 0, null, oVar28, 0, 6);
                    }
                }
                break;
            case 28:
                p1.o oVar29 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar33 = (p1.t) oVar29;
                    if (tVar33.E()) {
                        tVar33.V();
                    }
                }
                break;
            default:
                p1.o oVar30 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar34 = (p1.t) oVar30;
                    if (tVar34.E()) {
                        tVar34.V();
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
