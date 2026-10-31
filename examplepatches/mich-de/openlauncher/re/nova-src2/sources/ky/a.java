package ky;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;
import p1.t;

/* loaded from: classes4.dex */
public final class a implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f72751b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f72752c = new a(1);

    /* renamed from: d, reason: collision with root package name */
    public static final a f72753d = new a(2);

    /* renamed from: e, reason: collision with root package name */
    public static final a f72754e = new a(3);

    /* renamed from: f, reason: collision with root package name */
    public static final a f72755f = new a(4);

    /* renamed from: g, reason: collision with root package name */
    public static final a f72756g = new a(5);

    /* renamed from: h, reason: collision with root package name */
    public static final a f72757h = new a(6);

    /* renamed from: i, reason: collision with root package name */
    public static final a f72758i = new a(7);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72759a;

    public /* synthetic */ a(int i5) {
        this.f72759a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x022d  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01ab  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x01ec  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f72759a) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                p1.o oVar = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((t) oVar).g(zBooleanValue) ? 4 : 2;
                }
                if ((iIntValue & 19) == 18) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        a.a.n(zBooleanValue, oVar, iIntValue & 14);
                    }
                }
                break;
            case 1:
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                p1.o oVar2 = (p1.o) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((t) oVar2).g(zBooleanValue2) ? 4 : 2;
                }
                if ((iIntValue2 & 19) == 18) {
                    t tVar2 = (t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        a.a.n(zBooleanValue2, oVar2, iIntValue2 & 14);
                    }
                }
                break;
            case 2:
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                p1.o oVar3 = (p1.o) obj2;
                int iIntValue3 = ((Number) obj3).intValue();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((t) oVar3).g(zBooleanValue3) ? 4 : 2;
                }
                if ((iIntValue3 & 19) == 18) {
                    t tVar3 = (t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        a.a.n(zBooleanValue3, oVar3, iIntValue3 & 14);
                    }
                }
                break;
            case 3:
                boolean zBooleanValue4 = ((Boolean) obj).booleanValue();
                p1.o oVar4 = (p1.o) obj2;
                int iIntValue4 = ((Number) obj3).intValue();
                if ((iIntValue4 & 6) == 0) {
                    iIntValue4 |= ((t) oVar4).g(zBooleanValue4) ? 4 : 2;
                }
                if ((iIntValue4 & 19) == 18) {
                    t tVar4 = (t) oVar4;
                    if (tVar4.E()) {
                        tVar4.V();
                    } else {
                        a.a.n(zBooleanValue4, oVar4, iIntValue4 & 14);
                    }
                }
                break;
            case 4:
                boolean zBooleanValue5 = ((Boolean) obj).booleanValue();
                p1.o oVar5 = (p1.o) obj2;
                int iIntValue5 = ((Number) obj3).intValue();
                if ((iIntValue5 & 6) == 0) {
                    iIntValue5 |= ((t) oVar5).g(zBooleanValue5) ? 4 : 2;
                }
                if ((iIntValue5 & 19) == 18) {
                    t tVar5 = (t) oVar5;
                    if (tVar5.E()) {
                        tVar5.V();
                    } else {
                        a.a.n(zBooleanValue5, oVar5, iIntValue5 & 14);
                    }
                }
                break;
            case 5:
                boolean zBooleanValue6 = ((Boolean) obj).booleanValue();
                p1.o oVar6 = (p1.o) obj2;
                int iIntValue6 = ((Number) obj3).intValue();
                if ((iIntValue6 & 6) == 0) {
                    iIntValue6 |= ((t) oVar6).g(zBooleanValue6) ? 4 : 2;
                }
                if ((iIntValue6 & 19) == 18) {
                    t tVar6 = (t) oVar6;
                    if (tVar6.E()) {
                        tVar6.V();
                    } else {
                        a.a.n(zBooleanValue6, oVar6, iIntValue6 & 14);
                    }
                }
                break;
            case 6:
                p1.o oVar7 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    t tVar7 = (t) oVar7;
                    if (tVar7.E()) {
                        tVar7.V();
                    } else {
                        g9.b(x7.f.Y(oVar7, 17039370), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar7, 0, 0, 131070);
                    }
                }
                break;
            default:
                p1.o oVar8 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    t tVar8 = (t) oVar8;
                    if (tVar8.E()) {
                        tVar8.V();
                    } else {
                        g9.b(x7.f.Y(oVar8, 17039370), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar8, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
