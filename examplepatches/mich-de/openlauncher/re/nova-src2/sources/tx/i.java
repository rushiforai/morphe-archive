package tx;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import l1.g9;
import l1.p9;
import l1.q9;

/* loaded from: classes4.dex */
public final class i implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final i f89788b = new i(0);

    /* renamed from: c, reason: collision with root package name */
    public static final i f89789c = new i(1);

    /* renamed from: d, reason: collision with root package name */
    public static final i f89790d = new i(2);

    /* renamed from: e, reason: collision with root package name */
    public static final i f89791e = new i(3);

    /* renamed from: f, reason: collision with root package name */
    public static final i f89792f = new i(4);

    /* renamed from: g, reason: collision with root package name */
    public static final i f89793g = new i(5);

    /* renamed from: h, reason: collision with root package name */
    public static final i f89794h = new i(6);

    /* renamed from: i, reason: collision with root package name */
    public static final i f89795i = new i(7);

    /* renamed from: j, reason: collision with root package name */
    public static final i f89796j = new i(8);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f89797a;

    public /* synthetic */ i(int i5) {
        this.f89797a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0425  */
    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0223  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x031e  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0372  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x03d1  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f89797a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g9.b(x7.f.Y(oVar, 2132018958), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, m3.p0.a(((p9) ((p1.t) oVar).j(q9.f73875a)).f73805h, 0L, 0L, q3.b0.f83534h, null, 0L, 0, 0L, null, null, 16777211), oVar, 0, 0, 65534);
                    }
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        g9.b(x7.f.Y(oVar2, 2132018821), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 0, 0, 131070);
                    }
                }
                break;
            case 2:
                p1.o oVar3 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar3 = (p1.t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        g9.b(x7.f.Y(oVar3, 2132018852), null, ((l1.d1) ((p1.t) oVar3).j(l1.g1.f73330a)).f73148a, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 0, 0, 131066);
                    }
                }
                break;
            case 3:
                p1.o oVar4 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar4 = (p1.t) oVar4;
                    if (tVar4.E()) {
                        tVar4.V();
                    } else {
                        g9.b(x7.f.Y(oVar4, 2132017603), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar4, 0, 0, 131070);
                    }
                }
                break;
            case 4:
                p1.o oVar5 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar5 = (p1.t) oVar5;
                    if (tVar5.E()) {
                        tVar5.V();
                    } else {
                        k0.x xVarA = k0.w.a(k0.k.f70657c, b2.d.n, oVar5, 48);
                        p1.t tVar6 = (p1.t) oVar5;
                        int iHashCode = Long.hashCode(tVar6.T);
                        p1.n1 n1VarL = tVar6.l();
                        b2.t tVarI = fg.a.I(b2.r.f17024a, oVar5);
                        b3.l.Po.getClass();
                        Function0 function0 = b3.k.f17270b;
                        tVar6.f0();
                        if (tVar6.S) {
                            tVar6.k(function0);
                        } else {
                            tVar6.p0();
                        }
                        p1.a0.j(xVarA, b3.k.f17275g, oVar5);
                        p1.a0.j(n1VarL, b3.k.f17274f, oVar5);
                        b3.i iVar = b3.k.f17278j;
                        if (tVar6.S || !Intrinsics.b(tVar6.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar6, iHashCode, iVar);
                        }
                        p1.a0.j(tVarI, b3.k.f17272d, oVar5);
                        g9.b(x7.f.Y(oVar5, 2132018796), null, 0L, 0L, null, q3.b0.f83534h, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar5, 196608, 0, 131038);
                        p1.t tVar7 = (p1.t) oVar5;
                        g9.b(x7.f.Y(oVar5, 2132018797), null, ((l1.d1) tVar7.j(l1.g1.f73330a)).f73164s, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, ((p9) tVar7.j(q9.f73875a)).f73809l, oVar5, 0, 0, 65530);
                        tVar6.p(true);
                    }
                }
                break;
            case 5:
                p1.o oVar6 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar8 = (p1.t) oVar6;
                    if (tVar8.E()) {
                        tVar8.V();
                    } else {
                        k0.x xVarA2 = k0.w.a(k0.k.f70657c, b2.d.n, oVar6, 48);
                        p1.t tVar9 = (p1.t) oVar6;
                        int iHashCode2 = Long.hashCode(tVar9.T);
                        p1.n1 n1VarL2 = tVar9.l();
                        b2.t tVarI2 = fg.a.I(b2.r.f17024a, oVar6);
                        b3.l.Po.getClass();
                        Function0 function02 = b3.k.f17270b;
                        tVar9.f0();
                        if (tVar9.S) {
                            tVar9.k(function02);
                        } else {
                            tVar9.p0();
                        }
                        p1.a0.j(xVarA2, b3.k.f17275g, oVar6);
                        p1.a0.j(n1VarL2, b3.k.f17274f, oVar6);
                        b3.i iVar2 = b3.k.f17278j;
                        if (tVar9.S || !Intrinsics.b(tVar9.P(), Integer.valueOf(iHashCode2))) {
                            a2.c.u(iHashCode2, tVar9, iHashCode2, iVar2);
                        }
                        p1.a0.j(tVarI2, b3.k.f17272d, oVar6);
                        g9.b(x7.f.Y(oVar6, 2132018801), null, 0L, 0L, null, q3.b0.f83534h, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar6, 196608, 0, 131038);
                        g9.b(x7.f.Y(oVar6, 2132018802), null, i2.s.b(0.7f, i2.s.f61140f), 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, ((p9) ((p1.t) oVar6).j(q9.f73875a)).f73809l, oVar6, 384, 0, 65530);
                        tVar9.p(true);
                    }
                }
                break;
            case 6:
                p1.o oVar7 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar10 = (p1.t) oVar7;
                    if (tVar10.E()) {
                        tVar10.V();
                    } else {
                        g9.b(x7.f.Y(oVar7, 2132018864), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar7, 0, 0, 131070);
                    }
                }
                break;
            case 7:
                p1.o oVar8 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar11 = (p1.t) oVar8;
                    if (tVar11.E()) {
                        tVar11.V();
                    } else {
                        g9.b(x7.f.Y(oVar8, 2132018868), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar8, 0, 0, 131070);
                    }
                }
                break;
            default:
                p1.o oVar9 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar12 = (p1.t) oVar9;
                    if (tVar12.E()) {
                        tVar12.V();
                    } else {
                        g9.b(x7.f.Y(oVar9, 2132018862), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar9, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
