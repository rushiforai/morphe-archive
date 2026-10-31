package r;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.CheckedTextView;
import e10.z2;

/* loaded from: classes2.dex */
public final class o extends CheckedTextView {

    /* renamed from: a, reason: collision with root package name */
    public final h6.l f84828a;

    /* renamed from: b, reason: collision with root package name */
    public final m f84829b;

    /* renamed from: c, reason: collision with root package name */
    public final n0 f84830c;

    /* renamed from: d, reason: collision with root package name */
    public r f84831d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(Context context, AttributeSet attributeSet) {
        int resourceId;
        int resourceId2;
        super(context, attributeSet, 2130968874);
        d2.a(context);
        c2.a(getContext(), this);
        n0 n0Var = new n0(this);
        this.f84830c = n0Var;
        n0Var.d(attributeSet, 2130968874);
        n0Var.b();
        m mVar = new m(this);
        this.f84829b = mVar;
        mVar.d(attributeSet, 2130968874);
        this.f84828a = new h6.l(this);
        Context context2 = getContext();
        int[] iArr = l.a.f72899l;
        x7.u uVarR = x7.u.r(context2, attributeSet, iArr, 2130968874);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        a5.a1.j(this, getContext(), iArr, attributeSet, (TypedArray) uVarR.f95209b, 2130968874);
        try {
            if (typedArray.hasValue(1) && (resourceId2 = typedArray.getResourceId(1, 0)) != 0) {
                try {
                    setCheckMarkDrawable(z2.b0(getContext(), resourceId2));
                } catch (Resources.NotFoundException unused) {
                }
            } else if (typedArray.hasValue(0) && (resourceId = typedArray.getResourceId(0, 0)) != 0) {
                setCheckMarkDrawable(z2.b0(getContext(), resourceId));
            }
            if (typedArray.hasValue(2)) {
                setCheckMarkTintList(uVarR.k(2));
            }
            if (typedArray.hasValue(3)) {
                setCheckMarkTintMode(a1.c(typedArray.getInt(3, -1), null));
            }
            uVarR.s();
            if (this.f84831d == null) {
                this.f84831d = new r(this);
            }
            this.f84831d.b(attributeSet, 2130968874);
        } catch (Throwable th2) {
            uVarR.s();
            throw th2;
        }
    }

    @Override // android.widget.CheckedTextView, android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        n0 n0Var = this.f84830c;
        if (n0Var != null) {
            n0Var.b();
        }
        m mVar = this.f84829b;
        if (mVar != null) {
            mVar.a();
        }
        h6.l lVar = this.f84828a;
        if (lVar != null) {
            lVar.a();
        }
    }

    @Override // android.widget.TextView
    public final ActionMode.Callback getCustomSelectionActionModeCallback() {
        return android.support.v4.media.session.b.p0(super.getCustomSelectionActionModeCallback());
    }

    @Override // android.widget.TextView, android.view.View
    public final InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        ph.a.t(inputConnectionOnCreateInputConnection, editorInfo, this);
        return inputConnectionOnCreateInputConnection;
    }

    @Override // android.widget.TextView
    public final void setAllCaps(boolean z11) {
        super.setAllCaps(z11);
        if (this.f84831d == null) {
            this.f84831d = new r(this);
        }
        this.f84831d.c(z11);
    }

    @Override // android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.f84829b;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.f84829b;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.CheckedTextView
    public final void setCheckMarkDrawable(Drawable drawable) {
        super.setCheckMarkDrawable(drawable);
        h6.l lVar = this.f84828a;
        if (lVar != null) {
            if (lVar.f59405c) {
                lVar.f59405c = false;
            } else {
                lVar.f59405c = true;
                lVar.a();
            }
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84830c;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84830c;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(android.support.v4.media.session.b.q0(callback, this));
    }

    @Override // android.widget.TextView
    public final void setTextAppearance(Context context, int i5) {
        super.setTextAppearance(context, i5);
        n0 n0Var = this.f84830c;
        if (n0Var != null) {
            n0Var.e(context, i5);
        }
    }

    @Override // android.widget.CheckedTextView
    public final void setCheckMarkDrawable(int i5) {
        setCheckMarkDrawable(z2.b0(getContext(), i5));
    }
}
