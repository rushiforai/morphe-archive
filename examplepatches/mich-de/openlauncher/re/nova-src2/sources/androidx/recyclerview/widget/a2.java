package androidx.recyclerview.widget;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.ViewGroup;

/* loaded from: classes.dex */
public class a2 extends ViewGroup.MarginLayoutParams {

    /* renamed from: a, reason: collision with root package name */
    public s2 f14880a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f14881b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f14882c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f14883d;

    public a2(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f14881b = new Rect();
        this.f14882c = true;
        this.f14883d = false;
    }

    public a2(int i5, int i11) {
        super(i5, i11);
        this.f14881b = new Rect();
        this.f14882c = true;
        this.f14883d = false;
    }

    public a2(ViewGroup.MarginLayoutParams marginLayoutParams) {
        super(marginLayoutParams);
        this.f14881b = new Rect();
        this.f14882c = true;
        this.f14883d = false;
    }

    public a2(ViewGroup.LayoutParams layoutParams) {
        super(layoutParams);
        this.f14881b = new Rect();
        this.f14882c = true;
        this.f14883d = false;
    }

    public a2(a2 a2Var) {
        super((ViewGroup.LayoutParams) a2Var);
        this.f14881b = new Rect();
        this.f14882c = true;
        this.f14883d = false;
    }
}
