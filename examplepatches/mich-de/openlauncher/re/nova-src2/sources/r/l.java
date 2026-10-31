package r;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.method.KeyListener;
import android.text.method.NumberKeyListener;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.AutoCompleteTextView;
import e10.z2;

/* loaded from: classes2.dex */
public class l extends AutoCompleteTextView {

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f84784d = {16843126};

    /* renamed from: a, reason: collision with root package name */
    public final m f84785a;

    /* renamed from: b, reason: collision with root package name */
    public final n0 f84786b;

    /* renamed from: c, reason: collision with root package name */
    public final v f84787c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130968704);
        d2.a(context);
        c2.a(getContext(), this);
        x7.u uVarR = x7.u.r(getContext(), attributeSet, f84784d, 2130968704);
        if (((TypedArray) uVarR.f95209b).hasValue(0)) {
            setDropDownBackgroundDrawable(uVarR.l(0));
        }
        uVarR.s();
        m mVar = new m(this);
        this.f84785a = mVar;
        mVar.d(attributeSet, 2130968704);
        n0 n0Var = new n0(this);
        this.f84786b = n0Var;
        n0Var.d(attributeSet, 2130968704);
        n0Var.b();
        v vVar = new v(this);
        this.f84787c = vVar;
        vVar.b(attributeSet, 2130968704);
        KeyListener keyListener = getKeyListener();
        if (keyListener instanceof NumberKeyListener) {
            return;
        }
        boolean zIsFocusable = super.isFocusable();
        boolean zIsClickable = super.isClickable();
        boolean zIsLongClickable = super.isLongClickable();
        int inputType = super.getInputType();
        KeyListener keyListenerA = vVar.a(keyListener);
        if (keyListenerA == keyListener) {
            return;
        }
        super.setKeyListener(keyListenerA);
        super.setRawInputType(inputType);
        super.setFocusable(zIsFocusable);
        super.setClickable(zIsClickable);
        super.setLongClickable(zIsLongClickable);
    }

    @Override // android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        m mVar = this.f84785a;
        if (mVar != null) {
            mVar.a();
        }
        n0 n0Var = this.f84786b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final ActionMode.Callback getCustomSelectionActionModeCallback() {
        return android.support.v4.media.session.b.p0(super.getCustomSelectionActionModeCallback());
    }

    @Override // android.widget.TextView, android.view.View
    public InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        ph.a.t(inputConnectionOnCreateInputConnection, editorInfo, this);
        return this.f84787c.c(inputConnectionOnCreateInputConnection);
    }

    @Override // android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.f84785a;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.f84785a;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84786b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84786b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(android.support.v4.media.session.b.q0(callback, this));
    }

    @Override // android.widget.AutoCompleteTextView
    public final void setDropDownBackgroundResource(int i5) {
        setDropDownBackgroundDrawable(z2.b0(getContext(), i5));
    }

    @Override // android.widget.TextView
    public final void setKeyListener(KeyListener keyListener) {
        super.setKeyListener(this.f84787c.a(keyListener));
    }

    @Override // android.widget.TextView
    public final void setTextAppearance(Context context, int i5) {
        super.setTextAppearance(context, i5);
        n0 n0Var = this.f84786b;
        if (n0Var != null) {
            n0Var.e(context, i5);
        }
    }
}
