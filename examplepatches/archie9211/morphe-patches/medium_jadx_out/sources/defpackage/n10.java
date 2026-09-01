package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.CheckedTextView;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n10 extends CheckedTextView implements lmd {
    public final o10 a;
    public final e8 b;
    public final n30 c;
    public m20 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n10(Context context, AttributeSet attributeSet) {
        int resourceId;
        int resourceId2;
        super(context, attributeSet, R.attr.checkedTextViewStyle);
        imd.a(context);
        wkd.a(this, getContext());
        n30 n30Var = new n30(this);
        this.c = n30Var;
        n30Var.f(attributeSet, R.attr.checkedTextViewStyle);
        n30Var.b();
        e8 e8Var = new e8(this);
        this.b = e8Var;
        e8Var.k(attributeSet, R.attr.checkedTextViewStyle);
        this.a = new o10(this);
        Context context2 = getContext();
        int[] iArr = esa.l;
        vwa vwaVarX = vwa.x(context2, attributeSet, iArr, R.attr.checkedTextViewStyle);
        TypedArray typedArray = (TypedArray) vwaVarX.c;
        ute.n(this, getContext(), iArr, attributeSet, (TypedArray) vwaVarX.c, R.attr.checkedTextViewStyle);
        try {
            if (typedArray.hasValue(1) && (resourceId2 = typedArray.getResourceId(1, 0)) != 0) {
                try {
                    setCheckMarkDrawable(guc.E(getContext(), resourceId2));
                } catch (Resources.NotFoundException unused) {
                    if (typedArray.hasValue(0)) {
                        setCheckMarkDrawable(guc.E(getContext(), resourceId));
                    }
                }
            } else if (typedArray.hasValue(0) && (resourceId = typedArray.getResourceId(0, 0)) != 0) {
                setCheckMarkDrawable(guc.E(getContext(), resourceId));
            }
            if (typedArray.hasValue(2)) {
                setCheckMarkTintList(vwaVarX.o(2));
            }
            if (typedArray.hasValue(3)) {
                setCheckMarkTintMode(lm3.b(typedArray.getInt(3, -1), null));
            }
            vwaVarX.C();
            getEmojiTextViewHelper().a(attributeSet, R.attr.checkedTextViewStyle);
        } catch (Throwable th) {
            vwaVarX.C();
            throw th;
        }
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

    @Override // android.widget.CheckedTextView, android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        n30 n30Var = this.c;
        if (n30Var != null) {
            n30Var.b();
        }
        e8 e8Var = this.b;
        if (e8Var != null) {
            e8Var.a();
        }
        o10 o10Var = this.a;
        if (o10Var != null) {
            o10Var.b();
        }
    }

    @Override // android.widget.TextView
    public ActionMode.Callback getCustomSelectionActionModeCallback() {
        return vn7.h0(super.getCustomSelectionActionModeCallback());
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

    public ColorStateList getSupportCheckMarkTintList() {
        o10 o10Var = this.a;
        if (o10Var != null) {
            return (ColorStateList) o10Var.a;
        }
        return null;
    }

    public PorterDuff.Mode getSupportCheckMarkTintMode() {
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

    @Override // android.widget.TextView, android.view.View
    public final InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        flb.o0(inputConnectionOnCreateInputConnection, editorInfo, this);
        return inputConnectionOnCreateInputConnection;
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

    @Override // android.widget.CheckedTextView
    public void setCheckMarkDrawable(Drawable drawable) {
        super.setCheckMarkDrawable(drawable);
        o10 o10Var = this.a;
        if (o10Var != null) {
            if (o10Var.e) {
                o10Var.e = false;
            } else {
                o10Var.e = true;
                o10Var.b();
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

    @Override // android.widget.TextView
    public void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(vn7.k0(callback, this));
    }

    public void setEmojiCompatEnabled(boolean z) {
        getEmojiTextViewHelper().c(z);
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

    public void setSupportCheckMarkTintList(ColorStateList colorStateList) {
        o10 o10Var = this.a;
        if (o10Var != null) {
            o10Var.a = colorStateList;
            o10Var.c = true;
            o10Var.b();
        }
    }

    public void setSupportCheckMarkTintMode(PorterDuff.Mode mode) {
        o10 o10Var = this.a;
        if (o10Var != null) {
            o10Var.b = mode;
            o10Var.d = true;
            o10Var.b();
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

    @Override // android.widget.TextView
    public final void setTextAppearance(Context context, int i) {
        super.setTextAppearance(context, i);
        n30 n30Var = this.c;
        if (n30Var != null) {
            n30Var.g(context, i);
        }
    }

    @Override // android.widget.CheckedTextView
    public void setCheckMarkDrawable(int i) {
        setCheckMarkDrawable(guc.E(getContext(), i));
    }
}
