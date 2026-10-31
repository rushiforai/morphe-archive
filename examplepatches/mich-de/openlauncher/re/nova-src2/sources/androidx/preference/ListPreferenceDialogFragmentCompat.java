package androidx.preference;

import android.os.Bundle;
import m.g;
import m.j;
import n80.b;

/* loaded from: classes2.dex */
public class ListPreferenceDialogFragmentCompat extends PreferenceDialogFragmentCompat {

    /* renamed from: i, reason: collision with root package name */
    public int f14757i;

    /* renamed from: j, reason: collision with root package name */
    public CharSequence[] f14758j;

    /* renamed from: k, reason: collision with root package name */
    public CharSequence[] f14759k;

    @Override // androidx.preference.PreferenceDialogFragmentCompat, androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.f14757i = bundle.getInt("ListPreferenceDialogFragment.index", 0);
            this.f14758j = bundle.getCharSequenceArray("ListPreferenceDialogFragment.entries");
            this.f14759k = bundle.getCharSequenceArray("ListPreferenceDialogFragment.entryValues");
            return;
        }
        ListPreference listPreference = (ListPreference) o();
        CharSequence[] charSequenceArr = listPreference.f14751m;
        CharSequence[] charSequenceArr2 = listPreference.n;
        if (charSequenceArr == null || charSequenceArr2 == null) {
            throw new IllegalStateException("ListPreference requires an entries array and an entryValues array.");
        }
        this.f14757i = listPreference.l(listPreference.o);
        this.f14758j = listPreference.f14751m;
        this.f14759k = charSequenceArr2;
    }

    @Override // androidx.preference.PreferenceDialogFragmentCompat, androidx.fragment.app.DialogFragment, androidx.fragment.app.h0
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt("ListPreferenceDialogFragment.index", this.f14757i);
        bundle.putCharSequenceArray("ListPreferenceDialogFragment.entries", this.f14758j);
        bundle.putCharSequenceArray("ListPreferenceDialogFragment.entryValues", this.f14759k);
    }

    @Override // androidx.preference.PreferenceDialogFragmentCompat
    public final void q(boolean z11) {
        int i5;
        if (!z11 || (i5 = this.f14757i) < 0) {
            return;
        }
        String string = this.f14759k[i5].toString();
        ListPreference listPreference = (ListPreference) o();
        listPreference.getClass();
        listPreference.m(string);
    }

    @Override // androidx.preference.PreferenceDialogFragmentCompat
    public final void r(j jVar) {
        CharSequence[] charSequenceArr = this.f14758j;
        int i5 = this.f14757i;
        b bVar = new b(this, 3);
        g gVar = jVar.f75297a;
        gVar.n = charSequenceArr;
        gVar.f75257p = bVar;
        gVar.f75262u = i5;
        gVar.f75261t = true;
        gVar.f75250g = null;
        gVar.f75251h = null;
    }
}
