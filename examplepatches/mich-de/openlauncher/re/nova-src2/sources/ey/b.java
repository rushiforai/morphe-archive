package ey;

import android.content.Context;
import android.util.DisplayMetrics;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import c3.z1;
import cw.c0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.math.MathKt;
import l1.g9;
import p1.g1;

/* loaded from: classes4.dex */
public final class b implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53143a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c f53144b;

    public /* synthetic */ b(c cVar, int i5) {
        this.f53143a = i5;
        this.f53144b = cVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00b0  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        tz.d dVarC;
        switch (this.f53143a) {
            case 0:
                float f11 = ((y3.f) obj).f96602a;
                p1.o oVar = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p1.t) oVar).c(f11) ? 4 : 2;
                }
                if ((iIntValue & 19) == 18) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        p1.t tVar2 = (p1.t) oVar;
                        int iB = MathKt.b(((y3.c) tVar2.j(z1.f19497h)).mo102toPx0680j_4(f11));
                        Context context = (Context) tVar2.j(AndroidCompositionLocals_androidKt.f14166b);
                        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
                        Object objN = za.d.N(context);
                        tz.v vVar = null;
                        za.d dVar = objN instanceof za.d ? (za.d) objN : null;
                        if (dVar != null && (dVarC = dVar.C()) != null) {
                            vVar = dVarC.f90099b;
                        }
                        tz.v vVar2 = vVar;
                        c cVar = this.f53144b;
                        b2.t tVarQ = androidx.compose.foundation.layout.e.q(b2.r.f17024a, f11, cVar.f53146c ? 1.4f * f11 : f11);
                        tVar2.b0(1378902740);
                        boolean zH = tVar2.h(cVar) | tVar2.f(vVar2) | tVar2.h(displayMetrics) | tVar2.d(iB);
                        Object objP = tVar2.P();
                        g1 g1Var = p1.n.f81514a;
                        if (zH || objP == g1Var) {
                            a aVar = new a(iB, 0, cVar, vVar2, displayMetrics);
                            tVar2.m0(aVar);
                            objP = aVar;
                        }
                        Function1 function1 = (Function1) objP;
                        tVar2.p(false);
                        tVar2.b0(1378944734);
                        boolean zH2 = tVar2.h(cVar);
                        Object objP2 = tVar2.P();
                        if (zH2 || objP2 == g1Var) {
                            objP2 = new c0(cVar, 17);
                            tVar2.m0(objP2);
                        }
                        tVar2.p(false);
                        androidx.compose.ui.viewinterop.a.b(function1, tVarQ, (Function1) objP2, tVar2, 0, 0);
                    }
                }
                break;
            default:
                int iIntValue2 = ((Number) obj).intValue();
                p1.o oVar2 = (p1.o) obj2;
                int iIntValue3 = ((Number) obj3).intValue();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p1.t) oVar2).d(iIntValue2) ? 4 : 2;
                }
                if ((iIntValue3 & 19) == 18) {
                    p1.t tVar3 = (p1.t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        g9.b(this.f53144b.f53145b.f57300l.toString(), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 2, false, iIntValue2, 0, null, null, oVar2, 0, ((iIntValue3 << 9) & 7168) | 48, 120830);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
