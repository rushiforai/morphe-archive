package androidx.preference;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

/* loaded from: classes2.dex */
public class EditTextPreferenceDialogFragmentCompat extends PreferenceDialogFragmentCompat {

    /* renamed from: i, reason: collision with root package name */
    public EditText f14749i;

    /* renamed from: j, reason: collision with root package name */
    public CharSequence f14750j;

    @Override // androidx.preference.PreferenceDialogFragmentCompat, androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            this.f14750j = ((EditTextPreference) o()).f14746m;
        } else {
            this.f14750j = bundle.getCharSequence("EditTextPreferenceDialogFragment.text");
        }
    }

    @Override // androidx.preference.PreferenceDialogFragmentCompat, androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putCharSequence("EditTextPreferenceDialogFragment.text", this.f14750j);
    }

    @Override // androidx.preference.PreferenceDialogFragmentCompat
    public final void p(View view) {
        super.p(view);
        EditText editText = (EditText) view.findViewById(16908291);
        this.f14749i = editText;
        if (editText == null) {
            throw new IllegalStateException("Dialog view must contain an EditText with id @android:id/edit");
        }
        editText.requestFocus();
        this.f14749i.setText(this.f14750j);
        EditText editText2 = this.f14749i;
        editText2.setSelection(editText2.getText().length());
        ((EditTextPreference) o()).getClass();
    }

    @Override // androidx.preference.PreferenceDialogFragmentCompat
    public final void q(boolean z11) {
        if (z11) {
            String string = this.f14749i.getText().toString();
            EditTextPreference editTextPreference = (EditTextPreference) o();
            editTextPreference.getClass();
            editTextPreference.l(string);
        }
    }
}
