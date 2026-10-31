package o9;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.FrameLayout;

/* loaded from: classes.dex */
public class s0 extends FrameLayout.LayoutParams {

    /* renamed from: a, reason: collision with root package name */
    public boolean f80099a;

    public s0(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f80099a = false;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.B);
        this.f80099a = typedArrayObtainStyledAttributes.getBoolean(0, false);
        typedArrayObtainStyledAttributes.recycle();
    }

    public s0(int i5, int i11) {
        super(i5, i11);
        this.f80099a = false;
    }

    public s0(ViewGroup.LayoutParams layoutParams) {
        super(layoutParams);
        this.f80099a = false;
    }
}
