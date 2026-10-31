package o9;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;

/* loaded from: classes2.dex */
public final class h0 {

    /* renamed from: a, reason: collision with root package name */
    public final float f79860a;

    /* renamed from: b, reason: collision with root package name */
    public final float f79861b;

    /* renamed from: c, reason: collision with root package name */
    public final float f79862c;

    public h0(Context context, AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80158g);
        this.f79860a = b(typedArrayObtainStyledAttributes, 0);
        this.f79861b = b(typedArrayObtainStyledAttributes, 1);
        this.f79862c = b(typedArrayObtainStyledAttributes, 2);
        typedArrayObtainStyledAttributes.recycle();
    }

    public static float b(TypedArray typedArray, int i5) {
        if (typedArray.getType(i5) == 5) {
            return typedArray.getDimensionPixelSize(i5, 0);
        }
        if (typedArray.getType(i5) == 4) {
            return typedArray.getFloat(i5, 0.0f);
        }
        return 0.0f;
    }

    public final int a(int i5) {
        return Math.round(((i5 - this.f79862c) * this.f79860a) + this.f79861b);
    }

    public final String toString() {
        return "a=" + this.f79860a + ", b=" + this.f79861b + ", c=" + this.f79862c;
    }
}
