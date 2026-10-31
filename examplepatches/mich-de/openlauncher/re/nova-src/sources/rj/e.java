package rj;

import android.animation.FloatEvaluator;
import android.animation.TypeEvaluator;

/* loaded from: classes3.dex */
public final class e implements TypeEvaluator {

    /* renamed from: a, reason: collision with root package name */
    public FloatEvaluator f85982a;

    @Override // android.animation.TypeEvaluator
    public final Object evaluate(float f11, Object obj, Object obj2) {
        float fFloatValue = this.f85982a.evaluate(f11, (Number) obj, (Number) obj2).floatValue();
        if (fFloatValue < 0.1f) {
            fFloatValue = 0.0f;
        }
        return Float.valueOf(fFloatValue);
    }
}
