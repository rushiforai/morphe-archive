package fk;

import a5.a1;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;
import com.google.android.material.textfield.TextInputLayout;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final class w implements TextWatcher {

    /* renamed from: a, reason: collision with root package name */
    public int f55278a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ EditText f55279b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ TextInputLayout f55280c;

    public w(TextInputLayout textInputLayout, EditText editText) {
        this.f55280c = textInputLayout;
        this.f55279b = editText;
        this.f55278a = editText.getLineCount();
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
        TextInputLayout textInputLayout = this.f55280c;
        textInputLayout.D(!textInputLayout.f34412z0, false);
        if (textInputLayout.f34383k) {
            textInputLayout.w(editable);
        }
        if (textInputLayout.f34397s) {
            textInputLayout.n.getClass();
            if ((editable != null ? editable.length() : 0) != 0 || textInputLayout.f34400t0) {
                textInputLayout.i();
            } else {
                textInputLayout.v();
            }
        }
        EditText editText = this.f55279b;
        int lineCount = editText.getLineCount();
        int i5 = this.f55278a;
        if (lineCount != i5) {
            if (lineCount < i5) {
                WeakHashMap weakHashMap = a1.f250a;
                int minimumHeight = editText.getMinimumHeight();
                int i11 = textInputLayout.f34398s0;
                if (minimumHeight != i11) {
                    editText.setMinimumHeight(i11);
                }
            }
            this.f55278a = lineCount;
        }
    }

    @Override // android.text.TextWatcher
    public final void beforeTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
    }

    @Override // android.text.TextWatcher
    public final void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
    }
}
