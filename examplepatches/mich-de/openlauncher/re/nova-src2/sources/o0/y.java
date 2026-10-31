package o0;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.FunctionReferenceImpl;
import p1.s2;

/* loaded from: classes.dex */
public final /* synthetic */ class y extends FunctionReferenceImpl implements Function2 {
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int iIntValue = ((Number) obj).intValue();
        int iIntValue2 = ((Number) obj2).intValue();
        z zVar = (z) this.receiver;
        c30.c cVar = zVar.f78837e;
        int[] iArr = new int[iIntValue2];
        int iMin = 0;
        if (((p) ((s2) zVar.f78836d).getValue()).f78784j.q(iIntValue)) {
            u90.b.C(iIntValue, 0, 6, iArr);
            return iArr;
        }
        cVar.g(iIntValue + iIntValue2);
        int iK = cVar.k(iIntValue);
        if (iK != -2 && iK != -1) {
            if (iK < 0) {
                j0.b.a("Expected positive lane number, got " + iK + " instead.");
            }
            iMin = Math.min(iK, iIntValue2);
        }
        int i5 = iMin - 1;
        int iH = iIntValue;
        while (true) {
            if (-1 >= i5) {
                break;
            }
            iH = cVar.h(iH, i5);
            iArr[i5] = iH;
            if (iH == -1) {
                u90.b.C(-1, i5, 2, iArr);
                break;
            }
            i5--;
        }
        iArr[iMin] = iIntValue;
        while (true) {
            iMin++;
            if (iMin >= iIntValue2) {
                return iArr;
            }
            iIntValue++;
            int length = cVar.f19532b + ((int[]) cVar.f19533c).length;
            while (true) {
                if (iIntValue >= length) {
                    iIntValue = cVar.f19532b + ((int[]) cVar.f19533c).length;
                    break;
                }
                if (cVar.b(iIntValue, iMin)) {
                    break;
                }
                iIntValue++;
            }
            iArr[iMin] = iIntValue;
        }
    }
}
