package s00;

import e00.i0;
import e10.s2;
import e10.y2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;
import p1.e1;
import p1.g1;
import p1.n;
import p1.o;
import p1.p;
import p1.t;
import q00.l;

/* loaded from: classes4.dex */
public final class c implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final c f86528b = new c(0);

    /* renamed from: c, reason: collision with root package name */
    public static final c f86529c = new c(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86530a;

    public /* synthetic */ c(int i5) {
        this.f86530a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00fc  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f86530a) {
            case 0:
                Function0 function0 = (Function0) obj;
                o oVar = (o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((t) oVar).h(function0) ? 4 : 2;
                }
                if ((iIntValue & 19) == 18) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        ps.k.d(function0, oVar, iIntValue & 14);
                    }
                }
                break;
            default:
                Function0 function02 = (Function0) obj;
                o oVar2 = (o) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((t) oVar2).h(function02) ? 4 : 2;
                }
                if ((iIntValue2 & 19) == 18) {
                    t tVar2 = (t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        y2.f51877a.getClass();
                        s2 s2VarW0 = y2.w0();
                        t tVar3 = (t) oVar2;
                        tVar3.b0(-1180187305);
                        e1 e1VarA = androidx.compose.runtime.d.a(s2VarW0.c(), s2VarW0.l(), null, tVar3, 0, 2);
                        l lVar = new l(s2VarW0, e1VarA);
                        Object objF = a2.c.f(553304180, tVar3, false);
                        g1 g1Var = n.f81514a;
                        if (objF == g1Var) {
                            objF = androidx.compose.runtime.d.k(e1VarA.getValue());
                            tVar3.m0(objF);
                        }
                        e1 e1Var = (e1) objF;
                        tVar3.p(false);
                        String strY = x7.f.Y(tVar3, 2132018754);
                        tVar3.b0(553312491);
                        boolean zF = ((iIntValue2 & 14) == 4) | tVar3.f(lVar);
                        Object objP = tVar3.P();
                        if (zF || objP == g1Var) {
                            objP = new p(6, lVar, function02, e1Var);
                            tVar3.m0(objP);
                        }
                        tVar3.p(false);
                        lb0.b.b(strY, false, null, null, function02, null, (Function0) objP, x1.f.d(-633091087, new i0(e1Var, 17), tVar3), tVar3, ((iIntValue2 << 12) & 57344) | 12582912, 46);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
