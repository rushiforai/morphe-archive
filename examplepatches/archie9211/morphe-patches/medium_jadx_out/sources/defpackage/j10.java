package defpackage;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.text.method.KeyListener;
import android.text.method.NumberKeyListener;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.AutoCompleteTextView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class j10 extends AutoCompleteTextView implements lmd {
    public static final int[] d = {R.attr.popupBackground};
    public final e8 a;
    public final n30 b;
    public final s26 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j10(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, com.medium.reader.R.attr.autoCompleteTextViewStyle);
        imd.a(context);
        wkd.a(this, getContext());
        vwa vwaVarX = vwa.x(getContext(), attributeSet, d, com.medium.reader.R.attr.autoCompleteTextViewStyle);
        if (((TypedArray) vwaVarX.c).hasValue(0)) {
            setDropDownBackgroundDrawable(vwaVarX.q(0));
        }
        vwaVarX.C();
        e8 e8Var = new e8(this);
        this.a = e8Var;
        e8Var.k(attributeSet, com.medium.reader.R.attr.autoCompleteTextViewStyle);
        n30 n30Var = new n30(this);
        this.b = n30Var;
        n30Var.f(attributeSet, com.medium.reader.R.attr.autoCompleteTextViewStyle);
        n30Var.b();
        s26 s26Var = new s26(this, 8);
        this.c = s26Var;
        s26Var.o0(attributeSet, com.medium.reader.R.attr.autoCompleteTextViewStyle);
        KeyListener keyListener = getKeyListener();
        if (keyListener instanceof NumberKeyListener) {
            return;
        }
        boolean zIsFocusable = super.isFocusable();
        boolean zIsClickable = super.isClickable();
        boolean zIsLongClickable = super.isLongClickable();
        int inputType = super.getInputType();
        KeyListener keyListenerK0 = s26Var.k0(keyListener);
        if (keyListenerK0 == keyListener) {
            return;
        }
        super.setKeyListener(keyListenerK0);
        super.setRawInputType(inputType);
        super.setFocusable(zIsFocusable);
        super.setClickable(zIsClickable);
        super.setLongClickable(zIsLongClickable);
    }

    @Override // android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.a();
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public ActionMode.Callback getCustomSelectionActionModeCallback() {
        return vn7.h0(super.getCustomSelectionActionModeCallback());
    }

    public ColorStateList getSupportBackgroundTintList() {
        e8 e8Var = this.a;
        if (e8Var != null) {
            return e8Var.h();
        }
        return null;
    }

    public PorterDuff.Mode getSupportBackgroundTintMode() {
        e8 e8Var = this.a;
        if (e8Var != null) {
            return e8Var.i();
        }
        return null;
    }

    public ColorStateList getSupportCompoundDrawablesTintList() {
        return this.b.d();
    }

    public PorterDuff.Mode getSupportCompoundDrawablesTintMode() {
        return this.b.e();
    }

    @Override // android.widget.TextView, android.view.View
    public InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        flb.o0(inputConnectionOnCreateInputConnection, editorInfo, this);
        return this.c.p0(inputConnectionOnCreateInputConnection, editorInfo);
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.m();
        }
    }

    @Override // android.view.View
    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.n(i);
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(vn7.k0(callback, this));
    }

    @Override // android.widget.AutoCompleteTextView
    public void setDropDownBackgroundResource(int i) {
        setDropDownBackgroundDrawable(guc.E(getContext(), i));
    }

    public void setEmojiCompatEnabled(boolean z) {
        this.c.v0(z);
    }

    @Override // android.widget.TextView
    public void setKeyListener(KeyListener keyListener) {
        super.setKeyListener(this.c.k0(keyListener));
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.s(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(PorterDuff.Mode mode) {
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.t(mode);
        }
    }

    @Override // defpackage.lmd
    public void setSupportCompoundDrawablesTintList(ColorStateList colorStateList) {
        n30 n30Var = this.b;
        n30Var.k(colorStateList);
        n30Var.b();
    }

    @Override // defpackage.lmd
    public void setSupportCompoundDrawablesTintMode(PorterDuff.Mode mode) {
        n30 n30Var = this.b;
        n30Var.l(mode);
        n30Var.b();
    }

    @Override // android.widget.TextView
    public final void setTextAppearance(Context context, int i) {
        super.setTextAppearance(context, i);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.g(context, i);
        }
    }
}
