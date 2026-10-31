package wj;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import com.google.android.gms.internal.consent_sdk.k0;
import ps.f0;

/* loaded from: classes3.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public final int f94413a;

    /* renamed from: b, reason: collision with root package name */
    public final int f94414b;

    /* renamed from: c, reason: collision with root package name */
    public int[] f94415c;

    /* renamed from: d, reason: collision with root package name */
    public final int f94416d;

    /* renamed from: e, reason: collision with root package name */
    public final int f94417e;

    /* renamed from: f, reason: collision with root package name */
    public final int f94418f;

    /* renamed from: g, reason: collision with root package name */
    public final int f94419g;

    public d(Context context, AttributeSet attributeSet, int i5, int i11) throws Resources.NotFoundException {
        this.f94415c = new int[0];
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(2131166233);
        tj.i.a(context, attributeSet, i5, i11);
        int[] iArr = bj.a.f17916c;
        tj.i.b(context, attributeSet, iArr, i5, i11, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, i5, i11);
        int iO = f0.o(context, typedArrayObtainStyledAttributes, 9, dimensionPixelSize);
        this.f94413a = iO;
        this.f94414b = Math.min(f0.o(context, typedArrayObtainStyledAttributes, 8, 0), iO / 2);
        this.f94417e = typedArrayObtainStyledAttributes.getInt(5, 0);
        this.f94418f = typedArrayObtainStyledAttributes.getInt(1, 0);
        this.f94419g = typedArrayObtainStyledAttributes.getDimensionPixelSize(3, 0);
        if (!typedArrayObtainStyledAttributes.hasValue(2)) {
            this.f94415c = new int[]{k0.n(context, 2130968963, -1)};
        } else if (typedArrayObtainStyledAttributes.peekValue(2).type != 1) {
            this.f94415c = new int[]{typedArrayObtainStyledAttributes.getColor(2, -1)};
        } else {
            int[] intArray = context.getResources().getIntArray(typedArrayObtainStyledAttributes.getResourceId(2, -1));
            this.f94415c = intArray;
            if (intArray.length == 0) {
                throw new IllegalArgumentException("indicatorColors cannot be empty when indicatorColor is not used.");
            }
        }
        if (typedArrayObtainStyledAttributes.hasValue(7)) {
            this.f94416d = typedArrayObtainStyledAttributes.getColor(7, -1);
        } else {
            this.f94416d = this.f94415c[0];
            TypedArray typedArrayObtainStyledAttributes2 = context.getTheme().obtainStyledAttributes(new int[]{16842803});
            float f11 = typedArrayObtainStyledAttributes2.getFloat(0, 0.2f);
            typedArrayObtainStyledAttributes2.recycle();
            this.f94416d = k0.h(this.f94416d, (int) (f11 * 255.0f));
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    public void a() {
        if (this.f94419g < 0) {
            throw new IllegalArgumentException("indicatorTrackGapSize must be >= 0.");
        }
    }
}
