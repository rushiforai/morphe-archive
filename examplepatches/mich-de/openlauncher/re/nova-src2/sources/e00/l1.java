package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;
import l1.p9;
import l1.q9;

/* loaded from: classes4.dex */
public final class l1 implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final l1 f50666b = new l1(0);

    /* renamed from: c, reason: collision with root package name */
    public static final l1 f50667c = new l1(1);

    /* renamed from: d, reason: collision with root package name */
    public static final l1 f50668d = new l1(2);

    /* renamed from: e, reason: collision with root package name */
    public static final l1 f50669e = new l1(3);

    /* renamed from: f, reason: collision with root package name */
    public static final l1 f50670f = new l1(4);

    /* renamed from: g, reason: collision with root package name */
    public static final l1 f50671g = new l1(5);

    /* renamed from: h, reason: collision with root package name */
    public static final l1 f50672h = new l1(6);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50673a;

    public /* synthetic */ l1(int i5) {
        this.f50673a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003c  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0123  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0176  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x01cb  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x02ea  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f50673a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g9.b("Clear Config Cache", null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, ((p9) ((p1.t) oVar).j(q9.f73875a)).o, oVar, 6, 0, 65534);
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
                        b2.r rVar = b2.r.f17024a;
                        k0.i2.b(androidx.compose.foundation.layout.e.g(rVar, 16), oVar2);
                        p1.z2 z2Var = q9.f73875a;
                        p1.t tVar3 = (p1.t) oVar2;
                        g9.b("Live Ad Rendering", null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, ((p9) tVar3.j(z2Var)).f73806i, oVar2, 6, 0, 65534);
                        k0.i2.b(androidx.compose.foundation.layout.e.g(rVar, 4), oVar2);
                        qx.l lVar = qx.l.f84545g;
                        if (lVar.h()) {
                            tVar3.b0(1352163914);
                            cl.l0.e(oVar2, 438);
                            tVar3.p(false);
                        } else {
                            tVar3.b0(1352418579);
                            g9.b("APP_DRAWER placement disabled (adSize=" + lVar.b() + ")", null, ((l1.d1) tVar3.j(l1.g1.f73330a)).f73168w, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, ((p9) tVar3.j(z2Var)).f73809l, oVar2, 0, 0, 65530);
                            tVar3.p(false);
                        }
                    }
                }
                break;
            case 2:
                p1.o oVar3 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar4 = (p1.t) oVar3;
                    if (tVar4.E()) {
                        tVar4.V();
                    } else {
                        g9.b(x7.f.Y(oVar3, 2132019277), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 0, 0, 131070);
                    }
                }
                break;
            case 3:
                p1.o oVar4 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar5 = (p1.t) oVar4;
                    if (tVar5.E()) {
                        tVar5.V();
                    } else {
                        g9.b(x7.f.Y(oVar4, 17039360), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar4, 0, 0, 131070);
                    }
                }
                break;
            case 4:
                p1.o oVar5 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar6 = (p1.t) oVar5;
                    if (tVar6.E()) {
                        tVar6.V();
                    } else {
                        g9.b(x7.f.Y(oVar5, 2132019282), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar5, 0, 0, 131070);
                    }
                }
                break;
            case 5:
                p1.o oVar6 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar7 = (p1.t) oVar6;
                    if (tVar7.E()) {
                        tVar7.V();
                    } else {
                        g9.b(x7.f.Y(oVar6, 17039360), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar6, 0, 0, 131070);
                    }
                }
                break;
            default:
                k0.t tVar8 = (k0.t) obj;
                p1.o oVar7 = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p1.t) oVar7).f(tVar8) ? 4 : 2;
                }
                if ((iIntValue & 19) == 18) {
                    p1.t tVar9 = (p1.t) oVar7;
                    if (tVar9.E()) {
                        tVar9.V();
                    } else {
                        e10.z2.a("New", i2.r0.c(4292232486L), tVar8.a(b2.r.f17024a, b2.d.f17005i), oVar7, 432, 0);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
