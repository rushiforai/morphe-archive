package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class v0 implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final v0 f54038b = new v0(0);

    /* renamed from: c, reason: collision with root package name */
    public static final v0 f54039c = new v0(1);

    /* renamed from: d, reason: collision with root package name */
    public static final v0 f54040d = new v0(2);

    /* renamed from: e, reason: collision with root package name */
    public static final v0 f54041e = new v0(3);

    /* renamed from: f, reason: collision with root package name */
    public static final v0 f54042f = new v0(4);

    /* renamed from: g, reason: collision with root package name */
    public static final v0 f54043g = new v0(5);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54044a;

    public /* synthetic */ v0(int i5) {
        this.f54044a = i5;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f54044a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                p1.t tVar = (p1.t) oVar;
                if (!tVar.S(iIntValue & 1, (iIntValue & 17) != 16)) {
                    tVar.V();
                }
                return Unit.f71706a;
            case 1:
                p1.o oVar2 = (p1.o) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                p1.t tVar2 = (p1.t) oVar2;
                if (!tVar2.S(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    tVar2.V();
                }
                return Unit.f71706a;
            case 2:
                b4 b4Var = (b4) obj;
                p1.o oVar3 = (p1.o) obj2;
                int iIntValue3 = ((Number) obj3).intValue();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p1.t) oVar3).f(b4Var) ? 4 : 2;
                }
                p1.t tVar3 = (p1.t) oVar3;
                if (tVar3.S(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                    com.google.android.gms.internal.consent_sdk.e0.m(b4Var, null, null, tVar3, iIntValue3 & 14);
                } else {
                    tVar3.V();
                }
                return Unit.f71706a;
            case 3:
                b4 b4Var2 = (b4) obj;
                p1.o oVar4 = (p1.o) obj2;
                int iIntValue4 = ((Number) obj3).intValue();
                if ((iIntValue4 & 6) == 0) {
                    iIntValue4 |= ((p1.t) oVar4).f(b4Var2) ? 4 : 2;
                }
                p1.t tVar4 = (p1.t) oVar4;
                if (tVar4.S(iIntValue4 & 1, (iIntValue4 & 19) != 18)) {
                    com.google.android.gms.internal.consent_sdk.e0.m(b4Var2, null, null, tVar4, iIntValue4 & 14);
                } else {
                    tVar4.V();
                }
                return Unit.f71706a;
            case 4:
                if (obj != null) {
                    throw new ClassCastException();
                }
                p1.o oVar5 = (p1.o) obj2;
                int iIntValue5 = ((Number) obj3).intValue();
                if ((iIntValue5 & 6) == 0) {
                    iIntValue5 |= (iIntValue5 & 8) == 0 ? ((p1.t) oVar5).f(null) : ((p1.t) oVar5).h(null) ? 4 : 2;
                }
                p1.t tVar5 = (p1.t) oVar5;
                if (tVar5.S(iIntValue5 & 1, (iIntValue5 & 19) != 18)) {
                    d4.a(null, null, 0L, 0L, 0L, 0.0f, tVar5, iIntValue5 & 14);
                } else {
                    tVar5.V();
                }
                return Unit.f71706a;
            default:
                c0.w1 w1Var = (c0.w1) obj;
                ((Number) obj3).intValue();
                p1.t tVar6 = (p1.t) ((p1.o) obj2);
                tVar6.b0(1849239065);
                f2 f2Var = f2.f53527a;
                f2 f2Var2 = f2.f53528b;
                Object objI = w1Var.c(f2Var, f2Var2) ? c0.f.i(67, 0, c0.b0.f18713d, 2) : (w1Var.c(f2Var2, f2Var) || w1Var.c(f2.f53529c, f2Var2)) ? new c0.h2(83, 67, c0.b0.f18713d) : c0.f.h(0.0f, 0.0f, null, 7);
                tVar6.p(false);
                return objI;
        }
    }
}
