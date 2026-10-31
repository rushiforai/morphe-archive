package androidx.preference;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import n80.b;

@Deprecated
/* loaded from: classes2.dex */
public class ListPreferenceDialogFragment extends PreferenceDialogFragment {

    /* renamed from: i, reason: collision with root package name */
    public int f14754i;

    /* renamed from: j, reason: collision with root package name */
    public CharSequence[] f14755j;

    /* renamed from: k, reason: collision with root package name */
    public CharSequence[] f14756k;

    @Deprecated
    public ListPreferenceDialogFragment() {
    }

    @Override // androidx.preference.PreferenceDialogFragment
    public final void c(boolean z11) {
        int i5;
        ListPreference listPreference = (ListPreference) a();
        if (!z11 || (i5 = this.f14754i) < 0) {
            return;
        }
        String string = this.f14756k[i5].toString();
        listPreference.getClass();
        listPreference.m(string);
    }

    @Override // androidx.preference.PreferenceDialogFragment
    public final void d(AlertDialog.Builder builder) {
        builder.setSingleChoiceItems(this.f14755j, this.f14754i, new b(this, 2));
        builder.setPositiveButton((CharSequence) null, (DialogInterface.OnClickListener) null);
    }

    @Override // androidx.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.f14754i = bundle.getInt("ListPreferenceDialogFragment.index", 0);
            this.f14755j = bundle.getCharSequenceArray("ListPreferenceDialogFragment.entries");
            this.f14756k = bundle.getCharSequenceArray("ListPreferenceDialogFragment.entryValues");
            return;
        }
        ListPreference listPreference = (ListPreference) a();
        CharSequence[] charSequenceArr = listPreference.f14751m;
        CharSequence[] charSequenceArr2 = listPreference.n;
        if (charSequenceArr == null || charSequenceArr2 == null) {
            throw new IllegalStateException("ListPreference requires an entries array and an entryValues array.");
        }
        this.f14754i = listPreference.l(listPreference.o);
        this.f14755j = listPreference.f14751m;
        this.f14756k = charSequenceArr2;
    }

    @Override // androidx.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt("ListPreferenceDialogFragment.index", this.f14754i);
        bundle.putCharSequenceArray("ListPreferenceDialogFragment.entries", this.f14755j);
        bundle.putCharSequenceArray("ListPreferenceDialogFragment.entryValues", this.f14756k);
    }
}
