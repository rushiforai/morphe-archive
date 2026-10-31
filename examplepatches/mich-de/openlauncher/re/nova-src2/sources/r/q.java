package r;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
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

/* loaded from: classes2.dex */
public class q extends EditText implements a5.b0 {

    /* renamed from: a, reason: collision with root package name */
    public final m f84841a;

    /* renamed from: b, reason: collision with root package name */
    public final n0 f84842b;

    /* renamed from: c, reason: collision with root package name */
    public final i0 f84843c;

    /* renamed from: d, reason: collision with root package name */
    public final e5.g f84844d;

    /* renamed from: e, reason: collision with root package name */
    public final v f84845e;

    /* renamed from: f, reason: collision with root package name */
    public q.c f84846f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        d2.a(context);
        c2.a(getContext(), this);
        m mVar = new m(this);
        this.f84841a = mVar;
        mVar.d(attributeSet, i5);
        n0 n0Var = new n0(this);
        this.f84842b = n0Var;
        n0Var.d(attributeSet, i5);
        n0Var.b();
        i0 i0Var = new i0();
        i0Var.f84744a = this;
        this.f84843c = i0Var;
        this.f84844d = new e5.g();
        v vVar = new v(this);
        this.f84845e = vVar;
        vVar.b(attributeSet, i5);
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

    @Override // a5.b0
    public final a5.h a(a5.h hVar) {
        this.f84844d.getClass();
        return e5.g.a(this, hVar);
    }

    @Override // android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        m mVar = this.f84841a;
        if (mVar != null) {
            mVar.a();
        }
        n0 n0Var = this.f84842b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final ActionMode.Callback getCustomSelectionActionModeCallback() {
        return android.support.v4.media.session.b.p0(super.getCustomSelectionActionModeCallback());
    }

    @Override // android.widget.TextView
    public final TextClassifier getTextClassifier() {
        i0 i0Var;
        if (Build.VERSION.SDK_INT < 28 && (i0Var = this.f84843c) != null) {
            TextClassifier textClassifier = i0Var.f84745b;
            return textClassifier == null ? h0.a(i0Var.f84744a) : textClassifier;
        }
        if (this.f84846f == null) {
            this.f84846f = new q.c(this, 8);
        }
        return super.getTextClassifier();
    }

    @Override // android.widget.TextView, android.view.View
    public InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        String[] strArrE;
        InputConnection inputConnectionOnCreateInputConnection = super.onCreateInputConnection(editorInfo);
        this.f84842b.getClass();
        int i5 = Build.VERSION.SDK_INT;
        if (i5 < 30 && inputConnectionOnCreateInputConnection != null) {
            t2.c.M(editorInfo, getText());
        }
        ph.a.t(inputConnectionOnCreateInputConnection, editorInfo, this);
        if (inputConnectionOnCreateInputConnection != null && i5 <= 30 && (strArrE = a5.a1.e(this)) != null) {
            editorInfo.contentMimeTypes = strArrE;
            inputConnectionOnCreateInputConnection = new c5.b(inputConnectionOnCreateInputConnection, new ae.i(this, 7));
        }
        return this.f84845e.c(inputConnectionOnCreateInputConnection);
    }

    @Override // android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        int i5 = Build.VERSION.SDK_INT;
        if (i5 < 30 || i5 >= 33) {
            return;
        }
        ((InputMethodManager) getContext().getSystemService("input_method")).isActive(this);
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean onDragEvent(DragEvent dragEvent) {
        Activity activity;
        boolean zA = false;
        if (Build.VERSION.SDK_INT < 31 && dragEvent.getLocalState() == null && a5.a1.e(this) != null) {
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
                zA = y.a(dragEvent, this, activity);
            }
        }
        if (zA) {
            return true;
        }
        return super.onDragEvent(dragEvent);
    }

    @Override // android.widget.EditText, android.widget.TextView
    public final boolean onTextContextMenuItem(int i5) {
        a5.e dVar;
        int i11 = Build.VERSION.SDK_INT;
        if (i11 >= 31 || a5.a1.e(this) == null || !(i5 == 16908322 || i5 == 16908337)) {
            return super.onTextContextMenuItem(i5);
        }
        ClipboardManager clipboardManager = (ClipboardManager) getContext().getSystemService("clipboard");
        ClipData primaryClip = clipboardManager == null ? null : clipboardManager.getPrimaryClip();
        if (primaryClip != null && primaryClip.getItemCount() > 0) {
            if (i11 >= 31) {
                dVar = new a5.d(primaryClip, 1);
            } else {
                a5.f fVar = new a5.f();
                fVar.f279b = primaryClip;
                fVar.f280c = 1;
                dVar = fVar;
            }
            dVar.v(i5 == 16908322 ? 0 : 1);
            a5.a1.g(this, dVar.build());
        }
        return true;
    }

    @Override // android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.f84841a;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.f84841a;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84842b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        n0 n0Var = this.f84842b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(android.support.v4.media.session.b.q0(callback, this));
    }

    @Override // android.widget.TextView
    public final void setKeyListener(KeyListener keyListener) {
        super.setKeyListener(this.f84845e.a(keyListener));
    }

    @Override // android.widget.TextView
    public final void setTextAppearance(Context context, int i5) {
        super.setTextAppearance(context, i5);
        n0 n0Var = this.f84842b;
        if (n0Var != null) {
            n0Var.e(context, i5);
        }
    }

    @Override // android.widget.TextView
    public final void setTextClassifier(TextClassifier textClassifier) {
        i0 i0Var;
        if (Build.VERSION.SDK_INT < 28 && (i0Var = this.f84843c) != null) {
            i0Var.f84745b = textClassifier;
            return;
        }
        if (this.f84846f == null) {
            this.f84846f = new q.c(this, 8);
        }
        super.setTextClassifier(textClassifier);
    }

    @Override // android.widget.EditText, android.widget.TextView
    public final Editable getText() {
        return Build.VERSION.SDK_INT >= 28 ? super.getText() : super.getEditableText();
    }
}
