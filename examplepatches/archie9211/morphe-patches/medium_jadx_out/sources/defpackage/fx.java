package defpackage;

import android.animation.TypeEvaluator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fx implements TypeEvaluator {
    public i69[] a;

    @Override // android.animation.TypeEvaluator
    public final Object evaluate(float f, Object obj, Object obj2) {
        i69[] i69VarArr = (i69[]) obj;
        i69[] i69VarArr2 = (i69[]) obj2;
        if (!wo7.j(i69VarArr, i69VarArr2)) {
            ay0.e("Can't interpolate between two incompatible pathData");
            return null;
        }
        if (!wo7.j(this.a, i69VarArr)) {
            this.a = wo7.n(i69VarArr);
        }
        int i = 0;
        while (true) {
            int length = i69VarArr.length;
            i69[] i69VarArr3 = this.a;
            if (i >= length) {
                return i69VarArr3;
            }
            i69 i69Var = i69VarArr3[i];
            i69 i69Var2 = i69VarArr[i];
            i69 i69Var3 = i69VarArr2[i];
            i69Var.getClass();
            i69Var.a = i69Var2.a;
            int i2 = 0;
            while (true) {
                float[] fArr = i69Var2.b;
                if (i2 < fArr.length) {
                    i69Var.b[i2] = (i69Var3.b[i2] * f) + ((1.0f - f) * fArr[i2]);
                    i2++;
                }
            }
            i++;
        }
    }
}
