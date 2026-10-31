package za;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import o9.u2;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final float f98463a;

    /* renamed from: b, reason: collision with root package name */
    public final int f98464b;

    /* renamed from: c, reason: collision with root package name */
    public final float f98465c;

    /* renamed from: d, reason: collision with root package name */
    public final float f98466d;

    /* renamed from: e, reason: collision with root package name */
    public final float f98467e;

    /* renamed from: f, reason: collision with root package name */
    public final int f98468f;

    public n(Context context, AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.N, 0, 0);
        this.f98463a = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        this.f98464b = typedArrayObtainStyledAttributes.getColor(1, 0);
        this.f98465c = typedArrayObtainStyledAttributes.getDimensionPixelSize(2, 0);
        this.f98466d = typedArrayObtainStyledAttributes.getDimensionPixelSize(4, 0);
        this.f98467e = typedArrayObtainStyledAttributes.getDimensionPixelSize(5, 0);
        this.f98468f = typedArrayObtainStyledAttributes.getColor(3, 0);
        typedArrayObtainStyledAttributes.recycle();
    }
}
