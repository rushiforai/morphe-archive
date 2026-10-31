package j4;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;

/* loaded from: classes2.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public int f69026a;

    /* renamed from: b, reason: collision with root package name */
    public int f69027b;

    /* renamed from: c, reason: collision with root package name */
    public float f69028c;

    /* renamed from: d, reason: collision with root package name */
    public float f69029d;

    public final void a(Context context, AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, p.f69055g);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        for (int i5 = 0; i5 < indexCount; i5++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i5);
            if (index == 1) {
                this.f69028c = typedArrayObtainStyledAttributes.getFloat(index, this.f69028c);
            } else if (index == 0) {
                int i11 = typedArrayObtainStyledAttributes.getInt(index, this.f69026a);
                this.f69026a = i11;
                this.f69026a = m.f69043d[i11];
            } else if (index == 4) {
                this.f69027b = typedArrayObtainStyledAttributes.getInt(index, this.f69027b);
            } else if (index == 3) {
                this.f69029d = typedArrayObtainStyledAttributes.getFloat(index, this.f69029d);
            }
        }
        typedArrayObtainStyledAttributes.recycle();
    }
}
