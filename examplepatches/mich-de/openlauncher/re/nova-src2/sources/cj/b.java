package cj;

import android.animation.TypeEvaluator;

/* loaded from: classes3.dex */
public final class b implements TypeEvaluator {

    /* renamed from: a, reason: collision with root package name */
    public static final b f19956a = new b();

    public static Integer a(float f11, Integer num, Integer num2) {
        int iIntValue = num.intValue();
        float f12 = ((iIntValue >> 24) & 255) / 255.0f;
        int iIntValue2 = num2.intValue();
        float f13 = ((iIntValue2 >> 24) & 255) / 255.0f;
        float fPow = (float) Math.pow(((iIntValue >> 16) & 255) / 255.0f, 2.2d);
        float fPow2 = (float) Math.pow(((iIntValue >> 8) & 255) / 255.0f, 2.2d);
        float fPow3 = (float) Math.pow((iIntValue & 255) / 255.0f, 2.2d);
        float fPow4 = (float) Math.pow(((iIntValue2 >> 16) & 255) / 255.0f, 2.2d);
        float fPow5 = (float) Math.pow(((iIntValue2 >> 8) & 255) / 255.0f, 2.2d);
        float fPow6 = (float) Math.pow((iIntValue2 & 255) / 255.0f, 2.2d);
        float fA = a2.c.a(f13, f12, f11, f12);
        float fA2 = a2.c.a(fPow4, fPow, f11, fPow);
        float fA3 = a2.c.a(fPow5, fPow2, f11, fPow2);
        float fA4 = a2.c.a(fPow6, fPow3, f11, fPow3);
        float fPow7 = ((float) Math.pow(fA2, 0.45454545454545453d)) * 255.0f;
        float fPow8 = ((float) Math.pow(fA3, 0.45454545454545453d)) * 255.0f;
        return Integer.valueOf(Math.round(((float) Math.pow(fA4, 0.45454545454545453d)) * 255.0f) | (Math.round(fPow7) << 16) | (Math.round(fA * 255.0f) << 24) | (Math.round(fPow8) << 8));
    }

    @Override // android.animation.TypeEvaluator
    public final /* bridge */ /* synthetic */ Object evaluate(float f11, Object obj, Object obj2) {
        return a(f11, (Integer) obj, (Integer) obj2);
    }
}
