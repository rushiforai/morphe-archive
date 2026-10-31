package m1;

import kotlin.Pair;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import p1.e1;
import p1.s2;

/* loaded from: classes2.dex */
public final class n extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f75726j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ f1.y f75727k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n(f1.y yVar, int i5) {
        super(0);
        this.f75726j = i5;
        this.f75727k = yVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f75726j) {
            case 0:
                return this.f75727k.h();
            case 1:
                f1.y yVar = this.f75727k;
                return new Pair(yVar.h(), yVar.f54115e.getValue());
            case 2:
                f1.y yVar2 = this.f75727k;
                Object value = ((s2) yVar2.f54119i).getValue();
                if (value != null) {
                    return value;
                }
                float fI = yVar2.i();
                e1 e1Var = yVar2.f54114d;
                if (Float.isNaN(fI)) {
                    return ((s2) e1Var).getValue();
                }
                Object value2 = ((s2) e1Var).getValue();
                d0 d0VarH = yVar2.h();
                float fC = d0VarH.c(value2);
                if (fC != fI && !Float.isNaN(fC)) {
                    if (fC < fI) {
                        Object objB = d0VarH.b(fI, true);
                        if (objB != null) {
                            return objB;
                        }
                    } else {
                        Object objB2 = d0VarH.b(fI, false);
                        if (objB2 != null) {
                            return objB2;
                        }
                    }
                }
                return value2;
            case 3:
                f1.y yVar3 = this.f75727k;
                float fC2 = yVar3.h().c(((s2) yVar3.f54114d).getValue());
                float fC3 = yVar3.h().c(yVar3.f54116f.getValue()) - fC2;
                float fAbs = Math.abs(fC3);
                float f11 = 1.0f;
                if (!Float.isNaN(fAbs) && fAbs > 1.0E-6f) {
                    float fL = (yVar3.l() - fC2) / fC3;
                    if (fL < 1.0E-6f) {
                        f11 = 0.0f;
                    } else if (fL <= 0.999999f) {
                        f11 = fL;
                    }
                }
                return Float.valueOf(f11);
            default:
                f1.y yVar4 = this.f75727k;
                Object value3 = ((s2) yVar4.f54119i).getValue();
                if (value3 != null) {
                    return value3;
                }
                float fI2 = yVar4.i();
                e1 e1Var2 = yVar4.f54114d;
                return !Float.isNaN(fI2) ? yVar4.e(fI2, 0.0f, ((s2) e1Var2).getValue()) : ((s2) e1Var2).getValue();
        }
    }
}
