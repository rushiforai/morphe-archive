package defpackage;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.Editable;
import android.text.method.KeyListener;
import android.text.method.NumberKeyListener;
import android.util.AttributeSet;
import android.util.Log;
import android.view.ActionMode;
import android.view.DragEvent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.view.textclassifier.TextClassifier;
import android.widget.EditText;
import android.widget.TextView;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l20 extends EditText implements hr8, lmd {
    public final e8 a;
    public final n30 b;
    public final lig c;
    public final tkd d;
    public final s26 e;
    public k20 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l20(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, R.attr.editTextStyle);
        imd.a(context);
        wkd.a(this, getContext());
        e8 e8Var = new e8(this);
        this.a = e8Var;
        e8Var.k(attributeSet, R.attr.editTextStyle);
        n30 n30Var = new n30(this);
        this.b = n30Var;
        n30Var.f(attributeSet, R.attr.editTextStyle);
        n30Var.b();
        lig ligVar = new lig(8);
        ligVar.b = this;
        this.c = ligVar;
        this.d = new tkd();
        s26 s26Var = new s26(this, 8);
        this.e = s26Var;
        s26Var.o0(attributeSet, R.attr.editTextStyle);
        KeyListener keyListener = getKeyListener();
        if (keyListener instanceof NumberKeyListener) {
            return;
        }
        boolean zIsFocusable = isFocusable();
        boolean zIsClickable = isClickable();
        boolean zIsLongClickable = isLongClickable();
        int inputType = getInputType();
        KeyListener keyListenerK0 = s26Var.k0(keyListener);
        if (keyListenerK0 == keyListener) {
            return;
        }
        super.setKeyListener(keyListenerK0);
        setRawInputType(inputType);
        setFocusable(zIsFocusable);
        setClickable(zIsClickable);
        setLongClickable(zIsLongClickable);
    }

    private k20 getSuperCaller() {
        k20 k20Var = this.f;
        if (k20Var != null) {
            return k20Var;
        }
        k20 k20Var2 = new k20(this);
        this.f = k20Var2;
        return k20Var2;
    }

    @Override // defpackage.hr8
    public final p82 a(p82 p82Var) {
        this.d.getClass();
        return tkd.a(this, p82Var);
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

    @Override // android.widget.EditText, android.widget.TextView
    public Editable getText() {
        return Build.VERSION.SDK_INT >= 28 ? super.getText() : getEditableText();
    }

    @Override // android.widget.TextView
    public TextClassifier getTextClassifier() {
        lig ligVar;
        if (Build.VERSION.SDK_INT >= 28 || (ligVar = this.c) == null) {
            return super.getTextClassifier();
        }
        TextClassifier textClassifier = (TextClassifier) ligVar.c;
        return textClassifier == null ? g30.a((TextView) ligVar.b) : textClassifier;
    }

    @Override // android.widget.TextView, android.view.View
    public final InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        String[] strArrH;
        InputConnection o26Var;
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        this.b.getClass();
        int i = Build.VERSION.SDK_INT;
        if (i < 30 && inputConnectionOnCreateInputConnection != null) {
            ev3.c(editorInfo, getText());
        }
        flb.o0(inputConnectionOnCreateInputConnection, editorInfo, this);
        if (inputConnectionOnCreateInputConnection != null && i <= 30 && (strArrH = ute.h(this)) != null) {
            ev3.b(editorInfo, strArrH);
            f70 f70Var = new f70(23, this);
            if (i >= 25) {
                o26Var = new n26(inputConnectionOnCreateInputConnection, f70Var);
            } else if (ev3.a(editorInfo).length != 0) {
                o26Var = new o26(inputConnectionOnCreateInputConnection, f70Var);
            }
            inputConnectionOnCreateInputConnection = o26Var;
        }
        return this.e.p0(inputConnectionOnCreateInputConnection, editorInfo);
    }

    @Override // android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        int i = Build.VERSION.SDK_INT;
        if (i < 30 || i >= 33) {
            return;
        }
        ((InputMethodManager) getContext().getSystemService("input_method")).isActive(this);
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean onDragEvent(DragEvent dragEvent) {
        Activity activity;
        int i = Build.VERSION.SDK_INT;
        boolean zA = false;
        if (i < 31 && i >= 24 && dragEvent.getLocalState() == null && ute.h(this) != null) {
            Context context = getContext();
            while (true) {
                if (!(context instanceof ContextWrapper)) {
                    activity = null;
                    break;
                }
                if (context instanceof Activity) {
                    activity = (Activity) context;
                    break;
                }
                context = ((ContextWrapper) context).getBaseContext();
            }
            if (activity == null) {
                Log.i("ReceiveContent", "Can't handle drop: no activity: view=" + this);
            } else if (dragEvent.getAction() != 1 && dragEvent.getAction() == 3) {
                zA = s20.a(dragEvent, this, activity);
            }
        }
        if (zA) {
            return true;
        }
        return super.onDragEvent(dragEvent);
    }

    @Override // android.widget.EditText, android.widget.TextView
    public final boolean onTextContextMenuItem(int i) {
        m82 l82Var;
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 31 || ute.h(this) == null || !(i == 16908322 || i == 16908337)) {
            return super.onTextContextMenuItem(i);
        }
        ClipboardManager clipboardManager = (ClipboardManager) getContext().getSystemService("clipboard");
        ClipData primaryClip = clipboardManager == null ? null : clipboardManager.getPrimaryClip();
        if (primaryClip != null && primaryClip.getItemCount() > 0) {
            if (i2 >= 31) {
                l82Var = new l82(primaryClip, 1);
            } else {
                n82 n82Var = new n82();
                n82Var.b = primaryClip;
                n82Var.c = 1;
                l82Var = n82Var;
            }
            l82Var.c(i == 16908322 ? 0 : 1);
            ute.k(this, l82Var.build());
        }
        return true;
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

    public void setEmojiCompatEnabled(boolean z) {
        this.e.v0(z);
    }

    @Override // android.widget.TextView
    public void setKeyListener(KeyListener keyListener) {
        super.setKeyListener(this.e.k0(keyListener));
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

    @Override // android.widget.TextView
    public void setTextClassifier(TextClassifier textClassifier) {
        lig ligVar;
        if (Build.VERSION.SDK_INT >= 28 || (ligVar = this.c) == null) {
            super.setTextClassifier(textClassifier);
        } else {
            ligVar.c = textClassifier;
        }
    }
}
