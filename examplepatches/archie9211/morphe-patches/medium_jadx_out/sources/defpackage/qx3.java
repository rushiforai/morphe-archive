package defpackage;

import android.text.Editable;
import android.text.Selection;
import android.text.Spannable;
import android.text.TextWatcher;
import android.widget.EditText;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qx3 implements TextWatcher {
    public final EditText a;
    public px3 b;
    public boolean c = true;

    public qx3(EditText editText) {
        this.a = editText;
    }

    public static void a(EditText editText, int i) {
        int length;
        if (i == 1 && editText != null && editText.isAttachedToWindow()) {
            Editable editableText = editText.getEditableText();
            int selectionStart = Selection.getSelectionStart(editableText);
            int selectionEnd = Selection.getSelectionEnd(editableText);
            yw3 yw3VarA = yw3.a();
            if (editableText == null) {
                length = 0;
            } else {
                yw3VarA.getClass();
                length = editableText.length();
            }
            yw3VarA.g(0, length, 0, editableText);
            if (selectionStart >= 0 && selectionEnd >= 0) {
                Selection.setSelection(editableText, selectionStart, selectionEnd);
            } else if (selectionStart >= 0) {
                Selection.setSelection(editableText, selectionStart);
            } else if (selectionEnd >= 0) {
                Selection.setSelection(editableText, selectionEnd);
            }
        }
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i, int i2, int i3) throws Throwable {
        EditText editText = this.a;
        if (!editText.isInEditMode() && this.c && yw3.d() && i2 <= i3 && (charSequence instanceof Spannable)) {
            int iC = yw3.a().c();
            if (iC != 0) {
                if (iC == 1) {
                    yw3.a().g(i, i3 + i, 0, (Spannable) charSequence);
                    return;
                } else if (iC != 3) {
                    return;
                }
            }
            yw3 yw3VarA = yw3.a();
            px3 px3Var = this.b;
            if (px3Var == null) {
                px3Var = new px3(editText);
                this.b = px3Var;
            }
            yw3VarA.h(px3Var);
        }
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
    }

    @Override // android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}
