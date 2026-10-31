package f1;

import kotlin.Pair;
import kotlin.jvm.functions.Function0;

/* loaded from: classes2.dex */
public final /* synthetic */ class q implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53870a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y f53871b;

    public /* synthetic */ q(y yVar, int i5) {
        this.f53870a = i5;
        this.f53871b = yVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0063  */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        float fL;
        switch (this.f53870a) {
            case 0:
                y yVar = this.f53871b;
                p1.e1 e1Var = yVar.f54119i;
                p1.e1 e1Var2 = yVar.f54114d;
                Object value = ((p1.s2) e1Var).getValue();
                if (value != null) {
                    return value;
                }
                float fI = yVar.i();
                return !Float.isNaN(fI) ? yVar.e(fI, 0.0f, ((p1.s2) e1Var2).getValue()) : ((p1.s2) e1Var2).getValue();
            case 1:
                y yVar2 = this.f53871b;
                p1.e1 e1Var3 = yVar2.f54119i;
                p1.e1 e1Var4 = yVar2.f54114d;
                Object value2 = ((p1.s2) e1Var3).getValue();
                if (value2 != null) {
                    return value2;
                }
                float fI2 = yVar2.i();
                if (Float.isNaN(fI2)) {
                    return ((p1.s2) e1Var4).getValue();
                }
                Object value3 = ((p1.s2) e1Var4).getValue();
                k2 k2VarG = yVar2.g();
                float fC = k2VarG.c(value3);
                if (fC != fI2 && !Float.isNaN(fC)) {
                    if (fC < fI2) {
                        Object objB = k2VarG.b(fI2, true);
                        if (objB != null) {
                            return objB;
                        }
                    } else {
                        Object objB2 = k2VarG.b(fI2, false);
                        if (objB2 != null) {
                            return objB2;
                        }
                    }
                }
                return value3;
            case 2:
                y yVar3 = this.f53871b;
                float fC2 = yVar3.g().c(((p1.s2) yVar3.f54114d).getValue());
                float fC3 = yVar3.g().c(yVar3.f54116f.getValue()) - fC2;
                float fAbs = Math.abs(fC3);
                if (Float.isNaN(fAbs) || fAbs <= 1.0E-6f) {
                    fL = 1.0f;
                } else {
                    fL = (yVar3.l() - fC2) / fC3;
                    if (fL < 1.0E-6f) {
                        fL = 0.0f;
                    } else if (fL > 0.999999f) {
                    }
                }
                return Float.valueOf(fL);
            case 3:
                return this.f53871b.g();
            default:
                y yVar4 = this.f53871b;
                return new Pair(yVar4.g(), yVar4.f54115e.getValue());
        }
    }
}
