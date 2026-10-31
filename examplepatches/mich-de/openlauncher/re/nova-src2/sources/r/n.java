package r;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.widget.CheckBox;
import e10.z2;

/* loaded from: classes2.dex */
public class n extends CheckBox {

    /* renamed from: a, reason: collision with root package name */
    public final ai.v0 f84810a;

    /* renamed from: b, reason: collision with root package name */
    public final m f84811b;

    /* renamed from: c, reason: collision with root package name */
    public final n0 f84812c;

    /* renamed from: d, reason: collision with root package name */
    public r f84813d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        d2.a(context);
        c2.a(getContext(), this);
        ai.v0 v0Var = new ai.v0(this);
        this.f84810a = v0Var;
        v0Var.b(attributeSet, i5);
        m mVar = new m(this);
        this.f84811b = mVar;
        mVar.d(attributeSet, i5);
        n0 n0Var = new n0(this);
        this.f84812c = n0Var;
        n0Var.d(attributeSet, i5);
        if (this.f84813d == null) {
            this.f84813d = new r(this);
        }
        this.f84813d.b(attributeSet, i5);
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public void drawableStateChanged() {
        super.drawableStateChanged();
        m mVar = this.f84811b;
        if (mVar != null) {
            mVar.a();
        }
        n0 n0Var = this.f84812c;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setAllCaps(boolean z11) {
        super.setAllCaps(z11);
        if (this.f84813d == null) {
            this.f84813d = new r(this);
        }
        this.f84813d.c(z11);
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.f84811b;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.f84811b;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.CompoundButton
    public void setButtonDrawable(Drawable drawable) {
        super.setButtonDrawable(drawable);
        ai.v0 v0Var = this.f84810a;
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
    public void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84812c;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84812c;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setFilters(InputFilter[] inputFilterArr) {
        if (this.f84813d == null) {
            this.f84813d = new r(this);
        }
        super.setFilters(this.f84813d.a(inputFilterArr));
    }

    @Override // android.widget.CompoundButton
    public void setButtonDrawable(int i5) {
        setButtonDrawable(z2.b0(getContext(), i5));
    }
}
