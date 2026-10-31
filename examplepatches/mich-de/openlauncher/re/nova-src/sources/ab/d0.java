package ab;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import o9.u2;

/* loaded from: classes.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f703a;

    /* renamed from: b, reason: collision with root package name */
    public final int f704b;

    /* renamed from: c, reason: collision with root package name */
    public final int f705c;

    public d0(Context context, AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.P);
        this.f703a = typedArrayObtainStyledAttributes.getInt(1, -1);
        this.f704b = typedArrayObtainStyledAttributes.getResourceId(4, 0);
        this.f705c = typedArrayObtainStyledAttributes.getResourceId(3, 0);
    }
}
