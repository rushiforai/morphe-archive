package c8;

import android.animation.TypeEvaluator;

/* loaded from: classes2.dex */
public final class a implements TypeEvaluator {

    /* renamed from: a, reason: collision with root package name */
    public static final a f19830a = new a();

    @Override // android.animation.TypeEvaluator
    public final Object evaluate(float f11, Object obj, Object obj2) {
        int iIntValue = ((Integer) obj).intValue();
        int i5 = (iIntValue >> 24) & 255;
        int i11 = (iIntValue >> 16) & 255;
        int i12 = (iIntValue >> 8) & 255;
        int i13 = iIntValue & 255;
        int iIntValue2 = ((Integer) obj2).intValue();
        return Integer.valueOf(((i5 + ((int) ((((iIntValue2 >> 24) & 255) - i5) * f11))) << 24) | ((i11 + ((int) ((((iIntValue2 >> 16) & 255) - i11) * f11))) << 16) | ((i12 + ((int) ((((iIntValue2 >> 8) & 255) - i12) * f11))) << 8) | (i13 + ((int) (f11 * ((iIntValue2 & 255) - i13)))));
    }
}
