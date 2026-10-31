package r;

import android.content.res.TypedArray;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.widget.TextView;

/* loaded from: classes2.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final TextView f84849a;

    /* renamed from: b, reason: collision with root package name */
    public final a5.d f84850b;

    public r(TextView textView) {
        this.f84849a = textView;
        this.f84850b = new a5.d(textView);
    }

    public final InputFilter[] a(InputFilter[] inputFilterArr) {
        return ((cl.k0) this.f84850b.f267b).v(inputFilterArr);
    }

    public final void b(AttributeSet attributeSet, int i5) {
        TypedArray typedArrayObtainStyledAttributes = this.f84849a.getContext().obtainStyledAttributes(attributeSet, l.a.f72896i, i5, 0);
        try {
            boolean z11 = typedArrayObtainStyledAttributes.hasValue(14) ? typedArrayObtainStyledAttributes.getBoolean(14, true) : true;
            typedArrayObtainStyledAttributes.recycle();
            ((cl.k0) this.f84850b.f267b).S(z11);
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }

    public final void c(boolean z11) {
        ((cl.k0) this.f84850b.f267b).R(z11);
    }
}
