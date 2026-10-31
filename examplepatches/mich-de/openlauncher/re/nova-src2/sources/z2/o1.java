package z2;

/* loaded from: classes2.dex */
public abstract class o1 {
    /* JADX WARN: Removed duplicated region for block: B:11:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final float a(h1 h1Var, boolean z11, p[] pVarArr, float f11) {
        float f12 = Float.NaN;
        for (p pVar : pVarArr) {
            float fB = h1Var.b(pVar);
            if (Float.isNaN(f12)) {
                f12 = fB;
            } else if (z11 == (fB > f12)) {
            }
        }
        return Float.isNaN(f12) ? f11 : f12;
    }
}
