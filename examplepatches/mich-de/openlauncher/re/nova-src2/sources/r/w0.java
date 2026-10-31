package r;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.widget.ToggleButton;

/* loaded from: classes2.dex */
public final class w0 extends ToggleButton {

    /* renamed from: a, reason: collision with root package name */
    public final m f84905a;

    /* renamed from: b, reason: collision with root package name */
    public final n0 f84906b;

    /* renamed from: c, reason: collision with root package name */
    public r f84907c;

    public w0(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 16842827);
        c2.a(getContext(), this);
        m mVar = new m(this);
        this.f84905a = mVar;
        mVar.d(attributeSet, 16842827);
        n0 n0Var = new n0(this);
        this.f84906b = n0Var;
        n0Var.d(attributeSet, 16842827);
        if (this.f84907c == null) {
            this.f84907c = new r(this);
        }
        this.f84907c.b(attributeSet, 16842827);
    }

    @Override // android.widget.ToggleButton, android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        m mVar = this.f84905a;
        if (mVar != null) {
            mVar.a();
        }
        n0 n0Var = this.f84906b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setAllCaps(boolean z11) {
        super.setAllCaps(z11);
        if (this.f84907c == null) {
            this.f84907c = new r(this);
        }
        this.f84907c.c(z11);
    }

    @Override // android.widget.ToggleButton, android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.f84905a;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.f84905a;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84906b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84906b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setFilters(InputFilter[] inputFilterArr) {
        if (this.f84907c == null) {
            this.f84907c = new r(this);
        }
        super.setFilters(this.f84907c.a(inputFilterArr));
    }
}
