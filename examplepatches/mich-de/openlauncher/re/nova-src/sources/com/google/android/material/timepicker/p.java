package com.google.android.material.timepicker;

import android.text.Editable;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

/* loaded from: classes3.dex */
public final class p implements TextView.OnEditorActionListener, View.OnKeyListener {

    /* renamed from: a, reason: collision with root package name */
    public final ChipTextInputComboView f34509a;

    /* renamed from: b, reason: collision with root package name */
    public final ChipTextInputComboView f34510b;

    /* renamed from: c, reason: collision with root package name */
    public final TimeModel f34511c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f34512d = false;

    public p(ChipTextInputComboView chipTextInputComboView, ChipTextInputComboView chipTextInputComboView2, TimeModel timeModel) {
        this.f34509a = chipTextInputComboView;
        this.f34510b = chipTextInputComboView2;
        this.f34511c = timeModel;
    }

    public final void a(int i5) {
        this.f34510b.setChecked(i5 == 12);
        this.f34509a.setChecked(i5 == 10);
        this.f34511c.f34473f = i5;
    }

    @Override // android.widget.TextView.OnEditorActionListener
    public final boolean onEditorAction(TextView textView, int i5, KeyEvent keyEvent) {
        boolean z11 = i5 == 5;
        if (z11) {
            a(12);
        }
        return z11;
    }

    @Override // android.view.View.OnKeyListener
    public final boolean onKey(View view, int i5, KeyEvent keyEvent) {
        if (this.f34512d) {
            return false;
        }
        boolean z11 = true;
        this.f34512d = true;
        EditText editText = (EditText) view;
        if (this.f34511c.f34473f != 12) {
            Editable text = editText.getText();
            if (text == null) {
                z11 = false;
            } else if (i5 >= 7 && i5 <= 16 && keyEvent.getAction() == 1 && editText.getSelectionStart() == 2 && text.length() == 2) {
                a(12);
            } else {
                if (editText.getSelectionStart() == 0 && editText.length() == 2) {
                    editText.getText().clear();
                }
                z11 = false;
            }
        } else if (i5 == 67 && keyEvent.getAction() == 0 && TextUtils.isEmpty(editText.getText())) {
            a(10);
        } else {
            if (editText.getSelectionStart() == 0 && editText.length() == 2) {
                editText.getText().clear();
            }
            z11 = false;
        }
        this.f34512d = false;
        return z11;
    }
}
