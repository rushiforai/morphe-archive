package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.widget.RadioButton;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class q20 extends RadioButton implements kmd, lmd {
    public final o10 a;
    public final e8 b;
    public final n30 c;
    public m20 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q20(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, R.attr.radioButtonStyle);
        imd.a(context);
        wkd.a(this, getContext());
        o10 o10Var = new o10(this);
        this.a = o10Var;
        o10Var.d(attributeSet, R.attr.radioButtonStyle);
        e8 e8Var = new e8(this);
        this.b = e8Var;
        e8Var.k(attributeSet, R.attr.radioButtonStyle);
        n30 n30Var = new n30(this);
        this.c = n30Var;
        n30Var.f(attributeSet, R.attr.radioButtonStyle);
        getEmojiTextViewHelper().a(attributeSet, R.attr.radioButtonStyle);
    }

    private m20 getEmojiTextViewHelper() {
        m20 m20Var = this.d;
        if (m20Var != null) {
            return m20Var;
        }
        m20 m20Var2 = new m20(this);
        this.d = m20Var2;
        return m20Var2;
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        e8 e8Var = this.b;
        if (e8Var != null) {
            e8Var.a();
        }
        n30 n30Var = this.c;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    public ColorStateList getSupportBackgroundTintList() {
        e8 e8Var = this.b;
        if (e8Var != null) {
            return e8Var.h();
        }
        return null;
    }

    public PorterDuff.Mode getSupportBackgroundTintMode() {
        e8 e8Var = this.b;
        if (e8Var != null) {
            return e8Var.i();
        }
        return null;
    }

    @Override // defpackage.kmd
    public ColorStateList getSupportButtonTintList() {
        o10 o10Var = this.a;
        if (o10Var != null) {
            return (ColorStateList) o10Var.a;
        }
        return null;
    }

    public PorterDuff.Mode getSupportButtonTintMode() {
        o10 o10Var = this.a;
        if (o10Var != null) {
            return (PorterDuff.Mode) o10Var.b;
        }
        return null;
    }

    public ColorStateList getSupportCompoundDrawablesTintList() {
        return this.c.d();
    }

    public PorterDuff.Mode getSupportCompoundDrawablesTintMode() {
        return this.c.e();
    }

    @Override // android.widget.TextView
    public void setAllCaps(boolean z) {
        super.setAllCaps(z);
        getEmojiTextViewHelper().b(z);
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        e8 e8Var = this.b;
        if (e8Var != null) {
            e8Var.m();
        }
    }

    @Override // android.view.View
    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        e8 e8Var = this.b;
        if (e8Var != null) {
            e8Var.n(i);
        }
    }

    @Override // android.widget.CompoundButton
    public void setButtonDrawable(Drawable drawable) {
        super.setButtonDrawable(drawable);
        o10 o10Var = this.a;
        if (o10Var != null) {
            if (o10Var.e) {
                o10Var.e = false;
            } else {
                o10Var.e = true;
                o10Var.a();
            }
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n30 n30Var = this.c;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n30 n30Var = this.c;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    public void setEmojiCompatEnabled(boolean z) {
        getEmojiTextViewHelper().c(z);
    }

    @Override // android.widget.TextView
    public void setFilters(InputFilter[] inputFilterArr) {
        super.setFilters(((xz5) getEmojiTextViewHelper().b.b).T(inputFilterArr));
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        e8 e8Var = this.b;
        if (e8Var != null) {
            e8Var.s(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(PorterDuff.Mode mode) {
        e8 e8Var = this.b;
        if (e8Var != null) {
            e8Var.t(mode);
        }
    }

    @Override // defpackage.kmd
    public void setSupportButtonTintList(ColorStateList colorStateList) {
        o10 o10Var = this.a;
        if (o10Var != null) {
            o10Var.a = colorStateList;
            o10Var.c = true;
            o10Var.a();
        }
    }

    @Override // defpackage.kmd
    public void setSupportButtonTintMode(PorterDuff.Mode mode) {
        o10 o10Var = this.a;
        if (o10Var != null) {
            o10Var.b = mode;
            o10Var.d = true;
            o10Var.a();
        }
    }

    @Override // defpackage.lmd
    public void setSupportCompoundDrawablesTintList(ColorStateList colorStateList) {
        n30 n30Var = this.c;
        n30Var.k(colorStateList);
        n30Var.b();
    }

    @Override // defpackage.lmd
    public void setSupportCompoundDrawablesTintMode(PorterDuff.Mode mode) {
        n30 n30Var = this.c;
        n30Var.l(mode);
        n30Var.b();
    }

    @Override // android.widget.CompoundButton
    public void setButtonDrawable(int i) {
        setButtonDrawable(guc.E(getContext(), i));
    }
}
