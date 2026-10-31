package r;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.widget.RadioButton;
import e10.z2;

/* loaded from: classes2.dex */
public class w extends RadioButton {

    /* renamed from: a, reason: collision with root package name */
    public final ai.v0 f84901a;

    /* renamed from: b, reason: collision with root package name */
    public final m f84902b;

    /* renamed from: c, reason: collision with root package name */
    public final n0 f84903c;

    /* renamed from: d, reason: collision with root package name */
    public r f84904d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969865);
        d2.a(context);
        c2.a(getContext(), this);
        ai.v0 v0Var = new ai.v0(this);
        this.f84901a = v0Var;
        v0Var.b(attributeSet, 2130969865);
        m mVar = new m(this);
        this.f84902b = mVar;
        mVar.d(attributeSet, 2130969865);
        n0 n0Var = new n0(this);
        this.f84903c = n0Var;
        n0Var.d(attributeSet, 2130969865);
        if (this.f84904d == null) {
            this.f84904d = new r(this);
        }
        this.f84904d.b(attributeSet, 2130969865);
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        m mVar = this.f84902b;
        if (mVar != null) {
            mVar.a();
        }
        n0 n0Var = this.f84903c;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setAllCaps(boolean z11) {
        super.setAllCaps(z11);
        if (this.f84904d == null) {
            this.f84904d = new r(this);
        }
        this.f84904d.c(z11);
    }

    @Override // android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.f84902b;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.f84902b;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.CompoundButton
    public final void setButtonDrawable(Drawable drawable) {
        super.setButtonDrawable(drawable);
        ai.v0 v0Var = this.f84901a;
        if (v0Var != null) {
            if (v0Var.f13374c) {
                v0Var.f13374c = false;
            } else {
                v0Var.f13374c = true;
                v0Var.a();
            }
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84903c;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84903c;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setFilters(InputFilter[] inputFilterArr) {
        if (this.f84904d == null) {
            this.f84904d = new r(this);
        }
        super.setFilters(this.f84904d.a(inputFilterArr));
    }

    @Override // android.widget.CompoundButton
    public final void setButtonDrawable(int i5) {
        setButtonDrawable(z2.b0(getContext(), i5));
    }
}
