package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.g9;

/* loaded from: classes4.dex */
public final class g1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50413a;

    /* renamed from: b, reason: collision with root package name */
    public static final g1 f50390b = new g1(0);

    /* renamed from: c, reason: collision with root package name */
    public static final g1 f50391c = new g1(1);

    /* renamed from: d, reason: collision with root package name */
    public static final g1 f50392d = new g1(2);

    /* renamed from: e, reason: collision with root package name */
    public static final g1 f50393e = new g1(3);

    /* renamed from: f, reason: collision with root package name */
    public static final g1 f50394f = new g1(4);

    /* renamed from: g, reason: collision with root package name */
    public static final g1 f50395g = new g1(5);

    /* renamed from: h, reason: collision with root package name */
    public static final g1 f50396h = new g1(6);

    /* renamed from: i, reason: collision with root package name */
    public static final g1 f50397i = new g1(7);

    /* renamed from: j, reason: collision with root package name */
    public static final g1 f50398j = new g1(8);

    /* renamed from: k, reason: collision with root package name */
    public static final g1 f50399k = new g1(9);

    /* renamed from: l, reason: collision with root package name */
    public static final g1 f50400l = new g1(10);

    /* renamed from: m, reason: collision with root package name */
    public static final g1 f50401m = new g1(11);
    public static final g1 n = new g1(12);
    public static final g1 o = new g1(13);

    /* renamed from: p, reason: collision with root package name */
    public static final g1 f50402p = new g1(14);

    /* renamed from: q, reason: collision with root package name */
    public static final g1 f50403q = new g1(15);

    /* renamed from: r, reason: collision with root package name */
    public static final g1 f50404r = new g1(16);

    /* renamed from: s, reason: collision with root package name */
    public static final g1 f50405s = new g1(17);

    /* renamed from: t, reason: collision with root package name */
    public static final g1 f50406t = new g1(18);

    /* renamed from: u, reason: collision with root package name */
    public static final g1 f50407u = new g1(19);

    /* renamed from: v, reason: collision with root package name */
    public static final g1 f50408v = new g1(20);

    /* renamed from: w, reason: collision with root package name */
    public static final g1 f50409w = new g1(21);

    /* renamed from: x, reason: collision with root package name */
    public static final g1 f50410x = new g1(22);

    /* renamed from: y, reason: collision with root package name */
    public static final g1 f50411y = new g1(23);

    /* renamed from: z, reason: collision with root package name */
    public static final g1 f50412z = new g1(24);
    public static final g1 A = new g1(25);
    public static final g1 B = new g1(26);
    public static final g1 C = new g1(27);
    public static final g1 D = new g1(28);
    public static final g1 E = new g1(29);

    public /* synthetic */ g1(int i5) {
        this.f50413a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0240  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x026e  */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x029c  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x02c9  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x02f7  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x0325  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0353  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x0381  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x03b6  */
    /* JADX WARN: Removed duplicated region for block: B:181:0x03ec  */
    /* JADX WARN: Removed duplicated region for block: B:190:0x043b  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:207:0x04aa  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x055c  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01b5  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01e7  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0214  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f50413a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    }
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
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
                        l1.b3.b(ex.i.x(), "Back", null, 0L, oVar3, 48, 12);
                    }
                }
                break;
            case 3:
                p1.o oVar4 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar4 = (p1.t) oVar4;
                    if (tVar4.E()) {
                        tVar4.V();
                    }
                }
                break;
            case 4:
                p1.o oVar5 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar5 = (p1.t) oVar5;
                    if (tVar5.E()) {
                        tVar5.V();
                    }
                }
                break;
            case 5:
                p1.o oVar6 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar6 = (p1.t) oVar6;
                    if (tVar6.E()) {
                        tVar6.V();
                    }
                }
                break;
            case 6:
                p1.o oVar7 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar7 = (p1.t) oVar7;
                    if (tVar7.E()) {
                        tVar7.V();
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
                        l1.b3.b(ex.i.x(), "Back", null, 0L, oVar8, 48, 12);
                    }
                }
                break;
            case 8:
                p1.o oVar9 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar9 = (p1.t) oVar9;
                    if (tVar9.E()) {
                        tVar9.V();
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
                        g9.b(x7.f.Y(oVar10, 2132017484), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar10, 0, 0, 131070);
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
                        g9.b(x7.f.Y(oVar11, 2132017485), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar11, 0, 0, 131070);
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
                        l1.b3.b(lb0.b.A(), x7.f.Y(oVar12, 2132019379), null, 0L, oVar12, 0, 12);
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
                        l1.b3.a(ul.b.V(2131231833, oVar13, 0), null, null, 0L, oVar13, 48, 12);
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
                        ky.l.j(2132019102, 2132019104, null, oVar14, 0, 4);
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
                        ky.l.j(2132019494, 2132019495, null, oVar15, 0, 4);
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
                        ky.l.j(2132019497, 2132019498, null, oVar16, 0, 4);
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
                        ky.l.j(2132019139, 2132019140, null, oVar17, 0, 4);
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
                        ky.l.i(54, 4, null, "Reset Nova Now permission prompt", "Show the permission prompt in Nova Now again.", oVar18);
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
                        ky.l.j(2132019155, 2132019156, null, oVar19, 0, 4);
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
                        ky.l.j(2132019144, 2132019145, null, oVar20, 0, 4);
                    }
                }
                break;
            case 20:
                p1.o oVar21 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar21 = (p1.t) oVar21;
                    if (tVar21.E()) {
                        tVar21.V();
                    } else {
                        ky.l.j(2132019141, 0, null, oVar21, 0, 6);
                    }
                }
                break;
            case 21:
                p1.o oVar22 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar22 = (p1.t) oVar22;
                    if (tVar22.E()) {
                        tVar22.V();
                    } else {
                        ky.l.i(54, 4, null, "Don't crash", "Bypass system crash handler, for devices where default launcher gets reset on crash. Nova will still exit on error", oVar22);
                    }
                }
                break;
            case 22:
                p1.o oVar23 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar23 = (p1.t) oVar23;
                    if (tVar23.E()) {
                        tVar23.V();
                    } else {
                        l1.b3.b(lb0.b.A(), "Refresh", null, 0L, oVar23, 48, 12);
                    }
                }
                break;
            case 23:
                p1.o oVar24 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar24 = (p1.t) oVar24;
                    if (tVar24.E()) {
                        tVar24.V();
                    } else {
                        ky.l.i(54, 4, null, "Legacy swipe Expand Notifications", "Less responsive but potentially more compatible approach to the swipe down gesture to expand notifications. This is generally not needed or wanted, but may be needed on some devices if the gesture is not working well.", oVar24);
                    }
                }
                break;
            case 24:
                p1.o oVar25 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar25 = (p1.t) oVar25;
                    if (tVar25.E()) {
                        tVar25.V();
                    } else {
                        ky.l.i(54, 4, null, "Don't send full widget size ranges", "Android 12+ introduced a new widget size report mechanism that some widgets may not like. Disable if widgets are not displaying correctly.", oVar25);
                    }
                }
                break;
            case 25:
                p1.o oVar26 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar26 = (p1.t) oVar26;
                    if (tVar26.E()) {
                        tVar26.V();
                    } else {
                        ky.l.i(54, 4, null, "Gesture Nav Contract", "Support Android's enhanced animations when using system gesture navigation. Not all devices support this and some devices have animation bugs when in use.", oVar26);
                    }
                }
                break;
            case 26:
                p1.o oVar27 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar27 = (p1.t) oVar27;
                    if (tVar27.E()) {
                        tVar27.V();
                    } else {
                        ky.l.i(384, 0, androidx.compose.foundation.layout.d.n(b2.r.f17024a, 0.0f, 0.0f, 16, 0.0f, 11), x7.f.Y(oVar27, 2132019277), x7.f.Y(oVar27, 2132019278), oVar27);
                    }
                }
                break;
            case 27:
                p1.o oVar28 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar28 = (p1.t) oVar28;
                    if (tVar28.E()) {
                        tVar28.V();
                    } else {
                        ky.l.i(384, 0, androidx.compose.foundation.layout.d.n(b2.r.f17024a, 0.0f, 0.0f, 16, 0.0f, 11), x7.f.Y(oVar28, 2132019283), x7.f.Y(oVar28, 2132019285), oVar28);
                    }
                }
                break;
            case 28:
                p1.o oVar29 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar29 = (p1.t) oVar29;
                    if (tVar29.E()) {
                        tVar29.V();
                    } else {
                        ky.l.j(2132019272, 2132019273, androidx.compose.foundation.layout.d.n(b2.r.f17024a, 0.0f, 0.0f, 16, 0.0f, 11), oVar29, 384, 0);
                    }
                }
                break;
            default:
                p1.o oVar30 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar30 = (p1.t) oVar30;
                    if (tVar30.E()) {
                        tVar30.V();
                    } else {
                        ky.l.i(384, 0, androidx.compose.foundation.layout.d.n(b2.r.f17024a, 0.0f, 0.0f, 16, 0.0f, 11), x7.f.Y(oVar30, 2132019159), x7.f.Y(oVar30, 2132019160), oVar30);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
