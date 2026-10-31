package androidx.preference;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

@Deprecated
/* loaded from: classes2.dex */
public class EditTextPreferenceDialogFragment extends PreferenceDialogFragment {

    /* renamed from: i, reason: collision with root package name */
    public EditText f14747i;

    /* renamed from: j, reason: collision with root package name */
    public CharSequence f14748j;

    @Deprecated
    public EditTextPreferenceDialogFragment() {
    }

    @Override // androidx.preference.PreferenceDialogFragment
    public final void b(View view) {
        super.b(view);
        EditText editText = (EditText) view.findViewById(16908291);
        this.f14747i = editText;
        editText.requestFocus();
        EditText editText2 = this.f14747i;
        if (editText2 == null) {
            throw new IllegalStateException("Dialog view must contain an EditText with id @android:id/edit");
        }
        editText2.setText(this.f14748j);
        EditText editText3 = this.f14747i;
        editText3.setSelection(editText3.getText().length());
    }

    @Override // androidx.preference.PreferenceDialogFragment
    public final void c(boolean z11) {
        if (z11) {
            String string = this.f14747i.getText().toString();
            ((EditTextPreference) a()).getClass();
            ((EditTextPreference) a()).l(string);
        }
    }

    @Override // androidx.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            this.f14748j = ((EditTextPreference) a()).f14746m;
        } else {
            this.f14748j = bundle.getCharSequence("EditTextPreferenceDialogFragment.text");
        }
    }

    @Override // androidx.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putCharSequence("EditTextPreferenceDialogFragment.text", this.f14748j);
    }
}
