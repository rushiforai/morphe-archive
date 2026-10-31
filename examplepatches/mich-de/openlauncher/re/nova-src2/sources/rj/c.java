package rj;

import android.animation.TypeEvaluator;
import android.graphics.Matrix;

/* loaded from: classes3.dex */
public final class c implements TypeEvaluator {

    /* renamed from: a, reason: collision with root package name */
    public final float[] f85969a = new float[9];

    /* renamed from: b, reason: collision with root package name */
    public final float[] f85970b = new float[9];

    /* renamed from: c, reason: collision with root package name */
    public final Matrix f85971c = new Matrix();

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ j f85972d;

    public c(j jVar) {
        this.f85972d = jVar;
    }

    @Override // android.animation.TypeEvaluator
    public final Object evaluate(float f11, Object obj, Object obj2) {
        this.f85972d.n = f11;
        float[] fArr = this.f85969a;
        ((Matrix) obj).getValues(fArr);
        float[] fArr2 = this.f85970b;
        ((Matrix) obj2).getValues(fArr2);
        for (int i5 = 0; i5 < 9; i5++) {
            float f12 = fArr2[i5];
            float f13 = fArr[i5];
            fArr2[i5] = a2.c.a(f12, f13, f11, f13);
        }
        Matrix matrix = this.f85971c;
        matrix.setValues(fArr2);
        return matrix;
    }
}
