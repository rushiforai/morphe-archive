package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h62 {
    public int a;
    public int b;
    public float c;
    public float d;

    public final void a(Context context, AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, xra.g);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        for (int i = 0; i < indexCount; i++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i);
            if (index == 1) {
                this.c = typedArrayObtainStyledAttributes.getFloat(index, this.c);
            } else if (index == 0) {
                int i2 = typedArrayObtainStyledAttributes.getInt(index, this.a);
                this.a = i2;
                this.a = j62.c[i2];
            } else if (index == 4) {
                this.b = typedArrayObtainStyledAttributes.getInt(index, this.b);
            } else if (index == 3) {
                this.d = typedArrayObtainStyledAttributes.getFloat(index, this.d);
            }
        }
        typedArrayObtainStyledAttributes.recycle();
    }
}
